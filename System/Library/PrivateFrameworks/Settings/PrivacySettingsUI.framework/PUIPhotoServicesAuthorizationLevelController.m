@implementation PUIPhotoServicesAuthorizationLevelController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  -[PSListItemsController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PUIPhotosPrivacyUpgradePromptCompletedNotification"), 0);

}

- (void)_handleUpgradePromptNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  dispatch_time_t v8;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIPhotosPrivacyUpgradePromptAppIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotoServicesAuthorizationLevelController serviceKey](self, "serviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PUIPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1EA26B358;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __81__PUIPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_parentTCCSpecifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  void *v22;
  int v23;
  uint64_t v24;
  char v26;
  void *limitedLibraryRowSpecifier;
  void (*PXTCCSettingsFullAccessSubtitleSymbolLoc)(void);
  void *v30;
  PSSpecifier *v31;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  __int128 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  -[PSListItemsController specifiers](&v46, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v6 = (int *)MEMORY[0x1E0D805B0];
    v33 = v2;
    if (!v5)
      goto LABEL_11;
    v7 = v5;
    v8 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v4);
        v10 = *(char **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (*(_QWORD *)&v10[*v6] == 3)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          if (v12 == 5)
          {
            v13 = 1;
LABEL_14:

            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v15 = v4;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (!v16)
              goto LABEL_51;
            v17 = v16;
            v18 = *(_QWORD *)v39;
            v37 = *MEMORY[0x1E0D80780];
            v19 = v13 ^ 1;
            v36 = *MEMORY[0x1E0D80740];
            v34 = v3;
            while (2)
            {
              v20 = 0;
LABEL_17:
              if (*(_QWORD *)v39 != v18)
                objc_enumerationMutation(v15);
              v21 = *(char **)(*((_QWORD *)&v38 + 1) + 8 * v20);
              objc_msgSend(v21, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "intValue");

              v24 = *(_QWORD *)&v21[*v6];
              if (v24 != 3 || v23 != 5)
              {
                if (v24 == 3)
                  v26 = v19;
                else
                  v26 = 1;
                if ((v26 & 1) == 0 && !v23)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 5);
                  limitedLibraryRowSpecifier = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setIdentifier:", limitedLibraryRowSpecifier);
                  goto LABEL_29;
                }
                if (v24 == 3 && (v23 & 0xFFFFFFFE) == 2)
                {
                  objc_msgSend(v21, "setProperty:forKey:", objc_opt_class(), v37);
                  if (v23 == 3)
                  {
                    if (!PhotosUICoreLibraryCore_frameworkLibrary)
                    {
                      v49 = xmmword_1EA26CB00;
                      v50 = 0;
                      PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
                    }
                    if (!PhotosUICoreLibraryCore_frameworkLibrary || !getPXTCCSettingsLimitedAccessSubtitleSymbolLoc())
                      goto LABEL_48;
                    PSPXTCCSettingsLimitedAccessSubtitle(self->_serviceKey);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "setProperty:forKey:", v30, v36);

                    v31 = v21;
                    limitedLibraryRowSpecifier = self->_limitedLibraryRowSpecifier;
                    self->_limitedLibraryRowSpecifier = v31;
                    v3 = v34;
                  }
                  else
                  {
                    if (v23 != 2)
                      goto LABEL_48;
                    if (!PhotosUICoreLibraryCore_frameworkLibrary)
                    {
                      v49 = xmmword_1EA26CB00;
                      v50 = 0;
                      PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
                    }
                    if (!PhotosUICoreLibraryCore_frameworkLibrary || !getPXTCCSettingsFullAccessSubtitleSymbolLoc())
                      goto LABEL_48;
                    PXTCCSettingsFullAccessSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsFullAccessSubtitleSymbolLoc();
                    if (!PXTCCSettingsFullAccessSubtitleSymbolLoc)
                      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
                    PXTCCSettingsFullAccessSubtitleSymbolLoc();
                    limitedLibraryRowSpecifier = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "setProperty:forKey:", limitedLibraryRowSpecifier, v36);
                  }
LABEL_29:

                }
LABEL_48:
                objc_msgSend(v3, "addObject:", v21);
              }
              if (v17 == ++v20)
              {
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
                if (!v17)
                {
LABEL_51:

                  v14 = (id)objc_msgSend(v3, "copy");
                  v2 = v33;
                  goto LABEL_52;
                }
                continue;
              }
              goto LABEL_17;
            }
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (!v7)
      {
LABEL_11:
        v13 = 0;
        goto LABEL_14;
      }
    }
  }
  v14 = v2;
LABEL_52:

  return v14;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  v4 = a3;
  -[PUIPhotoServicesAuthorizationLevelController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

}

- (id)specifiers
{
  PUIPhotoServicesAuthorizationLevelController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
    v4 = -[PUIPhotoServicesAuthorizationLevelController _currentTCCAuthorizationRight](v2, "_currentTCCAuthorizationRight");
    if (_os_feature_enabled_impl())
    {
      -[PUIPhotoServicesAuthorizationLevelController specifier](v2, "specifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "propertyForKey:", CFSTR("hasPickerInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");
      if (v4 == 2)
        v8 = 0;
      else
        v8 = v7;

    }
    else
    {
      v8 = 0;
    }
    -[PUIPhotoServicesAuthorizationLevelController specifier](v2, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("hasTCCOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v11)
    {
      -[PUIPhotoServicesAuthorizationLevelController _parentTCCSpecifiers](v2, "_parentTCCSpecifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v13);
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPhotoServicesAuthorizationLevelController footerStringForSpecifiers:](v2, "footerStringForSpecifiers:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "setProperty:forKey:", v15, *MEMORY[0x1E0D80848]);
      -[PUIPhotoServicesAuthorizationLevelController _limitedLibrarySectionSpecifiers](v2, "_limitedLibrarySectionSpecifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v16);

    }
    -[PUIPhotoServicesAuthorizationLevelController _pickerUsageSectionSpecifiers](v2, "_pickerUsageSectionSpecifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v8)
    {
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v17, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_AUTH_ONGOING_HEADER"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v20);

      }
      objc_msgSend(v12, "addObjectsFromArray:", v18);
    }
    v21 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v12;

  }
  objc_sync_exit(v2);

  return *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
}

- (id)footerStringForSpecifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "values", (_QWORD)v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", &unk_1EA27E840);

        objc_msgSend(v8, "values");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", &unk_1EA27E858);

        if ((v11 & 1) != 0 || v14)
        {

          PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_AUTH_PHOTOKIT_FOOTER"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }

  v15 = 0;
LABEL_12:

  return v15;
}

- (void)_presentImagePickerForModifyingSelection
{
  void *v3;
  void *v4;
  PSSpecifier *v5;
  NSString *v6;
  NSString *v7;
  PSSpecifier *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  PSSpecifier *v14;
  NSString *v15;
  PUIPhotoServicesAuthorizationLevelController *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = *MEMORY[0x1E0CD2200];
  -[PUIPhotoServicesAuthorizationLevelController serviceKey](self, "serviceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = self->_limitedLibraryRowSpecifier;
    v6 = self->_serviceKey;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke;
    v13 = &unk_1EA26CA18;
    v14 = v5;
    v15 = v6;
    v16 = self;
    v7 = v6;
    v8 = v5;
    v9 = (void *)MEMORY[0x1DF0AB308](&v10);
    objc_msgSend(MEMORY[0x1E0CD2158], "presentLimitedLibraryPickerFromViewController:options:completionHandler:", self, v4, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2158], "presentLimitedLibraryPickerFromViewController:options:", self, v4);
  }

}

void __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke(uint64_t a1)
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
  block[2] = __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2;
  block[3] = &unk_1EA26B638;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  PSPXTCCSettingsLimitedAccessSubtitle(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v3, *MEMORY[0x1E0D80740]);

  return objc_msgSend(*(id *)(a1 + 48), "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (id)_pickerUsageSectionSpecifiers
{
  PUIPhotoServicesAuthorizationLevelController *v2;
  int *v3;
  Class v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *pickerUsageSectionSpecifiers;
  Class v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  BOOL v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *v37;
  void *v38;
  int v39;
  NSArray *v40;
  Class v42;
  void *v43;
  PUIPhotoServicesAuthorizationLevelController *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v2 = self;
  v53 = *MEMORY[0x1E0C80C00];
  v3 = &OBJC_IVAR___PUILocationServicesAuthLevelCell__isWebApp;
  if (!self->_pickerUsageSectionSpecifiers)
  {
    v4 = NSClassFromString(CFSTR("PSPhotosPickerInfoCell"));
    if (_os_feature_enabled_impl())
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *MEMORY[0x1E0D80868];
        objc_msgSend(v5, "setProperty:forKey:", CFSTR("PHOTOS_PICKER_INFO_GROUP"), *MEMORY[0x1E0D80868]);
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, 0, 0, -1, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setProperty:forKey:", CFSTR("PHOTOS_PICKER_INFO_CELL"), v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80938]);

        objc_msgSend(v7, "setProperty:forKey:", v4, *MEMORY[0x1E0D80780]);
        v51[0] = v5;
        v51[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v9 = objc_claimAutoreleasedReturnValue();
        pickerUsageSectionSpecifiers = v2->_pickerUsageSectionSpecifiers;
        v2->_pickerUsageSectionSpecifiers = (NSArray *)v9;

        v11 = NSClassFromString(CFSTR("PSPhotosPickerOptionsController"));
        if (v11)
        {
          v42 = v11;
          v43 = v5;
          v44 = v2;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl())
            v12 = 2592000.0;
          else
            v12 = 86400.0;
          objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "photosPickerPresentedLibraryLogsByClient");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v47;
            v19 = *MEMORY[0x1E0D744B0];
            v20 = *MEMORY[0x1E0D744B8];
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v47 != v18)
                  objc_enumerationMutation(v15);
                v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                objc_msgSend(v22, "objectForKeyedSubscript:", v19);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", v20);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("pickerUsesOptions"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "timeIntervalSinceNow");
                v27 = v26 > 0.0 || v12 <= -v26;
                if (!v27 && objc_msgSend(v25, "BOOLValue"))
                  objc_msgSend(v45, "addObject:", v23);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            }
            while (v17);
          }

          v28 = (void *)objc_msgSend(v45, "copy");
          v3 = &OBJC_IVAR___PUILocationServicesAuthLevelCell__isWebApp;
          v2 = v44;
          v29 = objc_msgSend(v28, "containsObject:", v44->_serviceKey);

          v5 = v43;
          if (v29)
          {
            v30 = (void *)MEMORY[0x1E0D804E8];
            PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_TITLE"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, v44, 0, sel__locationSetting_, v42, 2, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "setIdentifier:", CFSTR("PHOTOS_PICKER_OPTIONS_CELL"));
            objc_msgSend(v32, "setProperty:forKey:", v44->_serviceKey, CFSTR("appBundleID"));
            PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_NO_LOCATION"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = v33;
            PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_OPTIONS_CELL_LOCATION"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v50[1] = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setValues:titles:", &unk_1EA27EAF8, v35);

            -[NSArray arrayByAddingObject:](v44->_pickerUsageSectionSpecifiers, "arrayByAddingObject:", v32);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v44->_pickerUsageSectionSpecifiers;
            v44->_pickerUsageSectionSpecifiers = (NSArray *)v36;

          }
        }

      }
    }
  }
  PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "containsObject:", *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3[45]));

  if (v39)
    v40 = v2->_pickerUsageSectionSpecifiers;
  else
    v40 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v40;
}

- (id)_limitedLibrarySectionSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *limitedLibrarySectionSpecifiers;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!self->_limitedLibrarySectionSpecifiers)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D80868];
    objc_msgSend(v3, "setProperty:forKey:", CFSTR("PHOTOS_MANUAL_SELECTION_GROUP"), *MEMORY[0x1E0D80868]);
    v5 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_MANUAL_SELECTION_BUTTON"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80808]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("PHOTOS_MANUAL_SELECTION_BUTTON"), v4);
    objc_msgSend(v7, "setButtonAction:", sel__presentImagePickerForModifyingSelection);
    v12[0] = v3;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    self->_limitedLibrarySectionSpecifiers = v9;

  }
  if (-[PUIPhotoServicesAuthorizationLevelController _currentTCCAuthorizationRight](self, "_currentTCCAuthorizationRight") == 3)return self->_limitedLibrarySectionSpecifiers;
  else
    return MEMORY[0x1E0C9AA60];
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
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_serviceKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pickerShouldStripLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 ^ 1u);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
    dispatch_once(&_currentTCCAuthorizationRight_onceToken_0, &__block_literal_global_18);
  -[NSString cStringUsingEncoding:](self->_serviceKey, "cStringUsingEncoding:", 4);
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

void __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_currentTCCAuthorizationRight_tccServer_0;
  _currentTCCAuthorizationRight_tccServer_0 = v0;

}

void __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
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
  char v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v8 = -[PUIPhotoServicesAuthorizationLevelController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUIPhotoServicesAuthorizationLevelController specifierAtIndex:](self, "specifierAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "propertyForKey:", *MEMORY[0x1E0D80868]);
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
          -[PUIPhotoServicesAuthorizationLevelController selectSpecifier:](self, "selectSpecifier:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 != v16)
              -[PUIPhotoServicesAuthorizationLevelController showController:](self, "showController:", v15);
          }

        }
        else
        {
          v22.receiver = self;
          v22.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
          -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v22, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
          objc_msgSend(v10, "values");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

          if (v19 == 2)
          {
            -[PUIPhotoServicesAuthorizationLevelController _removeLimitedLibrarySectionIfPresent](self, "_removeLimitedLibrarySectionIfPresent");
            -[PUIPhotoServicesAuthorizationLevelController _removePickerUsageSectionIfPresent](self, "_removePickerUsageSectionIfPresent");
          }
          else if (v19 == 3)
          {
            -[NSArray firstObject](self->_limitedLibrarySectionSpecifiers, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v20);

            if ((v21 & 1) == 0)
            {
              -[PUIPhotoServicesAuthorizationLevelController _addLimitedLibrarySection](self, "_addLimitedLibrarySection");
              -[PUIPhotoServicesAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
              -[PUIPhotoServicesAuthorizationLevelController _presentImagePickerForModifyingSelection](self, "_presentImagePickerForModifyingSelection");
            }
          }
          else
          {
            -[PUIPhotoServicesAuthorizationLevelController _removeLimitedLibrarySectionIfPresent](self, "_removeLimitedLibrarySectionIfPresent");
            -[PUIPhotoServicesAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
          }
        }
      }
    }

  }
}

- (void)_addLimitedLibrarySection
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (-[NSArray count](self->_pickerUsageSectionSpecifiers, "count")
    && (-[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3),
        v3,
        v4))
  {
    -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUIPhotoServicesAuthorizationLevelController indexOfSpecifier:](self, "indexOfSpecifier:", v5);

    -[PUIPhotoServicesAuthorizationLevelController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_limitedLibrarySectionSpecifiers, v6, 1);
  }
  else
  {
    -[PUIPhotoServicesAuthorizationLevelController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_limitedLibrarySectionSpecifiers, 1);
  }
}

- (void)_removeLimitedLibrarySectionIfPresent
{
  void *v3;
  int v4;

  -[NSArray firstObject](self->_limitedLibrarySectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PUIPhotoServicesAuthorizationLevelController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_limitedLibrarySectionSpecifiers, 1);
}

- (void)_addPickerUsageSectionIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:"))
  {

  }
  else
  {
    PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", self->_serviceKey);

    if (v4)
      -[PUIPhotoServicesAuthorizationLevelController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_pickerUsageSectionSpecifiers, 1);
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  void *v3;
  int v4;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PUIPhotoServicesAuthorizationLevelController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_pickerUsageSectionSpecifiers, 1);
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
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
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedLibrarySectionSpecifiers, 0);
}

void __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DB1FB000, v0, v1, "Error when requesting TCC for identity: %@ error: %@");
  OUTLINED_FUNCTION_2_0();
}

@end
