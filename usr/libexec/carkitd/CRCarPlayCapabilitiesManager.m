@implementation CRCarPlayCapabilitiesManager

- (CRCarPlayCapabilitiesManager)initWithSessionStatus:(id)a3
{
  id v5;
  CRCarPlayCapabilitiesManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workerQueue;
  uint64_t v11;
  CRCarPlayCapabilities *carCapabilities;
  CRCarplayCapabilitiesStateMachine *v13;
  CRCarplayCapabilitiesStateMachine *stateMachine;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSURL *carCapabilitiesURL;
  uint64_t v20;
  CRVehicleAccessoryManager *accessoryManager;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRCarPlayCapabilitiesManager;
  v6 = -[CRCarPlayCapabilitiesManager init](&v27, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.carkitd.carcapabilities.manager", v8);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[CRCarPlayCapabilities fetchCarCapabilities](CRCarPlayCapabilities, "fetchCarCapabilities"));
    carCapabilities = v6->_carCapabilities;
    v6->_carCapabilities = (CRCarPlayCapabilities *)v11;

    v13 = objc_alloc_init(CRCarplayCapabilitiesStateMachine);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v13;

    if ((CRIsTestContext(v15, v16) & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLForKey:", CFSTR("CRCarPlayCapabilitiesPlistPathKey")));
      carCapabilitiesURL = v6->_carCapabilitiesURL;
      v6->_carCapabilitiesURL = (NSURL *)v18;

    }
    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    -[CARSessionStatus addSessionObserver:](v6->_sessionStatus, "addSessionObserver:", v6);
    v20 = objc_claimAutoreleasedReturnValue(+[CRVehicleAccessoryManager sharedInstance](CRVehicleAccessoryManager, "sharedInstance"));
    accessoryManager = v6->_accessoryManager;
    v6->_accessoryManager = (CRVehicleAccessoryManager *)v20;

    -[CRVehicleAccessoryManager addObserver:](v6->_accessoryManager, "addObserver:", v6);
    objc_initWeak(&location, v6);
    v22 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](v6, "workerQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001811C;
    v24[3] = &unk_1000B5728;
    objc_copyWeak(&v25, &location);
    dispatch_async(v22, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setCarCapabilitiesURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018248;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_worker_queue_setSession:(id)a3
{
  CARSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  CARSession *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CARSession *worker_queue_session;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  __int16 v29;
  CARSession *v30;

  v4 = (CARSession *)a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession MFiCertificateSerialNumber](v4, "MFiCertificateSerialNumber"));
  -[CRCarPlayCapabilitiesManager setMFiCertificateSerialNumber:](self, "setMFiCertificateSerialNumber:", v6);

  if (!v4)
  {
    worker_queue_session = self->_worker_queue_session;
    self->_worker_queue_session = 0;

    v9 = 0;
    goto LABEL_21;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](v4, "configuration"));
  v8 = objc_msgSend(v7, "hasAccessory");

  if ((v8 & 1) == 0)
  {
    v9 = (CARSession *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager _worker_queue_reloadSessionIfNeeded](self, "_worker_queue_reloadSessionIfNeeded"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](v9, "configuration"));
    v11 = objc_msgSend(v10, "hasAccessory");

    if ((v11 & 1) == 0)
    {
      v23 = CarGeneralLogging(v12);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315394;
        v28 = "-[CRCarPlayCapabilitiesManager _worker_queue_setSession:]";
        v29 = 2112;
        v30 = v9;
        v25 = "%s: skipping partial session %@";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v27, 0x16u);
      }
LABEL_20:

      goto LABEL_21;
    }
    v4 = v9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](v4, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "infoResponse"));

  if (v14)
  {
    v9 = v4;
    goto LABEL_9;
  }
  v9 = (CARSession *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager _worker_queue_reloadSessionIfNeeded](self, "_worker_queue_reloadSessionIfNeeded"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](v9, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "infoResponse"));

  if (!v18)
  {
    v26 = CarGeneralLogging(v15);
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315394;
      v28 = "-[CRCarPlayCapabilitiesManager _worker_queue_setSession:]";
      v29 = 2112;
      v30 = v9;
      v25 = "%s: skipping partial session (no infoResponse) %@";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
LABEL_9:
  if (self->_worker_queue_session != v9)
  {
    v19 = CarGeneralLogging(v15);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10006A0B8();

    objc_storeStrong((id *)&self->_worker_queue_session, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilitiesURL](self, "carCapabilitiesURL"));

    if (!v21)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.capabilities-changed"), 0, 0, 1u);
    }
    -[CRCarPlayCapabilitiesManager _worker_queue_runStateMachineIfPossible](self, "_worker_queue_runStateMachineIfPossible");
  }
LABEL_21:

}

- (id)session
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100018690;
  v11 = sub_1000186A0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000186A8;
  v6[3] = &unk_1000B5750;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_worker_queue_reloadSessionIfNeeded
{
  NSObject *v3;
  CARSession *v4;
  CARSession *v5;
  void *v6;
  unsigned __int8 v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = self->_worker_queue_session;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](v4, "configuration"));
    v7 = objc_msgSend(v6, "hasAccessory");

    if ((v7 & 1) != 0)
      return v5;
  }
  -[CARSessionStatus waitForSessionInitialization](self->_sessionStatus, "waitForSessionInitialization");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](self->_sessionStatus, "currentSession"));

  if (v9)
    -[CARSessionStatus _handleConfigurationUpdated](self->_sessionStatus, "_handleConfigurationUpdated");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](self->_sessionStatus, "currentSession"));

  v12 = CarGeneralLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
    v15 = objc_msgSend(v14, "hasAccessory");
    v16 = CFSTR("NO");
    v18 = "-[CRCarPlayCapabilitiesManager _worker_queue_reloadSessionIfNeeded]";
    v17 = 136315650;
    v19 = 2112;
    v20 = v10;
    if (v15)
      v16 = CFSTR("YES");
    v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: updated partial session %@ (hasAccessory = %@)", (uint8_t *)&v17, 0x20u);

  }
  return v10;
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018914;
  v9[3] = &unk_1000B5728;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018A58;
  v9[3] = &unk_1000B5728;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018BA0;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018CF0;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setCarCapabilities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018E44;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setLastLookupIdentifer:(id)a3
{
  NSString *v4;
  NSString *lastLookupIdentifer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lastLookupIdentifer = self->_lastLookupIdentifer;
  self->_lastLookupIdentifer = v4;

}

- (void)_worker_queue_runStateMachineIfPossible
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v3);

  if (self->_worker_queue_session)
  {
    if (self->_carCapabilitiesURL)
      -[CRCarPlayCapabilitiesManager resolveCapabilitiesForSession:](self, "resolveCapabilitiesForSession:");
  }
}

- (void)resolveCapabilitiesForSession:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CRCarplayCapabilitiesStateMachine *stateMachine;
  NSURL *carCapabilitiesURL;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10006A2E4(v6, v7, v8, v9, v10, v11, v12, v13);

  objc_initWeak(&location, self);
  stateMachine = self->_stateMachine;
  carCapabilitiesURL = self->_carCapabilitiesURL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100019008;
  v16[3] = &unk_1000B5778;
  objc_copyWeak(&v17, &location);
  -[CRCarplayCapabilitiesStateMachine lookupCarcapabilitiesForSession:plistURL:completionHandler:](stateMachine, "lookupCarcapabilitiesForSession:plistURL:completionHandler:", v4, carCapabilitiesURL, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)persistCarCapabilitiesIfNeeded
{
  void *v3;
  void *v4;
  unsigned int v5;
  CRCarPlayCapabilities *v6;
  CRCarPlayCapabilities *carCapabilities;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  __CFNotificationCenter *v26;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRCarPlayCapabilities fetchCarCapabilities](CRCarPlayCapabilities, "fetchCarCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    v6 = (CRCarPlayCapabilities *)objc_msgSend(v3, "copy");
    carCapabilities = self->_carCapabilities;
    self->_carCapabilities = v6;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "version"));
    v10 = (uint64_t)objc_msgSend(v9, "integerValue");

    if (v10 >= 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
      objc_msgSend(v11, "persistCapabilitiesToGlobalDomain");

      v13 = CarGeneralLogging(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
        *(_DWORD *)buf = 136315394;
        v34 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]";
        v35 = 2112;
        v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: sending CARSessionCarCapabilitiesUpdatedNotification signaling capabilities have change to %@", buf, 0x16u);

      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CARSessionCarCapabilitiesUpdatedNotification, 0, 0, 1u);
    }
  }
  objc_initWeak(&location, self);
  v17 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_100019470;
  v30 = &unk_1000B5728;
  objc_copyWeak(&v31, &location);
  dispatch_async(v17, &v27);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities", v27, v28, v29, v30));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "version"));
  if ((uint64_t)objc_msgSend(v19, "integerValue") <= 0)
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
    v21 = objc_msgSend(v20, "persisted");

    if (v21)
    {
      v23 = CarGeneralLogging(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager carCapabilities](self, "carCapabilities"));
        *(_DWORD *)buf = 136315394;
        v34 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]";
        v35 = 2112;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: sending CARSessionCarCapabilitiesReadyNotification signaling capabilities are loaded %@", buf, 0x16u);

      }
      v26 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v26, CARSessionCarCapabilitiesReadyNotification, 0, 0, 1u);
    }
  }
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)reconcileCapabilities
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019710;
  v4[3] = &unk_1000B5728;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)plistLookupFinishedCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayCapabilitiesManager workerQueue](self, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019DE8;
  block[3] = &unk_1000B57A0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSURL)carCapabilitiesURL
{
  return self->_carCapabilitiesURL;
}

- (CRCarPlayCapabilities)carCapabilities
{
  return self->_carCapabilities;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (NSData)MFiCertificateSerialNumber
{
  return self->_MFiCertificateSerialNumber;
}

- (void)setMFiCertificateSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_MFiCertificateSerialNumber, a3);
}

- (CRCarplayCapabilitiesStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (CRVehicleAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (NSString)lastLookupIdentifer
{
  return self->_lastLookupIdentifer;
}

- (id)lookupCompletionHandler
{
  return self->_lookupCompletionHandler;
}

- (void)setLookupCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableArray)lookupCompletionHandlers
{
  return self->_lookupCompletionHandlers;
}

- (void)setLookupCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_lookupCompletionHandlers, a3);
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_lookupCompletionHandlers, 0);
  objc_storeStrong(&self->_lookupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_lastLookupIdentifer, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_MFiCertificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_carCapabilities, 0);
  objc_storeStrong((id *)&self->_carCapabilitiesURL, 0);
  objc_storeStrong((id *)&self->_worker_queue_session, 0);
}

@end
