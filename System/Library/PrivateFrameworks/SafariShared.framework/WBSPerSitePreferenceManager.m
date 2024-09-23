@implementation WBSPerSitePreferenceManager

- (void)setStorageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_storageDelegate, a3);
}

- (void)setDefaultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_defaultsDelegate, a3);
}

- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WBSPerSitePreferenceManager *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "preferenceNameForPreference:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "perSitePreferencesStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__WBSPerSitePreferenceManager_getDefaultPreferenceValueForPreference_completionHandler___block_invoke;
    v12[3] = &unk_1E4B3DE30;
    v16 = v7;
    v13 = v9;
    v14 = v6;
    v15 = self;
    objc_msgSend(v11, "getDefaultValueForPreference:completionHandler:", v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

void __88__WBSPerSitePreferenceManager_getDefaultPreferenceValueForPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "validateValue:forPreference:", a2, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultPreferenceValueForPreferenceIfNotCustomized:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultPreferenceValueForPreferenceIfNotCustomized:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }

}

- (id)preferences
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)valuesForPreference:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  return &stru_1E4B40D18;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  WBSPerSitePreferenceManager *v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);

  if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke;
    v15[3] = &unk_1E4B3DD90;
    v16 = v10;
    v20 = v13;
    v17 = self;
    v18 = v11;
    v19 = v12;
    -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", v18, v19, 0, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  if (objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "perSitePreferencesStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "preferenceNameForPreference:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B3DD68;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v16 = v9;
    v12[4] = v10;
    v13 = v11;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v5, "setValue:ofPreference:forDomain:completionHandler:", v6, v7, v8, v12);

  }
}

void __81__WBSPerSitePreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "didUpdatePreference:toValue:forDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "perSitePreferenceManager:didUpdateValueForPreference:onDomain:toValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  _QWORD v20[4];
  id v21;
  id v22;
  WBSPerSitePreferenceManager *v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perSitePreferencesStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceNameForPreference:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "interval");
      v19 = v18;
    }
    else
    {
      v19 = 1.79769313e308;
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
    v20[3] = &unk_1E4B3DE08;
    v21 = v10;
    v22 = v12;
    v23 = self;
    v24 = v15;
    v25 = v11;
    v26 = v13;
    objc_msgSend(v16, "getValueOfPreference:forDomain:withTimeoutInterval:completionHandler:", v17, v25, v20, v19);

  }
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
  v11[3] = &unk_1E4B3DDE0;
  v19 = a3;
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v13 = v7;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v10 = v5;
  dispatch_async(v6, v11);

}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "validateValue:forPreference:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    v5 = v6 == 0;
    if (v6)
    {
      v7 = v6;
    }
    else if (*(_QWORD *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 48), "shouldDeleteUnrecognizedPreference"))
    {
      v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_3(v11);
      objc_msgSend(*(id *)(a1 + 64), "perSitePreferencesStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "preferenceNameForPreference:", *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v13, v14, 0);

    }
    if (!v4)
      goto LABEL_15;
    goto LABEL_11;
  }
  if (v2 == 1)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_2(a1, v8);
    goto LABEL_14;
  }
  if (v2 != 2)
  {
LABEL_14:
    v5 = 1;
LABEL_15:
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_22;
    v15[3] = &unk_1E4B3DDB8;
    v16 = *(id *)(a1 + 80);
    v17 = v5;
    objc_msgSend(v9, "getDefaultPreferenceValueForPreference:completionHandler:", v10, v15);
    v4 = v16;
    goto LABEL_16;
  }
  v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_1(a1, v3);
  objc_msgSend(*(id *)(a1 + 40), "fallbackValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if (!v4)
    goto LABEL_15;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_16:

}

uint64_t __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_22(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)valueOfPreference:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perSitePreferencesStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceNameForPreference:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueOfPreference:forDomain:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSPerSitePreferenceManager validateValue:forPreference:](self, "validateValue:forPreference:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      if (v12
        && -[WBSPerSitePreferenceManager shouldDeleteUnrecognizedPreference](self, "shouldDeleteUnrecognizedPreference"))
      {
        objc_msgSend(v9, "perSitePreferencesStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "preferenceNameForPreference:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v18, v19, 0);

      }
      -[WBSPerSitePreferenceManager defaultPreferenceValueForPreference:](self, "defaultPreferenceValueForPreference:", v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)defaultPreferenceValueForPreference:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "preferenceNameForPreference:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "perSitePreferencesStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultValueForPreference:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSPerSitePreferenceManager validateValue:forPreference:](self, "validateValue:forPreference:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v6, "defaultPreferenceValueForPreferenceIfNotCustomized:", v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultsDelegate);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3DE58;
  v17 = v8;
  v18 = WeakRetained;
  v19 = v9;
  v20 = v10;
  v12 = v9;
  v13 = WeakRetained;
  v14 = v10;
  v15 = v8;
  -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", v12, v16);

}

void __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2))
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "preferenceNameForPreference:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "perSitePreferencesStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke_2;
    v7[3] = &unk_1E4B3D320;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v5, "setDefaultValue:forPreference:completionHandler:", v6, v4, v7);

  }
}

uint64_t __78__WBSPerSitePreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDefaultPreferenceValues:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "allKeys");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferenceManager _recursivelySetDefaultPreferenceValues:orderedKeys:currentIndex:existingResult:completionHandler:](self, "_recursivelySetDefaultPreferenceValues:orderedKeys:currentIndex:existingResult:completionHandler:", v7, v8, 0, 1, v6);

}

- (void)_recursivelySetDefaultPreferenceValues:(id)a3 orderedKeys:(id)a4 currentIndex:(int64_t)a5 existingResult:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void (**v14)(id, _BOOL8);
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(id, _BOOL8);
  id v21[2];
  BOOL v22;
  id location;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _BOOL8))a7;
  if (objc_msgSend(v12, "count") <= a5)
  {
    if (v14)
      v14[2](v14, v8);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __128__WBSPerSitePreferenceManager__recursivelySetDefaultPreferenceValues_orderedKeys_currentIndex_existingResult_completionHandler___block_invoke;
    v17[3] = &unk_1E4B3DE80;
    objc_copyWeak(v21, &location);
    v18 = v12;
    v19 = v13;
    v21[1] = (id)a5;
    v22 = v8;
    v20 = v14;
    -[WBSPerSitePreferenceManager setDefaultValue:ofPreference:completionHandler:](self, "setDefaultValue:ofPreference:completionHandler:", v16, v15, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

}

void __128__WBSPerSitePreferenceManager__recursivelySetDefaultPreferenceValues_orderedKeys_currentIndex_existingResult_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (*(_BYTE *)(a1 + 72))
    v5 = a2;
  else
    v5 = 0;
  objc_msgSend(WeakRetained, "_recursivelySetDefaultPreferenceValues:orderedKeys:currentIndex:existingResult:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, v5, *(_QWORD *)(a1 + 48));

}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perSitePreferencesStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceNameForPreference:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
    v12[3] = &unk_1E4B3DEA8;
    v13 = v7;
    objc_msgSend(v10, "getAllDomainsConfiguredForPreference:completionHandler:", v11, v12);

  }
}

void __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __79__WBSPerSitePreferenceManager_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perSitePreferencesStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceNameForPreference:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
    v15[3] = &unk_1E4B38708;
    v18 = v10;
    v15[4] = self;
    v16 = v9;
    v17 = v8;
    objc_msgSend(v13, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v17, v14, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B3DED0;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "getDefaultPreferenceValueForPreference:completionHandler:", v4, v8);

}

void __97__WBSPerSitePreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "didUpdatePreference:toValue:forDomain:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)shouldDeleteUnrecognizedPreference
{
  return 1;
}

- (id)validateValue:(id)a3 forPreference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[WBSPerSitePreferenceManager valuesForPreference:](self, "valuesForPreference:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (WBSPerSitePreferenceManagerDelegate)delegate
{
  return (WBSPerSitePreferenceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSPerSitePreferenceManagerStorageDelegate)storageDelegate
{
  return (WBSPerSitePreferenceManagerStorageDelegate *)objc_loadWeakRetained((id *)&self->_storageDelegate);
}

- (WBSPerSitePreferenceManagerDefaultsDelegate)defaultsDelegate
{
  return (WBSPerSitePreferenceManagerDefaultsDelegate *)objc_loadWeakRetained((id *)&self->_defaultsDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultsDelegate);
  objc_destroyWeak((id *)&self->_storageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_1_9(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Timed out fetching per site preference with identifier '%{public}@' from SQLiteStore", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_1_9(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to fetch per site preference with identifier '%{public}@' from SQLiteStore", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __85__WBSPerSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Unable to recognize value from the tag. Deleting preference value for this domain from memory", v1, 2u);
}

@end
