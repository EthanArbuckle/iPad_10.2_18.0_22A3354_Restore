@implementation VUIUserEngagementSheetLauncher

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1)
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance___sharedInstance;
}

void __48__VUIUserEngagementSheetLauncher_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIUserEngagementSheetLauncher _init]([VUIUserEngagementSheetLauncher alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (VUIUserEngagementSheetLauncher)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (id)_init
{
  VUIUserEngagementSheetLauncher *v2;
  void *v3;
  uint64_t v4;
  NSString *lastTabIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t firstPromptLaunchNumberAfterGDPR;
  NSObject *v12;
  unint64_t lastPromptLaunchNumberAfterGDPR;
  objc_super v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VUIUserEngagementSheetLauncher;
  v2 = -[VUIUserEngagementSheetLauncher init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("lastSelectedTabBarItemIdentifier"));
    v4 = objc_claimAutoreleasedReturnValue();
    lastTabIdentifier = v2->_lastTabIdentifier;
    v2->_lastTabIdentifier = (NSString *)v4;

    v2->_hasAppLostConnectivity = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleNetworkReachabilityDidChangeNotification_, *MEMORY[0x1E0DC6B70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleTabBarChange_, CFSTR("TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_firstPromptLaunchNumberAfterGDPR = objc_msgSend(v8, "integerForKey:", CFSTR("KettleFirstPromptLaunchNumberAfterGDPR"));

    if (!v2->_firstPromptLaunchNumberAfterGDPR)
      v2->_firstPromptLaunchNumberAfterGDPR = 1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_lastPromptLaunchNumberAfterGDPR = objc_msgSend(v9, "integerForKey:", CFSTR("KettleLastPromptLaunchNumberAfterGDPR"));

    if (!v2->_lastPromptLaunchNumberAfterGDPR)
      v2->_lastPromptLaunchNumberAfterGDPR = 3;
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      firstPromptLaunchNumberAfterGDPR = v2->_firstPromptLaunchNumberAfterGDPR;
      *(_DWORD *)buf = 134217984;
      v17 = firstPromptLaunchNumberAfterGDPR;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - firstPromptLaunchNumberAfterGDPR:%lu", buf, 0xCu);
    }

    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      lastPromptLaunchNumberAfterGDPR = v2->_lastPromptLaunchNumberAfterGDPR;
      *(_DWORD *)buf = 134217984;
      v17 = lastPromptLaunchNumberAfterGDPR;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - lastPromptLaunchNumberAfterGDPR:%lu", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIUserEngagementSheetLauncher;
  -[VUIUserEngagementSheetLauncher dealloc](&v4, sel_dealloc);
}

- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3
{
  self->_hasAppLostConnectivity = 1;
}

- (void)handleAMSEngagementPresentationSheet:(BOOL)a3 isRepromptSupported:(BOOL)a4
{
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[5];
  BOOL v11;

  if (+[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen")|| a3)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - handleAMSEngagementPresentationSheet additional requirements to show sheet not met.", v9, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke;
    v10[3] = &unk_1E9F99D08;
    v10[4] = self;
    v11 = a4;
    objc_msgSend(v7, "getNotificationSettingsWithCompletionHandler:", v10);

  }
}

void __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke_2;
  v9 = &unk_1E9F99CE0;
  objc_copyWeak(&v12, &location);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v5;
  v13 = *(_BYTE *)(a1 + 40);
  v6 = v7;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v8((uint64_t)v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __91__VUIUserEngagementSheetLauncher_handleAMSEngagementPresentationSheet_isRepromptSupported___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - handleAMSEngagementPresentationSheet being called", (uint8_t *)&v25, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("KettleShouldStopShowingAMSSheet"));

  if (!objc_msgSend(*(id *)(a1 + 32), "authorizationStatus")
    && (v5 & 1) == 0
    && (objc_msgSend(WeakRetained, "hasAppLostConnectivity") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "isAnotherSheetShowingToUser") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("KettleNumberOfAppLaunch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v7, "intValue") + 1);
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Total number of launches: %@", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("KettleNumberOfAppLaunch"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "intValue");
    if (objc_msgSend(WeakRetained, "firstPromptLaunchNumberAfterGDPR") == v12)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("KettleFirstPromptTimestamp"));

      if (!*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBool:forKey:", 1, CFSTR("KettleShouldStopShowingAMSSheet"));

      }
      objc_msgSend(*(id *)(a1 + 40), "_showNotificationAuthorizationSheet");
    }
    else if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("KettleFirstPromptTimestamp"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "timeIntervalSince1970");
      v18 = v17;
      objc_msgSend(v11, "timeIntervalSince1970");
      v20 = v19;
      LODWORD(v15) = objc_msgSend(v8, "intValue");
      if (objc_msgSend(WeakRetained, "lastPromptLaunchNumberAfterGDPR") <= (unint64_t)(int)v15
        && v18 > 0.0
        && v20 - v18 >= 259200.0)
      {
        VUIDefaultLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Reprompting for the notification sheet for the last time.", (uint8_t *)&v25, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setBool:forKey:", 1, CFSTR("KettleShouldStopShowingAMSSheet"));

        objc_msgSend(*(id *)(a1 + 40), "_showNotificationAuthorizationSheet");
      }

    }
    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "lastTabIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v24;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Current tab identifier:%@", (uint8_t *)&v25, 0xCu);

    }
  }

}

- (void)_handleTabBarChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("VUIMetricsTabBarItemNotificationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIUserEngagementSheetLauncher setLastTabIdentifier:](self, "setLastTabIdentifier:", v4);

}

- (void)_showNotificationAuthorizationSheet
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CFDCC0]);
  objc_msgSend(v3, "setAuthorizationOptions:", 7);
  +[VUIAuthenticationManager DSID](VUIAuthenticationManager, "DSID");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("pageContext");
  -[VUIUserEngagementSheetLauncher lastTabIdentifier](self, "lastTabIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E9FF3598;
  if (v5)
    v8 = (const __CFString *)v5;
  else
    v8 = &stru_1E9FF3598;
  v17[0] = v8;
  v17[1] = CFSTR("xp_amp_tv_main");
  v16[1] = CFSTR("topic");
  v16[2] = CFSTR("dsId");
  if (v4)
    v7 = v4;
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setMetricsOverlay:", v9);
  v10 = objc_alloc(MEMORY[0x1E0CFDCC8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:options:", v12, v3);

  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "requestAuthorization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__VUIUserEngagementSheetLauncher__showNotificationAuthorizationSheet__block_invoke;
  v15[3] = &unk_1E9F99D30;
  v15[4] = self;
  objc_msgSend(v14, "addFinishBlock:", v15);

}

void __69__VUIUserEngagementSheetLauncher__showNotificationAuthorizationSheet__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "code");
    objc_msgSend(*(id *)(a1 + 32), "lastTabIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - Promise result. Error description:%@; error code:%ld; tab identifier:%@",
      (uint8_t *)&v12,
      0x20u);

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUserNotificationAction:", objc_msgSend(v5, "authorizationStatus"));
  }
  else if (objc_msgSend(v6, "code") == 11)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - User has already granted or denied notification authorization", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_deleteKeysUsedForSheetPresentation");
  }

}

- (void)_deleteKeysUsedForSheetPresentation
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("KettleNumberOfAppLaunch"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("KettleFirstPromptTimestamp"));

}

- (void)_handleUserNotificationAction:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - User notification authorization status:%ld", (uint8_t *)&v6, 0xCu);
  }

  if ((unint64_t)(a3 - 1) <= 1)
    -[VUIUserEngagementSheetLauncher _deleteKeysUsedForSheetPresentation](self, "_deleteKeysUsedForSheetPresentation");
}

- (BOOL)isAnotherSheetShowingToUser
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10 != 0;

    }
  }

  return v6;
}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__VUIUserEngagementSheetLauncher_handleEngagementRequest_completion___block_invoke;
  v9[3] = &unk_1E9F99D58;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __69__VUIUserEngagementSheetLauncher_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CFDE60]);
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithRequest:bag:presentingViewController:", v4, v5, v2);

    objc_msgSend(v6, "presentEngagement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFinishBlock:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIUserEngagementSheetLauncher - failed to handle dialog request because there is no presenting view controller", v9, 2u);
    }

  }
}

- (BOOL)hasAppLostConnectivity
{
  return self->_hasAppLostConnectivity;
}

- (void)setHasAppLostConnectivity:(BOOL)a3
{
  self->_hasAppLostConnectivity = a3;
}

- (NSString)lastTabIdentifier
{
  return self->_lastTabIdentifier;
}

- (void)setLastTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastTabIdentifier, a3);
}

- (unint64_t)firstPromptLaunchNumberAfterGDPR
{
  return self->_firstPromptLaunchNumberAfterGDPR;
}

- (void)setFirstPromptLaunchNumberAfterGDPR:(unint64_t)a3
{
  self->_firstPromptLaunchNumberAfterGDPR = a3;
}

- (unint64_t)lastPromptLaunchNumberAfterGDPR
{
  return self->_lastPromptLaunchNumberAfterGDPR;
}

- (void)setLastPromptLaunchNumberAfterGDPR:(unint64_t)a3
{
  self->_lastPromptLaunchNumberAfterGDPR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTabIdentifier, 0);
}

@end
