@implementation STULaunchAppConfiguration

+ (id)configurationWithOpenAppRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v7 = objc_msgSend(v5, "initWithBundleIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
  objc_msgSend(v7, "setActivityType:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityData"));
  objc_msgSend(v7, "setActivityData:", v9);

  return v7;
}

- (STULaunchAppConfiguration)initWithBundleIdentifier:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STULaunchAppConfiguration;
  v5 = -[STULaunchAppConfiguration init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = &__NSDictionary0__struct;

    *(_WORD *)(v5 + 9) = 257;
  }

  return (STULaunchAppConfiguration *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppConfiguration bundleIdentifier](self, "bundleIdentifier"));
  v6 = objc_msgSend(v4, "initWithBundleIdentifier:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppConfiguration activityType](self, "activityType"));
  objc_msgSend(v6, "setActivityType:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppConfiguration activityData](self, "activityData"));
  objc_msgSend(v6, "setActivityData:", v8);

  objc_msgSend(v6, "setCreatesNewApplicationInstance:", -[STULaunchAppConfiguration createsNewApplicationInstance](self, "createsNewApplicationInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppConfiguration environment](self, "environment"));
  objc_msgSend(v6, "setEnvironment:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppConfiguration appBundleURL](self, "appBundleURL"));
  objc_msgSend(v6, "setAppBundleURL:", v10);

  objc_msgSend(v6, "setWakesScreen:", -[STULaunchAppConfiguration wakesScreen](self, "wakesScreen"));
  objc_msgSend(v6, "setWaitsForDeviceUnlock:", -[STULaunchAppConfiguration waitsForDeviceUnlock](self, "waitsForDeviceUnlock"));
  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)activityData
{
  return self->_activityData;
}

- (void)setActivityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)createsNewApplicationInstance
{
  return self->_createsNewApplicationInstance;
}

- (void)setCreatesNewApplicationInstance:(BOOL)a3
{
  self->_createsNewApplicationInstance = a3;
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (void)setAppBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleURL, a3);
}

- (BOOL)wakesScreen
{
  return self->_wakesScreen;
}

- (void)setWakesScreen:(BOOL)a3
{
  self->_wakesScreen = a3;
}

- (BOOL)waitsForDeviceUnlock
{
  return self->_waitsForDeviceUnlock;
}

- (void)setWaitsForDeviceUnlock:(BOOL)a3
{
  self->_waitsForDeviceUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleURL, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
