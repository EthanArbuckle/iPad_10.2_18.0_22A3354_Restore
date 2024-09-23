@implementation WBSForYouPerSitePreferenceManager

- (WBSForYouPerSitePreferenceManager)init
{

  return 0;
}

- (WBSForYouPerSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  WBSForYouPerSitePreferenceManager *v6;
  WBSForYouPerSitePreferenceManager *v7;
  id v8;
  uint64_t v9;
  WBSPerSitePreference *preference;
  WBSForYouPerSitePreferenceManager *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSForYouPerSitePreferenceManager;
  v6 = -[WBSForYouPerSitePreferenceManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferencesStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0D8A168]);
    v9 = objc_msgSend(v8, "initWithIdentifier:", *MEMORY[0x1E0D8A3D0]);
    preference = v7->_preference;
    v7->_preference = (WBSPerSitePreference *)v9;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v11 = v7;
  }

  return v7;
}

- (void)allowedForYouRecommendationsFromRecommendations:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  WBSPerSitePreferencesSQLiteStore *preferencesStore;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  preferencesStore = self->_preferencesStore;
  v9 = *MEMORY[0x1E0D8A4F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__WBSForYouPerSitePreferenceManager_allowedForYouRecommendationsFromRecommendations_completionHandler___block_invoke;
  v12[3] = &unk_1E54438C8;
  v13 = v7;
  v14 = v6;
  v10 = v7;
  v11 = v6;
  -[WBSPerSitePreferencesSQLiteStore getAllDomainsConfiguredForPreference:completionHandler:](preferencesStore, "getAllDomainsConfiguredForPreference:completionHandler:", v9, v12);

}

void __103__WBSForYouPerSitePreferenceManager_allowedForYouRecommendationsFromRecommendations_completionHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "pageURL", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "safari_userVisibleHostWithoutWWWSubdomain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "length") && (objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  WBSPerSitePreference *preference;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  preference = self->_preference;
  objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", v13, preference, v12, v9);
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_preferencesStore;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_preference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E547BD48;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return &stru_1E5449658;
}

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E0D8A4F8];
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1E5479C60;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_preferencesStore, 0);
}

@end
