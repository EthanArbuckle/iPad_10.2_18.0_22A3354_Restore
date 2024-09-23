@implementation PUIAdSupportController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
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
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  uint64_t v45;
  NSRange v46;
  NSRange v47;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[PUIAdSupportController setAdTrackingTransparency:](self, "setAdTrackingTransparency:", v6);

    }
    v7 = (void *)objc_opt_new();
    if (-[PUIAdSupportController personalizedAdsAvailable](self, "personalizedAdsAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("AD_PRIVACY_HEADER"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForAdSupport(CFSTR("AD_PRIVACY_FOOTER_LINK"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForAdSupport(CFSTR("AD_PRIVACY_FOOTER"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v9);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForAdSupport(CFSTR("APPLE_DELIVERED_ADVERTISING"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedUppercaseString");
      v45 = v3;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n\n%@"), v14, v44);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D80818]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D80838]);
      v46.location = objc_msgSend(v15, "rangeOfString:", v9);
      NSStringFromRange(v46);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D80828]);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D80830]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("userDidTapLearnMoreLink:"), *MEMORY[0x1E0D80820]);
      objc_msgSend(v7, "addObject:", v8);
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("VIEW_AD_TARGETING_INFORMATION_GROUP"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForAdSupport(CFSTR("VIEW_AD_TARGETING_INFORMATION_FOOTER"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D80848]);

      objc_msgSend(v7, "addObject:", v20);
      v22 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForAdSupport(CFSTR("VIEW_AD_TARGETING_INFORMATION"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 13, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setIdentifier:", CFSTR("VIEW_AD_TARGETING_INFORMATION"));
      objc_msgSend(v24, "setButtonAction:", sel_userDidTapAdPreferences_);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
      objc_msgSend(v7, "addObject:", v24);

      v3 = v45;
    }
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("PERSONALIZED_ADS_GROUP"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "shouldShowPersonalizedAdsToggle");

    if (-[PUIAdSupportController personalizedAdsAvailable](self, "personalizedAdsAvailable"))
    {
      if (!v27)
      {
        PUI_LocalizedStringForAdSupport(CFSTR("PERSONALIZED_ADS_NO_CONSENT"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D80848]);

        objc_msgSend(v7, "addObject:", v25);
        goto LABEL_12;
      }
      PUI_LocalizedStringForAdSupport(CFSTR("PERSONALIZED_ADS_FOOTER"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D80848]);

      objc_msgSend(v7, "addObject:", v25);
    }
    else
    {
      PUI_LocalizedStringForAdSupport(CFSTR("PERSONALIZED_ADS_UNAVAILABLE_LINK"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForAdSupport(CFSTR("PERSONALIZED_ADS_UNAVAILABLE_FOOTER"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", v31, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D80818]);

      objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D80838]);
      v47.location = objc_msgSend(v32, "rangeOfString:", v29);
      NSStringFromRange(v47);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D80828]);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D80830]);

      objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("userDidTapLearnMoreLink:"), *MEMORY[0x1E0D80820]);
      objc_msgSend(v7, "addObject:", v25);
      if (!v27)
      {
LABEL_12:
        v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v7;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        return v4;
      }
    }
    v37 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForAdSupport(CFSTR("PERSONALIZED_ADS"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v38, self, sel_setPersonalizedAdsEnabled_specifier_, sel_personalizedAdsEnabled_, 0, 6, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "setIdentifier:", CFSTR("PERSONALIZED_ADS"));
    -[PUIAdSupportController personalizedAdsSwitchEnabled](self, "personalizedAdsSwitchEnabled");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D80808]);

    objc_msgSend(v7, "addObject:", v39);
    goto LABEL_12;
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  _QWORD block[5];
  char v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PUIAdSupportController viewDidAppear:]";
    _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "%s: started querying ad support state.", buf, 0xCu);
  }

  -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke;
  v12[3] = &unk_1EA26C068;
  v12[4] = self;
  objc_msgSend(v5, "personalizedAdsAvailable:", v12);

  _PUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PUIAdSupportController viewDidAppear:]";
    _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: checking if we have a PA consent related change.", buf, 0xCu);
  }

  -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldShowPersonalizedAdsToggle");

  if (v9 != -[PUIAdSupportController personalizedAdsConsented](self, "personalizedAdsConsented"))
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke_47;
    block[3] = &unk_1EA26C920;
    v11 = v9;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  -[PUIAdSupportController provideNavigationDonations](self, "provideNavigationDonations");
}

void __40__PUIAdSupportController_viewDidAppear___block_invoke(uint64_t a1, int a2)
{
  char v2;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  char v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v2 = a2;
  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "personalizedAdsAvailable") != a2)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v9 = "-[PUIAdSupportController viewDidAppear:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading: ad support state changed to: %@", buf, 0x16u);

    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke_43;
    v6[3] = &unk_1EA26C920;
    v7 = v2;
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

uint64_t __40__PUIAdSupportController_viewDidAppear___block_invoke_43(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", *(unsigned __int8 *)(a1 + 40), CFSTR("PUIPersonalizedAdsSupported"));

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __40__PUIAdSupportController_viewDidAppear___block_invoke_47(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", *(unsigned __int8 *)(a1 + 40), CFSTR("PUIPersonalizedAdsConsented"));

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
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
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ADVERTISING"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/ADVERTISING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAdSupportController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.apple-advertising"), v7, v11, v12);

}

- (BOOL)personalizedAdsAvailable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PUIPersonalizedAdsSupported"));

  return v3;
}

- (BOOL)personalizedAdsConsented
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PUIPersonalizedAdsConsented"));

  return v3;
}

- (id)personalizedAdsSwitchEnabled
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "personalizedAdsSwitchEnabled"))
    v5 = -[PUIAdSupportController personalizedAdsAvailable](self, "personalizedAdsAvailable");
  else
    v5 = 0;
  objc_msgSend(v3, "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personalizedAdsEnabled:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "personalizedAds"))
    v6 = -[PUIAdSupportController personalizedAdsAvailable](self, "personalizedAdsAvailable");
  else
    v6 = 0;
  objc_msgSend(v4, "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setPersonalizedAdsEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  objc_msgSend(v5, "BOOLValue");
  ADClientSetValueForScalarKey();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[PUIAdSupportController adTrackingTransparency](self, "adTrackingTransparency");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalizedAds:", v6);

}

- (void)userDidTapDoneButton:(id)a3
{
  -[PUIAdSupportController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)userDidTapLearnMoreLink:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.advertising"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)userDidTapAdPreferences:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0980]), "initWithUserTransparencyDetails:", 0);
  -[PUIAdSupportController setUserTransparencyController:](self, "setUserTransparencyController:", v4);

  -[PUIAdSupportController userTransparencyController](self, "userTransparencyController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)userTransparencyViewControllerDidLoad:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PUIAdSupportController_userTransparencyViewControllerDidLoad___block_invoke;
  v6[3] = &unk_1EA26B438;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __64__PUIAdSupportController_userTransparencyViewControllerDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)userTransparencyViewControllerDidDismiss:(id)a3
{
  -[PUIAdSupportController setUserTransparencyController:](self, "setUserTransparencyController:", 0);
}

- (void)userTransparencyViewController:(id)a3 didFailWithError:(id)a4
{
  -[PUIAdSupportController setUserTransparencyController:](self, "setUserTransparencyController:", 0, a4);
}

- (UserTransparencyViewController)userTransparencyController
{
  return self->_userTransparencyController;
}

- (void)setUserTransparencyController:(id)a3
{
  objc_storeStrong((id *)&self->_userTransparencyController, a3);
}

- (ADTrackingTransparency)adTrackingTransparency
{
  return self->_adTrackingTransparency;
}

- (void)setAdTrackingTransparency:(id)a3
{
  objc_storeStrong((id *)&self->_adTrackingTransparency, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adTrackingTransparency, 0);
  objc_storeStrong((id *)&self->_userTransparencyController, 0);
}

@end
