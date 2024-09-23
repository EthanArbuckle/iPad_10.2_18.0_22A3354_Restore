@implementation NDChronoKitExtension

- (void)setupDelayTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *delayTimer;
  NSObject *v6;
  _QWORD handler[5];

  if (!self->_delayTimer)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NDChronoKitExtension requestDelayQueue](NDChronoKitExtension, "requestDelayQueue"));
    v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v4;

    v6 = self->_delayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004CFE4;
    handler[3] = &unk_1000B23A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
  }
}

- (void)_onqueue_resetRequestDelay
{
  NSObject *delayTimer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NDChronoKitExtension;
  -[NDApplication _onqueue_resetRequestDelay](&v4, "_onqueue_resetRequestDelay");
  delayTimer = self->_delayTimer;
  if (delayTimer)
    dispatch_source_set_timer(delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (id)containerURL
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", self->super._bundleIdentifier, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataContainerURL"));

  return v3;
}

- (BOOL)supportsWakes
{
  return 1;
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[NDChronoKitExtension requestDelayQueue](NDChronoKitExtension, "requestDelayQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CE6C;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(v10, block);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
  LOBYTE(a5) = objc_msgSend(v11, "wakeUpExtension:forSession:withSessionUUID:wakeRequirement:", self->super._bundleIdentifier, v8, v9, a5);

  return a5;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 1;
}

- (BOOL)canBeSuspended
{
  return 1;
}

- (BOOL)backgroundUpdatesEnabled
{
  return 1;
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
  LOBYTE(self) = objc_msgSend(v8, "extension:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:", self->super._bundleIdentifier, v6, v7);

  return (char)self;
}

- (void)addObserver:(id)a3
{
  id v4;
  NDChronoKitExtension *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *bundleIdentifier;
  NSObject *v10;
  objc_super v11;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
    objc_msgSend(v6, "startMonitoringBundleID:", v5->super._bundleIdentifier);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
    objc_msgSend(v7, "addObserver:forExtension:", v5, v5->super._bundleIdentifier);

    if (!-[NDChronoKitExtension isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:](v5, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:", 0, 0))
    {
      v8 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = v5->super._bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = bundleIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since the first observer is being added", buf, 0xCu);
      }
      v10 = objc_claimAutoreleasedReturnValue(+[NDChronoKitExtension requestDelayQueue](NDChronoKitExtension, "requestDelayQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004CE64;
      block[3] = &unk_1000B23A0;
      block[4] = v5;
      dispatch_async(v10, block);

    }
  }
  v11.receiver = v5;
  v11.super_class = (Class)NDChronoKitExtension;
  -[NDApplication addObserver:](&v11, "addObserver:", v4);
  objc_sync_exit(v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NDChronoKitExtension *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)NDChronoKitExtension;
  -[NDApplication removeObserver:](&v8, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
    objc_msgSend(v6, "removeObserver:forExtension:", v5, v5->super._bundleIdentifier);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
    objc_msgSend(v7, "stopMonitoringBundleID:", v5->super._bundleIdentifier);

  }
  objc_sync_exit(v5);

}

- (void)extensionWasRemovedFromScreen:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDChronoKitExtension;
  -[NDApplication invokeSelectorForAllObservers:](&v3, "invokeSelectorForAllObservers:", "applicationWasQuitFromAppSwitcher:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimer, 0);
}

+ (id)requestDelayQueue
{
  if (qword_1000C7100 != -1)
    dispatch_once(&qword_1000C7100, &stru_1000B1980);
  return (id)qword_1000C70F8;
}

@end
