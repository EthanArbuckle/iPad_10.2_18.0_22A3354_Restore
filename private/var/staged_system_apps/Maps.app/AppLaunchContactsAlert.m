@implementation AppLaunchContactsAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  id completionBlock;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

  v6 = -[AppLaunchContactsAlert _shouldDisplayAlert](self, "_shouldDisplayAlert");
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: presenting alert", buf, 2u);
    }

    -[AppLaunchContactsAlert _presentAlertUI](self, "_presentAlertUI");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: no need to be displayed", v10, 2u);
    }

    -[AppLaunchContactsAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (BOOL)_shouldDisplayAlert
{
  CNAuthorizationStatus v2;
  id v3;
  NSObject *v4;
  int v6;
  CNAuthorizationStatus v7;

  v2 = +[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0);
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: status %ld", (uint8_t *)&v6, 0xCu);
  }

  return v2 == CNAuthorizationStatusNotDetermined;
}

- (void)_presentAlertUI
{
  id v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)CNContactStore);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006266C8;
  v4[3] = &unk_1011BE580;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (void)_contactsAuthorizationDismissed
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AppLaunchContactsAlert: alert dismissed", v5, 2u);
  }

  -[AppLaunchContactsAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
}

- (void)_alertDidFinishProcessing
{
  id completionBlock;
  id v4;
  void (**v5)(void);

  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = (void (**)(void))objc_retainBlock(completionBlock);
    v4 = self->_completionBlock;
    self->_completionBlock = 0;

    v5[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
