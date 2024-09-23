@implementation MailSceneLifecycleController

- (void)sceneDidBecomeActive:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v12));

    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidBecomeActive: %{public}@", buf, 0xCu);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 74, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  objc_msgSend(v5, "mailSceneDidBecomeActive");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v12));

    *(_DWORD *)buf = 138543362;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneWillEnterForeground: %{public}@", buf, 0xCu);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 88, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v15 = v5;
  objc_msgSend(v15, "mailSceneWillEnterForeground");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneLifecycleController deferredConnectionOptions](self, "deferredConnectionOptions"));
  -[MailSceneLifecycleController setDeferredConnectionOptions:](self, "setDeferredConnectionOptions:", 0);
  if (v16)
  {
    if ((objc_opt_respondsToSelector(v15, "mailSceneOpenURLContexts:") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLContexts"));
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v15, "mailSceneOpenURLContexts:", v17);
LABEL_17:

        goto LABEL_18;
      }

    }
    if ((objc_opt_respondsToSelector(v15, "mailSceneWillContinueUserActivityWithType:") & 1) != 0
      && (objc_opt_respondsToSelector(v15, "mailSceneContinueUserActivity:") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userActivities"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));

      if (v17)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activityType"));
        objc_msgSend(v15, "mailSceneWillContinueUserActivityWithType:", v19);

        objc_msgSend(v15, "mailSceneContinueUserActivity:", v17);
        goto LABEL_17;
      }
    }
    if ((objc_opt_respondsToSelector(v15, "mailScenePerformActionForShortcutItem:completionHandler:") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shortcutItem"));
      if (v17)
      {
        objc_msgSend(v15, "mailScenePerformActionForShortcutItem:completionHandler:", v17, &stru_10051E9D0);
        goto LABEL_17;
      }
    }
  }
LABEL_18:

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  id v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  MFWindow *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v31 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v10;
    v13 = a2;
    v14 = v9;
    v15 = (objc_class *)objc_opt_class(v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "persistentIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v17, v19));

    *(_DWORD *)buf = 138543618;
    v33 = v20;
    v34 = 2112;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ willConnectToSession: %@", buf, 0x16u);

    a2 = v13;
    v10 = v12;
  }

  v21 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v9, v21) & 1) == 0
    || (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 33, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v22 = v9;
  v23 = -[MFWindow initWithWindowScene:]([MFWindow alloc], "initWithWindowScene:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor"));
  -[MFWindow setTintColor:](v23, "setTintColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFWindow layer](v23, "layer"));
  objc_msgSend(v25, "setHitTestsAsOpaque:", 1);

  -[MailSceneLifecycleController setWindow:](self, "setWindow:", v23);
  objc_msgSend(v22, "mailSceneDidConnectWithOptions:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mf_rootViewController"));
  if (!v26)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 41, CFSTR("Scene must provide a root view controller after connection."));

  }
  v27 = (void *)objc_opt_class(v22);
  if ((objc_opt_respondsToSelector(v27, "wantsDeferredConnectionActions") & 1) != 0
    && objc_msgSend(v27, "wantsDeferredConnectionActions"))
  {
    -[MailSceneLifecycleController setDeferredConnectionOptions:](self, "setDeferredConnectionOptions:", v31);
  }
  -[MailSceneLifecycleController _installDebugHandlerForScene:](self, "_installDebugHandlerForScene:", v22);
  -[MFWindow setRootViewController:](v23, "setRootViewController:", v26);
  if (objc_msgSend(v22, "conformsToProtocol:", &OBJC_PROTOCOL___MFWindowDelegate))
    -[MFWindow setDelegate:](v23, "setDelegate:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneLifecycleController window](self, "window"));
  objc_msgSend(v28, "makeKeyAndVisible");

}

- (MFWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setDeferredConnectionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_deferredConnectionOptions, a3);
}

- (UISceneConnectionOptions)deferredConnectionOptions
{
  return self->_deferredConnectionOptions;
}

- (void)_installDebugHandlerForScene:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id location;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "mailSceneDebugGesturePerformed") & 1) != 0)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    objc_copyWeak(&v6, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarManager", _NSConcreteStackBlock, 3221225472, sub_1000F813C, &unk_10051B1B8));
    objc_msgSend(v4, "setDebugMenuHandler:", &v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BF70;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9DE0 != -1)
    dispatch_once(&qword_1005A9DE0, block);
  return (id)qword_1005A9DD8;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v12));

    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidDisconnect: %{public}@", buf, 0xCu);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 60, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v15 = v5;
  objc_msgSend(v15, "mailSceneDidDisconnect");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneLifecycleController window](self, "window"));
  objc_msgSend(v16, "setRootViewController:", 0);

  -[MailSceneLifecycleController setWindow:](self, "setWindow:", 0);
}

- (void)sceneWillResignActive:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v12));

    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneWillResignActive: %{public}@", buf, 0xCu);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 81, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  objc_msgSend(v5, "mailSceneWillResignActive");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v12));

    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidEnterBackground: %{public}@", buf, 0xCu);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 129, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  objc_msgSend(v5, "mailSceneDidEnterBackground");

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0
    || (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 137, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v10 = v7;
  if ((objc_opt_respondsToSelector(v10, "mailSceneWillContinueUserActivityWithType:") & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      v13 = (objc_class *)objc_opt_class(v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v15, v17));

      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ willContinueUserActivityWithType: %@", buf, 0x16u);

    }
    objc_msgSend(v10, "mailSceneWillContinueUserActivityWithType:", v8);
  }

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0
    || (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 146, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v10 = v7;
  if ((objc_opt_respondsToSelector(v10, "mailSceneContinueUserActivity:") & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      v13 = (objc_class *)objc_opt_class(v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v15, v17));

      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetContentIdentifier"));
      *(_DWORD *)buf = 138543874;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ continueUserActivity: %@, identifier: %@", buf, 0x20u);

    }
    objc_msgSend(v10, "mailSceneContinueUserActivity:", v8);
  }

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0
    || (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 155, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v13 = v9;
  if ((objc_opt_respondsToSelector(v13, "mailSceneDidFailToContinueUserActivityWithType:error:") & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v13;
      v16 = (objc_class *)objc_opt_class(v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "session"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "persistentIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v18, v20));

      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      v27 = 2112;
      v28 = v10;
      v29 = 2114;
      v30 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "scene: %{public}@ didFailToContinueUserActivityWithType: %@ error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v13, "mailSceneDidFailToContinueUserActivityWithType:error:", v10, v11);
  }

}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0
    || (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 164, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v10 = v7;
  if ((objc_opt_respondsToSelector(v10, "mailSceneDidUpdateUserActivity:") & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      v13 = (objc_class *)objc_opt_class(v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v15, v17));

      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ didUpdateUserActivity: %@", buf, 0x16u);

    }
    objc_msgSend(v10, "mailSceneDidUpdateUserActivity:", v8);
  }

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0
    || (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 175, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v10 = v7;
  if ((objc_opt_respondsToSelector(v10, "mailSceneOpenURLContexts:") & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v10;
      v13 = (objc_class *)objc_opt_class(v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v15, v17));

      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "scene: %{public}@ openURLContexts: %@", buf, 0x16u);

    }
    objc_msgSend(v10, "mailSceneOpenURLContexts:", v8);
  }

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0
    || (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 186, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v13 = v9;
  if ((objc_opt_respondsToSelector(v13, "mailScenePerformActionForShortcutItem:completionHandler:") & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v13;
      v16 = (objc_class *)objc_opt_class(v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "session"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "persistentIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v18, v20));

      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "windowScene: %{public}@ performActionForShortcutItems: %@", buf, 0x16u);

    }
    objc_msgSend(v13, "mailScenePerformActionForShortcutItem:completionHandler:", v10, v11);
  }

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;

  v5 = a3;
  v6 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0
    || (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MailSceneLifecycleResponder) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailSceneLifecycleController.m"), 196, CFSTR("Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."));

  }
  v7 = v5;
  if ((objc_opt_respondsToSelector(v7, "stateRestorationActivityForMailScene") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateRestorationActivityForMailScene"));
    v9 = objc_claimAutoreleasedReturnValue(+[MailSceneLifecycleController log](MailSceneLifecycleController, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v7;
      v11 = (objc_class *)objc_opt_class(v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "session"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v13, v15));

      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "stateRestorationActivityForScene: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredConnectionOptions, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
