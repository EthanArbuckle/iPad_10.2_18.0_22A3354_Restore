@implementation SDPairedDeviceAgent

+ (id)sharedAgent
{
  if (qword_1007C64D8 != -1)
    dispatch_once(&qword_1007C64D8, &stru_100714A20);
  return (id)qword_1007C64E0;
}

- (SDPairedDeviceAgent)init
{
  SDPairedDeviceAgent *v2;
  void *v3;
  uint64_t v4;
  SFBLEPipe *blePipe;
  void *v6;
  IDSService *v7;
  IDSService *idsService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDPairedDeviceAgent;
  v2 = -[SDXPCDaemon init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedNearbyPipe"));
    blePipe = v2->_blePipe;
    v2->_blePipe = (SFBLEPipe *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDPairedDeviceAgent _queueWithFallbackQOS](v2, "_queueWithFallbackQOS"));
    -[SDXPCDaemon setDispatchQueue:](v2, "setDispatchQueue:", v6);

    v7 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.sharing.paireddevice"));
    idsService = v2->_idsService;
    v2->_idsService = v7;

    v2->_lockStatePairedDevice = -1;
  }
  return v2;
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B0E4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_activate
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  IDSService *idsService;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = charging_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }

  if (self->_activateCalled)
  {
    v10 = charging_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Paired device agent already activated";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (self->_invalidateCalled)
  {
    v13 = charging_log();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Paired device agent activated after invalidate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_activateCalled = 1;
  idsService = self->_idsService;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  -[IDSService addDelegate:queue:](idsService, "addDelegate:queue:", self, v7);

  -[SDPairedDeviceAgent _systemStateRegisterObservers](self, "_systemStateRegisterObservers");
  -[SDPairedDeviceAgent _testingRegisterNotifications](self, "_testingRegisterNotifications");
  v15.receiver = self;
  v15.super_class = (Class)SDPairedDeviceAgent;
  -[SDXPCDaemon onqueue_activate](&v15, "onqueue_activate");
  v8 = dispatch_time(0, 5000000000);
  v9 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B2D8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_after(v8, v9, block);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B34C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_invalidate
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = charging_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }

  if (self->_invalidateCalled)
  {
    v6 = charging_log();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Paired device agent already invalidated";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (!self->_activateCalled)
  {
    v9 = charging_log();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Paired device agent invalidated before activate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_invalidateCalled = 1;
  -[SDPairedDeviceAgent _idsEnsureCoalescersStopped](self, "_idsEnsureCoalescersStopped");
  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  -[SDPairedDeviceAgent _systemStateUnregisterObservers](self, "_systemStateUnregisterObservers");
  v10.receiver = self;
  v10.super_class = (Class)SDPairedDeviceAgent;
  -[SDXPCDaemon onqueue_invalidate](&v10, "onqueue_invalidate");
}

- (id)_queueWithFallbackQOS
{
  dispatch_queue_attr_t initially_inactive;
  NSObject *v3;
  NSObject *v4;

  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v3 = objc_claimAutoreleasedReturnValue(initially_inactive);
  v4 = dispatch_queue_create("com.apple.sharing.PairedDeviceAgent", v3);

  dispatch_set_qos_class_fallback(v4, 25);
  dispatch_activate(v4);
  return v4;
}

- (void)_companionLinkEnable
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *companionLinkClient;
  void *v5;
  RPCompanionLinkClient *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = objc_opt_new(RPCompanionLinkClient);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v3;

  -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", v5);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003B6A4;
  v13[3] = &unk_100714A48;
  v13[4] = self;
  -[RPCompanionLinkClient setDeviceFoundHandler:](self->_companionLinkClient, "setDeviceFoundHandler:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B6AC;
  v12[3] = &unk_100714A48;
  v12[4] = self;
  -[RPCompanionLinkClient setDeviceLostHandler:](self->_companionLinkClient, "setDeviceLostHandler:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B6B4;
  v11[3] = &unk_100714A70;
  v11[4] = self;
  -[RPCompanionLinkClient setDeviceChangedHandler:](self->_companionLinkClient, "setDeviceChangedHandler:", v11);
  -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", &stru_100714A90);
  -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", &stru_100714AB0);
  v6 = self->_companionLinkClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003B73C;
  v10[3] = &unk_1007147C8;
  v10[4] = self;
  v7 = charging_log(-[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v10));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabling companion link", v9, 2u);
  }

}

- (void)_companionLinkDisable
{
  RPCompanionLinkClient *companionLinkClient;

  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

}

- (BOOL)_companionLinkConnected
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_companionLinkClient, "activeDevices"));
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Companion link connected devices %@", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_companionLinkClient, "activeDevices", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "statusFlags") & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v7;
}

- (void)_companionLinkDevicesChanged
{
  uint64_t v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  id chargingUIHandler;
  uint8_t v9[16];

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Companion link devices changed", v9, 2u);
  }

  v5 = -[SDPairedDeviceAgent _companionLinkConnected](self, "_companionLinkConnected");
  if (v5 && self->_chargingUIHandler)
  {
    v6 = charging_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10004035C();

    (*((void (**)(void))self->_chargingUIHandler + 2))();
    chargingUIHandler = self->_chargingUIHandler;
    self->_chargingUIHandler = 0;

  }
}

- (id)_idsActiveDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isActive"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_idsEnsureCoalescersStarted
{
  NSObject *v3;
  CUCoalescer *v4;
  CUCoalescer *idsConnectionCoalescer;
  void *v6;
  CUCoalescer *v7;
  CUCoalescer *idsSyncCoalescer;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  if (!self->_idsConnectionCoalescer)
  {
    v4 = objc_opt_new(CUCoalescer);
    idsConnectionCoalescer = self->_idsConnectionCoalescer;
    self->_idsConnectionCoalescer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
    -[CUCoalescer setDispatchQueue:](self->_idsConnectionCoalescer, "setDispatchQueue:", v6);

    -[CUCoalescer setMinDelay:](self->_idsConnectionCoalescer, "setMinDelay:", 0.5);
    -[CUCoalescer setMaxDelay:](self->_idsConnectionCoalescer, "setMaxDelay:", 3.0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003BCA8;
    v11[3] = &unk_1007146D8;
    v11[4] = self;
    -[CUCoalescer setActionHandler:](self->_idsConnectionCoalescer, "setActionHandler:", v11);
    -[CUCoalescer trigger](self->_idsConnectionCoalescer, "trigger");
  }
  if (!self->_idsSyncCoalescer)
  {
    v7 = objc_opt_new(CUCoalescer);
    idsSyncCoalescer = self->_idsSyncCoalescer;
    self->_idsSyncCoalescer = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
    -[CUCoalescer setDispatchQueue:](self->_idsSyncCoalescer, "setDispatchQueue:", v9);

    -[CUCoalescer setMinDelay:](self->_idsSyncCoalescer, "setMinDelay:", 0.3);
    -[CUCoalescer setMaxDelay:](self->_idsSyncCoalescer, "setMaxDelay:", 3.0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003BD18;
    v10[3] = &unk_1007146D8;
    v10[4] = self;
    -[CUCoalescer setActionHandler:](self->_idsSyncCoalescer, "setActionHandler:", v10);
  }
}

- (void)_idsEnsureCoalescersStopped
{
  CUCoalescer *idsConnectionCoalescer;
  CUCoalescer *idsSyncCoalescer;

  -[CUCoalescer invalidate](self->_idsConnectionCoalescer, "invalidate");
  idsConnectionCoalescer = self->_idsConnectionCoalescer;
  self->_idsConnectionCoalescer = 0;

  -[CUCoalescer invalidate](self->_idsSyncCoalescer, "invalidate");
  idsSyncCoalescer = self->_idsSyncCoalescer;
  self->_idsSyncCoalescer = 0;

}

- (void)_idsEnsureSynced
{
  NSMutableDictionary *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v4);

  if (!self->_powerSourcePairedDevice || self->_infoRequestForced)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_10074B2B0, CFSTR("met"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("rin"));
  }
  if (-[NSMutableDictionary count](v3, "count"))
  {
    -[SDPairedDeviceAgent _idsSendStateUpdate:asWaking:](self, "_idsSendStateUpdate:asWaking:", v3, 0);
  }
  else
  {
    v5 = charging_log(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No changes skipping sync", v7, 2u);
    }

  }
  self->_infoRequestForced = 0;

}

- (BOOL)_idsHasDefaultDevice
{
  void *v2;
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isDefaultPairedDevice");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)_idsSendStateUpdate:(id)a3 asWaking:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t isKindOfClass;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  IDSService *idsService;
  unsigned int v29;
  char *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  int v47;
  uint8_t buf[4];
  const char *v49;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
  v8 = -[SDPairedDeviceAgent _idsHasDefaultDevice](self, "_idsHasDefaultDevice");
  v9 = objc_opt_new(NSMutableDictionary);
  v47 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v10);

  v12 = charging_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "no";
    if (v8)
      v14 = "yes";
    *(_DWORD *)buf = 136315138;
    v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Default paired device: %s", buf, 0xCu);
  }

  if (v8)
  {
    v16 = objc_opt_class(NSDictionary, v15);
    isKindOfClass = objc_opt_isKindOfClass(v6, v16);
    if ((isKindOfClass & 1) == 0)
    {
      v35 = charging_log(isKindOfClass);
      v19 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        sub_10004047C((uint64_t)v6, v19);
      goto LABEL_17;
    }
    v18 = OPACKEncoderCreateData(v6, 0, &v47);
    v19 = v18;
    if (v47)
    {
      v36 = charging_log(v18);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_100040414((uint64_t)&v47, v37, v38, v39, v40, v41, v42, v43);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("met")));
      if (v20)
      {
        v21 = v20;
        v22 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v19, (unsigned __int16)objc_msgSend(v20, "unsignedIntegerValue"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v23, IDSSendMessageOptionTimeoutKey);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("com.apple.sharing.DeviceStateUpdate"), IDSSendMessageOptionQueueOneIdentifierKey);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", !v4));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v24, IDSSendMessageOptionNonWakingKey);

        v26 = charging_log(v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending state update %@", buf, 0xCu);
        }

        idsService = self->_idsService;
        v45 = 0;
        v46 = 0;
        v29 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](idsService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v22, v7, 300, v9, &v46, &v45);
        v30 = (char *)v46;
        v31 = v45;
        v32 = charging_log(v31);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        v34 = v33;
        if (v29)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v30;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "State update IDS message identifier: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          sub_1000403B4();
        }

        v19 = v31;
        goto LABEL_17;
      }
      v44 = charging_log(0);
      v37 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_100040388();
    }

LABEL_17:
  }

}

- (void)_idsTimerInfoRestart
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_source *idsInfoTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting IDS info timer", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  idsInfoTimer = self->_idsInfoTimer;
  if (!idsInfoTimer)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
    v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
    v9 = self->_idsInfoTimer;
    self->_idsInfoTimer = v8;

    v10 = self->_idsInfoTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003C528;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    SFDispatchTimerSet(self->_idsInfoTimer, 2147483650.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_idsInfoTimer);
    idsInfoTimer = self->_idsInfoTimer;
  }
  SFDispatchTimerSet(idsInfoTimer, 4.0, -1.0, -4.0);
}

- (void)_idsTimerInfoFired
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDS info timer fired", v6, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  self->_infoRequestForced = 1;
  -[SDPairedDeviceAgent _idsTriggerSync](self, "_idsTriggerSync");
  -[SDPairedDeviceAgent _idsTimerInfoInvalidate](self, "_idsTimerInfoInvalidate");
}

- (void)_idsTimerInfoInvalidate
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *idsInfoTimer;
  OS_dispatch_source *v7;
  uint8_t v8[16];

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating IDS info timer", v8, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  idsInfoTimer = self->_idsInfoTimer;
  if (idsInfoTimer)
  {
    dispatch_source_cancel(idsInfoTimer);
    v7 = self->_idsInfoTimer;
    self->_idsInfoTimer = 0;

  }
}

- (void)_idsTriggerSync
{
  -[SDPairedDeviceAgent _idsTriggerSyncForAnimation:](self, "_idsTriggerSyncForAnimation:", 0);
}

- (void)_idsTriggerSyncForAnimation:(BOOL)a3
{
  NSNumber *animationMessageID;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!a3)
  {
    animationMessageID = self->_animationMessageID;
    if (animationMessageID)
    {
      v5 = charging_log(self);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing message ID", v7, 2u);
      }

      animationMessageID = self->_animationMessageID;
    }
    self->_animationMessageID = 0;

  }
  -[CUCoalescer trigger](self->_idsSyncCoalescer, "trigger");
}

- (void)_idsUpdateConnectedState
{
  SDPairedDeviceAgent *v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  const char *v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  dispatch_time_t v31;
  NSObject *v32;
  SFPowerSource *powerSourcePairedDevice;
  SFPowerSource *v34;
  IDSDevice *v35;
  NSObject *idsConnectedDevice;
  uint64_t v37;
  SDPairedDeviceAgent *v38;
  id obj;
  _QWORD block[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  _BYTE v53[128];

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[IDSService devices](v2->_idsService, "devices"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  v5 = v4;
  if (v4)
  {
    v38 = v2;
    v6 = *(_QWORD *)v42;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v7);
        v9 = charging_log(v4);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
          if (objc_msgSend(v8, "isActive"))
            v12 = "yes";
          else
            v12 = "no";
          if (objc_msgSend(v8, "isConnected"))
            v13 = "yes";
          else
            v13 = "no";
          v14 = objc_msgSend(v8, "isNearby");
          *(_DWORD *)buf = 138413058;
          if (v14)
            v15 = "yes";
          else
            v15 = "no";
          v46 = v11;
          v47 = 2080;
          v48 = v12;
          v49 = 2080;
          v50 = v13;
          v51 = 2080;
          v52 = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking connection state for device %@, active %s, connected %s, nearby %s", buf, 0x2Au);

        }
        v4 = objc_msgSend(v8, "isActive");
        if ((_DWORD)v4)
        {
          if ((objc_msgSend(v8, "isConnected") & 1) != 0
            || (v4 = objc_msgSend(v8, "isNearby"), (_DWORD)v4))
          {
            v5 = v8;
            goto LABEL_24;
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
LABEL_24:
    v2 = v38;
  }

  v17 = charging_log(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIDOverride"));
    v20 = (char *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](v2->_idsConnectedDevice, "uniqueIDOverride"));
    *(_DWORD *)buf = 138412546;
    v46 = v19;
    v47 = 2112;
    v48 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "New connected device ID %@, previous connected device ID %@", buf, 0x16u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIDOverride"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](v2->_idsConnectedDevice, "uniqueIDOverride"));
  v23 = v21;
  v24 = v22;
  if (v23 == v24)
  {

    goto LABEL_44;
  }
  v25 = v24;
  if ((v23 == 0) == (v24 != 0))
  {

  }
  else
  {
    v26 = objc_msgSend(v23, "isEqual:", v24);

    if ((v26 & 1) != 0)
    {
LABEL_44:
      v37 = charging_log(v27);
      idsConnectedDevice = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(idsConnectedDevice, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, idsConnectedDevice, OS_LOG_TYPE_DEFAULT, "No change for connected IDS device", buf, 2u);
      }
      goto LABEL_42;
    }
  }
  v28 = charging_log(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Paired device connected", buf, 2u);
    }

    v31 = dispatch_time(0, 10000000000);
    v32 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](v2, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CBDC;
    block[3] = &unk_1007146D8;
    block[4] = v2;
    dispatch_after(v31, v32, block);

  }
  else
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Paired device disconnected, clearing device state", buf, 2u);
    }

    -[SDPairedDeviceAgent _lockStateUpdate:](v2, "_lockStateUpdate:", 0xFFFFFFFFLL);
    powerSourcePairedDevice = v2->_powerSourcePairedDevice;
    if (powerSourcePairedDevice)
    {
      -[SFPowerSource invalidate](powerSourcePairedDevice, "invalidate");
      -[SDPairedDeviceAgent _nanoRegistryUnregisterChanges](v2, "_nanoRegistryUnregisterChanges");
      v34 = v2->_powerSourcePairedDevice;
      v2->_powerSourcePairedDevice = 0;

    }
    -[SDPairedDeviceAgent _wristStateUpdate:](v2, "_wristStateUpdate:", 0);
  }
  v35 = (IDSDevice *)v5;
  idsConnectedDevice = v2->_idsConnectedDevice;
  v2->_idsConnectedDevice = v35;
LABEL_42:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v19);

  v21 = charging_log(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = "no";
    v24 = 138413570;
    v25 = v14;
    v26 = 2112;
    if (v10)
      v23 = "yes";
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2080;
    v31 = v23;
    v32 = 2112;
    v33 = v17;
    v34 = 2112;
    v35 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sent IDS message (service %@, account %@, identifier %@, success %s, error %@, context %@)", (uint8_t *)&v24, 0x3Eu);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v17);

  v19 = charging_log(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "outgoingResponseIdentifier"));
    v23 = 138413314;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Incoming IDS message (service %@, account %@, protobuf %@, fromID %@, identifier %@)", (uint8_t *)&v23, 0x34u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
  -[SDPairedDeviceAgent _messageHandleIncomingData:](self, "_messageHandleIncomingData:", v22);

}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = charging_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS connected devices changed on service %@", (uint8_t *)&v8, 0xCu);
  }

  -[CUCoalescer trigger](self->_idsConnectionCoalescer, "trigger");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = charging_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS devices changed on service %@", (uint8_t *)&v8, 0xCu);
  }

  -[CUCoalescer trigger](self->_idsConnectionCoalescer, "trigger");
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = charging_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS nearby devices changed on service %@", (uint8_t *)&v8, 0xCu);
  }

  -[CUCoalescer trigger](self->_idsConnectionCoalescer, "trigger");
}

- (int)lockState
{
  return self->_lockStatePairedDevice;
}

- (void)_lockStateChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = charging_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100040508();

  v6 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D21C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_lockStateHandleMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lst")));
  if (v6)
  {
    v7 = objc_msgSend(v6, "intValue");
    if ((v7 & 0x80000000) != 0)
    {
      v8 = charging_log(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Invalid lock state in update", v10, 2u);
      }

    }
    else
    {
      -[SDPairedDeviceAgent _lockStateUpdate:](self, "_lockStateUpdate:", v7);
    }
  }

}

- (void)_lockStateUpdate:(int)a3
{
  NSObject *v5;
  int lockStatePairedDevice;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  lockStatePairedDevice = self->_lockStatePairedDevice;
  self->_lockStatePairedDevice = a3;
  if (lockStatePairedDevice != a3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    objc_msgSend(v7, "updatePairedWatchLockState:", self->_lockStatePairedDevice);

  }
}

- (void)_messageHandleIncomingData:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t isKindOfClass;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;

  v4 = a3;
  v27 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v7 = OPACKDecodeData(v4, 0, &v27);
    v9 = (__CFString *)v7;
    if (v27)
    {
      v17 = charging_log(v7);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100040698((uint64_t)&v27, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      v10 = objc_opt_class(NSDictionary, v8);
      isKindOfClass = objc_opt_isKindOfClass(v9, v10);
      if ((isKindOfClass & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("met")));
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(v12, "integerValue");
          if (v14 == (id)5)
          {
            -[SDPairedDeviceAgent _messageHandleDashboardEntry:](self, "_messageHandleDashboardEntry:", v9);
          }
          else if (v14 == (id)4)
          {
            -[SDPairedDeviceAgent _messageHandlePowerSourceUpdate:](self, "_messageHandlePowerSourceUpdate:", v9);
          }
          else if (v14 == (id)1)
          {
            -[SDPairedDeviceAgent _messageHandleAllUpdate:](self, "_messageHandleAllUpdate:", v9);
          }
          goto LABEL_11;
        }
        v26 = charging_log(0);
        v18 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100040560();
      }
      else
      {
        v25 = charging_log(isKindOfClass);
        v18 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          sub_1000405C0(v9, v18);
      }
    }

    v13 = 0;
    goto LABEL_11;
  }
  v15 = charging_log(v6);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100040534();

  v13 = 0;
  v9 = 0;
LABEL_11:

}

- (void)_messageHandleAllUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pad")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rin")));
  v7 = objc_msgSend(v6, "BOOLValue");

  v9 = charging_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating all values: %@", (uint8_t *)&v19, 0xCu);
  }

  v11 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v11);

  if (!self->_animationDateReceived || (v12 = objc_msgSend(v5, "timeIntervalSinceDate:"), v13 > 0.0))
  {
    v14 = charging_log(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Animation date received over IDS: %@", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)&self->_animationDateReceived, v5);
  }
  -[SDPairedDeviceAgent _idsTimerInfoInvalidate](self, "_idsTimerInfoInvalidate");
  -[SDPairedDeviceAgent _lockStateHandleMessage:](self, "_lockStateHandleMessage:", v4);
  -[SDPairedDeviceAgent _powerSourceUpdatePairedDeviceInfo:](self, "_powerSourceUpdatePairedDeviceInfo:", v4);
  v16 = -[SDPairedDeviceAgent _wristStateHandleMessage:](self, "_wristStateHandleMessage:", v4);
  if (v7)
  {
    v17 = charging_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending update for request", (uint8_t *)&v19, 2u);
    }

    -[SDPairedDeviceAgent _idsTriggerSync](self, "_idsTriggerSync");
  }

}

- (void)_messageHandlePowerSourceUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = charging_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Power source update: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v7);

  -[SDPairedDeviceAgent _idsTimerInfoInvalidate](self, "_idsTimerInfoInvalidate");
  -[SDPairedDeviceAgent _powerSourceUpdatePairedDeviceInfo:](self, "_powerSourceUpdatePairedDeviceInfo:", v4);

}

- (void)_messageHandleDashboardEntry:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = charging_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSPrintF("%##@", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dashboard entry: %@", buf, 0xCu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dae")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dan")));

  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dae")));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dad")));

    if (v14)
    {
      SFMetricsLog(v11, v14);
    }
    else
    {
      v17 = charging_log(v15);
      v14 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10004072C();
    }
  }
  else
  {
    v16 = charging_log(v12);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100040700();
  }

}

- (id)_messageFromPowerSource:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("pis"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "adapterFamilyCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, CFSTR("pat"));

  objc_msgSend(v3, "chargeLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("pcl"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "charging")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("pic"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "adapterSourceID")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("pmd"));

  objc_msgSend(v3, "maxCapacity");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("pmx"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "adapterSharedSource")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("pss"));

  v11 = objc_msgSend(v3, "temperature");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("ptm"));

  return v4;
}

- (void)_messageIDAdd:(id)a3
{
  id v4;
  NSMutableArray *messageIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  messageIDs = self->_messageIDs;
  if (!messageIDs)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_messageIDs;
    self->_messageIDs = v6;

    messageIDs = self->_messageIDs;
  }
  v8 = charging_log(-[NSMutableArray addObject:](messageIDs, "addObject:", v4));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v4, "unsignedLongValue");
    v11 = -[NSMutableArray count](self->_messageIDs, "count");
    v12 = 134218240;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Added message ID: %lu count: %ld", (uint8_t *)&v12, 0x16u);
  }

  if ((unint64_t)-[NSMutableArray count](self->_messageIDs, "count") >= 0x15)
  {
    do
      -[NSMutableArray removeObjectAtIndex:](self->_messageIDs, "removeObjectAtIndex:", 0);
    while ((unint64_t)-[NSMutableArray count](self->_messageIDs, "count") > 0x14);
  }

}

- (void)_messageIDRemove:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_messageIDs, "containsObject:", v4);
  if ((v5 & 1) == 0)
  {
    v6 = charging_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100040758(v4, v7);

  }
  v8 = charging_log(-[NSMutableArray removeObject:](self->_messageIDs, "removeObject:", v4));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v4, "unsignedLongValue");
    v11 = -[NSMutableArray count](self->_messageIDs, "count");
    v12 = 134218240;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removed message ID: %lu, count: %ld", (uint8_t *)&v12, 0x16u);
  }

}

- (void)_nanoRegistryRegisterChangesForDevice:(id)a3
{
  id v4;
  SFPowerSource *v5;
  NSMutableDictionary *nrRegisteredDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  SFPowerSource *powerSourcePairedDevice;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  uint8_t buf[4];
  SFPowerSource *v29;

  v4 = a3;
  v5 = (SFPowerSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertyPairingID));
  if (!v5)
  {
    v16 = charging_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000407D4(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_13;
  }
  nrRegisteredDevices = self->_nrRegisteredDevices;
  if (!nrRegisteredDevices)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v8 = self->_nrRegisteredDevices;
    self->_nrRegisteredDevices = v7;

    nrRegisteredDevices = self->_nrRegisteredDevices;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](nrRegisteredDevices, "allKeys"));
  v10 = objc_msgSend(v9, "containsObject:", v5);

  if (v10)
  {
    v25 = charging_log(v11);
    v17 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Already registered %@", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_8;
  }
  v12 = charging_log(-[SDPairedDeviceAgent _nanoRegistryUnregisterChanges](self, "_nanoRegistryUnregisterChanges"));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    powerSourcePairedDevice = self->_powerSourcePairedDevice;
    *(_DWORD *)buf = 138412290;
    v29 = powerSourcePairedDevice;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registered for name change for %@", buf, 0xCu);
  }

  v27 = NRDevicePropertyName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003E04C;
  v26[3] = &unk_100714AD8;
  v26[4] = self;
  objc_msgSend(v4, "registerForPropertyChanges:withBlock:", v15, v26);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nrRegisteredDevices, "setObject:forKeyedSubscript:", v4, v5);
LABEL_8:

}

- (void)_nanoRegistryUnregisterChanges
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_nrRegisteredDevices, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "unregisterForPropertyChanges:withBlock:", 0, 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v8 = charging_log(-[NSMutableDictionary removeAllObjects](self->_nrRegisteredDevices, "removeAllObjects"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unregistered for name changes", v10, 2u);
  }

}

- (SFPowerSource)powerSource
{
  SDPairedDeviceAgent *v2;
  SFPowerSource *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_powerSource;
  objc_sync_exit(v2);

  return v3;
}

- (void)_powerSourceChanged:(id)a3
{
  id v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id chargingUIHandler;
  NSDate *animationDateToSend;
  NSDate *animationDateForIDS;
  NSDictionary *v22;
  NSDictionary *powerSourceMessage;
  _BOOL8 v24;
  SFPowerSource **p_powerSourceLocal;
  SDPairedDeviceAgent *v26;
  NSDictionary *v27;
  NSDictionary *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[22];
  __int16 v33;
  const char *v34;

  v5 = a3;
  v6 = -[SDPairedDeviceAgent _companionLinkConnected](self, "_companionLinkConnected");
  v7 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("InternalBattery"));

  if (v9)
  {
    v11 = charging_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailedDescription"));
      v14 = (void *)v13;
      v15 = "no";
      *(_DWORD *)v32 = 138412802;
      *(_QWORD *)&v32[4] = v5;
      if (v6)
        v15 = "yes";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v13;
      v33 = 2080;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local power source updated %@, IOPS details %@ link connected %s", v32, 0x20u);

    }
    v16 = objc_msgSend(v5, "charging");
    if ((v16 & 1) == 0)
    {
      if (self->_chargingUIHandler)
      {
        v17 = charging_log(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Device went off charger while waiting for UI reply", v32, 2u);
        }

        (*((void (**)(void))self->_chargingUIHandler + 2))();
        chargingUIHandler = self->_chargingUIHandler;
        self->_chargingUIHandler = 0;

      }
      animationDateToSend = self->_animationDateToSend;
      self->_animationDateToSend = 0;

      animationDateForIDS = self->_animationDateForIDS;
      self->_animationDateForIDS = 0;

    }
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[SDPairedDeviceAgent _messageFromPowerSource:](self, "_messageFromPowerSource:", v5, *(_OWORD *)v32));
    powerSourceMessage = self->_powerSourceMessage;
    if (powerSourceMessage
      && (v24 = -[NSDictionary isEqualToDictionary:](powerSourceMessage, "isEqualToDictionary:", v22)))
    {
      v30 = charging_log(v24);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Power source values we care about didn't change", v32, 2u);
      }

    }
    else
    {
      p_powerSourceLocal = &self->_powerSourceLocal;
      objc_storeStrong((id *)&self->_powerSourceLocal, a3);
      v26 = self;
      objc_sync_enter(v26);
      objc_storeStrong((id *)&v26->_powerSource, self->_powerSourceLocal);
      objc_sync_exit(v26);

      v27 = self->_powerSourceMessage;
      self->_powerSourceMessage = v22;
      v28 = v22;

      v26->_powerSourceWasCharging = objc_msgSend(v5, "charging");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      objc_msgSend(v29, "updateLocalPowerSource:", *p_powerSourceLocal);

      -[SDPairedDeviceAgent _idsTriggerSyncForAnimation:](v26, "_idsTriggerSyncForAnimation:", 0);
    }

  }
}

- (void)_powerSourceLost:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  SFPowerSource *powerSourceLocal;
  NSDictionary *powerSourceMessage;
  uint8_t v12[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("InternalBattery"));

  if ((_DWORD)v4)
  {
    v8 = charging_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Internal power source lost", v12, 2u);
    }

    powerSourceLocal = self->_powerSourceLocal;
    self->_powerSourceLocal = 0;

    powerSourceMessage = self->_powerSourceMessage;
    self->_powerSourceMessage = 0;

    self->_powerSourceWasCharging = 0;
  }
}

- (void)_powerSourceUpdatePairedDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  SFPowerSource *powerSourcePairedDevice;
  SFPowerSource *v38;
  SFPowerSource *v39;
  SFPowerSource *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  const __CFString *v48;
  SFPowerSource *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  uint32_t v57;
  uint64_t v58;
  unsigned int v59;
  id v60;
  void *v61;
  void *v62;
  signed int v63;
  void *v64;
  unsigned int v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  SFPowerSource *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getActivePairedDevice"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pat")));
  v8 = objc_msgSend(v7, "intValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcl")));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pic")));
  v65 = objc_msgSend(v12, "BOOLValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pmx")));
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pss")));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pmd")));
  v19 = objc_msgSend(v18, "integerValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ptm")));
  v21 = objc_msgSend(v20, "integerValue");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pml")));
  v23 = objc_msgSend(v22, "BOOLValue");

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lpm")));
  v25 = objc_msgSend(v24, "BOOLValue");

  v26 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pis")));
  v28 = v27;
  if (!v27)
  {
    v53 = charging_log(0);
    v31 = objc_claimAutoreleasedReturnValue(v53);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v54 = "Update missing power info set number";
    goto LABEL_30;
  }
  v29 = objc_msgSend(v27, "BOOLValue");
  if ((v29 & 1) == 0)
  {
    v55 = charging_log(v29);
    v31 = objc_claimAutoreleasedReturnValue(v55);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v54 = "Power info not set in update";
LABEL_30:
    v56 = v31;
    v57 = 2;
    goto LABEL_33;
  }
  v63 = v8;
  v30 = sub_1000CE8D0(CFSTR("EnableWatchUI"), 1);
  if (!(_DWORD)v30)
  {
    v58 = charging_log(v30);
    v31 = objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 67109120;
    LODWORD(v67) = v63;
    v54 = "Suppressing watch power source %d";
    v56 = v31;
    v57 = 8;
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, v54, buf, v57);
    goto LABEL_25;
  }
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pai")));
  if (-[NSMutableArray containsObject:](self->_messageIDs, "containsObject:", v31))
  {
    v32 = charging_log(-[SDPairedDeviceAgent _messageIDRemove:](self, "_messageIDRemove:", v31));
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v67 = (const __CFString *)-[NSObject unsignedLongValue](v31, "unsignedLongValue");
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Duping messages, not updating: %lu", buf, 0xCu);
    }

  }
  else
  {
    v60 = v21;
    v34 = v17;
    v62 = v28;
    if (v31)
      -[SDPairedDeviceAgent _messageIDAdd:](self, "_messageIDAdd:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", _NRDevicePropertyBluetoothIdentifier));
    v59 = -[SFPowerSource charging](self->_powerSourcePairedDevice, "charging");
    v36 = v6;
    powerSourcePairedDevice = self->_powerSourcePairedDevice;
    v38 = powerSourcePairedDevice;
    if (!powerSourcePairedDevice)
    {
      v39 = objc_opt_new(SFPowerSource);
      v40 = self->_powerSourcePairedDevice;
      self->_powerSourcePairedDevice = v39;

      v38 = self->_powerSourcePairedDevice;
    }
    -[SFPowerSource setAccessoryCategory:](v38, "setAccessoryCategory:", CFSTR("Watch"));
    -[SFPowerSource setLowWarnLevel:](self->_powerSourcePairedDevice, "setLowWarnLevel:", 10.0);
    -[SFPowerSource setLowPowerModeEnabled:](self->_powerSourcePairedDevice, "setLowPowerModeEnabled:", v25);
    v61 = v35;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
    -[SFPowerSource setAccessoryID:](self->_powerSourcePairedDevice, "setAccessoryID:", v41);

    -[SFPowerSource setAdapterFamilyCode:](self->_powerSourcePairedDevice, "setAdapterFamilyCode:", v63);
    -[SFPowerSource setAdapterSharedSource:](self->_powerSourcePairedDevice, "setAdapterSharedSource:", v34);
    -[SFPowerSource setAdapterSourceID:](self->_powerSourcePairedDevice, "setAdapterSourceID:", v19);
    -[SFPowerSource setCharging:](self->_powerSourcePairedDevice, "setCharging:", v65);
    -[SFPowerSource setChargeLevel:](self->_powerSourcePairedDevice, "setChargeLevel:", v11);
    -[SFPowerSource setMaxCapacity:](self->_powerSourcePairedDevice, "setMaxCapacity:", v15);
    -[SFPowerSource setTemperature:](self->_powerSourcePairedDevice, "setTemperature:", v60);
    -[SFPowerSource setType:](self->_powerSourcePairedDevice, "setType:", CFSTR("Accessory Source"));
    if (v65)
      v42 = CFSTR("AC Power");
    else
      v42 = CFSTR("Battery Power");
    -[SFPowerSource setState:](self->_powerSourcePairedDevice, "setState:", v42);
    -[SFPowerSource setTransportType:](self->_powerSourcePairedDevice, "setTransportType:", CFSTR("Bluetooth"));
    -[SFPowerSource setVendorID:](self->_powerSourcePairedDevice, "setVendorID:", 76);
    v64 = v36;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "valueForProperty:", NRDevicePropertyName));
    -[SFPowerSource setName:](self->_powerSourcePairedDevice, "setName:", v43);

    kdebug_trace(725287096, 0, 0, 0, 0);
    v44 = -[SFPowerSource publish](self->_powerSourcePairedDevice, "publish");
    v45 = (int)v44;
    v46 = charging_log(v44);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      if (powerSourcePairedDevice)
        v48 = CFSTR("Updated");
      else
        v48 = CFSTR("Created");
      v49 = self->_powerSourcePairedDevice;
      v50 = objc_claimAutoreleasedReturnValue(-[SFPowerSource detailedDescription](v49, "detailedDescription"));
      v51 = (void *)v50;
      *(_DWORD *)buf = 138413314;
      v52 = "no";
      v67 = v48;
      v68 = 2112;
      if (v65 != v59)
        v52 = "yes";
      v69 = v49;
      v70 = 2112;
      v71 = v50;
      v72 = 2080;
      v73 = v52;
      v74 = 1024;
      v75 = v45;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@ paired device power source %@\n%@charging changed %s, status %x", buf, 0x30u);

    }
    if (v23)
      -[SDPairedDeviceAgent _postPowerStatusNotificationForPowerSource:](self, "_postPowerStatusNotificationForPowerSource:", self->_powerSourcePairedDevice);
    v6 = v64;
    -[SDPairedDeviceAgent _nanoRegistryRegisterChangesForDevice:](self, "_nanoRegistryRegisterChangesForDevice:", v64);

    v28 = v62;
  }
LABEL_25:

}

- (void)_systemStateRegisterObservers
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  -[SDPairedDeviceAgent _setupPowerSourceMonitor](self, "_setupPowerSourceMonitor");
}

- (void)_systemStateUnregisterObservers
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  -[SDPairedDeviceAgent _disablePowerStateMonitor](self, "_disablePowerStateMonitor");
}

- (void)_setupLockStateMonitor
{
  NSObject *v3;
  id v4;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_lockStateChanged:", CFSTR("com.apple.sharingd.KeyBagLockStatusChanged"), 0);

}

- (void)_setupPowerSourceMonitor
{
  SFPowerSourceMonitor *v3;
  SFPowerSourceMonitor *powerSourceMonitor;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = objc_opt_new(SFPowerSourceMonitor);
  powerSourceMonitor = self->_powerSourceMonitor;
  self->_powerSourceMonitor = v3;

  -[SFPowerSourceMonitor setChangeFlags:](self->_powerSourceMonitor, "setChangeFlags:", 0xFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  -[SFPowerSourceMonitor setDispatchQueue:](self->_powerSourceMonitor, "setDispatchQueue:", v5);

  -[SFPowerSourceMonitor setInvalidationHandler:](self->_powerSourceMonitor, "setInvalidationHandler:", &stru_100714AF8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F07C;
  v8[3] = &unk_100714B20;
  v8[4] = self;
  -[SFPowerSourceMonitor setPowerSourcesFoundHandler:](self->_powerSourceMonitor, "setPowerSourcesFoundHandler:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F168;
  v7[3] = &unk_100714B48;
  v7[4] = self;
  -[SFPowerSourceMonitor setPowerSourcesChangedHandler:](self->_powerSourceMonitor, "setPowerSourcesChangedHandler:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F254;
  v6[3] = &unk_100714B20;
  v6[4] = self;
  -[SFPowerSourceMonitor setPowerSourcesLostHandler:](self->_powerSourceMonitor, "setPowerSourcesLostHandler:", v6);
  -[SFPowerSourceMonitor activateWithCompletion:](self->_powerSourceMonitor, "activateWithCompletion:", &stru_100714B88);
}

- (void)_setupWristStateMonitor
{
  NSObject *v3;
  id v4;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "wristStateChanged:", CFSTR("com.apple.sharingd.WristStateChanged"), 0);

}

- (void)_disablePowerStateMonitor
{
  NSObject *v3;
  SFPowerSourceMonitor *powerSourceMonitor;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  -[SFPowerSourceMonitor invalidate](self->_powerSourceMonitor, "invalidate");
  powerSourceMonitor = self->_powerSourceMonitor;
  self->_powerSourceMonitor = 0;

}

- (void)_testingRegisterNotifications
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v2);

}

- (void)_testingUnregisterNotifications
{
  notify_cancel(self->_testingChargingToken);
  self->_testingChargingToken = 0;
}

- (void)_testingOnCharger
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = charging_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Faking on charger", v6, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

}

- (int64_t)wristState
{
  return self->_wristStatePairedDevice;
}

- (void)wristStateChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = charging_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wrist state changed", buf, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F640;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_wristStateChanged
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = (int64_t)objc_msgSend(v3, "watchWristState");

  v6 = 2;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v6 = v4;
  if (self->_wristStateLocal == v6)
  {
    v7 = charging_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating for wrist state change", v9, 2u);
    }

  }
  else
  {
    self->_wristStateLocal = v6;
    -[SDPairedDeviceAgent _idsTriggerSync](self, "_idsTriggerSync");
  }
}

- (void)_wristStateHandleMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wst")));
  if (v6)
  {
    v7 = (unint64_t)objc_msgSend(v6, "integerValue");
    if ((v7 & 0x8000000000000000) != 0)
    {
      v8 = charging_log(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Invalid wrist state in update", v10, 2u);
      }

    }
    else
    {
      -[SDPairedDeviceAgent _wristStateUpdate:](self, "_wristStateUpdate:", v7);
    }
  }

}

- (void)_wristStateUpdate:(int64_t)a3
{
  NSObject *v5;
  int64_t wristStatePairedDevice;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  wristStatePairedDevice = self->_wristStatePairedDevice;
  self->_wristStatePairedDevice = a3;
  if (wristStatePairedDevice != a3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    objc_msgSend(v7, "updatePairedWatchWristState:", self->_wristStatePairedDevice);

  }
}

- (void)lowPowerModeChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = charging_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Low power mode changed", buf, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F928;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_lowPowerModeChanged
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "lowPowerModeEnabled");

  if (self->_lowPowerModeLocal == v4)
  {
    v6 = charging_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not updating for low power mode change", v8, 2u);
    }

  }
  else
  {
    self->_lowPowerModeLocal = v4;
    -[SDPairedDeviceAgent _idsTriggerSync](self, "_idsTriggerSync");
  }
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharingd.paireddevice");
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFPairedDeviceDaemonInterface);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFPairedDeviceClientInterface);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = charging_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sd_description"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired device connection established %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)connectionInvalidated:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = charging_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sd_description"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired device connection invalidated %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)initialViewControllerDidAppear
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = charging_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initial view controller appeared", v7, 2u);
  }

  self->_uiShowing = 1;
}

- (void)initialViewControllerDidDisappear
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = charging_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initial view controller disappeared", v7, 2u);
  }

  self->_uiShowing = 0;
}

- (void)requestAnimationDateWithCompletion:(id)a3
{
  (*((void (**)(id, NSDate *, _QWORD))a3 + 2))(a3, self->_animationDateReceived, 0);
}

- (void)sendAnimationDate:(id)a3
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue", a3));
  dispatch_assert_queue_V2(v3);

}

- (void)triggerChargingUIWithDismissHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  id v7;
  id chargingUIHandler;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = -[SDPairedDeviceAgent _companionLinkConnected](self, "_companionLinkConnected");
  if (v6)
  {
    v7 = objc_retainBlock(v4);
    chargingUIHandler = self->_chargingUIHandler;
    self->_chargingUIHandler = v7;

    v9 = dispatch_time(0, 10000000000);
    v10 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FE4C;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v9, v10, block);

  }
  else
  {
    v11 = charging_log(v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Companion Link disconnected, dismiss charging UI immediately", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)sendDismissUIWithReason:(int64_t)a3
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue", a3));
  dispatch_assert_queue_V2(v3);

}

- (void)sendDashboardEntryWithName:(id)a3 dict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v12[0] = CFSTR("dan");
  v12[1] = CFSTR("dad");
  v13[0] = a3;
  v13[1] = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v10[0] = CFSTR("met");
  v10[1] = CFSTR("dae");
  v11[0] = &off_10074B2C8;
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  -[SDPairedDeviceAgent _idsSendDashboardEntryToCompanion:](self, "_idsSendDashboardEntryToCompanion:", v9);
}

- (void)_postPowerStatusNotificationForPowerSource:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = charging_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending response for reason %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDPowerChargingStatusNotifier sharedNotifier](SDPowerChargingStatusNotifier, "sharedNotifier"));
  objc_msgSend(v6, "notifyBatteryStatus");

}

- (BOOL)hasLongPasscode
{
  return self->_hasLongPasscode;
}

- (void)setPowerSource:(id)a3
{
  objc_storeStrong((id *)&self->_powerSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSource, 0);
  objc_storeStrong((id *)&self->_powerSourcePairedDevice, 0);
  objc_storeStrong((id *)&self->_powerSourceMonitor, 0);
  objc_storeStrong((id *)&self->_powerSourceMessage, 0);
  objc_storeStrong((id *)&self->_powerSourceLocal, 0);
  objc_storeStrong((id *)&self->_nrRegisteredDevices, 0);
  objc_storeStrong((id *)&self->_messageIDs, 0);
  objc_storeStrong((id *)&self->_idsInfoTimer, 0);
  objc_storeStrong((id *)&self->_idsSyncCoalescer, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsConnectedDevice, 0);
  objc_storeStrong((id *)&self->_idsConnectionCoalescer, 0);
  objc_storeStrong(&self->_chargingUIHandler, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_blePipe, 0);
  objc_storeStrong((id *)&self->_animationMessageID, 0);
  objc_storeStrong((id *)&self->_animationDateToSend, 0);
  objc_storeStrong((id *)&self->_animationDateForIDS, 0);
  objc_storeStrong((id *)&self->_animationDateReceived, 0);
}

@end
