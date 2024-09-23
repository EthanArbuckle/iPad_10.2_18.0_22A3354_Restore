@implementation LTUITranslateSettingsController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)LTUITranslateSettingsController;
  -[LTUITranslateSettingsController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Apps/com.apple.Translate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("TRANSLATE"), CFSTR("Localizable"), v6, v8);

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUITranslateSettingsController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.Translate"), v9, v10, v4);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PSSpecifier *v14;
  PSSpecifier *onDeviceOnlyGroup;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  BOOL v23;
  _QWORD *v24;
  _QWORD *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  NSRange v40;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80510]), "initWithBundleIdentifier:", CFSTR("com.apple.Translate"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifiersForPolicyOptions:force:", 41975808, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:");
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("Languages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LTSettingsLocalizedString(CFSTR("ON_DEVICE_LANGUAGES_DESCRIPTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D80848];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D80848]);

    v38 = v7;
    objc_msgSend(v6, "addObject:", v7);
    v10 = (void *)MEMORY[0x1E0D804E8];
    _LTSettingsLocalizedString(CFSTR("ON_DEVICE_LANGUAGES_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, objc_opt_class(), 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v12);
    v13 = *MEMORY[0x1E0D808B0];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("DOWNLOADED_LANGUAGES_SPECIFIER"), *MEMORY[0x1E0D808B0]);
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("OnDeviceOnlyGroup"));
    v14 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    onDeviceOnlyGroup = self->onDeviceOnlyGroup;
    self->onDeviceOnlyGroup = v14;

    -[LTUITranslateSettingsController onDeviceOnlyFooterString](self, "onDeviceOnlyFooterString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](self->onDeviceOnlyGroup, "setObject:forKeyedSubscript:", v16, v9);

    objc_msgSend(v6, "addObject:", self->onDeviceOnlyGroup);
    v17 = (void *)MEMORY[0x1E0D804E8];
    _LTSettingsLocalizedString(CFSTR("ON_DEVICE_PREF_NAME"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, sel_setAppGroupUserDefaultsEnabled_specifier_, sel_appGroupUserDefaultForSpecifier_, 0, 6, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (const __CFString *)MEMORY[0x1E0C9AAB0];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.private.translation"));

    objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("OnDeviceOnly"), v13);
    v23 = -[LTUITranslateSettingsController isOnDeviceOnlyTranslationForced](self, "isOnDeviceOnlyTranslationForced");
    v24 = (_QWORD *)MEMORY[0x1E0D807F0];
    if (v23)
    {
      v25 = (_QWORD *)MEMORY[0x1E0D80990];
      v26 = (const __CFString *)MEMORY[0x1E0C9AAA0];
      v27 = v20;
      v28 = (_QWORD *)MEMORY[0x1E0D80808];
    }
    else
    {
      objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D807F0]);
      v27 = CFSTR("group.com.apple.private.translation.globalprefschanged");
      v24 = (_QWORD *)MEMORY[0x1E0D80988];
      v25 = (_QWORD *)MEMORY[0x1E0D807C0];
      v26 = CFSTR("group.com.apple.private.translation");
      v28 = (_QWORD *)MEMORY[0x1E0D80708];
      v20 = CFSTR("group.com.apple.private.translation");
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, *v28);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *v25);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, *v24);
    objc_msgSend(v6, "addObject:", v19);
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("PrivacyLink"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PRIVACY_LINK"), &stru_1E944F990, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v33, *MEMORY[0x1E0D80818]);

    objc_msgSend(v29, "setProperty:forKey:", v31, *MEMORY[0x1E0D80838]);
    v40.length = objc_msgSend(v31, "length");
    v40.location = 0;
    NSStringFromRange(v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v34, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v35, *MEMORY[0x1E0D80830]);

    objc_msgSend(v29, "setProperty:forKey:", CFSTR("showTranslatePrivacy"), *MEMORY[0x1E0D80820]);
    objc_msgSend(v6, "addObject:", v29);
    v36 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)showTranslatePrivacy
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.translate"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)setAppGroupUserDefaultsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x1E0D808B0];
  v7 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "translationAppGroupDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v11);

  objc_msgSend(MEMORY[0x1E0C99EA0], "translationAppGroupDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronize");

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("OnDeviceOnly")))
  {
    -[LTUITranslateSettingsController onDeviceOnlyFooterString](self, "onDeviceOnlyFooterString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](self->onDeviceOnlyGroup, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D80848]);

    -[LTUITranslateSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->onDeviceOnlyGroup, 1);
  }

}

- (BOOL)isOnDeviceOnlyTranslationForced
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isOnDeviceOnlyTranslationForced");
  else
    v4 = 0;

  return v4;
}

- (id)appGroupUserDefaultForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D808B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "translationAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("OnDeviceOnly"))
    && -[LTUITranslateSettingsController isOnDeviceOnlyTranslationForced](self, "isOnDeviceOnlyTranslationForced"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (void)openAppToLanguages:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openApplicationWithBundleID:", CFSTR("com.apple.Translate"));

}

- (id)onDeviceOnlyFooterString
{
  return _LTSettingsLocalizedString(CFSTR("ON_DEVICE_FOOTER"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->onDeviceOnlyGroup, 0);
}

@end
