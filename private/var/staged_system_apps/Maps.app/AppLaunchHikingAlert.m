@implementation AppLaunchHikingAlert

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

  v6 = -[AppLaunchHikingAlert _shouldDisplayAlert](self, "_shouldDisplayAlert");
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchHikingAlert: presenting alert", buf, 2u);
    }

    -[AppLaunchHikingAlert _presentAlertUI](self, "_presentAlertUI");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchHikingAlert: no need to be displayed", v10, 2u);
    }

    -[AppLaunchHikingAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (BOOL)_shouldDisplayAlert
{
  int IsEnabled_HikingiOS;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
  if (IsEnabled_HikingiOS)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("HikingWelcomeScreenDisplayed"));

    if (v4)
    {
      v5 = sub_100431A4C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v16 = 0;
        v7 = "AppLaunchHikingAlert: Welcome screen has already been shown";
        v8 = (uint8_t *)&v16;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (+[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay))
    {
      v9 = sub_100431A4C();
      v6 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v7 = "AppLaunchHikingAlert: Not displaying because connected to CarPlay";
        v8 = (uint8_t *)&v15;
        goto LABEL_12;
      }
LABEL_13:

      LOBYTE(IsEnabled_HikingiOS) = 0;
      return IsEnabled_HikingiOS;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v11 = objc_msgSend(v10, "currentCountrySupportsCustomRouteCreation");

    if ((v11 & 1) == 0)
    {
      v12 = sub_100431A4C();
      v6 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v14 = 0;
        v7 = "AppLaunchHikingAlert: Current country doesn't support custom route creation";
        v8 = (uint8_t *)&v14;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    LOBYTE(IsEnabled_HikingiOS) = 1;
  }
  return IsEnabled_HikingiOS;
}

- (void)_presentAlertUI
{
  _TtC4Maps27HikingWelcomeViewController *v3;
  _TtC4Maps27HikingWelcomeViewController *hikingWelcomeViewController;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002908D0;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  v3 = -[HikingWelcomeViewController initWithCompletionHandler:]([_TtC4Maps27HikingWelcomeViewController alloc], "initWithCompletionHandler:", v7);
  hikingWelcomeViewController = self->_hikingWelcomeViewController;
  self->_hikingWelcomeViewController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  objc_msgSend(v6, "_maps_topMostPresentViewController:animated:completion:", self->_hikingWelcomeViewController, 1, 0);

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
  objc_storeStrong((id *)&self->_hikingWelcomeViewController, 0);
}

@end
