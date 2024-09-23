@implementation AppLaunchPreciseLocationDisabledAlert

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

  v6 = -[AppLaunchPreciseLocationDisabledAlert _shouldDisplayAlert](self, "_shouldDisplayAlert");
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: presenting alert", buf, 2u);
    }

    -[AppLaunchPreciseLocationDisabledAlert _presentAlertUI](self, "_presentAlertUI");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: no need to be displayed", v10, 2u);
    }

    -[AppLaunchPreciseLocationDisabledAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (void)cancelAlertIfNecessary
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v2, "dismissCurrentInterruptionOfKind:", 15);

}

- (BOOL)_shouldDisplayAlert
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;

  if ((GEOConfigGetBOOL(MapsConfig_PreciseLocationDisabledAlertWasDisplayed, off_1014B3D48) & 1) != 0)
    return 0;
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v12 = 138412546;
    v13 = v6;
    v14 = 2048;
    v15 = objc_msgSend(v7, "isAuthorizedForPreciseLocation");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AppLaunchPreciseLocationDisabledAlert: location provider %@ is authorized for precise location: %lu", (uint8_t *)&v12, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = objc_msgSend(v8, "isLocationServicesApproved");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v11 = objc_msgSend(v10, "isAuthorizedForPreciseLocation");

  return v9 & (v11 ^ 1);
}

- (void)_presentAlertUI
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10043A514;
  v4[3] = &unk_1011AFA20;
  v4[4] = self;
  objc_msgSend(v3, "interruptApplicationWithKind:userInfo:completionHandler:", 15, 0, v4);

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
