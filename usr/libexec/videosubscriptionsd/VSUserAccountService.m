@implementation VSUserAccountService

- (VSUserAccountService)init
{
  void *v3;
  VSUserAccountService *v4;
  VSPreferences *v5;
  VSPreferences *preferences;
  VSUserAccountRegistry *v7;
  VSUserAccountRegistry *registry;
  void *v9;
  uint64_t v10;
  void *v11;
  VSUserAccountService *v12;
  objc_super v14;
  _QWORD v15[6];

  v3 = objc_autoreleasePoolPush();
  v14.receiver = self;
  v14.super_class = (Class)VSUserAccountService;
  v4 = -[VSUserAccountService init](&v14, "init");
  if (v4)
  {
    v5 = (VSPreferences *)objc_alloc_init((Class)VSPreferences);
    preferences = v4->_preferences;
    v4->_preferences = v5;

    v7 = -[VSUserAccountRegistry initWithDelegate:]([VSUserAccountRegistry alloc], "initWithDelegate:", v4);
    registry = v4->_registry;
    v4->_registry = v7;

    v15[0] = VSEntitlementNameSmootSubscriptionService;
    v15[1] = VSEntitlementNameInternalSubscriptionService;
    v15[2] = VSEntitlementNameSubscriptionRegistration;
    v15[3] = VSEntitlementNameSubscriptionServiceFetchFromAllSources;
    v15[4] = VSEntitlementNameSubscriptionServiceReadWriteWebSources;
    v15[5] = VSEntitlementNameUserAccountService;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 6));
    v10 = VSUserAccountServiceInterface(-[VSUserAccountService setEntitlementNames:](v4, "setEntitlementNames:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[VSUserAccountService setExportedInterface:](v4, "setExportedInterface:", v11);

    -[VSUserAccountService setExportedObject:](v4, "setExportedObject:", v4->_registry);
  }
  v12 = v4;
  objc_autoreleasePoolPop(v3);

  return v12;
}

- (id)_securityTaskForCurrentConnection
{
  return +[VSSecurityTask currentSecurityTask](VSSecurityTask, "currentSecurityTask");
}

- (void)userAccountRegistry:(id)a3 willPerformMigrationIfRequiredWithBlock:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;

  v4 = a4;
  v8 = VSDefaultLogObject(v4, v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSUserAccountService userAccountRegistry:willPerformMigrationIfRequiredWithBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v10 = objc_alloc_init((Class)VSSubscriptionRegistry);
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v11, "setObject:forKey:", &stru_100019288, VSSubscriptionFetchOptionSubscriberIdentifierHashModifier);
  objc_msgSend(v11, "setObject:forKey:", &__kCFBooleanFalse, VSSubscriptionFetchOptionExcludeUninstalledApps);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DD28;
  v13[3] = &unk_1000189C8;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v10, "fetchActiveSubscriptionsWithOptions:completionHandler:", v11, v13);

}

- (void)userAccountRegistry:(id)a3 didFinishUpdatingUserAccountsWithManager:(id)a4
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = VSDefaultLogObject(self, a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSUserAccountService userAccountRegistry:didFinishUpdatingUserAccountsWithManager:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (VSUserAccountRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
