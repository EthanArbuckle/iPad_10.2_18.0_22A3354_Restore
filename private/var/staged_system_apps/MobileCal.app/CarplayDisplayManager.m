@implementation CarplayDisplayManager

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIWindow *v24;
  void *v25;
  UIWindow *carWindow;
  NSObject *v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v28 = 138412546;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "scene:%@ willConnectToSession: %@", (uint8_t *)&v28, 0x16u);
  }
  objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v13 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screen"));
    if ((objc_msgSend(v14, "_isCarScreen") & 1) != 0 && !self->_carWindow)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coordinateSpace"));
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v24 = (UIWindow *)objc_alloc_init((Class)UIWindow);
      -[UIWindow setAutoresizesSubviews:](v24, "setAutoresizesSubviews:", 1);
      -[UIWindow setAutoresizingMask:](v24, "setAutoresizingMask:", 18);
      -[UIWindow setWindowScene:](v24, "setWindowScene:", v13);
      -[UIWindow makeKeyAndVisible](v24, "makeKeyAndVisible");
      -[UIWindow setFrame:](v24, "setFrame:", v17, v19, v21, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDisplayManager _rootViewControllerForCarScene](self, "_rootViewControllerForCarScene"));
      -[UIWindow setRootViewController:](v24, "setRootViewController:", v25);

      carWindow = self->_carWindow;
      self->_carWindow = v24;

    }
  }
  else
  {
    v27 = kCalUILogCarplayHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Scene connected, but it's not a window scene.", (uint8_t *)&v28, 2u);
    }
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  UIWindow *carWindow;
  int v8;
  id v9;

  v4 = a3;
  v5 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sceneDidDisconnect %@", (uint8_t *)&v8, 0xCu);
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UIWindow windowScene](self->_carWindow, "windowScene"));

  if (v6 == v4)
  {
    -[UIWindow setHidden:](self->_carWindow, "setHidden:", 1);
    carWindow = self->_carWindow;
    self->_carWindow = 0;

  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "anyObject", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  v7 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "openURLContexts:%@", (uint8_t *)&v8, 0xCu);
  }
  -[CarplayDisplayManager _openURL:](self, "_openURL:", v6);

}

- (void)_openURL:(id)a3
{
  UIWindow *carWindow;
  id v4;
  id v5;

  carWindow = self->_carWindow;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](carWindow, "rootViewController"));
  objc_msgSend(v5, "handleURL:", v4);

}

- (id)_rootViewControllerForCarScene
{
  void *v2;
  CarplayNavigationController *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDisplayManager _createAndSetupModel](self, "_createAndSetupModel"));
  v3 = -[CarplayNavigationController initWithModel:]([CarplayNavigationController alloc], "initWithModel:", v2);

  return v3;
}

- (id)_createAndSetupModel
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Application createNewCalendarModel](Application, "createNewCalendarModel"));
  objc_msgSend(v3, "checkLocationAuthorizationAndAllowEventLocationPrediction");
  -[CarplayDisplayManager _setUpSelectedCalendarsOnModel:](self, "_setUpSelectedCalendarsOnModel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode](EKCalendarVisibilityManager, "unselectedCalendarIdentifiersForFocusMode"));
  v5 = v4 != 0;

  objc_msgSend(v3, "setFocusFilterMode:", v5);
  return v3;
}

- (void)_setUpSelectedCalendarsOnModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = objc_alloc((Class)EKCalendarVisibilityManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceForSelectedIdentity"));
  v7 = objc_msgSend(v4, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:", v5, v6, 0, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleCalendarsForAllIdentities"));
  if (objc_msgSend(UIApp, "launchedToTest"))
  {
    v22 = v7;
    v9 = objc_msgSend(v8, "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
          v17 = objc_msgSend(v16, "containsString:", CFSTR("Legacy"));

          if (v17)
            objc_msgSend(v9, "removeObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v12);
    }

    v7 = v22;
  }
  else
  {
    v9 = v8;
  }
  v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    v20 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Visible calendars: (%tu)", buf, 0xCu);

  }
  v21 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v9);
  objc_msgSend(v3, "setSelectedCalendars:", v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carWindow, 0);
}

@end
