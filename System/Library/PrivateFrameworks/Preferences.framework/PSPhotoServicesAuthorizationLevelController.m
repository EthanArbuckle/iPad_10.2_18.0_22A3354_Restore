@implementation PSPhotoServicesAuthorizationLevelController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  -[PSListItemsController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PUIPhotosPrivacyUpgradePromptCompletedNotification"), 0);

}

- (void)_handleUpgradePromptNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  dispatch_time_t v7;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIPhotosPrivacyUpgradePromptAppIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_clientIdentifier);

  if (v6)
  {
    v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PSPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E4A654F0;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __80__PSPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_parentTCCSpecifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  void *v10;
  int v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  int v22;
  uint64_t v23;
  char v25;
  void *limitedLibraryRowSpecifier;
  void (*PXTCCSettingsFullAccessSubtitleSymbolLoc)(void);
  void *v29;
  PSSpecifier *v30;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  __int128 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  -[PSListItemsController specifiers](&v43, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    v32 = v2;
    if (!v5)
      goto LABEL_11;
    v6 = v5;
    v7 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (v9[7] == 3)
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "intValue");

          if (v11 == 4)
          {
            v12 = 1;
LABEL_14:

            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v14 = v4;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            if (!v15)
              goto LABEL_51;
            v16 = v15;
            v17 = *(_QWORD *)v36;
            v18 = v12 ^ 1;
            v33 = v3;
            while (2)
            {
              v19 = 0;
LABEL_17:
              if (*(_QWORD *)v36 != v17)
                objc_enumerationMutation(v14);
              v20 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * v19);
              objc_msgSend(v20, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "intValue");

              v23 = v20[7];
              if (v23 != 3 || v22 != 4)
              {
                if (v23 == 3)
                  v25 = v18;
                else
                  v25 = 1;
                if ((v25 & 1) == 0 && !v22)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 4);
                  limitedLibraryRowSpecifier = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setIdentifier:", limitedLibraryRowSpecifier);
                  goto LABEL_29;
                }
                if (v23 == 3 && (v22 & 0xFFFFFFFE) == 2)
                {
                  objc_msgSend(v20, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
                  if (v22 == 3)
                  {
                    if (!PhotosUICoreLibraryCore_frameworkLibrary_0)
                    {
                      v46 = xmmword_1E4A68660;
                      v47 = 0;
                      PhotosUICoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
                    }
                    if (!PhotosUICoreLibraryCore_frameworkLibrary_0
                      || !getPXTCCSettingsLimitedAccessSubtitleSymbolLoc())
                    {
                      goto LABEL_48;
                    }
                    PSPXTCCSettingsLimitedAccessSubtitle(self->_clientIdentifier);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setProperty:forKey:", v29, CFSTR("cellSubtitleText"));

                    v30 = v20;
                    limitedLibraryRowSpecifier = self->_limitedLibraryRowSpecifier;
                    self->_limitedLibraryRowSpecifier = v30;
                    v3 = v33;
                  }
                  else
                  {
                    if (v22 != 2)
                      goto LABEL_48;
                    if (!PhotosUICoreLibraryCore_frameworkLibrary_0)
                    {
                      v46 = xmmword_1E4A68660;
                      v47 = 0;
                      PhotosUICoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
                    }
                    if (!PhotosUICoreLibraryCore_frameworkLibrary_0 || !getPXTCCSettingsFullAccessSubtitleSymbolLoc())
                      goto LABEL_48;
                    PXTCCSettingsFullAccessSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsFullAccessSubtitleSymbolLoc();
                    if (!PXTCCSettingsFullAccessSubtitleSymbolLoc)
                      PSPNCreateFormattedStringWithCountry_cold_1();
                    PXTCCSettingsFullAccessSubtitleSymbolLoc();
                    limitedLibraryRowSpecifier = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setProperty:forKey:", limitedLibraryRowSpecifier, CFSTR("cellSubtitleText"));
                  }
LABEL_29:

                }
LABEL_48:
                objc_msgSend(v3, "addObject:", v20);
              }
              if (v16 == ++v19)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
                if (!v16)
                {
LABEL_51:

                  v13 = (id)objc_msgSend(v3, "copy");
                  v2 = v32;
                  goto LABEL_52;
                }
                continue;
              }
              goto LABEL_17;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (!v6)
      {
LABEL_11:
        v12 = 0;
        goto LABEL_14;
      }
    }
  }
  v13 = v2;
LABEL_52:

  return v13;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *clientIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  v4 = a3;
  -[PSListController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("appBundleID"), v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v5;

}

- (id)specifiers
{
  PSPhotoServicesAuthorizationLevelController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *specifiers;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    v3 = -[PSPhotoServicesAuthorizationLevelController _currentTCCAuthorizationRight](v2, "_currentTCCAuthorizationRight");
    if (_os_feature_enabled_impl())
    {
      -[PSListController specifier](v2, "specifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "propertyForKey:", CFSTR("hasPickerInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");
      if (v3 == 2)
        v7 = 0;
      else
        v7 = v6;

    }
    else
    {
      v7 = 0;
    }
    -[PSListController specifier](v2, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("hasTCCOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v10)
    {
      -[PSPhotoServicesAuthorizationLevelController _parentTCCSpecifiers](v2, "_parentTCCSpecifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v12);
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSPhotoServicesAuthorizationLevelController footerStringForSpecifiers:](v2, "footerStringForSpecifiers:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v14, CFSTR("footerText"));
      -[PSPhotoServicesAuthorizationLevelController _limitedLibrarySectionSpecifiers](v2, "_limitedLibrarySectionSpecifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v15);

    }
    -[PSPhotoServicesAuthorizationLevelController _pickerUsageSectionSpecifiers](v2, "_pickerUsageSectionSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_AUTH_ONGOING_HEADER"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setName:", v19);

      }
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v17);
    }
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v11;

  }
  objc_sync_exit(v2);

  return v2->super.super._specifiers;
}

- (id)footerStringForSpecifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "values");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        if (v11 == 3)
        {
          PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_AUTH_FOOTER"));
          v12 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_presentImagePickerForModifyingSelection
{
  NSString *clientIdentifier;
  void *v4;
  Class v5;
  Class v6;
  PSSpecifier *v7;
  NSString *v8;
  NSString *v9;
  PSSpecifier *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PSSpecifier *v16;
  NSString *v17;
  PSPhotoServicesAuthorizationLevelController *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  clientIdentifier = self->_clientIdentifier;
  v19 = CFSTR("PHLimitedLibraryPickerClientApplicationIdentifier");
  v20[0] = clientIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(CFSTR("PHLimitedLibraryPicker"));
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = self->_limitedLibraryRowSpecifier;
      v8 = self->_clientIdentifier;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke;
      v15 = &unk_1E4A685E0;
      v16 = v7;
      v17 = v8;
      v18 = self;
      v9 = v8;
      v10 = v7;
      v11 = (void *)MEMORY[0x1A8594D10](&v12);
      -[objc_class presentLimitedLibraryPickerFromViewController:options:completionHandler:](v6, "presentLimitedLibraryPickerFromViewController:options:completionHandler:", self, v4, v11, v12, v13, v14, v15);

    }
    else
    {
      -[objc_class presentLimitedLibraryPickerFromViewController:options:](v6, "presentLimitedLibraryPickerFromViewController:options:", self, v4);
    }
  }

}

void __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2;
  block[3] = &unk_1E4A66370;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  PSPXTCCSettingsLimitedAccessSubtitle(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v3, CFSTR("cellSubtitleText"));

  return objc_msgSend(*(id *)(a1 + 48), "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (id)_locationSetting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.photos.picker"));
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pickerShouldStripLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 ^ 1u);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_pickerUsageSectionSpecifiers
{
  PSPhotoServicesAuthorizationLevelController *v2;
  int *v3;
  Class v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *pickerUsageSectionSpecifiers;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  BOOL v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *v35;
  void *v36;
  int v37;
  NSArray *v38;
  void *v40;
  void *v41;
  PSPhotoServicesAuthorizationLevelController *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;

  v2 = self;
  v50 = *MEMORY[0x1E0C80C00];
  v3 = &OBJC_IVAR___PSSearchModel__waitUntilFinished;
  if (!self->_pickerUsageSectionSpecifiers)
  {
    v4 = NSClassFromString(CFSTR("PSPhotosPickerInfoCell"));
    if (_os_feature_enabled_impl())
    {
      if (v4)
      {
        +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setProperty:forKey:", CFSTR("PHOTOS_PICKER_INFO_GROUP"), CFSTR("id"));
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, 0, 0, -1, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setProperty:forKey:", CFSTR("PHOTOS_PICKER_INFO_CELL"), CFSTR("id"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBC10]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setProperty:forKey:", v7, CFSTR("height"));

        objc_msgSend(v6, "setProperty:forKey:", v4, CFSTR("cellClass"));
        v40 = v6;
        v41 = v5;
        v48[0] = v5;
        v48[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
        v8 = objc_claimAutoreleasedReturnValue();
        pickerUsageSectionSpecifiers = v2->_pickerUsageSectionSpecifiers;
        v42 = v2;
        v2->_pickerUsageSectionSpecifiers = (NSArray *)v8;

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (_os_feature_enabled_impl())
          v11 = 2592000.0;
        else
          v11 = 86400.0;
        objc_msgSend(getPLPrivacyClass(), "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "photosPickerPresentedLibraryLogsByClient");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v44 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              getPLPhotosPickerLogClientBundleIdentifierKey();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              getPLPhotosPickerLogPresentedTimestampKey();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pickerUsesOptions"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "timeIntervalSinceNow");
              v26 = v25 > 0.0 || v11 <= -v25;
              if (!v26 && objc_msgSend(v24, "BOOLValue"))
                objc_msgSend(v10, "addObject:", v21);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          }
          while (v16);
        }

        v27 = (void *)objc_msgSend(v10, "copy");
        v3 = &OBJC_IVAR___PSSearchModel__waitUntilFinished;
        v2 = v42;
        v28 = objc_msgSend(v27, "containsObject:", v42->_clientIdentifier);

        if (v28)
        {
          PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_TITLE"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, v42, 0, sel__locationSetting_, objc_opt_class(), 2, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "setIdentifier:", CFSTR("PHOTOS_PICKER_OPTIONS_CELL"));
          objc_msgSend(v30, "setProperty:forKey:", v42->_clientIdentifier, CFSTR("appBundleID"));
          PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_NO_LOCATION"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v31;
          PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_LOCATION"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v47[1] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setValues:titles:", &unk_1E4A92DD8, v33);

          -[NSArray arrayByAddingObject:](v42->_pickerUsageSectionSpecifiers, "arrayByAddingObject:", v30);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = v42->_pickerUsageSectionSpecifiers;
          v42->_pickerUsageSectionSpecifiers = (NSArray *)v34;

        }
      }
    }
  }
  PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "containsObject:", *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3[230]));

  if (v37)
    v38 = v2->_pickerUsageSectionSpecifiers;
  else
    v38 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v38;
}

- (id)_limitedLibrarySectionSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *limitedLibrarySectionSpecifiers;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->_limitedLibrarySectionSpecifiers)
  {
    +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", CFSTR("PHOTOS_MANUAL_SELECTION_GROUP"), CFSTR("id"));
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_MANUAL_SELECTION_BUTTON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("enabled"));

    objc_msgSend(v5, "setProperty:forKey:", CFSTR("PHOTOS_MANUAL_SELECTION_BUTTON"), CFSTR("id"));
    objc_msgSend(v5, "setButtonAction:", sel__presentImagePickerForModifyingSelection);
    v10[0] = v3;
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    self->_limitedLibrarySectionSpecifiers = v7;

  }
  if (-[PSPhotoServicesAuthorizationLevelController _currentTCCAuthorizationRight](self, "_currentTCCAuthorizationRight") == 3)return self->_limitedLibrarySectionSpecifiers;
  else
    return MEMORY[0x1E0C9AA60];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  BOOL v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v8 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSListController specifierAtIndex:](self, "specifierAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "propertyForKey:", CFSTR("id"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("PHOTOS_MANUAL_SELECTION_BUTTON"));

      if (v12)
      {
        objc_msgSend(v10, "performButtonAction");
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      }
      else
      {
        objc_msgSend(v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PHOTOS_PICKER_OPTIONS_CELL"));

        if (v14)
        {
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
          -[PSListController selectSpecifier:](self, "selectSpecifier:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 != v16)
              -[PSListController showController:](self, "showController:", v15);
          }

        }
        else
        {
          v22.receiver = self;
          v22.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
          -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v22, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
          objc_msgSend(v10, "values");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

          if (v19 == 2)
          {
            -[PSPhotoServicesAuthorizationLevelController _removeLimitedLibrarySectionIfPresent](self, "_removeLimitedLibrarySectionIfPresent");
            -[PSPhotoServicesAuthorizationLevelController _removePickerUsageSectionIfPresent](self, "_removePickerUsageSectionIfPresent");
          }
          else if (v19 == 3)
          {
            -[NSArray firstObject](self->_limitedLibrarySectionSpecifiers, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v20);

            if (!v21)
            {
              -[PSPhotoServicesAuthorizationLevelController _addLimitedLibrarySection](self, "_addLimitedLibrarySection");
              -[PSPhotoServicesAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
              -[PSPhotoServicesAuthorizationLevelController _presentImagePickerForModifyingSelection](self, "_presentImagePickerForModifyingSelection");
            }
          }
          else
          {
            -[PSPhotoServicesAuthorizationLevelController _removeLimitedLibrarySectionIfPresent](self, "_removeLimitedLibrarySectionIfPresent");
            -[PSPhotoServicesAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
          }
        }
      }
    }

  }
}

- (void)_addLimitedLibrarySection
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  int64_t v6;

  if (-[NSArray count](self->_pickerUsageSectionSpecifiers, "count")
    && (-[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3),
        v3,
        v4))
  {
    -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v5);

    -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_limitedLibrarySectionSpecifiers, v6, 1);
  }
  else
  {
    -[PSListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_limitedLibrarySectionSpecifiers, 1);
  }
}

- (void)_removeLimitedLibrarySectionIfPresent
{
  void *v3;
  _BOOL4 v4;

  -[NSArray firstObject](self->_limitedLibrarySectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_limitedLibrarySectionSpecifiers, 1);
}

- (void)_addPickerUsageSectionIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PSListController containsSpecifier:](self, "containsSpecifier:"))
  {

  }
  else
  {
    PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", self->_clientIdentifier);

    if (v4)
      -[PSListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_pickerUsageSectionSpecifiers, 1);
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  void *v3;
  _BOOL4 v4;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_pickerUsageSectionSpecifiers, 1);
}

- (unint64_t)_currentTCCAuthorizationRight
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (_currentTCCAuthorizationRight_onceToken_0 != -1)
    dispatch_once(&_currentTCCAuthorizationRight_onceToken_0, &__block_literal_global_33);
  -[NSString cStringUsingEncoding:](self->_clientIdentifier, "cStringUsingEncoding:", 4);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5 = (id)tcc_identity_create();
  tcc_server_message_get_authorization_records_by_identity();
  v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_currentTCCAuthorizationRight_tccServer_0;
  _currentTCCAuthorizationRight_tccServer_0 = v0;

}

void __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    tcc_authorization_record_get_service();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", tcc_service_get_name(), 4);
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("kTCCServicePhotos")))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = tcc_authorization_record_get_authorization_right();

  }
  else
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
  objc_storeStrong((id *)&self->_entityBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedLibrarySectionSpecifiers, 0);
}

void __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1A3819000, v0, v1, "Error when requesting TCC for identity: %@ error: %@");
  OUTLINED_FUNCTION_11();
}

@end
