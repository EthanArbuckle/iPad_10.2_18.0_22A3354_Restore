@implementation CRCarKitServiceAgent

- (BOOL)_isRestricted:(id *)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
  v5 = objc_msgSend(v4, "isCarPlayAllowed");

  if (a3 && (v5 & 1) == 0)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 1, 0));
  return v5 ^ 1;
}

- (CRCarPlayPreferences)preferencesManager
{
  return self->_preferencesManager;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  NSSet *v13;
  void *v14;
  NSSet *v15;
  void *v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  NSSet *v20;
  void *v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarKitService));
    v10 = objc_opt_class(NSSet);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(CRVehicle), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, "fetchAllVehiclesWithReply:", 0, 1);

    v13 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSURL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v14, "handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:", 0, 0);

    v15 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSURL));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v16, "handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:", 1, 0);

    v17 = objc_opt_class(NSArray);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(NSURL), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v19, "handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:", 2, 0);

    v20 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v21, "handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:", 3, 0);

    v22 = objc_opt_class(NSArray);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(NSURL), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v24, "fetchInstrumentClusterURLsWithReply:", 0, 1);

    v25 = objc_opt_class(NSArray);
    v26 = objc_opt_class(NSDictionary);
    v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, v26, objc_opt_class(NSNumber), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v28, "fetchScaledDisplaysWithReply:reply:", 0, 1);

    objc_msgSend(v5, "setExportedInterface:", v9);
    v29 = CarGeneralLogging(objc_msgSend(v5, "setExportedObject:", self));
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
      *(_DWORD *)buf = 138412802;
      v36 = v5;
      v37 = 2112;
      v38 = v31;
      v39 = 2112;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Receiving CarKit service connection %@ to service %@ from %@", buf, 0x20u);

    }
    objc_msgSend(v5, "resume");
  }
  else
  {
    v33 = CarGeneralLogging(v8);
    v9 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006AC54(v5, v9);
  }

  return v7;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CRCarKitServiceAgent)initWithVehicleStore:(id)a3 sessionStatus:(id)a4 bluetoothManager:(id)a5 preferences:(id)a6 connectionTimeServiceAgent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRCarKitServiceAgent *v17;
  CRCarKitServiceAgent *v18;
  CARMessagingServiceConnector *v19;
  CRWirelessSessionAssertionManager *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  CRFeaturesAvailabilityAgent *v26;
  CRWiFiCarManager *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  CRLoggingChannelManager *v36;
  CRLoggingChannelManager *loggingChannelManager;
  objc_super v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)CRCarKitServiceAgent;
  v17 = -[CRCarKitServiceAgent init](&v39, "init");
  v18 = v17;
  if (v17)
  {
    -[CRCarKitServiceAgent setVehicleStore:](v17, "setVehicleStore:", v12);
    -[CRCarKitServiceAgent setSessionStatus:](v18, "setSessionStatus:", v13);
    objc_msgSend(v13, "addSessionObserver:", v18);
    v19 = -[CARMessagingServiceConnector initWithVehicleStore:]([CARMessagingServiceConnector alloc], "initWithVehicleStore:", v12);
    -[CRCarKitServiceAgent setMessagingConnector:](v18, "setMessagingConnector:", v19);
    -[CARMessagingServiceConnector setDelegate:](v19, "setDelegate:", v18);
    v20 = -[CRWirelessSessionAssertionManager initWithSessionStatus:connectionTimeServiceAgent:messagingConnector:]([CRWirelessSessionAssertionManager alloc], "initWithSessionStatus:connectionTimeServiceAgent:messagingConnector:", v13, v16, v19);
    -[CRWirelessSessionAssertionManager setStoredVehicleProvider:](v20, "setStoredVehicleProvider:", v18);
    -[CRCarKitServiceAgent setAssertionManager:](v18, "setAssertionManager:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v21, "setConnectionTimeServiceAgent:", v16);

    -[CRCarKitServiceAgent setBluetoothManager:](v18, "setBluetoothManager:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](v18, "bluetoothManager"));
    objc_msgSend(v22, "addObserver:", v18);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](v18, "bluetoothManager"));
    objc_msgSend(v23, "setPairingDelegate:", v18);

    v24 = objc_alloc_init((Class)CARSessionRequestClient);
    -[CRCarKitServiceAgent setSessionRequestClient:](v18, "setSessionRequestClient:", v24);

    -[CRCarKitServiceAgent setPreferencesManager:](v18, "setPreferencesManager:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](v18, "preferencesManager"));
    objc_msgSend(v25, "setPreferencesDelegate:", v18);

    v26 = -[CRFeaturesAvailabilityAgent initWithPreferencesManager:vehicleStore:]([CRFeaturesAvailabilityAgent alloc], "initWithPreferencesManager:vehicleStore:", v15, v12);
    -[CRCarKitServiceAgent setFeaturesAvailabilityAgent:](v18, "setFeaturesAvailabilityAgent:", v26);

    v27 = objc_alloc_init(CRWiFiCarManager);
    -[CRCarKitServiceAgent setWifiManager:](v18, "setWifiManager:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CRCarKitServiceAgent setOutstandingApprovalAlerts:](v18, "setOutstandingApprovalAlerts:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CRCarKitServiceAgent setOutstandingPairingAlerts:](v18, "setOutstandingPairingAlerts:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CRCarKitServiceAgent setOutstandingEnableWiFiAlerts:](v18, "setOutstandingEnableWiFiAlerts:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CRCarKitServiceAgent setOutstandingEnhancedIntegrationAlerts:](v18, "setOutstandingEnhancedIntegrationAlerts:", v31);

    v32 = objc_alloc_init((Class)NSMutableDictionary);
    -[CRCarKitServiceAgent setServiceCountDuringAlertForBluetoothAddress:](v18, "setServiceCountDuringAlertForBluetoothAddress:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", v18, "handleVehicleStoreAvailabiltyDidChange:", CRVehicleStoreAvailabilityDidChangeNotification, 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](v18, "vehicleStore"));
    v35 = objc_msgSend(v34, "allStoredVehicles");

    v36 = -[CRLoggingChannelManager initWithSessionStatus:]([CRLoggingChannelManager alloc], "initWithSessionStatus:", v13);
    loggingChannelManager = v18->_loggingChannelManager;
    v18->_loggingChannelManager = v36;

    objc_storeStrong((id *)&v18->_connectionTimeServiceAgent, a7);
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRCarKitServiceAgent;
  -[CRCarKitServiceAgent dealloc](&v4, "dealloc");
}

- (void)saveVehicle:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10001F79C;
  v16 = sub_10001F7AC;
  v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F7B4;
  block[3] = &unk_1000B5B08;
  v11 = &v12;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v7[2](v7, v13[5], 0);

  _Block_object_dispose(&v12, 8);
}

- (void)removeVehicle:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F8E4;
  block[3] = &unk_1000B5B08;
  v11 = &v12;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *((unsigned __int8 *)v13 + 24), 0);

  _Block_object_dispose(&v12, 8);
}

- (void)fetchAllVehiclesWithReply:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10001F79C;
  v16 = sub_10001F7AC;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001F79C;
  v10 = sub_10001F7AC;
  v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AF4;
  block[3] = &unk_1000B5B30;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v4[2](v4, v13[5], v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)hasVehiclesWithReply:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FAAC;
  v5[3] = &unk_1000B5B58;
  v6 = a3;
  v4 = v6;
  -[CRCarKitServiceAgent fetchAllVehiclesWithReply:](self, "fetchAllVehiclesWithReply:", v5);

}

- (void)handleDidConnectBluetoothAddress:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  id v33;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t, uint64_t))a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10001F79C;
  v26 = sub_10001F7AC;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10001F79C;
  v20 = sub_10001F7AC;
  v21 = 0;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "attempting fast-reconnection with %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FD24;
  block[3] = &unk_1000B5B80;
  block[4] = self;
  v13 = &v16;
  v10 = v6;
  v12 = v10;
  v14 = &v22;
  v15 = &v28;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v7[2](v7, *((unsigned __int8 *)v29 + 24), v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)handleDidDisconnectBluetoothAddress:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000201D4;
  block[3] = &unk_1000B5BA8;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *((unsigned __int8 *)v13 + 24), 0);

  _Block_object_dispose(&v12, 8);
}

- (void)isBluetoothInCarWithReply:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t, uint64_t);
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = (void (**)(id, _QWORD, uint64_t, uint64_t))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10001F79C;
  v16 = sub_10001F7AC;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001F79C;
  v10 = sub_10001F7AC;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000203B4;
  v5[3] = &unk_1000B5BD0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v18;
  v5[7] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  v4[2](v4, *((unsigned __int8 *)v19 + 24), v13[5], v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (void)handleBluetoothClassicPairingCompletedForDeviceAddress:(id)a3 name:(id)a4 preApproved:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CRCarKitServiceAgent *v16;
  id v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10001F79C;
  v20[4] = sub_10001F7AC;
  v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002060C;
  v13[3] = &unk_1000B5BF8;
  v14 = a3;
  v15 = a4;
  v17 = a6;
  v18 = v20;
  v16 = self;
  v19 = a5;
  v10 = v17;
  v11 = v15;
  v12 = v14;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v13);

  _Block_object_dispose(v20, 8);
}

- (void)startBluetoothLEPairingForIdentifier:(id)a3 deviceName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  CRCarKitServiceAgent *v14;
  id v15;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000208E4;
  block[3] = &unk_1000B5C48;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startBluetoothClassicPairingForDeviceAddress:(id)a3 deviceName:(id)a4 numericCode:(id)a5 showBluetoothOnlyOption:(BOOL)a6 reply:(id)a7
{
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  CRCarKitServiceAgent *v15;
  id v16;
  id v17;
  BOOL v18;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020D48;
  block[3] = &unk_1000B5C70;
  v18 = a6;
  v14 = a3;
  v15 = self;
  v16 = a5;
  v17 = a7;
  v10 = v16;
  v11 = v17;
  v12 = v14;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)handleCarPlayConnectionRequestForConnectionID:(unsigned int)a3 startSessionProperties:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CRCarKitServiceAgent *v13;
  id v14;
  unsigned int v15;

  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002118C;
  block[3] = &unk_1000B5CE8;
  v13 = self;
  v14 = a5;
  v12 = v8;
  v15 = a3;
  v9 = v14;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)postBannerToPhone:(id)a3 notificationMessage:(id)a4 reply:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void (**)(_QWORD))a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alertManager"));

  objc_msgSend(v11, "postBannerWithTitle:message:destinations:", v9, v8, 3);
  v7[2](v7);

}

- (void)wantsCarPlayControlAdvertisingForUSBWithReply:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001F79C;
  v10 = sub_10001F7AC;
  v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021ECC;
  block[3] = &unk_1000B5B30;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v4[2](v4, *((unsigned __int8 *)v13 + 24), v7[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  _QWORD v9[4];
  id v10;
  CRCarKitServiceAgent *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10001F79C;
  v18 = sub_10001F7AC;
  v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000221A8;
  v9[3] = &unk_1000B5D10;
  v8 = v6;
  v10 = v8;
  v11 = self;
  v12 = &v14;
  v13 = &v20;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v21 + 24), v15[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

}

- (void)saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, BOOL, _QWORD);
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  unint64_t v31;

  v8 = a3;
  v9 = (void (**)(id, BOOL, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10001F79C;
  v28 = sub_10001F7AC;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10001F79C;
  v22 = sub_10001F7AC;
  v23 = 0;
  v10 = CarGeneralLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received WiFi credentials for connectionID %lu", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022660;
  block[3] = &unk_1000B5D60;
  block[4] = self;
  v12 = v8;
  v14 = v12;
  v15 = &v24;
  v16 = &v18;
  v17 = a4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v9[2](v9, v25[5] != 0, v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)allowsConnectionsForWiFiUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10001F79C;
  v17 = sub_10001F7AC;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022880;
  v9[3] = &unk_1000B5D88;
  v9[4] = self;
  v11 = &v13;
  v12 = &v19;
  v8 = v6;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)allowsConnectionsForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10001F79C;
  v17 = sub_10001F7AC;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022B74;
  v9[3] = &unk_1000B5D88;
  v9[4] = self;
  v11 = &v13;
  v12 = &v19;
  v8 = v6;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)isPairedWithCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10001F79C;
  v17 = sub_10001F7AC;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022E5C;
  v9[3] = &unk_1000B56F0;
  v9[4] = self;
  v11 = &v13;
  v8 = v6;
  v10 = v8;
  v12 = &v19;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, *((unsigned __int8 *)v20 + 24), v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)isEnhancedIntegrationEnabledWithCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10001F79C;
  v17 = sub_10001F7AC;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023130;
  v9[3] = &unk_1000B56F0;
  v9[4] = self;
  v11 = &v13;
  v8 = v6;
  v10 = v8;
  v12 = &v19;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v7[2](v7, v20[3], v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

- (void)handleCarPlayRestrictionChangedWithReply:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023334;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  v3 = (void (**)(_QWORD))a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v3[2](v3);

}

- (void)isCarPlayAllowedWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, objc_msgSend(v6, "isCarPlayAllowed"), 0);

}

- (void)deviceSupportedCarPlayFeaturesWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000234BC;
  v9[3] = &unk_1000B5750;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
  v6 = CarGeneralLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10006AE6C();

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11[3]));
  v4[2](v4, v8, 0);

  _Block_object_dispose(&v10, 8);
}

- (void)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CRCarKitServiceAgent *v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100023654;
  v18 = &unk_1000B5DB0;
  v21 = &v23;
  v22 = a3;
  v19 = self;
  v10 = v8;
  v20 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &v15);
  v12 = CarGeneralLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10006AED0();

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v24 + 24), v15, v16, v17, v18, v19));
  v9[2](v9, v14, 0);

  _Block_object_dispose(&v23, 8);
}

- (void)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a5;
  v11 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000237DC;
  block[3] = &unk_1000B5DD8;
  v18 = &v21;
  v19 = a3;
  block[4] = self;
  v20 = a4;
  v12 = v10;
  v17 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v14 = CarGeneralLogging(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10006AF5C();

  (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, *((unsigned __int8 *)v22 + 24), 0);
  _Block_object_dispose(&v21, 8);

}

- (void)supportedCarPlayFeaturesForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000239D0;
  block[3] = &unk_1000B5B08;
  v16 = &v17;
  block[4] = self;
  v8 = v6;
  v15 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v10 = CarGeneralLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v18[3];
    *(_DWORD *)buf = 134349056;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: %{public}lu", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18[3]));
  v7[2](v7, v13, 0);

  _Block_object_dispose(&v17, 8);
}

- (void)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10001F79C;
  v20 = sub_10001F7AC;
  v21 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BBC;
  block[3] = &unk_1000B5B08;
  v15 = &v16;
  block[4] = self;
  v8 = v6;
  v14 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v10 = CarGeneralLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v17[5];
    *(_DWORD *)buf = 138543362;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "supportedAirPlayFeatures: %{public}@", buf, 0xCu);
  }

  v7[2](v7, v17[5], 0);
  _Block_object_dispose(&v16, 8);

}

- (void)handleCarPlayDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 activeBundleIdentifier:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023DF8;
  block[3] = &unk_1000B5E00;
  block[4] = self;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v11 = v21;
  v12 = v20;
  v13 = v19;
  v14 = v18;
  v15 = v17;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)fetchInstrumentClusterURLsWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 5, 0));
  (*((void (**)(id, void *, id))a3 + 2))(v4, &__NSArray0__struct, v5);

}

- (id)accessoryRadarDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manufacturer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firmwareRevision"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hardwareRevision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppid"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Accessory Name: %@\nManufacturer: %@\nModel Number: %@\nFirmware Revision: %@\nHardware Revision: %@\nSerial Number: %@\nPPID: %@\n"), v4, v5, v6, v7, v8, v9, v10));
  return v11;
}

- (void)fetchScaledDisplaysWithReply:(id)a3 reply:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024558;
  v6[3] = &unk_1000B5E28;
  v7 = a4;
  v5 = v7;
  +[CRScreenScaleHeuristics scaledDisplays:reply:](CRScreenScaleHeuristics, "scaledDisplays:reply:", a3, v6);

}

- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024664;
  block[3] = &unk_1000B5E78;
  block[4] = self;
  v19 = v11;
  v21 = v12;
  v22 = a7;
  v20 = v13;
  v14 = v12;
  v15 = v13;
  v16 = v22;
  v17 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000249F4;
  v11[3] = &unk_1000B5EA0;
  v11[4] = self;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;
  CRCarKitServiceAgent *v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024B50;
  v7[3] = &unk_1000B5390;
  v8 = a4;
  v9 = self;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024C18;
  v5[3] = &unk_1000B5390;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)serviceConnector:(id)a3 didUpdateVehicle:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024EA8;
  v5[3] = &unk_1000B5390;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)serviceConnector:(id)a3 receivedStartSessionMessage:(id)a4 fromVehicle:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  CRCarKitServiceAgent *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10 = CarGeneralLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CarPlay connection request startSessionMessage: %@", buf, 0xCu);
  }

  if (v7)
  {
    v29 = 0;
    v13 = -[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", &v29);
    v14 = v29;
    v15 = v14;
    if (v13)
    {
      v16 = CarGeneralLogging(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006AD74();
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SSID"));
      objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("SSID_STR"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passphrase"));
      objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("password"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "channel"));
      objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("CHANNEL"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "securityType"));
      objc_msgSend(v19, "setObject:forKey:", v23, CFSTR("securityType"));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000251E0;
      v24[3] = &unk_1000B5F58;
      v25 = v8;
      v26 = self;
      v27 = v19;
      v28 = v7;
      v17 = v19;
      -[CRCarKitServiceAgent _findWirelessPairedVehicleForMessagingVehicle:result:](self, "_findWirelessPairedVehicleForMessagingVehicle:result:", v25, v24);

    }
  }
  else
  {
    v18 = CarGeneralLogging(v12);
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10006B170();
  }

}

- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000256C8;
  v5[3] = &unk_1000B5390;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)serviceConnector:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = CarPairingLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 141558275;
    v12 = 1752392040;
    v13 = 2113;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connected an iAP accessory that doesn't support CarPlay: %{private, mask.hash}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
    objc_msgSend(v10, "handleUnsupportedMessagingConnectionForDeviceIdentifier:", v5);

  }
}

- (void)handleCarPlayAllowedDidChange
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002588C;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleCarPlayAllowedDidChange
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const __CFString *v29;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay restriction changed", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
  v6 = objc_msgSend(v5, "isCarPlayAllowed");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent cachedCarPlayAllowedChangeValue](self, "cachedCarPlayAllowedChangeValue"));
  v8 = v7;
  if (!v7 || (v7 = objc_msgSend(v7, "BOOLValue"), (_DWORD)v6 != (_DWORD)v7))
  {
    v9 = CarGeneralLogging(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("disabled");
      if ((_DWORD)v6)
        v11 = CFSTR("enabled");
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CarPlay is now %@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    -[CRCarKitServiceAgent setCachedCarPlayAllowedChangeValue:](self, "setCachedCarPlayAllowedChangeValue:", v12);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carplay.allowed-changed"), 0, 0, 1u);
    +[CRVehicleStore postPairingsDidChangeNotification](CRVehicleStore, "postPairingsDidChangeNotification");
    if ((_DWORD)v6)
    {
      -[CRCarKitServiceAgent handleAnyMessagingConnectionsToVehicles](self, "handleAnyMessagingConnectionsToVehicles");
    }
    else
    {
      -[CRCarKitServiceAgent _dismissApprovalAlerts](self, "_dismissApprovalAlerts");
      -[CRCarKitServiceAgent _dismissPairingAlerts](self, "_dismissPairingAlerts");
      -[CRCarKitServiceAgent _dismissEnhancedIntegrationAlerts](self, "_dismissEnhancedIntegrationAlerts");
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore", 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allStoredVehicles"));

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent monitoringService](self, "monitoringService"));
            objc_msgSend(v21, "handleUpdatedVehicle:enabled:completion:", v20, 0, 0);

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v17);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
      objc_msgSend(v22, "cancelRequests");

    }
  }

}

- (void)handleVehicleStoreAvailabiltyDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025BA0;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)postInCarNotificationForVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  int v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carplayWiFiUUID"));
  v6 = (void *)v5;
  if (v5)
  {
    v17 = CFSTR("CARPLAY_UUID");
    v18 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v8 = CarGeneralLogging(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending iAP in-car wifi notification %@", (uint8_t *)&v15, 0xCu);
    }

    kdebug_trace(731971984, 0, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager"));
    objc_msgSend(v10, "setInCar:carPlayUUID:", 1, v6);

    if (objc_msgSend(v4, "requiresBonjour"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
      objc_msgSend(v11, "startAdvertisingCarPlayControlForWiFiUUID:", v6);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carplay.in-car"), 0, 0, 1u);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v13, "wirelessReconnectStarted");

  }
  return v6 != 0;
}

- (BOOL)postOutOfCarNotificationForVehicle:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "carplayWiFiUUID"));
  v4 = (void *)v3;
  if (v3)
  {
    v12 = CFSTR("CARPLAY_UUID");
    v13 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v6 = CarGeneralLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending iAP out-of-car wifi notification %@", (uint8_t *)&v10, 0xCu);
    }

    kdebug_trace(731971988, 0, 0, 0, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carplay.out-of-car"), 0, 0, 1u);

  }
  return v4 != 0;
}

- (BOOL)_isVehicleActionable:(id)a3
{
  return objc_msgSend(a3, "pairingStatus") != (id)1;
}

- (void)_findWirelessPairedVehicleForAccessoryConnectionIdentifier:(unint64_t)a3 result:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleAccessoryForiAPConnectionIdentifier:", a3));

    if (!v8)
    {
      v10 = CarGeneralLogging(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10006B210();

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 3, 0));
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v12);

    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026024;
    v14[3] = &unk_1000B5F80;
    v15 = v8;
    v16 = v6;
    v13 = v8;
    -[CRCarKitServiceAgent _findWirelessPairedVehicleForMessagingVehicle:result:](self, "_findWirelessPairedVehicleForMessagingVehicle:result:", v13, v14);

  }
}

- (void)_findWirelessPairedVehicleForMessagingVehicle:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (v7)
  {
    v29 = 0;
    v8 = -[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", &v29);
    v9 = v29;
    if (v8)
    {
      v7[2](v7, 0, v9);
LABEL_15:

      goto LABEL_16;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allStoredVehicles"));
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_1000262B0;
    v27 = &unk_1000B5FA8;
    v12 = v6;
    v28 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectsPassingTest:", &v24));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject", v24, v25, v26, v27));
    v15 = (void *)v14;
    if (v14 && (v14 = (uint64_t)objc_msgSend((id)v14, "isPaired"), (v14 & 1) != 0))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bluetoothAddress"));
      if (v16)
      {

LABEL_13:
        ((void (**)(id, void *, id))v7)[2](v7, v15, 0);
        goto LABEL_14;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bluetoothAddress"));

      if (v21)
        goto LABEL_13;
      v23 = CarGeneralLogging(v22);
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        v19 = "Vehicle %@ is not paired for wireless";
        goto LABEL_10;
      }
    }
    else
    {
      v17 = CarGeneralLogging(v14);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        v19 = "Vehicle %@ is not paired";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 1, 0));
    v7[2](v7, 0, v20);

LABEL_14:
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_saveWiFiCredentials:(id)a3 forAccessoryConnectionIdentifier:(unint64_t)a4 result:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000263CC;
  v10[3] = &unk_1000B5FD0;
  v11 = a3;
  v12 = a5;
  v10[4] = self;
  v8 = v11;
  v9 = v12;
  -[CRCarKitServiceAgent _findWirelessPairedVehicleForAccessoryConnectionIdentifier:result:](self, "_findWirelessPairedVehicleForAccessoryConnectionIdentifier:result:", a4, v10);

}

- (void)_saveWiFiCredentials:(id)a3 fromMessagingVehicle:(id)a4 forWirelessPairedVehicle:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  id v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bluetoothAddress"));
  v16 = v15;
  if (v14 && v15)
  {
    v17 = objc_msgSend(v15, "isEqual:", v14);

    if ((v17 & 1) != 0)
    {
LABEL_4:
      v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {

    if (!v14)
      goto LABEL_4;
  }
  objc_msgSend(v12, "setBluetoothAddress:", v14);
  v18 = 1;
LABEL_7:
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "carplayWiFiUUID"));
  if (v19)
  {
    v20 = v19;
    if (!v18)
      goto LABEL_15;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));

    v19 = objc_msgSend(v12, "setCarplayWiFiUUID:", v20);
  }
  v22 = CarGeneralLogging(v19);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 138412290;
    v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ for Bluetooth address or Wi-Fi UUID update", (uint8_t *)&v41, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "saveVehicle:", v12));

  if (!v25)
  {
    v36 = CarGeneralLogging(v26);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_10006B274();

    if (!v13)
      goto LABEL_35;
LABEL_30:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 2, 0));
    v13[2](v13, 0, v38);

    goto LABEL_35;
  }

  v12 = (id)v25;
LABEL_15:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager"));
  v28 = objc_msgSend(v27, "saveNetworkCredentials:forCarPlayUUID:", v10, v20);

  v30 = CarGeneralLogging(v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = v31;
  if ((v28 & 1) == 0)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_10006B304(v12, v32);

    if (!v13)
      goto LABEL_35;
    goto LABEL_30;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 138412290;
    v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "saved WiFi credentials for %@", (uint8_t *)&v41, 0xCu);
  }

  if (objc_msgSend(v11, "transportType") == (id)2 || (v33 = objc_msgSend(v11, "transportType"), v33 == (id)4))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent pairedVehiclesConnectedOnBluetooth](self, "pairedVehiclesConnectedOnBluetooth"));
    v35 = objc_msgSend(v34, "containsObject:", v12);

    if (v35)
    {
      kdebug_trace(731971996, 0, 0, 0, 0);
      -[CRCarKitServiceAgent postInCarNotificationForVehicle:](self, "postInCarNotificationForVehicle:", v12);
      if (!v13)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  v39 = CarGeneralLogging(v33);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    sub_10006B2D8();

  if (v13)
LABEL_34:
    ((void (**)(id, void *, void *))v13)[2](v13, v20, 0);
LABEL_35:

}

- (void)_mainQueue_startSessionForHost:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = CRLocalizedStringForKey(CFSTR("CARPLAY"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "setDisplayName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceIdentifier"));
  -[CRCarKitServiceAgent setLastStartSessionDeviceID:](self, "setLastStartSessionDeviceID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000269A0;
  v15[3] = &unk_1000B5518;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "startSessionWithHost:requestIdentifier:completion:", v7, v12, v15);

}

- (void)_mainQueue_updateClusterAssetIdentifier:(id)a3 assetVersion:(id)a4 sdkVersion:(id)a5 forVehicle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleAssetManager](self, "vehicleAssetManager"));
  v15 = (void *)v14;
  if (v14
    && (v14 = objc_opt_respondsToSelector(v14, "receivedClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:"),
        (v14 & 1) != 0))
  {
    objc_msgSend(v15, "receivedClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:", v10, v11, v12, v13);
  }
  else
  {
    v16 = CarGeneralLogging(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10006B3FC();

  }
}

- (BOOL)_shouldPromptEnhancedIntegrationForStoredVehicle:(id)a3 messagingVehicle:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t active;
  CFTypeRef v13;
  id *v14;
  id v15;
  uint64_t CMBaseObject;
  uint64_t VTable;
  uint64_t (*v18)(uint64_t, id, const CFAllocatorRef, NSObject **);
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  CFTypeRef cf;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 buf;
  void *(*v37)(uint64_t);
  void *v38;
  uint64_t *v39;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "enhancedIntegrationStatus"))
  {
LABEL_2:
    v7 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "supportsEnhancedIntegration");
  if ((v8 & 1) == 0)
  {
    v8 = objc_msgSend(v6, "supportsEnhancedIntegration");
    if (!(_DWORD)v8)
    {
      cf = 0;
      active = FigEndpointCopyActiveCarPlayEndpoint(&cf);
      v13 = cf;
      if (!cf)
      {
        v26 = CarGeneralLogging(active);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10006B428();

        goto LABEL_2;
      }
      v30 = 0;
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v14 = (id *)qword_1000DB838;
      v35 = qword_1000DB838;
      if (!qword_1000DB838)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v37 = sub_10002EC5C;
        v38 = &unk_1000B5320;
        v39 = &v32;
        sub_10002EC5C((uint64_t)&buf);
        v14 = (id *)v33[3];
      }
      _Block_object_dispose(&v32, 8);
      if (!v14)
      {
        sub_10006B48C();
        __break(1u);
      }
      v15 = objc_retainAutorelease(*v14);
      CMBaseObject = FigEndpointGetCMBaseObject(v13);
      VTable = CMBaseObjectGetVTable();
      v18 = *(uint64_t (**)(uint64_t, id, const CFAllocatorRef, NSObject **))(*(_QWORD *)(VTable + 8) + 48);
      if (v18)
      {
        VTable = v18(CMBaseObject, v15, kCFAllocatorDefault, &v30);
        v19 = VTable;
        if ((_DWORD)VTable == -12787 || !(_DWORD)VTable)
        {
          v20 = v30;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("uiContextLastOnDisplayURLs"), v30));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("uiContextNowOnDisplayURLs")));
          v23 = objc_msgSend(v21, "count");
          if (v23 || (v23 = objc_msgSend(v22, "count")) != 0)
          {
            v24 = CarGeneralLogging(v23);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v5;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "vehicle %@ declares ui context support for last on display and/or now on display", (uint8_t *)&buf, 0xCu);
            }
            v7 = 1;
          }
          else
          {
            v29 = CarGeneralLogging(0);
            v25 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v5;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "vehicle %@ does not declare ui context support", (uint8_t *)&buf, 0xCu);
            }
            v7 = 0;
          }

LABEL_29:
          CFRelease(cf);
          goto LABEL_8;
        }
      }
      else
      {
        v19 = -12782;
      }
      v28 = CarGeneralLogging(VTable);
      v20 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10006B4AC(v19, v20);
      v7 = 0;
      goto LABEL_29;
    }
  }
  v9 = CarGeneralLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "vehicle %@ declares enhanced integration support", (uint8_t *)&buf, 0xCu);
  }

  v7 = 1;
LABEL_8:

  return v7;
}

- (void)handleAnyMessagingConnectionsToVehicles
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedVehicles"));

  -[CRCarKitServiceAgent handleDidConnectMessagingToVehicles:](self, "handleDidConnectMessagingToVehicles:", v4);
}

- (void)handleDidConnectMessagingToVehicles:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[8];
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Handling CarPlay attach", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
  v8 = objc_msgSend(v7, "isCarPlayAllowed");

  if ((v8 & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "transportType") == (id)1
            && objc_msgSend(v15, "supportsUSBCarPlay")
            && (objc_msgSend(v15, "supportsCarPlayConnectionRequest") & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
            objc_msgSend(v16, "startAdvertisingCarPlayControlForUSB");

            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carplay.starting-wired-connection"), 0, 0, 1u);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v12);
    }

    -[CRCarKitServiceAgent updateIncompletePairingsMatchingMessagingVehicles:](self, "updateIncompletePairingsMatchingMessagingVehicles:", v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000271AC;
    v25[3] = &unk_1000B5F08;
    v25[4] = self;
    -[CRCarKitServiceAgent enumerateStoredVehiclesForMessagingVehicles:usingBlock:](self, "enumerateStoredVehiclesForMessagingVehicles:usingBlock:", v10, v25);
  }
  else
  {
    v18 = CarGeneralLogging(v9);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CarPlay is not available", buf, 2u);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          -[CRCarKitServiceAgent _sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:](self, "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j), 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v22);
    }

  }
}

- (id)_wirelessPairingAnalyticsDescriptionForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  char *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsDescription"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionStatus](self, "sessionStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSession"));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "PPID"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("Unknown");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("ppid"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsWiredBluetoothPairing")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("supportsOOBPairing"));

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceVersion"));
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("Unknown");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("SourceVersion"));

  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleName"));
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("Unknown");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("vehicleName"));

  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleModelName"));
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("Unknown");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("vehicleModel"));

  v25 = (char *)objc_msgSend(v7, "transportType");
  if ((unint64_t)(v25 - 1) > 3)
    v26 = CFSTR("unknown");
  else
    v26 = *(&off_1000B61F8 + (_QWORD)(v25 - 1));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("transportType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportsStartSessionRequest"));
  if (objc_msgSend(v27, "BOOLValue"))
    v28 = CFSTR("StartSession");
  else
    v28 = CFSTR("Bonjour");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("sessionType"));

  if (objc_msgSend(v6, "supportsBluetoothLE"))
    v29 = CFSTR("BLE");
  else
    v29 = CFSTR("BT Classic");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("bluetoothType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "supportsUSBCarPlay")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("supportsUSBCarPlay"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v31, "supportsVehicleData")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("nextGenCarPlaySession"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
  return v33;
}

- (void)updateIncompletePairingsMatchingMessagingVehicles:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  id v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];

  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v38;
    *(_QWORD *)&v6 = 138412290;
    v33 = v6;
    v34 = *(_QWORD *)v38;
    v35 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothAddress", v33));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicleForBluetoothAddress:", v11));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "certificateSerialNumber"));

          if (!v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "isCarPlaySetupEnabled"));

            if (!v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent _wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:](self, "_wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:", v10, v13));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
              objc_msgSend(v18, "userCreatedWirelessPairingWithSource:payload:", CFSTR("Settings"), v17);

            }
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "certificateSerialNumber"));
            v20 = (void *)v19;
            if (v19)
            {
              v21 = CarGeneralLogging(v19);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v33;
                v42 = v11;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "First accessory attach for %@, adding certificateSerial", buf, 0xCu);
              }

              objc_msgSend(v13, "setCertificateSerialNumber:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_1000278D8;
              v36[3] = &unk_1000B5FF8;
              v36[4] = self;
              v24 = objc_msgSend(v23, "saveVehicle:withMergePolicy:", v13, v36);

            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
            v26 = v25;
            if (v25)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bluetoothDeviceIdentifier"));
              v28 = objc_msgSend(v11, "isEqual:", v27);

              if (v28)
              {
                v30 = CarPairingLogging(v29);
                v31 = objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "adding connected accessory to prompt flow", buf, 2u);
                }

                objc_msgSend(v26, "setUserInfo:", v13);
                if (objc_msgSend(v13, "pairingStatus"))
                  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "pairingStatus") == (id)2));
                else
                  v32 = 0;
                objc_msgSend(v26, "handleConnectedMessagingVehicle:pairingAccepted:", v10, v32);

              }
            }

            v8 = v34;
            v4 = v35;
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }

}

- (id)vehicleMatchingMessagingVehicle:(id)a3 inVehicles:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "certificateSerialNumber"));
  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateSerialNumber", (_QWORD)v17));
          if (v12)
          {
            v13 = (void *)v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateSerialNumber"));
            v15 = objc_msgSend(v6, "isEqualToData:", v14);

            if (v15)
            {
              v8 = v11;
              goto LABEL_14;
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)enumerateStoredVehiclesForMessagingVehicles:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allStoredVehicles"));

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleMatchingMessagingVehicle:inVehicles:](self, "vehicleMatchingMessagingVehicle:inVehicles:", v15, v9, (_QWORD)v17));
          v7[2](v7, v15, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)updateStoredVehicle:(id)a3 usingMessagingVehicle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  const __CFString *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CRCarKitServiceAgent *v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;
  uint64_t v39;
  NSObject *v40;
  unsigned int v41;
  const __CFString *v42;
  void *v43;
  unsigned int v44;
  unsigned int v45;
  _BOOL8 v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  id v56;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryProtocols"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  if (v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleName")),
        v12 = objc_msgSend(v8, "isEqualToString:", v11),
        v11,
        (v12 & 1) == 0))
  {
    objc_msgSend(v6, "setVehicleName:", v8);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryProtocols"));
  v15 = objc_msgSend(v10, "isEqualToSet:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v6, "setAccessoryProtocols:", v10);
    v13 = 1;
  }
  if (objc_msgSend(v7, "transportType") != (id)3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsCarPlayConnectionRequest")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportsStartSessionRequest"));
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      v20 = CarGeneralLogging(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        if (v16)
        {
          v22 = objc_msgSend(v16, "BOOLValue");
          v23 = CFSTR("NO");
          if (v22)
            v23 = CFSTR("YES");
        }
        else
        {
          v23 = CFSTR("unset");
        }
        *(_DWORD *)buf = 138543618;
        v54 = v23;
        v55 = 2112;
        v56 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating supportsStartSessionRequest to %{public}@ for %@", buf, 0x16u);
      }

      objc_msgSend(v6, "setSupportsStartSessionRequest:", v16);
      v13 = 1;
    }
    v24 = objc_msgSend(v6, "supportsBluetoothLE");
    v25 = objc_msgSend(v7, "supportsBluetoothLE");
    if (v24 != (_DWORD)v25)
    {
      v26 = CarGeneralLogging(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend(v7, "supportsBluetoothLE");
        v29 = CFSTR("NO");
        if (v28)
          v29 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v54 = v29;
        v55 = 2112;
        v56 = v6;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating supportsBluetoothLE to %{public}@ for %@", buf, 0x16u);
      }

      objc_msgSend(v6, "setSupportsBluetoothLE:", objc_msgSend(v7, "supportsBluetoothLE"));
      v13 = 1;
    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportsThemeAssets"));
    if (!v30)
      goto LABEL_25;
    v31 = (void *)v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportsThemeAssets"));
    v52 = v8;
    v33 = v10;
    v34 = v16;
    v35 = self;
    v36 = objc_msgSend(v32, "BOOLValue");
    v37 = objc_msgSend(v7, "supportsThemeAssets");

    v38 = v36 == v37;
    self = v35;
    v16 = v34;
    v10 = v33;
    v8 = v52;
    if (!v38)
    {
LABEL_25:
      v39 = CarGeneralLogging(v30);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_msgSend(v7, "supportsThemeAssets");
        v42 = CFSTR("NO");
        if (v41)
          v42 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v54 = v42;
        v55 = 2112;
        v56 = v6;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Updating supportsThemeAssets to %{public}@ for %@", buf, 0x16u);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsThemeAssets")));
      objc_msgSend(v6, "setSupportsThemeAssets:", v43);

      v13 = 1;
    }

  }
  v44 = objc_msgSend(v6, "supportsUSBCarPlay");
  if (v44 != objc_msgSend(v7, "supportsUSBCarPlay"))
  {
    objc_msgSend(v6, "setSupportsUSBCarPlay:", objc_msgSend(v7, "supportsUSBCarPlay"));
    v13 = 1;
  }
  v45 = objc_msgSend(v6, "supportsWirelessCarPlay");
  if (v45 != objc_msgSend(v7, "supportsWirelessCarPlay"))
  {
    objc_msgSend(v6, "setSupportsWirelessCarPlay:", objc_msgSend(v7, "supportsWirelessCarPlay"));
    v13 = 1;
  }
  v46 = -[CRCarKitServiceAgent _currentlyConnectedVehicleSupportsMixableAudio](self, "_currentlyConnectedVehicleSupportsMixableAudio");
  v47 = objc_msgSend(v6, "supportsMixableAudio");
  if (v46 != (_DWORD)v47)
  {
    if (!CRIsInternalInstall(objc_msgSend(v6, "setSupportsMixableAudio:", v46)))
      goto LABEL_41;
    goto LABEL_39;
  }
  if ((CRIsInternalInstall(v47) & 1) != 0)
  {
LABEL_39:
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "setLastConnectedDate:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleModelName"));
    objc_msgSend(v6, "setVehicleModelName:", v49);

LABEL_41:
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v51 = objc_msgSend(v50, "saveVehicle:", v6);

    goto LABEL_42;
  }
  if (v13)
    goto LABEL_41;
LABEL_42:

}

- (id)pairedVehiclesConnectedOnBluetooth
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedBluetoothAddresses"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vehicleForBluetoothAddress:", v10));

        if (v12 && objc_msgSend(v12, "isPaired"))
          objc_msgSend(v3, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedVehicles"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000B6038));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredSetUsingPredicate:", v15));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore", (_QWORD)v30));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bluetoothAddress"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "vehicleForBluetoothAddress:", v24));

        if (v25 && objc_msgSend(v25, "isPaired"))
          objc_msgSend(v3, "addObject:", v25);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v19);
  }

  v27 = CarGeneralLogging(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v3;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "BT connected vehicles: %@", buf, 0xCu);
  }

  return v3;
}

- (BOOL)_currentlyConnectedVehicleSupportsMixableAudio
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionStatus](self, "sessionStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
    v5 = objc_msgSend(v4, "supportsSiriMixable");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)saveVehicle:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v22[5];
  id v23;
  _BYTE *v24;
  char v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v5 = objc_msgSend(v4, "isPaired");
  if (v4)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "saveVehicle:", v4));

    v9 = objc_msgSend(v8, "isPaired");
    if (v8)
    {
      v10 = (int)v9;
      v11 = CarGeneralLogging(v9);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = CFSTR("NO");
        if (v10)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        if (v6 != v10)
          v13 = CFSTR("YES");
        *(_WORD *)&buf[22] = 2114;
        v27 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Saved vehicle %@ (is Paired: %{public}@, pairing status changed: %{public}@)", buf, 0x20u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v27 = sub_10001F79C;
      v28 = sub_10001F7AC;
      v29 = (id)os_transaction_create("com.apple.carkit.WiFi");
      v15 = dispatch_time(0, 100000000);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100028870;
      v22[3] = &unk_1000B6088;
      v22[4] = self;
      v16 = v8;
      v25 = v10;
      v23 = v16;
      v24 = buf;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v22);
      v17 = v23;
      v18 = v16;

      _Block_object_dispose(buf, 8);
      v19 = v18;
      goto LABEL_15;
    }
  }
  else
  {
    v9 = objc_msgSend(0, "isPaired");
  }
  v20 = CarGeneralLogging(v9);
  v18 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10006B51C();
  v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)removeVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  char v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  CRCarKitServiceAgent *v21;
  id v22;
  NSObject *v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing vehicle %@", (uint8_t *)&buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v9 = objc_msgSend(v8, "removeVehicle:", v4);

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carplayWiFiUUID"));
    if (v7)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x3032000000;
      v27 = sub_10001F79C;
      v28 = sub_10001F7AC;
      v29 = (id)os_transaction_create("com.apple.carkit.WiFi");
      v10 = dispatch_time(0, 100000000);
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_100028E74;
      v20 = &unk_1000B60B0;
      v21 = self;
      v22 = v4;
      v23 = v7;
      p_buf = &buf;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, &v17);

      _Block_object_dispose(&buf, 8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress", v17, v18, v19, v20, v21));
    if (v11)
    {
      if (objc_msgSend(v4, "supportsBluetoothLE"))
      {
        v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
          v14 = objc_msgSend(v13, "unpairWithBluetoothLEIdentifier:", v12);

        }
        else
        {
          v14 = 1;
        }
      }
      else
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
        v14 = objc_msgSend(v12, "unpairWithBluetoothAddress:", v11);
      }

    }
    else
    {
      v14 = 1;
    }
    v15 = v9 & v14;

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006B604();
    v15 = 0;
  }

  return v15;
}

- (BOOL)attemptConnectionWithVehicles:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v30;
  char v31;
  uint64_t v32;
  id v33;
  NSObject *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  NSObject *v46;

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "attemptConnectionForVehicles %@", buf, 0xCu);
  }

  if (!-[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", 0))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v4;
    obj = v4;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (!v8)
    {
      v31 = 0;
      goto LABEL_36;
    }
    v9 = v8;
    v31 = 0;
    v10 = *(_QWORD *)v40;
    v32 = *(_QWORD *)v40;
    while (1)
    {
      v11 = 0;
      v33 = v9;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v12 = *(NSObject **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v11);
        v13 = -[NSObject isPaired](v12, "isPaired", v30);
        if ((_DWORD)v13)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connectedVehicles"));

          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v36;
LABEL_13:
            v19 = 0;
            while (1)
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleMatchingMessagingVehicle:inVehicles:](self, "vehicleMatchingMessagingVehicle:inVehicles:", v20, v21));

              if (v22)
                break;
              if (v17 == (id)++v19)
              {
                v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v17)
                  goto LABEL_13;
                goto LABEL_19;
              }
            }
            if (objc_msgSend(v20, "supportsCarPlayConnectionRequest"))
            {
              -[CRCarKitServiceAgent _sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:](self, "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", v20, v12);
              v31 = 1;
              goto LABEL_27;
            }
            v9 = v33;
            if (objc_msgSend(v20, "supportsWirelessCarPlay"))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
              objc_msgSend(v28, "requestWiFiCredentialsFromVehicle:", v20);

            }
            v31 = 1;
          }
          else
          {
LABEL_19:

            v23 = objc_claimAutoreleasedReturnValue(-[NSObject bluetoothAddress](v12, "bluetoothAddress"));
            v15 = v23;
            if (!v23)
            {
LABEL_27:
              v10 = v32;
              v9 = v33;
              goto LABEL_32;
            }
            v24 = CarGeneralLogging(v23);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            v9 = v33;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v15;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "attempting Bluetooth connection to %@", buf, 0xCu);
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
            objc_msgSend(v26, "connectWithBluetoothAddress:", v15);

          }
          v10 = v32;
        }
        else
        {
          v27 = CarGeneralLogging(v13);
          v15 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no WiFi credentials request necessary for %@", buf, 0xCu);
          }
        }
LABEL_32:

        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v9)
      {
LABEL_36:

        v4 = v30;
        v7 = v31;
        goto LABEL_37;
      }
    }
  }
  v7 = 0;
LABEL_37:

  return v7 & 1;
}

- (void)_sendCarPlayAvailabilityForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v28;

  v28 = a3;
  v6 = a4;
  if (objc_msgSend(v28, "supportsCarPlayConnectionRequest"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
    v8 = objc_msgSend(v7, "isCarPlayAllowed");

    if (v8)
    {
      if (v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bluetoothAddress"));
        v10 = v9 != 0;

        v11 = objc_msgSend(v6, "pairingStatus");
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      v14 = objc_msgSend(v28, "transportType") == (id)2 || objc_msgSend(v28, "transportType") == (id)4;
      if (objc_msgSend(v28, "supportsThemeAssets"))
      {
        if (v11 == (id)2
          || ((v15 = -[CRCarKitServiceAgent carPlaySimulatorActive](self, "carPlaySimulatorActive")) == 0
            ? (v12 = &__kCFBooleanFalse)
            : (v12 = &__kCFBooleanTrue),
              v6 && v15))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent featuresAvailabilityAgent](self, "featuresAvailabilityAgent"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", CRCarPlayFeaturesAllFerriteFeatures() & (unint64_t)objc_msgSend(v16, "supportedCarPlayFeaturesForVehicleIdentifier:", v17));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v18);

        }
        if (v14)
          goto LABEL_22;
      }
      else
      {
        v12 = 0;
        if (v14)
        {
LABEL_22:
          if (v11)
            v19 = v10;
          else
            v19 = 0;
          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
            v21 = v11 == (id)2;
            if (v11 == (id)2)
              v22 = &__kCFBooleanTrue;
            else
              v22 = 0;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));
            objc_msgSend(v20, "sendWiredCarPlayAvailable:wirelessCarPlayAvailable:themeAssetsAvailable:toVehicle:", v22, v23, v12, v28);

          }
          goto LABEL_35;
        }
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
      v25 = v24;
      if (v10)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11 == (id)2));
        objc_msgSend(v25, "sendWiredCarPlayAvailable:wirelessCarPlayAvailable:themeAssetsAvailable:toVehicle:", &__kCFBooleanTrue, v26, v12, v28);

      }
      else
      {
        objc_msgSend(v24, "sendWiredCarPlayAvailable:wirelessCarPlayAvailable:themeAssetsAvailable:toVehicle:", &__kCFBooleanTrue, 0, v12, v28);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carplay.starting-wired-connection"), 0, 0, 1u);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
      if (objc_msgSend(v28, "supportsThemeAssets"))
        v13 = &__kCFBooleanFalse;
      else
        v13 = 0;
      objc_msgSend(v12, "sendWiredCarPlayAvailable:wirelessCarPlayAvailable:themeAssetsAvailable:toVehicle:", &__kCFBooleanFalse, &__kCFBooleanFalse, v13, v28);
    }
LABEL_35:

  }
}

- (BOOL)_sendDeviceIdentifiersForMessagingVehicle:(id)a3 pairingStatus:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  BOOL v11;
  void *v13;

  v6 = a3;
  v7 = objc_msgSend(v6, "supportsCarPlayConnectionRequest");
  if ((v7 & 1) != 0)
    goto LABEL_7;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10006B630();

  if (!-[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", 0)
    && ((v10 = objc_msgSend(v6, "transportType"), a4 == 2) || v10 == (id)1))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
    objc_msgSend(v13, "sendDeviceTransportIdentifiersToVehicle:", v6);

    v11 = 1;
  }
  else
  {
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (BOOL)_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "transportType") == (id)2
    && objc_msgSend(v4, "supportsWirelessCarPlay")
    && (objc_msgSend(v4, "supportsCarPlayConnectionRequest") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
    objc_msgSend(v7, "requestWiFiCredentialsFromVehicle:", v4);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasExistingBluetoothPairingForPairingPromptFlow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messagingVehicle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));

  if (v5 || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothDeviceIdentifier"))) != 0)
  {
    v6 = +[CRBluetoothManager hasPairingWithAddress:](CRBluetoothManager, "hasPairingWithAddress:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)enhancedIntegrationSupportedForPairingPromptFlow:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_opt_class(CRVehicle);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = v6;
  if (v6 && (objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messagingVehicle"));
  v10 = -[CRCarKitServiceAgent _shouldPromptEnhancedIntegrationForStoredVehicle:messagingVehicle:](self, "_shouldPromptEnhancedIntegrationForStoredVehicle:messagingVehicle:", v8, v9);

  return v10;
}

- (BOOL)needsBluetoothTurnedOnForPairingPromptFlow:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager", a3));
  v4 = objc_msgSend(v3, "isPowered");

  return v4 ^ 1;
}

- (BOOL)needsWiFiTurnedOnForPairingPromptFlow:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager", a3));
  v4 = objc_msgSend(v3, "isPowered");

  return v4 ^ 1;
}

- (BOOL)supportsThemeAssetsForPairingPromptFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned __int8 v14;
  BOOL v15;
  int v17;
  unint64_t v18;
  __int16 v19;
  _BOOL4 v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messagingVehicle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messagingVehicle"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "certificateSerialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent featuresAvailabilityAgent](self, "featuresAvailabilityAgent"));
  v9 = (unint64_t)objc_msgSend(v8, "supportedCarPlayFeaturesForCertificateSerial:", v7);

  v10 = CRCarPlayFeaturesAllFerriteFeatures() & v9;
  v11 = CRCarPlayFeaturesAllFerriteFeatures();
  v12 = CarPairingLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 134218240;
    v18 = v9;
    v19 = 1024;
    v20 = v10 == v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "features: %lu, supportsThemeAssets: %u", (uint8_t *)&v17, 0x12u);
  }

  if (objc_msgSend(v5, "supportsCarPlayConnectionRequest"))
  {
    v14 = objc_msgSend(v5, "supportsThemeAssets");
    if (v10 == v11)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)outOfBandPairingDeclineCountForPairingPromptFlow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_pairingIdentifierForPromptFlow:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = objc_msgSend((id)objc_opt_class(self), "_pairingDeclineCountForIdentifier:", v6);
  else
    v7 = 0;

  return (unint64_t)v7;
}

- (void)incrementOutOfBandPairingDeclineCountForPairingPromptFlow:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_pairingIdentifierForPromptFlow:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    objc_msgSend((id)objc_opt_class(self), "_incrementPairingDeclineCountForIdentifier:", v6);

}

- (id)carKeyInfoForPairingPromptFlow:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messagingVehicle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "digitalCarKeyInformation"));

  return v4;
}

- (id)assetProgressForPairingPromptFlow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleAssetManager](self, "vehicleAssetManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetProgressForVehicle:", v4));

  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "prompt flow using asset progress: %@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (void)pairingPromptFlow:(id)a3 wantsToPerformPresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent setupPromptDirector](self, "setupPromptDirector"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029F60;
  v13[3] = &unk_1000B60D8;
  v14 = v6;
  v15 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A05C;
  v11[3] = &unk_1000B5080;
  v12 = v14;
  v9 = v14;
  v10 = v7;
  objc_msgSend(v8, "performWithPromptPresenter:errorHandler:", v13, v11);

}

- (void)_dismissPairingPromptFlow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bluetoothDeviceIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentBluetoothConfirmationHandler](self, "currentBluetoothConfirmationHandler"));
  v6 = (void *)v5;
  if (v5 && v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
  -[CRCarKitServiceAgent setCurrentBluetoothConfirmationHandler:](self, "setCurrentBluetoothConfirmationHandler:", 0);
  -[CRCarKitServiceAgent _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:](self, "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", v4, 0, 0);
  if (objc_msgSend(v14, "startedFromCarKey"))
  {
    v7 = objc_opt_class(CRVehicle);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v9 = v8;
    if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
      v11 = objc_msgSend(v10, "isPaired");
    else
      v11 = 0;
    -[CRCarKitServiceAgent _delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:](self, "_delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:", v11, v4, 0);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  objc_msgSend(v12, "invalidate");

  -[CRCarKitServiceAgent setCurrentPromptFlowController:](self, "setCurrentPromptFlowController:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent setupPromptDirector](self, "setupPromptDirector"));
  objc_msgSend(v13, "dismissPromptPresenter");

}

- (void)pairingPromptFlow:(id)a3 didCancelWithRequiredStepsRemaining:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  void *v12;
  __CFString *v13;
  _BOOL8 v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;

  v4 = a4;
  v6 = a3;
  v7 = CarPairingLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v21 = 138543362;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "canceling setup prompt flow, required steps remaining: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  if (v4)
  {
    v10 = objc_opt_class(CRVehicle);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      v14 = -[CRCarKitServiceAgent removeVehicle:](self, "removeVehicle:", v13);
      v15 = v14;
      v16 = CarPairingLogging(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "canceling setup prompt flow: removed vehicle %@", (uint8_t *)&v21, 0xCu);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_10006B700();
      }

    }
  }
  v19 = CarPairingLogging(-[CRCarKitServiceAgent _dismissPairingPromptFlow:](self, "_dismissPairingPromptFlow:", v6));
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "canceled setup prompt flow", (uint8_t *)&v21, 2u);
  }

}

- (void)didCompletePairingPromptFlow:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = CarPairingLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "completed setup prompt flow", v7, 2u);
  }

  -[CRCarKitServiceAgent _dismissPairingPromptFlow:](self, "_dismissPairingPromptFlow:", v4);
}

- (void)pairingPromptFlow:(id)a3 receivedBluetoothConfirmationResponse:(BOOL)a4 forDeviceIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  uint64_t v12;
  uint8_t v13[16];

  v5 = a4;
  v7 = a5;
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setup prompt flow received BT confirmation response", v13, 2u);
  }

  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentBluetoothConfirmationHandler](self, "currentBluetoothConfirmationHandler"));
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    ((void (**)(_QWORD, id, NSObject *))v10)[2](v10, v7, v11);
  }
  else
  {
    v12 = CarPairingLogging(0);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006B764();
  }

  -[CRCarKitServiceAgent setCurrentBluetoothConfirmationHandler:](self, "setCurrentBluetoothConfirmationHandler:", 0);
}

- (void)pairingPromptFlow:(id)a3 receivedBluetoothContactsSyncResponse:(BOOL)a4 forDeviceIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  v7 = a5;
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setup prompt flow received BT contacts sync response", v11, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
  objc_msgSend(v10, "setContactsSyncEnabled:forBluetoothAddress:", v5, v7);

}

- (void)_setVehiclePairingStatus:(unint64_t)a3 forPromptFlow:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = objc_opt_class(CRVehicle);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (objc_msgSend(v9, "pairingStatus") != (id)a3)
  {
    objc_msgSend(v9, "setPairingStatus:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "saveVehicle:", v9));

    objc_msgSend(v12, "setUserInfo:", v11);
  }

}

- (void)pairingPromptFlow:(id)a3 receivedAllowWhileLockedResponse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = CarGeneralLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      v10 = 2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "allow while locked accepted", buf, 2u);
    }
    else
    {
      v10 = 2;
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "allow while locked declined", v11, 2u);
    }
    v10 = 1;
  }

  -[CRCarKitServiceAgent _setVehiclePairingStatus:forPromptFlow:](self, "_setVehiclePairingStatus:forPromptFlow:", v10, v6);
}

- (void)pairingPromptFlow:(id)a3 receivedUseWirelessResponse:(BOOL)a4 turnOnBluetooth:(BOOL)a5 turnOnWiFi:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = objc_opt_class(CRVehicle);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v13 = v12;
  if (v12 && (objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messagingVehicle"));
  v16 = (void *)v15;
  if (v7)
  {
    v17 = CarGeneralLogging(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "turning on Bluetooth due to OOB pairing alert acceptance", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v19, "setPowered:", 1);

  }
  if (v6)
  {
    v20 = CarGeneralLogging(v15);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to OOB pairing alert acceptance", v28, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager"));
    objc_msgSend(v22, "setPowered:", 1);

  }
  v23 = CarGeneralLogging(v15);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v25)
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert accepted", v27, 2u);
    }

    -[CRCarKitServiceAgent _setVehiclePairingStatus:forPromptFlow:](self, "_setVehiclePairingStatus:forPromptFlow:", 2, v10);
    -[CRCarKitServiceAgent _beginWiredPairingWithMessagingVehicle:storedVehicle:](self, "_beginWiredPairingWithMessagingVehicle:storedVehicle:", v16, v14);
  }
  else
  {
    if (v25)
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert declined", v26, 2u);
    }

  }
}

- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayResponse:(BOOL)a4 turnOnWiFi:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_opt_class(CRVehicle);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v11 = v10;
  if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messagingVehicle"));
  v14 = (void *)v13;
  if (v5)
  {
    v15 = CarGeneralLogging(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to connect alert acceptance", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager"));
    objc_msgSend(v17, "setPowered:", 1);

  }
  v18 = CarPairingLogging(v13);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v20)
    {
      *(_WORD *)v27 = 0;
      v21 = 2;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "connect CarPlay accepted", v27, 2u);
    }
    else
    {
      v21 = 2;
    }
  }
  else
  {
    if (v20)
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "connect CarPlay declined", v26, 2u);
    }
    v21 = 1;
  }

  -[CRCarKitServiceAgent _setVehiclePairingStatus:forPromptFlow:](self, "_setVehiclePairingStatus:forPromptFlow:", v21, v8);
  v22 = objc_msgSend(v14, "supportsCarPlayConnectionRequest");
  v23 = objc_msgSend(v14, "transportType");
  if (v22)
  {
    if (v23 == (id)2 || objc_msgSend(v14, "transportType") == (id)4)
      -[CRCarKitServiceAgent _sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:](self, "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", v14, v12);
  }
  else if (v23 == (id)2)
  {
    -[CRCarKitServiceAgent _sendDeviceIdentifiersForMessagingVehicle:pairingStatus:](self, "_sendDeviceIdentifiersForMessagingVehicle:pairingStatus:", v14, v21);
    if (objc_msgSend(v12, "isPaired"))
      -[CRCarKitServiceAgent _requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:](self, "_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:", v14);
  }
  if (v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent _wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:](self, "_wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:", v14, v12));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v25, "userCreatedWirelessPairingWithSource:payload:", CFSTR("Settings"), v24);

  }
}

- (void)pairingPromptFlow:(id)a3 receivedConnectCarPlayFromCarKeyResponse:(BOOL)a4 vehicleName:(id)a5 turnOnWiFi:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothDeviceIdentifier"));
  v13 = CarPairingLogging(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key accepted", buf, 2u);
    }

    if (v6)
    {
      v17 = CarGeneralLogging(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "turning on Wi-Fi due to connect alert acceptance", v21, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent wifiManager](self, "wifiManager"));
      objc_msgSend(v19, "setPowered:", 1);

    }
    v14 = objc_alloc_init((Class)CRVehicle);
    -[NSObject setVehicleName:](v14, "setVehicleName:", v11);
    -[NSObject setBluetoothAddress:](v14, "setBluetoothAddress:", v12);
    objc_msgSend(v10, "setUserInfo:", v14);
    -[CRCarKitServiceAgent _setVehiclePairingStatus:forPromptFlow:](self, "_setVehiclePairingStatus:forPromptFlow:", 2, v10);
  }
  else if (v15)
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key declined", v20, 2u);
  }

  -[CRCarKitServiceAgent _delegateHeadUnitPairingDidReceiveUserConfirmation:forBluetoothAddress:](self, "_delegateHeadUnitPairingDidReceiveUserConfirmation:forBluetoothAddress:", v8, v12);
}

- (void)pairingPromptFlow:(id)a3 receivedEnhancedIntegrationResponse:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messagingVehicle"));
  v7 = CarGeneralLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      v10 = 2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert accepted", buf, 2u);
    }
    else
    {
      v10 = 2;
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert declined", v11, 2u);
    }
    v10 = 1;
  }

  -[CRCarKitServiceAgent _enhancedIntegrationUpdatedForMessagingVehicle:status:](self, "_enhancedIntegrationUpdatedForMessagingVehicle:status:", v6, v10);
}

- (void)presentHeadUnitPairingForBluetoothAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  id v11;
  CRPairingPromptFlowController *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v15 = 1752392040;
    v16 = 2113;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentPairingForBluetoothAddress: %{private, mask.hash}@", buf, 0x16u);
  }

  v13 = 0;
  v10 = -[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", &v13);
  v11 = v13;
  if (v10)
  {
    -[CRCarKitServiceAgent _delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:](self, "_delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:", 0, v6, v11);
  }
  else
  {
    v12 = objc_alloc_init(CRPairingPromptFlowController);
    -[CRPairingPromptFlowController setPromptDelegate:](v12, "setPromptDelegate:", self);
    -[CRCarKitServiceAgent setCurrentPromptFlowController:](self, "setCurrentPromptFlowController:", v12);
    -[CRPairingPromptFlowController handleCarKeyInitiatedConfirmationForDeviceAddress:showBluetoothOnlyOption:](v12, "handleCarKeyInitiatedConfirmationForDeviceAddress:showBluetoothOnlyOption:", v6, v4);

  }
}

- (void)didHeadUnitPairWithBluetoothAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothDeviceIdentifier"));

  if (!v6)
  {
    v13 = CarPairingLogging(v7);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006B790();
    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "isEqual:", v4);
  v9 = (char)v8;
  v10 = CarPairingLogging(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006B7BC();
LABEL_10:

    -[CRCarKitServiceAgent _delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:](self, "_delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:", 0, v4, 0);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 141558275;
    v15 = 1752392040;
    v16 = 2113;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "head unit pairing succeeded for Bluetooth addresses %{private, mask.hash}@", (uint8_t *)&v14, 0x16u);
  }

LABEL_11:
}

- (void)didFailToHeadUnitPairWithBluetoothAddress:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = CarPairingLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10006B868();

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "handleCarKeyInitiatedPairingFailed");
  }
  else
  {
    v13 = CarPairingLogging(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10006B83C();

  }
}

- (void)_delegateHeadUnitPairingDidReceiveUserConfirmation:(BOOL)a3 forBluetoothAddress:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent headUnitPairingDelegate](self, "headUnitPairingDelegate"));
  v7 = (void *)v6;
  if (v6
    && (objc_opt_respondsToSelector(v6, "headUnitPairingPresenter:didReceiveUserConfirmation:forBluetoothAddress:") & 1) != 0)
  {
    objc_msgSend(v7, "headUnitPairingPresenter:didReceiveUserConfirmation:forBluetoothAddress:", self, v4, v8);
  }

}

- (void)_delegateHeadUnitPairingDidCompletePairingFlow:(BOOL)a3 forBluetoothAddress:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent headUnitPairingDelegate](self, "headUnitPairingDelegate"));
  v10 = (void *)v9;
  if (v9
    && (objc_opt_respondsToSelector(v9, "headUnitPairingPresenter:didCompletePairingFlow:forBluetoothAddress:error:") & 1) != 0)
  {
    objc_msgSend(v10, "headUnitPairingPresenter:didCompletePairingFlow:forBluetoothAddress:error:", self, v6, v11, v8);
  }

}

- (void)_presentApprovalIfNecessaryForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "pairingStatus"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent preferencesManager](self, "preferencesManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "isCarPlaySetupEnabled"));
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
      -[CRCarKitServiceAgent _presentCarPlaySetupForMessagingVehicle:storedVehicle:](self, "_presentCarPlaySetupForMessagingVehicle:storedVehicle:", v11, v7);
    else
      -[CRCarKitServiceAgent _presentApprovalUsingAlertsForMessagingVehicle:](self, "_presentApprovalUsingAlertsForMessagingVehicle:", v11);
  }

}

- (void)_presentCarPlaySetupForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRPairingPromptFlowController *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "pairingStatus"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "pairingStatus") == (id)2));
      goto LABEL_6;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRVehicle vehicleForMessagingVehicle:](CRVehicle, "vehicleForMessagingVehicle:", v11));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent saveVehicle:](self, "saveVehicle:", v9));

  }
  v8 = 0;
LABEL_6:
  v10 = (CRPairingPromptFlowController *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  if (!v10)
  {
    v10 = objc_alloc_init(CRPairingPromptFlowController);
    -[CRPairingPromptFlowController setPromptDelegate:](v10, "setPromptDelegate:", self);
    -[CRCarKitServiceAgent setCurrentPromptFlowController:](self, "setCurrentPromptFlowController:", v10);
  }
  -[CRPairingPromptFlowController setUserInfo:](v10, "setUserInfo:", v7);
  -[CRPairingPromptFlowController handleConnectedMessagingVehicle:pairingAccepted:](v10, "handleConnectedMessagingVehicle:pairingAccepted:", v11, v8);

}

- (void)_presentApprovalUsingAlertsForMessagingVehicle:(id)a3
{
  id v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void ***v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  CRCarKitServiceAgent *v23;
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v4 = a3;
  if (objc_msgSend(v4, "transportType") == (id)2 || objc_msgSend(v4, "transportType") == (id)4)
  {
    v5 = CROutstandingWirelessVehicleApprovalAlert;
LABEL_4:
    v6 = objc_msgSend([v5 alloc], "initWithMessagingVehicle:", v4);
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "supportsUSBCarPlay"))
  {
    v5 = CROutstandingWiredVehicleApprovalAlert;
    goto LABEL_4;
  }
  if (objc_msgSend(v4, "supportsWirelessCarPlay")
    && objc_msgSend(v4, "supportsWiredBluetoothPairing"))
  {
    -[CRCarKitServiceAgent _presentWiredBluetoothPairingAlertForMessagingVehicle:storedVehicle:](self, "_presentWiredBluetoothPairingAlertForMessagingVehicle:storedVehicle:", v4, 0);
  }
  v6 = 0;
LABEL_5:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingApprovalAlerts](self, "outstandingApprovalAlerts"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v40;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v10), "messagingVehicle"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {

          goto LABEL_17;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v8)
        continue;
      break;
    }
  }

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_10001F79C;
  v37[4] = sub_10001F7AC;
  v38 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10002B8D8;
  v34[3] = &unk_1000B5B08;
  v36 = v37;
  v34[4] = self;
  v13 = v6;
  v35 = v13;
  v14 = objc_retainBlock(v34);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10001F79C;
  v32 = sub_10001F7AC;
  v33 = (id)objc_claimAutoreleasedReturnValue(+[CRVehicle vehicleForMessagingVehicle:](CRVehicle, "vehicleForMessagingVehicle:", v4));
  v15 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent saveVehicle:](self, "saveVehicle:", v29[5]));
  v16 = (void *)v29[5];
  v29[5] = v15;

  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10002B97C;
  v22 = &unk_1000B6100;
  v23 = self;
  v17 = v13;
  v24 = v17;
  v26 = &v28;
  v25 = v4;
  v27 = v37;
  v18 = objc_retainBlock(&v19);
  if (objc_msgSend(v17, "presentAlertWithCompletion:", v18, v19, v20, v21, v22, v23))
    ((void (*)(_QWORD *))v14[2])(v14);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v37, 8);

LABEL_17:
}

- (void)_dismissApprovalAlertForMessagingVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingApprovalAlerts](self, "outstandingApprovalAlerts", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messagingVehicle"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
          objc_msgSend(v10, "dismissAlert");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_dismissApprovalAlerts
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingApprovalAlerts](self, "outstandingApprovalAlerts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "dismissAlert");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)_pairingIdentifierForMessagingVehicle:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bluetoothAddress"));
  v4 = v3;
  if (!v3)
    v3 = CFSTR("CarPlay");
  v5 = v3;

  return v5;
}

+ (id)_pairingIdentifierForPromptFlow:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v3 = a3;
  v4 = objc_opt_class(CRVehicle);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v6 = v5;
  v7 = v6;
  if (v6 && (objc_opt_isKindOfClass(v6, v4) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

  }
  else
  {
    v12 = CarPairingLogging(v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006B960();

    v11 = 0;
  }

  return v11;
}

+ (unint64_t)_pairingDeclineCountForIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRVehicleStore payloadForVehicleWithIdentifier:](CRVehicleStore, "payloadForVehicleWithIdentifier:", a3));
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
    v6 = CarGeneralLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "OOB decline count: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    v5 = 0;
  }

  return (unint64_t)v5;
}

+ (void)_incrementPairingDeclineCountForIdentifier:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = (char *)objc_msgSend(a1, "_pairingDeclineCountForIdentifier:", v4);
  v6 = CarGeneralLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
    v10 = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Incrementing OOB decline count from %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5 + 1));
  +[CRVehicleStore setPayload:forVehicleWithIdentifier:](CRVehicleStore, "setPayload:forVehicleWithIdentifier:", v9, v4);

}

+ (unint64_t)_declineTypeForOOBPairingMessagingVehicle:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  __int16 v16;
  uint8_t buf[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "supportsWiredBluetoothPairing");
  if ((v5 & 1) == 0)
  {
    v11 = CarGeneralLogging(v5);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Doesn't support wired BT pairing.";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    v12 = 0;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "supportsUSBCarPlay");
  if ((_DWORD)v6)
  {
    v7 = CarGeneralLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v9 = "Supports USB - setting USB decline type.";
      v10 = (uint8_t *)&v16;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_pairingIdentifierForMessagingVehicle:", v4));
  v14 = objc_msgSend(a1, "_pairingDeclineCountForIdentifier:", v13);

  if ((unint64_t)v14 <= 2)
    v12 = 1;
  else
    v12 = 2;
LABEL_12:

  return v12;
}

- (void)_presentWiredBluetoothPairingAlertForMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  id v7;
  CROutstandingVehiclePairingAlert *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CROutstandingVehiclePairingAlert *v12;
  _QWORD *v13;
  CROutstandingVehiclePairingAlert *v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  CROutstandingVehiclePairingAlert *v19;
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[5];
  CROutstandingVehiclePairingAlert *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = -[CRMessagingVehicleAlert initWithMessagingVehicle:]([CROutstandingVehiclePairingAlert alloc], "initWithMessagingVehicle:", v6);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10001F79C;
  v27[4] = sub_10001F7AC;
  v28 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent bluetoothManager](self, "bluetoothManager"));
  v10 = objc_msgSend(v9, "isPowered") ^ 1;

  -[CROutstandingVehiclePairingAlert setShouldEnableBluetooth:](v8, "setShouldEnableBluetooth:", v10);
  v11 = objc_msgSend((id)objc_opt_class(self), "_declineTypeForOOBPairingMessagingVehicle:", v6);
  -[CROutstandingVehiclePairingAlert setDeclineType:](v8, "setDeclineType:", v11);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002C538;
  v24[3] = &unk_1000B5B08;
  v26 = v27;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v13 = objc_retainBlock(v24);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002C5DC;
  v18[3] = &unk_1000B6128;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  v23 = v11;
  v15 = v6;
  v20 = v15;
  v16 = v7;
  v21 = v16;
  v22 = v27;
  v17 = objc_retainBlock(v18);
  if (-[CRMessagingVehicleAlert presentAlertWithCompletion:](v14, "presentAlertWithCompletion:", v17))
    ((void (*)(_QWORD *))v13[2])(v13);

  _Block_object_dispose(v27, 8);
}

- (void)_beginWiredPairingWithMessagingVehicle:(id)a3 storedVehicle:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CRCarKitServiceAgent *v16;
  __int128 *p_buf;
  id v18;
  id location;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "starting wired Bluetooth pairing with %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_10001F79C;
  v23 = sub_10001F7AC;
  v24 = (id)os_transaction_create("com.apple.carkit.wiredPairing");
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent messagingConnector](self, "messagingConnector"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002CA00;
  v13[3] = &unk_1000B6150;
  v11 = v7;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  objc_copyWeak(&v18, &location);
  v16 = self;
  p_buf = &buf;
  objc_msgSend(v10, "beginWiredBluetoothPairingWithVehicle:completion:", v12, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

- (void)_dismissPairingAlertForMessagingVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingPairingAlerts](self, "outstandingPairingAlerts", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messagingVehicle"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
          objc_msgSend(v10, "dismissAlert");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_dismissPairingAlerts
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingPairingAlerts](self, "outstandingPairingAlerts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "dismissAlert");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_presentReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CRReconnectionEnableWiFiAlert *v7;
  CRReconnectionEnableWiFiAlert *v8;
  _QWORD *v9;
  CRReconnectionEnableWiFiAlert *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  CRReconnectionEnableWiFiAlert *v14;
  id v15;
  uint8_t *v16;
  _QWORD v17[5];
  CRReconnectionEnableWiFiAlert *v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presenting alert to ask to turn on Wi-Fi", buf, 2u);
  }

  v7 = -[CRReconnectionEnableWiFiAlert initWithVehicle:]([CRReconnectionEnableWiFiAlert alloc], "initWithVehicle:", v4);
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = sub_10001F79C;
  v24 = sub_10001F7AC;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002D04C;
  v17[3] = &unk_1000B5B08;
  v19 = buf;
  v17[4] = self;
  v8 = v7;
  v18 = v8;
  v9 = objc_retainBlock(v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002D0F0;
  v13[3] = &unk_1000B6178;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v11 = v4;
  v15 = v11;
  v16 = buf;
  v12 = objc_retainBlock(v13);
  if (-[CRReconnectionEnableWiFiAlert presentAlertWithCompletion:](v10, "presentAlertWithCompletion:", v12))
    ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(buf, 8);
}

- (id)_presentedReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnableWiFiAlerts](self, "outstandingEnableWiFiAlerts", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vehicle"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_dismissReconnectionEnableWiFiAlertForVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnableWiFiAlerts](self, "outstandingEnableWiFiAlerts"));
  v6 = objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicle", (_QWORD)v16));
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          objc_msgSend(v12, "dismissAlert");
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnableWiFiAlerts](self, "outstandingEnableWiFiAlerts"));
          objc_msgSend(v15, "removeObject:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)_dismissReconnectionEnableWiFiAlertExceptForVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnableWiFiAlerts](self, "outstandingEnableWiFiAlerts"));
  v6 = objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicle", (_QWORD)v16));
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "dismissAlert");
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnableWiFiAlerts](self, "outstandingEnableWiFiAlerts"));
          objc_msgSend(v15, "removeObject:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)vehicleIdentifierForCertificateSerial:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v26 = 0;
  v8 = -[CRCarKitServiceAgent _isRestricted:](self, "_isRestricted:", &v26);
  v9 = v26;
  if (v8)
  {
    v7[2](v7, 0, v9);
    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_15:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -99, 0));
    v7[2](v7, 0, v21);

    goto LABEL_16;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allStoredVehicles"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v12)
  {
LABEL_12:

    goto LABEL_15;
  }
  v13 = v12;
  v14 = *(_QWORD *)v23;
LABEL_6:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v14)
      objc_enumerationMutation(v11);
    v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "certificateSerialNumber"));
    v18 = objc_msgSend(v6, "isEqualToData:", v17);

    if ((v18 & 1) != 0)
      break;
    if (v13 == (id)++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v13)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));

  if (!v20)
    goto LABEL_15;
  ((void (**)(id, void *, id))v7)[2](v7, v20, 0);

LABEL_16:
}

- (void)_enhancedIntegrationUpdatedForMessagingVehicle:(id)a3 status:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRVehicle vehicleForMessagingVehicle:](CRVehicle, "vehicleForMessagingVehicle:", a3));
  objc_msgSend(v6, "setSupportsEnhancedIntegration:", 1);
  objc_msgSend(v6, "setEnhancedIntegrationStatus:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "saveVehicle:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v10 = CREnhancedIntegrationConsentDidChangeNotification;
  v14 = CREnhancedIntegrationConsentDidChangeNotificationVehicleCertificateSerialKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "certificateSerialNumber"));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v10, 0, v13);

  if (!v11)
}

- (void)_presentEnhancedIntegrationAlertForMessagingVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CRVehicleEnhancedIntegrationAlert *v7;
  CRVehicleEnhancedIntegrationAlert *v8;
  _QWORD *v9;
  CRVehicleEnhancedIntegrationAlert *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  CRVehicleEnhancedIntegrationAlert *v14;
  id v15;
  uint8_t *v16;
  _QWORD v17[5];
  CRVehicleEnhancedIntegrationAlert *v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting enhanced integration alert", buf, 2u);
  }

  v7 = -[CRMessagingVehicleAlert initWithMessagingVehicle:]([CRVehicleEnhancedIntegrationAlert alloc], "initWithMessagingVehicle:", v4);
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = sub_10001F79C;
  v24 = sub_10001F7AC;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002DBA8;
  v17[3] = &unk_1000B5B08;
  v19 = buf;
  v17[4] = self;
  v8 = v7;
  v18 = v8;
  v9 = objc_retainBlock(v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002DC08;
  v13[3] = &unk_1000B6178;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v11 = v4;
  v15 = v11;
  v16 = buf;
  v12 = objc_retainBlock(v13);
  if (-[CRMessagingVehicleAlert presentAlertWithCompletion:](v10, "presentAlertWithCompletion:", v12))
    ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(buf, 8);
}

- (void)_dismissEnhancedIntegrationAlertForMessagingVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnhancedIntegrationAlerts](self, "outstandingEnhancedIntegrationAlerts", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messagingVehicle"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
          objc_msgSend(v10, "dismissAlert");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_dismissEnhancedIntegrationAlerts
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent outstandingEnhancedIntegrationAlerts](self, "outstandingEnhancedIntegrationAlerts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "dismissAlert");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)bluetoothManager:(id)a3 didChangePowerState:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent BTPowerMessagingVehicle](self, "BTPowerMessagingVehicle", a3));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent BTPowerStoredVehicle](self, "BTPowerStoredVehicle"));

      if (v7)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent BTPowerMessagingVehicle](self, "BTPowerMessagingVehicle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent BTPowerStoredVehicle](self, "BTPowerStoredVehicle"));
        -[CRCarKitServiceAgent _beginWiredPairingWithMessagingVehicle:storedVehicle:](self, "_beginWiredPairingWithMessagingVehicle:storedVehicle:", v9, v8);

      }
    }
  }
}

- (void)bluetoothManager:(id)a3 requestsConfirmationForDeviceAddress:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t v23[16];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  if (v17)
  {
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002E20C;
    v24[3] = &unk_1000B61A0;
    objc_copyWeak(&v27, &location);
    v18 = v13;
    v25 = v18;
    v26 = v16;
    v19 = CarPairingLogging(-[CRCarKitServiceAgent setCurrentBluetoothConfirmationHandler:](self, "setCurrentBluetoothConfirmationHandler:", v24));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "showing numeric confirmation in pairing prompt flow", v23, 2u);
    }

    objc_msgSend(v17, "handleBluetoothPairingConfirmationRequestForDeviceIdentifier:vehicleName:numericCode:", v18, v14, v15);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = CarPairingLogging(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10006B98C();

  }
}

- (void)bluetoothManager:(id)a3 failedPairingForDeviceAddress:(id)a4 name:(id)a5 didTimeout:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];

  v6 = a6;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentPromptFlowController](self, "currentPromptFlowController"));
  v12 = CarPairingLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "showing BT failure in pairing prompt flow", v15, 2u);
    }

    objc_msgSend(v11, "handleBluetoothPairingFailedForDeviceIdentifier:vehicleName:isTimeout:", v9, v10, v6);
    -[CRCarKitServiceAgent _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:](self, "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", v9, 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006BA18();

  }
}

- (void)bluetoothManager:(id)a3 completedPairingForDeviceAddress:(id)a4 deviceName:(id)a5
{
  -[CRCarKitServiceAgent _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:](self, "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", a4, 1, 0);
}

- (void)_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent currentBluetoothPairingCompletion](self, "currentBluetoothPairingCompletion"));
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, _BOOL8, id))(v9 + 16))(v9, v16, v6, v8);
    if (v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent connectionTimeServiceAgent](self, "connectionTimeServiceAgent"));

      if (v11)
      {
        v12 = CARCarKitWirelessPairingCreatedEvent;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v12, 4, v13, 0));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent connectionTimeServiceAgent](self, "connectionTimeServiceAgent"));
        objc_msgSend(v15, "recordConnectionEvent:completion:", v14, &stru_1000B61C0);

      }
    }
  }
  -[CRCarKitServiceAgent setCurrentBluetoothPairingCompletion:](self, "setCurrentBluetoothPairingCompletion:", 0);

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent lastStartSessionDeviceID](self, "lastStartSessionDeviceID"));
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    v10 = CarGeneralLogging(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "calling stoppedSessionForHostIdentifier: via last started deviceID", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
    objc_msgSend(v12, "stoppedSessionForHostIdentifier:", v6);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MFiCertificateSerialNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vehicleForCertificateSerial:", v14));

    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "supportsStartSessionRequest"));
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
      {
        v18 = CarGeneralLogging(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "calling stoppedSessionForHostIdentifier: via vehicle record", v21, 2u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
        objc_msgSend(v20, "stoppedSessionForHostIdentifier:", v6);

      }
    }
  }

  -[CRCarKitServiceAgent setLastStartSessionDeviceID:](self, "setLastStartSessionDeviceID:", 0);
}

- (id)storedVehicleForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "MFiCertificateSerialNumber"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent vehicleStore](self, "vehicleStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleForCertificateSerial:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setCarPlaySimulatorActive:(BOOL)a3
{
  void *v5;

  if (self->_carPlaySimulatorActive != a3)
  {
    if (self->_carPlaySimulatorActive)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitServiceAgent sessionRequestClient](self, "sessionRequestClient"));
      objc_msgSend(v5, "cancelRequests");

    }
    self->_carPlaySimulatorActive = a3;
  }
}

- (CRHeadUnitPairingPresenterDelegate)headUnitPairingDelegate
{
  return (CRHeadUnitPairingPresenterDelegate *)objc_loadWeakRetained((id *)&self->_headUnitPairingDelegate);
}

- (void)setHeadUnitPairingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headUnitPairingDelegate, a3);
}

- (BOOL)carPlaySimulatorActive
{
  return self->_carPlaySimulatorActive;
}

- (CRCarKitMonitoringServiceAgent)monitoringService
{
  return (CRCarKitMonitoringServiceAgent *)objc_loadWeakRetained((id *)&self->_monitoringService);
}

- (void)setMonitoringService:(id)a3
{
  objc_storeWeak((id *)&self->_monitoringService, a3);
}

- (CRSetupPromptDirectorAgent)setupPromptDirector
{
  return (CRSetupPromptDirectorAgent *)objc_loadWeakRetained((id *)&self->_setupPromptDirector);
}

- (void)setSetupPromptDirector:(id)a3
{
  objc_storeWeak((id *)&self->_setupPromptDirector, a3);
}

- (CRVehicleAssetManaging)vehicleAssetManager
{
  return (CRVehicleAssetManaging *)objc_loadWeakRetained((id *)&self->_vehicleAssetManager);
}

- (void)setVehicleAssetManager:(id)a3
{
  objc_storeWeak((id *)&self->_vehicleAssetManager, a3);
}

- (CRWirelessSessionAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assertionManager, a3);
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void)setBluetoothManager:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManager, a3);
}

- (CARMessagingServiceConnector)messagingConnector
{
  return self->_messagingConnector;
}

- (void)setMessagingConnector:(id)a3
{
  objc_storeStrong((id *)&self->_messagingConnector, a3);
}

- (void)setPreferencesManager:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesManager, a3);
}

- (CRFeaturesAvailabilityAgent)featuresAvailabilityAgent
{
  return self->_featuresAvailabilityAgent;
}

- (void)setFeaturesAvailabilityAgent:(id)a3
{
  objc_storeStrong((id *)&self->_featuresAvailabilityAgent, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (CARSessionRequestClient)sessionRequestClient
{
  return self->_sessionRequestClient;
}

- (void)setSessionRequestClient:(id)a3
{
  objc_storeStrong((id *)&self->_sessionRequestClient, a3);
}

- (void)setVehicleStore:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStore, a3);
}

- (CRWiFiCarManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (CRPairingPromptFlowController)currentPromptFlowController
{
  return self->_currentPromptFlowController;
}

- (void)setCurrentPromptFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPromptFlowController, a3);
}

- (id)currentBluetoothConfirmationHandler
{
  return self->_currentBluetoothConfirmationHandler;
}

- (void)setCurrentBluetoothConfirmationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)currentBluetoothPairingCompletion
{
  return self->_currentBluetoothPairingCompletion;
}

- (void)setCurrentBluetoothPairingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSMutableArray)outstandingApprovalAlerts
{
  return self->_outstandingApprovalAlerts;
}

- (void)setOutstandingApprovalAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingApprovalAlerts, a3);
}

- (NSMutableArray)outstandingPairingAlerts
{
  return self->_outstandingPairingAlerts;
}

- (void)setOutstandingPairingAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingPairingAlerts, a3);
}

- (NSMutableArray)outstandingEnableWiFiAlerts
{
  return self->_outstandingEnableWiFiAlerts;
}

- (void)setOutstandingEnableWiFiAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingEnableWiFiAlerts, a3);
}

- (NSMutableArray)outstandingEnhancedIntegrationAlerts
{
  return self->_outstandingEnhancedIntegrationAlerts;
}

- (void)setOutstandingEnhancedIntegrationAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingEnhancedIntegrationAlerts, a3);
}

- (NSNumber)cachedCarPlayAllowedChangeValue
{
  return self->_cachedCarPlayAllowedChangeValue;
}

- (void)setCachedCarPlayAllowedChangeValue:(id)a3
{
  self->_cachedCarPlayAllowedChangeValue = (NSNumber *)a3;
}

- (NSMutableDictionary)serviceCountDuringAlertForBluetoothAddress
{
  return self->_serviceCountDuringAlertForBluetoothAddress;
}

- (void)setServiceCountDuringAlertForBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCountDuringAlertForBluetoothAddress, a3);
}

- (NSString)lastStartSessionDeviceID
{
  return self->_lastStartSessionDeviceID;
}

- (void)setLastStartSessionDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_lastStartSessionDeviceID, a3);
}

- (CRMessagingServiceVehicleRepresenting)BTPowerMessagingVehicle
{
  return self->_BTPowerMessagingVehicle;
}

- (void)setBTPowerMessagingVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_BTPowerMessagingVehicle, a3);
}

- (CRVehicle)BTPowerStoredVehicle
{
  return self->_BTPowerStoredVehicle;
}

- (void)setBTPowerStoredVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_BTPowerStoredVehicle, a3);
}

- (CRLoggingChannelManager)loggingChannelManager
{
  return self->_loggingChannelManager;
}

- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent
{
  return self->_connectionTimeServiceAgent;
}

- (void)setConnectionTimeServiceAgent:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, 0);
  objc_storeStrong((id *)&self->_loggingChannelManager, 0);
  objc_storeStrong((id *)&self->_BTPowerStoredVehicle, 0);
  objc_storeStrong((id *)&self->_BTPowerMessagingVehicle, 0);
  objc_storeStrong((id *)&self->_lastStartSessionDeviceID, 0);
  objc_storeStrong((id *)&self->_serviceCountDuringAlertForBluetoothAddress, 0);
  objc_storeStrong((id *)&self->_outstandingEnhancedIntegrationAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingEnableWiFiAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingPairingAlerts, 0);
  objc_storeStrong((id *)&self->_outstandingApprovalAlerts, 0);
  objc_storeStrong(&self->_currentBluetoothPairingCompletion, 0);
  objc_storeStrong(&self->_currentBluetoothConfirmationHandler, 0);
  objc_storeStrong((id *)&self->_currentPromptFlowController, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_sessionRequestClient, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_featuresAvailabilityAgent, 0);
  objc_storeStrong((id *)&self->_preferencesManager, 0);
  objc_storeStrong((id *)&self->_messagingConnector, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_destroyWeak((id *)&self->_vehicleAssetManager);
  objc_destroyWeak((id *)&self->_setupPromptDirector);
  objc_destroyWeak((id *)&self->_monitoringService);
  objc_destroyWeak((id *)&self->_headUnitPairingDelegate);
}

@end
