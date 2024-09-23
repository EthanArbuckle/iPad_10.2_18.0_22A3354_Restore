@implementation CAFDCarDataServiceAgent

- (CAFDCarDataServiceAgent)initWithSessionStatus:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  CAFDCarDataServiceAgent *v9;
  CAFDCarDataServiceAgent *v10;
  CAFCarConfiguration *currentCar;
  uint64_t v12;
  NSMutableDictionary *carDataChannels;
  uint64_t v14;
  NSMutableArray *carDataClients;
  uint64_t v16;
  NSMutableSet *connections;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *workQueue;
  id v23;
  void *v24;
  CARObserverHashTable *v25;
  CARObserverHashTable *remoteProxies;
  NSMutableDictionary *v27;
  NSMutableDictionary *fastStartupRegistrations;
  uint64_t v29;
  CAFASCTree *ascTree;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];

  v7 = a3;
  v8 = a4;
  v60.receiver = self;
  v60.super_class = (Class)CAFDCarDataServiceAgent;
  v9 = -[CAFDCarDataServiceAgent init](&v60, "init");
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)&v9->_carLock._os_unfair_lock_opaque = 0;
    v9->_channelLock._os_unfair_lock_opaque = 0;
    currentCar = v9->_currentCar;
    v9->_currentCar = 0;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    carDataChannels = v10->_carDataChannels;
    v10->_carDataChannels = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    carDataClients = v10->_carDataClients;
    v10->_carDataClients = (NSMutableArray *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    connections = v10->_connections;
    v10->_connections = (NSMutableSet *)v16;

    v18 = (const char *)objc_msgSend(CFSTR("com.apple.caraccessoryframework.cardata"), "UTF8String");
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create(v18, v20);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v21;

    v23 = objc_alloc((Class)CARObserverHashTable);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](v10, "workQueue"));
    v25 = (CARObserverHashTable *)objc_msgSend(v23, "initWithProtocol:callbackQueue:", &OBJC_PROTOCOL___CAFCarDataClient, v24);
    remoteProxies = v10->_remoteProxies;
    v10->_remoteProxies = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fastStartupRegistrations = v10->_fastStartupRegistrations;
    v10->_fastStartupRegistrations = v27;

    v55 = v8;
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registrations"));
    ascTree = v10->_ascTree;
    v10->_ascTree = (CAFASCTree *)v29;

    v10->_allowPartialConfiguration = CAFDefaultsGetBoolean(CFSTR("allowPartialConfiguration"), (id)1);
    v10->_pluginConfigsRequested = 0;
    notify_register_check("com.apple.private.caraccessoryframework.cardata.available", &v10->_carDataAvailableToken);
    notify_set_state(v10->_carDataAvailableToken, 0);
    notify_post("com.apple.private.caraccessoryframework.cardata.available");
    objc_storeStrong((id *)&v10->_sessionStatus, a3);
    objc_msgSend(v7, "addSessionObserver:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent sessionStatus](v10, "sessionStatus"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentSession"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent sessionStatus](v10, "sessionStatus"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentSession"));
      -[CAFDCarDataServiceAgent sessionDidConnect:](v10, "sessionDidConnect:", v34);

    }
    v35 = v7;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v36, "addObserver:selector:name:object:", v10, "handlePairedVehiclesDidChange:", CRPairedVehiclesDidChangeNotification, 0);

    v37 = CAFDDataLogging();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent initWithSessionStatus:config:].cold.1((uint64_t)&v10->_allowPartialConfiguration, v38, v39, v40, v41, v42, v43, v44);

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent ascTree](v10, "ascTree"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "treeLogLines"));

    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v57;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v57 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v50);
          v52 = CAFDDataLogging();
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v62 = v51;
            _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "registrations %{public}@", buf, 0xCu);
          }

          v50 = (char *)v50 + 1;
        }
        while (v48 != v50);
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v48);
    }

    v7 = v35;
    v8 = v55;
  }

  return v10;
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "close connection start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__CAFDCarDataServiceAgent_close__block_invoke(id a1, NSNumber *a2, CarDataChannel *a3, BOOL *a4)
{
  CarDataChannel *v4;

  v4 = a3;
  if (-[CarDataChannel isOpened](v4, "isOpened"))
    -[CarDataChannel invalidate](v4, "invalidate");

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "dealloc CarDataServiceAgent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (BOOL)_setupCarDataChannel:(id)a3 channelType:(id)a4 qualityOfService:(id)a5 streamPriority:(id)a6 priority:(unint64_t)a7
{
  id v12;
  CarDataChannel *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  CarDataChannel *v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  os_signpost_id_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  int v46;
  id v47;
  __int16 v48;
  CarDataChannel *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  unint64_t v53;

  v12 = a4;
  v13 = (CarDataChannel *)a5;
  v14 = a6;
  v15 = a3;
  v17 = CAFDDataLogging(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v46 = 138544130;
    v47 = v12;
    v48 = 2114;
    v49 = v13;
    v50 = 2114;
    v51 = v14;
    v52 = 2050;
    v53 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Init car data channel START type: %{public}@ QoS: %{public}@ stream priority: %{public}@ priority: %{public}lu", (uint8_t *)&v46, 0x2Au);
  }

  v19 = CARSignpostLogForCategory(1);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (v22 = CARSignpostLogForCategory(1),
        v23 = objc_claimAutoreleasedReturnValue(v22),
        v21 = os_signpost_id_make_with_pointer(v23, self),
        v23,
        v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v20))
    {
      v46 = 138543362;
      v47 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, v21, "CAFd-ChannelInit", "Start %{public}@", (uint8_t *)&v46, 0xCu);
    }
  }

  v24 = objc_msgSend(objc_alloc((Class)CARSessionChannel), "initWithSession:channelType:channelID:withoutReply:qualityOfService:streamPriority:", v15, v12, 0, 1, v13, v14);
  if (v24)
  {
    v26 = -[CarDataChannel initWithChannel:priority:]([CarDataChannel alloc], "initWithChannel:priority:", v24, a7);
    v27 = v26 != 0;
    if (v26)
    {
      os_unfair_lock_lock(&self->_channelLock);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, v29);

      -[CarDataChannel setChannelDelegate:](v26, "setChannelDelegate:", self);
      os_unfair_lock_unlock(&self->_channelLock);
      v31 = CAFDLogging(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v46 = 138543874;
        v47 = v24;
        v48 = 2114;
        v49 = v26;
        v50 = 2114;
        v51 = v12;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Open car session channel: %{public}@ data channel: %{public}@ type: %{public}@ START", (uint8_t *)&v46, 0x20u);
      }

      v33 = 0xEEEEB0B5B2B2EEEELL;
      if (!-[CarDataChannel isOpened](v26, "isOpened"))
        -[CarDataChannel openChannel](v26, "openChannel");
      v34 = CARSignpostLogForCategory(1);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (!self
        || (v36 = CARSignpostLogForCategory(1),
            v37 = objc_claimAutoreleasedReturnValue(v36),
            v38 = os_signpost_id_make_with_pointer(v37, self),
            v37,
            v33 = v38,
            v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v35))
        {
          v46 = 138543362;
          v47 = v12;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, v33, "CAFd-ChannelInit", "End %{public}@", (uint8_t *)&v46, 0xCu);
        }
      }

      v41 = CAFDDataLogging(v39, v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:].cold.2();
    }
    else
    {
      v44 = CAFDLogging(0);
      v42 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:].cold.3();
    }

  }
  else
  {
    v43 = CAFDLogging(v25);
    v26 = (CarDataChannel *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:].cold.1();
    v27 = 0;
  }

  return v27;
}

- (void)_mainQueue_initVehicleDataSession:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_signpost_id_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  CarDataClient *v38;
  void *v39;
  CarDataClient *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  os_signpost_id_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  CAFDStateCaptureManager *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  os_signpost_id_t spid;
  uint8_t buf[4];
  void *v79;

  v4 = a3;
  v5 = CAFDLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Init car data session START", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MFiCertificateSerialNumber"));
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v7), "bytes"));
  }
  else
  {
    v9 = CAFDLogging(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.8();

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  }
  v11 = v8;
  v12 = -[CAFDCarDataServiceAgent currentCarIdentifierIsEqual:](self, "currentCarIdentifierIsEqual:", v8);
  if (v12)
  {
    v13 = CAFDLogging(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
      *(_DWORD *)buf = 138543362;
      v79 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Init car data session END with same car %{public}@", buf, 0xCu);

    }
LABEL_41:

    goto LABEL_42;
  }
  -[CAFDCarDataServiceAgent close](self, "close");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));

  if (!v16)
  {
    v69 = CAFDLogging(v17);
    v14 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.1();
    goto LABEL_41;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v19 = objc_msgSend(v18, "supportsVehicleData");

  if ((v19 & 1) == 0)
  {
    v70 = CAFDLogging(v20);
    v14 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No vehicle data support", buf, 2u);
    }
    goto LABEL_41;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "vehicleDataProtocolVersion"));
  v23 = kCarDataProtocolSupportedVersion;
  v24 = objc_msgSend(v22, "isEqualToString:", kCarDataProtocolSupportedVersion);

  if ((v24 & 1) == 0)
  {
    v71 = CAFDLogging(v25);
    v14 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.7(v4, v23, v14);
    goto LABEL_41;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v27 = objc_msgSend(v26, "vehicleDataPluginCount");

  if (!v27)
  {
    v72 = CAFDLogging(v28);
    v14 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.2();
    goto LABEL_41;
  }
  spid = 0xEEEEB0B5B2B2EEEELL;
  v29 = CARSignpostLogForCategory(1);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (v32 = CARSignpostLogForCategory(1),
        v33 = objc_claimAutoreleasedReturnValue(v32),
        v31 = os_signpost_id_make_with_pointer(v33, self),
        v33,
        v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v30))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
      *(_DWORD *)buf = 138543362;
      v79 = v34;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, v31, "CAFd-SessionInit", "Start %{public}@", buf, 0xCu);

    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v36 = objc_msgSend(v35, "vehicleDataPluginCount");

  if (v36)
  {
    v37 = 0;
    do
    {
      v38 = [CarDataClient alloc];
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37));
      v40 = -[CarDataClient initWithPluginID:](v38, "initWithPluginID:", v39);

      os_unfair_lock_lock(&self->_channelLock);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataClients](self, "carDataClients"));
      objc_msgSend(v41, "addObject:", v40);

      -[CarDataClient setClientDelegate:](v40, "setClientDelegate:", self);
      os_unfair_lock_unlock(&self->_channelLock);

      ++v37;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
      v43 = objc_msgSend(v42, "vehicleDataPluginCount");

    }
    while (v37 < (unint64_t)v43);
  }
  v44 = kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayProtocolData;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  LOBYTE(v44) = -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:](self, "_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:", v4, v44, v45, &off_100031CB0, 0);

  if ((v44 & 1) == 0)
  {
    v73 = CAFDLogging(v46);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.6();
    goto LABEL_47;
  }
  v47 = kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayProtocolData2;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 12));
  LOBYTE(v47) = -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:](self, "_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:", v4, v47, v48, &off_100031CC8, 1);

  if ((v47 & 1) == 0)
  {
    v75 = CAFDLogging(v49);
    v74 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.5();
LABEL_47:

    -[CAFDCarDataServiceAgent close](self, "close");
    goto LABEL_42;
  }
  v50 = CARSignpostLogForCategory(1);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (!self
    || (v52 = CARSignpostLogForCategory(1),
        v53 = objc_claimAutoreleasedReturnValue(v52),
        v54 = os_signpost_id_make_with_pointer(v53, self),
        v53,
        spid = v54,
        v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v51))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
      *(_DWORD *)buf = 138543362;
      v79 = v55;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_EVENT, spid, "CAFd-SessionInit", "End %{public}@", buf, 0xCu);

    }
  }

  v58 = CAFDDataLogging(v56, v57);
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.4(v11, v4, v59);

  v60 = objc_msgSend(objc_alloc((Class)CAFCarConfiguration), "initWithIdentifier:session:", v11, v4);
  if (v60)
  {
    -[CAFDCarDataServiceAgent setCurrentCar:](self, "setCurrentCar:", v60);
    v61 = objc_opt_new(CAFDStateCaptureManager);
    -[CAFDCarDataServiceAgent setStateCaptureManager:](self, "setStateCaptureManager:", v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent stateCaptureManager](self, "stateCaptureManager"));
    objc_msgSend(v62, "setDelegate:", self);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent stateCaptureManager](self, "stateCaptureManager"));
    objc_msgSend(v63, "setCurrentCarConfiguration:", v60);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent remoteProxies](self, "remoteProxies"));
    objc_msgSend(v64, "didUpdateCurrentCarConfig:", v60);

    v66 = CAFDLogging(v65);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
      *(_DWORD *)buf = 138543362;
      v79 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Init car data session END UUID: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v76 = CAFDLogging(0);
    v67 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.3(v11, v67);
  }

LABEL_42:
}

- (void)handlePairedVehiclesDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__CAFDCarDataServiceAgent_handlePairedVehiclesDidChange___block_invoke;
  block[3] = &unk_100030DF0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __57__CAFDCarDataServiceAgent_handlePairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionStatus"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSession"));

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mainQueue_initVehicleDataSession:", v4);
    v3 = v4;
  }

}

- (void)processFastStartupRegistrations:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  CAFDCarDataServiceAgent *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent ascTree](self, "ascTree"));

  if (v8)
  {
    v9 = objc_opt_class(NSArray);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationAccessoriesKey));
    v11 = v10;
    if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (!v12)
      goto LABEL_18;
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke;
    v28 = &unk_100030E40;
    v29 = self;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v30 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent fastStartupRegistrations](self, "fastStartupRegistrations", v25, v26, v27, v28, v29));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v6);

    v15 = objc_msgSend(v13, "count");
    if (!v15)
    {
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    v16 = v15;
    v17 = CAFDLogging(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v6;
      v33 = 2050;
      v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fast Startup Registrations pluginID: %{public}@ instanceIDs count %{public}lu", buf, 0x16u);
    }

    v19 = CARSignpostLogForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (self)
    {
      v21 = CARSignpostLogForCategory(1);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v23 = os_signpost_id_make_with_pointer(v22, self);

      if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_16:

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
        -[CAFDCarDataServiceAgent _addRegistration:instanceIDs:priority:withResponse:](self, "_addRegistration:instanceIDs:priority:withResponse:", v6, v24, &off_100031CE0, 0);

        goto LABEL_17;
      }
    }
    else
    {
      v23 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v6;
      v33 = 2050;
      v34 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, v23, "Perform", "Fast Startup Registrations pluginID: %{public}@ count: %{public}lu", buf, 0x16u);
    }
    goto LABEL_16;
  }
LABEL_19:

}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v13 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v13));
    v7 = objc_opt_class(NSArray);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", kCarDataConfigurationServicesKey));
    v9 = v8;
    if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v6)
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ascTree"));
        v12 = objc_msgSend(v11, "hasAccessory:", v6);

        if (v12)
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_2;
          v14[3] = &unk_100030BD0;
          v14[4] = *(_QWORD *)(a1 + 32);
          v15 = v6;
          v16 = *(id *)(a1 + 40);
          objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

        }
      }
    }

  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v20 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v20));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ascTree"));
      v8 = objc_msgSend(v7, "hasAccessory:service:", *(_QWORD *)(a1 + 40), v6);

      if (v8)
      {
        v9 = objc_opt_class(NSArray);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCarDataConfigurationCharacteristicsKey));
        v11 = v10;
        if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
          v12 = v11;
        else
          v12 = 0;

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_3;
        v25[3] = &unk_100030E18;
        v13 = *(void **)(a1 + 40);
        v25[4] = *(_QWORD *)(a1 + 32);
        v26 = v13;
        v14 = v6;
        v27 = v14;
        v28 = *(id *)(a1 + 48);
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
        v15 = objc_opt_class(NSArray);
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kCarDataConfigurationControlsKey));
        v17 = v16;
        if (v16 && (objc_opt_isKindOfClass(v16, v15) & 1) != 0)
          v18 = v17;
        else
          v18 = 0;

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_4;
        v21[3] = &unk_100030E18;
        v19 = *(void **)(a1 + 40);
        v21[4] = *(_QWORD *)(a1 + 32);
        v22 = v19;
        v23 = v14;
        v24 = *(id *)(a1 + 48);
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);

      }
    }

  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v14 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v14));
    v7 = objc_opt_class(NSNumber);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
    v9 = v8;
    if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v6)
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ascTree"));
        v12 = objc_msgSend(v11, "hasAccessory:service:characteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kCarDataConfigurationInitialValueKey));
          if ((+[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v14, kCarDataConfigurationMutableKey) & 1) != 0|| !v13)
          {
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
          }

        }
      }
    }

  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v13 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v13));
    v7 = objc_opt_class(NSNumber);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
    v9 = v8;
    if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v6)
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ascTree"));
        v12 = objc_msgSend(v11, "hasAccessory:service:control:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

        if (v12)
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
      }
    }

  }
}

- (CAFCarConfiguration)currentCar
{
  os_unfair_lock_s *p_carLock;
  CAFCarConfiguration *v4;

  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  v4 = self->_currentCar;
  os_unfair_lock_unlock(p_carLock);
  return v4;
}

- (void)setCurrentCar:(id)a3
{
  CAFCarConfiguration *v4;
  CAFCarConfiguration *currentCar;

  v4 = (CAFCarConfiguration *)a3;
  os_unfair_lock_lock(&self->_carLock);
  currentCar = self->_currentCar;
  self->_currentCar = v4;

  os_unfair_lock_unlock(&self->_carLock);
}

- (BOOL)currentCarIdentifierIsEqual:(id)a3
{
  id v4;
  os_unfair_lock_s *p_carLock;
  CAFCarConfiguration *currentCar;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  currentCar = self->_currentCar;
  if (currentCar)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAFCarConfiguration uniqueIdentifier](currentCar, "uniqueIdentifier"));
    v8 = objc_msgSend(v4, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_carLock);

  return v8;
}

- (unint64_t)currentCarPluginCount
{
  os_unfair_lock_s *p_carLock;
  id v4;

  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  v4 = -[CAFCarConfiguration pluginCount](self->_currentCar, "pluginCount");
  os_unfair_lock_unlock(p_carLock);
  return (unint64_t)v4;
}

- (void)_observeAssertion:(id)a3
{
  os_unfair_lock_s *p_assertionCounterLock;
  id v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;

  p_assertionCounterLock = &self->_assertionCounterLock;
  v5 = a3;
  os_unfair_lock_lock(p_assertionCounterLock);
  objc_msgSend(v5, "addObserver:", self);

  -[CAFDCarDataServiceAgent setAssertionCount:](self, "setAssertionCount:", (char *)-[CAFDCarDataServiceAgent assertionCount](self, "assertionCount") + 1);
  v6 = -[CAFDCarDataServiceAgent assertionCount](self, "assertionCount");
  v7 = CAFDAssertionLogging();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (char *)v8;
  if (v6 == 1800)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CAFDCarDataServiceAgent _observeAssertion:].cold.1(self, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[CAFDCarDataServiceAgent _observeAssertion:].cold.2(self, v9);
  }

  os_unfair_lock_unlock(p_assertionCounterLock);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  os_unfair_lock_s *p_assertionCounterLock;
  id v6;
  uint64_t v7;
  char *v8;

  p_assertionCounterLock = &self->_assertionCounterLock;
  v6 = a3;
  os_unfair_lock_lock(p_assertionCounterLock);
  objc_msgSend(v6, "removeObserver:", self);

  v7 = CAFDAssertionLogging(-[CAFDCarDataServiceAgent setAssertionCount:](self, "setAssertionCount:", (char *)-[CAFDCarDataServiceAgent assertionCount](self, "assertionCount") - 1));
  v8 = (char *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent assertion:didInvalidateWithError:].cold.1(self, v8);

  os_unfair_lock_unlock(p_assertionCounterLock);
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v6 = CAFDDataLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent sessionDidConnect:].cold.1();

  v8 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__CAFDCarDataServiceAgent_sessionDidConnect___block_invoke;
  v10[3] = &unk_100030CE8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

uint64_t __45__CAFDCarDataServiceAgent_sessionDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "osTransaction"));

  if (!v2)
  {
    v3 = (void *)os_transaction_create("com.apple.caraccessoryd.session.transaction");
    objc_msgSend(*(id *)(a1 + 32), "setOsTransaction:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_initVehicleDataSession:", *(_QWORD *)(a1 + 40));
  notify_set_state((int)objc_msgSend(*(id *)(a1 + 32), "carDataAvailableToken"), 1uLL);
  return notify_post("com.apple.private.caraccessoryframework.cardata.available");
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = CAFDDataLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent sessionDidDisconnect:].cold.1();

  v6 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke;
  block[3] = &unk_100030DF0;
  block[4] = self;
  dispatch_async(v6, block);

}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "close");
  v2 = dispatch_time(0, 5000000000);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2;
  block[3] = &unk_100030DF0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, v3, block);

}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSession"));

  v6 = CAFDDataLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v8)
      __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_2();

  }
  else
  {
    if (v8)
      __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setOsTransaction:", 0);
    notify_set_state((int)objc_msgSend(*(id *)(a1 + 32), "carDataAvailableToken"), 0);
    notify_post("com.apple.private.caraccessoryframework.cardata.available");
  }
}

- (void)carDataChannelDidOpen:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  v6 = CAFDDataLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent carDataChannelDidOpen:].cold.4();

  os_unfair_lock_lock(&self->_channelLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
  v9 = objc_msgSend(v8, "count");

  if (v9 == (id)2)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke;
    v21[3] = &unk_100030E68;
    v21[4] = &v22;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v21);

    os_unfair_lock_unlock(&self->_channelLock);
    if (*((_BYTE *)v23 + 24))
    {
      v12 = CAFDLogging(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CAFDCarDataServiceAgent carDataChannelDidOpen:].cold.2();

      v14 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_218;
      v20[3] = &unk_100030DF0;
      v20[4] = self;
      dispatch_async(v14, v20);

    }
    else
    {
      v18 = CAFDLogging(v11);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CAFDCarDataServiceAgent carDataChannelDidOpen:].cold.1();

    }
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_channelLock);
    v16 = CAFDLogging(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent carDataChannelDidOpen:].cold.3();

  }
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "isOpened");
  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v8 = CAFDLogging(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_cold_1();

    *a4 = 1;
  }

}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_218(uint64_t a1)
{
  char *v2;
  char *v3;
  char *i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentCarPluginCount");
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(*(id *)(a1 + 32), "pluginConfigsRequested") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setPluginConfigsRequested:", 1);
      for (i = 0; i != v3; ++i)
      {
        v5 = *(void **)(a1 + 32);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_getClient:", v6));

        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_219;
        v10[3] = &__block_descriptor_40_e21_v16__0__CAFResponse_8l;
        v10[4] = i;
        objc_msgSend(v7, "requestConfigurationWithPriority:withResponse:", &off_100031CE0, v10);

      }
    }
  }
  else
  {
    v8 = CAFGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_218_cold_1();

  }
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (v4)
  {
    v6 = CAFDLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_219_cold_1(a1, v3, v7);

  }
}

- (void)carDataChannelDidClose:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    v7 = CAFDDataLogging(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent carDataChannelDidClose:].cold.2();

    os_unfair_lock_lock(&self->_channelLock);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "priority")));
    objc_msgSend(v9, "removeObjectForKey:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
    objc_msgSend(v11, "count");

    os_unfair_lock_unlock(&self->_channelLock);
    v14 = CAFDDataLogging(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent carDataChannelDidClose:].cold.1();

  }
}

- (void)carDataChannelDidReceive:(id)a3 pluginID:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent _getClient:](self, "_getClient:", v9));
  if (v11)
  {
    objc_msgSend(v11, "receiveData:priority:", v10, objc_msgSend(v8, "priority"));
  }
  else
  {
    v12 = CAFDChannelLogging();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent carDataChannelDidReceive:pluginID:payload:].cold.1();

  }
}

- (void)didReceiveConfigFromPluginID:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v9 = CAFDDataLogging(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CAFDCarDataServiceAgent didReceiveConfigFromPluginID:config:].cold.1();

  objc_initWeak(&location, self);
  v11 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __63__CAFDCarDataServiceAgent_didReceiveConfigFromPluginID_config___block_invoke;
  v14[3] = &unk_100030EB0;
  objc_copyWeak(&v17, &location);
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __63__CAFDCarDataServiceAgent_didReceiveConfigFromPluginID_config___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_workQueue_didReceiveConfigFromPluginID:config:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_workQueue_didReceiveConfigFromPluginID:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_unfair_lock_s *p_carLock;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v8);

  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  if (self->_currentCar)
  {
    v12 = CAFDDataLogging(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:].cold.3();

    -[CAFCarConfiguration updateConfiguration:pluginConfig:](self->_currentCar, "updateConfiguration:pluginConfig:", v6, v7);
    -[CAFDCarDataServiceAgent processFastStartupRegistrations:config:](self, "processFastStartupRegistrations:config:", v6, v7);
    v14 = -[CAFCarConfiguration isConfigured](self->_currentCar, "isConfigured");
    v15 = (int)v14;
    v16 = CAFDLogging(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CAFCarConfiguration uniqueIdentifier](self->_currentCar, "uniqueIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
        v40 = 138543362;
        v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Configuration complete UUID: %{public}@", (uint8_t *)&v40, 0xCu);

      }
      CAFSignpostEmit_InstantOn();
    }
    else
    {
      if (v18)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CAFCarConfiguration pluginConfigs](self->_currentCar, "pluginConfigs"));
        v25 = objc_msgSend(v24, "count");
        v26 = -[CAFCarConfiguration pluginCount](self->_currentCar, "pluginCount");
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CAFCarConfiguration uniqueIdentifier](self->_currentCar, "uniqueIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
        v40 = 134349570;
        v41 = v25;
        v42 = 2050;
        v43 = v26;
        v44 = 2114;
        v45 = v28;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Configuration incomplete with %{public}ld of %{public}ld plugins configured UUID: %{public}@", (uint8_t *)&v40, 0x20u);

      }
      v29 = -[CAFDCarDataServiceAgent allowPartialConfiguration](self, "allowPartialConfiguration");
      if (!(_DWORD)v29)
      {
        v23 = 0;
        goto LABEL_16;
      }
    }
    v29 = objc_claimAutoreleasedReturnValue(-[CAFCarConfiguration pluginConfigs](self->_currentCar, "pluginConfigs"));
    v23 = (void *)v29;
LABEL_16:
    v31 = CAFDDataLogging(v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:].cold.2();

    os_unfair_lock_unlock(&self->_carLock);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent stateCaptureManager](self, "stateCaptureManager"));
    objc_msgSend(v33, "carConfigDidUpdate");

    v34 = objc_msgSend(v23, "count");
    if (v34)
    {
      v35 = CAFDLogging(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", CFSTR(", ")));
        v40 = 138543362;
        v41 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Updating remoteProxies configs [%{public}@]", (uint8_t *)&v40, 0xCu);

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent remoteProxies](self, "remoteProxies"));
      objc_msgSend(v39, "didUpdateConfig:", v23);

    }
    goto LABEL_22;
  }
  v21 = CAFGeneralLogging();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:].cold.1();

  os_unfair_lock_unlock(p_carLock);
  v23 = 0;
LABEL_22:

}

- (void)didReceiveUpdateFromPluginID:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__CAFDCarDataServiceAgent_didReceiveUpdateFromPluginID_values___block_invoke;
  block[3] = &unk_100030D38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __63__CAFDCarDataServiceAgent_didReceiveUpdateFromPluginID_values___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxies"));
  objc_msgSend(v2, "didUpdatePluginID:values:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didReceiveNotificationFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __79__CAFDCarDataServiceAgent_didReceiveNotificationFromPluginID_instanceID_value___block_invoke;
  v15[3] = &unk_100030D88;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __79__CAFDCarDataServiceAgent_didReceiveNotificationFromPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxies"));
  objc_msgSend(v2, "didNotifyPluginID:instanceID:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)didReceiveRequestFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_100030D60;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[4];
  int v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_10002D13D;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connections"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connections"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_2;
  v6[3] = &unk_100030F00;
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v12 = v16;
  v5 = v3;
  v10 = v5;
  v13 = v14;
  v11 = a1[8];
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3;
  v8[3] = &unk_100030ED8;
  v14 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = v3;
  v15 = *(_QWORD *)(a1 + 80);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 64);
  v7 = v3;
  objc_msgSend(v7, "didRequestPluginID:instanceID:value:withResponse:", v4, v5, v6, v8);

}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (!v6)
    {
      v16 = CAFDDataLogging(v7, v8);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_14;
    }
    v9 = v7;
    v10 = objc_msgSend(v6, "code");
    if (v10 != (id)9)
    {
      v18 = v10;
      v19 = CAFDDataLogging(v10, v11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_3();

      v21 = *(_QWORD *)(a1 + 64);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), v18, 0));
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

      goto LABEL_14;
    }
    if (!v9)
    {
      v12 = CAFDDataLogging(9, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_2();

      v14 = *(_QWORD *)(a1 + 64);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0));
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

LABEL_14:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));

}

- (void)didReceiveErrorFromPluginID:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  v8 = CAFDDataLogging(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CAFDCarDataServiceAgent didReceiveErrorFromPluginID:error:].cold.1();

}

- (void)sendToPluginID:(id)a3 payload:(id)a4 priority:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  CAFDCarDataServiceAgent *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent _getChannel:](self, "_getChannel:", v12));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "sendToPluginID:payload:withCompletion:", v10, v11, v13);
  }
  else
  {
    v16 = CAFDLogging(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543874;
      v20 = self;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Send vehicle data pluginID: %{public}@ with priority: %{public}@ failed due to missing channel", (uint8_t *)&v19, 0x20u);
    }

    if (v13)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 1, 0));
      v13[2](v13, v18);

    }
  }

}

- (unint64_t)pluginCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataClients](self, "carDataClients"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)registrationsForPluginID:(id)a3
{
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v21 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent connections](self, "connections"));
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "registrationsForPluginID:", v21));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12));

              if (!v13)
              {
                v14 = objc_opt_new(NSMutableArray);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v12);

              }
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v16, "processIdentifier")));
              objc_msgSend(v15, "addObject:", v17);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

        v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

  return v4;
}

- (id)valuesForPluginID:(unint64_t)a3 iids:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataClients](self, "carDataClients"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cachedValueForInstanceID:", v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[4];
  NSObject *v20;
  CAFDCarDataServiceAgent *v21;
  uint8_t buf[4];
  id v23;

  v5 = a4;
  v6 = CAFDLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.caraccessoryframework.cardata")) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carp")));
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      v12 = CAFDLogging(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Receiving Connection Service: %{public}@", buf, 0xCu);
      }

      v14 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke;
      v19[3] = &unk_100030CE8;
      v20 = v5;
      v21 = self;
      dispatch_async(v14, v19);

      v15 = 1;
      v16 = v20;
      goto LABEL_12;
    }
  }
  else
  {

  }
  v17 = CAFDLogging(v11);
  v16 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Receiving unknown connection: %{public}@", buf, 0xCu);
  }
  v15 = 0;
LABEL_12:

  return v15;
}

void __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  _CAFdConnectionProxy *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v2 = -[_CAFdConnectionProxy initWithConnection:agent:]([_CAFdConnectionProxy alloc], "initWithConnection:agent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = CAFDDataLogging(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke_cold_1();

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connections"));
  objc_msgSend(v6, "addObject:", v2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteProxies"));
  objc_msgSend(v7, "addObserver:", v2);

}

- (void)_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CAFDCarDataServiceAgent *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__CAFDCarDataServiceAgent__removeConnection___block_invoke;
  v7[3] = &unk_100030CE8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__CAFDCarDataServiceAgent__removeConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = CAFDDataLogging(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __45__CAFDCarDataServiceAgent__removeConnection___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connections"));
  objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 32));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteProxies"));
  objc_msgSend(v12, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)_addRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent _getClient:](self, "_getClient:", v10));
  v16 = CAFDDataLogging(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2050;
      v25 = objc_msgSend(v11, "count");
      v26 = 2114;
      v27 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Add registartion pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v14, "registerInstanceIDs:priority:withResponse:", v11, v12, v13);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CAFDCarDataServiceAgent _addRegistration:instanceIDs:priority:withResponse:].cold.1();

    if (v13)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __78__CAFDCarDataServiceAgent__addRegistration_instanceIDs_priority_withResponse___block_invoke;
      block[3] = &unk_100030CC0;
      v21 = v13;
      dispatch_async(v19, block);

    }
  }

}

void __78__CAFDCarDataServiceAgent__addRegistration_instanceIDs_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc((Class)CAFResponse);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 2, 0));
  v3 = objc_msgSend(v2, "initWithError:", v4);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

- (void)_removeRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent connections](self, "connections"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke;
  v37[3] = &unk_100030F28;
  v16 = v10;
  v38 = v16;
  v17 = v14;
  v39 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v37);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent fastStartupRegistrations](self, "fastStartupRegistrations"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));

  if (v19)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
    objc_msgSend(v17, "removeObjectsInArray:", v22);

  }
  v23 = CAFDDataLogging(v20, v21);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v32 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 138543874;
    v41 = v16;
    v42 = 2050;
    v43 = v32;
    v44 = 2114;
    v45 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Remove registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x20u);
  }

  if (objc_msgSend(v17, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent _getClient:](self, "_getClient:", v16));
    v27 = v25;
    if (v25)
    {
      objc_msgSend(v25, "unregisterInstanceIDs:priority:withResponse:", v11, v12, v13);
    }
    else
    {
      v29 = CAFDDataLogging(0, v26);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[CAFDCarDataServiceAgent _removeRegistration:instanceIDs:priority:withResponse:].cold.1();

      if (v13)
      {
        v31 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_228;
        block[3] = &unk_100030CC0;
        v36 = v13;
        dispatch_async(v31, block);

      }
    }
    goto LABEL_14;
  }
  if (v13)
  {
    v28 = objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent workQueue](self, "workQueue"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_2;
    v33[3] = &unk_100030CC0;
    v34 = v13;
    dispatch_async(v28, v33);

    v27 = v34;
LABEL_14:

  }
}

void __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "registrationsForPluginID:", *(_QWORD *)(a1 + 32)));
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v10 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v7, "removeObjectsInArray:", v8);

    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    v6 = v10;
    if (!v9)
      *a3 = 1;
  }

}

void __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_228(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc((Class)CAFResponse);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 2, 0));
  v3 = objc_msgSend(v2, "initWithError:", v4);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValuesAndError:error:", 0, 0);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_getClient:(id)a3
{
  id v4;
  os_unfair_lock_s *p_channelLock;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = objc_msgSend(a3, "unsignedIntegerValue");
    p_channelLock = &self->_channelLock;
    os_unfair_lock_lock(&self->_channelLock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataClients](self, "carDataClients"));
    v7 = objc_msgSend(v6, "count");

    if (v4 >= v7)
    {
      v9 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataClients](self, "carDataClients"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v4));

    }
    os_unfair_lock_unlock(p_channelLock);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_getChannel:(id)a3
{
  _UNKNOWN **v5;
  os_unfair_lock_s *p_channelLock;
  _UNKNOWN **v7;
  id v8;
  void *v9;
  void *v10;

  v5 = &off_100031CF8;
  if (a3)
    v5 = (_UNKNOWN **)a3;
  p_channelLock = &self->_channelLock;
  v7 = v5;
  v8 = a3;
  os_unfair_lock_lock(p_channelLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDCarDataServiceAgent carDataChannels](self, "carDataChannels"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  os_unfair_lock_unlock(p_channelLock);
  return v10;
}

- (os_unfair_lock_s)channelLock
{
  return self->_channelLock;
}

- (void)setChannelLock:(os_unfair_lock_s)a3
{
  self->_channelLock = a3;
}

- (os_unfair_lock_s)carLock
{
  return self->_carLock;
}

- (void)setCarLock:(os_unfair_lock_s)a3
{
  self->_carLock = a3;
}

- (os_unfair_lock_s)assertionCounterLock
{
  return self->_assertionCounterLock;
}

- (void)setAssertionCounterLock:(os_unfair_lock_s)a3
{
  self->_assertionCounterLock = a3;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_osTransaction, a3);
}

- (NSMutableDictionary)carDataChannels
{
  return self->_carDataChannels;
}

- (void)setCarDataChannels:(id)a3
{
  objc_storeStrong((id *)&self->_carDataChannels, a3);
}

- (NSMutableArray)carDataClients
{
  return self->_carDataClients;
}

- (void)setCarDataClients:(id)a3
{
  objc_storeStrong((id *)&self->_carDataClients, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (int)carDataAvailableToken
{
  return self->_carDataAvailableToken;
}

- (void)setCarDataAvailableToken:(int)a3
{
  self->_carDataAvailableToken = a3;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (CARObserverHashTable)remoteProxies
{
  return self->_remoteProxies;
}

- (void)setRemoteProxies:(id)a3
{
  objc_storeStrong((id *)&self->_remoteProxies, a3);
}

- (unint64_t)assertionCount
{
  return self->_assertionCount;
}

- (void)setAssertionCount:(unint64_t)a3
{
  self->_assertionCount = a3;
}

- (NSMutableDictionary)fastStartupRegistrations
{
  return self->_fastStartupRegistrations;
}

- (void)setFastStartupRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_fastStartupRegistrations, a3);
}

- (CAFASCTree)ascTree
{
  return self->_ascTree;
}

- (BOOL)allowPartialConfiguration
{
  return self->_allowPartialConfiguration;
}

- (void)setAllowPartialConfiguration:(BOOL)a3
{
  self->_allowPartialConfiguration = a3;
}

- (BOOL)pluginConfigsRequested
{
  return self->_pluginConfigsRequested;
}

- (void)setPluginConfigsRequested:(BOOL)a3
{
  self->_pluginConfigsRequested = a3;
}

- (CAFDStateCaptureManager)stateCaptureManager
{
  return self->_stateCaptureManager;
}

- (void)setStateCaptureManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_ascTree, 0);
  objc_storeStrong((id *)&self->_fastStartupRegistrations, 0);
  objc_storeStrong((id *)&self->_remoteProxies, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_carDataClients, 0);
  objc_storeStrong((id *)&self->_carDataChannels, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_currentCar, 0);
}

- (void)initWithSessionStatus:(uint64_t)a3 config:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Created CarDataServiceAgent.  AllowPartialConfiguration: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Session channel setup failed type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Init car data channel END type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Data channel setup failed type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_mainQueue_initVehicleDataSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "No session configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_mainQueue_initVehicleDataSession:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "No vehicle data plugin count provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_mainQueue_initVehicleDataSession:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUIDString"));
  OUTLINED_FUNCTION_4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Car setup failed UUID: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_13();
}

- (void)_mainQueue_initVehicleDataSession:(NSObject *)a3 .cold.4(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a3, v8, "Init car UUID: %{public}@ name: %{public}@", v9);

  OUTLINED_FUNCTION_10();
}

- (void)_mainQueue_initVehicleDataSession:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Car data channel high setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_mainQueue_initVehicleDataSession:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Car data channel low setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_mainQueue_initVehicleDataSession:(NSObject *)a3 .cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleDataProtocolVersion"));
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a2;
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, a3, v7, "The accessory's protocol version: %{public}@ does not match with supported protocol version: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_10();
}

- (void)_mainQueue_initVehicleDataSession:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "No available certificate serial for session.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_observeAssertion:(void *)a1 .cold.1(void *a1, char *a2)
{
  uint8_t v3[24];

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)a2, OS_LOG_TYPE_FAULT, "Assertion counter incremented to %lu (crossed 1800)", v3, 0xCu);
  OUTLINED_FUNCTION_13();
}

- (void)_observeAssertion:(void *)a1 .cold.2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, v3, "Assertion counter incremented to %lu", v4);
  OUTLINED_FUNCTION_13();
}

- (void)assertion:(void *)a1 didInvalidateWithError:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, v3, "Assertion counter decremented to %lu", v4);
  OUTLINED_FUNCTION_13();
}

- (void)sessionDidConnect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Session connect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)sessionDidDisconnect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Session disconnect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "No connected session, finalize tear down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Session connected, no tear down needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)carDataChannelDidOpen:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Not all channels are open yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)carDataChannelDidOpen:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "All channels are open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)carDataChannelDidOpen:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Not all channels are initialized yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)carDataChannelDidOpen:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "carDataChannelDidOpen: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Channel not open: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_218_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Car data channels opened, but current car does not exist or has no plugins", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_219_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, a3, v7, "Request config for pluginID: %{public}@ failed with error: %{public}@", v8);

  OUTLINED_FUNCTION_10();
}

- (void)carDataChannelDidClose:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v1, (uint64_t)v1, "carDataChannelDidClose (done): %{public}@ remaining=%lu", v2);
  OUTLINED_FUNCTION_3();
}

- (void)carDataChannelDidClose:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "carDataChannelDidClose (start): %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)carDataChannelDidReceive:pluginID:payload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Received data message without client for pluginID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveConfigFromPluginID:config:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did receive config from pluginID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Received plugin configuration from pluginID: %{public}@, but current car does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Processed config from pluginID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Processing config from pluginID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, v1, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with value", v2);
  OUTLINED_FUNCTION_3();
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with last not handled error", v2);
  OUTLINED_FUNCTION_3();
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with error: %{public}@", v3, 0x20u);
}

- (void)didReceiveErrorFromPluginID:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, (uint64_t)v0, "Did receive error from pluginID: %{public}@ error: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

void __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Add connection %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__CAFDCarDataServiceAgent__removeConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Remove connection %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_addRegistration:instanceIDs:priority:withResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Add registration pluginID: %{public}@ failed due to missing plugin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_removeRegistration:instanceIDs:priority:withResponse:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, (uint64_t)v0, "Remove registration pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", v1);
  OUTLINED_FUNCTION_3();
}

@end
