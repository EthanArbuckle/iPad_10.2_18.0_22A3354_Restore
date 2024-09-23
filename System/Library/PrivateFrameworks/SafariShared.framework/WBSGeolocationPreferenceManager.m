@implementation WBSGeolocationPreferenceManager

- (WBSGeolocationPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  WBSGeolocationPreferenceManager *v6;
  WBSPerSitePreference *v7;
  WBSPerSitePreference *geolocationPreference;
  WBSGeolocationPreferenceManager *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSGeolocationPreferenceManager;
  v6 = -[WBSGeolocationPreferenceManager init](&v11, sel_init);
  if (v6)
  {
    v7 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("GeolocationPreference"));
    geolocationPreference = v6->_geolocationPreference;
    v6->_geolocationPreference = v7;

    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v6, "setDefaultsDelegate:", v6);
    v9 = v6;
  }

  return v6;
}

- (void)getGeolocationSettingForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  WBSPerSitePreference *geolocationPreference;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__16;
  v10[4] = __Block_byref_object_dispose__16;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A8599ED0](a4);
  geolocationPreference = self->_geolocationPreference;
  v11 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke;
  v9[3] = &unk_1E4B3AA38;
  v9[4] = v10;
  -[WBSGeolocationPreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", geolocationPreference, v6, 0, v9);

  _Block_object_dispose(v10, 8);
}

void __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B2BDF8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __84__WBSGeolocationPreferenceManager_getGeolocationSettingForDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)setGeolocationSetting:(int64_t)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSGeolocationPreferenceManager _setValue:forDomain:shouldIncludeTimestamp:completionHandler:](self, "_setValue:forDomain:shouldIncludeTimestamp:completionHandler:", v9, v10, (unint64_t)(a3 - 3) < 2, v8);

}

- (void)setDefaultGeolocationSetting:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  WBSPerSitePreference *geolocationPreference;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[WBSGeolocationPreferenceManager perSitePreferenceValueForGeolocationSetting:](self, "perSitePreferenceValueForGeolocationSetting:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  geolocationPreference = self->_geolocationPreference;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__WBSGeolocationPreferenceManager_setDefaultGeolocationSetting_completionHandler___block_invoke;
  v10[3] = &unk_1E4B39B88;
  v9 = v6;
  v11 = v9;
  -[WBSPerSitePreferenceManager setDefaultValue:ofPreference:completionHandler:](self, "setDefaultValue:ofPreference:completionHandler:", v7, geolocationPreference, v10);

}

uint64_t __82__WBSGeolocationPreferenceManager_setDefaultGeolocationSetting_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeAllTemporaryPermissions
{
  -[WBSGeolocationPreferenceManager _removePermissionsPassingTest:completionHandler:](self, "_removePermissionsPassingTest:completionHandler:", &__block_literal_global_54, 0);
}

BOOL __64__WBSGeolocationPreferenceManager_removeAllTemporaryPermissions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return (unint64_t)(v3 - 3) < 2;
}

- (void)removeAllPermissions
{
  -[WBSGeolocationPreferenceManager removeAllPermissionsWithCompletionHandler:](self, "removeAllPermissionsWithCompletionHandler:", 0);
}

- (void)removeAllPermissionsWithCompletionHandler:(id)a3
{
  id v4;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B29DF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSPerSitePreferencesSQLiteStore removeAllPreferenceValuesFromPreference:completionHandler:](perSitePreferencesStore, "removeAllPreferenceValuesFromPreference:completionHandler:", CFSTR("PerSitePreferencesGeolocation"), v7);

}

void __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B29DC8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "setDefaultGeolocationSetting:completionHandler:", 0, v4);

}

uint64_t __77__WBSGeolocationPreferenceManager_removeAllPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 40))
      a2 = a2;
    else
      a2 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)removeTemporaryPermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__WBSGeolocationPreferenceManager_removeTemporaryPermissionsAddedAfterDate_completionHandler___block_invoke;
  v8[3] = &unk_1E4B3AAA0;
  v9 = v6;
  v7 = v6;
  -[WBSGeolocationPreferenceManager _removePermissionsPassingTest:completionHandler:](self, "_removePermissionsPassingTest:completionHandler:", v8, a4);

}

BOOL __94__WBSGeolocationPreferenceManager_removeTemporaryPermissionsAddedAfterDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if ((unint64_t)(v5 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(v3, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removePermissionsAddedAfterDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__WBSGeolocationPreferenceManager_removePermissionsAddedAfterDate_completionHandler___block_invoke;
  v8[3] = &unk_1E4B3AAA0;
  v9 = v6;
  v7 = v6;
  -[WBSGeolocationPreferenceManager _removePermissionsPassingTest:completionHandler:](self, "_removePermissionsPassingTest:completionHandler:", v8, a4);

}

BOOL __85__WBSGeolocationPreferenceManager_removePermissionsAddedAfterDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  return v4;
}

- (void)_removePermissionsPassingTest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke;
  v11[3] = &unk_1E4B3AAF0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WBSPerSitePreferencesSQLiteStore getAllPreferenceInformationForPreference:completionHandler:](perSitePreferencesStore, "getAllPreferenceInformationForPreference:completionHandler:", CFSTR("PerSitePreferencesGeolocation"), v11);

}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B3AAC8;
  v7 = v3;
  v4 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          objc_msgSend(v7, "domain");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v8);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E4B39B88;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v9, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v2, CFSTR("PerSitePreferencesGeolocation"), v10);

}

void __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_4;
    v3[3] = &unk_1E4B39220;
    v4 = *(id *)(a1 + 32);
    v5 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
}

uint64_t __83__WBSGeolocationPreferenceManager__removePermissionsPassingTest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_geolocationPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1E4B87670;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v4;
  __CFString *v5;

  v4 = a3;
  switch(objc_msgSend(v4, "integerValue"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      _WBSLocalizedString();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = &stru_1E4B40D18;
      break;
  }

  return v5;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  -[WBSGeolocationPreferenceManager _setValue:forDomain:shouldIncludeTimestamp:completionHandler:](self, "_setValue:forDomain:shouldIncludeTimestamp:completionHandler:", a3, a5, 0, a6);
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v8;
  id v9;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a6;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v13[3] = &unk_1E4B3AB18;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  -[WBSPerSitePreferencesSQLiteStore getTimestampAndValueOfPreference:forDomain:completionHandler:](perSitePreferencesStore, "getTimestampAndValueOfPreference:forDomain:completionHandler:", CFSTR("PerSitePreferencesGeolocation"), v11, v13);

}

void __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[5];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
    v20[3] = &unk_1E4B29E68;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v9, "getDefaultPreferenceValueForPreference:completionHandler:", v10, v20);
    v11 = v21;
LABEL_9:

    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "integerValue");
  if (v8 >= 3 && (v8 - 3 >= 2 || !objc_msgSend(*(id *)(a1 + 32), "_isDateLessThanOneDayAgo:", v5)))
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v15, CFSTR("PerSitePreferencesGeolocation"), 0);

    v16 = *(_QWORD **)(a1 + 32);
    v17 = v16[5];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3;
    v18[3] = &unk_1E4B29E68;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v16, "getDefaultPreferenceValueForPreference:completionHandler:", v17, v18);
    v11 = v19;
    goto LABEL_9;
  }
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "perSitePreferenceValueForGeolocationSetting:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

LABEL_10:
}

uint64_t __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__WBSGeolocationPreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v5;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
  v8[3] = &unk_1E4B3AB40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[WBSPerSitePreferencesSQLiteStore getAllPreferenceInformationForPreference:completionHandler:](perSitePreferencesStore, "getAllPreferenceInformationForPreference:completionHandler:", CFSTR("PerSitePreferencesGeolocation"), v8);

}

void __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  block[3] = &unk_1E4B2B178;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__WBSGeolocationPreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "value", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        if (v10 < 3)
          goto LABEL_7;
        if (v10 - 3 >= 2)
          continue;
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v8, "creationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "_isDateLessThanOneDayAgo:", v13);

        if ((_DWORD)v12)
        {
LABEL_7:
          objc_msgSend(v8, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v8, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removePreferenceValuesForDomains:fromPreference:completionHandler:", v3, CFSTR("PerSitePreferencesGeolocation"), 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  -[WBSPerSitePreferencesSQLiteStore removePreferenceValuesForDomains:fromPreference:completionHandler:](self->_perSitePreferencesStore, "removePreferenceValuesForDomains:fromPreference:completionHandler:", a3, CFSTR("PerSitePreferencesGeolocation"), a5);
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesGeolocation");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  -[WBSGeolocationPreferenceManager perSitePreferenceValueForGeolocationSetting:](self, "perSitePreferenceValueForGeolocationSetting:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)perSitePreferenceValueForGeolocationSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return &unk_1E4B87B20;
  else
    return (id)qword_1E4B3AB88[a3];
}

- (BOOL)_isDateLessThanOneDayAgo:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceNow");
  return v3 > -86400.0 && v3 < 0.0;
}

- (void)_setValue:(id)a3 forDomain:(id)a4 shouldIncludeTimestamp:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  perSitePreferencesStore = self->_perSitePreferencesStore;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__WBSGeolocationPreferenceManager__setValue_forDomain_shouldIncludeTimestamp_completionHandler___block_invoke;
  v17[3] = &unk_1E4B3AB68;
  objc_copyWeak(&v21, &location);
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  -[WBSPerSitePreferencesSQLiteStore setValue:ofPreference:forDomain:includeTimestamp:completionHandler:](perSitePreferencesStore, "setValue:ofPreference:forDomain:includeTimestamp:completionHandler:", v15, CFSTR("PerSitePreferencesGeolocation"), v16, v7, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __96__WBSGeolocationPreferenceManager__setValue_forDomain_shouldIncludeTimestamp_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((_DWORD)a2 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = WeakRetained[5];
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "perSitePreferenceValueForGeolocationSetting:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "perSitePreferenceManager:didUpdateValueForPreference:onDomain:toValue:", WeakRetained, v5, v6, v7);

    }
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);

}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (WBSPerSitePreference)geolocationPreference
{
  return self->_geolocationPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geolocationPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end
