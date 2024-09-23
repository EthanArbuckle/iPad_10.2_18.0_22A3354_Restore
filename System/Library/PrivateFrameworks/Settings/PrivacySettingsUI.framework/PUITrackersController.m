@implementation PUITrackersController

- (PUITrackersController)init
{
  PUITrackersController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUITrackersController;
  v2 = -[PUITCCAccessController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PUITrackersController setAdTrackingTransparency:](v2, "setAdTrackingTransparency:", v3);

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUITrackersController;
  -[PUITCCAccessController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUITrackersController provideNavigationDonations](self, "provideNavigationDonations");
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
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("TRACKERS"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/USER_TRACKING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackersController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.app-tracking-transparency"), v7, v11, v12);

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  void *v3;
  id *v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
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
  id v26;
  NSObject *v28;
  void *v29;
  objc_super v30;
  NSRange v31;

  v3 = (void *)objc_opt_new();
  v4 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v5 = *v4;
  if (!*v4)
  {
    v6 = -[PUITrackersController canChangeAllowAsk](self, "canChangeAllowAsk");
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("HEADER_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("APP_TRACKING_HEADER_TEXT"));
    v8 = objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("APP_TRACKING_LINK_TEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[PUITrackersController adTrackingTransparency](self, "adTrackingTransparency");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "crossAppTrackingAllowedSwitchDisabledReason");

      switch(v12)
      {
        case 1:
        case 2:
          v13 = CFSTR("APP_TRACKING_DISABLED_REASON_AGE");
          goto LABEL_12;
        case 3:
          v13 = CFSTR("APP_TRACKING_DISABLED_REASON_EDU_MODE");
          goto LABEL_12;
        case 4:
          v13 = CFSTR("APP_TRACKING_DISABLED_REASON_EDU_ACCOUNT");
          goto LABEL_12;
        case 5:
          v13 = CFSTR("APP_TRACKING_DISABLED_REASON_MISSING_AGE");
          goto LABEL_12;
        case 6:
          v13 = CFSTR("APP_TRACKING_DISABLED_REASON_PROFILE");
LABEL_12:
          PUI_LocalizedStringForPrivacy(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          PUI_LocalizedStringForPrivacy(CFSTR("APP_TRACKING_DISABLED"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          _PUILoggingFacility();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[PUITrackersController specifiers].cold.1(v12, v28);

          break;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v10, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
    }
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v17, *MEMORY[0x1E0D80818]);

    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x1E0D80838]);
    v31.location = objc_msgSend(v10, "rangeOfString:", v9);
    NSStringFromRange(v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v18, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v19, *MEMORY[0x1E0D80830]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("headerLinkWasTapped"), *MEMORY[0x1E0D80820]);
    objc_msgSend(v3, "addObject:", v7);
    v20 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForPrivacy(CFSTR("ALLOW_ASK"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, sel_setAllowAsk_specifier_, sel_allowAsk_, 0, 6, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setIdentifier:", CFSTR("ALLOW_ASK"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D80808]);

    objc_msgSend(v3, "addObject:", v22);
    v30.receiver = self;
    v30.super_class = (Class)PUITrackersController;
    -[PUITCCAccessController specifiers](&v30, sel_specifiers);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackersController setAppSpecifiers:](self, "setAppSpecifiers:", v24);

    -[PUITrackersController appSpecifiers](self, "appSpecifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v25);

    objc_storeStrong(v4, v3);
    v5 = *v4;
  }
  v26 = v5;

  return v26;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUITrackersController;
  -[PUITCCAccessController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D8D658], "trackingViewVisited");
}

- (void)headerLinkWasTapped
{
  id v3;

  v3 = (id)objc_opt_new();
  -[PUITrackersController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (BOOL)canChangeAllowAsk
{
  void *v2;
  char v3;

  -[PUITrackersController adTrackingTransparency](self, "adTrackingTransparency");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crossAppTrackingAllowedSwitchEnabled");

  return v3;
}

- (void)setAllowAsk:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequest:askAppsToStopTracking:", 1, 0);
    -[PUITrackersController adTrackingTransparency](self, "adTrackingTransparency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCrossAppTrackingAllowed:", 1);

  }
  else
  {
    v6 = (void *)TCCAccessCopyBundleIdentifiersForService();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0DC3450];
      PUI_LocalizedStringForPrivacy(CFSTR("DISABLE_ALLOW_ASK_MESSAGE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v9, objc_msgSend(v10, "sf_isiPad"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForPrivacy(CFSTR("DISABLE_ALLOW_ASK_CANCEL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke;
      v26[3] = &unk_1EA26B568;
      v26[4] = self;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v15);

      v16 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForPrivacy(CFSTR("DISABLE_ALLOW_ASK_LEAVE_APPS_ON"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke_2;
      v25[3] = &unk_1EA26B568;
      v25[4] = self;
      objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v18);

      v19 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForPrivacy(CFSTR("DISABLE_ALLOW_ASK_TURN_OFF_APPS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke_3;
      v24[3] = &unk_1EA26B568;
      v24[4] = self;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v21);

      -[PUITrackersController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
      return;
    }
    objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequest:askAppsToStopTracking:", 0, 0);
    -[PUITrackersController adTrackingTransparency](self, "adTrackingTransparency");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCrossAppTrackingAllowed:", 0);

    PUIResetIDFAIfNeeded();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.TrackingStateChanged"), 0);

}

uint64_t __47__PUITrackersController_setAllowAsk_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:", CFSTR("ALLOW_ASK"));
}

void __47__PUITrackersController_setAllowAsk_specifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "adTrackingTransparency");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCrossAppTrackingAllowed:", 0);

  objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequest:askAppsToStopTracking:", 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.TrackingStateChanged"), 0);

}

void __47__PUITrackersController_setAllowAsk_specifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "disableTCCForAllApps");
  objc_msgSend(*(id *)(a1 + 32), "adTrackingTransparency");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCrossAppTrackingAllowed:", 0);

  objc_msgSend(MEMORY[0x1E0D8D658], "trackingStateOfRequest:askAppsToStopTracking:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.TrackingStateChanged"), 0);

}

- (void)disableTCCForAllApps
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        TCCAccessSetForBundleId();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  PUIResetIDFAIfNeeded();
}

- (id)allowAsk:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PUITrackersController adTrackingTransparency](self, "adTrackingTransparency", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "crossAppTrackingAllowed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ADTrackingTransparency)adTrackingTransparency
{
  return self->_adTrackingTransparency;
}

- (void)setAdTrackingTransparency:(id)a3
{
  objc_storeStrong((id *)&self->_adTrackingTransparency, a3);
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_adTrackingTransparency, 0);
}

- (void)specifiers
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[PUITrackersController specifiers]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "%s: Unexpected crossAppTrackingAllowedSwitchDisabledReason code: %ld", (uint8_t *)&v2, 0x16u);
}

@end
