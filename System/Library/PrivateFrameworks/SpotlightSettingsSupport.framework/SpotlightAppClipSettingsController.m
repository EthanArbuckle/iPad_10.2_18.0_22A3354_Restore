@implementation SpotlightAppClipSettingsController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sSpotlightBundle_0;
  if (!bundle_sSpotlightBundle_0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sSpotlightBundle_0;
    bundle_sSpotlightBundle_0 = v3;

    v2 = (void *)bundle_sSpotlightBundle_0;
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SpotlightAppClipSettingsController;
  -[SpotlightAppClipSettingsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend((id)objc_opt_class(), "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SpotlightAppClipSettingsController setTitle:](self, "setTitle:", v4);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *disabledSpotlightBundles;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *disabledSpotlightApps;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id *v39;
  id v40;
  id v41;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[6];

  v47[5] = *MEMORY[0x24BDAC8D0];
  if (!self->_disabledSpotlightBundles)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v3 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    v46 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
    {
      v4 = (void *)SearchLibrary();
      v3 = dlsym(v4, "SPGetDisabledBundleSet");
      v44[3] = (uint64_t)v3;
      getSPGetDisabledBundleSetSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v43, 8);
    if (!v3)
      -[SpotlightAppClipSettingsController specifiers].cold.1();
    ((void (*)(uint64_t))v3)(1);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightBundles = self->_disabledSpotlightBundles;
    self->_disabledSpotlightBundles = v5;

  }
  if (!self->_disabledSpotlightApps)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v7 = getSPGetDisabledAppSetSymbolLoc_ptr;
    v46 = getSPGetDisabledAppSetSymbolLoc_ptr;
    if (!getSPGetDisabledAppSetSymbolLoc_ptr)
    {
      v8 = (void *)SearchLibrary();
      v7 = dlsym(v8, "SPGetDisabledAppSet");
      v44[3] = (uint64_t)v7;
      getSPGetDisabledAppSetSymbolLoc_ptr = v7;
    }
    _Block_object_dispose(&v43, 8);
    if (!v7)
      -[SpotlightAppClipSettingsController specifiers].cold.1();
    ((void (*)(uint64_t))v7)(1);
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    disabledSpotlightApps = self->_disabledSpotlightApps;
    self->_disabledSpotlightApps = v9;

  }
  v11 = (void *)MEMORY[0x24BE75590];
  objc_msgSend((id)objc_opt_class(), "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_IN_APP_CLIPS_HEADER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "groupSpecifierWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_IN_APP_CLIPS_FOOTER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BE75A68];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A68]);

  v18 = (void *)MEMORY[0x24BE75590];
  objc_msgSend((id)objc_opt_class(), "bundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_LEARN_FROM_APP_CLIPS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel_setLearnFromAppClipsEnabled_specifier_, sel_learnFromAppClipsEnabled_, 0, 6, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x24BE75868];
  objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v23 = *MEMORY[0x24BE75A18];
  objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v24 = (void *)MEMORY[0x24BE75590];
  objc_msgSend((id)objc_opt_class(), "bundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SEARCH_PERAPP_ONHOMESCREEN_HEADER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "groupSpecifierWithName:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "bundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_IN_SEARCH_FOOTER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v17);

  v30 = (void *)MEMORY[0x24BE75590];
  objc_msgSend((id)objc_opt_class(), "bundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_SHOW_IN_SEARCH"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, self, sel_setShowInSearchEnabled_specifier_, sel_showInSearchEnabled_, 0, 6, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v22);
  objc_msgSend(v33, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
  v34 = (void *)MEMORY[0x24BE75590];
  objc_msgSend((id)objc_opt_class(), "bundle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS_SUGGEST_APP_CLIPS"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v36, self, sel_setSuggestAppClipsEnabled_specifier_, sel_suggestAppClipsEnabled_, 0, 6, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v22);
  objc_msgSend(v37, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
  v47[0] = v14;
  v47[1] = v21;
  v47[2] = v27;
  v47[3] = v33;
  v47[4] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 5);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v40 = *v39;
  *v39 = (id)v38;

  v41 = *v39;
  return v41;
}

- (void)setLearnFromAppClipsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsLearnFromAppClips"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (id)learnFromAppClipsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsLearnFromAppClips"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setShowInSearchEnabled:(id)a3 specifier:(id)a4
{
  int v5;
  NSMutableSet *disabledSpotlightBundles;

  v5 = objc_msgSend(a3, "BOOLValue");
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  if (v5)
  {
    -[NSMutableSet removeObject:](disabledSpotlightBundles, "removeObject:", CFSTR("com.apple.app-clips"));
    -[NSMutableSet removeObject:](self->_disabledSpotlightApps, "removeObject:", CFSTR("com.apple.app-clips"));
  }
  else
  {
    -[NSMutableSet addObject:](disabledSpotlightBundles, "addObject:", CFSTR("com.apple.app-clips"));
    -[NSMutableSet addObject:](self->_disabledSpotlightApps, "addObject:", CFSTR("com.apple.app-clips"));
  }
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledBundles"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightBundles, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledApps"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightApps, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.spotlightui.prefschanged");
}

- (id)showInSearchEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSMutableSet containsObject:](self->_disabledSpotlightBundles, "containsObject:", CFSTR("com.apple.app-clips")) ^ 1);
}

- (void)setSuggestAppClipsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsSuggestAppClips"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (id)suggestAppClipsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSuggestAppClips"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

- (void)specifiers
{
  dlerror();
  abort_report_np();
  CFNotificationCenterGetDarwinNotifyCenter();
}

@end
