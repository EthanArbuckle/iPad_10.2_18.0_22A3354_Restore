@implementation VUITVAppLauncher

void __65__VUITVAppLauncher_appController_evaluateAppJavaScriptInContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_javascriptSetTabBarItems:", v3);

}

- (void)_javascriptSetTabBarItems:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("TabItems"));

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VUITVAppLauncher__javascriptSetTabBarItems___block_invoke;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v10, &location);
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", *(_QWORD *)(a1 + 32), CFSTR("BootURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("fullFeatureFlag"));

  VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.FetchFullFeatureFlag", ", v7, 2u);
  }

  objc_msgSend(WeakRetained, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Full Feature Flag Fetch Did Complete"), 0, v3);

}

void __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "jetPackController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 40), "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("BootURL"));

      objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", *(_QWORD *)(a1 + 48), CFSTR("Error"));
      objc_msgSend(v3, "stateMachine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Boot URL Fetch Did Complete"), 0, v6);

      objc_msgSend(v3, "setJetPackController:", 0);
      VUISignpostLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad", ", v11, 2u);
      }

      +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordAppLaunchEventWithEventType:", CFSTR("javascriptRuntimeEnd"));

    }
  }

}

- (_TtC8VideosUI20VUIJetPackController)jetPackController
{
  return self->_jetPackController;
}

- (void)preWarm:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.preWarm", ", (uint8_t *)&v23, 2u);
  }

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v23 = 138412290;
    v24 = (uint64_t)v3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - preWarm %@", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prewarm");

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "useSharedURLSession");
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v23 = 67109120;
    LODWORD(v24) = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Prewarm useSharedURLSession: %d", (uint8_t *)&v23, 8u);
  }

  objc_msgSend(MEMORY[0x1E0DC87C0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUseSharedURLSession:", v9);

  v12 = objc_msgSend(v8, "alwaysPrefetchAppConfiguration");
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v23 = 67109120;
    LODWORD(v24) = v12;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Prewarm alwaysPrefetchAppConfiguration: %d", (uint8_t *)&v23, 8u);
  }

  objc_msgSend(MEMORY[0x1E0DC87C0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysPrefetchAppConfiguration:", v12);

  if (objc_msgSend(v8, "useConfigCacheIgnoreExpiry"))
  {
    objc_msgSend(v8, "extendedCacheExpireDuration");
    v16 = v15;
    v17 = 5;
  }
  else
  {
    v17 = 0;
    v16 = 0.0;
  }
  VUIDefaultLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v23 = 134218240;
    v24 = v17;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Prewarm with config cache policy: %lu, extendedCacheExpireDuration: %f", (uint8_t *)&v23, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setExtendedCacheExpireDuration:", v16);

  objc_msgSend(MEMORY[0x1E0DC8820], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "prewarmWithConfigCachePolicy:", v17);

  +[VUINetworkLauncher shared](VUINetworkLauncher, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preWarmImageConnection");

  VUISignpostLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.preWarm", ", (uint8_t *)&v23, 2u);
  }

}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 appWasForegrounded;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD aBlock[5];

  -[VUITVAppLauncher _syncBookmarkServiceIfRequired](self, "_syncBookmarkServiceIfRequired", a3);
  +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkAndUpdateSettings");

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordAppBecameActive");

  appWasForegrounded = self->_appWasForegrounded;
  self->_appWasForegrounded = 1;
  +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isFeatureEnabled:", &__block_literal_global_182);

  if (appWasForegrounded)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke_2;
    aBlock[3] = &unk_1E9F9B4F8;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openURLHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "openedByDeeplink") & 1) == 0
      && !+[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen"))
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - App foreground -- Check if there is any pending offer to present", v15, 2u);
      }

      -[VUITVAppLauncher appController](self, "appController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIOfferUtilities fetchAndPresentOffer:sourceEvent:completion:](VUIOfferUtilities, "fetchAndPresentOffer:sourceEvent:completion:", v13, CFSTR("AppForeground"), v8);

    }
    objc_msgSend(MEMORY[0x1E0DC8858], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "refreshSubscriptionDataIfNeeded");

  }
}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("Options");
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("TVApplicationController Did Finish Launching"), 0, v7);

}

- (void)_startJavascriptSetup
{
  NSObject *v3;
  uint8_t v4[16];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher -  start JS setup", v4, 2u);
  }

  -[VUITVAppLauncher _resetJavascriptState](self, "_resetJavascriptState");
  -[VUITVAppLauncher _resetDeferredParsedOpenURL](self, "_resetDeferredParsedOpenURL");
  -[VUITVAppLauncher _fetchApplicationControllerBootURL](self, "_fetchApplicationControllerBootURL");
}

- (void)setDeferredParsedOpenURL:(id)a3
{
  objc_storeStrong((id *)&self->_deferredParsedOpenURL, a3);
}

- (void)_resetJavascriptState
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.ResetState", ", buf, 2u);
  }

  -[VUITVAppLauncher setTabBarItems:](self, "setTabBarItems:", 0);
  -[VUITVAppLauncher setJetPackController:](self, "setJetPackController:", 0);
  -[VUITVAppLauncher setAppController:](self, "setAppController:", 0);
  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.ResetState", ", v5, 2u);
  }

}

uint64_t __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vui_arrayForKey:", CFSTR("TabItems"));
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTabBarItems:", v6);
  objc_msgSend(WeakRetained, "_finishJavascriptSetupWithTabBarItems:setSelectedIdentifierFromDefaults:", v6, a3);

}

- (void)setTabBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarItems, a3);
}

- (void)_resetDeferredParsedOpenURL
{
  -[VUITVAppLauncher setDeferredParsedOpenURL:](self, "setDeferredParsedOpenURL:", 0);
}

- (void)_fetchApplicationControllerBootURL
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = kVUIBagTVAppJetpackURL;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJetPackController controllerWithBagKey:defaults:urlOverrideDefaultKey:](_TtC8VideosUI20VUIJetPackController, "controllerWithBagKey:defaults:urlOverrideDefaultKey:", v3, v4, CFSTR("boot-url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUITVAppLauncher setJetPackController:](self, "setJetPackController:", v5);
  objc_initWeak(&location, self);
  objc_msgSend(v5, "getJetPackURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke;
  v8[3] = &unk_1E9FA4530;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "resultWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)setJetPackController:(id)a3
{
  objc_storeStrong((id *)&self->_jetPackController, a3);
}

- (BOOL)applicationDidFinishLaunchingWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - applicationDidFinishLaunchingWithOptions", v18, 2u);
  }

  VUISignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow", ", v18, 2u);
  }

  -[VUITVAppLauncher configureAppWindow](self, "configureAppWindow");
  VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow", ", v18, 2u);
  }

  VUISignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.showLoadingView", ", v18, 2u);
  }

  -[VUITVAppLauncher showLoadingView](self, "showLoadingView");
  VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.showLoadingView", ", v18, 2u);
  }

  VUISignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.stateMachine", ", v18, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Options"));

  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "postEvent:withContext:userInfo:", CFSTR("UIApplication Did Finish Launching"), 0, v13);

  VUISignpostLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.stateMachine", ", v18, 2u);
  }

  VUISignpostLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.registerButtonListener", ", v18, 2u);
  }

  VUISignpostLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.registerButtonListener", ", v18, 2u);
  }

  return 1;
}

- (void)showLoadingView
{
  id v2;

  +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeout:", 60.0);
  objc_msgSend(v2, "showOverKeyWindowWithSpinnerOnly:", 0);

}

- (void)_retrieveSportsTabIdentifierFromTabBarItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *p_sportsTabIdentifier;
  NSString *sportsTabIdentifier;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id obj;
  void **v26;
  uint64_t v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v39[0] = CFSTR("sports");
  v39[1] = CFSTR("mls");
  v39[2] = CFSTR("tvs.sbd.7000");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sportsTabIdentifier = self->_sportsTabIdentifier;
  p_sportsTabIdentifier = (id *)&self->_sportsTabIdentifier;
  *p_sportsTabIdentifier = 0;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v27 = *(_QWORD *)v34;
    v26 = p_sportsTabIdentifier;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v13, "vui_stringForKey:", CFSTR("identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v14))
        {
          p_sportsTabIdentifier = v26;
          v23 = *v26;
          *v26 = v14;

          goto LABEL_21;
        }
        objc_msgSend(v13, "vui_arrayForKey:", CFSTR("childItems"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "vui_stringForKey:", CFSTR("identifier"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v7, "containsObject:", v21))
              {
                v22 = *v26;
                *v26 = v21;

                goto LABEL_17;
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v18)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      p_sportsTabIdentifier = v26;
      if (v11)
        continue;
      break;
    }
  }
LABEL_21:

  if (!objc_msgSend(*p_sportsTabIdentifier, "length"))
  {
    VUIDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_INFO, "VUITVAppLauncher - VUITVAppLauncher:: there may be no sports tab in the remote items, or the sport tab has different identifier now. Double check it", buf, 2u);
    }

    objc_storeStrong(p_sportsTabIdentifier, CFSTR("sports"));
  }

}

void __24__VUITVAppLauncher_init__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "osFeatureFlagsJSON");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUITVAppLauncher - dakar ff is enabled.", v4, 2u);
    }

    +[VUISportsFavoriteService initializeSportsManager](_TtC8VideosUI24VUISportsFavoriteService, "initializeSportsManager");
  }
  else
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
  }

}

+ (BOOL)_isRunningState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8[0] = CFSTR("RunningWithJavascript");
  v8[1] = CFSTR("RunningWithoutJavascript");
  v8[2] = CFSTR("RunningWithoutJavascriptWaitingForBootURL");
  v8[3] = CFSTR("RunningWithoutJavascriptWaitingForFullFeatureFlag");
  v8[4] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStart");
  v8[5] = CFSTR("RunningWithoutJavascriptWaitingForInitialTabItems");
  v8[6] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "containsObject:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)configureAppWindow
{
  NSObject *v3;
  UIWindow *appWindow;
  void *v5;
  UIWindow *v6;
  void *v7;
  VUISplitViewController *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.init", ", buf, 2u);
  }

  appWindow = self->_appWindow;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setTintColor:](appWindow, "setTintColor:", v5);

  v6 = self->_appWindow;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](v6, "setBackgroundColor:", v7);

  v8 = -[VUISplitViewController initWithStyle:]([VUISplitViewController alloc], "initWithStyle:", 1);
  -[UIWindow setRootViewController:](self->_appWindow, "setRootViewController:", v8);
  VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.init", ", v14, 2u);
  }

  VUISignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.makeKey", ", v13, 2u);
  }

  -[UIWindow vui_makeKeyAndVisible](self->_appWindow, "vui_makeKeyAndVisible");
  VUISignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.makeKey", ", v12, 2u);
  }

}

- (void)_registerStateMachineHandlers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD aBlock[4];
  id v76;
  id v77;
  id location;
  _QWORD v79[6];
  _QWORD v80[2];
  _QWORD v81[4];

  v81[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2;
  aBlock[3] = &unk_1E9F9D2B8;
  v76 = &__block_literal_global_190;
  objc_copyWeak(&v77, &location);
  v4 = _Block_copy(aBlock);
  v72[0] = v3;
  v72[1] = 3221225472;
  v72[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3;
  v72[3] = &unk_1E9FA4328;
  v73 = &__block_literal_global_190;
  objc_copyWeak(&v74, &location);
  v5 = _Block_copy(v72);
  v69[0] = v3;
  v69[1] = 3221225472;
  v69[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4;
  v69[3] = &unk_1E9F9D2B8;
  v70 = &__block_literal_global_190;
  objc_copyWeak(&v71, &location);
  v6 = _Block_copy(v69);
  v67[0] = v3;
  v67[1] = 3221225472;
  v67[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5;
  v67[3] = &unk_1E9FA4350;
  objc_copyWeak(&v68, &location);
  v7 = _Block_copy(v67);
  v66[0] = v3;
  v66[1] = 3221225472;
  v66[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_196;
  v66[3] = &unk_1E9FA4378;
  v66[4] = self;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("UIApplication Will Finish Launching"), CFSTR("Idle"), v66);
  v63[0] = v3;
  v63[1] = 3221225472;
  v63[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_198;
  v63[3] = &unk_1E9FA43A0;
  objc_copyWeak(&v65, &location);
  v18 = v7;
  v64 = v18;
  v63[4] = self;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("UIApplication Did Finish Launching"), CFSTR("StartingUIApplication"), v63);
  v61[0] = v3;
  v61[1] = 3221225472;
  v61[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_218;
  v61[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v62, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Is Library Only Country Did Change"), CFSTR("WaitingForBootURL"), v61);
  v81[0] = CFSTR("RunningWithJavascript");
  v81[1] = CFSTR("RunningWithoutJavascript");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v3;
  v59[1] = 3221225472;
  v59[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_219;
  v59[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onStates:withBlock:", CFSTR("UIApplication Open URL"), v8, v59);

  v57[0] = v3;
  v57[1] = 3221225472;
  v57[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_220;
  v57[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v58, &location);
  objc_msgSend(v2, "registerDefaultHandlerForEvent:withBlock:", CFSTR("UIApplication Open URL"), v57);
  v55[0] = v3;
  v55[1] = 3221225472;
  v55[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_221;
  v55[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v56, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Boot URL Fetch Did Complete"), CFSTR("WaitingForBootURL"), v55);
  v53[0] = v3;
  v53[1] = 3221225472;
  v53[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_222;
  v53[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v54, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Boot URL Fetch Did Complete"), CFSTR("RunningWithoutJavascriptWaitingForBootURL"), v53);
  v51[0] = v3;
  v51[1] = 3221225472;
  v51[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_223;
  v51[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v52, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Full Feature Flag Fetch Did Complete"), CFSTR("WaitingForFullFeatureFlag"), v51);
  v49[0] = v3;
  v49[1] = 3221225472;
  v49[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_226;
  v49[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v50, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Full Feature Flag Fetch Did Complete"), CFSTR("RunningWithoutJavascriptWaitingForFullFeatureFlag"), v49);
  v47[0] = v3;
  v47[1] = 3221225472;
  v47[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_227;
  v47[3] = &unk_1E9FA43F0;
  v9 = v4;
  v48 = v9;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Tab Items Received From Javascript"), CFSTR("WaitingForTVApplicationControllerToStartAndInitialTabItems"), v47);
  v44[0] = v3;
  v44[1] = 3221225472;
  v44[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_228;
  v44[3] = &unk_1E9FA4418;
  v45 = &__block_literal_global_190;
  v10 = v5;
  v46 = v10;
  v44[4] = self;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Tab Items Received From Javascript"), CFSTR("WaitingForInitialTabItems"), v44);
  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_229;
  v42[3] = &unk_1E9FA43F0;
  v17 = v6;
  v43 = v17;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Tab Items Received From Javascript"), CFSTR("RunningWithJavascript"), v42);
  v40[0] = v3;
  v40[1] = 3221225472;
  v40[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_230;
  v40[3] = &unk_1E9FA43F0;
  v15 = v9;
  v41 = v15;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Tab Items Received From Javascript"), CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems"), v40);
  v38[0] = v3;
  v38[1] = 3221225472;
  v38[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_231;
  v38[3] = &unk_1E9FA43F0;
  v16 = v10;
  v39 = v16;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Tab Items Received From Javascript"), CFSTR("RunningWithoutJavascriptWaitingForInitialTabItems"), v38);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("TVApplicationController Did Finish Launching"), CFSTR("WaitingForTVApplicationControllerToStartAndInitialTabItems"), &__block_literal_global_233);
  v36[0] = v3;
  v36[1] = 3221225472;
  v36[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_234;
  v36[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("TVApplicationController Did Finish Launching"), CFSTR("WaitingForTVApplicationControllerToStart"), v36);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("TVApplicationController Did Finish Launching"), CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems"), &__block_literal_global_236);
  v34[0] = v3;
  v34[1] = 3221225472;
  v34[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_237;
  v34[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("TVApplicationController Did Finish Launching"), CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStart"), v34);
  v80[0] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStart");
  v80[1] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  v32[1] = 3221225472;
  v32[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_238;
  v32[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onStates:withBlock:", CFSTR("TVApplicationController Did Fail To Launch"), v11, v32);

  v30[0] = v3;
  v30[1] = 3221225472;
  v30[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_239;
  v30[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v2, "registerDefaultHandlerForEvent:withBlock:", CFSTR("TVApplicationController Did Fail To Launch"), v30);
  objc_msgSend(v2, "registerDefaultHandlerForEvent:withBlock:", CFSTR("TVApplicationController Did Stop"), &__block_literal_global_241);
  v79[0] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems");
  v79[1] = CFSTR("RunningWithoutJavascriptWaitingForInitialTabItems");
  v79[2] = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStart");
  v79[3] = CFSTR("WaitingForTVApplicationControllerToStartAndInitialTabItems");
  v79[4] = CFSTR("WaitingForInitialTabItems");
  v79[5] = CFSTR("WaitingForTVApplicationControllerToStart");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  v28[1] = 3221225472;
  v28[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_242;
  v28[3] = &unk_1E9FA43C8;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v2, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Network Reachability Did Change"), v12, v28);

  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_243;
  v25[3] = &unk_1E9FA44C0;
  objc_copyWeak(&v27, &location);
  v13 = v18;
  v26 = v13;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Network Reachability Did Change"), CFSTR("RunningWithoutJavascript"), v25);
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_251;
  v23[3] = &unk_1E9FA44E8;
  objc_copyWeak(&v24, &location);
  v23[4] = self;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Network Reachability Did Change"), CFSTR("RunningWithJavascript"), v23);
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_254;
  v20[3] = &unk_1E9FA44C0;
  objc_copyWeak(&v22, &location);
  v14 = v13;
  v21 = v14;
  objc_msgSend(v2, "registerHandlerForEvent:onState:withBlock:", CFSTR("Without Javascript Active Account Did Change"), CFSTR("RunningWithoutJavascript"), v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v74);

  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);
}

- (BOOL)isAppRunning
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_isRunningState:", v5);

  return (char)v3;
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  +[VideosUI initializeJSContext:](_TtC8VideosUI8VideosUI, "initializeJSContext:", v7);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("App"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __65__VUITVAppLauncher_appController_evaluateAppJavaScriptInContext___block_invoke;
  v13 = &unk_1E9FA00C0;
  objc_copyWeak(&v14, &location);
  v9 = _Block_copy(&v10);
  objc_msgSend(v8, "setValue:forProperty:", v9, CFSTR("ata_setTabBarItems"), v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __37__VUITVAppLauncher__initializePlayer__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DB1968], "removeTemporaryDownloadDirectory");
}

void __46__VUITVAppLauncher__javascriptSetTabBarItems___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isTerminating") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Tab Items Received From Javascript"), 0, *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)isTerminating
{
  return self->_isTerminating;
}

- (BOOL)applicationWillFinishLaunchingWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - applicationWillFinishLaunchingWithOptions %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Options"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handlePrewarmSubscriptionDataNotification_, *MEMORY[0x1E0DC89B0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleOfferProcessingDidStartNotification_, CFSTR("VUIJSOfferdidStartProcessing"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleOfferProcessingDidFinishNotification_, CFSTR("VUIJSOfferdidFinishProcessing"), 0);

  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v10, "postEvent:withContext:userInfo:", CFSTR("UIApplication Will Finish Launching"), 0, v11);

  return 1;
}

- (VUIStateMachine)stateMachine
{
  return self->_stateMachine;
}

void __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reportApplicationDidForegroundtoAMSSharedStoreReview");

  }
}

- (void)_handlePrewarmSubscriptionDataNotification:(id)a3
{
  VUITVAppLauncher *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!-[VUITVAppLauncher startupPrewarmSubscriptionDataCompleted](v4, "startupPrewarmSubscriptionDataCompleted"))
    -[VUITVAppLauncher setStartupPrewarmSubscriptionDataCompleted:](v4, "setStartupPrewarmSubscriptionDataCompleted:", 1);
  objc_sync_exit(v4);

}

- (BOOL)startupPrewarmSubscriptionDataCompleted
{
  return self->_startupPrewarmSubscriptionDataCompleted;
}

- (void)setStartupPrewarmSubscriptionDataCompleted:(BOOL)a3
{
  self->_startupPrewarmSubscriptionDataCompleted = a3;
}

- (void)_initializeMediaLibrary
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id buf[2];

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary Initialization", ", (uint8_t *)buf, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordAppLaunchEventWithEventType:", CFSTR("mediaLibraryInitializeStart"));

  objc_initWeak(buf, self);
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VUITVAppLauncher__initializeMediaLibrary__block_invoke;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, buf);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_finishApplicationControllerWithLaunchContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  VUITVApplicationController *v8;
  NSObject *v9;
  void *v10;
  UIWindow *appWindow;
  void *v12;
  uint8_t v13[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = -[VUITVApplicationController initWithContext:window:delegate:]([VUITVApplicationController alloc], "initWithContext:window:delegate:", v7, self->_appWindow, self);

  -[VUITVAppLauncher setAppController:](self, "setAppController:", v8);
  VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.StartingApplicationControllerWithBootURL", ", v13, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordAppLaunchEventWithEventType:", CFSTR("applicationControllerWithBootUrlEnd"));

  appWindow = self->_appWindow;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_windowBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](appWindow, "setBackgroundColor:", v12);

  if (v6)
    v6[2](v6);

}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (void)_updateTabControllerWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BOOL v22;
  char v23;
  void *v24;
  char v25;
  _BYTE v26[22];
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    *(_DWORD *)v26 = 138412802;
    *(_QWORD *)&v26[4] = v6;
    if (v4)
      v9 = CFSTR("YES");
    *(_WORD *)&v26[12] = 2048;
    *(_QWORD *)&v26[14] = v7;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Updating tabbar with items: %@ - count %ld - setSelectedIdentifierFromDefaults: %@", v26, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceIdiom") != 1)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isRunningTest"))
  {

LABEL_8:
LABEL_9:
    -[VUITVAppLauncher tabBarController](self, "tabBarController", *(_OWORD *)v26);
    v12 = objc_claimAutoreleasedReturnValue();
    -[VUITVAppLauncher appController](self, "appController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject updateWithTabBarItems:setSelectedIdentifierFromDefaults:appContext:](v12, "updateWithTabBarItems:setSelectedIdentifierFromDefaults:appContext:", v6, v4, v14);
LABEL_10:

    goto LABEL_11;
  }
  v23 = _os_feature_enabled_impl();

  if ((v23 & 1) != 0)
    goto LABEL_9;
  if (v7)
  {
    -[VUITVAppLauncher splitViewController](self, "splitViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    -[VUITVAppLauncher appController](self, "appController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject updateWithBarItems:setSelectedIdentifierFromDefaults:appContext:](v12, "updateWithBarItems:setSelectedIdentifierFromDefaults:appContext:", v6, v4, v14);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isNetworkReachable");

  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[VUITVAppLauncher _updateTabControllerWithTabBarItems:setSelectedIdentifierFromDefaults:].cold.1(v25, v12);
LABEL_11:

  -[VUITVAppLauncher _retrieveSportsTabIdentifierFromTabBarItems:](self, "_retrieveSportsTabIdentifierFromTabBarItems:", v6);
  if (!self->_deferredParsedOpenURL)
  {
    -[VUITVAppLauncher appController](self, "appController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[VUITVAppLauncher appController](self, "appController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIGDPRPresentationManager showGDPRWelcomeScreen:](VUIGDPRPresentationManager, "showGDPRWelcomeScreen:", v18);

    }
  }
  if (!+[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen", *(_QWORD *)v26, *(_QWORD *)&v26[8]))
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, &__block_literal_global_257);

  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "openURLHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "openedByDeeplink") & 1) != 0)
  {

  }
  else
  {
    v22 = +[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen");

    if (!v22)
      -[VUITVAppLauncher processStartupItems](self, "processStartupItems");
  }
  -[VUITVAppLauncher _handleDeferredParsedOpenURLIfNeeded](self, "_handleDeferredParsedOpenURLIfNeeded");

}

- (VUITVApplicationController)appController
{
  return self->_appController;
}

- (VUITabBarProtocol)tabBarController
{
  VUITabBarProtocol *tabBarController;
  void *v4;
  void *v5;
  NSObject *v7;
  VUITabBarController *v8;
  VUITabBarProtocol *v9;
  uint8_t v10[16];

  tabBarController = self->_tabBarController;
  if (!tabBarController)
  {
    if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tabBarController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return (VUITabBarProtocol *)v5;
    }
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Initializing TabBarController", v10, 2u);
    }

    v8 = objc_alloc_init(VUITabBarController);
    v9 = self->_tabBarController;
    self->_tabBarController = (VUITabBarProtocol *)v8;

    tabBarController = self->_tabBarController;
  }
  return tabBarController;
}

- (void)processStartupItems
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  uint8_t buf[16];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - processStartupItems", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VUITVAppLauncher_processStartupItems__block_invoke;
  aBlock[3] = &unk_1E9F9B4F8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsStillProcessingStartupItems:", 1);

  if (!self->_appWasRunningWithoutJavascript)
  {
    -[VUITVAppLauncher appController](self, "appController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIOfferUtilities fetchAndPresentOffer:sourceEvent:completion:](VUIOfferUtilities, "fetchAndPresentOffer:sourceEvent:completion:", v7, CFSTR("AppLaunch"), v4);

  }
  self->_appWasRunningWithoutJavascript = 0;

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VUITVAppLauncher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_34 != -1)
    dispatch_once(&sharedInstance_onceToken_34, block);
  return (id)sharedInstance_sSharedInstance_2;
}

- (void)setIsStillProcessingStartupItems:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_isStillProcessingStartupItemsLock;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  p_isStillProcessingStartupItemsLock = &self->_isStillProcessingStartupItemsLock;
  os_unfair_lock_lock(&self->_isStillProcessingStartupItemsLock);
  self->_isStillProcessingStartupItems = v3;
  os_unfair_lock_unlock(p_isStillProcessingStartupItemsLock);
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUITVAppLauncher::set isStillProcessingStartupItems to %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_startApplicationControllerWithBootURL:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  VUITVApplicationControllerContext *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VUITVAppLauncher *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v23 = a4;
  VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.StartingApplicationControllerWithBootURL", ", buf, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordAppLaunchEventWithEventType:", CFSTR("applicationControllerWithBootUrlStart"));

  v9 = objc_alloc_init(VUITVApplicationControllerContext);
  -[VUITVApplicationControllerContext setJavaScriptApplicationURL:](v9, "setJavaScriptApplicationURL:", v6);
  +[VUIAppScriptDownloadManager sharedInstance](VUIAppScriptDownloadManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAppJavascript:cachePolicy:completionHandler:", v6, 0, 0);

  -[VUITVAppLauncher launchOptions](self, "launchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "mutableCopy");
  else
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  v14 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("reqApp"));
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DC47C8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("refApp"));
  v18 = self;
  objc_msgSend(v6, "vui_parsedQueryParametersDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("query"));
  objc_msgSend(MEMORY[0x1E0DC69E0], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "osFeatureFlagsJSON");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
    objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("featureFlags"));
  v22 = (void *)objc_msgSend(v14, "copy");
  -[VUITVApplicationControllerContext setLaunchOptions:](v9, "setLaunchOptions:", v22);

  -[VUITVAppLauncher _finishApplicationControllerWithLaunchContext:completion:](v18, "_finishApplicationControllerWithLaunchContext:completion:", v9, v23);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v3 = a2;
  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.WaitingForStateTransition", ", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_193;
  v5[3] = &unk_1E9F99C98;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v5);
  objc_destroyWeak(&v6);

}

- (void)setLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)rootViewControllerForAppController:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  VUITabBarProtocol *tabBarController;
  void *v10;
  VUIRootSplitViewController *splitViewController;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  NSObject *v18;
  char v20;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreenPlaybackUIBeingShown");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  if (!v5)
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isRunningTest"))
      {
        v20 = _os_feature_enabled_impl();

        if ((v20 & 1) == 0)
        {
          splitViewController = self->_splitViewController;
          self->_splitViewController = 0;
          goto LABEL_13;
        }
LABEL_12:
        splitViewController = self->_tabBarController;
        self->_tabBarController = 0;
LABEL_13:

        goto LABEL_17;
      }

    }
    goto LABEL_12;
  }
  if (v7 != 1)
  {
LABEL_5:

LABEL_6:
    if (!-[VUITabBarProtocol conformsToProtocol:](self->_tabBarController, "conformsToProtocol:", &unk_1F0306908))goto LABEL_17;
    tabBarController = self->_tabBarController;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isRunningTest"))
  {

    goto LABEL_5;
  }
  v12 = _os_feature_enabled_impl();

  if ((v12 & 1) != 0)
    goto LABEL_6;
  tabBarController = self->_splitViewController;
LABEL_16:
  -[VUITabBarProtocol removeAllChildViewControllers](tabBarController, "removeAllChildViewControllers");
LABEL_17:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "userInterfaceIdiom") != 1)
  {
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isRunningTest"))
  {

    goto LABEL_20;
  }
  v17 = _os_feature_enabled_impl();

  if ((v17 & 1) == 0)
  {
    -[VUITVAppLauncher splitViewController](self, "splitViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    return v16;
  }
LABEL_21:
  -[VUITVAppLauncher tabBarController](self, "tabBarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1F0283FC8)
    || +[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    v16 = v15;
  }
  else
  {
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[VUITVAppLauncher rootViewControllerForAppController:].cold.1(v18);

    v16 = 0;
  }

  return v16;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)_initializePlayer
{
  void *v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "sidebandMediaLibrary");

  v6 = dispatch_queue_create("Temp download dir cleanup queue", 0);
  dispatch_async(v6, &__block_literal_global_275);
  +[VUIStoreFPSKeyLoader preFetchFPSCertificate](VUIStoreFPSKeyLoader, "preFetchFPSCertificate");
  v4 = +[VUIPlaybackReporterUTS sharedInstance](VUIPlaybackReporterUTS, "sharedInstance");
  v5 = +[VUIPlaybackReporterVPAF sharedInstance](VUIPlaybackReporterVPAF, "sharedInstance");

}

- (void)_initializeBookmarkService
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CC2520], "sharedUbiquitousPlaybackPositionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUsingPlaybackPositionMetadata");

}

- (void)_handleDeferredParsedOpenURLIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[VUITVAppLauncher deferredParsedOpenURL](self, "deferredParsedOpenURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VUITVAppLauncher setDeferredParsedOpenURL:](self, "setDeferredParsedOpenURL:", 0);
    -[VUITVAppLauncher _handleParsedOpenURL:](self, "_handleParsedOpenURL:", v6);
  }
  else
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURLHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deferredOpenURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend((id)objc_opt_class(), "isDeeplinkTVButton:", v5) & 1) == 0)
      -[VUITVAppLauncher hideLoadingView](self, "hideLoadingView");

  }
}

- (void)hideLoadingView
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_284);
}

- (ATAParsedOpenURL)deferredParsedOpenURL
{
  return self->_deferredParsedOpenURL;
}

+ (BOOL)isDeeplinkTVButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("button")))
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("/tv"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __90__VUITVAppLauncher__updateTabControllerWithTabBarItems_setSelectedIdentifierFromDefaults___block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x1DF0999A8]();
  +[VideosUI initializeGroupActivities](_TtC8VideosUI8VideosUI, "initializeGroupActivities");
  objc_autoreleasePoolPop(v0);
}

- (void)_handleOfferProcessingDidStartNotification:(id)a3
{
  VUITVAppLauncher *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VUITVAppLauncher setStartupOfferProcessingCompleted:](v4, "setStartupOfferProcessingCompleted:", 0);
  objc_sync_exit(v4);

}

- (void)setStartupOfferProcessingCompleted:(BOOL)a3
{
  self->_startupOfferProcessingCompleted = a3;
}

void __43__VUITVAppLauncher__initializeMediaLibrary__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "_updateDeviceMediaLibraryFromCloud");

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordAppLaunchEventWithEventType:", CFSTR("mediaLibraryInitializeEnd"));

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary Initialization", ", v4, 2u);
  }

  objc_destroyWeak(&to);
}

- (void)_updateDeviceMediaLibraryFromCloud
{
  void *v2;
  id v3;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFromCloudWithReason:", 0);

}

- (void)setMainWindow:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_appWindow, a3);
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - setMainWindow %@", (uint8_t *)&v7, 0xCu);
  }

}

void __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke_2;
  v4[3] = &unk_1E9F9B698;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke_2;
  v9[3] = &unk_1E9FA3000;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

- (void)_fetchFullFeatureFlag:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Fetching full feature flag - bootURL: %@", buf, 0xCu);
  }

  VUISignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.FetchFullFeatureFlag", ", buf, 2u);
  }

  v7 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke;
  v9[3] = &unk_1E9F9A240;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "isFullTVAppEnabledwithCompletion:", v9);

}

void __34__VUITVAppLauncher_sharedInstance__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.Init", ", buf, 2u);
  }

  v1 = objc_alloc_init((Class)objc_opt_class());
  v2 = (void *)sharedInstance_sSharedInstance_2;
  sharedInstance_sSharedInstance_2 = (uint64_t)v1;

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.Init", ", v4, 2u);
  }

}

- (VUITVAppLauncher)init
{
  NSObject *v3;
  VUITVAppLauncher *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  VUIStateMachine *stateMachine;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id buf[2];
  objc_super v19;

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - initialized.", (uint8_t *)buf, 2u);
  }

  VUIRequireMainThread();
  v19.receiver = self;
  v19.super_class = (Class)VUITVAppLauncher;
  v4 = -[VUITVAppLauncher init](&v19, sel_init);
  if (v4)
  {
    VUISignpostLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", ", (uint8_t *)buf, 2u);
    }

    v4->_startupPrewarmSubscriptionDataCompleted = 0;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, &__block_literal_global_150);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A70]), "initWithName:initialState:mode:stateChangeHandler:", CFSTR("VUITVAppLauncher_StateMachine"), CFSTR("Idle"), 0, &__block_literal_global_126_0);
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = (VUIStateMachine *)v7;

    -[VUITVAppLauncher _configureStateMachine](v4, "_configureStateMachine");
    v4->_isTerminating = 0;
    v4->_isStillProcessingStartupItems = 0;
    v4->_isStillProcessingStartupItemsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(buf, v4);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __24__VUITVAppLauncher_init__block_invoke_2;
    v16[3] = &unk_1E9FA4218;
    objc_copyWeak(&v17, buf);
    -[VUITVAppLauncher setSwitchTabHandler:](v4, "setSwitchTabHandler:", v16);
    v11 = v9;
    v12 = 3221225472;
    v13 = __24__VUITVAppLauncher_init__block_invoke_3;
    v14 = &unk_1E9FA4240;
    objc_copyWeak(&v15, buf);
    -[VUITVAppLauncher setDeeplinkCompletionHandler:](v4, "setDeeplinkCompletionHandler:", &v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
  -[VUITVAppLauncher registerForApplicationNotifications](v4, "registerForApplicationNotifications", v11, v12, v13, v14);
  return v4;
}

- (void)setSwitchTabHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setDeeplinkCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

}

- (void)_configureStateMachine
{
  void *v3;
  id v4;

  -[VUITVAppLauncher _registerStateMachineHandlers](self, "_registerStateMachineHandlers");
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogObject:", v3);

  objc_msgSend(v4, "logUnhandledEvents");
  objc_msgSend(v4, "setShouldAcceptEvents:", 1);

}

uint64_t __39__VUITVAppLauncher_processStartupItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    objc_msgSend(v4, "_finishAppLoading");
  else
    objc_msgSend(v4, "_presentSyndicationOnboardingIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_handleAMSEngagementSheetPresentation:", a2);
}

void __35__VUITVAppLauncher_hideLoadingView__block_invoke()
{
  id v0;

  +[VUIAppLoadingView loadingScreen](VUIAppLoadingView, "loadingScreen");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hide");

}

- (void)_handleOfferProcessingDidFinishNotification:(id)a3
{
  VUITVAppLauncher *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VUITVAppLauncher setStartupOfferProcessingCompleted:](v4, "setStartupOfferProcessingCompleted:", 1);
  objc_sync_exit(v4);

}

- (void)_handleAMSEngagementSheetPresentation:(BOOL)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningTest");

  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Running PPT test. Skip handling of engagement presentation sheet.", v6, 2u);
    }

  }
}

- (void)_finishAppLoading
{
  -[VUITVAppLauncher setIsStillProcessingStartupItems:](self, "setIsStillProcessingStartupItems:", 0);
  +[VideosUI handleAppDidFinishLoading](_TtC8VideosUI8VideosUI, "handleAppDidFinishLoading");
}

+ (BOOL)_isRunningWithoutJSState:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("RunningWithoutJavascript"));
}

void __24__VUITVAppLauncher_init__block_invoke_124(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  BOOL v6;
  _BOOL4 v7;
  id v8;

  v5 = a4;
  v6 = +[VUITVAppLauncher _isRunningState:](VUITVAppLauncher, "_isRunningState:", a3);
  v7 = +[VUITVAppLauncher _isRunningState:](VUITVAppLauncher, "_isRunningState:", v5);

  if (v7 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("VUITVAppLauncherDidStartRunningNotification"), 0);

  }
}

void __24__VUITVAppLauncher_init__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isRunningTest"))
      {
        v7 = _os_feature_enabled_impl();

        if ((v7 & 1) == 0)
        {
          objc_msgSend(WeakRetained, "splitViewController");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setSelectedIndexForIdentifier:withDeeplinkURL:", v8, 0);
          goto LABEL_7;
        }
LABEL_6:
        objc_msgSend(WeakRetained, "tabBarController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSelectedIndexForTabBarItemIdentifier:", v8);
LABEL_7:

        goto LABEL_8;
      }

    }
    goto LABEL_6;
  }
LABEL_8:

}

void __24__VUITVAppLauncher_init__block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD aBlock[4];
  id v28;
  id v29;
  char v30;

  v8 = a2;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v9)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") != 1)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isRunningTest"))
  {

LABEL_5:
    goto LABEL_6;
  }
  v4 = _os_feature_enabled_impl();

  if ((v4 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "splitViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSelectedIndexForIdentifier:withDeeplinkURL:", v9, v8);
    goto LABEL_10;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isEqual:", v13);

  objc_msgSend(WeakRetained, "tabBarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    v17 = 0;
  else
    v17 = v9;
  objc_msgSend(v15, "setSelectedIndexForTabBarItemIdentifier:clearStack:", v17, a4);
LABEL_10:

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__VUITVAppLauncher_init__block_invoke_4;
  aBlock[3] = &unk_1E9F9C920;
  v30 = a4;
  v19 = WeakRetained;
  v28 = v19;
  v29 = v8;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");
  if (v22 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v4, "isRunningTest") & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(v19, "splitViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  objc_msgSend(v19, "tabBarController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == 1)
LABEL_18:

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v23, "vuiPresentedViewController"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v24))
  {
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __24__VUITVAppLauncher_init__block_invoke_7;
    v25[3] = &unk_1E9F98E68;
    v26 = v20;
    objc_msgSend(v23, "vui_dismissViewControllerAnimated:completion:", 1, v25);

  }
  else
  {
    v20[2](v20);
  }

LABEL_24:
}

void __24__VUITVAppLauncher_init__block_invoke_4(uint64_t a1)
{
  void (**v2)(void);
  _QWORD aBlock[4];
  id v4;
  id v5;
  char v6;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__VUITVAppLauncher_init__block_invoke_5;
  aBlock[3] = &unk_1E9F9C920;
  v6 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v2 = (void (**)(void))_Block_copy(aBlock);
  v2[2]();

}

void __24__VUITVAppLauncher_init__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "appController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "popToRootViewControllerAnimated:", 0);

  }
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1F033E818)
    || objc_msgSend(v7, "deeplinkURLWasHandled:", *(_QWORD *)(a1 + 40)))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentCreator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewControllerToTop:animated:needsFocusUpdate:", v7, 0, 1);

  }
}

uint64_t __24__VUITVAppLauncher_init__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - openURL %@, options %@", (uint8_t *)&v19, 0x16u);
  }

  -[VUITVAppLauncher setIsDeeplinkLaunched:](self, "setIsDeeplinkLaunched:", -[VUITVAppLauncher isAppRunning](self, "isAppRunning") ^ 1);
  +[ATAParsedOpenURL parsedOpenURLWithURL:andOptions:](ATAParsedOpenURL, "parsedOpenURLWithURL:andOptions:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - openURL creating openUrlEvent userInfo", (uint8_t *)&v19, 2u);
    }

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("ParsedOpenURL"));
    objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("Options"));
    -[VUITVAppLauncher stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postEvent:withContext:userInfo:", CFSTR("UIApplication Open URL"), 0, v11);

    objc_msgSend(v9, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7)
      v17 = v7;
    else
      v17 = (id)MEMORY[0x1E0C9AA70];
    objc_msgSend(v15, "recordOpenUrlLaunchWithExtURL:andOptions:", v14, v17);

  }
  return v9 != 0;
}

- (void)didFailToLaunch:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didFailToLaunch %@", (uint8_t *)&v5, 0xCu);
  }

}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

+ (BOOL)isSidebarEnabled
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isRunningTest") & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = _os_feature_enabled_impl() ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)cleanUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  self->_isTerminating = 1;
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - cleanUp", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0DC6AD0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)refreshTabBarItems
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VUITVAppLauncher_refreshTabBarItems__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __38__VUITVAppLauncher_refreshTabBarItems__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "evaluate:", &__block_literal_global_159);

}

void __38__VUITVAppLauncher_refreshTabBarItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "hasProperty:", CFSTR("fetchConfigAndSetTabBarItems")))
  {
    VUISignpostLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarItemsFetch", ", v6, 2u);
    }

    v5 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("fetchConfigAndSetTabBarItems"), 0);
  }

}

- (void)selectTabBarItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRunningTest"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
    -[VUITVAppLauncher splitViewController](self, "splitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedIndexForIdentifier:withDeeplinkURL:", v8, 0);
    goto LABEL_6;
  }
LABEL_5:
  -[VUITVAppLauncher tabBarController](self, "tabBarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedIndexForTabBarItemIdentifier:", v8);
LABEL_6:

}

- (BOOL)isAppRunningWithoutJS
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_isRunningWithoutJSState:", v5);

  return (char)v3;
}

- (void)didShowGDPRWelcome
{
  NSObject *v3;
  _QWORD block[2];
  void (*v5)(uint64_t);
  void *v6;
  VUITVAppLauncher *v7;
  uint8_t buf[16];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didShowGDPRWelcome", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v5 = __38__VUITVAppLauncher_didShowGDPRWelcome__block_invoke;
  v6 = &unk_1E9F98DF0;
  v7 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v5((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __38__VUITVAppLauncher_didShowGDPRWelcome__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_dialogMetricsForGDPR");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordDialog:", v2);

}

- (void)didAcceptGDPRWelcome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[VUITVAppLauncher _dialogMetricsForGDPR](self, "_dialogMetricsForGDPR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v10[0] = CFSTR("targetId");
  v10[1] = CFSTR("targetType");
  v11[0] = CFSTR("continue");
  v11[1] = CFSTR("button");
  v10[2] = CFSTR("actionType");
  v11[2] = CFSTR("gdprConsent");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordClick:", v3);

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didAcceptGDPRWelcome", v9, 2u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke();
  else
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_165);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, &__block_literal_global_166);

}

void __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke()
{
  id v0;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "forceGDPRConsentStatus:", 1);

}

void __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke_2()
{
  void *v0;

  v0 = (void *)MEMORY[0x1DF0999A8]();
  +[VideosUI initializeGroupActivities](_TtC8VideosUI8VideosUI, "initializeGroupActivities");
  objc_autoreleasePoolPop(v0);
}

- (id)_dialogMetricsForGDPR
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("dialogId");
  v3[1] = CFSTR("dialogType");
  v4[0] = CFSTR("GDPR");
  v4[1] = CFSTR("GDPR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if ((_os_feature_enabled_impl() & 1) == 0
    && -[VUITVAppLauncher _isActiveMediaLibraryTheDeviceMediaLibrary](self, "_isActiveMediaLibraryTheDeviceMediaLibrary"))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginDiscoveringHomeShareMediaLibraries");

  }
  self->_appWasForegrounded = 1;
  self->_startupOfferProcessingCompleted = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VUITVAppLauncher__applicationWillEnterForeground___block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__VUITVAppLauncher__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "_updateDeviceMediaLibraryFromCloud");

  objc_destroyWeak(&to);
}

uint64_t __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAMSEngagementSheetPresentation:", a2);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0
    && -[VUITVAppLauncher _isActiveMediaLibraryTheDeviceMediaLibrary](self, "_isActiveMediaLibraryTheDeviceMediaLibrary"))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDiscoveringHomeShareMediaLibraries");

  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURLHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOpenedByDeeplink:", 0);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("lastActiveDate"));

  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "DropOnTab: Updating lastActiveDate to %@", (uint8_t *)&v11, 0xCu);
  }

  if (-[VUITVAppLauncher _shouldRecordExitEvent](self, "_shouldRecordExitEvent"))
  {
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordAppWillBackground");

  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  self->_appWasForegrounded = 0;
}

- (void)_applicationWillTerminateNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUITVAppLauncher - will terminate.", (uint8_t *)&v9, 2u);
  }

  if (-[VUITVAppLauncher _shouldRecordExitEvent](self, "_shouldRecordExitEvent"))
  {
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordAppWillTerminate");

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("lastActiveDate"));

  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "DropOnTab: Updating lastActiveDate to %@", (uint8_t *)&v9, 0xCu);
  }

}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTabBarItems:", v3);

}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTabBarItems:", v3);
  objc_msgSend(WeakRetained, "_updateTabControllerWithTabBarItems:setSelectedIdentifierFromDefaults:", v3, 1);

}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_193(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id WeakRetained;
  uint8_t v6[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.WaitingForStateTransition", ", buf, 2u);
  }

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad", ", v6, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordAppLaunchEventWithEventType:", CFSTR("javascriptRuntimeStart"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startJavascriptSetup");

}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_196(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UIApplicationLaunch", ", (uint8_t *)&v16, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordAppLaunchEventWithEventType:", CFSTR("uikitApplicationLaunchStart"));

  objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("Options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Launching with options: %@", (uint8_t *)&v16, 0xCu);
  }

  VUISignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary", ", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_initializeMediaLibrary");
  VUISignpostLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary", ", (uint8_t *)&v16, 2u);
  }

  v13 = +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "UNIFIED_MESSAGING: Unified Messaging is enabled", (uint8_t *)&v16, 2u);
  }

  +[VideosUI initializeUnifiedMessagingManager](_TtC8VideosUI8VideosUI, "initializeUnifiedMessagingManager");
  return CFSTR("StartingUIApplication");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_198(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  _BOOL4 v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  _BYTE v41[24];
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[VideosUI initializeUIFactory](_TtC8VideosUI8VideosUI, "initializeUIFactory");
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNetworkReachable");

  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NO");
    *(_DWORD *)v41 = 138412802;
    *(_QWORD *)&v41[4] = CFSTR("UIApplication Did Finish Launching");
    *(_QWORD *)&v41[14] = CFSTR("StartingUIApplication");
    *(_WORD *)&v41[12] = 2112;
    if (v11)
      v13 = CFSTR("YES");
    *(_WORD *)&v41[22] = 2112;
    v42 = v13;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@", v41, 0x20u);
  }

  v14 = +[VUIAuthenticationManager isLibraryOnlyCountry](VUIAuthenticationManager, "isLibraryOnlyCountry");
  if (v14)
    LOBYTE(v14) = +[VUIAuthenticationManager isLibraryOnlyCountryResolved](VUIAuthenticationManager, "isLibraryOnlyCountryResolved");
  if (!v11 || v14)
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 0, *(_OWORD *)v41, *(_QWORD *)&v41[16]);
    v16 = CFSTR("RunningWithoutJavascript");
  }
  else
  {
    (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, v15);
    v16 = CFSTR("WaitingForBootURL");
  }
  if (os_variant_has_internal_content())
    JSRemoteInspectorSetLogToSystemConsole();
  v17 = +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance", *(_QWORD *)v41);
  v18 = +[VUIPostPlayUpsellManager sharedInstance](VUIPostPlayUpsellManager, "sharedInstance");
  objc_msgSend(v8, "vui_dictionaryForKey:", CFSTR("Options"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setLaunchOptions:", v19);
  VUISignpostLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BookmarkService Initialization", ", v41, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recordAppLaunchEventWithEventType:", CFSTR("bookmarkServiceInitializationStart"));

  objc_msgSend(WeakRetained, "_initializeBookmarkService");
  VUISignpostLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BookmarkService Initialization", ", v41, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recordAppLaunchEventWithEventType:", CFSTR("bookmarkServiceInitializationEnd"));

  VUISignpostLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Rentals.Init", ", v41, 2u);
  }

  +[VUIRentalManager sharedInstance](VUIRentalManager, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "initializeRentals");

  +[VUIARQLPreviewManager sharedInstance](VUIARQLPreviewManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cancelExistingDownloadsIfAny");

  VUISignpostLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Rentals.Init", ", v41, 2u);
  }

  VUISignpostLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch.OthersInit", ", v41, 2u);
  }

  v29 = (id)objc_msgSend(MEMORY[0x1E0DC87E0], "defaultCenter");
  objc_msgSend(WeakRetained, "_initializePlayer");
  v30 = (id)objc_msgSend(MEMORY[0x1E0DC8730], "sharedInstance");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", WeakRetained, sel__handleNetworkReachabilityDidChangeNotification_, *MEMORY[0x1E0DC6B70], 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__accountsChanged_, CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__isLibraryOnlyCountryChanged_, CFSTR("VUIAuthenticationManagerIsLibraryOnlyCountryDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0DC6968], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "listenForApplicationNotifications");

  v35 = (id)objc_msgSend(MEMORY[0x1E0DC6960], "sharedInstance");
  VUISignpostLogObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIApplicationLaunch", ", v41, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "recordAppLaunchEventWithEventType:", CFSTR("uikitApplicationLaunchEnd"));

  v38 = +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
  VUISignpostLogObject();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch.OthersInit", ", v41, 2u);
  }

  return v16;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_218(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (+[VUIAuthenticationManager isLibraryOnlyCountryResolved](VUIAuthenticationManager, "isLibraryOnlyCountryResolved")&& +[VUIAuthenticationManager isLibraryOnlyCountry](VUIAuthenticationManager, "isLibraryOnlyCountry"))
  {
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isNetworkReachable");

    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", v3);
    v4 = CFSTR("RunningWithoutJavascript");
  }
  else
  {
    v4 = CFSTR("WaitingForBootURL");
  }

  return v4;
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_219(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "objectForKey:", CFSTR("ParsedOpenURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleParsedOpenURL:", v10);
  if ((objc_msgSend((id)objc_opt_class(), "_isDeeplinkTVButton:", v10) & 1) == 0)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURLHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOpenedByDeeplink:", 1);

  }
  objc_msgSend(v7, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_220(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "objectForKey:", CFSTR("ParsedOpenURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setDeferredParsedOpenURL:", v10);
  if ((objc_msgSend((id)objc_opt_class(), "_isDeeplinkTVButton:", v10) & 1) == 0)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURLHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOpenedByDeeplink:", 1);

  }
  objc_msgSend(v7, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_221(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "vui_URLForKey:", CFSTR("BootURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v8)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("Error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = CFSTR("Boot URL Fetch Did Complete");
    v16 = 2112;
    v17 = CFSTR("WaitingForBootURL");
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - bootURL: %@ - error: %@", (uint8_t *)&v14, 0x2Au);

  }
  if (v8)
  {
    objc_msgSend(WeakRetained, "_fetchFullFeatureFlag:", v8);
    v12 = CFSTR("WaitingForFullFeatureFlag");
  }
  else
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);
    v12 = CFSTR("RunningWithoutJavascript");
  }

  return v12;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_222(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "vui_URLForKey:", CFSTR("BootURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("Error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = CFSTR("Boot URL Fetch Did Complete");
    v16 = 2112;
    v17 = CFSTR("RunningWithoutJavascriptWaitingForBootURL");
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - bootURL: %@ - error: %@", (uint8_t *)&v14, 0x2Au);

  }
  if (v8)
  {
    objc_msgSend(WeakRetained, "_fetchFullFeatureFlag:", v8);
    v12 = CFSTR("RunningWithoutJavascriptWaitingForFullFeatureFlag");
  }
  else
  {
    objc_msgSend(WeakRetained, "_handleDeferredParsedOpenURLIfNeeded");
    v12 = CFSTR("RunningWithoutJavascript");
  }

  return v12;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_223(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v16[5];
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "vui_numberForKey:", CFSTR("fullFeatureFlag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("Error"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = CFSTR("Full Feature Flag Fetch Did Complete");
    v19 = 2112;
    v20 = CFSTR("WaitingForFullFeatureFlag");
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - fullFeatureFlag: %@ - error: %@", buf, 0x2Au);

  }
  if (v9)
  {
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("BootURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_224;
    v16[3] = &unk_1E9F98DF0;
    v16[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_startApplicationControllerWithBootURL:completion:", v13, v16);

    v14 = CFSTR("WaitingForTVApplicationControllerToStartAndInitialTabItems");
  }
  else
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);
    v14 = CFSTR("RunningWithoutJavascript");
  }

  return v14;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_224(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (!+[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen"))
  {
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUITVAppLauncher - GDPR shown already, register device for offers now.", v5, 2u);
    }

    +[VUIOfferUtilities registerDeviceForCommerceOffers](VUIOfferUtilities, "registerDeviceForCommerceOffers");
    objc_msgSend(*(id *)(a1 + 32), "appController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIJSNotificationCenter showSignupAlertPushNotificationWithAppContext:](VUIJSNotificationCenter, "showSignupAlertPushNotificationWithAppContext:", v4);

  }
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_226(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "vui_numberForKey:", CFSTR("fullFeatureFlag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("Error"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = CFSTR("Full Feature Flag Fetch Did Complete");
    v18 = 2112;
    v19 = CFSTR("RunningWithoutJavascriptWaitingForFullFeatureFlag");
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - fullFeatureFlag: %@ - error: %@", (uint8_t *)&v16, 0x2Au);

  }
  if (v9)
  {
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("BootURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_startApplicationControllerWithBootURL:completion:", v13, 0);

    v14 = CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems");
  }
  else
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);
    v14 = CFSTR("RunningWithoutJavascript");
  }

  return v14;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_227(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("WaitingForTVApplicationControllerToStart");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a5;
  VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarItemsFetch", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript after waiting for initial tab items", v13, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0DC8820], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prewarmSubscriptionData");

    v11 = CFSTR("RunningWithJavascript");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);
    v11 = CFSTR("RunningWithoutJavascript");
  }

  return v11;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_229(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v6 = a5;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript while running with javascript", v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("RunningWithJavascript");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_230(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("RunningWithoutJavascriptWaitingForTVApplicationControllerToStart");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_231(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v6 = a5;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript while running without javascript waint for initial tab items", v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("RunningWithJavascript");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_232()
{
  return CFSTR("WaitingForInitialTabItems");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_234(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarItemUpdates", ", buf, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordAppLaunchEventWithEventType:", CFSTR("tabBarItemUpdatesStart"));

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - tv app controller did finish launching from waiting for tv app controller to start, updating tab bar items", v10, 2u);
  }

  objc_msgSend(WeakRetained, "tabBarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishJavascriptSetupWithTabBarItems:setSelectedIdentifierFromDefaults:", v5, 1);

  VUISignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarItemUpdates", ", v9, 2u);
  }

  +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordAppLaunchEventWithEventType:", CFSTR("tabBarItemUpdatesEnd"));

  return CFSTR("RunningWithJavascript");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_235()
{
  return CFSTR("RunningWithoutJavascriptWaitingForInitialTabItems");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_237(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - tv app controller did finish launching from running without javascript, updating tab bar items", v5, 2u);
  }

  objc_msgSend(WeakRetained, "tabBarItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishJavascriptSetupWithTabBarItems:setSelectedIdentifierFromDefaults:", v3, 0);

  return CFSTR("RunningWithJavascript");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_238(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);
  objc_msgSend(WeakRetained, "_handleDeferredParsedOpenURLIfNeeded");

  return CFSTR("RunningWithoutJavascript");
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_239(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 1);

  return CFSTR("RunningWithoutJavascript");
}

uint64_t __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_240(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_242(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNetworkReachable");

  objc_msgSend(v3, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 0);
    v8 = CFSTR("RunningWithoutJavascript");
  }

  return v8;
}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_243(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  char v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v28 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 16) = 1;
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance", v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isNetworkReachable");

  if (+[VUIAuthenticationManager isLibraryOnlyCountry](VUIAuthenticationManager, "isLibraryOnlyCountry"))
    v16 = +[VUIAuthenticationManager isLibraryOnlyCountryResolved](VUIAuthenticationManager, "isLibraryOnlyCountryResolved");
  else
    v16 = 0;
  VUIDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v18 = CFSTR("YES - tabbar is visible");
    else
      v18 = CFSTR("NO - tabbar is hidden");
    VUIBoolLogString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = CFSTR("Network Reachability Did Change");
    v34 = 2112;
    v35 = CFSTR("RunningWithoutJavascript");
    v36 = 2112;
    v37 = v18;
    v38 = 2112;
    v39 = v19;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@ - isLibraryOnlyCountryMode %@", buf, 0x2Au);

  }
  if (((v15 ^ 1 | v16) & 1) == 0)
  {
    objc_msgSend(v13, "showLoadingView");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_initWeak((id *)buf, v13);
    v25 = (void *)MEMORY[0x1E0DC8868];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_249;
    v30[3] = &unk_1E9F9B3A0;
    objc_copyWeak(&v31, (id *)buf);
    objc_msgSend(v25, "isFullTVAppEnabledwithCompletion:", v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
    v24 = CFSTR("RunningWithoutJavascriptWaitingForBootURL");
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "userInterfaceIdiom") != 1)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isRunningTest"))
  {

LABEL_15:
LABEL_16:
    VUIDefaultLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
    }

    objc_msgSend(v13, "tabBarController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTabBarHidden:", 1);

    goto LABEL_19;
  }
  v27 = _os_feature_enabled_impl();

  if ((v27 & 1) != 0)
    goto LABEL_16;
LABEL_19:
  v24 = CFSTR("RunningWithoutJavascript");
LABEL_21:

  return v24;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_249(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  _QWORD v6[4];
  id v7;
  char v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: Showing tab bar - isFullTVAppEnabled: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_250;
  v6[3] = &unk_1E9F9A758;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v8 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v7);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_250(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isRunningTest"))
      {
        v6 = _os_feature_enabled_impl();

        WeakRetained = v7;
        if ((v6 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
LABEL_6:
    objc_msgSend(v7, "tabBarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTabBarHidden:", 0);

    WeakRetained = v7;
  }
LABEL_7:

}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_251(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v34;
  NSObject *v35;
  char v36;
  char v37;
  _QWORD v38[4];
  id v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isNetworkReachable");

  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("NO - tabbar is hidden");
    *(_DWORD *)buf = 138412802;
    v43 = CFSTR("Network Reachability Did Change");
    v45 = CFSTR("RunningWithJavascript");
    v44 = 2112;
    if (v15)
      v17 = CFSTR("YES - tabbar is visible");
    v46 = 2112;
    v47 = v17;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@", buf, 0x20u);
  }

  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "_libraryOnlyTabBarItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isRunningTest"))
      {
        v34 = _os_feature_enabled_impl();

        if ((v34 & 1) == 0)
        {
          VUIDefaultLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - SplitViewController updatedWithBarItems Library Only", buf, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "splitViewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateWithBarItems:setSelectedIdentifierFromDefaults:appContext:", v25, 0, 0);
LABEL_14:

          objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "userInterfaceIdiom") == 1)
          {
            objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v27, "isRunningTest"))
            {
              v36 = _os_feature_enabled_impl();

              if ((v36 & 1) == 0)
              {
LABEL_19:
                objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v29, "userInterfaceIdiom") == 1)
                {
                  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v30, "isRunningTest"))
                  {
                    v37 = _os_feature_enabled_impl();

                    if ((v37 & 1) == 0)
                    {
LABEL_26:

                      v19 = CFSTR("RunningWithoutJavascript");
                      goto LABEL_27;
                    }
LABEL_23:
                    VUIDefaultLogObject();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
                    }

                    objc_msgSend(WeakRetained, "tabBarController");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "setTabBarHidden:", 1);

                    goto LABEL_26;
                  }

                }
                goto LABEL_23;
              }
LABEL_18:
              objc_msgSend(WeakRetained, "tabBarController");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setSelectedIndexForTabBarItemIdentifier:", CFSTR("library"));

              goto LABEL_19;
            }

          }
          goto LABEL_18;
        }
LABEL_11:
        VUIDefaultLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - TabBarController updatedWithBarItems Library Only", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "tabBarController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "updateWithTabBarItems:setSelectedIdentifierFromDefaults:appContext:", v25, 0, 0);
        goto LABEL_14;
      }

    }
    goto LABEL_11;
  }
  objc_initWeak((id *)buf, WeakRetained);
  v18 = (void *)MEMORY[0x1E0DC8868];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_252;
  v38[3] = &unk_1E9F9B3A0;
  objc_copyWeak(&v39, (id *)buf);
  objc_msgSend(v18, "isFullTVAppEnabledwithCompletion:", v38);
  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
  v19 = CFSTR("RunningWithJavascript");
LABEL_27:

  return v19;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_252(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_253;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_253(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isRunningTest"))
      {
        v6 = _os_feature_enabled_impl();

        WeakRetained = v7;
        if ((v6 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
LABEL_6:
    objc_msgSend(v7, "tabBarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTabBarHidden:", 0);

    WeakRetained = v7;
  }
LABEL_7:

}

const __CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_254(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isNetworkReachable");

  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = CFSTR("Without Javascript Active Account Did Change");
    v29 = 2112;
    v30 = CFSTR("RunningWithoutJavascript");
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@", buf, 0x16u);
  }

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "isRunningTest"))
      {
        v24 = _os_feature_enabled_impl();

        if ((v24 & 1) == 0)
        {
LABEL_12:
          v18 = CFSTR("RunningWithoutJavascript");
          goto LABEL_13;
        }
LABEL_9:
        VUIDefaultLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
        }

        objc_msgSend(WeakRetained, "tabBarController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTabBarHidden:", 1);

        goto LABEL_12;
      }

    }
    goto LABEL_9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_initWeak((id *)buf, WeakRetained);
  v17 = (void *)MEMORY[0x1E0DC8868];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_255;
  v25[3] = &unk_1E9F9B3A0;
  objc_copyWeak(&v26, (id *)buf);
  objc_msgSend(v17, "isFullTVAppEnabledwithCompletion:", v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  v18 = CFSTR("RunningWithoutJavascriptWaitingForBootURL");
LABEL_13:

  return v18;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_255(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_256;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_256(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isRunningTest"))
      {
        v6 = _os_feature_enabled_impl();

        WeakRetained = v7;
        if ((v6 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
LABEL_6:
    objc_msgSend(v7, "tabBarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTabBarHidden:", 0);

    WeakRetained = v7;
  }
LABEL_7:

}

- (void)_showJavascriptUnavailableUIWithNetworkAvailable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Showing JS unavailable UI - networkAvailable: %@", buf, 0xCu);
  }

  -[VUITVAppLauncher _resetJavascriptState](self, "_resetJavascriptState");
  objc_msgSend((id)objc_opt_class(), "_libraryOnlyTabBarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") != 1)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isRunningTest"))
  {

LABEL_8:
LABEL_9:
    -[VUITVAppLauncher tabBarController](self, "tabBarController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithTabBarItems:setSelectedIdentifierFromDefaults:appContext:", v11, 0, 0);
    goto LABEL_10;
  }
  v18 = _os_feature_enabled_impl();

  if ((v18 & 1) != 0)
    goto LABEL_9;
  -[VUITVAppLauncher splitViewController](self, "splitViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithBarItems:setSelectedIdentifierFromDefaults:appContext:", v11, 0, 0);
LABEL_10:

  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
  }

  -[VUITVAppLauncher tabBarController](self, "tabBarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTabBarHidden:", 1);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "userInterfaceIdiom") != 1)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isRunningTest"))
  {

LABEL_15:
LABEL_16:
    -[VUITVAppLauncher tabBarController](self, "tabBarController");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v19 = _os_feature_enabled_impl();

  if ((v19 & 1) != 0)
    goto LABEL_16;
  -[VUITVAppLauncher splitViewController](self, "splitViewController");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v17 = (void *)v16;
  -[UIWindow vui_setRootViewController:](self->_appWindow, "vui_setRootViewController:", v16);
  -[UIWindow vui_makeKeyAndVisible](self->_appWindow, "vui_makeKeyAndVisible");
  if (v3)
    +[VUIGDPRPresentationManager showGDPRWelcomeScreen:](VUIGDPRPresentationManager, "showGDPRWelcomeScreen:", 0);
  else
    +[VUIGDPRPresentationManager showOfflineGDPRWelcomeScreen](VUIGDPRPresentationManager, "showOfflineGDPRWelcomeScreen");
  -[VUITVAppLauncher _handleDeferredParsedOpenURLIfNeeded](self, "_handleDeferredParsedOpenURLIfNeeded");
  -[VUITVAppLauncher _resetDeferredParsedOpenURL](self, "_resetDeferredParsedOpenURL");
  -[VUITVAppLauncher hideLoadingView](self, "hideLoadingView");

}

- (void)_stopApplicationController
{
  id v2;

  -[VUITVAppLauncher appController](self, "appController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (BOOL)_isActiveMediaLibraryTheDeviceMediaLibrary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRunningTest"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v9 = _os_feature_enabled_impl();

  if ((v9 & 1) == 0)
    return 1;
LABEL_5:
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == v6;

  return v7;
}

- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", *MEMORY[0x1E0DC6B78], 0);

  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("IsNetworkReachable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Network Reachability Did Change"), 0, v8);

}

- (VUIRootSplitViewController)splitViewController
{
  VUIRootSplitViewController *splitViewController;
  void *v4;
  VUIRootSplitViewController *v5;
  VUIRootSplitViewController *v6;
  NSObject *v7;
  uint8_t v9[16];

  splitViewController = self->_splitViewController;
  if (!splitViewController)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootSplitViewController");
    v5 = (VUIRootSplitViewController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_splitViewController;
    self->_splitViewController = v5;

    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Requested SplitViewController from InterfaceFactory", v9, 2u);
    }

    splitViewController = self->_splitViewController;
  }
  return splitViewController;
}

- (void)_handleParsedOpenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, uint64_t, uint64_t);
  void *v20;
  id v21;
  id location;

  v4 = a3;
  -[VUITVAppLauncher appController](self, "appController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[VUIGDPRPresentationManager showGDPRWelcomeScreen:](VUIGDPRPresentationManager, "showGDPRWelcomeScreen:", v6);

  if (v7)
  {
    objc_initWeak(&location, self);
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURLHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __41__VUITVAppLauncher__handleParsedOpenURL___block_invoke;
    v20 = &unk_1E9FA4240;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v9, "saveDeferredURL:completion:", v10, &v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    -[VUITVAppLauncher hideLoadingView](self, "hideLoadingView", v17, v18, v19, v20);
  }
  else
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURLHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITVAppLauncher appController](self, "appController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITVAppLauncher deeplinkCompletionHandler](self, "deeplinkCompletionHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processDeeplink:appContext:completion:", v13, v15, v16);

  }
}

void __41__VUITVAppLauncher__handleParsedOpenURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "deeplinkCompletionHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, uint64_t, uint64_t))v11)[2](v11, v10, v9, a4, a5);

}

- (void)_accountsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed %@", buf, 0xCu);

  }
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateGDPRConsentStatus");

  if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    -[VUITVAppLauncher stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("RunningWithoutJavascript"));

    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed and Javscript is not running", buf, 2u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__VUITVAppLauncher__accountsChanged___block_invoke;
      block[3] = &unk_1E9F98DF0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed. Fetch config and refresh tab bar items.", buf, 2u);
      }

      -[VUITVAppLauncher refreshTabBarItems](self, "refreshTabBarItems");
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__VUITVAppLauncher__accountsChanged___block_invoke_282;
    v13[3] = &unk_1E9F99C98;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_async(MEMORY[0x1E0C80D38], v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __37__VUITVAppLauncher__accountsChanged___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:withContext:userInfo:", CFSTR("Without Javascript Active Account Did Change"), 0, 0);

}

void __37__VUITVAppLauncher__accountsChanged___block_invoke_282(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedIndex");

  objc_msgSend(WeakRetained, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabBarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 >= objc_msgSend(v5, "count"))
    v6 = 0;
  else
    v6 = v3;
  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vui_stringForKey:", CFSTR("documentRef"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Library")))
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "VUITVAppLauncher - User signed out. Popping to library tab root.", v13, 2u);
    }

    objc_msgSend(WeakRetained, "appController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popToRootViewControllerAnimated:", 0);

  }
}

- (void)_isLibraryOnlyCountryChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[VUIAuthenticationManager isLibraryOnlyCountry](VUIAuthenticationManager, "isLibraryOnlyCountry");
    VUIBoolLogString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIAuthenticationManager isLibraryOnlyCountryResolved](VUIAuthenticationManager, "isLibraryOnlyCountryResolved");
    VUIBoolLogString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Is library only has changed. isLibraryOnlyCountry %@ . isLibraryOnlyCountryResolved %@", (uint8_t *)&v8, 0x16u);

  }
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:", CFSTR("Is Library Only Country Did Change"));

}

+ (BOOL)_isDeeplinkTVButton:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "isDeeplinkTVButton:", v3);

  return v4;
}

- (BOOL)_shouldRecordExitEvent
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTabIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)v3, "isEqualToString:", CFSTR("library"));

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isFullscreenPlaybackUIBeingShown");

  return v4 | v3;
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("Error");
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("TVApplicationController Did Fail To Launch"), 0, v7);

}

- (void)appController:(id)a3 didStopWithOptions:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("Options");
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[VUITVAppLauncher stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("TVApplicationController Did Stop"), 0, v7);

}

- (id)rootViewController
{
  void *v3;
  void *v4;
  void *v5;
  char v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRunningTest"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
    -[VUITVAppLauncher splitViewController](self, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
LABEL_5:
  -[VUITVAppLauncher tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)_libraryOnlyTabBarItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("documentRef");
  v13[0] = CFSTR("library");
  v13[1] = CFSTR("Library");
  v12[2] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LIBRARY_TAB"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("isSideBarItem");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isRunningTest") & 1) != 0)
      v8 = 0;
    else
      v8 = _os_feature_enabled_impl() ^ 1;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  v13[4] = MEMORY[0x1E0C9AAA0];
  v12[4] = CFSTR("showHeader");
  v12[5] = CFSTR("collapsable");
  v13[5] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 1)
  return v10;
}

- (BOOL)isStillProcessingStartupItems
{
  os_unfair_lock_s *p_isStillProcessingStartupItemsLock;
  _BOOL4 isStillProcessingStartupItems;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_isStillProcessingStartupItemsLock = &self->_isStillProcessingStartupItemsLock;
  os_unfair_lock_lock(&self->_isStillProcessingStartupItemsLock);
  isStillProcessingStartupItems = self->_isStillProcessingStartupItems;
  os_unfair_lock_unlock(p_isStillProcessingStartupItemsLock);
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (isStillProcessingStartupItems)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher:: read isStillProcessingStartupItems : %@", (uint8_t *)&v8, 0xCu);
  }

  return isStillProcessingStartupItems;
}

- (void)setTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarController, a3);
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (void)setAppWindow:(id)a3
{
  objc_storeStrong((id *)&self->_appWindow, a3);
}

- (id)switchTabHandler
{
  return self->_switchTabHandler;
}

- (id)deeplinkCompletionHandler
{
  return self->_deeplinkCompletionHandler;
}

- (BOOL)isDeeplinkLaunched
{
  return self->_isDeeplinkLaunched;
}

- (void)setIsDeeplinkLaunched:(BOOL)a3
{
  self->_isDeeplinkLaunched = a3;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (BOOL)appWasForegrounded
{
  return self->_appWasForegrounded;
}

- (void)setAppWasForegrounded:(BOOL)a3
{
  self->_appWasForegrounded = a3;
}

- (BOOL)appWasRunningWithoutJavascript
{
  return self->_appWasRunningWithoutJavascript;
}

- (void)setAppWasRunningWithoutJavascript:(BOOL)a3
{
  self->_appWasRunningWithoutJavascript = a3;
}

- (BOOL)startupOfferProcessingCompleted
{
  return self->_startupOfferProcessingCompleted;
}

- (void)setIsTerminating:(BOOL)a3
{
  self->_isTerminating = a3;
}

- (NSString)sportsTabIdentifier
{
  return self->_sportsTabIdentifier;
}

- (void)setSportsTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sportsTabIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsTabIdentifier, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong((id *)&self->_jetPackController, 0);
  objc_storeStrong((id *)&self->_deferredParsedOpenURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong(&self->_deeplinkCompletionHandler, 0);
  objc_storeStrong(&self->_switchTabHandler, 0);
  objc_storeStrong((id *)&self->_appWindow, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_appController, 0);
}

- (void)_updateTabControllerWithTabBarItems:(char)a1 setSelectedIdentifierFromDefaults:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUITVAppLauncher - Trying to update sidebar with 0 items, ignoring update. Network is reachable = %@", (uint8_t *)&v3, 0xCu);
}

- (void)rootViewControllerForAppController:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUITVAppLauncher - tabBarController does not conform to VUITVAppRootViewController", v1, 2u);
}

@end
