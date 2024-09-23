@implementation TVApplicationController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _TVSetupLoggingObjects();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

+ (id)_jsLaunchOptionsWithApplicationOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = *MEMORY[0x24BDF7558];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7558]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("openURL"));

      v10 = *MEMORY[0x24BDF7550];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7550]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sourceAppIdentifier"));

    }
    else
    {
      v10 = *MEMORY[0x24BDF7550];
    }
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
    objc_msgSend(v4, "removeObjectForKey:", v6);
    objc_msgSend(v4, "removeObjectForKey:", v10);
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x24BDF7540]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceAppIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.PineBoard")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.HeadBoard")) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.SpringBoard")))
    {
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("sourceAppIdentifier"));
    }

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (TVApplicationController)init
{
  -[TVApplicationController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  TVApplicationController *v12;
  void *v13;
  uint64_t v14;
  TVApplicationControllerContext *context;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const void *v23;
  const void *v24;
  CFTypeID v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  TVAppRootViewController *appRootViewController;
  UIWindow *window;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  id v37;
  void *v38;
  uint64_t v39;
  IKAppDataStorage *appLocalStorage;
  _TVMLKitApplication *v41;
  _TVMLKitApplication *application;
  _TVMLKitApplication *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _TVApplicationInspector *v63;
  _TVApplicationInspector *applicationInspector;
  void *v66;
  objc_super v67;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v67.receiver = self;
  v67.super_class = (Class)TVApplicationController;
  v11 = -[TVApplicationController init](&v67, sel_init);
  v12 = (TVApplicationController *)v11;
  if (v11)
  {
    *(_WORD *)(v11 + 65) = 0;
    v13 = (void *)*((_QWORD *)v11 + 6);
    *((_QWORD *)v11 + 6) = 0;

    objc_storeStrong((id *)&v12->_window, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v14 = objc_msgSend(v8, "copy");
    context = v12->_context;
    v12->_context = (TVApplicationControllerContext *)v14;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = 1;
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v22, "hasPrivateEntitlement");

    if ((_DWORD)v20)
    {
      v23 = (const void *)MGCopyAnswer();
      if (v23)
      {
        v24 = v23;
        v25 = CFGetTypeID(v23);
        if (v25 == CFStringGetTypeID())
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringForKey:", CFSTR("TVMLKitImageCacheKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v26, "length")
            || objc_msgSend(v28, "length") && (objc_msgSend(v28, "isEqualToString:", v26) & 1) != 0)
          {
            v18 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", v26, CFSTR("TVMLKitImageCacheKey"));

            v18 = 1;
          }

        }
        else
        {
          v18 = 0;
        }
        CFRelease(v24);
      }
      else
      {
        v18 = 0;
      }
    }
    +[TVAssetLibrary initializeAssetLibraryWithCachePath:purgeCacheOnLoad:](TVAssetLibrary, "initializeAssetLibraryWithCachePath:purgeCacheOnLoad:", v21, v18);
    -[TVApplicationController _rootViewController](v12, "_rootViewController");
    v30 = objc_claimAutoreleasedReturnValue();
    appRootViewController = v12->_appRootViewController;
    v12->_appRootViewController = (TVAppRootViewController *)v30;

    window = v12->_window;
    if (window)
    {
      -[UIWindow setRootViewController:](window, "setRootViewController:", v12->_appRootViewController);
      -[UIWindow makeKeyAndVisible](v12->_window, "makeKeyAndVisible");
    }
    -[TVApplicationControllerContext storageIdentifier](v12->_context, "storageIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      -[TVApplicationControllerContext storageIdentifier](v12->_context, "storageIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByAppendingString:", CFSTR(".localStorage.plist"));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = CFSTR("localStorage.plist");
    }
    v37 = objc_alloc(MEMORY[0x24BE51930]);
    objc_msgSend(v21, "stringByAppendingPathComponent:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v17;
    v39 = objc_msgSend(v37, "initWithFilePath:identifier:", v38, v17);
    appLocalStorage = v12->_appLocalStorage;
    v12->_appLocalStorage = (IKAppDataStorage *)v39;

    v41 = -[_TVMLKitApplication initWithLaunchContext:]([_TVMLKitApplication alloc], "initWithLaunchContext:", v12->_context);
    application = v12->_application;
    v12->_application = v41;

    -[_TVMLKitApplication setLocalDataStorage:](v12->_application, "setLocalDataStorage:", v12->_appLocalStorage);
    -[_TVMLKitApplication setAppRootViewController:](v12->_application, "setAppRootViewController:", v12->_appRootViewController);
    v43 = v12->_application;
    v44 = (void *)objc_opt_class();
    -[TVApplicationControllerContext launchOptions](v12->_context, "launchOptions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_jsLaunchOptionsWithApplicationOptions:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLKitApplication setJavaScriptLaunchOptions:](v43, "setJavaScriptLaunchOptions:", v46);

    v47 = v9;
    -[_TVMLKitApplication setKeyWindow:](v12->_application, "setKeyWindow:", v9);
    -[TVApplicationControllerContext launchOptions](v12->_context, "launchOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BDF7558]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
      v12->_doLaunchOpenURLHandling = 1;
    -[TVApplicationController _launchApp](v12, "_launchApp");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x24BDF7510];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObserver:selector:name:object:", v12, sel__applicationDidBecomeActiveNotification_, v51, v52);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObserver:selector:name:object:", v12, sel__applicationDidEnterBackgroundNotification_, v54, v55);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x24BDF75D8];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObserver:selector:name:object:", v12, sel__applicationWillResignActiveNotification_, v57, v58);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *MEMORY[0x24BDF75E0];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObserver:selector:name:object:", v12, sel__applicationWillTerminateNotification_, v60, v61);

    v12->_interfaceOrientation = objc_msgSend((id)*MEMORY[0x24BDF74F8], "statusBarOrientation");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addObserver:selector:name:object:", v12, sel__statusBarOrientationDidChange_, *MEMORY[0x24BDF7520], 0);

    v63 = -[_TVApplicationInspector initWithApplicationController:]([_TVApplicationInspector alloc], "initWithApplicationController:", v12);
    applicationInspector = v12->_applicationInspector;
    v12->_applicationInspector = v63;

    v9 = v47;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TVApplicationController stop](self, "stop");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVApplicationController;
  -[TVApplicationController dealloc](&v4, sel_dealloc);
}

- (void)stop
{
  IKAppContext *appContext;

  -[IKAppContext stop](self->_appContext, "stop");
  appContext = self->_appContext;
  self->_appContext = 0;

}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *launchOpenURLOptions;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  IKAppContext *appContext;
  id v37;
  uint8_t v39[8];
  _QWORD v40[4];
  id v41;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("openURL"));

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF7550]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x24BDF7578];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF7578]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v10)
    {

      if (!v13)
        goto LABEL_6;
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("sourceAppIdentifier"));

LABEL_6:
    if (!-[IKAppContext isValid](self->_appContext, "isValid"))
    {
      if (self->_doLaunchOpenURLHandling)
      {
        v22 = (NSDictionary *)objc_msgSend(v8, "copy");
        launchOpenURLOptions = self->_launchOpenURLOptions;
        self->_launchOpenURLOptions = v22;

      }
      else if (objc_msgSend(v8, "count"))
      {
        -[TVApplicationController activeDocument](self, "activeDocument");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v25 = TVMLKitLogObject;
          if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v39 = 0;
            _os_log_impl(&dword_222D98000, v25, OS_LOG_TYPE_INFO, "App Controller deferring handling of open URL to post launch", v39, 2u);
          }
          -[TVApplicationController _openURLIfPossibleWithOptions:](self, "_openURLIfPossibleWithOptions:", v8);
        }
      }
      goto LABEL_30;
    }
    if (self->_doLaunchOpenURLHandling)
    {
LABEL_26:
      if (self->_suspended)
      {
        v35 = (void *)objc_msgSend(v8, "copy");
        objc_storeStrong((id *)&self->_openURLResumeOptions, v35);
        appContext = self->_appContext;
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __43__TVApplicationController_openURL_options___block_invoke;
        v40[3] = &unk_24EB85370;
        v41 = v35;
        v37 = v35;
        -[IKAppContext evaluate:completionBlock:](appContext, "evaluate:completionBlock:", v40, 0);

      }
      else
      {
        -[TVApplicationController _openURLIfPossibleWithOptions:](self, "_openURLIfPossibleWithOptions:", v8);
      }
      self->_doLaunchOpenURLHandling = 0;
LABEL_30:

      goto LABEL_31;
    }
    -[TVApplicationController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "conformsToProtocol:", &unk_2557DFCE8) & 1) != 0)
    {
      -[TVApplicationController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[TVApplicationController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "appController:shouldDisplayShroudForURL:withOptions:", self, v6, v7);

        if (!v18)
        {
          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setTimeout:", 20.0);

          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setLoadingDelay:", 2.0);

          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "showOverKeyWindowWithSpinnerOnly:", 0);
LABEL_21:

          -[TVApplicationController _currentNavigationController](self, "_currentNavigationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dismissModal");

          -[TVApplicationController rootViewController](self, "rootViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "presentedViewController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = (id)objc_msgSend(v28, "popToRootViewControllerAnimated:", 0);
            -[TVApplicationController rootViewController](self, "rootViewController");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "dismissViewControllerAnimated:completion:", 0, 0);

          }
          -[TVApplicationController _currentNavigationController](self, "_currentNavigationController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (id)objc_msgSend(v31, "popToRootViewControllerAnimated:", 0);

          -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications");
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__openURLControllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObserver:selector:name:object:", self, sel__openURLControllerDidUpdate_, CFSTR("_TVAppDocumentDidUpdateNotification"), 0);

          goto LABEL_26;
        }
      }
    }
    else
    {

    }
    +[TVStorePlaybackLaunchShroud sharedShroud](TVStorePlaybackLaunchShroud, "sharedShroud");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:animated:withCompletionHandler:", 0, 1, 0);
    goto LABEL_21;
  }
LABEL_31:

  return v6 != 0;
}

void __43__TVApplicationController_openURL_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", NSClassFromString(CFSTR("IKJSApplication")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onPreloadOpenURL"), v5);

}

- (void)_openURLIfPossibleWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  IKAppContext *appContext;
  NSDictionary *openURLPresentedOptions;
  NSObject *v9;
  void *v10;
  NSDictionary *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  -[TVApplicationController activeDocument](self, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (objc_msgSend(v4, "count"))
  {
    v9 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222D98000, v9, OS_LOG_TYPE_INFO, "App Controller deferring handling open URL to post presented", buf, 2u);
    }
    -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__rootControllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

    v11 = (NSDictionary *)objc_msgSend(v4, "copy");
    openURLPresentedOptions = self->_openURLPresentedOptions;
    self->_openURLPresentedOptions = v11;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "count"))
  {
    v6 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_222D98000, v6, OS_LOG_TYPE_INFO, "App Controller handling open URL", v12, 2u);
    }
    appContext = self->_appContext;
    openURLPresentedOptions = (NSDictionary *)objc_msgSend(v4, "copy");
    -[IKAppContext openURLWithOptions:](appContext, "openURLWithOptions:", openURLPresentedOptions);
LABEL_11:

  }
}

- (BOOL)jsOpenURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  IKAppContext *appContext;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("openURL"));
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF7550]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("sourceAppIdentifier"));
  v11 = -[IKAppContext isValid](self->_appContext, "isValid");
  if (v11)
  {
    appContext = self->_appContext;
    v13 = (void *)objc_msgSend(v8, "copy");
    -[IKAppContext openURLWithOptions:](appContext, "openURLWithOptions:", v13);

  }
  return v11;
}

- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  IKAppContext *appContext;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  appContext = self->_appContext;
  if (appContext)
  {
    -[IKAppContext evaluate:completionBlock:](appContext, "evaluate:completionBlock:", v8, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  -[TVApplicationController applicationDidResume:](self, "applicationDidResume:", 0);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_popViewControllerOnBackground)
  {
    -[TVApplicationController _currentNavigationController](self, "_currentNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 0);

    self->_popViewControllerOnBackground = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TVApplicationController _currentNavigationController](self, "_currentNavigationController", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "setMenuGestureHandler:", 0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  -[TVApplicationController applicationWillSuspend:](self, "applicationWillSuspend:", 0);
}

- (void)_applicationWillTerminateNotification:(id)a3
{
  -[IKAppContext stop](self->_appContext, "stop", a3);
}

- (void)_statusBarOrientationDidChange:(id)a3
{
  int64_t v4;
  id v5;

  v4 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "statusBarOrientation", a3);
  if (v4 != self->_interfaceOrientation)
  {
    self->_interfaceOrientation = v4;
    if (-[IKAppContext isValid](self->_appContext, "isValid"))
    {
      -[_TVMLKitApplication appTraitCollection](self->_application, "appTraitCollection");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[IKAppContext appTraitCollectionChanged:](self->_appContext, "appTraitCollectionChanged:", v5);

    }
  }
}

- (void)appContext:(id)a3 didChangeInspectElementMode:(BOOL)a4
{
  -[_TVApplicationInspector setInspectionModeEnabled:](self->_applicationInspector, "setInspectionModeEnabled:", a4);
}

- (BOOL)appContext:(id)a3 highlightViewForElement:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8
{
  _TVApplicationInspector *applicationInspector;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  applicationInspector = self->_applicationInspector;
  v17 = a4;
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a7;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVApplicationInspector highlightViewElements:contentColor:borderColor:](applicationInspector, "highlightViewElements:contentColor:borderColor:", v15, v13, v12, v17, v18);

  return 1;
}

- (BOOL)appContext:(id)a3 highlightViewsForElements:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8
{
  -[_TVApplicationInspector highlightViewElements:contentColor:borderColor:](self->_applicationInspector, "highlightViewElements:contentColor:borderColor:", a4, a5, a7, a6);
  return 1;
}

- (BOOL)cancelHighlightViewForAppContext:(id)a3
{
  -[_TVApplicationInspector cancelHighlight](self->_applicationInspector, "cancelHighlight", a3);
  return 1;
}

- (id)navigationControllerForContext:(id)a3
{
  if (self->_appContext != a3)
    return 0;
  -[TVAppRootViewController appNavigationController](self->_appRootViewController, "appNavigationController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tabBarForContext:(id)a3
{
  if (self->_appContext != a3)
    return 0;
  -[TVAppRootViewController appTabBar](self->_appRootViewController, "appTabBar");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)modalControllerForContext:(id)a3
{
  return 0;
}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  IKAppContext *v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  NSDictionary *launchOpenURLOptions;
  NSDictionary *openURLReloadOptions;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = (IKAppContext *)a3;
  v7 = a4;
  v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D98000, v8, OS_LOG_TYPE_INFO, "App Controller did launch", buf, 2u);
  }
  if (self->_appContext == v6 && !self->_reloadInProgress)
  {
    -[TVApplicationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVApplicationController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appController:didFinishLaunchingWithOptions:", self, v7);

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didFinishLaunchingWithOptions_);
    }
  }
  if (self->_doLaunchOpenURLHandling)
  {
    if (-[NSDictionary count](self->_launchOpenURLOptions, "count"))
    {
      -[IKAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:", self->_launchOpenURLOptions);
      v12 = TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_222D98000, v12, OS_LOG_TYPE_INFO, "App Controller did handle open URL on launch", v15, 2u);
      }
    }
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = 0;

    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_reloadInProgress)
  {
    *(_WORD *)&self->_reloadInProgress = 0;
    if (self->_openURLReloadOptions)
    {
      -[IKAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:");
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = 0;

    }
  }

}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  IKAppContext *v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = (IKAppContext *)a3;
  v7 = a4;
  if (self->_appContext == v6)
  {
    self->_appContext = 0;

    v8 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
      -[TVApplicationController appContext:didFailWithError:].cold.1((uint64_t)v7, v8);
    -[TVApplicationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[TVApplicationController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appController:didFailWithError:", self, v12);

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didFailWithError_);
    }
  }

}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  IKAppContext *v10;

  v10 = (IKAppContext *)a3;
  v6 = a4;
  if (!self->_reloadInProgress)
  {
    -[TVApplicationController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TVApplicationController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appController:didStopWithOptions:", self, v6);

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didStopWithOptions_);
    }
    if (self->_appContext == v10)
    {
      self->_appContext = 0;

    }
  }

}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrivateEntitlement");
  -[TVApplicationController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  v11 = v8 & objc_msgSend(v7, "hasiTunesAPIEntitlement");
  if ((v10 & 1) == 0)
  {
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE519B8]), "initWithAppContext:", v16);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("itms"));

    goto LABEL_7;
  }
  -[TVApplicationController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appController:evaluateAppJavaScriptInContext:", self, v6);

  _TVMLMetricsLogPublicAPIUsage(sel_appController_evaluateAppJavaScriptInContext_);
  if (v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itms"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "toBool");

    if ((v14 & 1) == 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (void)reload
{
  self->_reloadOnResume = 1;
  -[TVApplicationController appContext:needsReloadWithUrgency:options:](self, "appContext:needsReloadWithUrgency:options:", self->_appContext, 0, 0);
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSDate *reloadOnResumeBackgroundedDate;
  uint64_t v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1)
  {
    self->_reloadOnResume = 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE51808]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    self->_reloadOnResumeMinInterval = v12;

    if (self->_reloadOnResumeMinInterval > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatForKey:", CFSTR("override-minSuspensionTime"));
      v15 = v14;

      if (v15 > 0.0)
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatForKey:", CFSTR("override-minSuspensionTime"));
        self->_reloadOnResumeMinInterval = v17;

      }
    }
  }
  else
  {
    if (self->_reloadOnResume)
    {
      if (!self->_reloadOnResumeBackgroundedDate || self->_reloadOnResumeMinInterval == 0.0)
        goto LABEL_10;
      if (!-[TVApplicationController _hasReloadOnResumeMinIntervalPassed](self, "_hasReloadOnResumeMinIntervalPassed"))
        goto LABEL_20;
      if (self->_reloadOnResume)
      {
LABEL_10:
        +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "hasPrivateEntitlement");

        if (v19)
        {
          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTimeout:", 60.0);

          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "showOverKeyWindowWithSpinnerOnly:", 0);

          -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications");
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__reloadControllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

        }
      }
    }
    self->_reloadOnResume = 0;
    reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
    self->_reloadOnResumeMinInterval = 0.0;
    self->_reloadOnResumeBackgroundedDate = 0;

    if (!self->_reloadInProgress)
    {
      objc_initWeak(&location, self);
      v24 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke;
      v31[3] = &unk_24EB85398;
      objc_copyWeak(&v33, &location);
      v32 = v8;
      v25 = (void (**)(_QWORD))MEMORY[0x22767F470](v31);
      -[TVAppRootViewController currentNavigationController](self->_appRootViewController, "currentNavigationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;
      if (v28)
      {
        v29[0] = v24;
        v29[1] = 3221225472;
        v29[2] = __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_2;
        v29[3] = &unk_24EB85320;
        v30 = v25;
        objc_msgSend(v28, "dismissAllModals:", v29);

      }
      else
      {
        v25[2](v25);
      }

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
LABEL_20:

}

void __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_rootViewController");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = WeakRetained[14];
    WeakRetained[14] = (id)v2;

    objc_msgSend(WeakRetained[16], "setRootViewController:", WeakRetained[14]);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[2], "javaScriptLaunchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(WeakRetained[2], "javaScriptLaunchOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v7);

      objc_msgSend(v4, "removeObjectForKey:", CFSTR("openURL"));
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("sourceAppIdentifier"));
    }
    if (objc_msgSend(WeakRetained[6], "count"))
    {
      objc_msgSend(WeakRetained[6], "objectForKey:", CFSTR("openURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("openURL"));

    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("reload"), CFSTR("launchContext"));
    objc_msgSend(WeakRetained[2], "setJavaScriptLaunchOptions:", v4);
    *((_BYTE *)WeakRetained + 65) = 1;
    objc_msgSend(*(id *)(a1 + 32), "reload");

  }
}

uint64_t __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appContext:(id)a3 openDynamicUIURL:(id)a4 metricsOverlay:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TVAppRootViewController *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_appRootViewController;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v15 = (void *)getAMSUIDynamicViewControllerClass_softClass;
  v31 = getAMSUIDynamicViewControllerClass_softClass;
  if (!getAMSUIDynamicViewControllerClass_softClass)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __getAMSUIDynamicViewControllerClass_block_invoke;
    v27[3] = &unk_24EB853C0;
    v27[4] = &v28;
    __getAMSUIDynamicViewControllerClass_block_invoke((uint64_t)v27);
    v15 = (void *)v29[3];
  }
  v25 = v13;
  v26 = v10;
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(MEMORY[0x24BE51A18], "sharedCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(v16, "bagKeySet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profileVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerBagKeySet:forProfile:profileVersion:", v19, v20, v21);

  v22 = (void *)objc_msgSend(objc_alloc((Class)v16), "initWithBag:URL:", v17, v11);
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ams_activeiTunesAccount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccount:", v24);

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v22, "setMetricsOverlay:", v12);
  objc_msgSend(v22, "setDelegate:", self);
  -[TVApplicationController setDynamicUICompletion:](self, "setDynamicUICompletion:", v25);
  -[TVAppRootViewController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v22, 1, 0);

}

- (void)appContext:(id)a3 openMarketingItem:(id)a4 metricsOverlay:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TVAppRootViewController *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_appRootViewController;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v15 = (void *)getAMSUIMarketingItemViewControllerClass_softClass;
  v32 = getAMSUIMarketingItemViewControllerClass_softClass;
  if (!getAMSUIMarketingItemViewControllerClass_softClass)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __getAMSUIMarketingItemViewControllerClass_block_invoke;
    v28[3] = &unk_24EB853C0;
    v28[4] = &v29;
    __getAMSUIMarketingItemViewControllerClass_block_invoke((uint64_t)v28);
    v15 = (void *)v30[3];
  }
  v26 = v13;
  v27 = v10;
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(MEMORY[0x24BE51A18], "sharedCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(v16, "bagKeySet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profileVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerBagKeySet:forProfile:profileVersion:", v19, v20, v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE081F8]), "initWithDictionary:", v11);
  v23 = (void *)objc_msgSend(objc_alloc((Class)v16), "initWithMarketingItem:bag:", v22, v17);
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ams_activeiTunesAccount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccount:", v25);

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v23, "setMetricsOverlay:", v12);
  objc_msgSend(v23, "setDelegate:", self);
  -[TVApplicationController setDynamicUICompletion:](self, "setDynamicUICompletion:", v26);
  -[TVAppRootViewController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v23, 1, 0);

}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[TVApplicationController dynamicUICompletion](self, "dynamicUICompletion");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51940]), "initWithCarrierLinkResult:", v10);
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v9, v7);
    -[TVApplicationController setDynamicUICompletion:](self, "setDynamicUICompletion:", 0);

  }
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[TVApplicationController dynamicUICompletion](self, "dynamicUICompletion");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51940]), "initWithPurchaseResult:", v10);
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v9, v7);
    -[TVApplicationController setDynamicUICompletion:](self, "setDynamicUICompletion:", 0);

  }
}

- (unint64_t)preferredVideoFormat
{
  void *v2;
  unint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("PreferredPurchaseResolution"), CFSTR("com.apple.videos-preferences"));
  v3 = v2 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "integerValue") == 1;

  return v3;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)systemLanguage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)storeFrontCountryCode
{
  return 0;
}

- (id)timeZone
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)appNavigationController:(id)a3 shouldOverrideModalBehaviorForDocument:(id)a4 andExistingDocument:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v7 = a4;
  v8 = a5;
  -[TVApplicationController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_2557DFCE8))
  {
    -[TVApplicationController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[TVApplicationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "appController:shouldOverrideModalBehaviorForDocument:andExistingModalDocument:", self, v7, v8);
  }
  else
  {
    v12 = 0;
  }

LABEL_7:
  return v12;
}

- (BOOL)appNavigationController:(id)a3 shouldIgnoreDismissalForViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v5 = a4;
  -[TVApplicationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2557DFCE8))
  {
    -[TVApplicationController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[TVApplicationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "appController:shouldIgnoreDismissalForViewController:", self, v5);
  }
  else
  {
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (BOOL)appNavigationController:(id)a3 shouldDismissShroudForDocument:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v5 = a4;
  -[TVApplicationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2557DFCE8))
  {
    -[TVApplicationController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v9 = 1;
      goto LABEL_7;
    }
    -[TVApplicationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "appController:shouldDismissShroudForDocument:", self, v5);
  }
  else
  {
    v9 = 1;
  }

LABEL_7:
  return v9;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_appRootViewController;
}

- (void)setKeyTraitEnvironment:(id)a3
{
  UITraitEnvironment **p_keyTraitEnvironment;
  id v5;

  p_keyTraitEnvironment = &self->_keyTraitEnvironment;
  v5 = a3;
  objc_storeWeak((id *)p_keyTraitEnvironment, v5);
  -[_TVMLKitApplication setKeyTraitEnvironment:](self->_application, "setKeyTraitEnvironment:", v5);

}

- (UIView)viewServiceKeyView
{
  void *v3;
  void *v4;

  -[TVApplicationController keyTraitEnvironment](self, "keyTraitEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TVApplicationController keyTraitEnvironment](self, "keyTraitEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIView *)v4;
}

- (void)applicationDidResume:(id)a3
{
  _BOOL4 suspended;
  NSDictionary *v5;
  NSDictionary *openURLResumeOptions;
  NSDictionary *v7;
  NSDictionary *openURLReloadOptions;
  NSDictionary *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;

  suspended = self->_suspended;
  self->_suspended = 0;
  if (suspended)
  {
    v5 = self->_openURLResumeOptions;
    openURLResumeOptions = self->_openURLResumeOptions;
    self->_openURLResumeOptions = 0;

    if (-[TVApplicationController _shouldReloadOnResume](self, "_shouldReloadOnResume"))
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v5, "copy");
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = v7;

      -[TVApplicationController appContext:needsReloadWithUrgency:options:](self, "appContext:needsReloadWithUrgency:options:", self->_appContext, 0, 0);
      v9 = v5;
    }
    else
    {
      if (v5)
        v10 = -[NSDictionary mutableCopy](v5, "mutableCopy");
      else
        v10 = objc_opt_new();
      v11 = (void *)v10;
      -[_TVMLKitApplication appTraitCollection](self->_application, "appTraitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("appTraitCollection"));

      v14 = (NSDictionary *)objc_msgSend(v11, "copy");
      -[IKAppContext resumeWithOptions:](self->_appContext, "resumeWithOptions:", v14);
      -[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("openURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        -[IKAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:", v14);

      v9 = v14;
    }

  }
}

- (void)applicationWillSuspend:(id)a3
{
  NSDate *v4;
  NSDate *reloadOnResumeBackgroundedDate;
  IKAppContext *appContext;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  self->_reloadOnResumeBackgroundedDate = v4;

  appContext = self->_appContext;
  if (appContext)
  {
    -[IKAppContext suspendWithOptions:](appContext, "suspendWithOptions:", 0);
    self->_suspended = 1;
  }
}

- (id)activeDocument
{
  return -[_TVMLKitApplication activeDocument](self->_application, "activeDocument");
}

- (id)_appContext
{
  return self->_appContext;
}

- (UINavigationController)_currentNavigationController
{
  return (UINavigationController *)-[TVAppRootViewController currentNavigationController](self->_appRootViewController, "currentNavigationController");
}

- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3
{
  -[TVApplicationController _openURLControllerHandler:](self, "_openURLControllerHandler:", 0);
}

- (void)_openURLControllerDidDisplay:(id)a3
{
  -[TVApplicationController _openURLControllerHandler:](self, "_openURLControllerHandler:", 1);
}

- (void)_openURLControllerDidUpdate:(id)a3
{
  -[TVApplicationController _openURLControllerHandler:](self, "_openURLControllerHandler:", 1);
}

- (void)_rootControllerDidDisplay:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *openURLPresentedOptions;
  NSObject *v8;
  uint8_t v9[16];

  -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications", a3);
  if (-[NSDictionary count](self->_openURLPresentedOptions, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__openURLControllerDidDisplay_, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__openURLControllerDidUpdate_, CFSTR("_TVAppDocumentDidUpdateNotification"), 0);

    v6 = (void *)-[NSDictionary copy](self->_openURLPresentedOptions, "copy");
    openURLPresentedOptions = self->_openURLPresentedOptions;
    self->_openURLPresentedOptions = 0;

    -[IKAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:", v6);
    v8 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_222D98000, v8, OS_LOG_TYPE_INFO, "App Controller did handle open URL on presented", v9, 2u);
    }

  }
}

- (void)_openURLControllerHandler:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hide");

  }
  -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications");
}

- (void)_reloadControllerDidDisplay:(id)a3
{
  void *v4;

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hide");

  -[TVApplicationController _resetControllerNotifications](self, "_resetControllerNotifications");
}

- (void)_resetControllerNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_TVAppDocumentDidUpdateNotification"), 0);

}

- (void)_launchApp
{
  void *v3;
  uint64_t v4;
  IKAppContext *v5;
  IKAppContext *appContext;

  if (!self->_appContext)
  {
    -[TVApplicationControllerContext javaScriptApplicationURL](self->_context, "javaScriptApplicationURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFileURL");

    v5 = (IKAppContext *)objc_msgSend(objc_alloc(MEMORY[0x24BE51928]), "initWithApplication:mode:delegate:", self->_application, v4, self);
    appContext = self->_appContext;
    self->_appContext = v5;

    -[IKAppContext start](self->_appContext, "start");
  }
}

- (BOOL)_shouldReloadOnResume
{
  if (self->_reloadOnResume && self->_reloadOnResumeBackgroundedDate && self->_reloadOnResumeMinInterval != 0.0)
    return -[TVApplicationController _hasReloadOnResumeMinIntervalPassed](self, "_hasReloadOnResumeMinIntervalPassed");
  else
    return self->_reloadOnResume;
}

- (BOOL)_hasReloadOnResumeMinIntervalPassed
{
  id v3;
  void *v4;
  NSDate *reloadOnResumeBackgroundedDate;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDBCE48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 128, reloadOnResumeBackgroundedDate, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = self->_reloadOnResumeMinInterval <= (double)objc_msgSend(v7, "second");
  return (char)self;
}

- (id)_rootViewController
{
  void *v3;
  id v4;
  _TVAppNavigationController_iOS *v5;

  -[TVApplicationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_2557DFCE8))
    goto LABEL_6;
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    v5 = -[_TVAppNavigationController initWithApplicationController:]([_TVAppNavigationController_iOS alloc], "initWithApplicationController:", self);
    goto LABEL_7;
  }
  objc_msgSend(v4, "rootViewControllerForAppController:", self);
  v5 = (_TVAppNavigationController_iOS *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
LABEL_7:
  -[_TVAppNavigationController setAppNavigationControllersDelegate:](v5, "setAppNavigationControllersDelegate:", self);

  return v5;
}

- (UIWindow)window
{
  return self->_window;
}

- (TVApplicationControllerContext)context
{
  return self->_context;
}

- (TVApplicationControllerDelegate)delegate
{
  return (TVApplicationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)dynamicUICompletion
{
  return self->_dynamicUICompletion;
}

- (void)setDynamicUICompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (_TVApplicationInspector)applicationInspector
{
  return self->_applicationInspector;
}

- (UITraitEnvironment)keyTraitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_storeStrong((id *)&self->_applicationInspector, 0);
  objc_storeStrong(&self->_dynamicUICompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_appRootViewController, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_reloadOnResumeBackgroundedDate, 0);
  objc_storeStrong((id *)&self->_openURLPresentedOptions, 0);
  objc_storeStrong((id *)&self->_openURLReloadOptions, 0);
  objc_storeStrong((id *)&self->_openURLResumeOptions, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_appLocalStorage, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

- (void)appContext:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_222D98000, a2, OS_LOG_TYPE_ERROR, "App Context Failed with Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
