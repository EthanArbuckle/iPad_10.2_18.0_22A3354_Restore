@implementation VUIGDPRViewControllerFactory

+ (void)createViewController:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD block[2];
  void (*v16)(uint64_t);
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  _QWORD v22[2];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  if (!WLKIsRegulatedSKU())
  {
    if (!v4)
    {
      v12 = (void *)objc_opt_class();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2;
      v13[3] = &unk_1E9F9B480;
      v8 = (id *)v14;
      v14[0] = v6;
      v14[1] = a1;
      objc_msgSend(v12, "isFullTVAppEnabledWithCompletion:", v13);
      goto LABEL_16;
    }
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning Library-only controller (offline)", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v16 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_5;
    v17 = &unk_1E9F99A10;
    v8 = (id *)v18;
    v18[0] = v6;
    v18[1] = a1;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v16((uint64_t)block);
      goto LABEL_16;
    }
    v10 = MEMORY[0x1E0C80D38];
    v11 = block;
LABEL_15:
    dispatch_async(v10, v11);
    goto LABEL_16;
  }
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning China controller", buf, 2u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke;
  v21 = &unk_1E9F99A10;
  v8 = (id *)v22;
  v22[0] = v6;
  v22[1] = a1;
  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v10 = MEMORY[0x1E0C80D38];
    v11 = v19;
    goto LABEL_15;
  }
  v20((uint64_t)v19);
LABEL_16:

}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_chinaController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_libraryOnlyController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[2];
  _QWORD block[2];
  void (*v31)(uint64_t);
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  void (*v35)(uint64_t);
  void *v36;
  _QWORD v37[2];
  uint8_t buf[16];

  v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning Library-only controller (bag-driven)", buf, 2u);
    }

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v35 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_7;
    v36 = &unk_1E9F99A10;
    v7 = (id *)v37;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v37[0] = v8;
    v37[1] = v9;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v35((uint64_t)v34);
      goto LABEL_30;
    }
    v17 = MEMORY[0x1E0C80D38];
    v18 = v34;
LABEL_22:
    dispatch_async(v17, v18);
    goto LABEL_30;
  }
  v10 = objc_msgSend(MEMORY[0x1E0CFD9C0], "hasPreviouslyAcknowledgedPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "gdprWhatsNewFlowEnabled");

  if (v12)
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Overriding hasSeenGDPR flag from using user defaults", buf, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "gdprFirstTimeFlowEnabled");

  if (v20)
  {
    VUIDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Overriding hasSeenGDPR flag from using user defaults", buf, 2u);
    }

  }
  else if (v10)
  {
LABEL_11:
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v31 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_10;
    v32 = &unk_1E9F99A10;
    v7 = (id *)v33;
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v33[0] = v15;
    v33[1] = v16;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v31((uint64_t)block);
      goto LABEL_30;
    }
    v17 = MEMORY[0x1E0C80D38];
    v18 = block;
    goto LABEL_22;
  }
  VUIDefaultLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning default controller", buf, 2u);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_11;
  v27 = &unk_1E9F9F418;
  v7 = (id *)v29;
  v23 = *(id *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v29[0] = v23;
  v29[1] = v24;
  v28 = v5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v26((uint64_t)v25);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v25);

LABEL_30:
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_libraryOnlyController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_whatsNewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_defaultController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 32));

}

+ (id)_defaultController
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  VUIGDPRViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  VUIGDPRViewController *v12;

  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isVision"))
  {
    objc_msgSend(a1, "_appImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isPad") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0DC69D0], "isVision"))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("WELCOME_TITLE_1");
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("WELCOME_TITLE");
  }
  objc_msgSend(v4, "localizedStringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VUIGDPRViewController alloc];
  objc_msgSend(a1, "_features");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("WELCOME_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSUIOnboardingViewController initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:](v8, "initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:", v3, v7, v9, v11, CFSTR("com.apple.onboarding.tvapp"));

  return v12;
}

+ (id)_whatsNewController
{
  void *v3;
  VUIGDPRViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VUIGDPRViewController *v10;

  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isVision"))
  {
    objc_msgSend(a1, "_appImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = [VUIGDPRViewController alloc];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("WELCOME_WN_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_whatsNewFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("WELCOME_WN_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIOnboardingViewController initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:](v4, "initWithHeaderImage:titleText:features:primaryButtonText:privacyLinkBundleIdentifier:", v3, v6, v7, v9, CFSTR("com.apple.onboarding.tvapp"));

  return v10;
}

+ (id)_chinaController
{
  VUIGDPRViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIGDPRViewController *v11;

  v3 = [VUIGDPRViewController alloc];
  objc_msgSend(a1, "_appImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("WELCOME_TITLE_VIDEOS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("WELCOME_DESCRIPTION_VIDEOS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("WELCOME_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUIOnboardingViewController initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkBundleIdentifier:](v3, "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkBundleIdentifier:", v4, v6, v8, v10, CFSTR("com.apple.onboarding.tvapp"));

  return v11;
}

+ (id)_libraryOnlyController
{
  VUIGDPRViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIGDPRViewController *v11;

  v3 = [VUIGDPRViewController alloc];
  objc_msgSend(a1, "_appImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("WELCOME_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("WELCOME_DESCRIPTION_VIDEOS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("WELCOME_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUIOnboardingViewController initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkBundleIdentifier:](v3, "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkBundleIdentifier:", v4, v6, v8, v10, CFSTR("com.apple.onboarding.tvapp"));

  return v11;
}

+ (id)_features
{
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = objc_msgSend(MEMORY[0x1E0DC69D0], "isVision");
  v4 = objc_alloc(MEMORY[0x1E0CFDE98]);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("appletvplus.logo"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE1_VISION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION1_VISION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v4, "initWithImage:titleText:descriptionText:", v6, v8, v10);

    v12 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(a1, "_tintedVision3DWithRenderingMode:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE2_VISION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION2_VISION"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v12, "initWithImage:titleText:descriptionText:", v13, v15, v17);

    v19 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(a1, "_tintedPopcornWithRenderingMode:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE3_VISION"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION3_VISION"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v19, "initWithImage:titleText:descriptionText:", v20, v22, v24);
  }
  else
  {
    objc_msgSend(a1, "_tintedAppleTVPlusImageWithRenderingMode:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE1"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION1"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v4, "initWithImage:titleText:descriptionText:", v26, v28, v30);

    v31 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(a1, "_tintedMLSImageWithRenderingMode:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE2"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v31, "initWithImage:titleText:descriptionText:", v32, v34, v36);

    v37 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("film"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE3"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION3"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v37, "initWithImage:titleText:descriptionText:", v21, v23, v38);

  }
  objc_msgSend(a1, "_disclaimerFeature");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v11);
  objc_msgSend(v40, "addObject:", v18);
  objc_msgSend(v40, "addObject:", v25);
  objc_msgSend(v40, "addObject:", v39);
  v41 = (void *)objc_msgSend(v40, "copy");

  return v41;
}

+ (id)_whatsNewFeatures
{
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v47;
  uint8_t v48[16];
  uint8_t buf[16];

  v3 = objc_msgSend(MEMORY[0x1E0DC69D0], "isVision");
  v4 = objc_alloc(MEMORY[0x1E0CFDE98]);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("appletvplus.logo"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE1_VISION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION1_VISION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v4, "initWithImage:titleText:descriptionText:", v6, v8, v10);

    v11 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(a1, "_tintedVision3DWithRenderingMode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE2_VISION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION2_VISION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithImage:titleText:descriptionText:", v12, v14, v16);

    v18 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(a1, "_tintedPopcornWithRenderingMode:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_TITLE3_VISION"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:", CFSTR("WELCOME_FEATURE_DESCRIPTION3_VISION"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v18, "initWithImage:titleText:descriptionText:", v19, v21, v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("appletvplus.logo"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_TITLE1"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_DESCRIPTION1"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v4, "initWithImage:titleText:descriptionText:", v26, v28, v30);

    v31 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("captions.bubble"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_TITLE2"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_DESCRIPTION2"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v31, "initWithImage:titleText:descriptionText:", v33, v35, v37);

    v38 = objc_alloc(MEMORY[0x1E0CFDE98]);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_tintedSymbolNamed:withHighlightColor:", CFSTR("person.wave.2.fill"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_TITLE3"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("WHATSNEW_FEATURE_DESCRIPTION3"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v38, "initWithImage:titleText:descriptionText:", v20, v22, v39);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isVision"))
  {
    objc_msgSend(a1, "_disclaimerFeature");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v47);
    objc_msgSend(v40, "addObject:", v17);
    objc_msgSend(v40, "addObject:", v24);
    objc_msgSend(v40, "addObject:", v41);

  }
  else
  {
    v42 = objc_msgSend((id)objc_opt_class(), "isInSightAvailable");
    VUIDefaultLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - InSight is available in store front", buf, 2u);
      }

      objc_msgSend(v40, "addObject:", v47);
    }
    else
    {
      if (v44)
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - InSight is not available in store front", v48, 2u);
      }

    }
    objc_msgSend(v40, "addObject:", v17);
    objc_msgSend(v40, "addObject:", v24);
  }
  v45 = (void *)objc_msgSend(v40, "copy");

  return v45;
}

+ (id)_disclaimerFeature
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = objc_msgSend(MEMORY[0x1E0DC69D0], "isVision");
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("WELCOME_FEATURE_DISCLAIMER1");
  else
    v5 = CFSTR("WELCOME_FEATURE_DISCLAIMER");
  objc_msgSend(v3, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CFDE98]);
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(v7, "initWithImage:titleText:descriptionText:", v8, &stru_1E9FF3598, v6);

  return v9;
}

+ (id)_appImage
{
  const __CFString *v2;

  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isVision"))
    v2 = CFSTR("Onboarding-AppIcon-Circular");
  else
    v2 = CFSTR("Onboarding-AppIcon");
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", v2);
}

+ (id)_tintedVUIGlyphNamed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_imageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  return v7;
}

+ (id)_tintedAppleTVPlusImageWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("appletvplus.rectangle.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  return v11;
}

+ (id)_tintedMLSImageWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("mls.crest.outline"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return v8;
}

+ (id)_tintedHomeFillImageWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("home.fill.bold"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  return v11;
}

+ (id)_tintedSymbolNamed:(id)a3 withHighlightColor:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a4;
  objc_msgSend(v5, "_systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  return v10;
}

+ (id)_tintedBagFillImageWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("bag.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  return v11;
}

+ (id)_tintedPlusImageWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("plus"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  return v11;
}

+ (id)_tintedPopcornWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("popcorn.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return v8;
}

+ (id)_tintedVision3DWithRenderingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("immersive.badge.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return v8;
}

+ (id)getStoreFrontID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_localiTunesAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "ams_storefront");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_12;
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (!objc_msgSend(v9, "count"))
    {
LABEL_12:
      v8 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
LABEL_15:

  return v8;
}

+ (BOOL)isInSightAvailable
{
  void *v2;
  int v3;

  objc_msgSend((id)objc_opt_class(), "getStoreFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend(&unk_1EA0BB8F8, "containsObject:", v2) ^ 1;
  else
    LOBYTE(v3) = 1;

  return v3;
}

@end
