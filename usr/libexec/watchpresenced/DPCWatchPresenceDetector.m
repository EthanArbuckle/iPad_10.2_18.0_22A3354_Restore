@implementation DPCWatchPresenceDetector

- (DPCWatchPresenceDetector)init
{
  DPCWatchPresenceDetector *v2;
  uint64_t v3;
  DPCTelemetry *telemetry;
  DPCStateMachine *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *executionQueue;
  id v12;
  OS_dispatch_queue *v13;
  void *v14;
  CBCentralManager *v15;
  CBCentralManager *manager;
  uint64_t v17;
  NRPairedDeviceRegistry *nrClient;
  NSObject *v19;
  DPCWatchPresenceDetector *v20;
  void **v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  DPCWatchPresenceDetector *v26;
  objc_super v27;
  uint64_t v28;
  void *v29;

  v27.receiver = self;
  v27.super_class = (Class)DPCWatchPresenceDetector;
  v2 = -[DPCWatchPresenceDetector init](&v27, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DPCTelemetry sharedInstance](DPCTelemetry, "sharedInstance"));
    telemetry = v2->_telemetry;
    v2->_telemetry = (DPCTelemetry *)v3;

    v5 = objc_opt_new(DPCStateMachine);
    -[DPCWatchPresenceDetector setStateMachine:](v2, "setStateMachine:", v5);

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.watchpresenced.executionQueue", v9);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc((Class)CBCentralManager);
    v13 = v2->_executionQueue;
    v28 = CBCentralManagerOptionReceiveSystemEvents;
    v29 = &__kCFBooleanTrue;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v15 = (CBCentralManager *)objc_msgSend(v12, "initWithDelegate:queue:options:", v2, v13, v14);
    manager = v2->_manager;
    v2->_manager = v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    nrClient = v2->_nrClient;
    v2->_nrClient = (NRPairedDeviceRegistry *)v17;

    -[DPCWatchPresenceDetector setDetectedNewErrorBlock:](v2, "setDetectedNewErrorBlock:", &stru_10000C638);
    -[DPCWatchPresenceDetector setDetectedNewEventBlock:](v2, "setDetectedNewEventBlock:", &stru_10000C658);
    -[DPCWatchPresenceDetector setDetectedNewWatchStatusEventBlock:](v2, "setDetectedNewWatchStatusEventBlock:", &stru_10000C678);
    v19 = v2->_executionQueue;
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100004828;
    v25 = &unk_10000C6A0;
    v20 = v2;
    v26 = v20;
    dispatch_async(v19, &v22);
    -[DPCWatchPresenceDetector _registerSwitchWatchNotification](v20, "_registerSwitchWatchNotification", v22, v23, v24, v25);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocing DPCBTCCLient", buf, 2u);
  }

  -[DPCWatchPresenceDetector resetAll](self, "resetAll");
  v5.receiver = self;
  v5.super_class = (Class)DPCWatchPresenceDetector;
  -[DPCWatchPresenceDetector dealloc](&v5, "dealloc");
}

- (void)_updateActiveNRDevice
{
  NRDevice *v3;
  NRDevice *v4;
  id *p_currentActiveDevice;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  id v17;
  NSObject *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = (NRDevice *)objc_claimAutoreleasedReturnValue(-[NRPairedDeviceRegistry getActivePairedDevice](self->_nrClient, "getActivePairedDevice"));
  v4 = v3;
  if (!v3)
  {
    v14 = sub_100002F3C((uint64_t)off_100012CB8);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v16 = "No active watch found...";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  p_currentActiveDevice = (id *)&self->_currentActiveDevice;
  if (v3 == self->_currentActiveDevice)
  {
    v17 = sub_100002F3C((uint64_t)off_100012CB8);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Still the same watch, no further action needed", (uint8_t *)&v20, 2u);
    }

    -[DPCWatchPresenceDetector connectToWatch](self, "connectToWatch");
  }
  else
  {
    objc_storeStrong((id *)&self->_currentActiveDevice, v3);
    v6 = *p_currentActiveDevice;
    v7 = sub_100002F3C((uint64_t)off_100012CB8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_currentActiveDevice, "valueForProperty:", NRDevicePropertyName));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_currentActiveDevice, "valueForProperty:", NRDevicePropertyAdvertisedName));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_currentActiveDevice, "valueForProperty:", NRDevicePropertyPairingID));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_currentActiveDevice, "valueForProperty:", NRDevicePropertyBluetoothMACAddress));
        v20 = 138413058;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ActiveDevice changed to: %@, AD name %@, uuid: %@, address %@", (uint8_t *)&v20, 0x2Au);

      }
      if (-[CBCentralManager state](self->_manager, "state") == (id)5)
      {
        -[DPCWatchPresenceDetector connectToWatch](self, "connectToWatch");
        -[DPCWatchPresenceDetector checkAndStartRSSIDetection](self, "checkAndStartRSSIDetection");
        goto LABEL_20;
      }
      v19 = sub_100002F3C((uint64_t)off_100012CB8);
      v15 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v16 = "BT not ready yet";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100007174(v9);

  }
LABEL_20:

}

- (id)getCurrentWatchMACAddress
{
  NRDevice *currentActiveDevice;

  currentActiveDevice = self->_currentActiveDevice;
  if (currentActiveDevice
    || (-[DPCWatchPresenceDetector _updateActiveNRDevice](self, "_updateActiveNRDevice"),
        (currentActiveDevice = self->_currentActiveDevice) != 0))
  {
    currentActiveDevice = (NRDevice *)objc_claimAutoreleasedReturnValue(-[NRDevice valueForProperty:](currentActiveDevice, "valueForProperty:", NRDevicePropertyBluetoothMACAddress));
  }
  return currentActiveDevice;
}

- (void)connectToWatch
{
  DPCWatchPresenceDetector *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSString *macAddress;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  CBPeripheral *watch;
  CBPeripheral *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  CBPeripheral *v16;
  id v17;
  void *v18;
  id v19;
  NRDeviceMonitor *v20;
  NRDeviceMonitor *nrMonitor;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *p_super;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  CBPeripheral *v40;
  __int16 v41;
  void *v42;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDevice valueForProperty:](v2->_currentActiveDevice, "valueForProperty:", NRDevicePropertyBluetoothMACAddress));
  if (!v3)
  {
    v31 = sub_100002F3C((uint64_t)off_100012CB8);
    p_super = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_1000071B4(p_super, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_16;
  }
  if (!-[NSString isEqualToString:](v2->_macAddress, "isEqualToString:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](v2, "stateMachine"));
    objc_msgSend(v4, "setIsSwitchingWatch:", 1);

    v5 = sub_100002F3C((uint64_t)off_100012CB8);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      macAddress = v2->_macAddress;
      v39 = 138412546;
      v40 = (CBPeripheral *)macAddress;
      v41 = 2112;
      v42 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Switching from %@ to %@", (uint8_t *)&v39, 0x16u);
    }

    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewWatchStatusEventBlock](v2, "detectedNewWatchStatusEventBlock"));
    v8[2](v8, 0);

    -[DPCTelemetry registerWatchSwitch](v2->_telemetry, "registerWatchSwitch");
  }
  objc_storeStrong((id *)&v2->_macAddress, v3);
  v9 = objc_claimAutoreleasedReturnValue(-[CBCentralManager retrievePeripheralWithAddress:](v2->_manager, "retrievePeripheralWithAddress:", v2->_macAddress));
  watch = v2->_watch;
  v2->_watch = (CBPeripheral *)v9;

  v11 = v2->_watch;
  if (!v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](v11, "identifier")),
        v13 = v12 == 0,
        v12,
        v13))
  {
    v22 = sub_100002F3C((uint64_t)off_100012CB8);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100007220((uint64_t)v3, v23, v24, v25, v26, v27, v28, v29);

    p_super = &v2->_watch->super.super;
    v2->_watch = 0;
LABEL_16:

    goto LABEL_17;
  }
  v14 = sub_100002F3C((uint64_t)off_100012CB8);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v2->_watch;
    v39 = 138412290;
    v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Successfully retrieved CBPeripheral %@", (uint8_t *)&v39, 0xCu);
  }

  v17 = objc_alloc((Class)NRDeviceMonitor);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral identifier](v2->_watch, "identifier"));
  v19 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:](NRDeviceIdentifier, "newDeviceIdentifierWithBluetoothUUID:", v18);
  v20 = (NRDeviceMonitor *)objc_msgSend(v17, "initWithDeviceIdentifier:delegate:queue:", v19, v2, v2->_executionQueue);
  nrMonitor = v2->_nrMonitor;
  v2->_nrMonitor = v20;

  -[SFClient getPairedWatchWristStateWithCompletionHandler:](v2->_sfClient, "getPairedWatchWristStateWithCompletionHandler:", v2->_wristDetectionHandler);
LABEL_17:

  objc_sync_exit(v2);
}

- (void)loadPolicy
{
  void *v3;
  unsigned int v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  DPCBasePolicy *v8;
  DPCBasePolicy *policy;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  v4 = objc_msgSend(v3, "isInRSSIMode");

  if (v4)
    v5 = DPCRSSIPolicy;
  else
    v5 = DPCConnectivityPolicy;
  v6 = [v5 alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  v8 = (DPCBasePolicy *)objc_msgSend(v6, "initWithStateMachine:", v7);
  policy = self->_policy;
  self->_policy = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewEventBlock](self, "detectedNewEventBlock"));
  -[DPCBasePolicy setDetectedNewEventBlock:](self->_policy, "setDetectedNewEventBlock:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewErrorBlock](self, "detectedNewErrorBlock"));
  -[DPCBasePolicy setDetectedNewErrorBlock:](self->_policy, "setDetectedNewErrorBlock:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewWatchStatusEventBlock](self, "detectedNewWatchStatusEventBlock"));
  -[DPCBasePolicy setDetectedNewWatchStatusEventBlock:](self->_policy, "setDetectedNewWatchStatusEventBlock:", v12);

}

- (void)resetWatchMonitors
{
  NRDeviceMonitor *nrMonitor;

  nrMonitor = self->_nrMonitor;
  self->_nrMonitor = 0;

}

- (void)resetBT
{
  NRDeviceMonitor *nrMonitor;
  CBPeripheral *watch;

  -[DPCWatchPresenceDetector disableRSSIStatisticsDetection](self, "disableRSSIStatisticsDetection");
  nrMonitor = self->_nrMonitor;
  self->_nrMonitor = 0;

  watch = self->_watch;
  self->_watch = 0;

}

- (void)resetAll
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005058;
  block[3] = &unk_10000C6A0;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)checkAndStartRSSIDetection
{
  CBPeripheral *watch;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  if (objc_msgSend(v6, "isRunning") && -[DPCBasePolicy requireRSSI](self->_policy, "requireRSSI"))
  {
    watch = self->_watch;

    if (watch)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
      v5 = objc_msgSend(v4, "currentWatchWristState");

      if (v5 == (id)3)
        -[DPCWatchPresenceDetector runDiscoveryMode](self, "runDiscoveryMode");
      else
        -[DPCWatchPresenceDetector disableRSSIStatisticsDetection](self, "disableRSSIStatisticsDetection");
    }
  }
  else
  {

  }
}

- (BOOL)checkIfBluetoothPowerOff
{
  return -[CBCentralManager state](self->_manager, "state") == (id)4;
}

- (BOOL)checkIfBluetoothReady
{
  return -[CBCentralManager state](self->_manager, "state") == (id)5;
}

- (void)_stopWristMonitoring
{
  id v3;
  NSObject *v4;
  SFClient *sfClient;
  uint8_t v6[16];

  if (self->_sfClient)
  {
    v3 = sub_100002F3C((uint64_t)off_100012CB8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping on wrist detection...", v6, 2u);
    }

    -[SFClient monitorPairedWatchWristStateWithCompletionHandler:](self->_sfClient, "monitorPairedWatchWristStateWithCompletionHandler:", &stru_10000C6E0);
    sfClient = self->_sfClient;
    self->_sfClient = 0;

  }
}

- (void)_setupOnWristMonitoring
{
  id v3;
  NSObject *v4;
  SFClient *v5;
  SFClient *sfClient;
  _QWORD *v7;
  id wristDetectionHandler;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up on wrist detection...", (uint8_t *)buf, 2u);
  }

  v5 = objc_opt_new(SFClient);
  sfClient = self->_sfClient;
  self->_sfClient = v5;

  -[SFClient setDispatchQueue:](self->_sfClient, "setDispatchQueue:", self->_executionQueue);
  objc_initWeak(buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005378;
  v9[3] = &unk_10000C708;
  objc_copyWeak(&v10, buf);
  v7 = objc_retainBlock(v9);
  wristDetectionHandler = self->_wristDetectionHandler;
  self->_wristDetectionHandler = v7;

  -[SFClient monitorPairedWatchWristStateWithCompletionHandler:](self->_sfClient, "monitorPairedWatchWristStateWithCompletionHandler:", self->_wristDetectionHandler);
  -[SFClient getPairedWatchWristStateWithCompletionHandler:](self->_sfClient, "getPairedWatchWristStateWithCompletionHandler:", self->_wristDetectionHandler);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_registerSwitchWatchNotification
{
  const char *v3;
  NSObject *executionQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification, "UTF8String");
  executionQueue = self->_executionQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005490;
  v5[3] = &unk_10000C730;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_notifyToken, executionQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)detectWatchWristStateEvent:(int64_t)a3
{
  DPCWatchPresenceDetector *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;

  v4 = self;
  objc_sync_enter(v4);
  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 >= 4)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Undefined state (%ld)"), a3));
    else
      v7 = *(&off_10000C778 + a3);
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WristEvent]: \"%@\", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](v4, "stateMachine"));
  objc_msgSend(v8, "setCurrentWatchWristState:", a3);

  objc_sync_exit(v4);
  -[DPCWatchPresenceDetector sendWatchWristStateEvent:](v4, "sendWatchWristStateEvent:", a3);
  -[DPCBasePolicy onWristStateChange:](v4->_policy, "onWristStateChange:", a3);
  -[DPCWatchPresenceDetector checkAndStartRSSIDetection](v4, "checkAndStartRSSIDetection");
}

- (void)sendWatchWristStateEvent:(int64_t)a3
{
  void (**v5)(void);

  -[DPCTelemetry registerWatchWristEvent:](self->_telemetry, "registerWatchWristEvent:");
  if (a3 == 2 || a3 == 3)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewWatchStatusEventBlock](self, "detectedNewWatchStatusEventBlock"));
    v5[2]();

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  int v9;
  id v10;

  v4 = -[CBCentralManager state](self->_manager, "state", a3);
  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 == (id)5)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBManager is ready!", (uint8_t *)&v9, 2u);
    }

    -[DPCWatchPresenceDetector connectToWatch](self, "connectToWatch");
    -[DPCWatchPresenceDetector checkAndStartRSSIDetection](self, "checkAndStartRSSIDetection");
  }
  else
  {
    if (v7)
    {
      v8 = -[CBCentralManager state](self->_manager, "state");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth is unavailable %ld", (uint8_t *)&v9, 0xCu);
    }

    -[DPCWatchPresenceDetector resetBT](self, "resetBT");
  }
}

- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v16 = objc_msgSend(v15, "isEqualToString:", CBInternalErrorDomain);

    if (v16 && objc_msgSend(v14, "code") != (id)19)
    {
      v17 = sub_100002F3C((uint64_t)off_100012CB8);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RSSI callback error %@", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetRssiStatisticsDetectionMaximum")));
    -[DPCWatchPresenceDetector checkPolicyWithRSSI:](self, "checkPolicyWithRSSI:", v19);

  }
}

- (void)changeRSSIStatisticsDetection:(id)a3 manager:(id)a4 closer:(id)a5 further:(id)a6 maskDecision:(int64_t)a7
{
  char v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  __CFString **v23;
  void *v24;
  signed int v25;
  unsigned int v26;
  uint64_t v27;
  signed int v28;
  void *v29;
  void *v30;
  signed int v31;
  void *v32;
  uint64_t v33;
  signed int v34;
  void *v35;
  void *v36;
  signed int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  id v58;
  DPCWatchPresenceDetector *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v12 && v13)
  {
    v58 = v12;
    v59 = self;
    v57 = 1 << v7;
    v17 = objc_msgSend(v14, "intValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));
    v20 = objc_msgSend(v19, "intValue");

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v22 = v21;
    v23 = &off_10000C460;
    if (v17 != v20)
      v23 = &off_10000C458;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "NSNumberForDefault:", *v23));
    v25 = objc_msgSend(v24, "intValue");

    v26 = v25 / 4 - 1;
    if (v26 >= 3)
      v27 = 1;
    else
      v27 = v26;
    v28 = objc_msgSend(v14, "intValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));
    v31 = objc_msgSend(v30, "intValue");

    if (v28 > v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));

      v14 = (id)v33;
    }
    v34 = objc_msgSend(v15, "intValue");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMAX")));
    v37 = objc_msgSend(v36, "intValue");

    if (v34 < v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMAX")));

      v15 = (id)v39;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v40, CBRSSIStatisticAndDetectionEnable);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CBRSSIStatisticAndDetectionAverageThresholdFurther);
    v41 = CBRSSIStatisticAndDetectionMaximumThresholdFurther;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CBRSSIStatisticAndDetectionMaximumThresholdFurther);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CBRSSIStatisticAndDetectionMedianThresholdFurther);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CBRSSIStatisticAndDetectionAverageThresholdCloser);
    v42 = CBRSSIStatisticAndDetectionMaximumThresholdCloser;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CBRSSIStatisticAndDetectionMaximumThresholdCloser);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CBRSSIStatisticAndDetectionMedianThresholdCloser);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v43, CBRSSIStatisticAndDetectionVarThreshold1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v44, CBRSSIStatisticAndDetectionVarThreshold2);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v57));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v45, CBRSSIStatisticAndDetectionMaskDecisionLogic);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v46, CBRSSIStatisticAndDetectionCMCheckLogic);

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v47, CBRSSIStatisticAndDetectionCM_AND_Mask);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v48, CBRSSIStatisticAndDetectionCM_XOR_Mask);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, CBRSSIStatisticAndDetectionCM_AND_Mask2);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CBRSSIStatisticAndDetectionEnableDebugging);

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, CBRSSIStatisticAndDetectionWindowConfiguration);

    v52 = sub_100002F3C((uint64_t)off_100012CB8);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    v12 = v58;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v42));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v41));
      *(_DWORD *)buf = 138412546;
      v61 = v54;
      v62 = 2112;
      v63 = v55;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Enabled BT RSSI Stat with closer: %@ db, further: %@ db", buf, 0x16u);

    }
    objc_msgSend(v13, "setRSSIStatisticsDetection:options:", v58, v16);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](v59, "stateMachine"));
    objc_msgSend(v56, "setIsRunningRSSIStatDetecion:", 1);

  }
}

- (void)disableRSSIStatisticsDetection:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
      v10 = objc_msgSend(v9, "isRunningRSSIStatDetecion");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CBRSSIStatisticAndDetectionEnable);

        v13 = sub_100002F3C((uint64_t)off_100012CB8);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412290;
          v17 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling BT RSSI Stat against %@", (uint8_t *)&v16, 0xCu);
        }

        objc_msgSend(v8, "setRSSIStatisticsDetection:options:", v6, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
        objc_msgSend(v15, "setIsRunningRSSIStatDetecion:", 0);

      }
    }
  }

}

- (void)start
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = +[DPCDefaults isRSSIModeEnabled](DPCDefaults, "isRSSIModeEnabled");
  v4 = objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  objc_msgSend((id)v4, "setIsInRSSIMode:", v3);

  -[DPCWatchPresenceDetector loadPolicy](self, "loadPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  LOBYTE(v4) = objc_msgSend(v5, "isRunning");

  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
    objc_msgSend(v6, "setIsRunning:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
    objc_msgSend(v7, "setIsMonitoringAbsence:", 1);

    if (!self->_watch)
      -[DPCWatchPresenceDetector _updateActiveNRDevice](self, "_updateActiveNRDevice");
    -[DPCWatchPresenceDetector _setupOnWristMonitoring](self, "_setupOnWristMonitoring");
    -[DPCWatchPresenceDetector checkAndStartRSSIDetection](self, "checkAndStartRSSIDetection");
  }
}

- (void)stop
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  v4 = objc_msgSend(v3, "isRunning");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
    objc_msgSend(v5, "setIsRunning:", 0);

    -[DPCWatchPresenceDetector disableRSSIStatisticsDetection](self, "disableRSSIStatisticsDetection");
  }
}

- (unint64_t)prestartCheck
{
  unint64_t v3;
  void *v4;

  if (-[DPCWatchPresenceDetector checkIfBluetoothPowerOff](self, "checkIfBluetoothPowerOff"))
  {
    v3 = 3;
LABEL_6:
    -[DPCTelemetry registerError:](self->_telemetry, "registerError:", v3);
    return v3;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector getCurrentWatchMACAddress](self, "getCurrentWatchMACAddress"));

  if (!v4)
  {
    v3 = 2;
    goto LABEL_6;
  }
  return 0;
}

- (void)disableRSSIStatisticsDetection
{
  -[DPCWatchPresenceDetector disableRSSIStatisticsDetection:manager:](self, "disableRSSIStatisticsDetection:manager:", self->_watch, self->_manager);
}

- (void)monitorRSSIPresence
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000062D8;
  block[3] = &unk_10000C6A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)monitorRSSIAbsence
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000644C;
  block[3] = &unk_10000C6A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)runDiscoveryMode
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000664C;
  block[3] = &unk_10000C6A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)checkPolicyWithRSSI:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  float v7;
  unint64_t v8;
  int v9;
  double v10;

  v4 = a3;
  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "floatValue");
    v9 = 134217984;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RSSI Updates: %.2f", (uint8_t *)&v9, 0xCu);
  }

  v8 = -[DPCBasePolicy onRSSIChange:](self->_policy, "onRSSIChange:", v4);
  if (v8 == 2)
  {
    -[DPCWatchPresenceDetector monitorRSSIAbsence](self, "monitorRSSIAbsence");
  }
  else if (v8 == 1)
  {
    -[DPCWatchPresenceDetector monitorRSSIPresence](self, "monitorRSSIPresence");
  }

}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  NSObject *executionQueue;
  _QWORD block[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000694C;
  block[3] = &unk_10000C758;
  objc_copyWeak(&v8, &location);
  v9 = a4;
  dispatch_async(executionQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v4 = a4;
  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deviceIsConnectedDidChange isConnected: %d", (uint8_t *)v7, 8u);
  }

}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v5 = a4;
  v6 = sub_100002F3C((uint64_t)off_100012CB8);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceLinkTypeDidChange to :%d", (uint8_t *)v8, 8u);
  }

}

- (void)watchConnectivityChanges
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  void *StringFromNRLinkType;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  int v28;
  void *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  void *v37;

  if (self->_nrMonitor)
  {
    v3 = sub_100002F3C((uint64_t)off_100012CB8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDeviceMonitor deviceIdentifier](self->_nrMonitor, "deviceIdentifier"));
      v6 = -[NRDeviceMonitor isConnected](self->_nrMonitor, "isConnected");
      v7 = -[NRDeviceMonitor isCloudConnected](self->_nrMonitor, "isCloudConnected");
      v8 = -[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby");
      StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRDeviceMonitor linkType](self->_nrMonitor, "linkType"));
      v28 = 138413314;
      v29 = v5;
      v30 = 1024;
      v31 = v6;
      v32 = 1024;
      v33 = v7;
      v34 = 1024;
      v35 = v8;
      v36 = 2112;
      v37 = StringFromNRLinkType;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current connection to %@, isConnected %d, isCloudConnected %d, isBluetoothConnected %d, linkType %@", (uint8_t *)&v28, 0x28u);

    }
    -[DPCTelemetry registerWatchConnectivity:](self->_telemetry, "registerWatchConnectivity:", -[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewWatchStatusEventBlock](self, "detectedNewWatchStatusEventBlock"));

    if (v10)
    {
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector detectedNewWatchStatusEventBlock](self, "detectedNewWatchStatusEventBlock"));
      if (-[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby"))
        v12 = 4;
      else
        v12 = 3;
      v11[2](v11, v12);

    }
    v13 = -[NRDeviceMonitor isConnected](self->_nrMonitor, "isConnected");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
    objc_msgSend(v14, "setIsWatchConnected:", v13);

    v15 = -[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
    objc_msgSend(v16, "setIsBluetoothConnected:", v15);

    if (-[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
      v18 = objc_msgSend(v17, "isSwitchingWatch");

      v19 = sub_100002F3C((uint64_t)off_100012CB8);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDeviceMonitor deviceIdentifier](self->_nrMonitor, "deviceIdentifier"));
          v28 = 138412290;
          v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Switched to watch: %@", (uint8_t *)&v28, 0xCu);

        }
        v20 = objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
        -[NSObject setIsSwitchingWatch:](v20, "setIsSwitchingWatch:", 0);
      }
      else if (v21)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NRDeviceMonitor deviceIdentifier](self->_nrMonitor, "deviceIdentifier"));
        v28 = 138412290;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Watch %@ connected.", (uint8_t *)&v28, 0xCu);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
      v27 = objc_msgSend(v26, "isInRSSIMode");

      if (v27)
        -[DPCWatchPresenceDetector checkAndStartRSSIDetection](self, "checkAndStartRSSIDetection");
    }
    else
    {
      v23 = sub_100002F3C((uint64_t)off_100012CB8);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Watch disconnected from BT", (uint8_t *)&v28, 2u);
      }

    }
    -[DPCBasePolicy onWatchConnectivityChange:](self->_policy, "onWatchConnectivityChange:", -[NRDeviceMonitor isNearby](self->_nrMonitor, "isNearby"));
  }
}

- (void)setEnabledStreamingMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  CBPeripheral *watch;
  CBCentralManager *manager;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  objc_msgSend(v5, "setIsInRSSIStreamingMode:", v3);

  -[DPCWatchPresenceDetector disableRSSIStatisticsDetection](self, "disableRSSIStatisticsDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DPCWatchPresenceDetector stateMachine](self, "stateMachine"));
  LODWORD(v5) = objc_msgSend(v6, "isInRSSIStreamingMode");

  if ((_DWORD)v5)
  {
    manager = self->_manager;
    watch = self->_watch;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDMIN")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdDDiscovery")));
    -[DPCWatchPresenceDetector changeRSSIStatisticsDetection:manager:closer:further:maskDecision:](self, "changeRSSIStatisticsDetection:manager:closer:further:maskDecision:", watch, manager, v9, v11, 1);

  }
}

- (id)detectedNewEventBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDetectedNewEventBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)detectedNewErrorBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setDetectedNewErrorBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)detectedNewWatchStatusEventBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setDetectedNewWatchStatusEventBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (DPCStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_detectedNewWatchStatusEventBlock, 0);
  objc_storeStrong(&self->_detectedNewErrorBlock, 0);
  objc_storeStrong(&self->_detectedNewEventBlock, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);
  objc_storeStrong((id *)&self->_nrClient, 0);
  objc_storeStrong(&self->_wristDetectionHandler, 0);
  objc_storeStrong((id *)&self->_sfClient, 0);
  objc_storeStrong((id *)&self->_nrMonitor, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
