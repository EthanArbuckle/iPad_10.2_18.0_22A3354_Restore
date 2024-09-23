@implementation AppLaunchNavTraceAlert

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

  v6 = -[AppLaunchNavTraceAlert _shouldDisplayAlert](self, "_shouldDisplayAlert");
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: presenting alert", buf, 2u);
    }

    self->_isDisplayingAlert = 1;
    -[AppLaunchNavTraceAlert _displayAlert](self, "_displayAlert");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: no need to be displayed", v10, 2u);
    }

    -[AppLaunchNavTraceAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (void)cancelAlertIfNecessary
{
  void *v3;

  if (self->_isDisplayingAlert
    && GEOConfigGetInteger(GeoServicesConfig_EnableFullNavTraceLogMessages[0], GeoServicesConfig_EnableFullNavTraceLogMessages[1]) != 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v3, "dismissCurrentInterruptionOfKind:", 16);

    -[AppLaunchNavTraceAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
  }
}

- (BOOL)_shouldDisplayAlert
{
  void *v2;
  unsigned int v3;
  BOOL result;

  result = (objc_msgSend(UIApp, "launchedToTest") & 1) == 0
        && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform")),
            v3 = objc_msgSend(v2, "isInternalInstall"),
            v2,
            v3)
        && GEOConfigGetInteger(GeoServicesConfig_EnableFullNavTraceLogMessages[0], GeoServicesConfig_EnableFullNavTraceLogMessages[1]) == 2;
  return result;
}

- (void)_displayAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("kMapsInterruptionTitle");
  v10[1] = CFSTR("kMapsInterruptionMessage");
  v11[0] = CFSTR("Automatically send your navigation trace logs to Apple?");
  v11[1] = CFSTR("These detailed logs will include timestamps and your device's approximate location as it travels along a requested route start and end points. You can disable the sending of these logs from Settings > Internal Settings > Maps.");
  v10[2] = CFSTR("kMapsInterruptionActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", CFSTR("Accept"), 0, 0));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", CFSTR("Decline"), 1, 0));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v11[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007404FC;
  v8[3] = &unk_1011AFA20;
  v8[4] = self;
  objc_msgSend(v7, "interruptApplicationWithKind:userInfo:completionHandler:", 16, v6, v8);

}

- (void)_alertDidFinishProcessing
{
  id v3;
  NSObject *v4;
  id completionBlock;
  void (**v6)(_QWORD);
  id v7;
  uint8_t v8[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AppLaunchNavTraceAlert: alert dismissed", v8, 2u);
  }

  self->_isDisplayingAlert = 0;
  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v6 = (void (**)(_QWORD))objc_retainBlock(completionBlock);
    v7 = self->_completionBlock;
    self->_completionBlock = 0;

    v6[2](v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
