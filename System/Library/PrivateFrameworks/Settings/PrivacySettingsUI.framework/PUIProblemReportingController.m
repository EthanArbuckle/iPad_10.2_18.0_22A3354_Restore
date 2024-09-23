@implementation PUIProblemReportingController

- (id)loadPrivacySettingsBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  SFRuntimeAbsoluteFilePathForPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "load");
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIProblemReportingController;
  -[PUIProblemReportingController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIProblemReportingController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  PUI_BundleForPrivacySettingsFramework();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("PROBLEM_REPORTING"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/PROBLEM_REPORTING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIProblemReportingController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.analytics-and-improvements"), v7, v11, v12);

}

- (void)checkDiagnosticsSessionAvailability
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  PUIProblemReportingController *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  if (!iOSDiagnosticsLibraryCore_frameworkLibrary)
  {
    v12 = xmmword_1EA26BCE0;
    v13 = 0;
    iOSDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iOSDiagnosticsLibraryCore_frameworkLibrary)
    {
      v7 = (void *)abort_report_np();
      free(v7);
    }
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.DiagnosticsSessionAvailibility"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02FEF50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "resume");
  objc_msgSend(v3, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke;
  v8[3] = &unk_1EA26B790;
  v9 = v3;
  v10 = self;
  v6 = v3;
  objc_msgSend(v5, "checkAvailabilityWithReply:", v8);

}

void __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke_2;
    v6[3] = &unk_1EA26B438;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ENHANCED_LOGGING_STATE")))
    v3 = CFSTR("ENHANCED_LOGGING_SESSION_EXPLANATION");
  else
    v3 = CFSTR("START_DIAGNOSTICS_WITH_APPLE_SUPPORT_EXPLANATION");
  PUI_LocalizedStringForProblemReporting(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v4, *MEMORY[0x1E0D80848]);

  v5 = (void *)MEMORY[0x1E0D80498];
  PUI_LocalizedStringForProblemReporting(CFSTR("START_DIAGNOSTICS_WITH_APPLE_SUPPORT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, *(_QWORD *)(a1 + 40), 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ENHANCED_LOGGING_STATE")) & 1) != 0)
  {
    v8 = CFSTR("VIEW_ENHANCED_LOGGING_SESSION");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("IN_CURRENT_SESSION")))
      goto LABEL_9;
    v8 = CFSTR("RESUME_DIAGNOSTICS_WITH_APPLE_SUPPORT");
  }
  PUI_LocalizedStringForProblemReporting(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v9);

LABEL_9:
  objc_msgSend(v7, "setIdentifier:", CFSTR("START_DIAGNOSTICS_WITH_APPLE_SUPPORT"));
  if (objc_msgSend(*(id *)(a1 + 40), "indexOfSpecifierID:", CFSTR("START_DIAGNOSTICS_WITH_APPLE_SUPPORT")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(void **)(a1 + 40);
    v12[0] = v2;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertContiguousSpecifiers:atEndOfGroup:animated:", v11, 0, 1);

  }
}

- (void)launchDiagnosticsSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("diagnostics://"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], 0);

}

+ (BOOL)isProblemReportingEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]) == 1;

  return v3;
}

- (void)showAboutSheetWithTitle:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ProblemReportingAboutController *v11;

  v6 = a4;
  v7 = a3;
  v11 = -[ProblemReportingAboutController initWithTitle:content:]([ProblemReportingAboutController alloc], "initWithTitle:content:", v7, v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v11);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissAboutSheet_);
  -[ProblemReportingAboutController navigationItem](v11, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  -[PUIProblemReportingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)dismissAboutSheet:(id)a3
{
  -[PUIProblemReportingController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showAboutAnalyticsSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.analyticsdevice"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutIdentityVerificationDataSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.identity"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutImproveSiriAnalyticsSheet
{
  id OBPrivacyPresenterClass;
  _QWORD *v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  OBPrivacyPresenterClass = getOBPrivacyPresenterClass();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr;
  v11 = getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr)
  {
    v5 = (void *)OnBoardingKitLibrary();
    v4 = dlsym(v5, "OBPrivacyImproveSiriIdentifier");
    v9[3] = (uint64_t)v4;
    getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(OBPrivacyPresenterClass, "presenterForPrivacySplashWithIdentifier:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v6, "present");

}

- (void)showAboutImproveAssistiveVoiceFeatures
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveastvoice"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutiCloudAnalyticsSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.analyticsicloud"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutAppAnalyticsSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.analyticsapp"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutFitnessPlusDataSheet
{
  id OBPrivacyPresenterClass;
  _QWORD *v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  OBPrivacyPresenterClass = getOBPrivacyPresenterClass();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  v11 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr)
  {
    v5 = (void *)OnBoardingKitLibrary();
    v4 = dlsym(v5, "OBPrivacyImproveFitnessPlusIdentifier");
    v9[3] = (uint64_t)v4;
    getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(OBPrivacyPresenterClass, "presenterForPrivacySplashWithIdentifier:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v6, "present");

}

- (void)showAboutHealthDataSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvehealth"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutHealthRecordsDataSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvehealthrecords"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutWheelchairDataSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.wheelchairmode"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutHandwashingDataSheet
{
  id v3;

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveHandwashing"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)showAboutSafetyDataSheet
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
  {
    objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improveSafetyFeatures"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentingViewController:", self);
    objc_msgSend(v5, "present");

  }
}

- (void)showImproveARLocationAccuracyDataSheet
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getSFSafariViewControllerClass_softClass;
  v19 = getSFSafariViewControllerClass_softClass;
  if (!getSFSafariViewControllerClass_softClass)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = (uint64_t)__getSFSafariViewControllerClass_block_invoke;
    v14 = &unk_1EA26B260;
    v15 = &v16;
    __getSFSafariViewControllerClass_block_invoke((uint64_t)&v11);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v5 = [v4 alloc];
  v11 = 0;
  v12 = (uint64_t)&v11;
  v13 = 0x2020000000;
  v6 = getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr;
  v14 = getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr)
  {
    v7 = (void *)GeoServicesLibrary();
    v6 = dlsym(v7, "GEOVisualLocalizationCrowdsourcingLearnMoreURL");
    *(_QWORD *)(v12 + 24) = v6;
    getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
    v10 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v10);
  }
  ((void (*)(void))v6)();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithURL:", v8);

  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[PUIProblemReportingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)setBoolValue:(BOOL)a3 forIdMSConfigKey:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aa_primaryAppleAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("0");
    if (v6)
      v13 = CFSTR("1");
    v14 = v13;
    v15 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__PUIProblemReportingController_setBoolValue_forIdMSConfigKey_completion___block_invoke;
    v16[3] = &unk_1EA26B7B8;
    v17 = v7;
    v18 = v8;
    objc_msgSend(v15, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v14, v17, v12, v16);

  }
}

void __74__PUIProblemReportingController_setBoolValue_forIdMSConfigKey_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sf_isInternalInstall");

    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v9)
        goto LABEL_11;
      LOWORD(v15) = 0;
      v10 = "Successfully wrote analytics choice to IdMS";
      v11 = v8;
      v12 = 2;
      goto LABEL_10;
    }
    if (!v9)
      goto LABEL_11;
    v13 = *(void **)(a1 + 32);
    v15 = 138412290;
    v16 = v13;
    v10 = "Successfully wrote analytics choice to IdMS for key %@";
  }
  else
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v15 = 138412290;
    v16 = v5;
    v10 = "Failed to write analytics choice to IdMS, error: %@";
  }
  v11 = v8;
  v12 = 12;
LABEL_10:
  _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_11:

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);

}

- (void)updateiCloudAnalyticsForSpecifierID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    objc_initWeak(&location, self);
    v15[0] = CFSTR("com.apple.idms.config.privacy.icloud.data");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke;
    v11[3] = &unk_1EA26B808;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v9, "configurationInfoWithIdentifiers:forAltDSID:completion:", v10, v8, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2;
  v9[3] = &unk_1EA26B7E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "specifierForID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40) || (v6 = *(void **)(a1 + 48)) == 0)
  {
    _PUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2_cold_1(v5);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.privacy.icloud.data"));
    v5 = objc_claimAutoreleasedReturnValue();
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "From idms: iCloud Analytics = %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "setPreferenceValue:specifier:", v5, v4);

  }
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "reloadSpecifier:animated:", v4, 1);

}

- (id)problemReportingEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PUIProblemReportingController isProblemReportingEnabled](PUIProblemReportingController, "isProblemReportingEnabled", a3));
}

- (void)setProblemReportingEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int AppBooleanValue;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  char v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  Boolean keyExistsAndHasValidFormat[9];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sf_isInternalInstall");

  if (v12)
    v13 = v10 == 1;
  else
    v13 = 0;
  if (!v13
    || (keyExistsAndHasValidFormat[0] = 0,
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MCInternalOverrideDiagnosticEnforcement"), (CFStringRef)*MEMORY[0x1E0C9B228], keyExistsAndHasValidFormat), (v8 & 1) != 0)|| AppBooleanValue)
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isPaired");

    if (v15)
    {
      if ((_DWORD)v8)
        v16 = CFSTR("DIAGNOSTICS_MIRRORED_ALERT_TITLE_ON");
      else
        v16 = CFSTR("DIAGNOSTICS_MIRRORED_ALERT_TITLE_OFF");
      PUI_LocalizedStringForProblemReporting(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForProblemReporting(CFSTR("DIAGNOSTICS_MIRRORED_ALERT_CANCEL"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_2;
      v35[3] = &unk_1EA26B688;
      v35[4] = self;
      v36 = v7;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v22);

      v23 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForProblemReporting(CFSTR("DIAGNOSTICS_MIRRORED_ALERT_OK"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v21;
      v33[1] = 3221225472;
      v33[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_3;
      v33[3] = &unk_1EA26B830;
      v33[4] = self;
      v34 = v8;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v25);

      -[PUIProblemReportingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      -[PUIProblemReportingController setProblemReportingEnabled:](self, "setProblemReportingEnabled:", v8);
      if (PUIIsUserParcElisabethEligible() && (_DWORD)v8)
        -[PUIProblemReportingController setShouldShareAppActivityWithAppDevelopers:specifier:](self, "setShouldShareAppActivityWithAppDevelopers:specifier:", v6, v7);
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0DC3450];
    PUI_LocalizedStringForProblemReporting(CFSTR("INTERNAL_DIAGNOSTICS_REQUIRED"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v28, 0, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForProblemReporting(CFSTR("INTERNAL_DIAGNOSTICS_REQUIRED_CONFIRMATION"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAction:", v32);

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke;
    v37[3] = &unk_1EA26B438;
    v37[4] = self;
    v38 = v7;
    -[PUIProblemReportingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, v37);

  }
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProblemReportingEnabled:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)setProblemReportingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBoolValue:forSetting:", v3, *MEMORY[0x1E0D46FC0]);

  -[PUIProblemReportingController analyticsSpecifiersIncludingIndependentSpecifiers:includeDependentSpecifiers:](self, "analyticsSpecifiersIncludingIndependentSpecifiers:includeDependentSpecifiers:", v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUIProblemReportingController baseSpecifiers](self, "baseSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[PUIProblemReportingController beginUpdates](self, "beginUpdates");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__PUIProblemReportingController_setProblemReportingEnabled___block_invoke;
    v18[3] = &unk_1EA26B858;
    v18[4] = self;
    v18[5] = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  }
  else
  {
    -[PUIProblemReportingController beginUpdates](self, "beginUpdates");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "reverseObjectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[PUIProblemReportingController removeSpecifier:animated:](self, "removeSpecifier:animated:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 1);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v11);
    }

  }
  -[PUIProblemReportingController endUpdates](self, "endUpdates");

}

void __60__PUIProblemReportingController_setProblemReportingEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D80590]), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "insertSpecifier:atIndex:animated:", v5, *(_QWORD *)(a1 + 40) + a3, 1);

}

- (void)snapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIProblemReportingController spinnerSpecifier](self, "spinnerSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIProblemReportingController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v5, v7, 1);

  v15 = 0;
  if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
  {
    v18 = xmmword_1EA26BD70;
    v19 = 0;
    DiskSpaceDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
    {
      v13 = v15;
      v12 = (void *)abort_report_np();
      free(v12);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02FEFB0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FilesystemMetadataSnapshotService"));
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);
  objc_msgSend(v9, "resume");
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__PUIProblemReportingController_snapshot___block_invoke;
  v14[3] = &unk_1EA26B880;
  v14[4] = self;
  v11 = (id)objc_msgSend(v10, "generateFilesystemMetadataSnapshotWithOptions:reply:", 0, v14);

}

void __42__PUIProblemReportingController_snapshot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  if (a3)
  {
    NSLog(CFSTR("Failed to snapshot filesystem metadata: %@"), a3);
    v4 = CFSTR("FILESYSTEM_METADATA_SNAPSHOT_FAIL_MESSAGE");
    v5 = CFSTR("FILESYSTEM_METADATA_SNAPSHOT_FAIL_TITLE");
  }
  else
  {
    v4 = CFSTR("FILESYSTEM_METADATA_SNAPSHOT_SUCCESS_MESSAGE");
    v5 = CFSTR("FILESYSTEM_METADATA_SNAPSHOT_SUCCESS_TITLE");
  }
  PUI_LocalizedStringForProblemReporting(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForProblemReporting(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PUIProblemReportingController_snapshot___block_invoke_2;
  block[3] = &unk_1EA26B638;
  v11 = v6;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __42__PUIProblemReportingController_snapshot___block_invoke_2(uint64_t a1)
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
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3448];
  PUI_LocalizedStringForProblemReporting(CFSTR("OK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:style:handler:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAction:", v5);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v2, 1, 0);
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v6, "spinnerSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "filesystemMetadataSnapshotSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceContiguousSpecifiers:withSpecifiers:animated:", v8, v10, 1);

}

- (NSArray)baseSpecifiers
{
  NSArray *baseSpecifiers;
  NSArray *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  NSArray *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSRange v37;

  baseSpecifiers = self->_baseSpecifiers;
  if (baseSpecifiers)
    return baseSpecifiers;
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (PUIIsUserParcElisabethEligible())
    v6 = CFSTR("PROBLEM_REPORTING_EXPLANATION_ALT");
  else
    v6 = CFSTR("PROBLEM_REPORTING_EXPLANATION");
  PUI_LocalizedStringForProblemReporting(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForProblemReporting(CFSTR("ABOUT_DIAGNOSTICS_LINK"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", CFSTR("PROBLEM_REPORTING_GROUP"));
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v11, *MEMORY[0x1E0D80818]);

  objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x1E0D80838]);
  v35 = v9;
  v36 = (void *)v8;
  v37.location = objc_msgSend(v9, "rangeOfString:", v8);
  NSStringFromRange(v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v12, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v13, *MEMORY[0x1E0D80830]);

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("showAboutAnalyticsSheet"), *MEMORY[0x1E0D80820]);
  -[NSArray addObject:](v4, "addObject:", v5);
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v14, "isPaired");

  if ((_DWORD)v9)
    v15 = CFSTR("SHARE_ANALYTICS_WATCH_IPHONE");
  else
    v15 = CFSTR("SHARE_ANALYTICS");
  PUI_LocalizedStringForProblemReporting(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setProblemReportingEnabled_forSpecifier_, sel_problemReportingEnabled_, 0, 6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46FC0]) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "isDiagnosticSubmissionModificationAllowed");

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v16;
  if ((objc_msgSend(v21, "sf_isInternalInstall") & 1) == 0 && !v19)
  {

    v22 = 0x1E0D80000;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProperty:forKey:", v24, *MEMORY[0x1E0D80808]);

    goto LABEL_16;
  }
  v23 = PSIsInEDUMode();

  v22 = 0x1E0D80000uLL;
  if ((v23 & 1) != 0)
    goto LABEL_15;
LABEL_16:
  if ((PSIsRunningInAssistant() & 1) == 0)
  {
    v33 = v7;
    PUI_LocalizedStringForProblemReporting(CFSTR("DIAGNOSTIC_USAGE_DATA"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v22 + 1256), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, 0, 0, 0, objc_opt_class(), 2, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setIdentifier:", CFSTR("DIAGNOSTIC_USAGE_DATA"));
    objc_msgSend(v26, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80918]);
    -[NSArray addObject:](v4, "addObject:", v26);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLForKey:", CFSTR("FilesystemMetadataSnapshotEnabled"));

    if (v28)
    {
      objc_msgSend(*(id *)(v22 + 1256), "emptyGroupSpecifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v29);
      -[PUIProblemReportingController filesystemMetadataSnapshotSpecifier](self, "filesystemMetadataSnapshotSpecifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v30);

    }
    v7 = v33;
  }
  v31 = self->_baseSpecifiers;
  self->_baseSpecifiers = v4;

  baseSpecifiers = self->_baseSpecifiers;
  return baseSpecifiers;
}

- (PSSpecifier)spinnerSpecifier
{
  PSSpecifier *spinnerSpecifier;
  PSSpecifier *v4;
  PSSpecifier *v5;

  spinnerSpecifier = self->_spinnerSpecifier;
  if (!spinnerSpecifier)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA26D430, 0, 0, 0, 0, 15, 0);
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v5 = self->_spinnerSpecifier;
    self->_spinnerSpecifier = v4;

    -[PSSpecifier setProperty:forKey:](self->_spinnerSpecifier, "setProperty:forKey:", CFSTR("SPINNER_CELL"), *MEMORY[0x1E0D80868]);
    spinnerSpecifier = self->_spinnerSpecifier;
  }
  return spinnerSpecifier;
}

- (PSSpecifier)filesystemMetadataSnapshotSpecifier
{
  PSSpecifier *filesystemMetadataSnapshotSpecifier;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *v7;

  filesystemMetadataSnapshotSpecifier = self->_filesystemMetadataSnapshotSpecifier;
  if (!filesystemMetadataSnapshotSpecifier)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("FILESYSTEM_METADATA_SNAPSHOT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_filesystemMetadataSnapshotSpecifier;
    self->_filesystemMetadataSnapshotSpecifier = v6;

    -[PSSpecifier setButtonAction:](self->_filesystemMetadataSnapshotSpecifier, "setButtonAction:", sel_snapshot_);
    filesystemMetadataSnapshotSpecifier = self->_filesystemMetadataSnapshotSpecifier;
  }
  return filesystemMetadataSnapshotSpecifier;
}

- (BOOL)isAppAndAccessoryAnalyticsAllowedFeatureEnabled
{
  return 0;
}

- (NSArray)appActivitySpecifiers
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSArray *v21;
  NSArray *appActivitySpecifiers;
  _QWORD v24[3];
  NSRange v25;

  v24[2] = *MEMORY[0x1E0C80C00];
  if (self->_appActivitySpecifiers || (PUIIsUserParcElisabethEligible() & 1) != 0)
    return self->_appActivitySpecifiers;
  if (-[PUIProblemReportingController isAppAndAccessoryAnalyticsAllowedFeatureEnabled](self, "isAppAndAccessoryAnalyticsAllowedFeatureEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasAppAndAccessoryAnalyticsAllowedBeenSet"))
    {

LABEL_8:
      v6 = CFSTR("ABOUT_APP_AND_ACCESSORY_ANALYTICS_LINK");
      v7 = CFSTR("APP_AND_ACCESSORY_ANALYTICS_EXPLANATION");
      v8 = CFSTR("SHARE_WITH_DEVELOPERS");
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppAnalyticsAllowed");

    if ((v5 & 1) == 0)
      goto LABEL_8;
  }
  v6 = CFSTR("ABOUT_APP_ANALYTICS_LINK");
  v7 = CFSTR("APP_ANALYTICS_EXPLANATION");
  v8 = CFSTR("SHARE_WITH_APP_DEVELOPERS");
LABEL_9:
  PUI_LocalizedStringForProblemReporting(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForProblemReporting(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForProblemReporting(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("APP_ACTIVITY_GROUP"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v15, *MEMORY[0x1E0D80818]);

  objc_msgSend(v13, "setProperty:forKey:", v12, *MEMORY[0x1E0D80838]);
  v25.location = objc_msgSend(v12, "rangeOfString:", v11);
  NSStringFromRange(v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v16, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v17, *MEMORY[0x1E0D80830]);

  objc_msgSend(v13, "setProperty:forKey:", CFSTR("showAboutAppAnalyticsSheet"), *MEMORY[0x1E0D80820]);
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setShouldShareAppActivityWithAppDevelopers_specifier_, sel_shouldShareAppActivityWithAppDevelopers, 0, 6, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProperty:forKey:", CFSTR("SHARE_WITH_APP_DEVELOPERS"), *MEMORY[0x1E0D80868]);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isDiagnosticSubmissionModificationAllowed");

  if ((v20 & 1) == 0)
    objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  v24[0] = v13;
  v24[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appActivitySpecifiers = self->_appActivitySpecifiers;
  self->_appActivitySpecifiers = v21;

  return self->_appActivitySpecifiers;
}

- (AFSettingsConnection)assistantSettingsConnection
{
  AFSettingsConnection *assistantSettingsConnection;
  void *v4;
  objc_class *v5;
  AFSettingsConnection *v6;
  AFSettingsConnection *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  assistantSettingsConnection = self->_assistantSettingsConnection;
  if (!assistantSettingsConnection)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getAFSettingsConnectionClass_softClass;
    v13 = getAFSettingsConnectionClass_softClass;
    if (!getAFSettingsConnectionClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAFSettingsConnectionClass_block_invoke;
      v9[3] = &unk_1EA26B260;
      v9[4] = &v10;
      __getAFSettingsConnectionClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (AFSettingsConnection *)objc_alloc_init(v5);
    v7 = self->_assistantSettingsConnection;
    self->_assistantSettingsConnection = v6;

    assistantSettingsConnection = self->_assistantSettingsConnection;
  }
  return assistantSettingsConnection;
}

- (id)getCurrentImproveSiriAndDictationValueForSpecifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOnDeviceOnlyDictationForced");

  v7 = (void *)MEMORY[0x1E0C9AAA0];
  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v8 = dispatch_semaphore_create(0);
    -[PUIProblemReportingController assistantSettingsConnection](self, "assistantSettingsConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke;
    v12[3] = &unk_1EA26B8A8;
    objc_copyWeak(&v15, &location);
    v14 = &v16;
    v10 = v8;
    v13 = v10;
    objc_msgSend(v9, "getSiriDataSharingOptInStatusWithCompletion:", v12);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (v17[3] == 1)
      v7 = (void *)MEMORY[0x1E0C9AAB0];

    objc_destroyWeak(&v15);
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;

  v5 = a2;
  if (v5)
  {
    _PUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setImproveSiriAndDictationValue:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v6, "BOOLValue");
  -[PUIProblemReportingController assistantSettingsConnection](self, "assistantSettingsConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = 1;
  else
    v10 = 2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke;
  v12[3] = &unk_1EA26B8F8;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v9, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", v10, 0, 7, CFSTR("Privacy"), v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2;
  block[3] = &unk_1EA26B8D0;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  id WeakRetained;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _PUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2_cold_1(a1, v2, v3);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifierID:", CFSTR("IMPROVE_SIRI"));

}

- (void)setImproveAssistiveVoiceValue:(id)a3 specifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  _AXSSetAudioDonationSiriImprovementEnabled();
}

- (id)getImproveAssistiveVoiceValueForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSAudioDonationSiriImprovementEnabled());
}

- (id)analyticsSpecifiersIncludingIndependentSpecifiers:(BOOL)a3 includeDependentSpecifiers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  _Unwind_Exception *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer())
    v8 = MGGetBoolAnswer() ^ 1;
  else
    LOBYTE(v8) = 1;
  v9 = MGGetBoolAnswer();
  if (v5)
  {
    -[PUIProblemReportingController iCloudSpecifiers](self, "iCloudSpecifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v27);

    if (!v4)
    {
LABEL_6:
      if (!v5)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46EF0]);

  if ((v29 & 1) == 0 && (PUIIsUserParcElisabethEligible() & 1) == 0)
  {
    -[PUIProblemReportingController appActivitySpecifiers](self, "appActivitySpecifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v30);

  }
  -[PUIProblemReportingController automatedFeedbackSpecifiers](self, "automatedFeedbackSpecifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v31);

  if (v5)
  {
LABEL_7:
    -[PUIProblemReportingController bankConnectDataSpecifiers](self, "bankConnectDataSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v10);

    -[PUIProblemReportingController fitnessPlusDataSpecifiers](self, "fitnessPlusDataSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

  }
LABEL_8:
  v12 = !v4 | v8;
  if ((v12 & 1) == 0)
  {
    -[PUIProblemReportingController handwashingDataSpecifiers](self, "handwashingDataSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v13);

  }
  if ((v4 & v9) == 1)
  {
    -[PUIProblemReportingController healthDataSpecifiers](self, "healthDataSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v14);

  }
  if (v4)
  {
    -[PUIProblemReportingController identityVerificationDataSpecifiers](self, "identityVerificationDataSpecifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v15);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if (v17 != 1)
    {
      -[PUIProblemReportingController safetyDataSpecifiers](self, "safetyDataSpecifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v18);

    }
  }
  if (v5)
  {
    -[PUIProblemReportingController improveSiriSpecifiers](self, "improveSiriSpecifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v19);

    -[PUIProblemReportingController improveAssistiveVoiceSpecifiers](self, "improveAssistiveVoiceSpecifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v20);

  }
  if ((v12 & 1) == 0)
  {
    -[PUIProblemReportingController wheelchairDataSpecifiers](self, "wheelchairDataSpecifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v21);

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v22 = getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr;
  v36 = getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr)
  {
    v23 = (void *)GeoServicesLibrary();
    v22 = dlsym(v23, "GEOVisualLocalizationCrowdsourcingIsSupported");
    v34[3] = (uint64_t)v22;
    getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr = v22;
  }
  _Block_object_dispose(&v33, 8);
  if (!v22)
  {
    v32 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v33, 8);
    _Unwind_Resume(v32);
  }
  if (((unsigned int (*)(uint64_t))v22)(v24))
  {
    -[PUIProblemReportingController improveARLocationAccuracySpecifiers](self, "improveARLocationAccuracySpecifiers", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v25);

  }
  return v7;
}

- (void)setShouldShareiCloudAnalytics:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v6, "BOOLValue");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareiCloudAnalytics_specifier___block_invoke;
  v11[3] = &unk_1EA26B920;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[PUIProblemReportingController setBoolValue:forIdMSConfigKey:completion:](self, "setBoolValue:forIdMSConfigKey:completion:", v8, CFSTR("com.apple.idms.config.privacy.icloud.data"), v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __73__PUIProblemReportingController_setShouldShareiCloudAnalytics_specifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "setPreferenceValue:specifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (BOOL)shouldShowiCloudSpecifiersForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  __CFString *v12;
  PUIProblemReportingController *v13;
  _QWORD *v14;
  char v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("shouldShowiCloudSpecifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  if (v4)
  {
    objc_msgSend(v4, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getAKAppleIDAuthenticationControllerClass();
    v9 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke;
    v11[3] = &unk_1EA26B948;
    v13 = self;
    v14 = v16;
    v15 = v7;
    v12 = CFSTR("shouldShowiCloudSpecifiers");
    objc_msgSend(v9, "fetchUserInformationForAltDSID:completion:", v8, v11);

  }
  _Block_object_dispose(v16, 8);

  return v7;
}

void __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  BOOL v21;
  void *v22;
  _Unwind_Exception *v23;
  _QWORD block[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v7 = (_QWORD *)getAKAuthenticationSecurityLevelKeySymbolLoc_ptr;
  v28 = getAKAuthenticationSecurityLevelKeySymbolLoc_ptr;
  if (!getAKAuthenticationSecurityLevelKeySymbolLoc_ptr)
  {
    v8 = (void *)AuthKitLibrary();
    v7 = dlsym(v8, "AKAuthenticationSecurityLevelKey");
    v26[3] = (uint64_t)v7;
    getAKAuthenticationSecurityLevelKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v25, 8);
  if (!v7)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
LABEL_25:
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    goto LABEL_26;
  }
  objc_msgSend(v5, "objectForKey:", *v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v11 = (_QWORD *)getAKAuthenticationIsUnderageKeySymbolLoc_ptr;
  v28 = getAKAuthenticationIsUnderageKeySymbolLoc_ptr;
  if (!getAKAuthenticationIsUnderageKeySymbolLoc_ptr)
  {
    v12 = (void *)AuthKitLibrary();
    v11 = dlsym(v12, "AKAuthenticationIsUnderageKey");
    v26[3] = (uint64_t)v11;
    getAKAuthenticationIsUnderageKeySymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v25, 8);
  if (!v11)
    goto LABEL_25;
  objc_msgSend(v5, "objectForKey:", *v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v15 = (_QWORD *)getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr;
  v28 = getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr;
  if (!getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr)
  {
    v16 = (void *)AuthKitLibrary();
    v15 = dlsym(v16, "AKAuthenticationIsLegacyStudentKey");
    v26[3] = (uint64_t)v15;
    getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v25, 8);
  if (!v15)
  {
LABEL_26:
    v23 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v25, 8);
    _Unwind_Resume(v23);
  }
  objc_msgSend(v5, "objectForKey:", *v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = 0;
  if (v10 == 5)
    v20 = 1;
  else
    v20 = v14;
  if ((v20 & 1) == 0 && (v18 & 1) == 0)
  {
    if (v5)
      v21 = v6 == 0;
    else
      v21 = 0;
    v19 = v21;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 32));

  if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != *(unsigned __int8 *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke_2;
    block[3] = &unk_1EA26B358;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (NSArray)improveSiriSpecifiers
{
  NSArray *improveSiriSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v20[3];
  NSRange v21;

  v20[2] = *MEMORY[0x1E0C80C00];
  improveSiriSpecifiers = self->_improveSiriSpecifiers;
  if (!improveSiriSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_SIRI_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("ABOUT_IMPROVE_SIRI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("IMPROVE_SIRI_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v21.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    NSStringFromSelector(sel_showAboutImproveSiriAnalyticsSheet);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x1E0D80820]);

    v13 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_SIRI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setImproveSiriAndDictationValue_specifier_, sel_getCurrentImproveSiriAndDictationValueForSpecifier_, 0, 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("IMPROVE_SIRI"));
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "isOnDeviceOnlyDictationForced");

    if ((_DWORD)v14)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v20[0] = v7;
    v20[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = self->_improveSiriSpecifiers;
    self->_improveSiriSpecifiers = v17;

    improveSiriSpecifiers = self->_improveSiriSpecifiers;
  }
  return improveSiriSpecifiers;
}

- (NSArray)improveAssistiveVoiceSpecifiers
{
  NSArray *improveAssistiveVoiceSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[3];
  NSRange v20;

  v19[2] = *MEMORY[0x1E0C80C00];
  improveAssistiveVoiceSpecifiers = self->_improveAssistiveVoiceSpecifiers;
  if (!improveAssistiveVoiceSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_ASSISTIVE_VOICE_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("ABOUT_IMPROVE_ASSISTIVE_VOICE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("IMPROVE_SIRI_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v20.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    NSStringFromSelector(sel_showAboutImproveAssistiveVoiceFeatures);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x1E0D80820]);

    v13 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_ASSISTIVE_VOICE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setImproveAssistiveVoiceValue_specifier_, sel_getImproveAssistiveVoiceValueForSpecifier_, 0, 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("IMPROVE_ASSISTIVE_VOICE"));
    v19[0] = v7;
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_improveAssistiveVoiceSpecifiers;
    self->_improveAssistiveVoiceSpecifiers = v16;

    improveAssistiveVoiceSpecifiers = self->_improveAssistiveVoiceSpecifiers;
  }
  return improveAssistiveVoiceSpecifiers;
}

- (id)iCloudSpecifiers
{
  NSArray *iCloudSpecifiers;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  _QWORD v22[3];
  NSRange v23;

  v22[2] = *MEMORY[0x1E0C80C00];
  iCloudSpecifiers = self->_iCloudSpecifiers;
  if (iCloudSpecifiers)
    return iCloudSpecifiers;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (PSUsedByManagedAccount() & 1) == 0
    && -[PUIProblemReportingController shouldShowiCloudSpecifiersForAccount:](self, "shouldShowiCloudSpecifiersForAccount:", v6))
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("ICLOUD_ANALYTICS_EXPLANATION"));
    v7 = objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("ABOUT_ICLOUD_ANALYTICS_LINK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("ICLOUD_GROUP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x1E0D80818]);

    objc_msgSend(v10, "setProperty:forKey:", v9, *MEMORY[0x1E0D80838]);
    v23.location = objc_msgSend(v9, "rangeOfString:", v8);
    NSStringFromRange(v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v13, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v14, *MEMORY[0x1E0D80830]);

    objc_msgSend(v10, "setProperty:forKey:", CFSTR("showAboutiCloudAnalyticsSheet"), *MEMORY[0x1E0D80820]);
    v15 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_ICLOUD_ANALYTICS"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setShouldShareiCloudAnalytics_specifier_, sel_shouldShareiCloudAnalytics_, 0, 6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setProperty:forKey:", CFSTR("SHARE_ICLOUD_ANALYTICS"), *MEMORY[0x1E0D80868]);
    objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D807F0]);
    objc_msgSend(v17, "setProperty:forKey:", CFSTR("com.apple.Preferences"), *MEMORY[0x1E0D807F8]);
    objc_msgSend(v17, "setProperty:forKey:", CFSTR("AllowiCloudAnalytics"), *MEMORY[0x1E0D808B0]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "isDiagnosticSubmissionModificationAllowed");

    if ((v16 & 1) == 0)
      objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v22[0] = v10;
    v22[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_iCloudSpecifiers;
    self->_iCloudSpecifiers = v19;

    iCloudSpecifiers = self->_iCloudSpecifiers;
    return iCloudSpecifiers;
  }

  return 0;
}

- (NSArray)automatedFeedbackSpecifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)automatedFeedbackLinkTapped
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/legal/privacy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:configuration:completionHandler:", v2, 0, 0);

}

- (id)automatedFeedbackEnabled:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.symptomsd-diag"));
  objc_msgSend(v3, "valueForKey:", CFSTR("autoFeedbackAssistantEnable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAutomatedFeedbackEnabled:(id)a3 specifier:(id)a4
{
  objc_class *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.symptomsd-diag"));
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBool:forKey:", v6, CFSTR("autoFeedbackAssistantEnable"));
}

- (NSArray)fitnessPlusDataSpecifiers
{
  NSArray *fitnessPlusDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v18[3];
  NSRange v19;

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!-[PUIProblemReportingController shouldShowFitnessPlusSpecifiers](self, "shouldShowFitnessPlusSpecifiers"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  fitnessPlusDataSpecifiers = self->_fitnessPlusDataSpecifiers;
  if (!fitnessPlusDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("FITNESS_PLUS_DATA_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("FITNESS_PLUS_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("FITNESS_PLUS_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v19.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutFitnessPlusDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_FITNESS_PLUS_DATA"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareFitnessPlusData_specifier_, sel_shouldShareFitnessPlusDataForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("SHARE_FITNESS_PLUS_DATA"), *MEMORY[0x1E0D80868]);
    v18[0] = v7;
    v18[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_fitnessPlusDataSpecifiers;
    self->_fitnessPlusDataSpecifiers = v15;

    fitnessPlusDataSpecifiers = self->_fitnessPlusDataSpecifiers;
  }
  return fitnessPlusDataSpecifiers;
}

- (CIDVUIIdentityProofingDataSharingFlowManager)identityProofingDataSharingManager
{
  CIDVUIIdentityProofingDataSharingFlowManager *identityProofingDataSharingManager;
  void *v4;
  objc_class *v5;
  CIDVUIIdentityProofingDataSharingFlowManager *v6;
  CIDVUIIdentityProofingDataSharingFlowManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  identityProofingDataSharingManager = self->_identityProofingDataSharingManager;
  if (!identityProofingDataSharingManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass;
    v13 = getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass;
    if (!getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke;
      v9[3] = &unk_1EA26B260;
      v9[4] = &v10;
      __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (CIDVUIIdentityProofingDataSharingFlowManager *)objc_alloc_init(v5);
    v7 = self->_identityProofingDataSharingManager;
    self->_identityProofingDataSharingManager = v6;

    identityProofingDataSharingManager = self->_identityProofingDataSharingManager;
  }
  return identityProofingDataSharingManager;
}

- (id)shouldShareIdentityVerificationData:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  __CFString *v10;
  PUIProblemReportingController *v11;
  char v12;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("shouldShareIdentityVerificationData"));

  -[PUIProblemReportingController identityProofingDataSharingManager](self, "identityProofingDataSharingManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke;
  v9[3] = &unk_1EA26B970;
  v12 = v5;
  v10 = CFSTR("shouldShareIdentityVerificationData");
  v11 = self;
  objc_msgSend(v6, "fetchUserConsent:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", 0, *(_QWORD *)(a1 + 32));

  }
  else if (*(_BYTE *)(a1 + 48) != (a2 == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", a2 == 0, *(_QWORD *)(a1 + 32));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke_2;
    block[3] = &unk_1EA26B358;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)shouldShowIdentityVerificationSpecifiers
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v7[4];
  __CFString *v8;
  PUIProblemReportingController *v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("shouldShowIdentityVerificationSpecifiers"));

  -[PUIProblemReportingController identityProofingDataSharingManager](self, "identityProofingDataSharingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke;
  v7[3] = &unk_1EA26B998;
  v10 = v4;
  v8 = CFSTR("shouldShowIdentityVerificationSpecifiers");
  v9 = self;
  objc_msgSend(v5, "checkUserConsent:", v7);

  return v4;
}

void __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", 0, *(_QWORD *)(a1 + 32));

    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "Received an error while requesting identity proofing data sharing user consent %@", buf, 0xCu);
    }

  }
  else if (*(unsigned __int8 *)(a1 + 48) != (_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", a2, *(_QWORD *)(a1 + 32));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke_627;
    block[3] = &unk_1EA26B358;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke_627(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)setShouldShareIdentityVerificationData:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PUIProblemReportingController identityProofingDataSharingManager](self, "identityProofingDataSharingManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "BOOLValue") ^ 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke;
  v12[3] = &unk_1EA26B9E8;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v8, "didChangeUserConsent:completion:", v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke_2;
  v5[3] = &unk_1EA26B9C0;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v8 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  void *v3;
  id WeakRetained;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    _PUILoggingFacility();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB1FB000, v1, OS_LOG_TYPE_DEFAULT, "Error when updating the user's consent for ID Verification data", buf, 2u);
    }

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPreferenceValue:specifier:", v3, *(_QWORD *)(a1 + 48));

  }
}

- (NSArray)identityVerificationDataSpecifiers
{
  NSArray *identityVerificationDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v18[3];
  NSRange v19;

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!-[PUIProblemReportingController shouldShowIdentityVerificationSpecifiers](self, "shouldShowIdentityVerificationSpecifiers"))return (NSArray *)MEMORY[0x1E0C9AA60];
  identityVerificationDataSpecifiers = self->_identityVerificationDataSpecifiers;
  if (!identityVerificationDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("ID_VERIFICATION_DATA_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("ID_VERIFICATION_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("ID_VERIFICATION_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v19.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutIdentityVerificationDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("ID_VERIFICATION_DATA"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareIdentityVerificationData_specifier_, sel_shouldShareIdentityVerificationData_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("ID_VERIFICATION_DATA"), *MEMORY[0x1E0D80868]);
    v18[0] = v7;
    v18[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_identityVerificationDataSpecifiers;
    self->_identityVerificationDataSpecifiers = v15;

    identityVerificationDataSpecifiers = self->_identityVerificationDataSpecifiers;
  }
  return identityVerificationDataSpecifiers;
}

- (NSArray)healthDataSpecifiers
{
  NSArray *healthDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[3];
  NSRange v20;

  v19[2] = *MEMORY[0x1E0C80C00];
  healthDataSpecifiers = self->_healthDataSpecifiers;
  if (!healthDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReportingCinnamon(CFSTR("HEALTH_DATA_EXPLANATION_CINNAMON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("HEALTH_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("HEALTH_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v20.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutHealthDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_HEALTH_DATA"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareHealthData_specifier_, sel_shouldShareHealthDataForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("SHARE_HEALTH_DATA"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v15, "isDiagnosticSubmissionModificationAllowed");

    if ((v13 & 1) == 0)
      objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v19[0] = v7;
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_healthDataSpecifiers;
    self->_healthDataSpecifiers = v16;

    healthDataSpecifiers = self->_healthDataSpecifiers;
  }
  return healthDataSpecifiers;
}

- (void)showAboutBankConnectDataSheet
{
  void *v3;
  void *v4;
  id v5;

  -[PUIProblemReportingController bankConnectAnalyticsConsentCoordinator](self, "bankConnectAnalyticsConsentCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privacyBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (PUIBankConnectAnalyticsConsentCoordinator)bankConnectAnalyticsConsentCoordinator
{
  PUIBankConnectAnalyticsConsentCoordinator *bankConnectAnalyticsConsentCoordinator;
  PUIBankConnectAnalyticsConsentCoordinator *v4;
  PUIBankConnectAnalyticsConsentCoordinator *v5;

  bankConnectAnalyticsConsentCoordinator = self->_bankConnectAnalyticsConsentCoordinator;
  if (!bankConnectAnalyticsConsentCoordinator)
  {
    v4 = objc_alloc_init(PUIBankConnectAnalyticsConsentCoordinator);
    v5 = self->_bankConnectAnalyticsConsentCoordinator;
    self->_bankConnectAnalyticsConsentCoordinator = v4;

    bankConnectAnalyticsConsentCoordinator = self->_bankConnectAnalyticsConsentCoordinator;
  }
  return bankConnectAnalyticsConsentCoordinator;
}

- (NSArray)bankConnectDataSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *bankConnectDataSpecifiers;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[3];
  NSRange v26;

  v25[2] = *MEMORY[0x1E0C80C00];
  if (!self->_bankConnectDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_DATA_EXPLANATION"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_DATA_LINK"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("BANK_CONNECT_DATA_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x1E0D80818]);

    objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x1E0D80838]);
    v26.location = objc_msgSend(v5, "rangeOfString:", v4);
    NSStringFromRange(v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x1E0D80830]);

    objc_msgSend(v6, "setProperty:forKey:", CFSTR("showAboutBankConnectDataSheet"), *MEMORY[0x1E0D80820]);
    v11 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_DATA_SHARE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_setShouldShareBankConnectData_specifier_, sel_shouldShareBankConnectDataForSpecifier_, 0, 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setProperty:forKey:", CFSTR("SHARE_BANKCONNECT_OFFLINELAB_DATA"), *MEMORY[0x1E0D80868]);
    v25[0] = v6;
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bankConnectDataSpecifiers = self->_bankConnectDataSpecifiers;
    self->_bankConnectDataSpecifiers = v14;

    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__PUIProblemReportingController_bankConnectDataSpecifiers__block_invoke;
    v22[3] = &unk_1EA26BA10;
    objc_copyWeak(&v23, &location);
    v16 = (void *)MEMORY[0x1DF0AB308](v22);
    -[PUIProblemReportingController bankConnectAnalyticsConsentCoordinator](self, "bankConnectAnalyticsConsentCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerForUpdatesWithHandler:", v16);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  -[PUIProblemReportingController bankConnectAnalyticsConsentCoordinator](self, "bankConnectAnalyticsConsentCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "showPreference"))
    v19 = self->_bankConnectDataSpecifiers;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

void __58__PUIProblemReportingController_bankConnectDataSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  id WeakRetained;

  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "reloadSpecifiers");

  }
  else if (!a2)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "reloadSpecifierID:animated:", CFSTR("SHARE_BANKCONNECT_OFFLINELAB_DATA"), 1);

  }
}

- (id)shouldShareBankConnectDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PUIProblemReportingController bankConnectAnalyticsConsentCoordinator](self, "bankConnectAnalyticsConsentCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "shouldShare"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareBankConnectData:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  -[PUIProblemReportingController bankConnectAnalyticsConsentCoordinator](self, "bankConnectAnalyticsConsentCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke;
  v11[3] = &unk_1EA26BA60;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "setAnalyticsConsent:completion:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_2;
  block[3] = &unk_1EA26BA38;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0DC3450];
      PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_SYNC_ALERT_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_SYNC_ALERT_MESSAGE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForProblemReportingBankConnect(CFSTR("PRIVACY_OFFLINE_LAB_SYNC_ALERT_DEFAULT_BUTTON"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v11);

      v12 = objc_loadWeakRetained(v2);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_3;
      v13[3] = &unk_1EA26B410;
      objc_copyWeak(&v15, v2);
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v12, "presentViewController:animated:completion:", v8, 1, v13);

      objc_destroyWeak(&v15);
    }
  }
}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (PUIFitnessPlusAnalyticsConsentCoordinator)fitnessPlusAnalyticsConsentCoordinator
{
  PUIFitnessPlusAnalyticsConsentCoordinator *fitnessPlusAnalyticsConsentCoordinator;
  PUIFitnessPlusAnalyticsConsentCoordinator *v4;
  PUIFitnessPlusAnalyticsConsentCoordinator *v5;

  fitnessPlusAnalyticsConsentCoordinator = self->_fitnessPlusAnalyticsConsentCoordinator;
  if (!fitnessPlusAnalyticsConsentCoordinator)
  {
    v4 = objc_alloc_init(PUIFitnessPlusAnalyticsConsentCoordinator);
    v5 = self->_fitnessPlusAnalyticsConsentCoordinator;
    self->_fitnessPlusAnalyticsConsentCoordinator = v4;

    fitnessPlusAnalyticsConsentCoordinator = self->_fitnessPlusAnalyticsConsentCoordinator;
  }
  return fitnessPlusAnalyticsConsentCoordinator;
}

- (id)shouldShareFitnessPlusDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PUIProblemReportingController fitnessPlusAnalyticsConsentCoordinator](self, "fitnessPlusAnalyticsConsentCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "fetchAnalyticsConsent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareFitnessPlusData:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  -[PUIProblemReportingController fitnessPlusAnalyticsConsentCoordinator](self, "fitnessPlusAnalyticsConsentCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke;
  v11[3] = &unk_1EA26BAB0;
  objc_copyWeak(&v13, &location);
  v14 = v8;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "setAnalyticsConsent:completion:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  char v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke_2;
  block[3] = &unk_1EA26BA88;
  v6 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v7 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id WeakRetained;

  v2 = *(unsigned __int8 *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPreferenceValue:specifier:", v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(WeakRetained, "reloadSpecifiers");
  }

}

- (BOOL)shouldShowFitnessPlusSpecifiers
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v7[4];
  __CFString *v8;
  PUIProblemReportingController *v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("shouldShowFitnessPlusSpecifiers"));

  -[PUIProblemReportingController fitnessPlusAnalyticsConsentCoordinator](self, "fitnessPlusAnalyticsConsentCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke;
  v7[3] = &unk_1EA26BAD8;
  v10 = v4;
  v8 = CFSTR("shouldShowFitnessPlusSpecifiers");
  v9 = self;
  objc_msgSend(v5, "fetchSubscriptionStatusWithCompletion:", v7);

  return v4;
}

void __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD block[5];

  if (*(unsigned __int8 *)(a1 + 48) != (_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", a2, *(_QWORD *)(a1 + 32));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke_2;
    block[3] = &unk_1EA26B358;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)shouldShareHealthDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47070]) == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareHealthData:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id HealthAppAnalyticsStoreClass;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  HealthAppAnalyticsStoreClass = getHealthAppAnalyticsStoreClass();
  v8 = objc_msgSend(v5, "BOOLValue");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v9 = (_QWORD *)getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr;
  v15 = getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr;
  if (!getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr)
  {
    v10 = (void *)HealthAppServicesLibrary();
    v9 = dlsym(v10, "HealthAppAnalyticsAgreementImproveHealthAndAnalytics");
    v13[3] = (uint64_t)v9;
    getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
    v11 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  objc_msgSend(HealthAppAnalyticsStoreClass, "setUserDidAccept:currentAgreement:completion:", v8, *v9, &__block_literal_global_678, v12);

}

void __68__PUIProblemReportingController_setShouldShareHealthData_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _PUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update user agreement state: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NSArray)healthRecordsDataSpecifiers
{
  NSArray *healthRecordsDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[3];
  NSRange v20;

  v19[2] = *MEMORY[0x1E0C80C00];
  healthRecordsDataSpecifiers = self->_healthRecordsDataSpecifiers;
  if (!healthRecordsDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("HEALTH_RECORDS_DATA_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("HEALTH_RECORDS_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("HEALTH_RECORDS_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v20.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutHealthRecordsDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_HEALTH_RECORDS_DATA"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareHealthRecordsData_specifier_, sel_shouldShareHealthRecordsDataForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("SHARE_HEALTH_RECORDS_DATA"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v15, "isDiagnosticSubmissionModificationAllowed");

    if ((v13 & 1) == 0)
      objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v19[0] = v7;
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_healthRecordsDataSpecifiers;
    self->_healthRecordsDataSpecifiers = v16;

    healthRecordsDataSpecifiers = self->_healthRecordsDataSpecifiers;
  }
  return healthRecordsDataSpecifiers;
}

- (HKHealthStore)healthStore
{
  HKHealthStore *healthStore;
  void *v4;
  objc_class *v5;
  HKHealthStore *v6;
  HKHealthStore *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  healthStore = self->_healthStore;
  if (!healthStore)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getHKHealthStoreClass_softClass_0;
    v13 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getHKHealthStoreClass_block_invoke_0;
      v9[3] = &unk_1EA26B260;
      v9[4] = &v10;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (HKHealthStore *)objc_alloc_init(v5);
    v7 = self->_healthStore;
    self->_healthStore = v6;

    healthStore = self->_healthStore;
  }
  return healthStore;
}

- (void)updateHealthRecordsPreferenceForSpecifierID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_initWeak(&location, self);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)getHKHealthRecordsStoreClass_softClass;
  v22 = getHKHealthRecordsStoreClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getHKHealthRecordsStoreClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getHKHealthRecordsStoreClass_block_invoke;
    v18[3] = &unk_1EA26B260;
    v18[4] = &v19;
    __getHKHealthRecordsStoreClass_block_invoke((uint64_t)v18);
    v5 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v8 = [v7 alloc];
  -[PUIProblemReportingController healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithHealthStore:", v9);

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke;
  v13[3] = &unk_1EA26BB68;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  v11 = v10;
  v14 = v11;
  v12 = v4;
  v15 = v12;
  objc_msgSend(v11, "fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching health records visibility status: %@", buf, 0xCu);
    }

  }
  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "Health records visibility status: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("SHARE_HEALTH_RECORDS_DATA"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    v11 = objc_msgSend(v5, "BOOLValue");

    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_691;
      v13[3] = &unk_1EA26B7E0;
      objc_copyWeak(&v16, (id *)(a1 + 56));
      v12 = *(void **)(a1 + 40);
      v13[4] = *(_QWORD *)(a1 + 32);
      v14 = v12;
      v15 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], v13);

      objc_destroyWeak(&v16);
    }
  }

}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_691(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "healthRecordsDataSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "insertContiguousSpecifiers:afterSpecifierID:", v4, CFSTR("SHARE_HEALTH_DATA"));

  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_2;
  v6[3] = &unk_1EA26BB40;
  objc_copyWeak(&v8, v2);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:", v6);

  objc_destroyWeak(&v8);
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching health records opt in status: %@", buf, 0xCu);
    }

  }
  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "Health records opt in status: %@", buf, 0xCu);
  }

  v9 = objc_msgSend(v5, "BOOLValue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_692;
  block[3] = &unk_1EA26BA38;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v13 = v9;
  v11 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_692(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setShouldShareHealthRecordsData:", *(unsigned __int8 *)(a1 + 48));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "reloadSpecifierID:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (id)shouldShareHealthRecordsDataForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUIProblemReportingController shouldShareHealthRecordsData](self, "shouldShareHealthRecordsData", a3));
}

- (void)setShouldShareHealthRecordsData:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  id HealthAppAnalyticsStoreClass;
  uint64_t v9;
  id *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  HealthAppAnalyticsStoreClass = getHealthAppAnalyticsStoreClass();
  v9 = objc_msgSend(v6, "BOOLValue");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v10 = (id *)getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr;
  v23 = getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr;
  if (!getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr)
  {
    v11 = (void *)HealthAppServicesLibrary();
    v10 = (id *)dlsym(v11, "HealthAppAnalyticsAgreementImproveHealthRecords");
    v21[3] = (uint64_t)v10;
    getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v20, 8);
  if (v10)
  {
    v12 = *v10;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke;
    v15[3] = &unk_1EA26BBB8;
    v13 = v6;
    v16 = v13;
    objc_copyWeak(&v18, &location);
    v14 = v7;
    v17 = v14;
    objc_msgSend(HealthAppAnalyticsStoreClass, "setUserDidAccept:currentAgreement:completion:", v9, v12, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

void __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke_2;
  block[3] = &unk_1EA26BB90;
  v12 = a2;
  v8 = a1[4];
  objc_copyWeak(&v11, a1 + 6);
  v9 = v5;
  v10 = a1[5];
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved opt in status %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setShouldShareHealthRecordsData:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
  }
  else
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "Error saving opt in status %@: %@", (uint8_t *)&v9, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 48), 1);
  }

}

- (NSArray)wheelchairDataSpecifiers
{
  NSArray *wheelchairDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[3];
  NSRange v20;

  v19[2] = *MEMORY[0x1E0C80C00];
  wheelchairDataSpecifiers = self->_wheelchairDataSpecifiers;
  if (!wheelchairDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("WHEELCHAIR_DATA_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("WHEELCHAIR_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("WHEELCHAIR_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v20.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutWheelchairDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_WHEELCHAIR_DATA"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareWheelchairData_specifier_, sel_shouldShareWheelchairDataForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("SHARE_WHEELCHAIR_DATA"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v15, "isDiagnosticSubmissionModificationAllowed");

    if ((v13 & 1) == 0)
      objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v19[0] = v7;
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_wheelchairDataSpecifiers;
    self->_wheelchairDataSpecifiers = v16;

    wheelchairDataSpecifiers = self->_wheelchairDataSpecifiers;
  }
  return wheelchairDataSpecifiers;
}

- (id)shouldShareWheelchairDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D471B0]) == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareWheelchairData:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBoolValue:forSetting:", v6, *MEMORY[0x1E0D471B0]);
}

- (NSArray)handwashingDataSpecifiers
{
  NSArray *handwashingDataSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v20[3];
  NSRange v21;

  v20[2] = *MEMORY[0x1E0C80C00];
  handwashingDataSpecifiers = self->_handwashingDataSpecifiers;
  if (!handwashingDataSpecifiers)
  {
    PUI_LocalizedStringForProblemReporting(CFSTR("HANDWASHING_DATA_EXPLANATION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(CFSTR("HANDWASHING_DATA_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("HANDWASHING_DATA_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0D80838]);
    v21.location = objc_msgSend(v6, "rangeOfString:", v5);
    NSStringFromRange(v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("showAboutHandwashingDataSheet"), *MEMORY[0x1E0D80820]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_HANDWASHING_DATA"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setShouldShareHandwashingData_specifier_, sel_shouldShareHandwashingDataForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("SHARE_WHEELCHAIR_DATA"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isDiagnosticSubmissionModificationAllowed");

    if ((v16 & 1) == 0)
      objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v20[0] = v7;
    v20[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = self->_handwashingDataSpecifiers;
    self->_handwashingDataSpecifiers = v17;

    handwashingDataSpecifiers = self->_handwashingDataSpecifiers;
  }
  return handwashingDataSpecifiers;
}

- (id)shouldShareHandwashingDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", CFSTR("allowHandWashingDataSubmission")) == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareHandwashingData:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBoolValue:forSetting:", v6, CFSTR("allowHandWashingDataSubmission"));
}

- (NSArray)safetyDataSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *safetyDataSpecifiers;
  _QWORD v20[3];
  NSRange v21;

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!self->_safetyDataSpecifiers)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
    {
      PUI_LocalizedStringForProblemReporting(CFSTR("SAFETY_DATA_EXPLANATION"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForProblemReporting(CFSTR("SAFETY_DATA_LINK"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SAFETY_DATA_GROUP"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x1E0D80818]);

      objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x1E0D80838]);
      v21.location = objc_msgSend(v7, "rangeOfString:", v6);
      NSStringFromRange(v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProperty:forKey:", v11, *MEMORY[0x1E0D80828]);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProperty:forKey:", v12, *MEMORY[0x1E0D80830]);

      objc_msgSend(v8, "setProperty:forKey:", CFSTR("showAboutSafetyDataSheet"), *MEMORY[0x1E0D80820]);
      v13 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForProblemReporting(CFSTR("SHARE_SAFETY_DATA"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setShouldShareSafetyData_specifier_, sel_shouldShareSafetyDataForSpecifier_, 0, 6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setProperty:forKey:", CFSTR("SHARE_SAFETY_DATA"), *MEMORY[0x1E0D80868]);
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v16, "isDiagnosticSubmissionModificationAllowed");

      if ((v14 & 1) == 0)
        objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      v20[0] = v8;
      v20[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      safetyDataSpecifiers = self->_safetyDataSpecifiers;
      self->_safetyDataSpecifiers = v17;

    }
  }
  return self->_safetyDataSpecifiers;
}

- (id)shouldShareSafetyDataForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", CFSTR("allowSafetyDataSubmission")) == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShareSafetyData:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setBoolValue:forSetting:", v6, CFSTR("allowSafetyDataSubmission"));
}

- (NSArray)improveARLocationAccuracySpecifiers
{
  NSArray *improveARLocationAccuracySpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[3];
  NSRange v23;

  v22[2] = *MEMORY[0x1E0C80C00];
  improveARLocationAccuracySpecifiers = self->_improveARLocationAccuracySpecifiers;
  if (!improveARLocationAccuracySpecifiers)
  {
    PUI_RebrandedKeyForAppleID(CFSTR("IMPROVE_AR_LOCATION_ACCURACY_FOOTER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForProblemReporting(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_AR_LOCATION_ACCURACY_LINK"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("IMPROVE_AR_LOCATION_ACCURACY_GROUP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x1E0D80818]);

    objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x1E0D80838]);
    v23.location = objc_msgSend(v7, "rangeOfString:", v6);
    NSStringFromRange(v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v11, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v12, *MEMORY[0x1E0D80830]);

    objc_msgSend(v8, "setProperty:forKey:", CFSTR("showImproveARLocationAccuracyDataSheet"), *MEMORY[0x1E0D80820]);
    v13 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("IMPROVE_AR_LOCATION_ACCURACY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setImproveARLocationAccuracy_specifier_, sel_improveARLocationAccuracyForSpecifier_, 0, 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setProperty:forKey:", CFSTR("IMPROVE_AR_LOCATION_ACCURACY_DATA"), *MEMORY[0x1E0D80868]);
    if ((PSGEOVisualLocalizationCrowdsourcingIsAllowed() & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      -[PUIProblemReportingController improveARLocationAccuracyForSpecifier:](self, "improveARLocationAccuracyForSpecifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "BOOLValue");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", v18, *MEMORY[0x1E0D80808]);

    v22[0] = v8;
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_improveARLocationAccuracySpecifiers;
    self->_improveARLocationAccuracySpecifiers = v19;

    improveARLocationAccuracySpecifiers = self->_improveARLocationAccuracySpecifiers;
  }
  return improveARLocationAccuracySpecifiers;
}

- (void)setImproveARLocationAccuracy:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "BOOLValue") && (PSGEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIProblemReportingController reloadSpecifierID:](self, "reloadSpecifierID:", v11);

  }
  else
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v9 = getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr;
    v16 = getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr;
    if (!getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr)
    {
      v10 = (void *)GeoServicesLibrary();
      v9 = dlsym(v10, "GEOVisualLocalizationCrowdsourcingSetEnabled");
      v14[3] = (uint64_t)v9;
      getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v13, 8);
    if (!v9)
    {
      v12 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v12);
    }
    ((void (*)(uint64_t))v9)(v8);
  }

}

- (id)improveARLocationAccuracyForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr;
  v15 = getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr)
  {
    v6 = (void *)GeoServicesLibrary();
    v5 = dlsym(v6, "GEOVisualLocalizationCrowdsourcingIsEnabled");
    v13[3] = (uint64_t)v5;
    getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    v11 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  v8 = ((uint64_t (*)(uint64_t))v5)(v7);
  objc_msgSend(v4, "numberWithBool:", v8, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = +[PUIProblemReportingController isProblemReportingEnabled](PUIProblemReportingController, "isProblemReportingEnabled");
    -[PUIProblemReportingController baseSpecifiers](self, "baseSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIProblemReportingController analyticsSpecifiersIncludingIndependentSpecifiers:includeDependentSpecifiers:](self, "analyticsSpecifiersIncludingIndependentSpecifiers:includeDependentSpecifiers:", 1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();

    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    -[PUIProblemReportingController checkDiagnosticsSessionAvailability](self, "checkDiagnosticsSessionAvailability");
    -[PUIProblemReportingController updateiCloudAnalyticsForSpecifierID:](self, "updateiCloudAnalyticsForSpecifierID:", CFSTR("SHARE_ICLOUD_ANALYTICS"));
    -[PUIProblemReportingController updateHealthRecordsPreferenceForSpecifierID:](self, "updateHealthRecordsPreferenceForSpecifierID:", CFSTR("SHARE_HEALTH_RECORDS_DATA"));
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)shouldShareAppActivityWithAppDevelopers
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAppAndAccessoryAnalyticsAllowedBeenSet");

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isAppAndAccessoryAnalyticsAllowed"));
  else
    objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46EF0]) == 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setShouldShareAppActivityWithAppDevelopers:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSArray *appActivitySpecifiers;

  v5 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBoolValue:forSetting:", v5, *MEMORY[0x1E0D46EF0]);

  if (-[PUIProblemReportingController isAppAndAccessoryAnalyticsAllowedFeatureEnabled](self, "isAppAndAccessoryAnalyticsAllowedFeatureEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasAppAndAccessoryAnalyticsAllowedBeenSet");

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBoolValue:forSetting:", v5, *MEMORY[0x1E0D46EF8]);

    if ((v8 & 1) == 0)
    {
      appActivitySpecifiers = self->_appActivitySpecifiers;
      self->_appActivitySpecifiers = 0;

      -[PUIProblemReportingController reloadSpecifiers](self, "reloadSpecifiers");
    }
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[PUIProblemReportingController specifierAtIndex:](self, "specifierAtIndex:", -[PUIProblemReportingController indexForIndexPath:](self, "indexForIndexPath:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("START_DIAGNOSTICS_WITH_APPLE_SUPPORT")))
  {
    -[PUIProblemReportingController specifierAtIndex:](self, "specifierAtIndex:", -[PUIProblemReportingController indexForIndexPath:](self, "indexForIndexPath:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIProblemReportingController launchDiagnosticsSession:](self, "launchDiagnosticsSession:", v8);

    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (BOOL)shouldShareHealthRecordsData
{
  return self->_shouldShareHealthRecordsData;
}

- (void)setShouldShareHealthRecordsData:(BOOL)a3
{
  self->_shouldShareHealthRecordsData = a3;
}

- (void)setAutomatedFeedbackSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_automatedFeedbackSpecifiers, a3);
}

- (void)setFitnessPlusAnalyticsConsentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessPlusAnalyticsConsentCoordinator, a3);
}

- (void)setBankConnectAnalyticsConsentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectAnalyticsConsentCoordinator, a3);
}

- (void)setAssistantSettingsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_assistantSettingsConnection, a3);
}

- (void)setIdentityProofingDataSharingManager:(id)a3
{
  objc_storeStrong((id *)&self->_identityProofingDataSharingManager, a3);
}

- (void)setImproveSiriSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_improveSiriSpecifiers, a3);
}

- (void)setImproveAssistiveVoiceSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_improveAssistiveVoiceSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_improveAssistiveVoiceSpecifiers, 0);
  objc_storeStrong((id *)&self->_improveSiriSpecifiers, 0);
  objc_storeStrong((id *)&self->_identityProofingDataSharingManager, 0);
  objc_storeStrong((id *)&self->_assistantSettingsConnection, 0);
  objc_storeStrong((id *)&self->_bankConnectAnalyticsConsentCoordinator, 0);
  objc_storeStrong((id *)&self->_fitnessPlusAnalyticsConsentCoordinator, 0);
  objc_storeStrong((id *)&self->_improveARLocationAccuracySpecifiers, 0);
  objc_storeStrong((id *)&self->_bankConnectDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_safetyDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_automatedFeedbackSpecifiers, 0);
  objc_storeStrong((id *)&self->_handwashingDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_wheelchairDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthRecordsDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_fitnessPlusDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_baseSpecifiers, 0);
  objc_storeStrong((id *)&self->_identityVerificationDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_iCloudSpecifiers, 0);
  objc_storeStrong((id *)&self->_appActivitySpecifiers, 0);
  objc_storeStrong((id *)&self->_filesystemMetadataSnapshotSpecifier, 0);
  objc_storeStrong((id *)&self->_aboutDiagnosticsLinkLabel, 0);
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "Unable to fetch iCloud Analytics value from idms.", v1, 2u);
}

void __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v7;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1DB1FB000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while getting current Siri Analytics Status: %@", (uint8_t *)&v8, 0x16u);

}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  id WeakRetained;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *a2;
  v11 = 138412802;
  v12 = v8;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1DB1FB000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while setting Siri Analytics Status to '%@': %@", (uint8_t *)&v11, 0x20u);

}

@end
