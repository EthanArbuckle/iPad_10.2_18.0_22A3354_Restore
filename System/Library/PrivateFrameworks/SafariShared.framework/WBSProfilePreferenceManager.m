@implementation WBSProfilePreferenceManager

- (WBSProfilePreferenceManager)init
{

  return 0;
}

- (WBSProfilePreferenceManager)initWithPerSitePreferencesStore:(id)a3 profileProvider:(id)a4
{
  id v7;
  id v8;
  WBSProfilePreferenceManager *v9;
  WBSProfilePreferenceManager *v10;
  WBSPerSitePreference *v11;
  WBSPerSitePreference *profilePreference;
  WBSProfilePreferenceManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSProfilePreferenceManager;
  v9 = -[WBSProfilePreferenceManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    objc_storeStrong((id *)&v10->_profileProvider, a4);
    v11 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("ProfilePreference"));
    profilePreference = v10->_profilePreference;
    v10->_profilePreference = v11;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v10, "setStorageDelegate:", v10);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v10, "setDefaultsDelegate:", v10);
    v13 = v10;
  }

  return v10;
}

- (id)identifierForProfilePreferenceForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[WBSPerSitePreferenceManager valueOfPreference:forDomain:](self, "valueOfPreference:forDomain:", self->_profilePreference, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("MostRecentProfile")) & 1) == 0)
    {
      -[WBSProfileProviding profileWithServerID:](self->_profileProvider, "profileWithServerID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)getProfilePreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(id)a5 usingBlock:(id)a6
{
  id v10;
  WBSPerSitePreference *profilePreference;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  profilePreference = self->_profilePreference;
  v12 = a3;
  +[WBSPerSitePreferenceTimeout timeoutWithInterval:fallbackValue:](WBSPerSitePreferenceTimeout, "timeoutWithInterval:fallbackValue:", a5, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__WBSProfilePreferenceManager_getProfilePreferenceValueForDomain_withTimeout_fallbackValue_usingBlock___block_invoke;
  v15[3] = &unk_1E4B29F20;
  v16 = v10;
  v14 = v10;
  -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", profilePreference, v12, v13, v15);

}

uint64_t __103__WBSProfilePreferenceManager_getProfilePreferenceValueForDomain_withTimeout_fallbackValue_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setProfilePreferenceValue:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", a3, self->_profilePreference, a4, a5);
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v8 && !objc_msgSend(v8, "isEqualToString:", CFSTR("MostRecentProfile")))
  {
    -[WBSProfileProviding profileWithServerID:](self->_profileProvider, "profileWithServerID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)didRemoveProfileWithIdentifier:(id)a3 hasMultipleProfiles:(BOOL)a4
{
  id v6;
  WBSPerSitePreference *v7;
  void *v8;
  id v9;
  id v10;
  WBSPerSitePreference *v11;
  _QWORD v12[5];
  WBSPerSitePreference *v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v7 = self->_profilePreference;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__WBSProfilePreferenceManager_didRemoveProfileWithIdentifier_hasMultipleProfiles___block_invoke;
  v12[3] = &unk_1E4B3E4A0;
  v12[4] = self;
  v13 = v7;
  v16 = a4;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[WBSPerSitePreferenceManager getAllDomainsConfiguredForPreference:usingBlock:](self, "getAllDomainsConfiguredForPreference:usingBlock:", v11, v12);

}

void __82__WBSProfilePreferenceManager_didRemoveProfileWithIdentifier_hasMultipleProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "valueOfPreference:forDomain:", *(_QWORD *)(a1 + 40), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) != 0
          || !*(_BYTE *)(a1 + 64)
          && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "defaultProfileIdentifier"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v9, "isEqualToString:", v10),
              v10,
              v11))
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "removePreferenceValuesForDomains:fromPreference:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);

}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_profilePreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[WBSProfilePreferenceManager defaultPreferenceValueForPreferenceIfNotCustomized:](self, "defaultPreferenceValueForPreferenceIfNotCustomized:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSProfileProviding profiles](self->_profileProvider, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_84);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__WBSProfilePreferenceManager_valuesForPreference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serverID");
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesProfile");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return CFSTR("MostRecentProfile");
}

- (BOOL)shouldDeleteUnrecognizedPreference
{
  return 0;
}

- (BOOL)hasDynamicPreferenceValues
{
  return 1;
}

- (BOOL)preferenceDoesNotHaveForOtherWebsitesDefault:(id)a3
{
  return 1;
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (WBSPerSitePreference)profilePreference
{
  return self->_profilePreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePreference, 0);
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
