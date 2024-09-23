@implementation VUIActionPunchout

- (VUIActionPunchout)initWithContextData:(id)a3 appContext:(id)a4
{
  id v6;
  id v7;
  VUIActionPunchout *v8;
  VUIActionPunchout *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *punchoutURL;
  uint64_t v14;
  NSURL *v15;
  void *v16;
  uint64_t v17;
  WLKChannelDetails *channelDetails;
  void *v19;
  char v20;
  uint64_t v21;
  NSString *externalID;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *canonicalID;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  NSString *mediaType;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  VUIContentRating *contentRating;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  NSURL *v42;
  id v44;
  objc_super v45;

  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)VUIActionPunchout;
  v8 = -[VUIActionPunchout init](&v45, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isPlaybackURL = 1;
    objc_storeStrong((id *)&v8->_appContext, a4);
    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("punchoutOfferData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldPunchOutAfterAppInstallation = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", CFSTR("shouldPunchOutAfterAppInstallation"), 1);
    v9->_shouldForceVPPAPrompt = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", CFSTR("shouldForceVPPAPrompt"), 0);
    objc_msgSend(v10, "vui_numberForKey:", CFSTR("consentCancelButtonType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_consentCancelButtonType = (int)objc_msgSend(v11, "intValue");

    objc_msgSend(v10, "vui_URLForKey:", CFSTR("playUrl"));
    v12 = objc_claimAutoreleasedReturnValue();
    punchoutURL = v9->_punchoutURL;
    v9->_punchoutURL = (NSURL *)v12;

    if (!v9->_punchoutURL)
    {
      v9->_isPlaybackURL = 0;
      objc_msgSend(v10, "vui_URLForKey:", CFSTR("openUrl"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v9->_punchoutURL;
      v9->_punchoutURL = (NSURL *)v14;

    }
    objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("channel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC8770]), "initWithDictionary:", v16);
    channelDetails = v9->_channelDetails;
    v9->_channelDetails = (WLKChannelDetails *)v17;

    objc_msgSend(v10, "vui_numberForKey:", CFSTR("isEntitledToPlay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = objc_msgSend(v19, "BOOLValue");
    else
      v20 = 0;
    v9->_isEntitledToPlay = v20;
    objc_msgSend(v10, "vui_stringForKey:", CFSTR("externalId"));
    v21 = objc_claimAutoreleasedReturnValue();
    externalID = v9->_externalID;
    v9->_externalID = (NSString *)v21;

    objc_msgSend(v10, "vui_stringForKey:", CFSTR("referenceId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(v10, "vui_stringForKey:", CFSTR("id"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v9->_referenceID, v24);
    if (!v23)

    objc_msgSend(v10, "vui_stringForKey:", CFSTR("canonicalId"));
    v25 = objc_claimAutoreleasedReturnValue();
    canonicalID = v9->_canonicalID;
    v9->_canonicalID = (NSString *)v25;

    objc_msgSend(v10, "vui_stringForKey:", CFSTR("contentTitle"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (__CFString *)v27;
    else
      v29 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v9->_contentTitle, v29);

    v9->_isAdultContent = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", CFSTR("isAdultContent"), 0);
    objc_msgSend(v10, "vui_stringForKey:", CFSTR("mediaType"));
    v30 = objc_claimAutoreleasedReturnValue();
    mediaType = v9->_mediaType;
    v9->_mediaType = (NSString *)v30;

    v9->_shouldAvoidInstallSheet = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("shouldAvoidAppInstallSheet"), 0);
    objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("playbackMetadata"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "vui_stringForKey:", CFSTR("ratingSystem"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "vui_numberForKey:", CFSTR("ratingValue"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedLongValue");

    objc_msgSend(v32, "vui_stringForKey:", CFSTR("ratingName"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v33, v36, v35, 0);
    contentRating = v9->_contentRating;
    v9->_contentRating = (VUIContentRating *)v37;

    if (v33)
    {
      v39 = objc_msgSend(v33, "length");
      v40 = 0;
      if (v39 && v36)
        v40 = objc_msgSend(v36, "length") != 0;
    }
    else
    {
      v40 = 0;
    }
    v9->_shouldRunPreflightManager = v40;
    if (!v9->_punchoutURL)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("app://"));
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v9->_punchoutURL;
      v9->_punchoutURL = (NSURL *)v41;

    }
    v7 = v44;
  }

  return v9;
}

- (BOOL)canPerformNow
{
  if (-[VUIActionPunchout _isValidAppInstalled](self, "_isValidAppInstalled"))
    return 1;
  else
    return !-[VUIActionPunchout shouldAvoidInstallSheet](self, "shouldAvoidInstallSheet");
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (-[VUIActionPunchout shouldRunPreflightManager](self, "shouldRunPreflightManager"))
  {
    +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentingController:", v9);

    -[VUIActionPunchout contentRating](self, "contentRating");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentRating:", v10);

    objc_msgSend(v8, "setRestrictionsCheckType:", 0);
    objc_initWeak(location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__VUIActionPunchout_performWithTargetResponder_completionHandler___block_invoke;
    v12[3] = &unk_1E9FA3910;
    objc_copyWeak(&v14, location);
    v13 = v7;
    objc_msgSend(v8, "preflightWithOptions:completion:", 1, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);

  }
  else
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager:: skipping due to no ratings data", (uint8_t *)location, 2u);
    }

    -[VUIActionPunchout _continueInstallFlowAfterPreflight:](self, "_continueInstallFlowAfterPreflight:", v7);
  }

}

void __66__VUIActionPunchout_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_continueInstallFlowAfterPreflight:", v5);
  else
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (void)checkVppaStatus:(id)a3
{
  id v4;
  void *v5;
  WLKChannelDetails *channelDetails;
  unint64_t consentCancelButtonType;
  _BOOL8 shouldForceVPPAPrompt;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  channelDetails = self->_channelDetails;
  consentCancelButtonType = self->_consentCancelButtonType;
  shouldForceVPPAPrompt = self->_shouldForceVPPAPrompt;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__VUIActionPunchout_checkVppaStatus___block_invoke;
  v10[3] = &unk_1E9FA3938;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "startVPPAConsentFlow:consentCancelButtonType:shouldForceVPPAPrompt:completion:", channelDetails, consentCancelButtonType, shouldForceVPPAPrompt, v10);

}

void __37__VUIActionPunchout_checkVppaStatus___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD);
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  char v17;

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __37__VUIActionPunchout_checkVppaStatus___block_invoke_2;
  v15 = &unk_1E9FA11D0;
  v17 = a3;
  v16 = *(id *)(a1 + 40);
  v6 = _Block_copy(&v12);
  if ((a2 & 1) == 0)
  {
    v7 = *(_QWORD **)(a1 + 40);
    v8 = (void (*)(_QWORD *, _QWORD))v7[2];
    goto LABEL_10;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidAppInstalled", v12, v13, v14, v15))
  {
    +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAppInstallationAllowed");

    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v11, "_startAppInstallFlow:completionHandler:", a3, v6);
      goto LABEL_11;
    }
    objc_msgSend(v11, "showAPPInstallRestrictedErrorAlert");
    v8 = (void (*)(_QWORD *, _QWORD))v6[2];
    v7 = v6;
LABEL_10:
    v8(v7, 0);
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldPunchOutAfterAppInstallation"))
    objc_msgSend(*(id *)(a1 + 32), "_openAirplayPicker:", v6);
  else
    ((void (*)(_QWORD *, uint64_t))v6[2])(v6, 1);
LABEL_11:

}

uint64_t __37__VUIActionPunchout_checkVppaStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
  {
    +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadConfigurationAfterVPPAChange");

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)showAPPInstallRestrictedErrorAlert
{
  _QWORD block[2];
  void (*v3)(uint64_t);
  void *v4;
  VUIActionPunchout *v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v3 = __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke;
  v4 = &unk_1E9F98DF0;
  v5 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v3((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke(uint64_t a1)
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
  id v11;

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:", CFSTR("APP_INSTALL_RESTRICTED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", 0, v3, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("SETTINGS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v5, 0, &__block_literal_global_144);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addAction:", v6);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addAction:", v9);

  objc_msgSend(*(id *)(a1 + 32), "topPresentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", v10, 1, 0);

}

void __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)_startAppInstallFlow:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  if (v4 && (-[WLKChannelDetails isConsented](self->_channelDetails, "isConsented") & 1) == 0)
  {
    +[VUIVPPAManager sharedInstance](VUIVPPAManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadConfigurationAfterVPPAChange");

  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke;
  v9[3] = &unk_1E9F99650;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[VUIActionPunchout _presentASCSingleAppInstaller:](self, "_presentASCSingleAppInstaller:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIFederatedAppDidInstallNotification"), WeakRetained[3], 0);

      v6 = objc_msgSend(WeakRetained, "shouldPunchOutAfterAppInstallation");
      v7 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        objc_msgSend(WeakRetained, "_openPunchoutURL:afterInstallation:", v7, 1);
      }
      else if (v7)
      {
        (*(void (**)(_QWORD, uint64_t))(v7 + 16))(*(_QWORD *)(a1 + 32), 1);
      }
    }
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);

    if (*(_QWORD *)(a1 + 32))
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);

      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
    }
  }

}

- (void)_presentASCSingleAppInstaller:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  VUIActionPunchout *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke;
  v9 = &unk_1E9F99D58;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v7);

}

void __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke(uint64_t a1)
{
  VUIASCNavigationViewController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  VUIASCNavigationViewController *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = [VUIASCNavigationViewController alloc];
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke_2;
  v9[3] = &unk_1E9F98E18;
  v10 = v3;
  v6 = -[VUIASCNavigationViewController initWithChannelDetails:punchoutAction:shouldHandleVPPA:onFlowComplete:](v2, "initWithChannelDetails:punchoutAction:shouldHandleVPPA:onFlowComplete:", v5, v4, 0, v9);
  objc_storeStrong((id *)&sASCNavigationController, v6);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controllerPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_62_0);

}

void __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke_2(uint64_t a1)
{
  void *v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)sASCNavigationController;
  sASCNavigationController = 0;

}

- (void)_openAirplayPicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  VUIActionPunchout *v11;
  id v12;

  v4 = a3;
  -[WLKChannelDetails appBundleIDs](self->_channelDetails, "appBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isEntitledToPlay && objc_msgSend(v6, "length"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v8 = __40__VUIActionPunchout__openAirplayPicker___block_invoke;
    v9 = &unk_1E9F99778;
    v10 = v6;
    v11 = self;
    v12 = v4;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v8((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[VUIActionPunchout _openPunchoutURL:afterInstallation:](self, "_openPunchoutURL:afterInstallation:", v4, 0);
  }

}

void __40__VUIActionPunchout__openAirplayPicker___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__30;
  v11 = __Block_byref_object_dispose__30;
  v12 = (id)objc_opt_new();
  v2 = (void *)v8[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VUIActionPunchout__openAirplayPicker___block_invoke_64;
  v4[3] = &unk_1E9FA39A0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = &v7;
  objc_msgSend(v2, "willBeginPlaybackFromAppWithBundleID:completionHandler:", v3, v4);

  _Block_object_dispose(&v7, 8);
}

void __40__VUIActionPunchout__openAirplayPicker___block_invoke_64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2 == 2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_openPunchoutURL:afterInstallation:", *(_QWORD *)(a1 + 40), 0);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)_showErrorMessageAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  id v30;

  v30 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionPunchout channelDetails](self, "channelDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("PUNCHOUT_FAILED_ERROR"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIActionPunchout channelDetails](self, "channelDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setMessage:", v13);
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:", CFSTR("PUNCHOUT_FAILED_GENERIC_ERROR"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMessage:", v14);

  }
  objc_msgSend(v30, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D22DC0]))
    goto LABEL_11;
  v16 = objc_msgSend(v30, "code");

  if (v16 == 1)
  {
    objc_msgSend(v30, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D22CD0]))
      {
LABEL_10:

        goto LABEL_11;
      }
      v19 = objc_msgSend(v15, "code");

      if (v19 == 5)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:", CFSTR("TRANSACTION_RESTRICTED_PUNCHOUT"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMessage:", v21);

        v22 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:", CFSTR("SETTINGS"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, &__block_literal_global_78);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAction:", v24);

        goto LABEL_10;
      }
    }
LABEL_11:

  }
  v25 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:", CFSTR("OK"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v28);

  -[VUIActionPunchout topPresentedViewController](self, "topPresentedViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentViewController:animated:completion:", v4, 1, 0);

}

void __44__VUIActionPunchout__showErrorMessageAlert___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)_openPunchoutURL:(id)a3 afterInstallation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void (**v27)(void);
  _BOOL4 v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(void);
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  _QWORD aBlock[5];
  id v40;
  id v41;
  id v42;

  v4 = a4;
  v6 = a3;
  -[VUIActionPunchout punchoutURL](self, "punchoutURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionPunchout channelDetails](self, "channelDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && v7)
  {
    v28 = v4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke;
    aBlock[3] = &unk_1E9FA39E8;
    aBlock[4] = self;
    v11 = v7;
    v40 = v11;
    v12 = v10;
    v41 = v12;
    v42 = v6;
    v29 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    objc_msgSend(v11, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("app"));

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_91;
      v35[3] = &unk_1E9F9FF48;
      objc_copyWeak(&v37, &location);
      v36 = v29;
      objc_msgSend(v16, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v12, 0, v35);

      objc_destroyWeak(&v37);
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2;
      v32[3] = &unk_1E9F99778;
      v32[4] = self;
      v18 = v11;
      v33 = v18;
      v34 = v29;
      v27 = (void (**)(void))_Block_copy(v32);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v18, 0);
      objc_msgSend(v19, "scheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("https")) & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend(v19, "scheme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("http"));

        v22 = v25 ^ 1;
      }

      if (!v28 || (v22 & 1) != 0)
      {
        v27[2]();
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0CA5838];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_106;
        v30[3] = &unk_1E9F99448;
        v31 = v27;
        objc_msgSend(v26, "afterAppLinksBecomeAvailableForURL:limit:performBlock:", v18, -1, v30);

      }
    }
    objc_destroyWeak(&location);

  }
  else
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[VUIActionPunchout _openPunchoutURL:afterInstallation:].cold.1();

    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showErrorMessageAlert:", v5);
  }
  else if (v6)
  {
    +[VUIMetricsMediaEvent recordPunchout:isUrlForPlay:](VUIMetricsMediaEvent, "recordPunchout:isUrlForPlay:", v6, objc_msgSend(v6, "isPlaybackURL"));
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "punchoutURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExitEventDestinationUrl:", v11);

    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v13;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "DropOnTab: resetting last playback date %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("lastPlaybackDate"));

    if (objc_msgSend(v7, "isPlaybackURL"))
    {
      v16 = (void *)MEMORY[0x1E0CB3998];
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v42 = a1;
        v43 = v7;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v41 = v18;
        objc_msgSend(v18, "queryItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v20)
        {
          v21 = v20;
          v22 = 0;
          v23 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v45 != v23)
                objc_enumerationMutation(v19);
              v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v25, "name");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqual:", CFSTR("resumeTime"));

              if (v27)
              {
                objc_msgSend(v25, "value");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v28, "integerValue");

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v21);
        }
        else
        {
          v22 = 0;
        }

        a1 = v42;
        v7 = v43;
        v18 = v41;
      }
      else
      {
        v22 = 0;
      }
      v29 = objc_alloc_init(MEMORY[0x1E0DC87B8]);
      objc_msgSend(v7, "channelDetails");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "channelID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setChannelID:", v31);

      objc_msgSend(v7, "channelDetails");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setConsented:", objc_msgSend(v32, "isConsented"));

      objc_msgSend(v7, "punchoutURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUrl:", v33);

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPunchoutTime:", v34);

      objc_msgSend(v29, "setBundleID:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v7, "canonicalID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCanonicalID:", v35);

      objc_msgSend(v7, "channelDetails");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "appAdamIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAppAdamID:", v38);

      objc_msgSend(v7, "externalID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setExternalContentID:", v39);

      objc_msgSend(v29, "setResumeTimeSeconds:", v22);
      objc_msgSend(MEMORY[0x1E0DC87B0], "defaultFederatedAnalyticsReporter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "reportPunchout:", v29);

    }
  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v5 == 0);

}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_91_cold_1();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_92;
  v10 = &unk_1E9FA1900;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v6 = v4;
  v11 = v6;
  v7 = v8;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v9((uint64_t)v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v13);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_92(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  if (objc_msgSend(*(id *)(a1 + 32), "isPlaybackURL"))
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", &unk_1EA0BC378);
    objc_msgSend(v3, "setObject:forKey:", &unk_1EA0BC378, *MEMORY[0x1E0D22D60]);
  }
  objc_msgSend(v2, "setFrontBoardOptions:", v3);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3;
  v7[3] = &unk_1E9FA3A10;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, v2, v7);

}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[2];
  uint64_t (*v11)(_QWORD *);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3_cold_1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v11 = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_99;
  v12 = &unk_1E9F9C588;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v14 = v7;
  v15 = v6;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = v4;
  if (objc_msgSend(v8, "isMainThread"))
    v11(block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_99(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_106_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_isValidAppInstalled
{
  WLKChannelDetails *channelDetails;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  channelDetails = self->_channelDetails;
  if (channelDetails
    && (-[WLKChannelDetails appBundleIDs](channelDetails, "appBundleIDs"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WLKChannelDetails appBundleIDs](self->_channelDetails, "appBundleIDs", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "applicationIsInstalled:", v11);

            if (v13)
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, 0);
              -[WLKChannelDetails minRequiredAppVersion](self->_channelDetails, "minRequiredAppVersion");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "shortVersionString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16 && objc_msgSend(v16, "compare:options:", v17, 64) == 1)
                LOBYTE(v14) = 0;
              else
                v14 = objc_msgSend(v15, "isPlaceholder") ^ 1;

              goto LABEL_19;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          continue;
        break;
      }
    }
    LOBYTE(v14) = 0;
LABEL_19:

  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (id)topPresentedViewController
{
  return +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (void)setPunchoutURL:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutURL, a3);
}

- (BOOL)isPlaybackURL
{
  return self->_isPlaybackURL;
}

- (void)setIsPlaybackURL:(BOOL)a3
{
  self->_isPlaybackURL = a3;
}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (void)setChannelDetails:(id)a3
{
  objc_storeStrong((id *)&self->_channelDetails, a3);
}

- (BOOL)isEntitledToPlay
{
  return self->_isEntitledToPlay;
}

- (void)setIsEntitledToPlay:(BOOL)a3
{
  self->_isEntitledToPlay = a3;
}

- (BOOL)isAdultContent
{
  return self->_isAdultContent;
}

- (void)setIsAdultContent:(BOOL)a3
{
  self->_isAdultContent = a3;
}

- (BOOL)shouldPunchOutAfterAppInstallation
{
  return self->_shouldPunchOutAfterAppInstallation;
}

- (void)setShouldPunchOutAfterAppInstallation:(BOOL)a3
{
  self->_shouldPunchOutAfterAppInstallation = a3;
}

- (BOOL)shouldForceVPPAPrompt
{
  return self->_shouldForceVPPAPrompt;
}

- (void)setShouldForceVPPAPrompt:(BOOL)a3
{
  self->_shouldForceVPPAPrompt = a3;
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_externalID, a3);
}

- (NSString)referenceID
{
  return self->_referenceID;
}

- (void)setReferenceID:(id)a3
{
  objc_storeStrong((id *)&self->_referenceID, a3);
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (BOOL)shouldAvoidInstallSheet
{
  return self->_shouldAvoidInstallSheet;
}

- (void)setShouldAvoidInstallSheet:(BOOL)a3
{
  self->_shouldAvoidInstallSheet = a3;
}

- (BOOL)shouldRunPreflightManager
{
  return self->_shouldRunPreflightManager;
}

- (void)setShouldRunPreflightManager:(BOOL)a3
{
  self->_shouldRunPreflightManager = a3;
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_storeStrong((id *)&self->_contentRating, a3);
}

- (unint64_t)consentCancelButtonType
{
  return self->_consentCancelButtonType;
}

- (void)setConsentCancelButtonType:(unint64_t)a3
{
  self->_consentCancelButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_referenceID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
  objc_storeStrong((id *)&self->_punchoutURL, 0);
}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIActionPunchout::_startAppInstallFlow running completion handler with false", a5, a6, a7, a8, 0);
}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIActionPunchout::_startAppInstallFlow weak self has been deallocated", a5, a6, a7, a8, 0);
}

- (void)_openPunchoutURL:afterInstallation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_14();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1D96EE000, v1, OS_LOG_TYPE_ERROR, "VUIActionPunchout::either punchoutURL or bundleID is nil; URL: [%@] bundleIdentifier:[%@]",
    v2,
    0x16u);
  OUTLINED_FUNCTION_4_9();
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "VUIActionPunchout::openApplicationWithBundleIdentifier returned with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "VUIActionPunchout::openURL returned with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "VUIActionPunchout:: error waiting for site approval: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

@end
