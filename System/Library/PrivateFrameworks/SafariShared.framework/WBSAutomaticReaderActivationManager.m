@implementation WBSAutomaticReaderActivationManager

- (WBSAutomaticReaderActivationManager)init
{

  return 0;
}

- (WBSAutomaticReaderActivationManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  WBSAutomaticReaderActivationManager *v6;
  WBSAutomaticReaderActivationManager *v7;
  WBSPerSitePreference *v8;
  WBSPerSitePreference *readerPreference;
  WBSAutomaticReaderActivationManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSAutomaticReaderActivationManager;
  v6 = -[WBSAutomaticReaderActivationManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("ReaderPreference"));
    readerPreference = v7->_readerPreference;
    v7->_readerPreference = v8;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_readerPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B875C8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  +[WBSPerSitePreference localizedStringForBinaryPreferenceValue:](WBSPerSitePreference, "localizedStringForBinaryPreferenceValue:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("domainWithModifiedReaderPreference");
  v11[1] = CFSTR("websiteShouldStartWithReaderEnabled");
  v12[0] = v8;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("perSiteAutomaticReaderActivationPreferenceDidChange"), self, v10);

}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesUseReader");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (id)onValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (id)offValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (void)getAutomaticReaderStateForDomain:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke;
  v8[3] = &unk_1E4B29DF0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WBSAutomaticReaderActivationManager getAutomaticReaderEnabledForDomain:usingBlock:](self, "getAutomaticReaderEnabledForDomain:usingBlock:", a3, v8);

}

void __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke_2;
  v3[3] = &unk_1E4B29DC8;
  v5 = a2;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "getAutomaticReaderEnabledByDefaultUsingBlock:", v3);

}

uint64_t __83__WBSAutomaticReaderActivationManager_getAutomaticReaderStateForDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAutomaticReaderEnabledForDomain:(id)a3 usingBlock:(id)a4
{
  id v6;
  WBSPerSitePreference *readerPreference;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  readerPreference = self->_readerPreference;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke;
  v9[3] = &unk_1E4B29E40;
  v10 = v6;
  v8 = v6;
  -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", readerPreference, a3, 0, v9);

}

void __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke_2;
  v6[3] = &unk_1E4B29E18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __85__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledForDomain_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
}

- (void)setAutomaticReaderEnabled:(BOOL)a3 forDomain:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", v6, self->_readerPreference, v7, 0);

}

- (void)getAutomaticReaderEnabledByDefaultUsingBlock:(id)a3
{
  id v4;
  WBSPerSitePreference *readerPreference;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  readerPreference = self->_readerPreference;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledByDefaultUsingBlock___block_invoke;
  v7[3] = &unk_1E4B29E68;
  v8 = v4;
  v6 = v4;
  -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", readerPreference, v7);

}

void __84__WBSAutomaticReaderActivationManager_getAutomaticReaderEnabledByDefaultUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "BOOLValue"));

}

- (void)setAutomaticReaderEnabledByDefault:(BOOL)a3 removingExistingPreferencesForSites:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  if (a4)
    -[WBSPerSitePreferencesSQLiteStore removeAllPreferenceValuesFromPreference:completionHandler:](self->_perSitePreferencesStore, "removeAllPreferenceValuesFromPreference:completionHandler:", CFSTR("PerSitePreferencesUseReader"), 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferenceManager setDefaultValue:ofPreference:completionHandler:](self, "setDefaultValue:ofPreference:completionHandler:");

}

- (WBSPerSitePreference)readerPreference
{
  return self->_readerPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
