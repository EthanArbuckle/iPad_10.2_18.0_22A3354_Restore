@implementation AppleTVAppDelegate

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)1)
  {
    v8 = 30;
  }
  else
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___VUIOrientationOverride))
    {
      v9 = objc_msgSend(v5, "overridesOrientationLock");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));

      if (v11)
      {
        do
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));
          v10 = v12;
        }
        while (v13);
      }
      else
      {
        v12 = v10;
      }
      if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___VUIOrientationOverride))
        v9 = objc_msgSend(v12, "overridesOrientationLock");
      else
        v9 = 0;

    }
    if (-[AppleTVAppDelegate overrideOrientation](self, "overrideOrientation") | v9)
      v8 = 26;
    else
      v8 = 2;
  }

  return v8;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)registerBgUrlSessionNotifications
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_downloadSessionDidFinishEventsForBackgroundURLSession:", TVPDownloadSessionDidFinishEventsForBackgroundURLSessionNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_downloadSessionDidFinishEventsForARBackgroundURLSession:", VUIARQLDownloadSessionDidFinishEventsForBackgroundURLSessionNotification, 0);

}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (AppleTVAppDelegate)init
{
  AppleTVAppDelegate *v2;
  AppleTVAppDelegate *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AppleTVAppDelegate;
  v2 = -[AppleTVAppDelegate init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[AppleTVAppDelegate registerBgUrlSessionNotifications](v2, "registerBgUrlSessionNotifications");
    v4 = +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  }
  return v3;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a4;
  v5 = VUISignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.Main", ", buf, 2u);
  }

  v7 = VUISignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.WillFinishLaunch", ", v15, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  v10 = objc_msgSend(v9, "applicationWillFinishLaunchingWithOptions:", v4);

  v11 = VUISignpostLogObject();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.WillFinishLaunch", ", v14, 2u);
  }

  return v10;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v5 = a4;
  v6 = VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch", ", buf, 2u);
  }

  v8 = VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.MainWindow", ", v30, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithFrame:", v12, v14, v16, v18);
  -[AppleTVAppDelegate setWindow:](self, "setWindow:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  objc_msgSend(v20, "setMainWindow:", v19);

  v21 = VUISignpostLogObject();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.MainWindow", ", v29, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  v24 = objc_msgSend(v23, "applicationDidFinishLaunchingWithOptions:", v5);

  v25 = VUISignpostLogObject();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch", ", v28, 2u);
  }

  return v24;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  objc_msgSend(v3, "cleanUp");

  v4.receiver = self;
  v4.super_class = (Class)AppleTVAppDelegate;
  -[AppleTVAppDelegate dealloc](&v4, "dealloc");
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  int v13;
  id v14;

  v6 = a4;
  v7 = a5;
  v8 = VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate openURL -- url %@", (uint8_t *)&v13, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  v11 = objc_msgSend(v10, "openURL:options:", v6, v7);

  return v11;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;

  v5 = a4;
  v6 = VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate continueUserActivity -- restorationHandler activityType %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v10 = objc_msgSend(v9, "isEqualToString:", NSUserActivityTypeBrowsingWeb);

  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webpageURL"));
    v12 = objc_opt_new(NSMutableDictionary);
    v13 = v12;
    if (v11)
    {
      v14 = VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary absoluteString](v11, "absoluteString"));
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate continueUserActivity -- process url %@", buf, 0xCu);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_sourceApplication"));
      if (v17)
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v17, UIApplicationOpenURLOptionsSourceApplicationKey);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referrerURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));

      if (v19)
      {
        v25 = LSReferrerURLKey;
        v26 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v20, UIApplicationOpenURLOptionsAnnotationKey);

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
      if (-[NSMutableDictionary count](v13, "count"))
      {
        v22 = -[NSMutableDictionary copy](v13, "copy");
        v23 = objc_msgSend(v21, "openURL:options:", v11, v22);

      }
      else
      {
        v23 = objc_msgSend(v21, "openURL:options:", v11, 0);
      }

    }
    else
    {
      v23 = 0;
      v11 = v12;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(void);
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(void);
  int v34;
  void *v35;
  __int16 v36;
  id v37;

  v8 = a4;
  v9 = a5;
  v10 = NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 138412546;
    v35 = v11;
    v36 = 2112;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received %@ for background URL session %@", (uint8_t *)&v34, 0x16u);
  }

  if (objc_msgSend(v8, "isEqualToString:", VUIARQLDownloadSessionConfigurationIdentifier))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForARQLBackgroundURLSessionCompletionHandler](self, "handleEventsForARQLBackgroundURLSessionCompletionHandler"));

    if (v14)
    {
      v15 = VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10000DCD0((uint64_t)v11, v16, v17, v18, v19, v20, v21, v22);

      v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForARQLBackgroundURLSessionCompletionHandler](self, "handleEventsForARQLBackgroundURLSessionCompletionHandler"));
      v23[2]();

      -[AppleTVAppDelegate setHandleEventsForARQLBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForARQLBackgroundURLSessionCompletionHandler:", 0);
    }
    -[AppleTVAppDelegate setHandleEventsForARQLBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForARQLBackgroundURLSessionCompletionHandler:", v9);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForBackgroundURLSessionCompletionHandler](self, "handleEventsForBackgroundURLSessionCompletionHandler"));

    if (v24)
    {
      v25 = VUIDefaultLogObject();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10000DD38((uint64_t)v11, v26, v27, v28, v29, v30, v31, v32);

      v33 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForBackgroundURLSessionCompletionHandler](self, "handleEventsForBackgroundURLSessionCompletionHandler"));
      v33[2]();

      -[AppleTVAppDelegate setHandleEventsForBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForBackgroundURLSessionCompletionHandler:", 0);
    }
    -[AppleTVAppDelegate setHandleEventsForBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForBackgroundURLSessionCompletionHandler:", v9);
    -[AppleTVAppDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish", 0, 10.0);
  }

}

- (void)_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish
{
  uint64_t v3;
  NSObject *v4;

  v3 = VUIDefaultLogObject(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10000DDA0(v4);

  -[AppleTVAppDelegate _downloadSessionDidFinishEventsForBackgroundURLSession:](self, "_downloadSessionDidFinishEventsForBackgroundURLSession:", 0);
}

- (void)_downloadSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void (**v14)(void);
  int v15;
  void *v16;

  v4 = a3;
  v6 = VUIDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v15 = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v15, 0xCu);

  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForBackgroundURLSessionCompletionHandler](self, "handleEventsForBackgroundURLSessionCompletionHandler"));

  if (v9)
  {
    v12 = VUIDefaultLogObject(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling completion handler for application:handleEventsForBackgroundURLSession:completionHandler:", (uint8_t *)&v15, 2u);
    }

    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForBackgroundURLSessionCompletionHandler](self, "handleEventsForBackgroundURLSessionCompletionHandler"));
    v14[2]();

    -[AppleTVAppDelegate setHandleEventsForBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForBackgroundURLSessionCompletionHandler:", 0);
  }

}

- (void)_downloadSessionDidFinishEventsForARBackgroundURLSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void (**v14)(void);
  int v15;
  void *v16;

  v4 = a3;
  v6 = VUIDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v15 = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v15, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForARQLBackgroundURLSessionCompletionHandler](self, "handleEventsForARQLBackgroundURLSessionCompletionHandler"));

  if (v9)
  {
    v12 = VUIDefaultLogObject(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling AR completion handler for application:handleEventsForBackgroundURLSession:completionHandler:", (uint8_t *)&v15, 2u);
    }

    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AppleTVAppDelegate handleEventsForARQLBackgroundURLSessionCompletionHandler](self, "handleEventsForARQLBackgroundURLSessionCompletionHandler"));
    v14[2]();

    -[AppleTVAppDelegate setHandleEventsForARQLBackgroundURLSessionCompletionHandler:](self, "setHandleEventsForARQLBackgroundURLSessionCompletionHandler:", 0);
  }

}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (id)handleEventsForBackgroundURLSessionCompletionHandler
{
  return self->_handleEventsForBackgroundURLSessionCompletionHandler;
}

- (void)setHandleEventsForBackgroundURLSessionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)handleEventsForARQLBackgroundURLSessionCompletionHandler
{
  return self->_handleEventsForARQLBackgroundURLSessionCompletionHandler;
}

- (void)setHandleEventsForARQLBackgroundURLSessionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleEventsForARQLBackgroundURLSessionCompletionHandler, 0);
  objc_storeStrong(&self->_handleEventsForBackgroundURLSessionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ATAPPTController sharedInstance](ATAPPTController, "sharedInstance"));
  v9 = objc_msgSend(v8, "canHandleTest:", v7);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ATAPPTController sharedInstance](ATAPPTController, "sharedInstance"));
    objc_msgSend(v10, "runTest:app:", v7, v6);

  }
  return v9;
}

@end
