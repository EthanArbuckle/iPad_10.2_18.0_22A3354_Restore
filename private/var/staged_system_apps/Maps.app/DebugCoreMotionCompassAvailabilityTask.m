@implementation DebugCoreMotionCompassAvailabilityTask

- (DebugCoreMotionCompassAvailabilityTask)initWithPlatformController:(id)a3
{
  id v4;
  DebugCoreMotionCompassAvailabilityTask *v5;
  id v6;
  NSObject *v7;
  CMMotionManager *v8;
  CMMotionManager *motionManager;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  NSOperationQueue *v22;
  CMMotionManager *v23;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  uint8_t buf[4];
  DebugCoreMotionCompassAvailabilityTask *v29;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DebugCoreMotionCompassAvailabilityTask;
  v5 = -[DebugCoreMotionCompassAvailabilityTask init](&v27, "init");
  if (v5)
  {
    v6 = sub_100A66888();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v8 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    motionManager = v5->_motionManager;
    v5->_motionManager = v8;

    v10 = -[CMMotionManager isDeviceMotionAvailable](v5->_motionManager, "isDeviceMotionAvailable");
    v11 = sub_100A66888();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v13)
      {
        *(_DWORD *)buf = 134349056;
        v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Device motion is available; will start updates",
          buf,
          0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.deviceMotionUpdatesQueue.%p"), v15, objc_opt_class(v5), v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      v12 = objc_retainAutorelease(v17);
      v18 = (const char *)-[NSObject UTF8String](v12, "UTF8String");
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = dispatch_queue_create(v18, v20);

      v22 = objc_opt_new(NSOperationQueue);
      -[NSOperationQueue setUnderlyingQueue:](v22, "setUnderlyingQueue:", v21);
      objc_initWeak((id *)buf, v5);
      v23 = v5->_motionManager;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100A668C8;
      v25[3] = &unk_1011D8DC0;
      objc_copyWeak(&v26, (id *)buf);
      -[CMMotionManager startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:](v23, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", 8, v22, v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);

    }
    else if (v13)
    {
      *(_DWORD *)buf = 134349056;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Device motion is not available", buf, 0xCu);
    }

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  DebugCoreMotionCompassAvailabilityTask *v7;

  v3 = sub_100A66888();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)DebugCoreMotionCompassAvailabilityTask;
  -[DebugCoreMotionCompassAvailabilityTask dealloc](&v5, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (BOOL)gotDeviceMotionUpdate
{
  return self->_gotDeviceMotionUpdate;
}

- (void)setGotDeviceMotionUpdate:(BOOL)a3
{
  self->_gotDeviceMotionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end
