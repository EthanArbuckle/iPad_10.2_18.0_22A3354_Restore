@implementation SDConnectionManager

+ (id)sharedManager
{
  if (qword_1007C6988 != -1)
    dispatch_once(&qword_1007C6988, &stru_100717A70);
  return (id)qword_1007C6980;
}

- (SDConnectionManager)initWithXPCConnection:(id)a3
{
  id v5;
  SDConnectionManager *v6;
  uint64_t v7;
  NSUUID *identifier;
  void *v9;
  id v10;
  uint64_t v11;
  NSString *bundleID;
  SDServiceManager *serviceManager;
  NSMutableArray *v14;
  NSMutableArray *unlockSessions;
  NSMutableArray *v16;
  NSMutableArray *companionStreams;
  NSMutableDictionary *v18;
  NSMutableDictionary *deviceStreamMap;
  NSMutableArray *v20;
  NSMutableArray *streamIdentifiers;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SDConnectionManager;
  v6 = -[SDConnectionManager init](&v23, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_xpcConnection"));
    v10 = sub_10019CD60(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v11;

    serviceManager = v6->_serviceManager;
    v6->_serviceManager = 0;

    v14 = objc_opt_new(NSMutableArray);
    unlockSessions = v6->_unlockSessions;
    v6->_unlockSessions = v14;

    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v16 = objc_opt_new(NSMutableArray);
    companionStreams = v6->_companionStreams;
    v6->_companionStreams = v16;

    v18 = objc_opt_new(NSMutableDictionary);
    deviceStreamMap = v6->_deviceStreamMap;
    v6->_deviceStreamMap = v18;

    v20 = objc_opt_new(NSMutableArray);
    streamIdentifiers = v6->_streamIdentifiers;
    v6->_streamIdentifiers = v20;

  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  const __CFString *v13;
  NSUUID *identifier;

  if (self->_xpcConnection)
  {
    +[SFCompanionXPCManager initialize](SFCompanionXPCManager, "initialize");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFCompanionXPCManager xpcManagerInterface](SFCompanionXPCManager, "xpcManagerInterface"));
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v3);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    location = 0;
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FF7D8;
    v10[3] = &unk_1007145D0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v10);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_1000FF840;
    v8 = &unk_1007145D0;
    objc_copyWeak(&v9, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", &v5);
    v13 = CFSTR("SDConnectionManagerIdentifier");
    identifier = self->_identifier;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &identifier, &v13, 1, v5, v6, v7, v8));
    -[NSXPCConnection setUserInfo:](self->_xpcConnection, "setUserInfo:", v4);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)cleanUpConnections
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  SDHotspotAgent *hotspotAgent;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFA94;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v4 = tethering_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_identifier, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client invalidated (%@)", buf, 0xCu);

  }
  -[SDHotspotAgent stopBrowsingForClientID:](self->_hotspotAgent, "stopBrowsingForClientID:", self->_identifier);
  -[SDHotspotAgent removeClientID:](self->_hotspotAgent, "removeClientID:", self->_identifier);
  hotspotAgent = self->_hotspotAgent;
  self->_hotspotAgent = 0;

}

- (void)createCompanionServiceManagerWithIdentifier:(id)a3 clientProxy:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  SDServiceManager *v13;
  SDServiceManager *serviceManager;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSErrorDomain v23;
  const __CFString **v24;
  NSErrorUserInfoKey *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (!v10)
  {
    v19 = streams_log(0, v11);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1001007A4();
    goto LABEL_17;
  }
  if (!v9)
  {
    v21 = streams_log(v10, v11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1001007D0();

    v23 = NSPOSIXErrorDomain;
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Missing client proxy");
    v24 = &v32;
    v25 = &v31;
    goto LABEL_16;
  }
  if (!v8)
  {
    v26 = streams_log(v10, v11);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1001007FC();

    v23 = NSPOSIXErrorDomain;
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Missing identifier");
    v24 = &v30;
    v25 = &v29;
LABEL_16:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, 1));
    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 22, v28));

    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, NSObject *))v12)[2](v12, 0, 0, 0, 0, v20);
LABEL_17:

    goto LABEL_20;
  }
  if (!self->_serviceManager)
  {
    v13 = -[SDServiceManager initWithClientProxy:withIdentifier:]([SDServiceManager alloc], "initWithClientProxy:withIdentifier:", v9, v8);
    serviceManager = self->_serviceManager;
    self->_serviceManager = v13;

    -[SDServiceManager setBundleID:](self->_serviceManager, "setBundleID:", self->_bundleID);
    -[SDServiceManager start](self->_serviceManager, "start");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "someComputerName"));

  v17 = (__CFString *)sub_10019CEB4();
  if (sub_1000CE944())
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDCompanionCommon myIPAddress](SDCompanionCommon, "myIPAddress"));
  else
    v18 = 0;
  ((void (**)(_QWORD, SDServiceManager *, void *, __CFString *, void *, _QWORD))v12)[2](v12, self->_serviceManager, v16, v17, v18, 0);

LABEL_20:
}

- (void)createStreamsForMessage:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  SDConnectionManager *v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v9 = streams_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Streams are being requested from service = %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100038;
  block[3] = &unk_100714F68;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)createUnlockManagerWithReply:(id)a3
{
  void (**v4)(id, SDUnlockXPCSession *, _QWORD);
  SDUnlockXPCSession *v5;

  v4 = (void (**)(id, SDUnlockXPCSession *, _QWORD))a3;
  v5 = objc_alloc_init(SDUnlockXPCSession);
  -[SDUnlockXPCSession setDelegate:](v5, "setDelegate:", self);
  v4[2](v4, v5, 0);

  -[NSMutableArray addObject:](self->_unlockSessions, "addObject:", v5);
}

- (void)createHotspotSessionForClientProxy:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  SDHotspotAgent *v8;
  SDHotspotAgent *hotspotAgent;
  SDHotspotAgent *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if ((SFIsDeviceAppleTV(v7) & 1) != 0
    || (v8 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"))) == 0)
  {
    v12 = NSLocalizedDescriptionKey;
    v13 = CFSTR("Could not create a hotspot browser");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v10 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v11));

    v7[2](v7, 0, v10);
  }
  else
  {
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v8;
    v10 = v8;

    -[SDHotspotAgent addClientID:proxy:](v10, "addClientID:proxy:", self->_identifier, v6);
    ((void (**)(id, SDHotspotAgent *, id))v7)[2](v7, v10, 0);
  }

}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, id);
  SDHotspotAgent *v10;
  SDHotspotAgent *hotspotAgent;
  SDHotspotAgent *v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  if ((SFIsDeviceAppleTV(v9) & 1) != 0
    || (v10 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"))) == 0)
  {
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("Could not create a hotspot agent");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v12 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v13));

    v9[2](v9, v12);
  }
  else
  {
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v10;
    v12 = v10;

    -[SDHotspotAgent updateLowLatencyFilter:isAddFilter:completion:](v12, "updateLowLatencyFilter:isAddFilter:completion:", v8, v6, v9);
  }

}

- (void)appleAccountSignedIn
{
  uint64_t v2;
  NSObject *v3;

  v2 = SFMainQueue(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_async(v3, &stru_100717A90);

}

- (void)appleAccountSignedOut
{
  uint64_t v2;
  NSObject *v3;

  v2 = SFMainQueue(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_async(v3, &stru_100717AB0);

}

- (void)companionStreamClosedStreams:(id)a3
{
  -[NSMutableArray removeObject:](self->_companionStreams, "removeObject:", a3);
}

- (void)unlockSessionDidFinish:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001005DC;
  v4[3] = &unk_100714860;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (SDConnectionManagerDelegate)delegate
{
  return (SDConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompanionStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SDServiceManager)serviceManager
{
  return (SDServiceManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)deviceStreamMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceStreamMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)unlockSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUnlockSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableArray)streamIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (SDHotspotAgent)hotspotAgent
{
  return (SDHotspotAgent *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHotspotAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_streamIdentifiers, 0);
  objc_storeStrong((id *)&self->_unlockSessions, 0);
  objc_storeStrong((id *)&self->_deviceStreamMap, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_companionStreams, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
