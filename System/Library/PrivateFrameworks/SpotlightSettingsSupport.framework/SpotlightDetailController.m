@implementation SpotlightDetailController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *disabledSpotlightBundles;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *disabledSpotlightApps;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_disabledSpotlightBundles)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v5 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      v20 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledBundleSetSymbolLoc_ptr_0)
      {
        v6 = (void *)SearchLibrary_0();
        v5 = dlsym(v6, "SPGetDisabledBundleSet");
        v18[3] = (uint64_t)v5;
        getSPGetDisabledBundleSetSymbolLoc_ptr_0 = v5;
      }
      _Block_object_dispose(&v17, 8);
      if (!v5)
        -[SpotlightAppClipSettingsController specifiers].cold.1();
      ((void (*)(uint64_t))v5)(1);
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightBundles = self->_disabledSpotlightBundles;
      self->_disabledSpotlightBundles = v7;

    }
    if (!self->_disabledSpotlightApps)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v9 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
      v20 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledAppSetSymbolLoc_ptr_0)
      {
        v10 = (void *)SearchLibrary_0();
        v9 = dlsym(v10, "SPGetDisabledAppSet");
        v18[3] = (uint64_t)v9;
        getSPGetDisabledAppSetSymbolLoc_ptr_0 = v9;
      }
      _Block_object_dispose(&v17, 8);
      if (!v9)
        -[SpotlightAppClipSettingsController specifiers].cold.1();
      ((void (*)(uint64_t))v9)(1);
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightApps = self->_disabledSpotlightApps;
      self->_disabledSpotlightApps = v11;

    }
    -[SpotlightDetailController _bundleId](self, "_bundleId", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isApplicationHidden = -[SpotlightDetailController _isApplicationHiddenCheck:](self, "_isApplicationHiddenCheck:", v13);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
    -[SpotlightDetailController _addWhileSearchingSpecifiersToSpecifiers:](self, "_addWhileSearchingSpecifiersToSpecifiers:", v14);
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v14;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)_isApplicationHiddenCheck:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)_addWhileSearchingSpecifiersToSpecifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *whileSearchingGroup;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *v12;
  PSSpecifier *whileSearchingShowAppSpecifier;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  PSSpecifier *v19;
  PSSpecifier *whileSearchingShowContentSpecifier;
  void *v21;
  int v22;
  PSSpecifier *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_PERAPP_WHILESEARCHING_HEADER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v6);
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  whileSearchingGroup = self->_whileSearchingGroup;
  self->_whileSearchingGroup = v7;

  objc_msgSend(v30, "addObject:", self->_whileSearchingGroup);
  v9 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SEARCH_PERAPP_WHILESEARCHING_SHOWAPP_TOGGLE"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setWhileSearchingShowAppEnabled_specifier_, sel_whileSearchingShowAppEnabled_, 0, 6, 0);
  v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  whileSearchingShowAppSpecifier = self->_whileSearchingShowAppSpecifier;
  self->_whileSearchingShowAppSpecifier = v12;

  v14 = *MEMORY[0x24BE75868];
  -[PSSpecifier setProperty:forKey:](self->_whileSearchingShowAppSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  v15 = (_QWORD *)MEMORY[0x24BE75A18];
  if (self->_isApplicationHidden)
    -[PSSpecifier setProperty:forKey:](self->_whileSearchingShowAppSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  v16 = (void *)MEMORY[0x24BE75590];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEARCH_PERAPP_WHILESEARCHING_SHOWCONTENT_TOGGLE"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, sel_setWhileSearchingShowContentEnabled_specifier_, sel_whileSearchingShowContentEnabled_, 0, 6, 0);
  v19 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  whileSearchingShowContentSpecifier = self->_whileSearchingShowContentSpecifier;
  self->_whileSearchingShowContentSpecifier = v19;

  -[PSSpecifier setProperty:forKey:](self->_whileSearchingShowContentSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v14);
  if (self->_isApplicationHidden)
    -[PSSpecifier setProperty:forKey:](self->_whileSearchingShowContentSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v15);
  objc_msgSend(v30, "addObject:", self->_whileSearchingShowAppSpecifier);
  -[SpotlightDetailController whileSearchingShowAppEnabled:](self, "whileSearchingShowAppEnabled:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
    objc_msgSend(v30, "addObject:", self->_whileSearchingShowContentSpecifier);
  v23 = self->_whileSearchingGroup;
  v24 = (void *)MEMORY[0x24BDD17C8];
  +[SpotlightSettingsController bundle](SpotlightSettingsController, "bundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SEARCH_PERAPP_WHILESEARCHING_FOOTER"), &stru_25190D218, CFSTR("SpotlightSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SpotlightDetailController _appName](self, "_appName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SpotlightDetailController _appName](self, "_appName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v23, "setProperty:forKey:", v29, *MEMORY[0x24BE75A68]);

}

- (id)whileSearchingShowAppEnabled:(id)a3
{
  void *v3;
  NSMutableSet *disabledSpotlightApps;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledSpotlightApps = self->_disabledSpotlightApps;
  -[SpotlightDetailController _bundleId](self, "_bundleId", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSpotlightApps, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setWhileSearchingShowAppEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  PSSpecifier *whileSearchingShowContentSpecifier;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[SpotlightDetailController _saveWhileSearchingShowAppEnabled:](self, "_saveWhileSearchingShowAppEnabled:", v5);
  if ((_DWORD)v5)
  {
    v8[0] = self->_whileSearchingShowContentSpecifier;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SpotlightDetailController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v6, self->_whileSearchingShowAppSpecifier, 1);
  }
  else
  {
    -[SpotlightDetailController _saveWhileSearchingShowContentEnabled:](self, "_saveWhileSearchingShowContentEnabled:", 0);
    whileSearchingShowContentSpecifier = self->_whileSearchingShowContentSpecifier;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &whileSearchingShowContentSpecifier, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SpotlightDetailController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v6, 1);
  }

  notify_post("com.apple.spotlightui.prefschanged");
}

- (void)_saveWhileSearchingShowAppEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSMutableSet *disabledSpotlightApps;
  id v7;

  v3 = a3;
  -[SpotlightDetailController _bundleId](self, "_bundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  disabledSpotlightApps = self->_disabledSpotlightApps;
  v7 = (id)v5;
  if (v3)
    -[NSMutableSet removeObject:](disabledSpotlightApps, "removeObject:", v5);
  else
    -[NSMutableSet addObject:](disabledSpotlightApps, "addObject:", v5);
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledApps"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightApps, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (id)whileSearchingShowContentEnabled:(id)a3
{
  void *v3;
  NSMutableSet *disabledSpotlightBundles;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  -[SpotlightDetailController _bundleId](self, "_bundleId", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSpotlightBundles, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setWhileSearchingShowContentEnabled:(id)a3 specifier:(id)a4
{
  -[SpotlightDetailController _saveWhileSearchingShowContentEnabled:](self, "_saveWhileSearchingShowContentEnabled:", objc_msgSend(a3, "BOOLValue"));
  notify_post("com.apple.spotlightui.prefschanged");
}

- (void)_saveWhileSearchingShowContentEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSMutableSet *disabledSpotlightBundles;
  id v7;

  v3 = a3;
  -[SpotlightDetailController _bundleId](self, "_bundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  v7 = (id)v5;
  if (v3)
    -[NSMutableSet removeObject:](disabledSpotlightBundles, "removeObject:", v5);
  else
    -[NSMutableSet addObject:](disabledSpotlightBundles, "addObject:", v5);
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledBundles"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightBundles, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (id)_bundleId
{
  void *v2;
  void *v3;

  -[SpotlightDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_appName
{
  void *v2;
  void *v3;

  -[SpotlightDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("APP_NAME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whileSearchingShowContentSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingShowAppSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingGroup, 0);
  objc_storeStrong((id *)&self->_disabledSuggestApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightShortcuts, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledLockScreenBundles, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

@end
