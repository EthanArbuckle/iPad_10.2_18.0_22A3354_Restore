@implementation NDCloudContainer

+ (id)containerIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:](BRContainersMonitor, "containerIDFromPrimaryIdentifier:secondaryIdentifier:", v5, v6));

  return v8;
}

- (NDCloudContainer)initWithIdentifier:(id)a3
{
  id v4;
  NDCloudContainer *v5;
  BRContainersMonitor *v6;
  BRContainersMonitor *monitor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDCloudContainer;
  v5 = -[NDApplication initWithIdentifier:](&v9, "initWithIdentifier:", v4);
  if (v5)
  {
    v6 = (BRContainersMonitor *)objc_alloc_init((Class)BRContainersMonitor);
    monitor = v5->_monitor;
    v5->_monitor = v6;

    v5->_initializedForegroundStateFromMonitorCallback = 0;
  }

  return v5;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)isForeground
{
  unsigned int v3;
  NSObject *v4;
  NSString *bundleIdentifier;
  int v6;
  int v8;
  NSString *v9;
  __int16 v10;
  int v11;

  if (!self->_initializedForegroundStateFromMonitorCallback)
  {
    v3 = +[BRContainersMonitor isContainerIDForeground:](BRContainersMonitor, "isContainerIDForeground:", self->super._bundleIdentifier);
    self->_isForeground = v3;
    v4 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->super._bundleIdentifier;
      if (v3)
        v6 = 89;
      else
        v6 = 78;
      v8 = 138412546;
      v9 = bundleIdentifier;
      v10 = 1024;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Being asked if container with identifier %@ is foreground before getting callback from BRContainersMonitor! Foreground state is %c", (uint8_t *)&v8, 0x12u);
    }
  }
  return self->_isForeground;
}

- (BOOL)supportsWakes
{
  return 0;
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  NDCloudContainer *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
    -[BRContainersMonitor addObserver:forContainerID:](v5->_monitor, "addObserver:forContainerID:", v5, v5->super._bundleIdentifier);
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  -[NDApplication addObserver:](&v6, "addObserver:", v4);
  objc_sync_exit(v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NDCloudContainer *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)NDCloudContainer;
  -[NDApplication removeObserver:](&v6, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
    -[BRContainersMonitor removeObserver:forContainerID:](v5->_monitor, "removeObserver:forContainerID:", v5, v5->super._bundleIdentifier);
  objc_sync_exit(v5);

}

- (void)containerDidEnterBackground:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Container %@ entered background", buf, 0xCu);
  }
  self->_isForeground = 0;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    -[NDApplication invokeSelectorForAllObservers:](&v6, "invokeSelectorForAllObservers:", "applicationNoLongerInForeground:");
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;

}

- (void)containerDidEnterForeground:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Container %@ entered foreground", buf, 0xCu);
  }
  self->_isForeground = 1;
  if (self->_initializedForegroundStateFromMonitorCallback)
  {
    v6.receiver = self;
    v6.super_class = (Class)NDCloudContainer;
    -[NDApplication invokeSelectorForAllObservers:](&v6, "invokeSelectorForAllObservers:", "applicationEnteredForeground:");
  }
  self->_initializedForegroundStateFromMonitorCallback = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

+ (id)bundleIDForPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:](BRContainersMonitor, "bundleIDFromPrimaryIdentifier:secondaryIdentifier:", v5, v6));

  return v8;
}

@end
