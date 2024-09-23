@implementation NDSpringBoardApplication

- (void)_onqueue_resetRequestDelay
{
  NSObject *v3;
  NSString *bundleIdentifier;
  NSObject *delayTimer;
  int v6;
  NSString *v7;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->super._bundleIdentifier;
    v6 = 138412290;
    v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting request delay for %@", (uint8_t *)&v6, 0xCu);
  }
  -[NDApplication setCurrentRequestDelay:](self, "setCurrentRequestDelay:", 0.0);
  delayTimer = self->_delayTimer;
  if (delayTimer)
    dispatch_source_set_timer(delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = objc_msgSend(v8, "application:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:", self->super._bundleIdentifier, v6, v7);

  return (char)self;
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4;
  NSObject *v5;
  NDSpringBoardApplication *v6;
  NSObject *v7;
  NDSpringBoardApplication *v8;
  objc_super v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since it came into the foreground", buf, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_claimAutoreleasedReturnValue(+[NDSpringBoardApplication requestDelayQueue](NDSpringBoardApplication, "requestDelayQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AB04;
  block[3] = &unk_1000B23A0;
  block[4] = v6;
  dispatch_async(v7, block);

  v9.receiver = v6;
  v9.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:](&v9, "invokeSelectorForAllObservers:", "applicationEnteredForeground:");
  objc_sync_exit(v6);

  v8 = v6;
  objc_sync_enter(v8);
  -[NDSpringBoardApplication disableTransitionalDiscretionaryPeriodTimer](v8, "disableTransitionalDiscretionaryPeriodTimer");
  objc_sync_exit(v8);

}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (BOOL)isForeground
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = objc_msgSend(v3, "applicationIsForeground:", self->super._bundleIdentifier);

  return (char)self;
}

- (BOOL)canBeSuspended
{
  return 1;
}

- (id)containerURL
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", self->super._bundleIdentifier, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataContainerURL"));

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  NDSpringBoardApplication *v5;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
    objc_msgSend(v6, "startMonitoringBundleID:", v5->super._bundleIdentifier);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
    objc_msgSend(v7, "addObserver:forApplication:", v5, v5->super._bundleIdentifier);

    if (!-[NDSpringBoardApplication isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:](v5, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:", 0, 0))
    {
      v8 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = v5->super._bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = bundleIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since the first observer is being added", buf, 0xCu);
      }
      v10 = objc_claimAutoreleasedReturnValue(+[NDSpringBoardApplication requestDelayQueue](NDSpringBoardApplication, "requestDelayQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AB38;
      block[3] = &unk_1000B23A0;
      block[4] = v5;
      dispatch_async(v10, block);

    }
  }
  v11.receiver = v5;
  v11.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication addObserver:](&v11, "addObserver:", v4);
  objc_sync_exit(v5);

}

- (void)disableTransitionalDiscretionaryPeriodTimer
{
  NSObject *transitionalDiscretionaryStateTimer;

  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  if (transitionalDiscretionaryStateTimer)
    dispatch_source_set_timer(transitionalDiscretionaryStateTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  -[NDApplication setIsInTransitionalDiscretionaryPeriod:](self, "setIsInTransitionalDiscretionaryPeriod:", 0);
}

+ (id)requestDelayQueue
{
  if (qword_1000C70F0 != -1)
    dispatch_once(&qword_1000C70F0, &stru_1000B1960);
  return (id)qword_1000C70E8;
}

- (NDSpringBoardApplication)initWithIdentifier:(id)a3
{
  id v4;
  NDSpringBoardApplication *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NDSpringBoardApplication *containingApplication;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDSpringBoardApplication;
  v5 = -[NDApplication initWithIdentifier:](&v13, "initWithIdentifier:", v4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v5->super._bundleIdentifier, 0);
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containingBundleRecord"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

      if (v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(+[NDApplication springboardApplicationWithBundleIdentifier:](NDApplication, "springboardApplicationWithBundleIdentifier:", v9));
        containingApplication = v5->_containingApplication;
        v5->_containingApplication = (NDSpringBoardApplication *)v10;

      }
    }

  }
  return v5;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (BOOL)supportsWakes
{
  return 1;
}

- (void)setupDelayTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *delayTimer;
  NSObject *v6;
  _QWORD handler[5];

  if (!self->_delayTimer)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NDSpringBoardApplication requestDelayQueue](NDSpringBoardApplication, "requestDelayQueue"));
    v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v4;

    v6 = self->_delayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004C1CC;
    handler[3] = &unk_1000B23A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
  }
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(+[NDSpringBoardApplication requestDelayQueue](NDSpringBoardApplication, "requestDelayQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C054;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(v9, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = objc_msgSend(v10, "wakeUpApp:forSession:withSessionUUID:", self->super._bundleIdentifier, v7, v8);

  return (char)self;
}

- (BOOL)hasBackgroundTaskCompletion
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = objc_msgSend(v3, "applicationHasBackgroundTaskCompletion:", self->super._bundleIdentifier);

  return (char)self;
}

- (BOOL)backgroundUpdatesEnabled
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = objc_msgSend(v3, "applicationBackgroundUpdatesEnabled:", self->super._bundleIdentifier);

  return (char)self;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NDSpringBoardApplication *v5;
  void *v6;
  void *v7;
  NSObject *transitionalDiscretionaryStateTimer;
  OS_dispatch_source *v9;
  objc_super v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v10.receiver = v5;
  v10.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication removeObserver:](&v10, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
    objc_msgSend(v6, "removeObserver:forApplication:", v5, v5->super._bundleIdentifier);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
    objc_msgSend(v7, "stopMonitoringBundleID:", v5->super._bundleIdentifier);

    transitionalDiscretionaryStateTimer = v5->_transitionalDiscretionaryStateTimer;
    if (transitionalDiscretionaryStateTimer)
    {
      dispatch_source_cancel(transitionalDiscretionaryStateTimer);
      v9 = v5->_transitionalDiscretionaryStateTimer;
      v5->_transitionalDiscretionaryStateTimer = 0;

    }
  }
  objc_sync_exit(v5);

}

- (void)setupTransitionalDiscretionaryPeriodTimer
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *transitionalDiscretionaryStateTimer;
  NSObject *v7;
  _QWORD handler[5];

  if (!self->_transitionalDiscretionaryStateTimer)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
    transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
    self->_transitionalDiscretionaryStateTimer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_transitionalDiscretionaryStateTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v7 = self->_transitionalDiscretionaryStateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004BF6C;
    handler[3] = &unk_1000B23A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_transitionalDiscretionaryStateTimer);
  }
}

- (void)startTransitionalDiscretionaryPeriodTimer
{
  NSObject *transitionalDiscretionaryStateTimer;
  dispatch_time_t v4;

  -[NDApplication setIsInTransitionalDiscretionaryPeriod:](self, "setIsInTransitionalDiscretionaryPeriod:", 1);
  -[NDSpringBoardApplication setupTransitionalDiscretionaryPeriodTimer](self, "setupTransitionalDiscretionaryPeriodTimer");
  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  v4 = dispatch_time(0, 64800000000000);
  dispatch_source_set_timer(transitionalDiscretionaryStateTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:](&v3, "invokeSelectorForAllObservers:", "applicationWasQuitFromAppSwitcher:");
}

- (void)applicationBackgroundUpdatesTurnedOff:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:](&v3, "invokeSelectorForAllObservers:", "backgroundUpdatesDisabledForApplication:");
}

- (void)applicationBackgroundUpdatesTurnedOn:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:](&v3, "invokeSelectorForAllObservers:", "backgroundUpdatesEnabledForApplication:");
}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:pid:](&v4, "invokeSelectorForAllObservers:pid:", "applicationWasSuspended:pid:", *(_QWORD *)&a4);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  NDSpringBoardApplication *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:](&v5, "invokeSelectorForAllObservers:", "applicationNoLongerInForeground:");
  v4 = self;
  objc_sync_enter(v4);
  -[NDSpringBoardApplication startTransitionalDiscretionaryPeriodTimer](v4, "startTransitionalDiscretionaryPeriodTimer");
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingApplication, 0);
  objc_storeStrong((id *)&self->_transitionalDiscretionaryStateTimer, 0);
  objc_storeStrong((id *)&self->_extendedNonDiscretionaryGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
}

@end
