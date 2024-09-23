@implementation WBSPageZoomPreferenceManager

+ (id)pageZoomFactors
{
  return &unk_1E4B87700;
}

- (WBSPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5;
  WBSPageZoomPreferenceManager *v6;
  WBSPageZoomPreferenceManager *v7;
  WBSPerSitePreference *v8;
  WBSPerSitePreference *pageZoomPreference;
  WBSPageZoomPreferenceManager *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSPageZoomPreferenceManager;
  v6 = -[WBSPageZoomPreferenceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    v8 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("ZoomPreference"));
    pageZoomPreference = v7->_pageZoomPreference;
    v7->_pageZoomPreference = v8;

    -[WBSPerSitePreferenceManager setStorageDelegate:](v7, "setStorageDelegate:", v7);
    -[WBSPerSitePreferenceManager setDefaultsDelegate:](v7, "setDefaultsDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)getPageZoomFactorForURL:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke_2;
    v9[3] = &unk_1E4B3D6E0;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:](self, "_getZoomStepForDomain:usingBlock:", v8, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke;
    v12[3] = &unk_1E4B3D6B8;
    v13 = v7;
    objc_copyWeak(&v14, &location);
    -[WBSPageZoomPreferenceManager _getDefaultZoomStep:](self, "_getDefaultZoomStep:", v12);
    objc_destroyWeak(&v14);

  }
  objc_destroyWeak(&location);

}

void __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pageZoomStepToZoomFactor:", a2);
  (*(void (**)(uint64_t))(v3 + 16))(v3);

}

uint64_t __67__WBSPageZoomPreferenceManager_getPageZoomFactorForURL_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  double v5;
  double v6;
  NSObject *v7;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pageZoomStepToZoomFactor:", a2);
  v6 = v5;

  v7 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Loading website with page zoom factor: %f", (uint8_t *)&v9, 0xCu);
  }
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);
}

- (void)zoomInOnURL:(id)a3 completionHandler:(id)a4
{
  -[WBSPageZoomPreferenceManager _incrementOrDecreaseZoomStep:forURL:completionHandler:](self, "_incrementOrDecreaseZoomStep:forURL:completionHandler:", 1, a3, a4);
}

- (void)zoomOutOnURL:(id)a3 completionHandler:(id)a4
{
  -[WBSPageZoomPreferenceManager _incrementOrDecreaseZoomStep:forURL:completionHandler:](self, "_incrementOrDecreaseZoomStep:forURL:completionHandler:", 0, a3, a4);
}

- (void)resetZoomLevelOnURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke;
  v10[3] = &unk_1E4B3D730;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSPageZoomPreferenceManager _getDefaultZoomStep:](self, "_getDefaultZoomStep:", v10);

}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke(id *a1, uint64_t a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  double v12;

  objc_msgSend(a1[4], "_pageZoomStepToZoomFactor:", a2);
  v4 = v3;
  objc_msgSend(a1[5], "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *((_QWORD *)a1[4] + 5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2;
    v9[3] = &unk_1E4B3D708;
    v10 = v5;
    v11 = a1[6];
    v12 = v4;
    objc_msgSend(v6, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v7, v8, v9);

  }
  else
  {
    (*((void (**)(double))a1[6] + 2))(v4);
  }

}

uint64_t __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((a2 & 1) == 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_1(a1, v11, v12, v13, v14, v15, v16, v17);
  }
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48));
}

- (void)getAvailableActionsForURL:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke;
    v9[3] = &unk_1E4B3D780;
    objc_copyWeak(&v12, &location);
    v10 = v8;
    v11 = v7;
    -[WBSPageZoomPreferenceManager _getDefaultZoomStep:](self, "_getDefaultZoomStep:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9[2];

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke_2;
    v7[3] = &unk_1E4B3D758;
    objc_copyWeak(v9, v4);
    v9[1] = a2;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_getZoomStepForDomain:usingBlock:", v6, v7);

    objc_destroyWeak(v9);
  }

}

void __69__WBSPageZoomPreferenceManager_getAvailableActionsForURL_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_canChangePageZoom:fromStep:", 0, a2);
    objc_msgSend(v5, "_canChangePageZoom:fromStep:", 1, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

- (void)removePageZoomPreferencesForHostnames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "safari_stringByRemovingWwwDotPrefix", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[WBSPerSitePreferenceManager removePreferenceValuesForDomains:fromPreference:completionHandler:](self, "removePreferenceValuesForDomains:fromPreference:completionHandler:", v5, self->_pageZoomPreference, 0);
}

- (void)removeAllPageZoomPreferences
{
  WBSPerSitePreferencesSQLiteStore *perSitePreferencesStore;
  id v3;

  perSitePreferencesStore = self->_perSitePreferencesStore;
  -[WBSPageZoomPreferenceManager preferenceNameForPreference:](self, "preferenceNameForPreference:", self->_pageZoomPreference);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferencesSQLiteStore removeAllPreferenceValuesFromPreference:completionHandler:](perSitePreferencesStore, "removeAllPreferenceValuesFromPreference:completionHandler:", v3, 0);

}

- (void)_getDefaultZoomStep:(id)a3
{
  id v4;
  WBSPerSitePreference *pageZoomPreference;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  pageZoomPreference = self->_pageZoomPreference;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSPageZoomPreferenceManager__getDefaultZoomStep___block_invoke;
  v7[3] = &unk_1E4B3D7A8;
  v8 = v4;
  v6 = v4;
  -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", pageZoomPreference, v7);

}

uint64_t __52__WBSPageZoomPreferenceManager__getDefaultZoomStep___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"));
}

- (void)_getZoomStepForDomain:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  WBSPerSitePreference *pageZoomPreference;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:].cold.2(v8);
  v9 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  pageZoomPreference = self->_pageZoomPreference;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke;
  v19[3] = &unk_1E4B3D820;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v17 = v7;
  v18 = v6;
  -[WBSPerSitePreferenceManager getValueOfPreference:forDomain:withTimeout:usingBlock:](self, "getValueOfPreference:forDomain:withTimeout:usingBlock:", pageZoomPreference, v18, 0, v19);

}

void __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = v5;
  if (a3 && (v7 = *(_QWORD *)(a1 + 32), (v8 = *(void **)(v7 + 48)) != 0))
  {
    v9 = *(_QWORD *)(v7 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_2;
    v14[3] = &unk_1E4B3D7F8;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v16 = v11;
    v14[4] = v12;
    v15 = v13;
    objc_msgSend(v8, "getValueOfPreference:forDomain:withTimeout:usingBlock:", v9, v10, 0, v14);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v5, "integerValue"));
  }

}

void __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v5, "integerValue"));
  }
  else
  {
    v7 = *(_QWORD **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v7[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_3;
    v10[3] = &unk_1E4B3D7D0;
    v12 = *(id *)(a1 + 48);
    v11 = v6;
    objc_msgSend(v7, "setValue:ofPreference:forDomain:completionHandler:", v11, v9, v8, v10);

  }
}

uint64_t __65__WBSPageZoomPreferenceManager__getZoomStepForDomain_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
}

- (void)_incrementOrDecreaseZoomStep:(BOOL)a3 forURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(v8, "safari_userVisibleHostWithoutWWWSubdomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_2;
    v11[3] = &unk_1E4B3D898;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    v15 = a3;
    v12 = v10;
    -[WBSPageZoomPreferenceManager _getZoomStepForDomain:usingBlock:](self, "_getZoomStepForDomain:usingBlock:", v12, v11);

    objc_destroyWeak(&v14);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke;
    v16[3] = &unk_1E4B3D6B8;
    v17 = v9;
    objc_copyWeak(&v18, &location);
    -[WBSPageZoomPreferenceManager _getDefaultZoomStep:](self, "_getDefaultZoomStep:", v16);
    objc_destroyWeak(&v18);

  }
  objc_destroyWeak(&location);

}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pageZoomStepToZoomFactor:", a2);
  (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8[2];
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E4B3D870;
  objc_copyWeak(v8, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 56);
  v7 = v4;
  v8[1] = a2;
  v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  __n128 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _QWORD v13[4];
  id v14;
  id v15[2];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "_canChangePageZoom:fromStep:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56)) & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(a1 + 64))
        v7 = (void *)(v6 + 1);
      else
        v7 = (void *)(v6 - 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pageZoomPreference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4;
      v13[3] = &unk_1E4B3D848;
      objc_copyWeak(v15, v2);
      v15[1] = v7;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v5, "setValue:ofPreference:forDomain:completionHandler:", v8, v9, v10, v13);

      objc_destroyWeak(v15);
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "_pageZoomStepToZoomFactor:", *(_QWORD *)(a1 + 56));
      (*(void (**)(uint64_t, _QWORD, __n128))(v11 + 16))(v11, 0, v12);
    }
  }
  else
  {
    v4.n128_u64[0] = 0;
    (*(void (**)(_QWORD, _QWORD, __n128))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v4);
  }

}

uint64_t __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  double v12;
  double v13;
  NSObject *v14;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pageZoomStepToZoomFactor:", *(_QWORD *)(a1 + 48));
  v13 = v12;

  v14 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = v13;
    _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "Updating website with page zoom factor: %f", (uint8_t *)&v16, 0xCu);
  }
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);
}

- (BOOL)_canChangePageZoom:(BOOL)a3 fromStep:(int64_t)a4
{
  BOOL v4;

  if (a3)
    v4 = objc_msgSend(&unk_1E4B87700, "count") - 1 <= a4;
  else
    v4 = a4 <= 0;
  return !v4;
}

- (double)_pageZoomStepToZoomFactor:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(&unk_1E4B87700, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)preferences
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_pageZoomPreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  return (id)objc_msgSend(&unk_1E4B87700, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &__block_literal_global_78);
}

uint64_t __52__WBSPageZoomPreferenceManager_valuesForPreference___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(&unk_1E4B87700, "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37D0];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("domainWithModifiedPageZoomPreference");
  v15[1] = CFSTR("pageZoomFactor");
  v16[0] = v8;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v9, "integerValue");

  -[WBSPageZoomPreferenceManager _pageZoomStepToZoomFactor:](self, "_pageZoomStepToZoomFactor:", v12);
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("perSitePageZoomPreferenceDidChange"), self, v14);
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return CFSTR("PerSitePreferencesPageZoom");
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(&unk_1E4B87700, "indexOfObject:", &unk_1E4B87CF8);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
}

- (WBSPerSitePreference)pageZoomPreference
{
  return self->_pageZoomPreference;
}

- (WBSPageZoomPreferenceManager)fallbackPreferenceManager
{
  return self->_fallbackPreferenceManager;
}

- (void)setFallbackPreferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackPreferenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackPreferenceManager, 0);
  objc_storeStrong((id *)&self->_pageZoomPreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "SQLiteStore deletion failed for page zoom per site preferences for domain %{private}@", a5, a6, a7, a8, 3u);
}

void __70__WBSPageZoomPreferenceManager_resetZoomLevelOnURL_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "SQLiteStore deletion failed for page zoom per site preferences", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_getZoomStepForDomain:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Checking page zoom per site preference from storage for domain '%{private}@'", a5, a6, a7, a8, 3u);
}

- (void)_getZoomStepForDomain:(os_log_t)log usingBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Checking page zoom per site preference from storage", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __86__WBSPageZoomPreferenceManager__incrementOrDecreaseZoomStep_forURL_completionHandler___block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Failed to update SQLiteStore for page zoom per site preferences due to database not open or statement not done", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
