@implementation NDFPProvider

+ (id)providerIDForBundle:(id)a3 sharedContainerIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderMonitor providerIDForApplication:sharedContainerIdentifier:](FPProviderMonitor, "providerIDForApplication:sharedContainerIdentifier:", v5, v6));

  return v8;
}

- (NDFPProvider)initWithIdentifier:(id)a3 applicationIdentifier:(id)a4
{
  id v6;
  id v7;
  NDFPProvider *v8;
  FPProviderMonitor *v9;
  FPProviderMonitor *monitor;
  NDSpringBoardApplication *v11;
  NDSpringBoardApplication *springboardApplication;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NDFPProvider;
  v8 = -[NDApplication initWithIdentifier:](&v14, "initWithIdentifier:", v6);
  if (v8)
  {
    v9 = (FPProviderMonitor *)objc_alloc_init((Class)FPProviderMonitor);
    monitor = v8->_monitor;
    v8->_monitor = v9;

    v11 = -[NDSpringBoardApplication initWithIdentifier:]([NDSpringBoardApplication alloc], "initWithIdentifier:", v7);
    springboardApplication = v8->_springboardApplication;
    v8->_springboardApplication = v11;

    v8->_initializedForegroundState = 0;
  }

  return v8;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)isForeground
{
  NSObject *v3;
  NSString *bundleIdentifier;
  int v6;
  NSString *v7;

  if (!self->_initializedForegroundState)
  {
    v3 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->super._bundleIdentifier;
      v6 = 138412290;
      v7 = bundleIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Being asked if container with identifier %@ is foreground before getting callback from FPProviderMonitor!", (uint8_t *)&v6, 0xCu);
    }
  }
  return self->_isForeground;
}

- (BOOL)supportsWakes
{
  return -[NDSpringBoardApplication supportsWakes](self->_springboardApplication, "supportsWakes");
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  return -[NDSpringBoardApplication wakeForSessionIdentifier:withSessionUUID:wakeRequirement:](self->_springboardApplication, "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:", a3, a4, a5);
}

- (void)addObserver:(id)a3
{
  id v4;
  NDFPProvider *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
    -[FPProviderMonitor addObserver:forProviderID:](v5->_monitor, "addObserver:forProviderID:", v5, v5->super._bundleIdentifier);
  v6.receiver = v5;
  v6.super_class = (Class)NDFPProvider;
  -[NDApplication addObserver:](&v6, "addObserver:", v4);
  objc_sync_exit(v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NDFPProvider *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)NDFPProvider;
  -[NDApplication removeObserver:](&v6, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
    -[FPProviderMonitor removeObserver:forProviderID:](v5->_monitor, "removeObserver:forProviderID:", v5, v5->super._bundleIdentifier);
  objc_sync_exit(v5);

}

- (void)providerDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;

  v4 = a3;
  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FPProvider %@ entered background", buf, 0xCu);
  }
  self->_isForeground = 0;
  if (self->_initializedForegroundState)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDFPProvider;
    -[NDApplication invokeSelectorForAllObservers:](&v6, "invokeSelectorForAllObservers:", "applicationNoLongerInForeground:");
  }
  self->_initializedForegroundState = 1;

}

- (void)providerDidEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;

  v4 = a3;
  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FPProvider %@ entered foreground", buf, 0xCu);
  }
  self->_isForeground = 1;
  if (self->_initializedForegroundState)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDFPProvider;
    -[NDApplication invokeSelectorForAllObservers:](&v6, "invokeSelectorForAllObservers:", "applicationEnteredForeground:");
  }
  self->_initializedForegroundState = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardApplication, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
