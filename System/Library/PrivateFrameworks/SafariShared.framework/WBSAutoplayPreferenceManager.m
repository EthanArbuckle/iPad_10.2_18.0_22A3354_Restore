@implementation WBSAutoplayPreferenceManager

- (WBSAutoplayPreferenceManager)init
{

  return 0;
}

- (WBSAutoplayPreferenceManager)initWithPerSitePreferencesStore:(id)a3 allowListManager:(id)a4
{
  id v7;
  id v8;
  WBSAutoplayPreferenceManager *v9;
  WBSAutoplayPreferenceManager *v10;
  WBSPerSitePreference *v11;
  WBSPerSitePreference *autoplayPreference;
  WBSAutoplayPreferenceManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSAutoplayPreferenceManager;
  v9 = -[WBSAutoplayPreferenceManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    objc_storeStrong((id *)&v10->_domainAllowListManager, a4);
    v11 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("AutoplayPreference"));
    autoplayPreference = v10->_autoplayPreference;
    v10->_autoplayPreference = v11;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v10, "setStorageDelegate:", v10);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v10, "setDefaultsDelegate:", v10);
    v13 = v10;
  }

  return v10;
}

- (void)getAutoplayPreferenceValueForDomain:(id)a3 withTimeout:(double)a4 fallbackValue:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  WBSPerSitePreference *autoplayPreference;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  autoplayPreference = self->_autoplayPreference;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a3;
  objc_msgSend(v12, "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSPerSitePreferenceTimeout timeoutWithInterval:fallbackValue:](WBSPerSitePreferenceTimeout, "timeoutWithInterval:fallbackValue:", v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__WBSAutoplayPreferenceManager_getAutoplayPreferenceValueForDomain_withTimeout_fallbackValue_completionHandler___block_invoke;
  v17[3] = &unk_1E4B29F20;
  v18 = v10;
  v16 = v10;
  -[WBSAutoplayPreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", autoplayPreference, v13, v15, v17);

}

uint64_t __112__WBSAutoplayPreferenceManager_getAutoplayPreferenceValueForDomain_withTimeout_fallbackValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_msgSend(a2, "integerValue");
  if (v3 >= 3)
    v4 = 1;
  else
    v4 = v3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v13[1] = 3221225472;
  v13[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v13[3] = &unk_1E4B29F98;
  v14 = a4;
  v15 = a6;
  v13[4] = self;
  v12.receiver = self;
  v12.super_class = (Class)WBSAutoplayPreferenceManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v14;
  v11 = v15;
  -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](&v12, sel_getValueOfPreference_forDomain_withTimeout_usingBlock_, a3, v10, a5, v13);

}

void __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = v5;
  if (a3 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    if (!objc_msgSend(v5, "isEqual:", &unk_1E4B87850))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_9;
      v12[3] = &unk_1E4B29F70;
      v16 = *(id *)(a1 + 48);
      v17 = a3;
      v13 = *(id *)(a1 + 40);
      v10 = v6;
      v11 = *(_QWORD *)(a1 + 32);
      v14 = v10;
      v15 = v11;
      objc_msgSend(v9, "isDomainAllowed:completionHandler:", v8, v12);

      goto LABEL_7;
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();
LABEL_7:

}

void __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_9(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_highLevelDomainFromHost");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length") && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3))
    {
      v4 = *(void **)(a1 + 56);
      v5 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_11;
      v6[3] = &unk_1E4B29F48;
      v8 = v4;
      v7 = *(id *)(a1 + 40);
      v9 = *(_BYTE *)(a1 + 64);
      objc_msgSend(v5, "isDomainAllowed:completionHandler:", v3, v6);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

uint64_t __86__WBSAutoplayPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_11(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
    v4 = &unk_1E4B87868;
  else
    v4 = *(void **)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, *(unsigned __int8 *)(a1 + 48));
}

- (void)setAutoplayPreferenceValue:(int64_t)a3 forURL:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  WBSPerSitePreference *autoplayPreference;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  autoplayPreference = self->_autoplayPreference;
  objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](self, "setValue:ofPreference:forDomain:completionHandler:", v13, autoplayPreference, v12, v9);
}

- (void)prepareForTermination
{
  -[WBSDomainAllowListManager prepareForTermination](self->_domainAllowListManager, "prepareForTermination");
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_autoplayPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B875E0;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  __CFString *v4;

  if ((unint64_t)objc_msgSend(a3, "integerValue") > 2)
  {
    v4 = &stru_1E4B40D18;
  }
  else
  {
    _WBSLocalizedString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)WBSAutoplayPreferenceManager;
  v8 = a5;
  v9 = a4;
  -[WBSPerSitePreferenceManager didUpdatePreference:toValue:forDomain:](&v12, sel_didUpdatePreference_toValue_forDomain_, a3, v9, v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("AutoplayPreferenceDomain");
  v13[1] = CFSTR("AutoplayPreferenceValue");
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("WBSAutoplayPreferenceManagerDidUpdateAutoplayPreference"), self, v11);
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesAutoplay");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1E4B87880;
}

- (WBSPerSitePreference)autoplayPreference
{
  return self->_autoplayPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoplayPreference, 0);
  objc_storeStrong((id *)&self->_domainAllowListManager, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
