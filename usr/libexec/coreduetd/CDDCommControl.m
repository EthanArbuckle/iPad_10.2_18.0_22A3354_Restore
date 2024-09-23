@implementation CDDCommControl

- (CDDCommControl)initWithCommInstance:(id)a3
{
  id v4;
  CDDCommControl *v5;
  CDDCommControl *v6;
  id v7;
  void *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *commQueue;
  uint64_t v13;
  NSMutableDictionary *identifierCache;
  uint64_t v15;
  NSMutableSet *registeredDevices;
  uint64_t v17;
  NSMutableDictionary *sentRequestedTimestamps;
  NSMutableDictionary *v19;
  NSMutableDictionary *exchangeRecords;
  NSDate *lastForecastSent;
  NSObject *v22;
  NSObject *v23;
  CDDCommControl *v24;
  CDDCommControl *v25;
  _QWORD v27[4];
  CDDCommControl *v28;
  int out_token;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDDCommControl;
  v5 = -[CDDCommControl init](&v30, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->comm, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cdd"));
    objc_storeWeak((id *)&v6->cdd, v8);

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.coreduetdCommQueue", v10);
    commQueue = v6->commQueue;
    v6->commQueue = (OS_dispatch_queue *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifierCache = v6->identifierCache;
    v6->identifierCache = (NSMutableDictionary *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    registeredDevices = v6->registeredDevices;
    v6->registeredDevices = (NSMutableSet *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sentRequestedTimestamps = v6->sentRequestedTimestamps;
    v6->sentRequestedTimestamps = (NSMutableDictionary *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    exchangeRecords = v6->exchangeRecords;
    v6->exchangeRecords = v19;

    lastForecastSent = v6->lastForecastSent;
    v6->lastForecastSent = 0;

    if (notify_register_check("com.apple.coreduetd.systemConditionNotification", &v6->_conditionsChangedToken))
    {
      v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100022C88(v22);

    }
    -[CDDCommControl loadSavedDateIfExist](v6, "loadSavedDateIfExist");
    out_token = 0;
    v23 = v6->commQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000F508;
    v27[3] = &unk_100038C38;
    v24 = v6;
    v28 = v24;
    notify_register_dispatch("com.apple.coreduetd.communication.triggerSync", &out_token, v23, v27);
    v25 = v24;

  }
  return v6;
}

- (void)dealloc
{
  int nearbyDevicesNotifyToken;
  int conditionsChangedToken;
  objc_super v5;

  nearbyDevicesNotifyToken = self->nearbyDevicesNotifyToken;
  if (nearbyDevicesNotifyToken)
    notify_cancel(nearbyDevicesNotifyToken);
  conditionsChangedToken = self->_conditionsChangedToken;
  if (conditionsChangedToken)
    notify_cancel(conditionsChangedToken);
  v5.receiver = self;
  v5.super_class = (Class)CDDCommControl;
  -[CDDCommControl dealloc](&v5, "dealloc");
}

- (void)loadSavedDateIfExist
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate **p_lastForecastSent;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _QWORD v18[5];
  uint8_t buf[4];
  double v20;

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v3, "synchronize");
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100022CC8(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("deviceExchangeTime")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("deviceExchangeRecord")));
  v7 = v6;
  if (v6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000F9D4;
    v18[3] = &unk_100038C60;
    v18[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
  }
  if (!v5)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v15 = "no known last exchange time";
      v16 = v14;
      v17 = 2;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  p_lastForecastSent = &self->lastForecastSent;
  objc_storeStrong((id *)&self->lastForecastSent, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl cdd](self, "cdd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "config"));
  v11 = objc_msgSend(v10, "verbose");

  if (v11)
  {
    -[NSDate timeIntervalSinceNow](*p_lastForecastSent, "timeIntervalSinceNow");
    v13 = v12;
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v13 / -86400.0;
      v15 = "last device exchange time was %0.2f days ago";
      v16 = v14;
      v17 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)saveLastDate
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->lastForecastSent)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
    objc_msgSend(v3, "setObject:forKey:", self->lastForecastSent, CFSTR("deviceExchangeTime"));
    objc_msgSend(v3, "setObject:forKey:", self->exchangeRecords, CFSTR("deviceExchangeRecord"));
    objc_msgSend(v3, "synchronize");
    v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Last date did synchronize.", v5, 2u);
    }

  }
}

- (void)setupIDSLink
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  IDSService *v8;
  IDSService *service;
  NSObject *v10;
  IDSService *v11;
  id v12;
  OS_dispatch_queue *commQueue;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  __int128 buf;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  v5 = objc_msgSend(v4, "commEnabled");

  v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: enabled.", (uint8_t *)&buf, 2u);
    }

    v8 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.coreduet"));
    service = self->_service;
    self->_service = v8;

    if (self->_service)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_service;
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: setup with service %p.", (uint8_t *)&buf, 0xCu);
      }

      v12 = objc_loadWeakRetained((id *)&self->comm);
      objc_msgSend(v12, "setInitialized:", 1);

      commQueue = self->commQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000FDF8;
      v18[3] = &unk_100038A70;
      v18[4] = self;
      v14 = v18;
      v15 = commQueue;
      v16 = (void *)os_transaction_create("cd_dispatch_async_tx");
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v20 = sub_100013498;
      v21 = &unk_100038A98;
      v22 = v16;
      v23 = v14;
      v17 = v16;
      dispatch_async(v15, &buf);

      -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->commQueue);
      notify_register_check("com.apple.coreduetd.nearbydeviceschanged", &self->nearbyDevicesNotifyToken);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: not enabled.", (uint8_t *)&buf, 2u);
    }

  }
}

- (void)setupPairedSyncClient
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  v5 = objc_msgSend(v4, "commEnabled");

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting up pairedSync client", (uint8_t *)v10, 2u);
    }

    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v7 = (void *)qword_100040EA0;
    v14 = qword_100040EA0;
    if (!qword_100040EA0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000134A4;
      v10[3] = &unk_100038BF8;
      v10[4] = &v11;
      sub_1000134A4((uint64_t)v10);
      v7 = (void *)v12[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v11, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.coreduet")));
    objc_msgSend(v9, "setDelegate:queue:", self, self->commQueue);

  }
}

- (void)syncCoordinatorDidReceiveStartSyncCommand:(id)a3
{
  id v4;
  NSObject *v5;
  CDDCommunicator **p_comm;
  id WeakRetained;
  id v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received pairedSync sync start notification", v9, 2u);
  }

  p_comm = &self->comm;
  WeakRetained = objc_loadWeakRetained((id *)p_comm);
  objc_msgSend(WeakRetained, "syncStateWithActiveRemote");

  v8 = objc_loadWeakRetained((id *)p_comm);
  objc_msgSend(v8, "requestRemoteDeviceSync");

  objc_msgSend(v4, "syncDidComplete");
}

- (void)checkForecastSync
{
  OS_dispatch_queue *commQueue;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  id v10;

  commQueue = self->commQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010128;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v3 = v7;
  v4 = commQueue;
  v5 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013498;
  block[3] = &unk_100038A98;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  dispatch_async(v4, block);

}

- (void)updateOutgoingVersionNumberAndSyncState:(unint64_t)a3 forIncomingSupportedVersions:(id)a4
{
  CDDCommunicator **p_comm;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  p_comm = &self->comm;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_comm);
  v7 = objc_msgSend(WeakRetained, "localMaxSupportedVersionNumber");

  v8 = objc_loadWeakRetained((id *)p_comm);
  v9 = objc_msgSend(v8, "remoteVersionNumber");

  v10 = objc_loadWeakRetained((id *)p_comm);
  v11 = objc_msgSend(v10, "getOutgoingVersionForIncomingVersions:", v5);

  v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 == v11)
  {
    if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: VersionMismatch: Current outgoing versionis supported by remote device, not resetting the version number", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    if (v13)
    {
      v15 = 134218496;
      v16 = v7;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: VersionMismatch: localMaxSupportedVersionNumber = %llu,currentoutgoingVersionNumber = %llu updating outgoingVersionNumber to %llu", (uint8_t *)&v15, 0x20u);
    }

    v14 = objc_loadWeakRetained((id *)p_comm);
    objc_msgSend(v14, "setRemoteVersionNumber:", v11);

    v12 = objc_loadWeakRetained((id *)p_comm);
    -[NSObject triggerSystemDataExchange:wakeRemote:](v12, "triggerSystemDataExchange:wakeRemote:", 1, 0);
  }

}

- (void)receiveData:(id)a3 context:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  id WeakRetained;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  unsigned int v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  IDSService *service;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  unsigned int v66;
  _BOOL4 v67;
  id v68;
  id v69;
  void *v70;
  NSObject *v71;
  id v72;
  id v73;
  const char *v74;
  NSObject *v75;
  os_log_type_t v76;
  NSObject *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  NSObject *v83;
  unsigned __int8 logb;
  NSObject *log;
  NSObject *loga;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  _QWORD v103[5];
  id v104;
  id v105;
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  uint8_t buf[4];
  id v113;
  __int16 v114;
  unint64_t v115;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v99 = v9;
  v100 = v8;
  v98 = v10;
  if (!v10)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "CDDCommunicator: receivedData: missing device.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    }
LABEL_10:

    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v19 = 0;
    goto LABEL_23;
  }
  v11 = v10;
  v12 = objc_claimAutoreleasedReturnValue(-[CDDCommControl deviceDescriptionFromDevice:](self, "deviceDescriptionFromDevice:", v10));
  if (!v12)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "CDDCommunicator: receivedData: missing device data.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v13 = (void *)v12;
  -[CDDCommControl checkForecastSync](self, "checkForecastSync");
  v14 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
  {
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_1000113F0;
    v103[3] = &unk_100038C88;
    v103[4] = self;
    v104 = v9;
    v105 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v103);

    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = v13;
LABEL_22:
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    goto LABEL_23;
  }
  v27 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v27) & 1) == 0)
  {
    v19 = v13;
    v38 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: invalid message type.", buf, 2u);
    }

    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_22;
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "incomingResponseIdentifier"));
  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outgoingResponseIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", &off_10003B1B8));
  v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", &off_10003B1D0));
  v28 = objc_msgSend(v23, "unsignedIntValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->comm);
  v30 = objc_msgSend(WeakRetained, "remoteVersionNumber");

  if (v30 != (id)v28)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v113 = v30;
      v114 = 2048;
      v115 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: VersionMismatch. OutgoingVersionNumber = %llu IncomingVersionNumber = %llu", buf, 0x16u);
    }

    -[CDDCommControl updateOutgoingVersionNumberAndSyncState:forIncomingSupportedVersions:](self, "updateOutgoingVersionNumberAndSyncState:forIncomingSupportedVersions:", v28, v97);
  }
  v32 = objc_loadWeakRetained((id *)&self->comm);
  v33 = objc_msgSend(v32, "localMaxSupportedVersionNumber");

  v94 = v23;
  if ((unint64_t)v33 > v28)
  {
    v34 = objc_loadWeakRetained((id *)&self->comm);
    v35 = objc_msgSend(v34, "isConversionRequiredForMessage:fromVersion:toVersion:", v8, v28, v33);

    if (v35)
    {
      v36 = objc_loadWeakRetained((id *)&self->comm);
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "convertMessage:fromVersion:toVersion:", v8, v28, v33));

      v8 = (id)v37;
    }
LABEL_33:
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", &off_10003B1E8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", &off_10003B200));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", &off_10003B218));
    v100 = v8;
    switch(objc_msgSend(v40, "intValue"))
    {
      case 0u:
      case 1u:
      case 7u:
        v48 = objc_loadWeakRetained((id *)&self->comm);
        objc_msgSend(v48, "receiveSystemData:device:", v18, v13);

        v49 = objc_loadWeakRetained((id *)&self->cdd);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "watchUpdate"));
        v92 = v18;
        objc_msgSend(v50, "receiveWatchfaceInfo:device:", v18, v13);

        v51 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
          v53 = objc_msgSend(v52, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: received system data from %s.", buf, 0xCu);

        }
        v19 = v13;
        v22 = v40;

        v25 = v95;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->sentRequestedTimestamps, "objectForKey:", v95));

        if (v54)
          -[NSMutableDictionary removeObjectForKey:](self->sentRequestedTimestamps, "removeObjectForKey:", v95);
        ADClientAddValueForScalarKey(CFSTR("com.apple.Duet.Exchanges"), 1);
        goto LABEL_39;
      case 3u:
        v60 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
          v62 = objc_msgSend(v61, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v62;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received forecast data from %s.", buf, 0xCu);

        }
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->sentRequestedTimestamps, "objectForKey:", v95));

        v64 = objc_loadWeakRetained((id *)&self->comm);
        if (v63)
        {
          v65 = v64;
          objc_msgSend(v64, "receiveRequestedForecast:paramDict:transactionId:device:", v18, v17, objc_msgSend(v95, "hash"), v13);

          -[NSMutableDictionary removeObjectForKey:](self->sentRequestedTimestamps, "removeObjectForKey:", v95);
          v15 = 0;
          v16 = 0;
          v25 = v95;
          v24 = (void *)v96;
          v23 = v94;
          goto LABEL_53;
        }
        v80 = v64;
        objc_msgSend(v64, "receiveForecast:paramDict:device:", v18, v17, v13);

        v81 = objc_loadWeakRetained((id *)&self->comm);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "getAckMessage"));

        v108[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
        v108[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
        v109[0] = v96;
        v109[1] = &__kCFBooleanFalse;
        v108[2] = IDSSendMessageOptionBypassDuetKey;
        v109[2] = &__kCFBooleanTrue;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v109, v108, 3));
        v23 = v94;
        goto LABEL_26;
      case 5u:
        v66 = objc_msgSend(v18, "intValue");
        loga = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        v67 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
        if (v66 == 2)
        {
          if (v67)
          {
            v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
            v69 = objc_msgSend(v68, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v113 = v69;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received forecast data request from %s.", buf, 0xCu);

          }
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl cdd](self, "cdd"));
          v91 = objc_msgSend(v70, "classCLocked");

          if (!v91)
          {
            v82 = objc_loadWeakRetained((id *)&self->comm);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "satisfyForecastDataRequest:", v17));

            v106[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
            v106[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
            v107[0] = v96;
            v107[1] = &__kCFBooleanFalse;
            v106[2] = IDSSendMessageOptionBypassDuetKey;
            v107[2] = &__kCFBooleanTrue;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 3));
            goto LABEL_26;
          }
          v90 = v17;
          v71 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
          v87 = v13;
          v89 = v40;
          v93 = v18;
          if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            goto LABEL_69;
          v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
          v73 = objc_msgSend(v72, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v73;
          v74 = "CDDCommunicator: forecast data unavailable before class C unlock form %s.";
          v75 = v71;
          v76 = OS_LOG_TYPE_DEFAULT;
LABEL_68:
          _os_log_impl((void *)&_mh_execute_header, v75, v76, v74, buf, 0xCu);

LABEL_69:
          v25 = v95;
          v24 = (void *)v96;
          goto LABEL_77;
        }
        v89 = v40;
        v90 = v17;
        v93 = v18;
        v87 = v13;
        if (v67)
        {
          v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
          v79 = objc_msgSend(v72, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v79;
          v74 = "CDDCommunicator: receivedData: Invalid data value request from %s.";
          v71 = loga;
          v75 = loga;
          v76 = OS_LOG_TYPE_INFO;
          goto LABEL_68;
        }
        v25 = v95;
        v24 = (void *)v96;
        v71 = loga;
LABEL_77:

        v15 = 0;
        v16 = 0;
LABEL_78:
        v18 = v93;
        v26 = (void *)v97;
        v19 = v87;
        v22 = v89;
        break;
      case 6u:
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->sentRequestedTimestamps, "objectForKey:", v95));

        v92 = v18;
        if (v58)
        {
          v19 = v13;
          v22 = v40;
          -[NSMutableDictionary removeObjectForKey:](self->sentRequestedTimestamps, "removeObjectForKey:", v95);
          v59 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
          v25 = v95;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received ack from request.", buf, 2u);
          }

LABEL_39:
          v15 = 0;
          v16 = 0;
          v24 = (void *)v96;
        }
        else if (v18)
        {
          v15 = 0;
          v16 = 0;
          v25 = v95;
          v24 = (void *)v96;
          v19 = v13;
          v22 = v40;
        }
        else
        {
          v19 = v13;
          v22 = v40;
          v83 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
          v25 = v95;
          v24 = (void *)v96;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received ack without timestamp.", buf, 2u);
          }

          v15 = 0;
          v16 = 0;
        }
        v26 = (void *)v97;
        v18 = v92;
        goto LABEL_23;
      case 8u:
        v90 = v17;
        v93 = v18;
        v87 = v13;
        v89 = v40;
        v77 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received remote device sync request.", buf, 2u);
        }

        v78 = objc_loadWeakRetained((id *)&self->comm);
        objc_msgSend(v78, "syncStateWithActiveRemote");

        -[CDDCommControl setLastForecastSent:](self, "setLastForecastSent:", 0);
        -[CDDCommControl checkForecastSync](self, "checkForecastSync");
        goto LABEL_63;
      default:
        v90 = v17;
        v93 = v18;
        v87 = v13;
        v89 = v40;
        v55 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")));
          v57 = objc_msgSend(v56, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v57;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: Invalid request type from %s.", buf, 0xCu);

        }
LABEL_63:
        v15 = 0;
        v16 = 0;
        v25 = v95;
        v24 = (void *)v96;
        goto LABEL_78;
    }
LABEL_79:
    v17 = v90;
    goto LABEL_23;
  }
  if ((unint64_t)v33 >= v28)
    goto LABEL_33;
  v39 = objc_loadWeakRetained((id *)&self->comm);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "getAckMessage"));

  v110[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
  v110[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v111[0] = v96;
  v111[1] = &__kCFBooleanFalse;
  v110[2] = IDSSendMessageOptionBypassDuetKey;
  v111[2] = &__kCFBooleanTrue;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v111, v110, 3));
  v17 = 0;
  v18 = 0;
  v40 = 0;
LABEL_26:
  v100 = v8;
  if (v16)
  {
    v88 = v40;
    v41 = (void *)IDSCopyIDForDevice(v11);
    v90 = v17;
    if (v41)
    {
      service = self->_service;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v41));
      v101 = 0;
      v102 = 0;
      logb = -[IDSService sendData:toDestinations:priority:options:identifier:error:](service, "sendData:toDestinations:priority:options:identifier:error:", v16, v43, 300, v15, &v102, &v101);
      v44 = v102;
      v45 = v101;

      v25 = v95;
      v24 = (void *)v96;
      if ((logb & 1) == 0)
      {
        log = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject description](v45, "description")));
          v47 = objc_msgSend(v46, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v113 = v47;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receiveData: send error %s.", buf, 0xCu);

          v25 = v95;
          v24 = (void *)v96;
        }

      }
      v19 = v13;
      v22 = v88;

    }
    else
    {
      v45 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      v19 = v13;
      v22 = v88;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "CDDCommunicator: receiveRequestData: failed to get idsIdentifier, cannot proceed.", buf, 2u);
      }
      v25 = v95;
      v24 = (void *)v96;
    }

    v23 = v94;
    v26 = (void *)v97;
    goto LABEL_79;
  }
  v25 = v95;
  v24 = (void *)v96;
LABEL_53:
  v19 = v13;
  v22 = v40;
  v26 = (void *)v97;
LABEL_23:

}

- (id)synchronize:(id)a3 interval:(id)a4 withForecasts:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CDD **p_cdd;
  id WeakRetained;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  IDSService *service;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  _QWORD v35[7];
  _QWORD v36[7];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  p_cdd = &self->cdd;
  WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "privacyMonitor"));
  if ((objc_msgSend(v12, "updateAllowed") & 1) == 0)
  {

    goto LABEL_7;
  }
  v13 = objc_loadWeakRetained((id *)&self->cdd);
  v14 = objc_msgSend(v13, "isClassCLocked");

  if (v14)
  {
LABEL_7:
    v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      v25 = 0;
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v26 = "CDDCommunicator: Either Background App refresh is disabled or device locked.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    goto LABEL_10;
  }
  v15 = objc_loadWeakRetained((id *)&self->comm);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getScheduledMessage:withForecasts:", v9, v5));

  if (!v16)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v26 = "CDDCommunicator: no blob, cannot continue.";
    goto LABEL_9;
  }
  service = self->_service;
  v35[0] = IDSSendMessageOptionExpectsPeerResponseKey;
  v35[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v36[0] = &__kCFBooleanTrue;
  v36[1] = &__kCFBooleanFalse;
  v35[2] = IDSSendMessageOptionTimeoutKey;
  v18 = objc_loadWeakRetained((id *)p_cdd);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "config"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "commSyncBoundarySeconds")));
  v36[2] = v20;
  v36[3] = &__kCFBooleanTrue;
  v35[3] = IDSSendMessageOptionBypassDuetKey;
  v35[4] = IDSSendMessageOptionOpportunisticDuetKey;
  v36[4] = &__kCFBooleanTrue;
  v36[5] = CFSTR("DuetForecastExchange");
  v35[5] = IDSSendMessageOptionQueueOneIdentifierKey;
  v35[6] = IDSSendMessageOptionForceLocalDeliveryKey;
  v36[6] = &__kCFBooleanTrue;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 7));
  v31 = 0;
  v32 = 0;
  v22 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](service, "sendData:toDestinations:priority:options:identifier:error:", v16, v8, 200, v21, &v32, &v31);
  v23 = v32;
  v24 = v31;

  if ((v22 & 1) != 0)
  {
    v25 = v23;
  }
  else
  {
    v28 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description")));
      v30 = objc_msgSend(v29, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v34 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "CDDCommunicator: synchronize: send error %s.", buf, 0xCu);

    }
    v25 = 0;
  }

LABEL_11:
  return v25;
}

- (void)triggeredExchange:(id)a3 opportunistic:(BOOL)a4 queue:(id)a5 timeout:(id)a6 urgent:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *commQueue;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;
  _QWORD block[4];
  id v30;
  id v31;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  commQueue = self->commQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000118B8;
  v23[3] = &unk_100038CB0;
  v23[4] = self;
  v24 = v12;
  v27 = a4;
  v28 = a7;
  v25 = v14;
  v26 = v13;
  v16 = v23;
  v17 = commQueue;
  v18 = v13;
  v19 = v14;
  v20 = v12;
  v21 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013498;
  block[3] = &unk_100038A98;
  v30 = v21;
  v31 = v16;
  v22 = v21;
  dispatch_async(v17, block);

}

- (id)requestDataFromDevice:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CDDCommControl *v9;
  NSObject *v10;
  IDSService *service;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  unsigned __int8 v17;
  NSMutableDictionary *sentRequestedTimestamps;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10003B1B8));
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9->identifierCache, "objectForKey:", v8));
    objc_sync_exit(v9);

    if (v10)
    {
      service = v9->_service;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));
      v28 = IDSSendMessageOptionExpectsPeerResponseKey;
      v29 = &__kCFBooleanTrue;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v26 = 0;
      v27 = 0;
      v14 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](service, "sendData:toDestinations:priority:options:identifier:error:", v7, v12, 300, v13, &v27, &v26);
      v15 = v27;
      v16 = v26;

      if (v15)
        v17 = v14;
      else
        v17 = 0;
      if ((v17 & 1) != 0)
      {
        sentRequestedTimestamps = v9->sentRequestedTimestamps;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[NSMutableDictionary setObject:forKey:](sentRequestedTimestamps, "setObject:forKey:", v19, v15);

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "hash")));
      }
      else
      {
        v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject description](v16, "description")));
          v24 = objc_msgSend(v23, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v31 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: send error %s.", buf, 0xCu);

        }
        v20 = 0;
      }

    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: missing idsIdentifier, cannot proceed.", buf, 2u);
      }
      v20 = 0;
    }

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
      *(_DWORD *)buf = 136315138;
      v31 = objc_msgSend(v21, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: bad description %s.", buf, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

- (id)deviceDescriptionFromDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[8];
  _QWORD v20[4];
  _QWORD v21[4];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIDOverride"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = CFSTR("UNKNOWN");
  v8 = v7;

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = CFSTR("UNKNOWN");
  v12 = v11;

  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productName"));
  if (v13)
    v14 = v13;
  else
    v14 = CFSTR("UNKNOWN");
  v15 = v14;

  if (v4)
  {
    v20[0] = &off_10003B1B8;
    v20[1] = &off_10003B200;
    v21[0] = v4;
    v21[1] = v8;
    v20[2] = &off_10003B1E8;
    v20[3] = &off_10003B218;
    v21[2] = v12;
    v21[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CDDCommunicator: deviceDescriptionFromDevice: missing unique identifier.", v19, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)deviceFromDeviceDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10003B1B8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10003B200));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v16 = v4;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
        if ((objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if ((v14 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
LABEL_12:
    v4 = v16;
  }

  return v8;
}

- (id)identifierFromDeviceDescription:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", &off_10003B1B8));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = &stru_100039CD0;

  return v5;
}

- (void)addDevice:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *commQueue;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __int128 buf;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "addDevice: %@", (uint8_t *)&buf, 0xCu);
  }

  commQueue = self->commQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000124E8;
  v12[3] = &unk_100038B30;
  v12[4] = self;
  v13 = v4;
  v7 = v12;
  v8 = commQueue;
  v9 = v4;
  v10 = (void *)os_transaction_create("cd_dispatch_async_tx");
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v15 = sub_100013498;
  v16 = &unk_100038A98;
  v17 = v10;
  v18 = v7;
  v11 = v10;
  dispatch_async(v8, &buf);

}

- (void)removeDevice:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    v6 = 136315138;
    v7 = objc_msgSend(v5, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "removeDevice: %s.", (uint8_t *)&v6, 0xCu);

  }
}

- (void)checkDevices:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  CDDCommControl *v12;
  NSMutableDictionary *identifierCache;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id WeakRetained;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  NSMutableSet *v24;
  NSMutableSet *registeredDevices;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  uint64_t state64;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];

  v3 = a3;
  v29 = (void *)os_transaction_create("com.apple.coreduet.able.device-check");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v4)
  {
    state64 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v10 = IDSCopyIDForDevice(v9);

        v6 = (void *)v10;
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDCommControl deviceDescriptionFromDevice:](self, "deviceDescriptionFromDevice:", v9));

          if (v11)
          {
            if (objc_msgSend(v9, "isDefaultPairedDevice"))
            {
              objc_msgSend(v30, "addObject:", v11);
              v12 = self;
              objc_sync_enter(v12);
              identifierCache = self->identifierCache;
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", &off_10003B1B8));
              -[NSMutableDictionary setObject:forKey:](identifierCache, "setObject:forKey:", v6, v14);

              objc_sync_exit(v12);
              v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v11;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Default Paired Device Changed: %@", buf, 0xCu);
              }

            }
            if (objc_msgSend(v9, "isConnected"))
              state64 += objc_msgSend(v9, "isNearby");
            v5 = v11;
          }
          else
          {
            v17 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CDDCommunicator: checkDevices: missing device description, pass.", buf, 2u);
            }

            v5 = 0;
          }
        }
        else
        {
          v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: checkDevices: missing idsIdentifier, pass.", buf, 2u);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v4);
  }
  else
  {
    state64 = 0;
    v5 = 0;
    v6 = 0;
  }

  notify_set_state(self->nearbyDevicesNotifyToken, state64);
  notify_post("com.apple.coreduetd.nearbydeviceschanged");
  v18 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Device Set Changed! Signaling Conditions have changed", buf, 2u);
  }

  notify_post("com.apple.coreduetd.systemConditionNotification");
  WeakRetained = objc_loadWeakRetained((id *)&self->comm);
  objc_msgSend(WeakRetained, "checkDevices:", v30);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v30));
  if (-[NSMutableSet isEqualToSet:](self->registeredDevices, "isEqualToSet:", v20))
  {
    v21 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: device set hasn't changed.", buf, 2u);
    }
  }
  else
  {
    v22 = -[NSMutableSet mutableCopy](self->registeredDevices, "mutableCopy");
    objc_msgSend(v22, "minusSet:", v20);
    v23 = objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v23, "minusSet:", self->registeredDevices);
    v24 = (NSMutableSet *)objc_msgSend(v20, "mutableCopy");
    registeredDevices = self->registeredDevices;
    self->registeredDevices = v24;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = v22;
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v21);
          -[CDDCommControl removeDevice:](self, "removeDevice:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j));
        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v26);
    }

    -[CDDCommControl addDevice:](self, "addDevice:", v23);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v7;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id WeakRetained;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;

  v7 = a6;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v12 = "NO";
    if (v7)
      v12 = "YES";
    v14 = 136315394;
    v15 = v11;
    v16 = 2080;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: Message Sent to %s with success %s.", (uint8_t *)&v14, 0x16u);
  }

  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->comm);
    objc_msgSend(WeakRetained, "informCommunicationError");

  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSSet *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;
  uint8_t buf[8];
  id v33;

  v31 = a3;
  v30 = a6;
  v29 = a7;
  v10 = a5;
  v11 = objc_opt_class(NSArray);
  v12 = objc_opt_class(NSDictionary);
  v13 = objc_opt_class(NSSet);
  v14 = objc_opt_class(NSNumber);
  v15 = objc_opt_class(NSString);
  v16 = objc_opt_class(NSDate);
  v17 = objc_opt_class(NSData);
  v18 = objc_opt_class(NSUUID);
  v19 = objc_opt_class(NSNull);
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(NSURL), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v33 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v21, v10, &v33));

  v23 = v33;
  if (v23)
  {
    v24 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100022D08((uint64_t)v23, v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceForFromID:", v30));
  if (v22)
  {
    v26 = v29;
    -[CDDCommControl receiveData:context:device:](self, "receiveData:context:device:", v22, v29, v25);
  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CDDCommunicator: NIL object received from IDS.", buf, 2u);
    }

    v26 = v29;
  }

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  -[CDDCommControl checkDevices:](self, "checkDevices:", a4);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a4;
  v7 = v6;
  if (self->_service == a3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "isNearby"))
            v10 += objc_msgSend(v13, "isDefaultPairedDevice");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }
    notify_set_state(self->nearbyDevicesNotifyToken, v10);
    notify_post("com.apple.coreduetd.nearbydeviceschanged");
  }

}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  void (**v6)(void);

  v6 = (void (**)(void))a5;
  -[CDDCommControl setLastForecastSent:](self, "setLastForecastSent:", 0);
  v6[2]();

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;

  v4 = a4;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    v7 = 136315138;
    v8 = objc_msgSend(v6, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "checkAccounts: accounts changed to %s.", (uint8_t *)&v7, 0xCu);

  }
}

- (CDD)cdd
{
  return (CDD *)objc_loadWeakRetained((id *)&self->cdd);
}

- (CDDCommunicator)comm
{
  return (CDDCommunicator *)objc_loadWeakRetained((id *)&self->comm);
}

- (IDSService)_service
{
  return (IDSService *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_service:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)lastForecastSent
{
  return self->lastForecastSent;
}

- (void)setLastForecastSent:(id)a3
{
  objc_storeStrong((id *)&self->lastForecastSent, a3);
}

- (NSMutableDictionary)sentRequestedTimestamps
{
  return self->sentRequestedTimestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sentRequestedTimestamps, 0);
  objc_storeStrong((id *)&self->lastForecastSent, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->comm);
  objc_destroyWeak((id *)&self->cdd);
  objc_storeStrong((id *)&self->commQueue, 0);
  objc_storeStrong((id *)&self->exchangeRecords, 0);
  objc_storeStrong((id *)&self->registeredDevices, 0);
  objc_storeStrong((id *)&self->identifierCache, 0);
}

@end
