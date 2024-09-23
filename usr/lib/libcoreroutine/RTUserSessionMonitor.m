@implementation RTUserSessionMonitor

- (RTUserSessionMonitor)init
{
  RTUserSessionMonitor *v2;
  RTUserSessionMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTUserSessionMonitor;
  v2 = -[RTNotifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_previouslyActiveUser = -[RTUserSessionMonitor activeUser](v2, "activeUser");
  return v3;
}

+ (RTUserSessionMonitor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (RTUserSessionMonitor *)+[RTUserSessionMonitor allocWithZone:](RTUserSessionMonitor_Embedded, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTUserSessionMonitor;
  return (RTUserSessionMonitor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (unsigned)uid
{
  return -101;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  RTUserSessionMonitorNotificationConsoleUserDidChange *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v7) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v12, 0xCu);
    }

  }
  +[RTNotification notificationName](RTUserSessionMonitorNotificationConsoleUserDidChange, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = -[RTUserSessionMonitorNotificationConsoleUserDidChange initWithactiveUser:]([RTUserSessionMonitorNotificationConsoleUserDidChange alloc], "initWithactiveUser:", self->_previouslyActiveUser);
    if (v11)
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v11, v6);

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[RTNotification notificationName](RTUserSessionMonitorNotificationConsoleUserDidChange, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)activeUser
{
  return 0;
}

- (BOOL)previouslyActiveUser
{
  return self->_previouslyActiveUser;
}

- (void)setPreviouslyActiveUser:(BOOL)a3
{
  self->_previouslyActiveUser = a3;
}

@end
