@implementation SBHIconLibrarySpotlightQueryEngine

- (void)dealloc
{
  SBHIconLibraryQueryContext **p_currentlyRunningQueryContext;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_currentlyRunningQueryContext = &self->_currentlyRunningQueryContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyRunningQueryContext);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_currentlyRunningQueryContext);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kRunningQueryKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_safeAddObject:", v7);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_safeAddObject:", v8);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[SBHIconLibrarySpotlightQueryEngine _teardownCSSearchQuery:](self, "_teardownCSSearchQuery:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  -[SBHIconLibraryAbstractQueryEngine dealloc](&v14, sel_dealloc);
}

- (id)_searchQueryForIconLibraryQuery:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *StringByAddingBackslashEscapes;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    objc_msgSend(v3, "searchString");
    StringByAddingBackslashEscapes = (void *)__MDQueryCreateStringByAddingBackslashEscapes();
  }
  else
  {
    StringByAddingBackslashEscapes = 0;
  }
  objc_msgSend(v3, "keyboardLanguageHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CA5F90];
  v28[0] = *MEMORY[0x1E0CA6158];
  v28[1] = v8;
  v28[2] = *MEMORY[0x1E0CA6428];
  v28[3] = CFSTR("kMDItemDisplayNameCorrections");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("zh")) & 1) != 0
      || (objc_msgSend(v7, "hasPrefix:", CFSTR("ja")) & 1) != 0
      || objc_msgSend(v7, "hasSuffix:", CFSTR("CN")))
    {
      objc_msgSend(CFSTR("cdwt"), "stringByAppendingString:", CFSTR("s"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("cdwt");
    }
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __70__SBHIconLibrarySpotlightQueryEngine__searchQueryForIconLibraryQuery___block_invoke;
    v24 = &unk_1E8D8E258;
    v25 = StringByAddingBackslashEscapes;
    v26 = v10;
    v11 = v10;
    objc_msgSend(v9, "bs_map:", &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" || "), v21, v22, v23, v24);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = CFSTR("(*==*)");
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v14, "setLive:", 1);
  objc_msgSend(v3, "keyboardLanguageHint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setKeyboardLanguage:", v15);

  objc_msgSend(v3, "markedTextArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "markedTextArray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMarkedTextArray:", v17);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v13, v14);
  v27 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProtectionClasses:", v19);

  objc_msgSend(v18, "setBundleIDs:", &unk_1E8E17618);
  return v18;
}

uint64_t __70__SBHIconLibrarySpotlightQueryEngine__searchQueryForIconLibraryQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_relevancyQueryForLibraryQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length")
    && (objc_msgSend(v3, "keyboardLanguageHint"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v16[0] = *MEMORY[0x1E0CA6A78];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
    objc_msgSend(v7, "setMaxCount:", 25);
    objc_msgSend(v7, "setFetchAttributes:", v6);
    objc_msgSend(v3, "keyboardLanguageHint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyboardLanguage:", v8);

    objc_msgSend(v3, "markedTextArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "markedTextArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMarkedTextArray:", v10);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(*=\"%@*\"cdwt)"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B88]), "initWithQueryString:queryContext:", v11, v7);
    v15 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProtectionClasses:", v13);

    objc_msgSend(v12, "setBundleIDs:", &unk_1E8E17630);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)executeQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[SBHIconLibraryAbstractQueryEngine iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryAbstractQueryEngine processingQueue](self, "processingQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke;
  block[3] = &unk_1E8D86748;
  objc_copyWeak(&v14, &location);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke(id *a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  SBHIconLibraryQueryContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  CFAbsoluteTime Current;
  uint64_t v14;
  SBHIconLibraryQueryContext *v15;
  SBHIconLibraryQueryContext *v16;
  SBHIconLibraryQueryContext *v17;
  id v18;
  SBHIconLibraryQueryContext *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SBHIconLibraryQueryContext *v24;
  id v25[2];
  _QWORD v26[4];
  id v27;
  SBHIconLibraryQueryContext *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34[2];
  _QWORD v35[4];
  id v36;
  SBHIconLibraryQueryContext *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  SBHIconLibraryQueryContext *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  SBHIconLibraryQueryContext *v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  SBHIconLibraryQueryContext *v53;
  id *v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "_processingQueue_isIconModelReloading") & 1) == 0
    && (objc_msgSend(v4, "_processingQueue_isShutdown") & 1) == 0)
  {
    v5 = objc_loadWeakRetained(v4 + 8);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v4, "_processingQueue_teardownQueryContext:", v5);

    }
    v7 = -[SBHIconLibraryQueryContext initWithQuery:]([SBHIconLibraryQueryContext alloc], "initWithQuery:", a1[4]);
    objc_storeWeak(v4 + 8, v7);
    objc_msgSend(v4, "_processingQueue_startNewQueryContext:", v7);
    objc_msgSend(a1[4], "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v4, "_searchQueryForIconLibraryQuery:", a1[4]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconLibraryQueryContext setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("kRunningQueryKey"));
      objc_msgSend(v4, "_relevancyQueryForLibraryQuery:", a1[4]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconLibraryQueryContext setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v20, CFSTR("kRelevancyQueryKey"));
      SBLogLibrarySearchController();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = a1[4];
        *(_DWORD *)buf = 138412290;
        v56 = v12;
        _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Starting new Library Search Query '%@'", buf, 0xCu);
      }

      Current = CFAbsoluteTimeGetCurrent();
      v14 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_38;
      v45[3] = &unk_1E8D8E2A0;
      objc_copyWeak(&v49, v2);
      v46 = a1[6];
      v47 = a1[4];
      v15 = v7;
      v48 = v15;
      objc_msgSend(v10, "setFoundItemsHandler:", v45);
      v40[0] = v14;
      v40[1] = 3221225472;
      v40[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_43;
      v40[3] = &unk_1E8D8E2C8;
      objc_copyWeak(&v44, v2);
      v41 = a1[6];
      v42 = a1[4];
      v16 = v15;
      v43 = v16;
      objc_msgSend(v10, "setRemovedItemsHandler:", v40);
      v35[0] = v14;
      v35[1] = 3221225472;
      v35[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_46;
      v35[3] = &unk_1E8D8E318;
      v36 = a1[6];
      objc_copyWeak(&v39, v2);
      v17 = v16;
      v37 = v17;
      v38 = a1[4];
      objc_msgSend(v10, "setCompletionHandler:", v35);
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_50;
      v30[3] = &unk_1E8D8E340;
      v31 = a1[4];
      v34[1] = *(id *)&Current;
      v18 = v10;
      v32 = v18;
      v33 = a1[6];
      objc_copyWeak(v34, v2);
      objc_msgSend(v18, "setGatherEndedHandler:", v30);
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_52;
      v26[3] = &unk_1E8D8E3B8;
      v27 = a1[6];
      objc_copyWeak(&v29, v2);
      v19 = v17;
      v28 = v19;
      objc_msgSend(v20, "setFoundItemsHandler:", v26);
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4_57;
      v21[3] = &unk_1E8D8E3E0;
      v22 = a1[4];
      v25[1] = *(id *)&Current;
      v23 = a1[6];
      objc_copyWeak(v25, v2);
      v24 = v19;
      objc_msgSend(v20, "setCompletionHandler:", v21);
      objc_msgSend(v20, "start");
      objc_msgSend(v18, "start");

      objc_destroyWeak(v25);
      objc_destroyWeak(&v29);

      objc_destroyWeak(v34);
      objc_destroyWeak(&v39);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v49);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2;
      block[3] = &unk_1E8D86330;
      v51 = a1[5];
      v52 = a1[6];
      v53 = v7;
      v54 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v18 = v51;
    }

  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "leafIconsUniquedByApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3;
  v13[3] = &unk_1E8D86720;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v2, "bs_filter:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4;
  v9[3] = &unk_1E8D84F18;
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  v12 = v4;
  v8 = v4;
  dispatch_async(v5, v9);

}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t IsLeafIconAndNotWidgetIcon;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:", v3))
    IsLeafIconAndNotWidgetIcon = _SBIconIsLeafIconAndNotWidgetIcon(v3);
  else
    IsLeafIconAndNotWidgetIcon = 0;

  return IsLeafIconAndNotWidgetIcon;
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_79);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_41;
    v8[3] = &unk_1E8D86330;
    v6 = *(NSObject **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    v11 = WeakRetained;
    v12 = *(id *)(a1 + 48);
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

id __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_39(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogLibrarySearchController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' adding bundle identifiers: '%@'", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_processingQueue_markBundleIdentifiers:iconLibraryQueryContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "_addItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_44;
    v7[3] = &unk_1E8D86330;
    v6 = *(NSObject **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = v4;
    v10 = WeakRetained;
    v11 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);

  }
}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_44(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogLibrarySearchController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' removing bundle identifiers: '%@'", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_processingQueue_unmarkBundleIdentifiers:iconLibraryQueryContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "_processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_47;
  v6[3] = &unk_1E8D8E2F0;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_47(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  SBLogLibrarySearchController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_47_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_processingQueue_lastQueryResultForContext:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7 || !v5)
    {
      if (v7)
      {
        objc_msgSend(v4, "_processingQueue_observerDispatchError:forQuery:", v7, *(_QWORD *)(a1 + 48));
      }
      else
      {
        +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_processingQueue_observerDispatchQueryResultsWereUpdated:", v8);

      }
    }

  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  CFAbsoluteTime v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  CFAbsoluteTime v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogLibrarySearchController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' execution time: %f", buf, 0x16u);
  }

  if (!objc_msgSend(*(id *)(a1 + 40), "foundItemCount"))
  {
    v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_51;
    v6[3] = &unk_1E8D88E90;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_51(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    SBLogLibrarySearchController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' ended with no found items", (uint8_t *)&v6, 0xCu);
    }

    +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_processingQueue_observerDispatchQueryResultsWereUpdated:", v5);

  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_54;
  v13[3] = &unk_1E8D8E368;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);

  v7 = *(NSObject **)(a1 + 32);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_56;
  v9[3] = &unk_1E8D8E390;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v12);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "attributeSet");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeForKey:", *MEMORY[0x1E0CA6A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_56(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_updateQueryRelevancyScores:iconLibraryQueryContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  CFAbsoluteTime v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  CFAbsoluteTime v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogLibrarySearchController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2048;
    v16 = v6;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "Library Relevancy Query '%@' execution time: %f", buf, 0x16u);
  }

  v7 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_58;
  block[3] = &unk_1E8D8E390;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8 = v3;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_58(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("kRelevancyQueryErrorKey"));
    objc_msgSend(WeakRetained, "_processingQueue_updateQueryRelevancyScores:iconLibraryQueryContext:", MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 32));
  }

}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SBHIconLibraryQueryContext **p_currentlyRunningQueryContext;
  id WeakRetained;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRunningQueryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeAddObject:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeAddObject:", v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[SBHIconLibrarySpotlightQueryEngine _teardownCSSearchQuery:](self, "_teardownCSSearchQuery:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("kRelevancyQueryKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("kRunningQueryKey"));
  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  -[SBHIconLibraryAbstractQueryEngine _processingQueue_teardownQueryContext:](&v15, sel__processingQueue_teardownQueryContext_, v4);
  p_currentlyRunningQueryContext = &self->_currentlyRunningQueryContext;
  WeakRetained = objc_loadWeakRetained((id *)p_currentlyRunningQueryContext);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_currentlyRunningQueryContext, 0);

}

- (void)_teardownCSSearchQuery:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setCompletionHandler:", 0);
  objc_msgSend(v3, "setFoundItemsHandler:", 0);
  objc_msgSend(v3, "setRemovedItemsHandler:", 0);
  objc_msgSend(v3, "setGatherEndedHandler:", 0);
  objc_msgSend(v3, "setCompletionScoresHandler:", 0);
  objc_msgSend(v3, "cancel");

}

- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("markedBundleIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

  }
  else
  {
    v11 = v5 != 0;
  }

  return v11;
}

- (void)_processingQueue_markBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("markedBundleIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("markedBundleIdentifiers"));
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

}

- (void)_processingQueue_unmarkBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("markedBundleIdentifiers"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", v6);
}

- (void)_processingQueue_updateQueryRelevancyScores:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SBHIconLibraryQueryResult *v17;
  void *v18;
  SBHIconLibraryQueryResult *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  void *v24;
  id v25;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryErrorKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kRelevancyMapKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = (id)objc_opt_new();
      v12 = v11;

      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __106__SBHIconLibrarySpotlightQueryEngine__processingQueue_updateQueryRelevancyScores_iconLibraryQueryContext___block_invoke;
      v24 = &unk_1E8D86C00;
      v25 = v12;
      v13 = v12;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", &v21);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("kRelevancyMapKey"));

    }
    -[SBHIconLibraryAbstractQueryEngine _processingQueue_lastQueryResultForContext:](self, "_processingQueue_lastQueryResultForContext:", v6, v20, v21, v22, v23, v24);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v8 | v14)
    {
      -[SBHIconLibrarySpotlightQueryEngine _processingQueue_sortComperatorForQueryContext:](self, "_processingQueue_sortComperatorForQueryContext:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "query");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [SBHIconLibraryQueryResult alloc];
      objc_msgSend((id)v14, "icons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBHIconLibraryQueryResult initWithQuery:icons:sortComparator:](v17, "initWithQuery:icons:sortComparator:", v16, v18, v15);

      -[SBHIconLibrarySpotlightQueryEngine _processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:](self, "_processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:", v19, v6, 1);
    }

  }
}

uint64_t __106__SBHIconLibrarySpotlightQueryEngine__processingQueue_updateQueryRelevancyScores_iconLibraryQueryContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_processingQueue_sortComperatorForQueryContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kRelevancyMapKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (objc_msgSend(v5, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __buildIconComparatorForIconsFromRelevancyMap_block_invoke;
      aBlock[3] = &unk_1E8D8BC98;
      v9 = v5;
      v6 = _Block_copy(aBlock);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kRelevancyQueryErrorKey")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kRelevancyMapKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v14 != 0;

    }
    else
    {
      v5 = 1;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  -[SBHIconLibraryAbstractQueryEngine _processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:](&v15, sel__processingQueue_noteQueryResultsWereUpdated_iconLibraryQueryContext_notifyDelegate_, v8, v10, v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentlyRunningQueryContext);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_47_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v3, 0xCu);
}

@end
