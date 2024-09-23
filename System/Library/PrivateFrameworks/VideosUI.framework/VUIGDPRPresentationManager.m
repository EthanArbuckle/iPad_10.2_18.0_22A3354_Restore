@implementation VUIGDPRPresentationManager

+ (BOOL)shouldShowWelcomeScreen
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  int v12;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.ShouldShowWelcomeScreen", ", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "gdprFirstTimeFlowEnabled"))
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "gdprWhatsNewFlowEnabled");

  if (v5)
  {
LABEL_6:
    objc_msgSend((id)objc_opt_class(), "_sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasShownWelcome");

    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if ((v7 & 1) != 0)
    {
      if (v9)
      {
        LOWORD(v16) = 0;
        v10 = "VUIGDPRPresentationManager - GDPR has already shown because of user defaults override";
LABEL_11:
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v16) = 0;
      v10 = "VUIGDPRPresentationManager - GDPR is shown because of user defaults override";
      goto LABEL_11;
    }

    objc_msgSend((id)objc_opt_class(), "_sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject hasShownWelcome](v11, "hasShownWelcome") ^ 1;
    goto LABEL_13;
  }
  LOBYTE(v12) = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    VUIBoolLogString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR needed? [%@]", (uint8_t *)&v16, 0xCu);

  }
  VUISignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.ShouldShowWelcomeScreen", ", (uint8_t *)&v16, 2u);
  }
LABEL_13:

  return v12;
}

+ (BOOL)showGDPRWelcomeScreen:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "shouldShowWelcomeScreen");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNetworkReachable");

    objc_msgSend((id)objc_opt_class(), "_sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_showIOSWelcomeControllerWithAppContext:offline:", v3, v6 ^ 1u);

  }
  else if ((objc_msgSend(MEMORY[0x1E0DC87F8], "isOptedIn") & 1) == 0)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Starting GAC patch-up flow", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC87F8], "optInUserIfNeededAndRefreshConfig:", &__block_literal_global_161);
  }

  return v4;
}

+ (void)checkGDPRConsentAndPerformRequests:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (+[VUIGDPRPresentationManager shouldShowWelcomeScreen](VUIGDPRPresentationManager, "shouldShowWelcomeScreen"))
  {
    v3 = (void *)requestBlocks;
    if (!requestBlocks)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)requestBlocks;
      requestBlocks = v4;

      v3 = (void *)requestBlocks;
    }
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "addObject:", v6);

  }
  else
  {
    v7[2]();
  }

}

void __52__VUIGDPRPresentationManager_showGDPRWelcomeScreen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    VUIBoolLogString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GAC patch-up flow: Successful OptIn: %@ Err: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (VUIGDPRPresentationManager)init
{
  VUIGDPRPresentationManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIGDPRPresentationManager;
  result = -[VUIGDPRPresentationManager init](&v3, sel_init);
  if (result)
    result->_hasShownWelcome = 0;
  return result;
}

- (void)accept:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkReachable");

  if (v5)
    -[VUIGDPRPresentationManager _handleContinueButton](self, "_handleContinueButton");
  else
    -[VUIGDPRPresentationManager _handleOfflineContinueButton](self, "_handleOfflineContinueButton");
}

+ (void)showOfflineGDPRWelcomeScreen
{
  id v2;

  if (objc_msgSend((id)objc_opt_class(), "shouldShowWelcomeScreen"))
  {
    objc_msgSend((id)objc_opt_class(), "_sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_showIOSWelcomeControllerWithAppContext:offline:", 0, 1);

  }
}

+ (void)acceptGDPRAndSyncWithServers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  +[VUIOfferUtilities registerDeviceForCommerceOffers](VUIOfferUtilities, "registerDeviceForCommerceOffers");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9C0]), "initWithPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  objc_msgSend(v4, "acknowledgePrivacy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke;
  v11[3] = &unk_1E9F9E5B8;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v5, "addErrorBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_6;
  v9[3] = &unk_1E9F98E68;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "addSuccessBlock:", v9);

}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: Privacy acknowledgement failed", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0DC87F8];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_2;
  v2[3] = &unk_1E9F99C68;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "optInUserIfNeededAndRefreshConfig:", v2);

}

void __59__VUIGDPRPresentationManager_acceptGDPRAndSyncWithServers___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    VUIBoolLogString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: Successful OptIn: %@ Err: %@", (uint8_t *)&v10, 0x16u);

  }
  if (a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR flow: failed to opt in: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_11_2);
  return (id)_sharedInstance_sPresentationManager;
}

void __45__VUIGDPRPresentationManager__sharedInstance__block_invoke()
{
  VUIGDPRPresentationManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIGDPRPresentationManager);
  v1 = (void *)_sharedInstance_sPresentationManager;
  _sharedInstance_sPresentationManager = (uint64_t)v0;

}

- (BOOL)isShowing
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[VUIGDPRPresentationManager navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIGDPRPresentationManager navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBeingPresented");
  if (v4)
    v7 = 1;
  else
    v7 = v6;

  return v7;
}

- (void)_showIOSWelcomeControllerWithAppContext:(id)a3 offline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v4 = a4;
  v6 = a3;
  -[VUIGDPRPresentationManager setAppContext:](self, "setAppContext:", v6);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke;
  v7[3] = &unk_1E9FA5158;
  objc_copyWeak(&v8, &location);
  v9 = v4;
  +[VUIGDPRViewControllerFactory createViewController:completion:](VUIGDPRViewControllerFactory, "createViewController:completion:", v4, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  char v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Welcome Controller created. Error:%@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isShowing"))
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - Welcome Controller has already been presented, ignoring this request.", buf, 2u);
    }
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_13;
    v24[3] = &unk_1E9FA5130;
    v25 = *(_BYTE *)(a1 + 40);
    v24[4] = WeakRetained;
    objc_msgSend(v5, "setPrimaryButtonCallback:", v24);
    if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
    {
      +[VideosUI initializeWelcomeScreenControllerPresenterIfNeeded](_TtC8VideosUI8VideosUI, "initializeWelcomeScreenControllerPresenterIfNeeded");
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "welcomeScreenControllerPresenter");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rootViewController");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_dismissAllModalsIfPresent:", v12);
    v9 = v5;
    -[NSObject view](v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Dialog.GDPR"));

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    v16 = (Class *)&off_1E9F97218;
    if (v15)
      v16 = (Class *)0x1E0DC3A40;
    v17 = (void *)objc_msgSend(objc_alloc(*v16), "initWithRootViewController:", v9);
    objc_msgSend(v17, "setModalPresentationStyle:", 2);
    objc_msgSend(v17, "setNavigationBarHidden:", 1);
    objc_msgSend(WeakRetained, "setNavigationController:", v17);
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_2;
    block[3] = &unk_1E9F99000;
    objc_copyWeak(&v23, (id *)buf);
    v21 = v17;
    v22 = v12;
    v18 = v12;
    v19 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

uint64_t __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("targetId");
  v6[1] = CFSTR("targetType");
  v7[0] = CFSTR("continue");
  v7[1] = CFSTR("button");
  v6[2] = CFSTR("actionType");
  v6[3] = CFSTR("dialogId");
  v7[2] = CFSTR("gdprConsent");
  v7[3] = CFSTR("GDPR");
  v6[4] = CFSTR("dialogType");
  v7[4] = CFSTR("GDPR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClick:", v3);

  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v4, "_handleOfflineContinueButton");
  else
    return objc_msgSend(v4, "_handleContinueButton");
}

void __78__VUIGDPRPresentationManager__showIOSWelcomeControllerWithAppContext_offline___block_invoke_2(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "preferredContentSize");
  v3 = v2;
  v5 = v4;
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gdprConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverHeight");
  v9 = v8;

  if (v9 <= 0.0)
    v10 = v5;
  else
    v10 = v9;
  objc_msgSend(a1[4], "setPreferredContentSize:", v3, v10);
  objc_msgSend(a1[5], "presentViewController:animated:completion:", a1[4], 1, 0);
  objc_msgSend(WeakRetained, "setHasShownWelcome:", 1);

}

- (void)_dismissAllModalsIfPresent:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "conformsToProtocol:", &unk_1F0283FC8);
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "currentNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
      objc_msgSend(v5, "dismissAllModals:", &__block_literal_global_76_0);

    v4 = v6;
  }

}

- (id)_currentWindowRootViewController
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleContinueButton
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[2];
  void (*v7)(uint64_t);
  void *v8;
  VUIGDPRPresentationManager *v9;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceGDPRConsentStatus:", 1);

  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v7 = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke;
  v8 = &unk_1E9F98DF0;
  v9 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v7((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_3;
  v5[3] = &unk_1E9F9D528;
  v5[4] = self;
  objc_msgSend((id)objc_opt_class(), "acceptGDPRAndSyncWithServers:", v5);
}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_currentWindowRootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_2;
  v3[3] = &unk_1E9F98DF0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "vui_dismissViewControllerAnimated:completion:", 1, v3);

}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", 0);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURLHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v2, "handleDeferredURLWithAppContext:", WeakRetained);

}

void __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_4;
  v5 = &unk_1E9F98DF0;
  v6 = *(_QWORD *)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  +[VUIJSNotificationCenter showSignupAlertPushNotificationWithAppContext:](VUIJSNotificationCenter, "showSignupAlertPushNotificationWithAppContext:", WeakRetained);

}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURLHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "openedByDeeplink");

  if ((v4 & 1) == 0)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR Accept button -- Check if there is any pending offer to present", v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    +[VUIOfferUtilities fetchAndPresentOffer:sourceEvent:completion:](VUIOfferUtilities, "fetchAndPresentOffer:sourceEvent:completion:", WeakRetained, CFSTR("GDPRJustAccepted"), &__block_literal_global_80);

  }
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, &__block_literal_global_82);

  +[VideosUI handleGDPRDidChangeSignal](_TtC8VideosUI8VideosUI, "handleGDPRDidChangeSignal");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("VUIGDPRUserDidConsentNotification"), 0, 0);

  return +[VUIGDPRPresentationManager _performRequestsIfNeeded](VUIGDPRPresentationManager, "_performRequestsIfNeeded");
}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_5()
{
  return +[VideosUI handleAppDidFinishLoading](_TtC8VideosUI8VideosUI, "handleAppDidFinishLoading");
}

uint64_t __51__VUIGDPRPresentationManager__handleContinueButton__block_invoke_81()
{
  return +[VideosUI initializeGroupActivities](_TtC8VideosUI8VideosUI, "initializeGroupActivities");
}

- (void)_handleOfflineContinueButton
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9C0]), "initWithPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  objc_msgSend(v3, "acknowledgePrivacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke;
  v5[3] = &unk_1E9F9D528;
  v5[4] = self;
  objc_msgSend(v4, "addFinishBlock:", v5);

}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[2];
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v10 = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2;
  v11 = &unk_1E9F9C920;
  v14 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = v5;
  if (objc_msgSend(v7, "isMainThread"))
    v10((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUIGDPRPresentationManager - GDPR offline flow: Privacy acknowledgement success:%d err:%@", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_currentWindowRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_85;
  v7[3] = &unk_1E9F98DF0;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("VUIGDPRUserDidConsentNotification"), 0, 0);

  +[VUIGDPRPresentationManager _performRequestsIfNeeded](VUIGDPRPresentationManager, "_performRequestsIfNeeded");
}

void __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_85(uint64_t a1)
{
  _QWORD block[2];
  uint64_t (*v2)(uint64_t);
  void *v3;
  uint64_t v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v2 = __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2_86;
  v3 = &unk_1E9F98DF0;
  v4 = *(_QWORD *)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__VUIGDPRPresentationManager__handleOfflineContinueButton__block_invoke_2_86(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", 0);
}

+ (void)_performRequestsIfNeeded
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)requestBlocks, "count"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = (id)requestBlocks;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    objc_msgSend((id)requestBlocks, "removeAllObjects", (_QWORD)v7);
  }
}

- (BOOL)hasShownWelcome
{
  return self->_hasShownWelcome;
}

- (void)setHasShownWelcome:(BOOL)a3
{
  self->_hasShownWelcome = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
