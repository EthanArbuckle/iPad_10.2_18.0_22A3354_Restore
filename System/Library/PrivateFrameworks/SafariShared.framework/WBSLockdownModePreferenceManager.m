@implementation WBSLockdownModePreferenceManager

- (WBSLockdownModePreferenceManager)initWithPerSitePreferenceStore:(id)a3
{
  id v5;
  WBSLockdownModePreferenceManager *v6;
  WBSLockdownModePreferenceManager *v7;
  WBSPerSitePreference *v8;
  WBSPerSitePreference *lockdownPreference;
  WBSLockdownModePreferenceManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSLockdownModePreferenceManager;
  v6 = -[WBSLockdownModePreferenceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferenceStore, a3);
    v8 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("LockdownModePreference"));
    lockdownPreference = v7->_lockdownPreference;
    v7->_lockdownPreference = v8;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)setLockdownModeEnabled:(BOOL)a3 forDomain:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", v8, self->_lockdownPreference, v7, 0);

}

- (void)getLockdownModeEnabledForDomain:(id)a3 withTimeout:(double)a4 fallbackEnabledState:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  WBSPerSitePreference *lockdownPreference;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "length"))
  {
    lockdownPreference = self->_lockdownPreference;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSPerSitePreferenceTimeout timeoutWithInterval:fallbackValue:](WBSPerSitePreferenceTimeout, "timeoutWithInterval:fallbackValue:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__WBSLockdownModePreferenceManager_getLockdownModeEnabledForDomain_withTimeout_fallbackEnabledState_usingBlock___block_invoke;
    v15[3] = &unk_1E4B29F20;
    v16 = v11;
    -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", lockdownPreference, v10, v14, v15);

  }
  else
  {
    (*((void (**)(id, _BOOL8))v11 + 2))(v11, v7);
  }

}

uint64_t __112__WBSLockdownModePreferenceManager_getLockdownModeEnabledForDomain_withTimeout_fallbackEnabledState_usingBlock___block_invoke(uint64_t a1, void *a2)
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
  v10 = CFSTR("domainWithModifiedLockdownModePreference");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("perSiteLockdownModePreferenceDidChange"), self, v9);
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_lockdownPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B876E8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return +[WBSPerSitePreference localizedStringForBinaryPreferenceValue:](WBSPerSitePreference, "localizedStringForBinaryPreferenceValue:", a3, a4);
}

- (BOOL)preferenceDoesNotHaveForOtherWebsitesDefault:(id)a3
{
  return 1;
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferenceStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesLockdownMode");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (id)offValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (id)onValueForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (WBSPerSitePreference)lockdownPreference
{
  return self->_lockdownPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceStore, 0);
}

@end
