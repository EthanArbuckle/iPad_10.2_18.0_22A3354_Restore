@implementation SMCMNoMovementMonitor

- (SMCMNoMovementMonitor)init
{
  SMCMNoMovementMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMCMNoMovementMonitor;
  result = -[RTNotifier init](&v3, sel_init);
  if (result)
    *(&result->super._isShuttingDown + 1) = 0;
  return result;
}

- (void)setIsMonitoring:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SMCMNoMovementMonitor setIsMonitoring:]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s,unsupported platform", (uint8_t *)&v4, 0xCu);
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](SMCMNoMovementStateUpdateNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[SMCMNoMovementMonitor setIsMonitoring:](self, "setIsMonitoring:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) != 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[SMCMNoMovementMonitor internalAddObserver:name:]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s,unsupported notification, %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[SMCMNoMovementMonitor requestLatestStateUpdate](self, "requestLatestStateUpdate");

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](SMCMNoMovementStateUpdateNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[SMCMNoMovementMonitor setIsMonitoring:](self, "setIsMonitoring:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) != 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[SMCMNoMovementMonitor internalRemoveObserver:name:]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s,unsupported notification, %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)requestLatestStateUpdate
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[SMCMNoMovementMonitor requestLatestStateUpdate]";
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%s, unsupported platform", (uint8_t *)&v3, 0xCu);
  }

}

- (BOOL)isMonitoring
{
  return *(&self->super._isShuttingDown + 1);
}

@end
