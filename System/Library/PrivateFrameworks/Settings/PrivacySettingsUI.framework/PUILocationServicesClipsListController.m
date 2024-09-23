@implementation PUILocationServicesClipsListController

+ (int)clipsLocationUsage
{
  PUILocationServicesClipsListController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PUILocationServicesClipsListController);
  -[PUILocationServicesClipsListController specifiers](v2, "specifiers");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "identifier", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PUILocationServicesListController locationUsageForEntity:](v2, "locationUsageForEntity:", v9);

        if (v10 == 4)
        {
          v6 = 4;
        }
        else
        {
          if (v10 == 3)
          {
            v6 = 3;
            goto LABEL_20;
          }
          if (v6 != 4 && v10 == 2)
            v6 = 2;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_20:

  return v6;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (*v8)(void);
  NSDictionary *v9;
  NSObject *v10;
  NSDictionary *locationEntitiesDetails;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  __int128 buf;
  void *(*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("CONFIRM_LOCATION_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForDimSum(CFSTR("CONFIRM_LOCATION_FOOTER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80848]);

    objc_msgSend(v5, "addObject:", v6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v8 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr;
    v23 = getCLCopyAppsUsingLocationSymbolLoc_ptr;
    if (!getCLCopyAppsUsingLocationSymbolLoc_ptr)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = __getCLCopyAppsUsingLocationSymbolLoc_block_invoke;
      v26 = &unk_1EA26B260;
      v27 = &v20;
      __getCLCopyAppsUsingLocationSymbolLoc_block_invoke((uint64_t)&buf);
      v8 = (uint64_t (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v8)
    {
      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      __break(1u);
    }
    v9 = (NSDictionary *)v8();
    _PUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", (uint8_t *)&buf, 0xCu);
    }

    locationEntitiesDetails = self->super._locationEntitiesDetails;
    self->super._locationEntitiesDetails = v9;
    v12 = v9;

    v13 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForDimSum(CFSTR("CONFIRM_LOCATION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setEntityAuthorized_specifier_, sel_isEntityAuthorized_, 0, 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setProperty:forKey:", CFSTR("/System/Library/LocationBundles/ClipServicesLocation.bundle"), *MEMORY[0x1E0D80868]);
    -[PUILocationServicesListController isEntityAuthorized:](self, "isEntityAuthorized:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", v16, *MEMORY[0x1E0D807F0]);

    objc_msgSend(v15, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v5, "addObject:", v15);
    -[PUILocationServicesListController locationDetailSpecifiersWithDetailsMatching:](self, "locationDetailSpecifiersWithDetailsMatching:", &__block_literal_global_14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v17);

    v18 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    -[PUILocationServicesListController updateSpecifiersForImposedSettingsWithReload:](self, "updateSpecifiersForImposedSettingsWithReload:", 0);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

BOOL __52__PUILocationServicesClipsListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PUIIsAppClip(v2);

  return v3;
}

@end
