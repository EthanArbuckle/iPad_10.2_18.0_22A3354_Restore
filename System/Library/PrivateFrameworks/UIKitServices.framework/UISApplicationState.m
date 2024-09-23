@implementation UISApplicationState

- (void)setBadgeValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *bundleIdentifier;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    _UISStateServiceLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D23008], "processHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = bundleIdentifier;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_190875000, v5, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" is requesting to change the badge value of %{public}@ to %{public}@", (uint8_t *)&v8, 0x20u);

    }
    -[UISApplicationStateClient setBadgeValue:](self->_client, "setBadgeValue:", v4);
  }

}

- (id)initForCurrentApplication
{
  void *v3;
  void *v4;
  UISApplicationState *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISApplicationState initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v4);

  return v5;
}

- (UISApplicationState)initWithBundleIdentifier:(id)a3
{
  id v5;
  UISApplicationState *v6;
  UISApplicationState *v7;
  UISApplicationStateClient *v8;
  UISApplicationStateClient *client;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISApplicationState;
  v6 = -[UISApplicationState init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = -[UISApplicationStateClient initWithBundleIdentifier:]([UISApplicationStateClient alloc], "initWithBundleIdentifier:", v5);
    client = v7->_client;
    v7->_client = v8;

  }
  return v7;
}

- (id)badgeValue
{
  return -[UISApplicationStateClient badgeValue](self->_client, "badgeValue");
}

- (void)dealloc
{
  objc_super v3;

  -[UISApplicationStateClient invalidate](self->_client, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UISApplicationState;
  -[UISApplicationState dealloc](&v3, sel_dealloc);
}

- (void)_setMinimumBackgroundFetchInterval:(double)a3
{
  -[UISApplicationStateClient setMinimumBackgroundFetchInterval:](self->_client, "setMinimumBackgroundFetchInterval:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (UISApplicationState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationState.m"), 27, CFSTR("[-init] is unavailable for UIApplicationState."));

  return 0;
}

- (BOOL)_usesBackgroundNetwork
{
  return -[UISApplicationStateClient usesBackgroundNetwork](self->_client, "usesBackgroundNetwork");
}

- (void)_setUsesBackgroundNetwork:(BOOL)a3
{
  -[UISApplicationStateClient setUsesBackgroundNetwork:](self->_client, "setUsesBackgroundNetwork:", a3);
}

- (NSDate)_nextWakeDate
{
  double v2;
  void *v3;

  -[UISApplicationStateClient nextWakeIntervalSinceReferenceDate](self->_client, "nextWakeIntervalSinceReferenceDate");
  if (v2 == -1.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

- (void)_setNextWakeDate:(id)a3
{
  UISApplicationStateClient *client;

  client = self->_client;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[UISApplicationStateClient setNextWakeIntervalSinceReferenceDate:](client, "setNextWakeIntervalSinceReferenceDate:");
}

@end
