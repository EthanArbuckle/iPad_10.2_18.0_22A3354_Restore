@implementation PhoneSceneDelegate

- (id)_createWindowFromScene:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "applicationTintColor"));
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(v4, "_accessibilitySetInterfaceStyleIntent:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

  return v4;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillEnterForeground:", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PhoneApplicationActivatedNotification"), 0);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidBecomeActive:", (uint8_t *)&v15, 2u);
  }

  v6 = sub_10000CE64(CFSTR("PHLastTabTypeKey"), TUBundleIdentifierMobilePhoneApplication);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (int)v7;

  if (v8 != 2)
    objc_msgSend(UIApp, "warmInCallServiceIfNecessary");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate shortcutItem](self, "shortcutItem"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate shortcutItem](self, "shortcutItem"));
    v11 = -[PhoneSceneDelegate handleShortcutItem:](self, "handleShortcutItem:", v10);

    v12 = sub_10000E6C4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("NO");
      if (v11)
        v14 = CFSTR("YES");
      v15 = 138412290;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: did handle shortcut with success: %@", (uint8_t *)&v15, 0xCu);
    }

    -[PhoneSceneDelegate setShortcutItem:](self, "setShortcutItem:", 0);
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  UIWindow *v13;
  UIWindow *window;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;

  v7 = a3;
  v8 = a5;
  v9 = sub_10000E6C4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: scene:willConnectToSession:options: %@", buf, 0xCu);
  }

  v11 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    v12 = v7;
    if (!-[PhoneSceneDelegate isUIInitialized](self, "isUIInitialized"))
    {
      if (!self->_window)
      {
        v13 = (UIWindow *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate _createWindowFromScene:](self, "_createWindowFromScene:", v12));
        window = self->_window;
        self->_window = v13;

      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100008948;
      v28[3] = &unk_1000898B8;
      v28[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
    }
  }
  else
  {
    v15 = sub_10000E6C4();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100055114((uint64_t)v7, v12);
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
    objc_msgSend(v16, "orderFront:", 0);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortcutItem"));
  -[PhoneSceneDelegate setShortcutItem:](self, "setShortcutItem:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
  objc_msgSend(v18, "displayUIAnimated:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts"));
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts"));
    -[PhoneSceneDelegate scene:openURLContexts:](self, "scene:openURLContexts:", v7, v21);
  }
  else
  {
    v21 = objc_alloc_init((Class)TUFeatureFlags);
    if (objc_msgSend(v21, "callHistorySearchEnabled"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivities"));
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivities"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "anyObject"));

        v26 = sub_10000E6C4();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: connectionOptions has userActivity: %@", buf, 0xCu);
        }

        -[PhoneSceneDelegate scene:continueUserActivity:](self, "scene:continueUserActivity:", v7, v25);
      }
    }
  }

}

- (UIWindow)window
{
  return self->_window;
}

- (UIApplicationShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutItem, a3);
}

- (void)setIsUIInitialized:(BOOL)a3
{
  self->_isUIInitialized = a3;
}

- (BOOL)isUIInitialized
{
  return self->_isUIInitialized;
}

- (void)_initializeUI
{
  if (!objc_msgSend(UIApp, "isSuspended")
    || (objc_msgSend(UIApp, "alwaysShowLocalVideo") & 1) == 0)
  {
    _objc_msgSend(UIApp, "showInitialView");
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidEnterBackground:", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PhoneApplicationDeactivatedNotification"), 0);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _BOOL8);
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL8 v12;
  int v13;
  id v14;

  v7 = a4;
  v8 = (void (**)(id, _BOOL8))a5;
  v9 = sub_10000E6C4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: windowScene:performActionForShortcutItem: %@", (uint8_t *)&v13, 0xCu);
  }

  -[PhoneSceneDelegate setShortcutItem:](self, "setShortcutItem:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate shortcutItem](self, "shortcutItem"));
  v12 = -[PhoneSceneDelegate handleShortcutItem:](self, "handleShortcutItem:", v11);

  -[PhoneSceneDelegate setShortcutItem:](self, "setShortcutItem:", 0);
  v8[2](v8, v12);

}

- (BOOL)handleShortcutItem:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;

  v3 = a3;
  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: handling shortcut item %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseViewController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  if (v9)
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

  return 0;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidDisconnect:", v12, 2u);
  }

  v7 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyWindow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));

    if (v9 == v11)
      objc_msgSend(UIApp, "setRootViewController:", 0);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", 0);

  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillResignActive:", v5, 2u);
  }

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;

  v4 = a4;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate openURLContexts: %@", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)UIApp;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "URL", (_QWORD)v14));
        objc_msgSend(v12, "applicationOpenURL:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone scene %@ will continue user activity with type %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = objc_alloc_init((Class)TUFeatureFlags);
  if (objc_msgSend(v9, "conversationHandoffEnabled")
    && objc_msgSend(v6, "isEqualToString:", TUUserActivityTypeConversationHandoff))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v10, "continueHandoffEligibleConversation");

  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone scene %@ is continuing user activity: %@", (uint8_t *)&v18, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v10 = TUCallPhoneAppHistoryActivityType();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
    v14 = objc_msgSend(v13, "isEqualToString:", TUUserActivityTypeConversationHandoff);

    if (v14)
    {
      v15 = sub_10000E6C4();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tu_dynamicIdentifier"));
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FaceTime call handoff dynamic identifier was: %@", (uint8_t *)&v18, 0xCu);
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject baseViewController](v16, "baseViewController"));
      objc_msgSend(v17, "handleUserActivityContinuation:", v6);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10000E6C4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did fail to continue user activity with type %@ due to error %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did update user activity %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutItem, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
