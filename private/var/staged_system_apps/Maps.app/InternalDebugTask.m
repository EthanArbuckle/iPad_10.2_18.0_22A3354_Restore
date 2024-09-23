@implementation InternalDebugTask

- (InternalDebugTask)init
{
  InternalDebugTask *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)InternalDebugTask;
  v2 = -[InternalDebugTask init](&v29, "init");
  if (v2)
  {
    if (+[DebugViewFrameHighlighter shouldHighlightOnLaunch](DebugViewFrameHighlighter, "shouldHighlightOnLaunch"))
    {
      +[DebugViewFrameHighlighter setFrameHighlightingEnabled:](DebugViewFrameHighlighter, "setFrameHighlightingEnabled:", 1);
    }
    if (+[MapsARSessionIndoorOutdoorFloatingDebugViewController shouldAttachOnLaunch](MapsARSessionIndoorOutdoorFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionIndoorOutdoorFloatingDebugViewController sharedInstance](MapsARSessionIndoorOutdoorFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v3, "attach");

    }
    if (+[ThermalStateFloatingDebugViewController shouldAttachOnLaunch](ThermalStateFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[ThermalStateFloatingDebugViewController sharedInstance](ThermalStateFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v4, "attach");

    }
    if (+[VectorKitFloatingDebugViewController shouldAttachOnLaunch](VectorKitFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[VectorKitFloatingDebugViewController sharedInstance](VectorKitFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v5, "attach");

    }
    if (+[VLFSessionStateFloatingDebugViewController shouldAttachOnLaunch](VLFSessionStateFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionStateFloatingDebugViewController sharedInstance](VLFSessionStateFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v6, "attach");

    }
    if (+[VIOSessionStateFloatingDebugViewController shouldAttachOnLaunch](VIOSessionStateFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VIOSessionStateFloatingDebugViewController sharedInstance](VIOSessionStateFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v7, "attach");

    }
    if (+[PedestrianARFloatingDebugViewController shouldAttachOnLaunch](PedestrianARFloatingDebugViewController, "shouldAttachOnLaunch"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v8, "attach");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey"));

      GEOConfigSetBOOL(MapsConfig_VLTraceRecordingEnabled, off_1014B3698, 0);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v13 = objc_msgSend(v12, "BOOLForKey:", off_1014A3148);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("__internal_VisualizeChromeLayoutGuidesDebug"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v15, "removeObjectForKey:", off_1014A3148);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, "_screenshotTakenNotification:", UIApplicationUserDidTakeScreenshotNotification, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, "_presentationControllerPresentationTransitionWillBeginNotification:", UIPresentationControllerPresentationTransitionWillBeginNotification, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, "_presentationControllerPresentationTransitionDidEndNotification:", UIPresentationControllerPresentationTransitionDidEndNotification, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, "_presentationControllerDismissalTransitionWillBeginNotification:", UIPresentationControllerDismissalTransitionWillBeginNotification, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, "_presentationControllerDismissalTransitionDidEndNotification:", UIPresentationControllerDismissalTransitionDidEndNotification, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (!objc_msgSend(v21, "BOOLForKey:", CFSTR("EnableRootInstallationFailureAlert")))
      goto LABEL_23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = objc_msgSend(v22, "fileExistsAtPath:isDirectory:", CFSTR("/var/staged_system_apps/Maps.app"), 0);

    if (v23)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Possible root installation failure"), CFSTR("Maps.app was found in /var/staged_system_apps. This usually means a root installation did not succeed. Try running \"mobile_install installStaged\"), 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
      objc_msgSend(v21, "addAction:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInternalAlertPresentationController sharedInstance](MapsInternalAlertPresentationController, "sharedInstance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindow](UIApplication, "_maps_keyMapsWindow"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "windowScene"));
      objc_msgSend(v25, "presentAlertController:fromWindowScene:", v21, v27);

LABEL_23:
    }
  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)_screenshotTakenNotification:(id)a3
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  v3 = sub_1004319DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", UIWindowSceneSessionRoleApplication);
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    v7 = v6;
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screenshot taken with Maps app foreground: %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_presentationControllerPresentationTransitionWillBeginNotification:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = sub_1004319DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "UIViewController will be presented: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_presentationControllerPresentationTransitionDidEndNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  __CFString *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIPresentationControllerPresentationTransitionDidEndCompletedKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = sub_1004319DC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
    v10 = CFSTR("NO");
    if (v6)
      v10 = CFSTR("YES");
    v11 = v10;
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "UIViewController was presented: %{public}@, completed: %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)_presentationControllerDismissalTransitionWillBeginNotification:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = sub_1004319DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "UIViewController will be dismissed: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  __CFString *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIPresentationControllerDismissalTransitionDidEndCompletedKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = sub_1004319DC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
    v10 = CFSTR("NO");
    if (v6)
      v10 = CFSTR("YES");
    v11 = v10;
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "UIViewController was dismissed: %{public}@, completed: %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

@end
