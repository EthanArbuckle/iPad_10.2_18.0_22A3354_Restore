@implementation PUIAccessoriesController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = (int)*MEMORY[0x1E0D80590];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("APP_GROUP"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (MGGetBoolAnswer())
        v6 = CFSTR("ACCESSORY_SETUP_FOOTER_WLAN");
      else
        v6 = CFSTR("ACCESSORY_SETUP_FOOTER");
      PUI_LocalizedStringForPrivacy(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80848]);

      v13[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    return v4;
  }
  else
  {
    _PUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", v12, 2u);
    }

    return MEMORY[0x1E0C9AA60];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIAccessoriesController;
  -[PUIAccessoriesController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_shouldReloadApps)
  {
    -[PUIAccessoriesController refreshDADevicesSynchronously](self, "refreshDADevicesSynchronously");
    self->_shouldReloadApps = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIAccessoriesController;
  -[PUIAccessoriesController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIAccessoriesController provideNavigationDonations](self, "provideNavigationDonations");
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
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ACCESSORY_SETUP"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/ACCESSORIES"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAccessoriesController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.accessories"), v7, v11, v12);

}

- (void)viewDidDisappear:(BOOL)a3
{
  self->_shouldReloadApps = 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUIAccessoriesController;
  -[PUIAccessoriesController viewDidLoad](&v10, sel_viewDidLoad);
  if (_os_feature_enabled_impl())
  {
    -[PUIAccessoriesController session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_opt_new();
      -[PUIAccessoriesController setSession:](self, "setSession:", v4);

      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v8, &location);
      -[PUIAccessoriesController session](self, "session", v7, 3221225472, __39__PUIAccessoriesController_viewDidLoad__block_invoke, &unk_1EA26BE40);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEventHandler:", &v7);

      -[PUIAccessoriesController session](self, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activate");

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __39__PUIAccessoriesController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSessionEvent:", v3);

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifierForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  uint64_t v51;
  void *v52;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)MEMORY[0x1E0D804E8];
  if (v8 == 1)
    v10 = (uint64_t)NSClassFromString(CFSTR("ASAccessoryInfoViewController"));
  else
    v10 = objc_opt_class();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, v10, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x1E0D808D0]);

  objc_msgSend(v11, "setProperty:forKey:", v4, *MEMORY[0x1E0D808C0]);
  objc_msgSend(v11, "setProperty:forKey:", v4, CFSTR("bundleID"));
  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == 1)
  {
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v19 = objc_msgSend(v15, "count");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 == 2)
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v51 = v8;
    v24 = v6;
    v25 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForPrivacy(CFSTR("ACCESSORY_SETUP_ENUMERATE_TWO"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v28, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v25;
    v6 = v24;
    v8 = v51;
    goto LABEL_13;
  }
  v52 = v6;
  v29 = objc_msgSend(v20, "count");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29 == 3)
  {
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
    v50 = v5;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForPrivacy(CFSTR("ACCESSORY_SETUP_ENUMERATE_THREE"));
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v45 = (void *)v39;
    objc_msgSend(v38, "stringWithFormat:", v39, v16, v17, v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v50;
    v6 = v52;
    goto LABEL_13;
  }
  v40 = objc_msgSend(v30, "count");

  if (v40 >= 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUIAccessoriesController localizedRemainingNumberOfApprovedAccessories:](self, "localizedRemainingNumberOfApprovedAccessories:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForPrivacy(CFSTR("ACCESSORY_SETUP_ENUMERATE_MORE"));
    v39 = objc_claimAutoreleasedReturnValue();
    v50 = v5;
    goto LABEL_12;
  }
  v18 = 0;
  v6 = v52;
LABEL_14:
  objc_msgSend(v11, "setProperty:forKey:", v18, *MEMORY[0x1E0D80950]);
  if (v8 == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementMap, "objectForKeyedSubscript:", v4);
    v46 = v6;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v48, CFSTR("device"));

    v6 = v46;
    objc_msgSend(v11, "setProperty:forKey:", self->_session, CFSTR("session"));
  }

  return v11;
}

- (id)localizedRemainingNumberOfApprovedAccessories:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoriesManagementApprovedMap, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "count") - 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleSessionEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "eventType");
  if (v4 <= 0x2A && ((1 << v4) & 0x60000000400) != 0)
    -[PUIAccessoriesController refreshDADevices](self, "refreshDADevices");
}

- (void)remakeUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *accessoriesManagementMap;
  NSMutableDictionary *accessoriesManagementApprovedMap;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *v31;
  uint64_t v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  PUIAccessoriesController *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    -[PUIAccessoriesController appSpecifiers](self, "appSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIAccessoriesController removeContiguousSpecifiers:](self, "removeContiguousSpecifiers:", v6);

    accessoriesManagementMap = self->_accessoriesManagementMap;
    self->_accessoriesManagementMap = 0;

    accessoriesManagementApprovedMap = self->_accessoriesManagementApprovedMap;
    self->_accessoriesManagementApprovedMap = 0;

    -[PUIAccessoriesController setAppSpecifiers:](self, "setAppSpecifiers:", 0);
  }
  v45 = self;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v50 = v10;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v60;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v60 != v47)
          objc_enumerationMutation(obj);
        v49 = v11;
        v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
        _PUILoggingFacility();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v12;
          _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "Device fetched %@", buf, 0xCu);
        }

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v12, "appAccessInfoMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v56 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v20);

              }
              objc_msgSend(v9, "objectForKeyedSubscript:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v12);

              objc_msgSend(v12, "appAccessInfoMap");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "state");

              v10 = v50;
              if (v26 == 25)
              {
                objc_msgSend(v50, "objectForKeyedSubscript:", v20);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v27)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "setObject:forKeyedSubscript:", v28, v20);

                }
                objc_msgSend(v50, "objectForKeyedSubscript:", v20);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v12);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v17);
        }

        v11 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v48);
  }

  v30 = objc_msgSend(v9, "copy");
  v31 = v45->_accessoriesManagementMap;
  v45->_accessoriesManagementMap = (NSMutableDictionary *)v30;

  v32 = objc_msgSend(v10, "copy");
  v33 = v45->_accessoriesManagementApprovedMap;
  v45->_accessoriesManagementApprovedMap = (NSMutableDictionary *)v32;

  objc_msgSend(v9, "allKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v36 = v34;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(v36);
        -[PUIAccessoriesController specifierForApp:](v45, "specifierForApp:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v38);
  }

  objc_msgSend(v35, "sortUsingComparator:", &__block_literal_global_3);
  -[PUIAccessoriesController appSpecifiers](v45, "appSpecifiers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAccessoriesController removeContiguousSpecifiers:](v45, "removeContiguousSpecifiers:", v42);

  v43 = (void *)objc_msgSend(v35, "copy");
  -[PUIAccessoriesController setAppSpecifiers:](v45, "setAppSpecifiers:", v43);

  -[PUIAccessoriesController appSpecifiers](v45, "appSpecifiers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIAccessoriesController insertContiguousSpecifiers:afterSpecifierID:](v45, "insertContiguousSpecifiers:afterSpecifierID:", v44, CFSTR("APP_GROUP"));

}

uint64_t __37__PUIAccessoriesController_remakeUI___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)refreshDADevicesSynchronously
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D1D0E0], "getDevicesWithFlags:session:error:", 8, self->_session, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIAccessoriesController remakeUI:](self, "remakeUI:", v3);

}

- (void)refreshDADevices
{
  void *v3;
  _QWORD v4[5];

  -[PUIAccessoriesController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PUIAccessoriesController_refreshDADevices__block_invoke;
  v4[3] = &unk_1EA26BE88;
  v4[4] = self;
  objc_msgSend(v3, "getDevicesWithFlags:completionHandler:", 8, v4);

}

void __44__PUIAccessoriesController_refreshDADevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PUIAccessoriesController_refreshDADevices__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __44__PUIAccessoriesController_refreshDADevices__block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _PUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__PUIAccessoriesController_refreshDADevices__block_invoke_2_cold_1(v2, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "remakeUI:", *(_QWORD *)(a1 + 48));
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appSpecifiers, a3);
}

- (NSMutableDictionary)accessoriesManagementMap
{
  return self->_accessoriesManagementMap;
}

- (void)setAccessoriesManagementMap:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesManagementMap, a3);
}

- (NSMutableDictionary)accessoriesManagementApprovedMap
{
  return self->_accessoriesManagementApprovedMap;
}

- (void)setAccessoriesManagementApprovedMap:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesManagementApprovedMap, a3);
}

- (BOOL)shouldReloadApps
{
  return self->_shouldReloadApps;
}

- (void)setShouldReloadApps:(BOOL)a3
{
  self->_shouldReloadApps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesManagementApprovedMap, 0);
  objc_storeStrong((id *)&self->_accessoriesManagementMap, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __44__PUIAccessoriesController_refreshDADevices__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[PUIAccessoriesController refreshDADevices]_block_invoke_2";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "%s: Error getting devices: %@", (uint8_t *)&v3, 0x16u);
}

@end
