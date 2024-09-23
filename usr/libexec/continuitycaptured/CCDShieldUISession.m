@implementation CCDShieldUISession

- (CCDShieldUISession)initWithDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 placementStepSkipped:(id)a6 isDedicated:(BOOL)a7 sessionInterruptionBlock:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  CCDShieldUISession *v19;
  CMContinuityCaptureUIConfiguration *v20;
  CMContinuityCaptureUIConfiguration *configuration;
  NSUUID *v22;
  uint64_t v23;
  NSString *sessionID;
  CCDPauseStateSolver *v25;
  CCDPauseStateSolver *pauseStateSolver;
  id v27;
  id sessionInterruptionBlock;
  dispatch_queue_global_t global_queue;
  uint64_t v30;
  OS_dispatch_queue *shieldUILaunchMonitorQueue;
  void *v32;
  objc_super v34;

  v9 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CCDShieldUISession;
  v19 = -[CCDShieldUISession init](&v34, "init");
  if (v19)
  {
    v20 = (CMContinuityCaptureUIConfiguration *)objc_alloc_init((Class)CMContinuityCaptureUIConfiguration);
    configuration = v19->_configuration;
    v19->_configuration = v20;

    -[CMContinuityCaptureUIConfiguration setClientDeviceModel:](v19->_configuration, "setClientDeviceModel:", a5);
    -[CMContinuityCaptureUIConfiguration setClientName:](v19->_configuration, "setClientName:", v16);
    -[CMContinuityCaptureUIConfiguration setIsDedicated:](v19->_configuration, "setIsDedicated:", v9);
    objc_storeStrong((id *)&v19->_deviceIdentifier, a3);
    v22 = objc_opt_new(NSUUID);
    v23 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v22, "UUIDString"));
    sessionID = v19->_sessionID;
    v19->_sessionID = (NSString *)v23;

    v25 = objc_alloc_init(CCDPauseStateSolver);
    pauseStateSolver = v19->_pauseStateSolver;
    v19->_pauseStateSolver = v25;

    -[CMContinuityCaptureUIConfiguration setPlacementStepSkipped:](v19->_configuration, "setPlacementStepSkipped:", v17);
    v27 = objc_retainBlock(v18);
    sessionInterruptionBlock = v19->_sessionInterruptionBlock;
    v19->_sessionInterruptionBlock = v27;

    global_queue = dispatch_get_global_queue(0, 0);
    v30 = objc_claimAutoreleasedReturnValue(global_queue);
    shieldUILaunchMonitorQueue = v19->_shieldUILaunchMonitorQueue;
    v19->_shieldUILaunchMonitorQueue = (OS_dispatch_queue *)v30;

    if (a5 == 2)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCapturePongSoundManager sharedInstance](CMContinuityCapturePongSoundManager, "sharedInstance"));
      objc_msgSend(v32, "pongIfNeededWithShouldConsiderPongHistory:forIdentifier:", 0, v19->_deviceIdentifier);

    }
  }

  return v19;
}

- (void)setWillTerminate:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_willTerminate);
}

- (BOOL)willTerminate
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_willTerminate);
  return v2 & 1;
}

- (void)setupShieldLifecycleMonitorForCurrentSession
{
  NSObject *shieldUILaunchMonitorQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  shieldUILaunchMonitorQueue = self->_shieldUILaunchMonitorQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003904;
  v4[3] = &unk_100018670;
  objc_copyWeak(&v5, &location);
  dispatch_async(shieldUILaunchMonitorQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setupShieldLifecycleMonitorForCurrentSession
{
  void *v3;
  RBSProcessHandle *v4;
  id v5;
  RBSProcessHandle *shieldUIProcessHandle;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  RBSProcessHandle *v10;
  RBSProcessHandle *v11;
  CCDShieldUISession *v12;
  NSObject *waitShieldLaunchTimer;
  OS_dispatch_source *v14;
  uint64_t v15;
  NSObject *v16;
  OS_dispatch_source **p_waitShieldLaunchTimer;
  unsigned __int8 *p_failedShieldProcessActiveCount;
  unsigned int v19;
  void (**sessionInterruptionBlock)(void);
  unsigned __int8 v21;
  NSObject *v22;
  CCDShieldUISession *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  uint8_t buf[4];
  CCDShieldUISession *v34;
  __int16 v35;
  RBSProcessHandle *v36;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_shieldUILaunchMonitorQueue);
  if (!self->_shieldUIProcessHandle)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", CFSTR("com.apple.ContinuityCaptureShieldUI")));
    v31 = 0;
    v4 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v3, &v31));
    v5 = v31;
    shieldUIProcessHandle = self->_shieldUIProcessHandle;
    self->_shieldUIProcessHandle = v4;

    if (self->_shieldUIProcessHandle)
    {
      v8 = CMContinuityCaptureLog(0, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_shieldUIProcessHandle;
        *(_DWORD *)buf = 138543618;
        v34 = self;
        v35 = 2114;
        v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ setup monitor for %{public}@", buf, 0x16u);
      }

      v11 = self->_shieldUIProcessHandle;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100003CF8;
      v29[3] = &unk_100018698;
      objc_copyWeak(&v30, &location);
      -[RBSProcessHandle monitorForDeath:](v11, "monitorForDeath:", v29);
      v12 = self;
      objc_sync_enter(v12);
      waitShieldLaunchTimer = v12->_waitShieldLaunchTimer;
      if (waitShieldLaunchTimer)
      {
        dispatch_source_cancel(waitShieldLaunchTimer);
        v14 = v12->_waitShieldLaunchTimer;
        v12->_waitShieldLaunchTimer = 0;

      }
      objc_sync_exit(v12);

      objc_destroyWeak(&v30);
    }
    else
    {
      v15 = CMContinuityCaptureLog(0, v7);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to find shieldUI process", buf, 0xCu);
      }

      p_waitShieldLaunchTimer = &self->_waitShieldLaunchTimer;
      if (self->_waitShieldLaunchTimer)
      {
        p_failedShieldProcessActiveCount = &self->_failedShieldProcessActiveCount;
        v19 = atomic_load(&self->_failedShieldProcessActiveCount);
        if (v19 <= 8)
        {
          do
            v21 = __ldaxr(p_failedShieldProcessActiveCount);
          while (__stlxr(v21 + 1, p_failedShieldProcessActiveCount));
        }
        else
        {
          sessionInterruptionBlock = (void (**)(void))self->_sessionInterruptionBlock;
          if (sessionInterruptionBlock)
            sessionInterruptionBlock[2]();
        }
      }
      else
      {
        v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_shieldUILaunchMonitorQueue);
        dispatch_source_set_timer(v22, 0, 0x3B9ACA00uLL, 0);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100003E44;
        v27[3] = &unk_100018670;
        objc_copyWeak(&v28, &location);
        dispatch_source_set_event_handler(v22, v27);
        dispatch_resume(v22);
        v23 = self;
        objc_sync_enter(v23);
        objc_storeStrong((id *)p_waitShieldLaunchTimer, v22);
        objc_sync_exit(v23);

        v25 = CMContinuityCaptureLog(0, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ wait for setting shield ui monitor", buf, 0xCu);
        }

        objc_destroyWeak(&v28);
      }
    }

    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  CCDShieldUISession *v5;
  NSObject *waitShieldLaunchTimer;
  OS_dispatch_source *v7;
  RBSProcessHandle *shieldUIProcessHandle;
  id sessionInterruptionBlock;
  int v10;
  CCDShieldUISession *v11;
  __int16 v12;
  const char *v13;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2080;
    v13 = "-[CCDShieldUISession invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v10, 0x16u);
  }

  v5 = self;
  objc_sync_enter(v5);
  waitShieldLaunchTimer = v5->_waitShieldLaunchTimer;
  if (waitShieldLaunchTimer)
  {
    dispatch_source_cancel(waitShieldLaunchTimer);
    v7 = v5->_waitShieldLaunchTimer;
    v5->_waitShieldLaunchTimer = 0;

  }
  shieldUIProcessHandle = v5->_shieldUIProcessHandle;
  v5->_shieldUIProcessHandle = 0;

  sessionInterruptionBlock = v5->_sessionInterruptionBlock;
  v5->_sessionInterruptionBlock = 0;

  objc_sync_exit(v5);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (CMContinuityCaptureUIConfiguration)configuration
{
  return self->_configuration;
}

- (CCDPauseStateSolver)pauseStateSolver
{
  return self->_pauseStateSolver;
}

- (id)description
{
  NSString *deviceIdentifier;
  void *v4;
  void *v5;
  void *v6;

  deviceIdentifier = self->_deviceIdentifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUISession sessionID](self, "sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUISession configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DID:%@ SID:%@ Configuration:%@"), deviceIdentifier, v4, v5));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionInterruptionBlock, 0);
  objc_storeStrong((id *)&self->_shieldUILaunchMonitorQueue, 0);
  objc_storeStrong((id *)&self->_waitShieldLaunchTimer, 0);
  objc_storeStrong((id *)&self->_shieldUIProcessHandle, 0);
  objc_storeStrong((id *)&self->_pauseStateSolver, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
