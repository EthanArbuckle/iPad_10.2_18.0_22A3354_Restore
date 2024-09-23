@implementation NIServerNearbyAccessorySession

- (NIServerNearbyAccessorySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NIServerNearbyAccessorySession *v12;
  NIServerNearbyAccessorySession *v13;
  shared_ptr<rose::protobuf::Logger> *p_pbLogger;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  OS_dispatch_queue *clientQueue;
  NINearbyAccessoryConfiguration *v20;
  NINearbyAccessoryConfiguration *configuration;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *sessionUniqueIdentifier;
  NINearbyUpdatesEngine *v28;
  NINearbyAccessoryConfiguration *v29;
  OS_dispatch_queue *v30;
  void *v31;
  __shared_weak_count *cntrl;
  unint64_t *v33;
  unint64_t v34;
  NINearbyUpdatesEngine *v35;
  NINearbyUpdatesEngine *updatesEngine;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  void *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NIServerNearbyAccessorySession *v47;
  void *v49;
  void *v50;
  id v52;
  id v53;
  Logger *ptr;
  std::__shared_weak_count *v55;
  __int128 v56;
  objc_super v57;

  v53 = a3;
  v52 = a4;
  v9 = objc_opt_class(v52, v8);
  if (v9 != objc_opt_class(NINearbyAccessoryConfiguration, v10))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyAccessorySession.mm"), 134, CFSTR("NINearbyAccessoryConfiguration given invalid configuration."));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "serverSessionIdentifier"));

  if (!v11)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyAccessorySession.mm"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v57.receiver = self;
  v57.super_class = (Class)NIServerNearbyAccessorySession;
  v12 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v57, "initWithResourcesManager:configuration:error:", v53, v52, a5);
  v13 = v12;
  if (v12)
  {
    if (v53)
      objc_msgSend(v53, "protobufLogger");
    else
      v56 = 0uLL;
    p_pbLogger = &v12->_pbLogger;
    sub_1000145E8((uint64_t)p_pbLogger, &v56);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v56 + 1);
    if (*((_QWORD *)&v56 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v56 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "clientConnectionQueue"));
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v18;

    v20 = (NINearbyAccessoryConfiguration *)objc_msgSend(v52, "copy");
    configuration = v13->_configuration;
    v13->_configuration = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "serverSessionIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@---%@"), v23, v25));
    sessionUniqueIdentifier = v13->_sessionUniqueIdentifier;
    v13->_sessionUniqueIdentifier = (NSString *)v26;

    -[NIConfiguration setSupportsCameraAssistance:](v13->_configuration, "setSupportsCameraAssistance:", +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture"));
    v28 = [NINearbyUpdatesEngine alloc];
    v29 = v13->_configuration;
    v30 = v13->_clientQueue;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "analytics"));
    ptr = p_pbLogger->__ptr_;
    cntrl = p_pbLogger->__cntrl_;
    v55 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v33 = (unint64_t *)((char *)cntrl + 8);
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v35 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v28, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v29, v30, v13, v13, v31, &ptr, a5);
    updatesEngine = v13->_updatesEngine;
    v13->_updatesEngine = v35;

    v37 = v55;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        v39 = __ldaxr(p_shared_owners);
      while (__stlxr(v39 - 1, p_shared_owners));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }

    if (v13->_updatesEngine)
    {
      v13->_sessionState = 0;
      v13->_backgroundAuthorization = 0;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
      v41 = v13->_sessionUniqueIdentifier;
      v42 = v53;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "clientProcessSigningIdentity"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "addServiceClient:identifier:processName:configuration:", v13, v41, v43, v13->_configuration));

      if (!v44)
      {
        v47 = v13;
        goto LABEL_31;
      }
      v45 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003D31F0((uint64_t)v44, v45, v46);
        if (a5)
          goto LABEL_26;
      }
      else if (a5)
      {
LABEL_26:
        v47 = 0;
        *a5 = objc_retainAutorelease(v44);
LABEL_31:

        goto LABEL_32;
      }
      v47 = 0;
      goto LABEL_31;
    }
  }
  v47 = 0;
  v42 = v53;
LABEL_32:

  return v47;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundAuthorization != 2;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture");
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  NINearbyAccessoryConfiguration *configuration;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  configuration = self->_configuration;
  if (!configuration)
    sub_1003D325C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryDiscoveryToken](configuration, "accessoryDiscoveryToken"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](self->_configuration, "bluetoothDeviceIdentifier"));

    v6 = qword_10085F520;
    if (v5)
    {
      v7 = (id)qword_10085F520;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](self->_configuration, "bluetoothDeviceIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
        v12 = 138412290;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration specifies BLE peripheral: %@", (uint8_t *)&v12, 0xCu);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration does not specify a BLE peripheral", (uint8_t *)&v12, 2u);
    }
    v10 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D3284();
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  }
  return v10;
}

- (id)run
{
  __objc2_class *v2;
  unsigned int v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  NSObject *v10;
  const char *v11;
  int64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSString *sessionUniqueIdentifier;
  void *v17;
  void *v18;
  NIServerSessionResourceManager *v19;
  void *v20;
  NIServerBackgroundContinuationManager *v21;
  NSString *v22;
  void *v23;
  OS_dispatch_queue *clientQueue;
  void *v25;
  NIServerBackgroundContinuationManager *v26;
  NIServerBackgroundContinuationManager *backgroundContinuationManager;
  void *v28;
  _QWORD v29[4];
  id v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_sessionState = 1;
  v4 = -[NINearbyAccessoryConfiguration dataExchangeDisabledAndUsingParameterOverrides](self->_configuration, "dataExchangeDisabledAndUsingParameterOverrides");
  v5 = qword_10085F520;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration disables data exchange and is using parameter overrides", buf, 2u);
    }
    self->_backgroundAuthorization = 2;
    v33.receiver = self;
    v33.super_class = (Class)NIServerNearbyAccessorySession;
    v6 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v33, "backgroundSupportUpdateHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v6);
    ((void (**)(_QWORD, BOOL))v7)[2](v7, -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

    v8 = objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
    goto LABEL_5;
  }
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v2 = NIUtils;
    v11 = +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode"));
    *(_DWORD *)buf = 136315138;
    v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration background mode: %s", buf, 0xCu);
  }

  v12 = -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode");
  if (v12 == 2)
  {
    if (self->_backgroundAuthorization - 1 < 2)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
      goto LABEL_5;
    }
    if (!self->_backgroundAuthorization)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerAccessoryGATTServiceManager sharedInstance](NIServerAccessoryGATTServiceManager, "sharedInstance"));
      sessionUniqueIdentifier = self->_sessionUniqueIdentifier;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](self->_configuration, "bluetoothDeviceIdentifier"));
      objc_msgSend(v15, "addServiceListener:withIdentifier:forBluetoothPeer:withConfiguration:", self, sessionUniqueIdentifier, v17, self->_configuration);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerAccessoryGATTServiceManager sharedInstance](NIServerAccessoryGATTServiceManager, "sharedInstance"));
      objc_msgSend(v18, "probeAuthorizationForServiceListenerWithIdentifier:", self->_sessionUniqueIdentifier);

      return 0;
    }
LABEL_18:
    v31.receiver = self;
    v31.super_class = (Class)NIServerNearbyAccessorySession;
    v19 = -[NIServerBaseSession resourcesManager](&v31, "resourcesManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_initWeak((id *)buf, self);
    v21 = [NIServerBackgroundContinuationManager alloc];
    v22 = self->_sessionUniqueIdentifier;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appStateMonitor"));
    clientQueue = self->_clientQueue;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "analytics"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10018A120;
    v29[3] = &unk_1007FB4C8;
    objc_copyWeak(&v30, (id *)buf);
    v26 = -[NIServerBackgroundContinuationManager initWithSessionIdentifier:appStateMonitor:queue:analyticsManager:backgroundAuthHandler:](v21, "initWithSessionIdentifier:appStateMonitor:queue:analyticsManager:backgroundAuthHandler:", v22, v23, clientQueue, v25, v29);
    backgroundContinuationManager = self->_backgroundContinuationManager;
    self->_backgroundContinuationManager = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

    return v28;
  }
  if (v12 == 1)
    goto LABEL_18;
  if (v12)
    return v2;
  self->_backgroundAuthorization = 2;
  v32.receiver = self;
  v32.super_class = (Class)NIServerNearbyAccessorySession;
  v13 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v32, "backgroundSupportUpdateHandler");
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v13);
  ((void (**)(_QWORD, BOOL))v14)[2](v14, -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

  v8 = objc_claimAutoreleasedReturnValue(-[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning"));
LABEL_5:
  v2 = (__objc2_class *)v8;
  return v2;
}

- (id)_finalizeRunning
{
  void *v3;
  NIServerSessionResourceManager *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;

  self->_sessionState = 2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
  objc_msgSend(v3, "notifyServiceClientWithIdentifier:isRunning:", self->_sessionUniqueIdentifier, 1);

  v11.receiver = self;
  v11.super_class = (Class)NIServerNearbyAccessorySession;
  v4 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lifecycleSupervisor"));
  v7 = -[NINearbyAccessoryConfiguration backgroundMode](self->_configuration, "backgroundMode");
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (!v7)
    {
      objc_msgSend(v6, "setTimeoutOnPeerInactivity:", 1);
      objc_msgSend(v6, "setMaxInactivityBeforeTrackingBeganSeconds:", 10.0);
      objc_msgSend(v6, "setMaxInactivityAfterTrackingBeganSeconds:", 30.0);
    }
  }
  else
  {
    objc_msgSend(v6, "setTimeoutOnPeerInactivity:", 0);
  }
  if (-[NINearbyAccessoryConfiguration dataExchangeDisabledAndUsingParameterOverrides](self->_configuration, "dataExchangeDisabledAndUsingParameterOverrides"))
  {
    objc_msgSend(v6, "setTimeoutOnPeerInactivity:", 0);
  }
  if (objc_msgSend(v6, "timeoutOnPeerInactivity"))
  {
    objc_msgSend(v6, "runWithConfigurationCalled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryDiscoveryToken](self->_configuration, "accessoryDiscoveryToken"));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v6, "startedDiscoveringPeersWithTokens:", v9);

  }
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  unsigned __int8 v5;
  void *v6;
  NIServerSessionResourceManager *v7;
  void *v8;
  void *v9;
  objc_super v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (a3 == 2)
    v5 = 4;
  else
    v5 = 3;
  self->_sessionState = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
  objc_msgSend(v6, "notifyServiceClientWithIdentifier:isRunning:", self->_sessionUniqueIdentifier, 0);

  v11.receiver = self;
  v11.super_class = (Class)NIServerNearbyAccessorySession;
  v7 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lifecycleSupervisor"));
  if (objc_msgSend(v9, "timeoutOnPeerInactivity"))
    objc_msgSend(v9, "pauseCalled");

  return 0;
}

- (id)disableAllServices
{
  id v3;
  void *v4;
  NINearbyAccessoryConfiguration *configuration;
  void *v6;
  void *v7;
  NIServerBackgroundContinuationManager *backgroundContinuationManager;
  objc_super v10;

  self->_sessionState = 6;
  v10.receiver = self;
  v10.super_class = (Class)NIServerNearbyAccessorySession;
  v3 = -[NIServerBaseSession disableAllServices](&v10, "disableAllServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  configuration = self->_configuration;
  self->_configuration = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
  objc_msgSend(v6, "removeServiceClientWithIdentifier:", self->_sessionUniqueIdentifier);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerAccessoryGATTServiceManager sharedInstance](NIServerAccessoryGATTServiceManager, "sharedInstance"));
  objc_msgSend(v7, "removeServiceListenerWithIdentifier:", self->_sessionUniqueIdentifier);

  -[NIServerBackgroundContinuationManager invalidate](self->_backgroundContinuationManager, "invalidate");
  backgroundContinuationManager = self->_backgroundContinuationManager;
  self->_backgroundContinuationManager = 0;

  return v4;
}

- (void)invalidate
{
  id v3;
  objc_super v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyAccessorySession;
  -[NIServerBaseSession invalidate](&v4, "invalidate");
  v3 = -[NIServerNearbyAccessorySession disableAllServices](self, "disableAllServices");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
  objc_msgSend(v3, "removeServiceClientWithIdentifier:", self->_sessionUniqueIdentifier);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerAccessoryGATTServiceManager sharedInstance](NIServerAccessoryGATTServiceManager, "sharedInstance"));
  objc_msgSend(v4, "removeServiceListenerWithIdentifier:", self->_sessionUniqueIdentifier);

  v5.receiver = self;
  v5.super_class = (Class)NIServerNearbyAccessorySession;
  -[NIServerNearbyAccessorySession dealloc](&v5, "dealloc");
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3
{
  id v4;
  OS_dispatch_queue *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018A748;
  v7[3] = &unk_1007FB000;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)serviceDidReceiveNewSolution:(const void *)a3
{
  __int128 v5;
  OS_dispatch_queue *clientQueue;
  id v7;
  _QWORD block[5];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[560];
  _BYTE v14[16];
  _QWORD *v15[16];
  char v16;
  __n128 v17[4];
  void *__p;
  void *v19;
  char v20;
  _BYTE v21[545];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[560];
  _BYTE v26[16];
  _QWORD *v27[16];
  char v28;
  __n128 v29[4];
  void *v30;
  void *v31;
  char v32;
  _BYTE v33[545];

  v5 = *((_OWORD *)a3 + 1);
  v22 = *(_OWORD *)a3;
  v23 = v5;
  v24 = *((_OWORD *)a3 + 2);
  sub_10015A39C(v25, (uint64_t)a3 + 48);
  sub_100153F08(v26, (uint64_t)a3 + 608);
  sub_10015A3F0(v29, (__n128 *)((char *)a3 + 760));
  memcpy(v33, (char *)a3 + 880, sizeof(v33));
  objc_initWeak(&v7, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10018AB28;
  block[3] = &unk_10080A710;
  objc_copyWeak(&v9, &v7);
  v10 = v22;
  v11 = v23;
  v12 = v24;
  sub_10015A39C(v13, (uint64_t)v25);
  sub_100153F08(v14, (uint64_t)v26);
  sub_10015A3F0(v17, v29);
  memcpy(v21, v33, sizeof(v21));
  block[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  if (v20 && __p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (v16)
    sub_10003E3F0((uint64_t)v15, v15[1]);
  sub_100144868((uint64_t)v13);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v7);
  if (v32 && v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v28)
    sub_10003E3F0((uint64_t)v27, v27[1]);
  sub_100144868((uint64_t)v25);
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2;
  void *v4;
  OS_dispatch_queue *clientQueue;
  _QWORD block[5];
  id v8[2];
  int v9;
  id location;

  var2 = a3.var2;
  v4 = *(void **)&a3.var0;
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018AEF8;
  block[3] = &unk_10080A748;
  objc_copyWeak(v8, &location);
  v9 = var2;
  v8[1] = v4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)serviceDidInvalidateWithReason:(int)a3
{
  OS_dispatch_queue *clientQueue;
  _QWORD v6[5];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10018B22C;
  v6[3] = &unk_1007FA8E8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)processVisionInput:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine acceptVisionInput:](self->_updatesEngine, "acceptVisionInput:", v4);

}

- (id)printableState
{
  NSMutableArray *v3;
  void *v4;
  unint64_t sessionState;
  const char *v6;
  unint64_t backgroundAuthorization;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_autoreleasePoolPush();
  sessionState = (char)self->_sessionState;
  if (sessionState > 6)
    v6 = "Unknown";
  else
    v6 = off_10080A848[sessionState];
  backgroundAuthorization = (char)self->_backgroundAuthorization;
  if (backgroundAuthorization > 2)
    v8 = "Unknown";
  else
    v8 = off_10080A880[backgroundAuthorization];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("State: %s. BG auth: %s"), v6, v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryConfigData](self->_configuration, "accessoryConfigData"));
  v11 = sub_10002D250(v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Blob: %@"), v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return -[NIDiscoveryToken initWithDeviceAddress:]([NIDiscoveryToken alloc], "initWithDeviceAddress:", (unsigned __int16)a3);
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  void *v3;
  id v4;
  $BEC950A715106DE229A2E4BA1089E24D v5;
  _BOOL8 v6;
  optional<unsigned long long> result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "shortDeviceAddress"));
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  v5.__val_ = (unint64_t)v4;
  v6 = 1;
  result.__engaged_ = v6;
  result.var0 = v5;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unsigned __int16 v3;
  NINearbyObject *v4;
  NIDiscoveryToken *v5;
  NINearbyObject *v6;

  v3 = a3;
  v4 = [NINearbyObject alloc];
  v5 = -[NIDiscoveryToken initWithDeviceAddress:]([NIDiscoveryToken alloc], "initWithDeviceAddress:", v3);
  v6 = -[NINearbyObject initWithToken:](v4, "initWithToken:", v5);

  return v6;
}

- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  unsigned __int8 v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  objc_super v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)buf = 136315138;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Background continuation auth? %s", buf, 0xCu);
  }
  if (v3)
    v7 = 1;
  else
    v7 = 2;
  self->_backgroundAuthorization = v7;
  v10.receiver = self;
  v10.super_class = (Class)NIServerNearbyAccessorySession;
  v8 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v10, "backgroundSupportUpdateHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v8);
  ((void (**)(_QWORD, BOOL))v9)[2](v9, -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

}

- (void)accessoryGATTServiceFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NINearbyObject *v10;
  void *v11;
  NINearbyObject *v12;
  NIServerSessionResourceManager *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  objc_super v18;
  NINearbyObject *v19;
  uint8_t buf[24];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4)
    __assert_rtn("-[NIServerNearbyAccessorySession accessoryGATTServiceFailedWithError:]", "NIServerNearbyAccessorySession.mm", 637, "error");
  if (self->_sessionState == 6)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D34A4();
  }
  else
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](self->_configuration, "bluetoothDeviceIdentifier"));
      sub_1003D34D0(v6, (uint64_t)v4, buf, v5);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
    objc_msgSend(v7, "notifyServiceClientWithIdentifier:isRunning:", self->_sessionUniqueIdentifier, 0);

    self->_backgroundAuthorization = 0;
    v18.receiver = self;
    v18.super_class = (Class)NIServerNearbyAccessorySession;
    v8 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v18, "backgroundSupportUpdateHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(_QWORD, BOOL))v9)[2](v9, -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

    self->_sessionState = 5;
    v10 = [NINearbyObject alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryDiscoveryToken](self->_configuration, "accessoryDiscoveryToken"));
    v12 = -[NINearbyObject initWithToken:](v10, "initWithToken:", v11);

    v17.receiver = self;
    v17.super_class = (Class)NIServerNearbyAccessorySession;
    v13 = -[NIServerBaseSession resourcesManager](&v17, "resourcesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remote"));
    v19 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    objc_msgSend(v15, "didRemoveNearbyObjects:withReason:", v16, 0);

  }
}

- (void)accessoryGATTServiceAuthorizedBackgroundOperation
{
  NSObject *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_sessionState == 6)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D3534();
  }
  else
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](self->_configuration, "bluetoothDeviceIdentifier"));
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Bluetooth device %@ is background authorized", buf, 0xCu);

    }
    self->_backgroundAuthorization = 1;
    v8.receiver = self;
    v8.super_class = (Class)NIServerNearbyAccessorySession;
    v5 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v8, "backgroundSupportUpdateHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v5);
    ((void (**)(_QWORD, BOOL))v6)[2](v6, -[NIServerNearbyAccessorySession supportsBackgroundedClients](self, "supportsBackgroundedClients"));

    if (self->_sessionState == 1)
      v7 = -[NIServerNearbyAccessorySession _finalizeRunning](self, "_finalizeRunning");
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  NINearbyUpdatesEngine *v6;
  id v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = (NINearbyUpdatesEngine *)a3;
  v7 = a4;
  if (self->_updatesEngine != v6)
    __assert_rtn("-[NIServerNearbyAccessorySession updatesEngine:didUpdateNearbyObjects:]", "NIServerNearbyAccessorySession.mm", 694, "engine == _updatesEngine");
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018BD6C;
  v10[3] = &unk_1007FB000;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async((dispatch_queue_t)clientQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  NINearbyUpdatesEngine *v8;
  id v9;
  id v10;
  OS_dispatch_queue *clientQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = (NINearbyUpdatesEngine *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_updatesEngine != v8)
    __assert_rtn("-[NIServerNearbyAccessorySession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerNearbyAccessorySession.mm", 763, "engine == _updatesEngine");
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C068;
  block[3] = &unk_1007FB050;
  objc_copyWeak(&v17, &location);
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async((dispatch_queue_t)clientQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4;
  NINearbyObject *v5;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *sessionUniqueIdentifier;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  NINearbyObject *v15;
  __int16 v16;
  NSString *v17;
  NINearbyObject *v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v4);
  self->_sessionState = 5;
  v5 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v4);
  v13.receiver = self;
  v13.super_class = (Class)NIServerNearbyAccessorySession;
  v6 = -[NIServerBaseSession resourcesManager](&v13, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remote"));
  v18 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v8, "didRemoveNearbyObjects:withReason:", v9, 0);

  v10 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    sessionUniqueIdentifier = self->_sessionUniqueIdentifier;
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = sessionUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,peerInactivityPeriodExceeded: %@ with reason: Timeout, for session identifier: %@", buf, 0x16u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerNearbyAccessoryRangingService sharedInstance](NIServerNearbyAccessoryRangingService, "sharedInstance"));
  objc_msgSend(v12, "notifyServiceClientWithIdentifier:isRunning:", self->_sessionUniqueIdentifier, 0);

}

- (NINearbyAccessoryConfiguration)configuration
{
  return (NINearbyAccessoryConfiguration *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_backgroundContinuationManager, 0);
  objc_storeStrong((id *)&self->_sessionUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
