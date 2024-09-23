@implementation SpotlightSettingsController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sSpotlightBundle_1;
  if (!bundle_sSpotlightBundle_1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sSpotlightBundle_1;
    bundle_sSpotlightBundle_1 = v3;

    v2 = (void *)bundle_sSpotlightBundle_1;
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SpotlightSettingsController;
  -[SpotlightSettingsController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Search"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("SEARCH"), CFSTR("SpotlightSettings"), v6, v8);

  -[SpotlightSettingsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.search"), v9, MEMORY[0x24BDBD1A8], v4);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[SpotlightSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("SpotlightSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_25190D218, CFSTR("SpotlightSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SpotlightSettingsController setTitle:](self, "setTitle:", v7);

    -[SpotlightSettingsController configureSearchAndLoookupSpecifiersFor:](self, "configureSearchAndLoookupSpecifiersFor:", v5);
    -[SpotlightSettingsController configureAnonymouslyRecordingQueries:](self, "configureAnonymouslyRecordingQueries:", v5);
    -[SpotlightSettingsController configureApplicationListSpecifiersFor:](self, "configureApplicationListSpecifiersFor:", v5);
    v8 = (objc_class *)objc_msgSend(v5, "copy");
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)configureSearchAndLoookupSpecifiersFor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  SpotlightSettingsController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSRange v33;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_GROUP"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v7);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.sirisuggestions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedButtonTitle");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_FOOTER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v10;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A30]);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A58]);
  v33.location = objc_msgSend(v14, "rangeOfString:", v10);
  NSStringFromRange(v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A40]);

  v18 = self;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A50]);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("showAboutSearchSuggestionsSheet:"), *MEMORY[0x24BE75A38]);
  objc_msgSend(v5, "addObject:", v32);
  v20 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_SHOW_RECENTS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, v18, sel_setShowZKWRecentsEnabled_forSpecifier_, sel_isShowZKWRecentsEnabled_, 0, 6, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *MEMORY[0x24BE75A18];
  v25 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v23, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v26 = *MEMORY[0x24BE75868];
  objc_msgSend(v23, "setProperty:forKey:", v25, *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "addObject:", v23);
  v27 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_SHOW_RELATED_CONTENT"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, v18, sel_setShowInSpotlightEnabled_, sel_isShowInSpotlightEnabled, 0, 6, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setProperty:forKey:", v25, v24);
  objc_msgSend(v30, "setProperty:forKey:", v25, v26);
  objc_msgSend(v5, "addObject:", v30);

}

- (void)configureAnonymouslyRecordingQueries:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v4, "groupSpecifierWithName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SEARCH_ALLOW_ANONYMOUS_RECORDS_FOOTER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);
  v9 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SEARCH_ALLOW_ANONYMOUS_RECORDS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setAnonymouslyRecordSearchQueriesEnabled_, sel_isAnonymouslyRecordSearchQueriesEnabled, 0, 6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v14[0] = v6;
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

}

- (void)configureApplicationListSpecifiersFor:(id)a3
{
  SpotlightSettingsController *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *disabledSpotlightBundles;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *disabledSpotlightDomains;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t (*v17)(void);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *allAppsSpecifiers;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  void *v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v3 = self;
  v65 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  if (!self->_disabledSpotlightBundles)
  {
    v54 = 0;
    v55 = (uint64_t)&v54;
    v56 = 0x2020000000;
    v4 = getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    v57 = getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr_1)
    {
      v5 = (void *)SearchLibrary_1();
      v4 = dlsym(v5, "SPGetDisabledBundleSet");
      *(_QWORD *)(v55 + 24) = v4;
      getSPGetDisabledBundleSetSymbolLoc_ptr_1 = v4;
    }
    _Block_object_dispose(&v54, 8);
    if (!v4)
      -[SpotlightAppClipSettingsController specifiers].cold.1();
    ((void (*)(uint64_t))v4)(1);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightBundles = self->_disabledSpotlightBundles;
    self->_disabledSpotlightBundles = v6;

    v3 = self;
  }
  if (!v3->_disabledSpotlightDomains)
  {
    v54 = 0;
    v55 = (uint64_t)&v54;
    v56 = 0x2020000000;
    v8 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    v57 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    if (!getSPGetDisabledDomainSetSymbolLoc_ptr)
    {
      v9 = (void *)SearchLibrary_1();
      v8 = dlsym(v9, "SPGetDisabledDomainSet");
      *(_QWORD *)(v55 + 24) = v8;
      getSPGetDisabledDomainSetSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v54, 8);
    if (!v8)
      -[SpotlightAppClipSettingsController specifiers].cold.1();
    ((void (*)(uint64_t))v8)(1);
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightDomains = self->_disabledSpotlightDomains;
    self->_disabledSpotlightDomains = v10;

  }
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v16);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v13);
  }

  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v17 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  v62 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
  {
    v54 = MEMORY[0x24BDAC760];
    v55 = 3221225472;
    v56 = (uint64_t)__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
    v57 = &unk_25190D1A8;
    v58 = &v59;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)&v54);
    v17 = (uint64_t (*)(void))v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v17)
    -[SpotlightAppClipSettingsController specifiers].cold.1();
  v38 = (void *)v17();
  v41 = (id)objc_msgSend(v38, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minusSet:", v18);

  if ((-[NSSet isEqual:](self->_installedBundleIDs, "isEqual:", v41) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_installedBundleIDs, v41);
    v19 = (void *)objc_msgSend(v41, "mutableCopy");
    objc_msgSend(v19, "addObject:", CFSTR("com.apple.iCloudDriveApp"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v42 = v19;
    v20 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v47;
      v22 = *MEMORY[0x24BE75948];
      v23 = *MEMORY[0x24BE759F8];
      v24 = *MEMORY[0x24BE75A18];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v47 != v21)
            objc_enumerationMutation(v42);
          objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PSApplicationSpecifierForAssistantSection();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v27, "setProperty:forKey:", objc_opt_class(), v22);
            objc_msgSend(v27, "setProperty:forKey:", objc_opt_class(), v23);
            objc_msgSend(v27, "setDetailControllerClass:", objc_opt_class());
            objc_msgSend(v27, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v24);
            objc_msgSend(v43, "addObject:", v27);
          }

        }
        v20 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v43);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allAppsSpecifiers = self->_allAppsSpecifiers;
    self->_allAppsSpecifiers = v28;

  }
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v30);
  -[NSArray sortedArrayUsingComparator:](self->_allAppsSpecifiers, "sortedArrayUsingComparator:", &__block_literal_global);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v34, 0, 0, 0, 0, 1, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v35, "setDetailControllerClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "imageForKey:", *MEMORY[0x24BE757C0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setProperty:forKey:", v37, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v40, "addObject:", v35);
  objc_msgSend(v40, "addObjectsFromArray:", v31);

}

uint64_t __69__SpotlightSettingsController_configureApplicationListSpecifiersFor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)showAboutSearchSuggestionsSheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.sirisuggestions"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (id)isShowZKWRecentsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (void)saveSpotlightSettings
{
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledDomains"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightDomains, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)isShowInLookUpEnabled
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("ShowInLookupEnabled"), CFSTR("com.apple.spotlightui"));
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1C8];
  v4 = v2;

  return v4;
}

- (void)setShowInLookUpEnabled:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("ShowInLookupEnabled"), a3, CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)isShowInSpotlightEnabled
{
  uint64_t v3;

  if ((-[NSMutableSet containsObject:](self->_disabledSpotlightDomains, "containsObject:", CFSTR("DOMAIN_ZKWS")) & 1) != 0)
    v3 = 0;
  else
    v3 = -[NSMutableSet containsObject:](self->_disabledSpotlightDomains, "containsObject:", CFSTR("DOMAIN_PARSEC")) ^ 1;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
}

- (void)setShowInSpotlightEnabled:(id)a3
{
  int v4;
  NSMutableSet *disabledSpotlightDomains;

  v4 = objc_msgSend(a3, "intValue");
  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  if (v4)
  {
    -[NSMutableSet removeObject:](disabledSpotlightDomains, "removeObject:", CFSTR("DOMAIN_ZKWS"));
    -[NSMutableSet removeObject:](self->_disabledSpotlightDomains, "removeObject:", CFSTR("DOMAIN_PARSEC"));
  }
  else
  {
    -[NSMutableSet addObject:](disabledSpotlightDomains, "addObject:", CFSTR("DOMAIN_ZKWS"));
    -[NSMutableSet addObject:](self->_disabledSpotlightDomains, "addObject:", CFSTR("DOMAIN_PARSEC"));
  }
  -[SpotlightSettingsController saveSpotlightSettings](self, "saveSpotlightSettings");
}

- (id)isAnonymouslyRecordSearchQueriesEnabled
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSearchQueriesDataSharingStatus");

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3 < 2);
}

- (void)setAnonymouslyRecordSearchQueriesEnabled:(id)a3
{
  uint64_t v3;
  id v4;

  if (objc_msgSend(a3, "BOOLValue"))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchQueriesDataSharingStatus:completion:", v3, &__block_literal_global_94);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

@end
