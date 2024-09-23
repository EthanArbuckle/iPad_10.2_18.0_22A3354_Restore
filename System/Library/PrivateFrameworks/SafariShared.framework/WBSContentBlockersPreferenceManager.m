@implementation WBSContentBlockersPreferenceManager

- (WBSContentBlockersPreferenceManager)init
{

  return 0;
}

- (WBSContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  WBSContentBlockersPreferenceManager *v6;
  WBSContentBlockersPreferenceManager *v7;
  WBSPerSitePreference *v8;
  WBSPerSitePreference *contentBlockersPreference;
  WBSContentBlockersPreferenceManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSContentBlockersPreferenceManager;
  v6 = -[WBSContentBlockersPreferenceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("ContentBlockersPreference"));
    contentBlockersPreference = v7->_contentBlockersPreference;
    v7->_contentBlockersPreference = v8;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)getContentBlockersEnabledStateForDomain:(id)a3 withTimeout:(double)a4 fallbackEnabledState:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  WBSPerSitePreference *contentBlockersPreference;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "length"))
  {
    contentBlockersPreference = self->_contentBlockersPreference;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSPerSitePreferenceTimeout timeoutWithInterval:fallbackValue:](WBSPerSitePreferenceTimeout, "timeoutWithInterval:fallbackValue:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __130__WBSContentBlockersPreferenceManager_getContentBlockersEnabledStateForDomain_withTimeout_fallbackEnabledState_completionHandler___block_invoke;
    v15[3] = &unk_1E4B29F20;
    v16 = v11;
    -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", contentBlockersPreference, v10, v14, v15);

  }
  else
  {
    (*((void (**)(id, _BOOL8))v11 + 2))(v11, v7);
  }

}

uint64_t __130__WBSContentBlockersPreferenceManager_getContentBlockersEnabledStateForDomain_withTimeout_fallbackEnabledState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a5;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("domainWithModifiedContentBlockersPreference");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("perSiteContentBlockersPreferenceDidChange"), self, v9);
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_contentBlockersPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B87610;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return +[WBSPerSitePreference localizedStringForBinaryPreferenceValue:](WBSPerSitePreference, "localizedStringForBinaryPreferenceValue:", a3, a4);
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesContentBlockers");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (id)onValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (id)offValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (WBSPerSitePreference)contentBlockersPreference
{
  return self->_contentBlockersPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlockersPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
