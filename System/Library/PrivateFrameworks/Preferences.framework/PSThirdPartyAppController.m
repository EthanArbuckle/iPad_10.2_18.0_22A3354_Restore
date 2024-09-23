@implementation PSThirdPartyAppController

- (id)_uiValueFromValue:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id *v7;
  int v8;
  id *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("TrueValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id *)MEMORY[0x1E0C9AE50];
  if (!v6)
    v6 = (id)*MEMORY[0x1E0C9AE50];
  v8 = objc_msgSend(v5, "isEqual:", v6);

  v9 = (id *)MEMORY[0x1E0C9AE40];
  if (v8)
    v9 = v7;
  v10 = *v9;

  return v10;
}

- (id)_valueFromUIValue:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "propertyForKey:", CFSTR("TrueValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("FalseValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v7 = (id)*MEMORY[0x1E0C9AE50];
    if (v8)
      goto LABEL_3;
  }
  v8 = (id)*MEMORY[0x1E0C9AE40];
LABEL_3:
  v9 = objc_msgSend(v6, "BOOLValue");

  if (v9)
    v10 = v7;
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (id)_readToggleSwitchSpecifierValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[PSSpecifierController readPreferenceValue:](self, "readPreferenceValue:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "propertyForKey:", CFSTR("negate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "BOOLValue") ^ 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    objc_msgSend(v4, "setProperty:forKey:", v6, CFSTR("value"));
  }
  else
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("default"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = (void *)MEMORY[0x1E0C9AAA0];
      goto LABEL_8;
    }
    v6 = (void *)v10;
    -[PSThirdPartyAppController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v10, v4);
  }
  -[PSThirdPartyAppController _uiValueFromValue:specifier:](self, "_uiValueFromValue:specifier:", v6, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v11, CFSTR("value"));

LABEL_8:
  return v11;
}

- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v11;

  v11 = a4;
  -[PSThirdPartyAppController _valueFromUIValue:specifier:](self, "_valueFromUIValue:specifier:", a3, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "propertyForKey:", CFSTR("defaults"));
  v8 = objc_msgSend(v11, "propertyForKey:", CFSTR("key"));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9 || v6 == 0)
  {
    NSLog(CFSTR("ERROR: couldn't write %@ to %@ in %@"), v6, v8, v7);
  }
  else
  {
    -[PSThirdPartyAppController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v6, v11);
    GSSendAppPreferencesChanged();
  }

}

- (void)showPrivacyControllerForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[PSAppListController onBoardingKitBundleIDDict](PSAppListController, "onBoardingKitBundleIDDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("AppBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(getOBPrivacyPresenterClass_0(), "presenterForPrivacySplashWithIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierController viewController](self, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPresentingViewController:", v8);

    objc_msgSend(v7, "present");
  }

}

- (void)showPrivacyControllerForBundleName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  +[PSAppListController onBoardingKitBundleNameDict](PSAppListController, "onBoardingKitBundleNameDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "propertyForKey:", CFSTR("AppBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppSettingsBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getOBPrivacyPresenterClass_0(), "presenterForPrivacySplashWithBundleAtPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierController viewController](self, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPresentingViewController:", v12);

    objc_msgSend(v11, "present");
  }

}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PSSpecifierController viewController](self, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, v4, 0);

}

- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "propertyForKey:", CFSTR("AppBundleID"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    _CFPreferencesPostValuesChangedInDomains();
  }

}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSThirdPartyAppController;
  v6 = a4;
  -[PSSpecifierController setPreferenceValue:specifier:](&v7, sel_setPreferenceValue_specifier_, a3, v6);
  -[PSThirdPartyAppController postThirdPartySettingDidChangeNotificationForSpecifier:](self, "postThirdPartySettingDidChangeNotificationForSpecifier:", v6, v7.receiver, v7.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSThirdPartyAppController;
  -[PSSpecifierController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PSSpecifierController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)loadSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PSSystemPolicyForApp *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  PSDriverPolicyForApp *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;

  -[PSSpecifierController specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[PSSpecifierController specifiers](self, "specifiers");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSSpecifierController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("isThirdPartyDetail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
  {
    v70 = 1;
  }
  else
  {
    -[PSThirdPartyAppController appPolicy](self, "appPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = -[PSSystemPolicyForApp initWithBundleIdentifier:]([PSSystemPolicyForApp alloc], "initWithBundleIdentifier:", v6);
      -[PSThirdPartyAppController setAppPolicy:](self, "setAppPolicy:", v11);

      -[PSThirdPartyAppController appPolicy](self, "appPolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      -[PSThirdPartyAppController appPolicy](self, "appPolicy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSThirdPartyAppController setSystemPolicy:](self, "setSystemPolicy:", v13);

    }
    -[PSThirdPartyAppController systemPolicy](self, "systemPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "specifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = objc_msgSend(v15, "count") == 0;
    objc_msgSend(v4, "addObjectsFromArray:", v15);

  }
  -[PSSpecifierController viewController](self, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("KeyboardExtension"), self, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v19;
  objc_msgSend(v4, "addObjectsFromArray:", v19);
  -[PSSpecifierController viewController](self, "viewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v17);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSThirdPartyAppController plistFileURL](self, "plistFileURL");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v6;
  v73 = v9;
  v71 = (void *)v22;
  v75 = v23;
  if (v23)
  {
    v24 = v23;
    v76 = v21;
    objc_msgSend(v23, "objectForKey:", CFSTR("StringsTable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByDeletingPathExtension");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PSSpecifierController specifier](self, "specifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setProperty:forKey:", v9, CFSTR("StringsTable"));

    }
    objc_msgSend(v24, "objectForKey:", CFSTR("ApplicationGroupContainerIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "groupContainerURLs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[PSSpecifierController specifier](self, "specifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setProperty:forKey:", v27, CFSTR("appGroupBundleID"));

        -[PSSpecifierController specifier](self, "specifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setProperty:forKey:", v27, CFSTR("containerBundleID"));

      }
      v24 = v75;
    }
    v68 = v17;
    objc_msgSend(v24, "objectForKey:", CFSTR("PreferenceSpecifiers"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = objc_msgSend(v33, "count");
      if (v34)
      {
        v35 = v34;
        for (i = 0; i != v35; ++i)
        {
          objc_msgSend(v33, "objectAtIndex:", i);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpecifierController specifier](self, "specifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:](PSAppListController, "specifiersFromDictionary:stringsTable:parentSpecifier:target:", v37, v9, v38, self);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            objc_msgSend(v76, "addObjectsFromArray:", v39);

        }
      }
    }
    else
    {
      NSLog(CFSTR("ERROR: Preference Items array is not an array"));
    }

    v17 = v68;
    v6 = v74;
    LODWORD(v9) = v73;
    v21 = v76;
  }
  else
  {
    NSLog(CFSTR("ERROR: Couldn't load plist from %@"), v22);
  }
  if (objc_msgSend(v21, "count"))
    v40 = v9;
  else
    v40 = 1;
  if (((v40 | v70) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("APP_SETTINGS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v45 = v21;
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", v46, v42);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v46) = objc_msgSend(v48, "isEqualToString:", v9);

    if ((v46 & 1) != 0)
    {
LABEL_34:

      LOBYTE(v9) = v73;
      v21 = v45;
      v6 = v74;
      goto LABEL_35;
    }
    v69 = v17;
    objc_msgSend(v45, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "cellType"))
    {

    }
    else
    {
      objc_msgSend(v45, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "name");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "length");

      if (!v52)
      {
        objc_msgSend(v45, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setName:", v9);
        goto LABEL_33;
      }
    }
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v53);
LABEL_33:
    v17 = v69;

    goto LABEL_34;
  }
LABEL_35:
  objc_msgSend(v4, "addObjectsFromArray:", v21);
  if ((v9 & 1) == 0)
  {
    -[PSThirdPartyAppController driverPolicy](self, "driverPolicy");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      v55 = -[PSDriverPolicyForApp initWithBundleIdentifier:]([PSDriverPolicyForApp alloc], "initWithBundleIdentifier:", v6);
      -[PSThirdPartyAppController setDriverPolicy:](self, "setDriverPolicy:", v55);

      -[PSThirdPartyAppController driverPolicy](self, "driverPolicy");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setDelegate:", self);

    }
    -[PSThirdPartyAppController driverPolicy](self, "driverPolicy");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "specifiers");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObjectsFromArray:", v58);
  }
  -[PSSpecifierController specifier](self, "specifier");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[PSSpecifierController specifier](self, "specifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "propertyForKey:", CFSTR("id"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
    {
      -[PSSpecifierController specifier](self, "specifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "propertyForKey:", CFSTR("AppBundleID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSSpecifierController specifier](self, "specifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setProperty:forKey:", v64, CFSTR("id"));

    }
  }
  v66 = (void *)objc_msgSend(v4, "copy");
  -[PSSpecifierController setSpecifiers:](self, "setSpecifiers:", v66);

  return -[PSSpecifierController specifiers](self, "specifiers");
}

- (id)bundle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PSSpecifierController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    v8 = v4;
  }
  else
  {
    -[PSSpecifierController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("AppBundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSystemPolicyManager thirdPartyApplicationForBundleID:](PSSystemPolicyManager, "thirdPartyApplicationForBundleID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Settings.bundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v14);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierController specifier](self, "specifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperty:forKey:", v8, CFSTR("AppSettingsBundle"));

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)plistFileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PSSpecifierController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("File"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSThirdPartyAppController bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("ERROR: Can't find plist %@ in bundle %@"), v4, v5);

  return v6;
}

- (PSSystemPolicyForApp)systemPolicy
{
  return self->_systemPolicy;
}

- (void)setSystemPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_systemPolicy, a3);
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_driverPolicy, a3);
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_appPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_systemPolicy, 0);
}

@end
