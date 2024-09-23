@implementation VUITVApplicationController

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v6;
  VUIAppContext *v7;
  NSObject *v8;
  VUIAppContext *appContext;
  void *v10;
  NSDictionary *launchOpenURLOptions;
  NSDictionary *openURLReloadOptions;
  uint8_t v13[16];

  v6 = a4;
  v7 = (VUIAppContext *)a3;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context didStartWithOptions", v13, 2u);
  }

  appContext = self->_appContext;
  if (appContext == v7 && !self->_reloadInProgress)
  {
    -[VUITVApplicationController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "appController:didFinishLaunchingWithOptions:", self, v6);

  }
  if (self->_doLaunchOpenURLHandling)
  {
    if (-[NSDictionary count](self->_launchOpenURLOptions, "count"))
      -[VUIAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:", self->_launchOpenURLOptions);
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = 0;

    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_reloadInProgress)
  {
    *(_WORD *)&self->_reloadInProgress = 0;
    if (self->_openURLReloadOptions)
    {
      -[VUIAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:");
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = 0;

    }
  }

}

- (VUITVApplicationControllerDelegate)delegate
{
  return (VUITVApplicationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUITVApplicationController - evaluateAppJavaScriptInContext", v8, 2u);
  }

  -[VUITVApplicationController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "appController:evaluateAppJavaScriptInContext:", self, v5);

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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = *MEMORY[0x1E0DC47D0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("openURL"));

      v10 = *MEMORY[0x1E0DC47C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47C8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sourceAppIdentifier"));

    }
    else
    {
      v10 = *MEMORY[0x1E0DC47C8];
    }
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
    objc_msgSend(v4, "removeObjectForKey:", v6);
    objc_msgSend(v4, "removeObjectForKey:", v10);

  }
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (VUITVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  VUITVApplicationController *v12;
  void *v13;
  uint64_t v14;
  VUITVApplicationControllerContext *context;
  uint64_t v16;
  VUITVAppRootViewController *appRootViewController;
  UIWindow *window;
  _VUICoreApplication *v19;
  _VUICoreApplication *application;
  _VUICoreApplication *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VUITVApplicationController;
  v11 = -[VUITVApplicationController init](&v28, sel_init);
  v12 = (VUITVApplicationController *)v11;
  if (v11)
  {
    *(_WORD *)(v11 + 41) = 0;
    v13 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = 0;

    objc_storeStrong((id *)&v12->_window, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v14 = objc_msgSend(v8, "copy");
    context = v12->_context;
    v12->_context = (VUITVApplicationControllerContext *)v14;

    -[VUITVApplicationController _rootViewController](v12, "_rootViewController");
    v16 = objc_claimAutoreleasedReturnValue();
    appRootViewController = v12->_appRootViewController;
    v12->_appRootViewController = (VUITVAppRootViewController *)v16;

    window = v12->_window;
    if (window)
    {
      -[UIWindow vui_setRootViewController:](window, "vui_setRootViewController:", v12->_appRootViewController);
      -[UIWindow vui_makeKeyAndVisible](v12->_window, "vui_makeKeyAndVisible");
    }
    v19 = -[_VUICoreApplication initWithLaunchContext:]([_VUICoreApplication alloc], "initWithLaunchContext:", v12->_context);
    application = v12->_application;
    v12->_application = v19;

    v21 = v12->_application;
    v22 = (void *)objc_opt_class();
    -[VUITVApplicationControllerContext launchOptions](v12->_context, "launchOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_jsLaunchOptionsWithApplicationOptions:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_VUICoreApplication setJavaScriptLaunchOptions:](v21, "setJavaScriptLaunchOptions:", v24);

    -[_VUICoreApplication setKeyWindow:](v12->_application, "setKeyWindow:", v9);
    -[VUITVApplicationControllerContext launchOptions](v12->_context, "launchOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47D0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      v12->_doLaunchOpenURLHandling = 1;
    -[VUITVApplicationController _launchApp](v12, "_launchApp");
    -[VUITVApplicationController registerForApplicationNotifications](v12, "registerForApplicationNotifications");
  }

  return v12;
}

- (void)registerForApplicationNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActiveNotification_, *MEMORY[0x1E0DC6AB0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC6AB8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillResignActiveNotification_, *MEMORY[0x1E0DC6AC8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationWillTerminateNotification_, *MEMORY[0x1E0DC6AD0], 0);

  self->_interfaceOrientation = objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarOrientation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__statusBarOrientationDidChange_, *MEMORY[0x1E0DC4760], 0);

}

- (void)appContext:(id)a3 scriptForURL:(id)a4 cachePolicy:(unint64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a6;
  v9 = a4;
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUITVApplicationController - fetchAppJavascript", v12, 2u);
  }

  +[VUIAppScriptDownloadManager sharedInstance](VUIAppScriptDownloadManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAppJavascript:cachePolicy:completionHandler:", v9, a5, v8);

}

- (id)_rootViewController
{
  void *v3;
  _VUITVAppNavigationController *v4;

  -[VUITVApplicationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "rootViewControllerForAppController:", self),
        (v4 = (_VUITVAppNavigationController *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = objc_alloc_init(_VUITVAppNavigationController);
  }

  return v4;
}

- (void)_launchApp
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  VUIAppContext *v6;
  VUIAppContext *appContext;
  uint8_t v8[16];

  if (!self->_appContext)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVApplicationController - _launchApp", v8, 2u);
    }

    -[VUITVApplicationControllerContext javaScriptApplicationURL](self->_context, "javaScriptApplicationURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFileURL");

    v6 = -[VUIAppContext initWithApplication:mode:delegate:]([VUIAppContext alloc], "initWithApplication:mode:delegate:", self->_application, v5, self);
    appContext = self->_appContext;
    self->_appContext = v6;

    -[VUIAppContext start](self->_appContext, "start");
  }
}

+ (void)initialize
{
  NSObject *v2;
  uint8_t v3[16];

  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUITVApplicationController - init", v3, 2u);
  }

}

- (void)applicationDidResume:(id)a3
{
  _BOOL4 suspended;
  NSDictionary *openURLResumeOptions;
  NSDictionary *v6;
  NSDictionary *openURLReloadOptions;
  void *v8;
  NSDictionary *v9;

  suspended = self->_suspended;
  self->_suspended = 0;
  if (suspended)
  {
    v9 = self->_openURLResumeOptions;
    openURLResumeOptions = self->_openURLResumeOptions;
    self->_openURLResumeOptions = 0;

    if (-[VUITVApplicationController _shouldReloadOnResume](self, "_shouldReloadOnResume"))
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = v6;

      -[VUITVApplicationController appContext:needsReloadWithUrgency:options:](self, "appContext:needsReloadWithUrgency:options:", self->_appContext, 0, 0);
    }
    else
    {
      -[VUIAppContext resumeWithOptions:](self->_appContext, "resumeWithOptions:", v9);
      -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("openURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[VUIAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:", v9);
    }

  }
}

- (id)_currentNavigationController
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VUITVAppRootViewController currentNavigationController](self->_appRootViewController, "currentNavigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
  }
  return v3;
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  -[VUITVApplicationController applicationDidResume:](self, "applicationDidResume:", 0);
}

- (VUITVApplicationController)init
{
  -[VUITVApplicationController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUITVApplicationController stop](self, "stop");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUITVApplicationController;
  -[VUITVApplicationController dealloc](&v4, sel_dealloc);
}

- (void)stop
{
  VUIAppContext *appContext;

  -[VUIAppContext stop](self->_appContext, "stop");
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  VUIAppContext *appContext;
  id v27;
  NSDictionary *v28;
  NSDictionary *launchOpenURLOptions;
  VUIAppContext *v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_26;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("openURL"));

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DC4810];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4810]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
    goto LABEL_5;

  if (v13)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("sourceAppIdentifier"));

  }
  if (-[VUIAppContext isValid](self->_appContext, "isValid"))
  {
    if (!self->_doLaunchOpenURLHandling)
    {
      -[VUITVApplicationController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && (objc_opt_respondsToSelector() & 1) != 0
        && !objc_msgSend(v14, "appController:shouldDisplayShroudForURL:withOptions:", self, v6, v7))
      {
        +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setTimeout:", 20.0);

        +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setLoadingDelay:", 2.0);

        +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "showOverKeyWindowWithSpinnerOnly:", 0);
      }
      else
      {
        +[VUIStorePlaybackLaunchShroud sharedShroud](VUIStorePlaybackLaunchShroud, "sharedShroud");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHidden:animated:withCompletionHandler:", 0, 1, 0);
      }

      -[VUITVApplicationController _currentNavigationController](self, "_currentNavigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentedViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);
      -[VUITVApplicationController rootViewController](self, "rootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "presentedViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = (id)objc_msgSend(v19, "popToRootViewControllerAnimated:", 0);
        -[VUITVApplicationController rootViewController](self, "rootViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dismissViewControllerAnimated:completion:", 0, 0);

      }
      v22 = (id)objc_msgSend(v16, "popToRootViewControllerAnimated:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObserver:name:object:", self, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", self, sel__openURLControllerDidDisplay_, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);

    }
    if (self->_suspended)
    {
      v25 = (void *)objc_msgSend(v8, "copy");
      objc_storeStrong((id *)&self->_openURLResumeOptions, v25);
      appContext = self->_appContext;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __46__VUITVApplicationController_openURL_options___block_invoke;
      v35[3] = &unk_1E9F9B278;
      v36 = v25;
      v27 = v25;
      -[VUIAppContext evaluate:](appContext, "evaluate:", v35);

    }
    else
    {
      v30 = self->_appContext;
      v31 = (void *)objc_msgSend(v8, "copy");
      -[VUIAppContext openURLWithOptions:](v30, "openURLWithOptions:", v31);

    }
    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_doLaunchOpenURLHandling)
  {
    v28 = (NSDictionary *)objc_msgSend(v8, "copy");
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = v28;

  }
LABEL_26:

  return v6 != 0;
}

void __46__VUITVApplicationController_openURL_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", NSClassFromString(CFSTR("VUIJSApplication")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onPreloadOpenURL"), v5);

}

- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  VUIAppContext *appContext;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  appContext = self->_appContext;
  if (appContext)
  {
    -[VUIAppContext evaluate:completionBlock:completionQueue:](appContext, "evaluate:completionBlock:completionQueue:", v8, v6, 0);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  id v5;

  if (self->_popViewControllerOnBackground)
  {
    -[VUITVAppRootViewController vuiNavigationController](self->_appRootViewController, "vuiNavigationController", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

    self->_popViewControllerOnBackground = 0;
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  -[VUITVApplicationController applicationWillSuspend:](self, "applicationWillSuspend:", 0);
}

- (void)_applicationWillTerminateNotification:(id)a3
{
  -[VUIAppContext stop](self->_appContext, "stop", a3);
}

- (void)_statusBarOrientationDidChange:(id)a3
{
  int64_t v4;

  v4 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarOrientation", a3);
  if (v4 != self->_interfaceOrientation)
    self->_interfaceOrientation = v4;
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  VUIAppContext *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (VUIAppContext *)a3;
  v7 = a4;
  if (self->_appContext == v6)
  {
    self->_appContext = 0;

    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context Failed with Error: %@", (uint8_t *)&v11, 0xCu);
    }

    -[VUITVApplicationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appController:didFailWithError:", self, v10);

    }
  }

}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  VUIAppContext *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = (VUIAppContext *)a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context didStopWithOptions", v10, 2u);
  }

  if (!self->_reloadInProgress)
  {
    -[VUITVApplicationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "appController:didStopWithOptions:", self, v7);
    if (self->_appContext == v6)
    {
      self->_appContext = 0;

    }
  }

}

- (void)reload
{
  self->_reloadOnResume = 1;
  -[VUITVApplicationController appContext:needsReloadWithUrgency:options:](self, "appContext:needsReloadWithUrgency:options:", self->_appContext, 0, 0);
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDate *reloadOnResumeBackgroundedDate;
  uint64_t v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD aBlock[4];
  id v30;
  id v31;
  id location;

  v8 = a3;
  v9 = a5;
  if (!+[VUIUtilities isInFullscreenOrPipPlayback](VUIUtilities, "isInFullscreenOrPipPlayback"))
  {
    if (a4 == 1)
    {
      self->_reloadOnResume = 1;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VUIAppReloadUrgencyMinSuspensionTime"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      self->_reloadOnResumeMinInterval = v11;

      if (self->_reloadOnResumeMinInterval > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatForKey:", CFSTR("override-minSuspensionTime"));
        v14 = v13;

        if (v14 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "floatForKey:", CFSTR("override-minSuspensionTime"));
          self->_reloadOnResumeMinInterval = v16;

        }
      }
    }
    else
    {
      if (self->_reloadOnResume)
      {
        if (!self->_reloadOnResumeBackgroundedDate || self->_reloadOnResumeMinInterval <= 0.0)
          goto LABEL_11;
        if (!-[VUITVApplicationController _hasReloadOnResumeMinIntervalPassed](self, "_hasReloadOnResumeMinIntervalPassed"))goto LABEL_20;
        if (self->_reloadOnResume)
        {
LABEL_11:
          +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setTimeout:", 60.0);

          +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "showOverKeyWindowWithSpinnerOnly:", 0);

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObserver:name:object:", self, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObserver:selector:name:object:", self, sel__reloadControllerDidDisplay_, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);

        }
      }
      self->_reloadOnResume = 0;
      reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
      self->_reloadOnResumeMinInterval = 0.0;
      self->_reloadOnResumeBackgroundedDate = 0;

      if (!self->_reloadInProgress)
      {
        objc_initWeak(&location, self);
        v22 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke;
        aBlock[3] = &unk_1E9F9A938;
        objc_copyWeak(&v31, &location);
        v30 = v8;
        v23 = (void (**)(_QWORD))_Block_copy(aBlock);
        -[VUITVApplicationController _currentNavigationController](self, "_currentNavigationController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;
        if (v26)
        {
          v27[0] = v22;
          v27[1] = 3221225472;
          v27[2] = __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_61;
          v27[3] = &unk_1E9F98E68;
          v28 = v23;
          objc_msgSend(v26, "dismissAllModals:", v27);

        }
        else
        {
          v23[2](v23);
        }

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_20:

}

void __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_rootViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v3 + 11);
    *((_QWORD *)v3 + 11) = v4;

    objc_msgSend(*((id *)v3 + 13), "vui_setRootViewController:", *((_QWORD *)v3 + 11));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 2), "javaScriptLaunchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(*((id *)v3 + 2), "javaScriptLaunchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v9);

      objc_msgSend(v6, "removeObjectForKey:", CFSTR("openURL"));
    }
    if (objc_msgSend(*((id *)v3 + 4), "count"))
    {
      objc_msgSend(*((id *)v3 + 4), "objectForKey:", CFSTR("openURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("openURL"));

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("reload"), CFSTR("launchContext"));
    objc_msgSend(*((id *)v3 + 2), "setJavaScriptLaunchOptions:", v6);
    *((_BYTE *)v3 + 41) = 1;
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUITVApplicationController - reload js application", v12, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "reload");
  }

}

uint64_t __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)rootViewController
{
  return self->_appRootViewController;
}

- (id)appRootViewController
{
  return self->_appRootViewController;
}

- (void)applicationWillSuspend:(id)a3
{
  NSDate *v4;
  NSDate *reloadOnResumeBackgroundedDate;
  VUIAppContext *appContext;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  self->_reloadOnResumeBackgroundedDate = v4;

  appContext = self->_appContext;
  if (appContext)
  {
    -[VUIAppContext suspendWithOptions:](appContext, "suspendWithOptions:", 0);
    self->_suspended = 1;
  }
}

- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3
{
  -[VUITVApplicationController _openURLControllerHandler:](self, "_openURLControllerHandler:", 0);
}

- (void)_openURLControllerDidDisplay:(id)a3
{
  -[VUITVApplicationController _openURLControllerHandler:](self, "_openURLControllerHandler:", 1);
}

- (void)_openURLControllerHandler:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  -[VUITVApplicationController _currentNavigationController](self, "_currentNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    if (!v3)
      return;
    +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hide");
  }
  else
  {
    if (v3)
    {
      +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hide");

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);
  }

}

- (void)_reloadControllerDidDisplay:(id)a3
{
  void *v4;
  id v5;

  +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hide");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), 0);

}

- (BOOL)_shouldReloadOnResume
{
  if (self->_reloadOnResume && self->_reloadOnResumeBackgroundedDate && self->_reloadOnResumeMinInterval > 0.0)
    return -[VUITVApplicationController _hasReloadOnResumeMinIntervalPassed](self, "_hasReloadOnResumeMinIntervalPassed");
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

  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 128, reloadOnResumeBackgroundedDate, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = self->_reloadOnResumeMinInterval <= (double)objc_msgSend(v7, "second");
  return (char)self;
}

- (void)setKeyTraitEnvironment:(id)a3
{
  UITraitEnvironment **p_keyTraitEnvironment;
  id v5;

  p_keyTraitEnvironment = &self->_keyTraitEnvironment;
  v5 = a3;
  objc_storeWeak((id *)p_keyTraitEnvironment, v5);
  -[_VUICoreApplication setKeyTraitEnvironment:](self->_application, "setKeyTraitEnvironment:", v5);

}

- (UIWindow)window
{
  return self->_window;
}

- (VUITVApplicationControllerContext)context
{
  return self->_context;
}

- (UITraitEnvironment)keyTraitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_appRootViewController, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_reloadOnResumeBackgroundedDate, 0);
  objc_storeStrong((id *)&self->_openURLReloadOptions, 0);
  objc_storeStrong((id *)&self->_openURLResumeOptions, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end
