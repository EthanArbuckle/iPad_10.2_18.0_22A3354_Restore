@implementation AppLaunchLocationAlert

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

  v6 = -[AppLaunchLocationAlert _shouldDisplayAlert](self, "_shouldDisplayAlert");
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: presenting alert", buf, 2u);
    }

    -[AppLaunchLocationAlert _presentAlertUI](self, "_presentAlertUI");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: no need to be displayed", v10, 2u);
    }

    -[AppLaunchLocationAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (BOOL)_shouldDisplayAlert
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;

  v2 = sub_100431A4C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationProvider"));
    v12 = 138412546;
    v13 = v5;
    v14 = 1024;
    v15 = objc_msgSend(v7, "authorizationStatus");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AppLaunchLocationAlert: location provider %@ status %d", (uint8_t *)&v12, 0x12u);

  }
  if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyCarPlayApplicationSceneForeground"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v8, "stopWaitingForAuthCallback");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v10 = objc_msgSend(v9, "isLocationServicesAuthorizationNeeded");

  return v10;
}

- (void)_presentAlertUI
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "resetAfterResumeIfNecessary");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100359C30;
  v5[3] = &unk_1011AE8F8;
  v5[4] = self;
  objc_msgSend(v4, "promptLocationServicesAuthorizationWithHandler:", v5);

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
