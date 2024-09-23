@implementation MapsSceneDelegate

- (void)dealloc
{
  objc_super v3;

  -[MapsDebugValuesViewController setDelegate:](self->_mapsDebugController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsSceneDelegate;
  -[MapsSceneDelegate dealloc](&v3, "dealloc");
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *analyticsQueue;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  BOOL v50;
  uint8_t v51[16];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillConnectTosSession", ", buf, 2u);
  }

  v13 = v8;
  v14 = sub_100431A4C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    *(_DWORD *)buf = 138412802;
    v53 = v16;
    v54 = 2112;
    v55 = v9;
    v56 = 2112;
    v57 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", buf, 0x20u);

  }
  v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.maps.analytics", v18);
  analyticsQueue = self->_analyticsQueue;
  self->_analyticsQueue = v19;

  v21 = sub_100431A4C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlatformController", ", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appSessionController](self, "appSessionController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "addActiveiOSPlatformControllerForScene:", v13));
  -[MapsSceneDelegate setPlatformController:](self, "setPlatformController:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate platformController](self, "platformController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appSessionController](self, "appSessionController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryPlatformController"));
  v28 = v25 == v27;

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate platformController](self, "platformController"));
    objc_msgSend(v29, "prepareToReplaySessions");

  }
  v30 = sub_100431A4C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlatformController", ", buf, 2u);
  }

  v32 = sub_100431A4C();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", ", buf, 2u);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coordinateSpace"));
  objc_msgSend(v35, "bounds");
  objc_msgSend(v34, "willConnectToSession:options:windowSize:scene:", v9, v10, v13, v36, v37);

  v38 = sub_100431A4C();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v40 = sub_100431A4C();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_signpost_enabled(v41))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LoadMapsForScene", ", v51, 2u);
  }

  v45 = _NSConcreteStackBlock;
  v46 = 3221225472;
  v47 = sub_100BC3218;
  v48 = &unk_1011AD388;
  objc_copyWeak(&v49, (id *)buf);
  v50 = v28;
  -[MapsSceneDelegate _loadMapsForWindowScene:withCompletion:](self, "_loadMapsForWindowScene:withCompletion:", v13, &v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v45, v46, v47, v48));
  objc_msgSend(v42, "addObserver:selector:name:object:", self, "_locationManagerAuthorizationChanged:", MKLocationManagerApprovalDidChangeNotification, 0);

  v43 = sub_100431A4C();
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillConnectTosSession", ", v51, 2u);
  }

  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)buf);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", ", (uint8_t *)&v18, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidDisconnect: %@", (uint8_t *)&v18, 0xCu);

  }
  -[MapsSceneDelegate archiveMapsActivity](self, "archiveMapsActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appSessionController](self, "appSessionController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate platformController](self, "platformController"));
  objc_msgSend(v10, "removeiOSPlatformController:", v11);

  -[MapsSceneDelegate setPlatformController:](self, "setPlatformController:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v12, "closeForClient:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend(v14, "setHidden:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend(v15, "setRootViewController:", 0);

  -[MapsSceneDelegate setWindow:](self, "setWindow:", 0);
  v16 = sub_100431A4C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", ", (uint8_t *)&v18, 2u);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  int v26;
  void *v27;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", ", (uint8_t *)&v26, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v26 = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidBecomeActive: %@", (uint8_t *)&v26, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v10, "didBecomeActiveWithSession:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v12, "reloadForChangedLightLevelTrackers");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self->_appCoordinator, "baseModeController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v16, "timeIntervalSinceLastBackgrounded");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "baseActionCoordinator"));
  -[MapsSceneDelegate _sendMapsSuggestionsSignalsUsingBaseMode:secondsSinceBackgrounding:routePlanningPresented:](self, "_sendMapsSuggestionsSignalsUsingBaseMode:secondsSinceBackgrounding:routePlanningPresented:", v14 == (_QWORD)v15, objc_msgSend(v20, "isRoutePlanningPresented"), v18);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  LOBYTE(v14) = objc_msgSend(v21, "isLocationServicesAuthorizationNeeded");

  if ((v14 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v22, "resetAfterResumeIfNecessary");

  }
  if (!self->_isTemporaryPreciseLocationAuthorizationPromptShown)
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_1011E8128);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  self->_isTemporaryPreciseLocationAuthorizationPromptShown = objc_msgSend(v23, "isTemporaryPreciseLocationAuthorizationPromptShown");

  v24 = sub_100431A4C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_signpost_enabled(v25))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", ", (uint8_t *)&v26, 2u);
  }

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int IsNavigating;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  void *v21;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", ", (uint8_t *)&v20, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v20 = 138412290;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneWillResignActive: %@", (uint8_t *)&v20, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v10, "willResignActiveWithSession:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v12, "isSuspendedUnderLock"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v14 = objc_msgSend(v13, "state");
    IsNavigating = MNNavigationServiceStateIsNavigating(v14, v15);

    if (!IsNavigating)
      goto LABEL_9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
    objc_msgSend(v12, "dismissAllModalViewsIfPresentAnimated:completion:", 1, 0);
  }

LABEL_9:
  -[MapsSceneDelegate refreshTitle](self, "refreshTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  self->_isTemporaryPreciseLocationAuthorizationPromptShown = objc_msgSend(v17, "isTemporaryPreciseLocationAuthorizationPromptShown");

  if (!self->_isTemporaryPreciseLocationAuthorizationPromptShown)
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_1011E8148);
  v18 = sub_100431A4C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", ", (uint8_t *)&v20, 2u);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", ", (uint8_t *)&v16, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v16 = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneWillEnterForeground: %@", (uint8_t *)&v16, 0xCu);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v11, &stru_1011E8168);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v12, "willEnterForegroundWithSession:", v13);

  v14 = sub_100431A4C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", ", (uint8_t *)&v16, 2u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", ", (uint8_t *)&v15, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v15 = 138412290;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MapsSceneDelegate] -sceneDidEnterBackground: %@", (uint8_t *)&v15, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v10, "didEnterBackgroundWithSession:", v11);

  -[MapsSceneDelegate archiveMapsActivity](self, "archiveMapsActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v12, "reloadForChangedLightLevelTrackers");

  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", ", (uint8_t *)&v15, 2u);
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "activationState");
  v6 = sub_10043188C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5 == (id)-1)
  {
    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivity](self, "mapsActivity"));
      v13 = 138478083;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "UIKit not archiving MapsActivity %{private}@ for Scene: %@", (uint8_t *)&v13, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivity](self, "mapsActivity"));
      v13 = 138477827;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "UIKit archiving MapsActivity: %{private}@", (uint8_t *)&v13, 0xCu);

    }
    v7 = objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivityController](self, "mapsActivityController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapsUserActivityForStateRestoration](v7, "mapsUserActivityForStateRestoration"));
  }

  return v10;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  objc_msgSend(v6, "willContinueUserActivityWithType:", v5);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "coordinateSpace"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "continueUserActivity:session:windowSize:", v6, v8, v10, v11);

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  objc_msgSend(v9, "didFailToContinueUserActivityWithType:error:", v8, v7);

}

- (void)archiveMapsActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivityController](self, "mapsActivityController"));
  objc_msgSend(v2, "archiveMapsActivity");

}

- (void)setNeedsUserActivityUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivityController](self, "mapsActivityController"));
  objc_msgSend(v2, "setNeedsUserActivityUpdate");

}

- (void)userActivityWillSave:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActivityController](self, "mapsActivityController"));
  objc_msgSend(v5, "userActivityWillSave:", v4);

}

- (MapsActivity)mapsActivity
{
  return (MapsActivity *)-[MapsSceneDelegate mapsActivityWithFidelity:](self, "mapsActivityWithFidelity:", 0xFFFFFFFLL);
}

- (id)mapsActivityWithFidelity:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appStateManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapsActivityWithFidelity:", a3));

  return v6;
}

- (void)setMapsActivity:(id)a3
{
  -[MapsSceneDelegate setMapsActivity:assumedSourceFidelity:source:](self, "setMapsActivity:assumedSourceFidelity:source:", a3, 0xFFFFFFFLL, 1);
}

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appStateManager"));
    objc_msgSend(v9, "setMapsActivity:assumedSourceFidelity:source:", v10, a4, a5);

  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v21 = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "-scene:openURLContexts: %@ contexts %@", (uint8_t *)&v21, 0x16u);

  }
  v11 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v12, "resetAfterResumeIfNecessary");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "options"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coordinateSpace"));

  objc_msgSend(v18, "bounds");
  objc_msgSend(v14, "openURL:session:sceneOptions:mkOptions:windowSize:", v15, v16, v17, 0, v19, v20);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  objc_msgSend(v7, "openShortcutItem:", v6);

}

- (id)appSessionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSessionController"));

  return v3;
}

- (AppCoordinator)appCoordinator
{
  AppCoordinator *appCoordinator;
  AppCoordinator *v4;
  void *v5;
  AppCoordinator *v6;
  AppCoordinator *v7;
  void *v8;

  appCoordinator = self->_appCoordinator;
  if (!appCoordinator)
  {
    v4 = [AppCoordinator alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate platformController](self, "platformController"));
    v6 = -[AppCoordinator initWithPlatformController:](v4, "initWithPlatformController:", v5);
    v7 = self->_appCoordinator;
    self->_appCoordinator = v6;

    -[AppCoordinator setMapsSceneDelegate:](self->_appCoordinator, "setMapsSceneDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
    -[AppCoordinator setChromeViewController:](self->_appCoordinator, "setChromeViewController:", v8);

    appCoordinator = self->_appCoordinator;
  }
  return appCoordinator;
}

- (IOSBasedChromeViewController)chromeViewController
{
  IOSBasedChromeViewController *chromeViewController;
  void *v4;
  id v5;
  __objc2_class **v6;
  IOSBasedChromeViewController *v7;
  IOSBasedChromeViewController *v8;
  void *v9;

  chromeViewController = self->_chromeViewController;
  if (!chromeViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = off_101197648;
    if (v5 != (id)5)
      v6 = off_101196D70;
    v7 = (IOSBasedChromeViewController *)objc_alloc_init(*v6);
    v8 = self->_chromeViewController;
    self->_chromeViewController = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActionController](self, "mapsActionController"));
    -[IOSBasedChromeViewController setMapsActionController:](self->_chromeViewController, "setMapsActionController:", v9);

    chromeViewController = self->_chromeViewController;
  }
  -[IOSBasedChromeViewController setAppCoordinator:](chromeViewController, "setAppCoordinator:", self->_appCoordinator);
  return self->_chromeViewController;
}

- (id)searchPinsManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));

  return v3;
}

- (EntryPointsCoordinator)entryPointsCoordinator
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate mapsActionController](self, "mapsActionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController entryPointsCoordinator](self->_platformController, "entryPointsCoordinator"));
  objc_msgSend(v4, "setDelegate:", v3);

  return -[PlatformController entryPointsCoordinator](self->_platformController, "entryPointsCoordinator");
}

- (MapsActionController)mapsActionController
{
  MapsActionController *mapsActionController;
  MapsActionController *v4;
  MapsActionController *v5;
  void *v6;

  mapsActionController = self->_mapsActionController;
  if (!mapsActionController)
  {
    v4 = objc_alloc_init(MapsActionController);
    v5 = self->_mapsActionController;
    self->_mapsActionController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
    -[MapsActionController setAppCoordinator:](self->_mapsActionController, "setAppCoordinator:", v6);

    mapsActionController = self->_mapsActionController;
  }
  return mapsActionController;
}

- (MapsActivityController)mapsActivityController
{
  MapsActivityController *mapsActivityController;
  MapsActivityController *v4;
  MapsActivityController *v5;

  mapsActivityController = self->_mapsActivityController;
  if (!mapsActivityController)
  {
    v4 = objc_alloc_init(MapsActivityController);
    v5 = self->_mapsActivityController;
    self->_mapsActivityController = v4;

    -[MapsActivityController setDelegate:](self->_mapsActivityController, "setDelegate:", self);
    mapsActivityController = self->_mapsActivityController;
  }
  return mapsActivityController;
}

- (RAPPresenter)rapPresenter
{
  RAPPresenter *rapPresenter;
  RAPPresenter *v4;
  RAPPresenter *v5;

  rapPresenter = self->_rapPresenter;
  if (!rapPresenter)
  {
    v4 = -[RAPPresenter initWithSceneDelegate:]([RAPPresenter alloc], "initWithSceneDelegate:", self);
    v5 = self->_rapPresenter;
    self->_rapPresenter = v4;

    rapPresenter = self->_rapPresenter;
  }
  return rapPresenter;
}

- (UIViewController)topMostPresentedViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  if (v4)
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return (UIViewController *)v5;
}

- (void)_loadMapsForWindowScene:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t Log;
  NSObject *v23;
  void *v24;
  EventSourceWindow *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id location;
  _QWORD v47[5];
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_loadMapsForWindowScene: %@", (uint8_t *)&buf, 0xCu);

  }
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100BC500C;
  v47[3] = &unk_1011AC860;
  v47[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarManager"));
  objc_msgSend(v11, "setDebugMenuHandler:", v47);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLsForDirectory:inDomains:", 13, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  +[MKIconManager setDiskCacheURL:](MKIconManager, "setDiskCacheURL:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v16 = objc_msgSend(v15, "activeTileGroup");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  objc_msgSend(v17, "addObserver:", self);

  objc_initWeak(&location, self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100BC5014;
  v44[3] = &unk_1011E8190;
  objc_copyWeak(&v45, &location);
  objc_msgSend(v18, "fetchCurrentAnnouncement:", v44);

  v19 = objc_msgSend(objc_alloc((Class)NSURLCache), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, 0);
  +[NSURLCache setSharedURLCache:](NSURLCache, "setSharedURLCache:", v19);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v49 = 0x3032000000;
  v50 = sub_100BC50C0;
  v51 = sub_100BC50D0;
  v52 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100BC50D8;
  v43[3] = &unk_1011AEF80;
  v43[4] = &buf;
  objc_msgSend(v20, "addNetworkActivityHandler:", v43);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "BackgroundState");
  v23 = objc_claimAutoreleasedReturnValue(Log);
  objc_msgSend(v21, "setEnableLoggingInLockScreen:", os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
  -[PlatformController setChromeViewController:](self->_platformController, "setChromeViewController:", v24);

  v25 = -[EventSourceWindow initWithWindowScene:]([EventSourceWindow alloc], "initWithWindowScene:", v6);
  -[MapsSceneDelegate setWindow:](self, "setWindow:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend(v26, "setAccessibilityIdentifier:", CFSTR("Maps.Application"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
  v28 = objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend((id)v28, "setRootViewController:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  LOBYTE(v28) = sub_1002A8AA0(v29) == 5;

  if ((v28 & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
    objc_msgSend(v31, "setTintColor:", v30);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend(v33, "setBackgroundColor:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate window](self, "window"));
  objc_msgSend(v34, "makeKeyAndVisible");

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPinsController sharedController](MapsPinsController, "sharedController"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100BC51C4;
  v41[3] = &unk_1011E81E0;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v35, "getDroppedPinWithCompletion:", v41);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v37 = objc_msgSend(v36, "isInternalInstall");

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v38, "addObserver:selector:name:object:", self, "geoDaemonDisconnectNotificationHandler:", GEODaemonCommunicationInterruptedNotification, 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v39, "addObserver:selector:name:object:", self, "vkFaultNotificationHandler:", VKFaultNotification, 0);

  }
  -[MapsSceneDelegate setNeedsUserActivityUpdate](self, "setNeedsUserActivityUpdate");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  objc_msgSend(v40, "startSearchModeWithCompletion:", v7);

  objc_destroyWeak(&v42);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

}

- (void)_locationManagerAuthorizationChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if (objc_msgSend(v7, "isLocationServicesAuthorizationNeeded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchAlertsManager"));

    objc_msgSend(v5, "enqueueAlert:", 0);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isLocationServicesDenied"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
    objc_msgSend(v6, "setUserTrackingMode:", 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_sendMapsSuggestionsSignalsUsingBaseMode:(BOOL)a3 secondsSinceBackgrounding:(double)a4 routePlanningPresented:(BOOL)a5
{
  double v6;
  void *v7;
  id v8;
  MapsSceneDelegate *obj;

  obj = self;
  objc_sync_enter(obj);
  if (qword_1014D4330 != -1)
    dispatch_once(&qword_1014D4330, &stru_1011E8200);
  *(float *)&v6 = a4;
  objc_msgSend((id)qword_1014D4340, "writeSignalValue:forType:", 23, v6);
  v7 = (void *)qword_1014D4338;
  v8 = objc_msgSend((id)qword_1014D4340, "copy");
  objc_msgSend(v7, "donateSignalPack:", v8);

  objc_sync_exit(obj);
}

- (void)geoDaemonDisconnectNotificationHandler:(id)a3
{
  void *v4;
  unsigned int v5;
  _QWORD block[5];

  if (GEOConfigGetBOOL(MapsConfig_ShowGeodCrashDialog, off_1014B30C8))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v5 = objc_msgSend(v4, "isInternalInstall");

    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100BC5514;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)vkFaultNotificationHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _QWORD v7[4];
  id v8;
  MapsSceneDelegate *v9;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsConfig_ShowVectorKitFaultDialog, off_1014B50A8))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v6 = objc_msgSend(v5, "isInternalInstall");

    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100BC57E8;
      v7[3] = &unk_1011AC8B0;
      v8 = v4;
      v9 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

    }
  }

}

- (void)pushDaemonProxyReceivedNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  objc_msgSend(v11, "openNotificationData:forType:recordIdentifier:", v10, v9, v8);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  objc_msgSend(v12, "clearBulletinWithRecordID:", v8);

}

- (void)updateDirectionsListVisibility:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "showFullscreenDirectionsList");
  else
    objc_msgSend(v4, "hideFullscreenDirectionsList");

}

- (void)presentMapsDebugControllerIfEnabled
{
  if (sub_100424728())
    -[MapsSceneDelegate presentMapsDebugController](self, "presentMapsDebugController");
}

- (void)presentMapsDebugController
{
  MapsDebugController *v3;
  MapsDebugController *mapsDebugController;
  void *v5;
  UINavigationController *debugNavigationController;
  UINavigationController *v7;
  UINavigationController *v8;
  void *v9;

  if (!self->_mapsDebugController)
  {
    v3 = objc_alloc_init(MapsDebugController);
    mapsDebugController = self->_mapsDebugController;
    self->_mapsDebugController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate chromeViewController](self, "chromeViewController"));
    -[MapsDebugValuesViewController setDelegate:](self->_mapsDebugController, "setDelegate:", v5);

  }
  debugNavigationController = self->_debugNavigationController;
  if (!debugNavigationController)
  {
    v7 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_mapsDebugController);
    v8 = self->_debugNavigationController;
    self->_debugNavigationController = v7;

    debugNavigationController = self->_debugNavigationController;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](debugNavigationController, "presentingViewController"));

  if (!v9)
    -[MapsSceneDelegate presentViewController:animated:](self, "presentViewController:animated:", self->_debugNavigationController, 1);
}

- (void)dismissMapsDebugControllerWithCompletion:(id)a3
{
  -[MapsDebugController dismissViewControllerAnimated:completion:](self->_mapsDebugController, "dismissViewControllerAnimated:completion:", 1, a3);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));

    v6 = v11;
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate topMostPresentedViewController](self, "topMostPresentedViewController"));
      if (objc_msgSend(v8, "isViewLoaded"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

        if (v10)
        {
          objc_msgSend(v11, "setModalPresentationStyle:", 2);
          objc_msgSend(v8, "presentViewController:animated:completion:", v11, v4, 0);
        }
      }

      v6 = v11;
    }
  }

}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseActionCoordinator"));
  objc_msgSend(v5, "setContaineeDelegate:", v7);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseActionCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerViewController"));
  objc_msgSend(v9, "presentController:animated:", v5, 1);

}

- (void)refreshTitle
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BC5E88;
  v4[3] = &unk_1011AE420;
  v4[4] = self;
  objc_msgSend(v3, "getCurrentSceneTitleWithCompletion:", v4);

}

- (void)refreshTitleAfterShortDelay
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "refreshTitle", 0);
  -[MapsSceneDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "refreshTitle", 0, 1.0);
}

- (NSString)sceneIdentifier
{
  return (NSString *)CFSTR("iOS");
}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestCoordinatorProtocol);

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSceneDelegate appCoordinator](self, "appCoordinator"));
  else
    v5 = 0;
  return (PPTTestCoordinatorProtocol *)v5;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_appCoordinator, a3);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_chromeViewController, a3);
}

- (void)setEntryPointsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_entryPointsCoordinator, a3);
}

- (void)setRapPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_rapPresenter, a3);
}

- (void)setMapsActionController:(id)a3
{
  objc_storeStrong((id *)&self->_mapsActionController, a3);
}

- (void)setMapsActivityController:(id)a3
{
  objc_storeStrong((id *)&self->_mapsActivityController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsActivityController, 0);
  objc_storeStrong((id *)&self->_mapsActionController, 0);
  objc_storeStrong((id *)&self->_rapPresenter, 0);
  objc_storeStrong((id *)&self->_entryPointsCoordinator, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_appCoordinator, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_mapsDebugController, 0);
  objc_storeStrong((id *)&self->_debugNavigationController, 0);
}

@end
