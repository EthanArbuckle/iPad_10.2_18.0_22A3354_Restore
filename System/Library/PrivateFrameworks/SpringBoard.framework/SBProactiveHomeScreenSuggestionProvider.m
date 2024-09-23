@implementation SBProactiveHomeScreenSuggestionProvider

- (SBProactiveHomeScreenSuggestionProvider)initWithIconController:(id)a3
{
  id v4;
  SBProactiveHomeScreenSuggestionProvider *v5;
  SBProactiveHomeScreenSuggestionProvider *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBProactiveHomeScreenSuggestionProvider;
  v5 = -[SBProactiveHomeScreenSuggestionProvider init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconController, v4);
    objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObserver:", v6);

    -[SBProactiveHomeScreenSuggestionProvider updatePredictions](v6, "updatePredictions");
  }

  return v6;
}

- (id)iconModel
{
  void *v2;
  void *v3;
  void *v4;

  -[SBProactiveHomeScreenSuggestionProvider iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootFolder
{
  void *v2;
  void *v3;

  -[SBProactiveHomeScreenSuggestionProvider iconModel](self, "iconModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updatePredictions
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  SBLogProactiveHome();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "fetching new home screen predictions", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke;
  v5[3] = &unk_1E8EB1018;
  v5[4] = self;
  objc_msgSend(v4, "homeScreenPredictionWithReply:", v5);

}

void __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  BSDispatchMain();

}

uint64_t __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "processUpdatedPredictions:");
  v3 = *(_QWORD *)(a1 + 48);
  SBLogProactiveHome();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2_cold_1((uint64_t *)(a1 + 48), v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "No prediction when fetching home screen widget predictions", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setCurrentPrediction:", 0);
}

- (void)processUpdatedPredictions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SBProactiveHomeScreenSuggestionProvider *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogProactiveHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBProactiveHomeScreenSuggestionProvider processUpdatedPredictions:].cold.1(v4, v5);

  -[SBProactiveHomeScreenSuggestionProvider currentPrediction](self, "currentPrediction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenSuggestionProvider setCurrentPrediction:](self, "setCurrentPrediction:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11++), "proactiveHomeScreenSuggestionProviderDidUpdatePrediction:", self);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  -[SBProactiveHomeScreenSuggestionProvider rootFolder](self, "rootFolder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke;
  v15[3] = &unk_1E8EB1068;
  v16 = v4;
  v17 = v6;
  v18 = self;
  v13 = v6;
  v14 = v4;
  objc_msgSend(v12, "enumerateAllIconsUsingBlock:", v15);

}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  if (objc_msgSend(v3, "isWidgetStackIcon"))
  {
    v4 = v3;
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "suggestionForStackIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "suggestionForStackIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogProactiveHome();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_cold_1();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7;
    v14[3] = &unk_1E8E9E298;
    v9 = *(_QWORD *)(a1 + 48);
    v15 = v6;
    v16 = v9;
    v17 = v4;
    v18 = v5;
    v19 = v7;
    v10 = v7;
    v11 = v5;
    v12 = v4;
    v13 = v6;
    objc_msgSend(v12, "performCoalescedDataSourceUpdate:", v14);

  }
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  __int128 v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  id obja;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "suggestedWidgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v51)
  {
    v5 = *(_QWORD *)v62;
    *(_QWORD *)&v4 = 138412290;
    v46 = v4;
    v48 = v3;
    v49 = v2;
    v47 = *(_QWORD *)v62;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v62 != v5)
          objc_enumerationMutation(v3);
        v52 = v6;
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v7, "widgetUniqueId", v46);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extensionBundleId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetKind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_iconDataSourceInIcon:withUniqueIdentifier:extensionBundleIdentifier:widgetKind:suggestionSource:", v9, v10, v11, v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          SBLogProactiveHome();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v46;
            v67 = v13;
            _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "skipping adding data source because the suggested widget %@ is already suggested in stack", buf, 0xCu);
          }

          objc_msgSend(v2, "addObject:", v13);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "_makeDataSourceForAtxWidget:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            SBLogProactiveHome();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v46;
              v67 = v15;
              _os_log_debug_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEBUG, "adding new suggested widget data source %@", buf, 0xCu);
            }
            v50 = v15;

            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            obj = *(id *)(*(_QWORD *)(a1 + 40) + 8);
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v58 != v19)
                    objc_enumerationMutation(obj);
                  v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  v22 = *(_QWORD *)(a1 + 40);
                  objc_msgSend(v7, "intent");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = *(_QWORD *)(a1 + 56);
                  objc_msgSend(v7, "widgetUniqueId");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "proactiveHomeScreenSuggestionProvider:willUseTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:", v22, v23, v24, v25);

                }
                v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
              }
              while (v18);
            }

            v26 = objc_msgSend(*(id *)(a1 + 48), "allowsSuggestions");
            v27 = *(void **)(a1 + 48);
            if (v26)
            {
              v15 = v50;
              objc_msgSend(v27, "addIconDataSource:", v50);
            }
            else
            {
              objc_msgSend(v27, "activeDataSource");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v50;
              objc_msgSend(*(id *)(a1 + 48), "insertIconDataSource:beforeIconDataSource:", v50, v28);

            }
            v3 = v48;
            v2 = v49;
            v5 = v47;
            v13 = 0;
            objc_msgSend(v49, "addObject:", v15);
          }

        }
        v6 = v52 + 1;
      }
      while (v52 + 1 != v51);
      v51 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v51);
  }

  v30 = (id *)(a1 + 48);
  v29 = *(void **)(a1 + 48);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9;
  v55[3] = &unk_1E8EB1040;
  v31 = v2;
  v56 = v31;
  objc_msgSend(v29, "removeIconDataSourcesPassingTest:", v55);
  objc_msgSend(*(id *)(a1 + 40), "iconController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "iconManager");
  v33 = a1;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isShowingModalInteraction"))
  {
    SBLogProactiveHome();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_1(v35);
  }
  else
  {
    objc_msgSend(*(id *)(v33 + 32), "topWidget");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(*(id *)(v33 + 32), "topWidget");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v33 + 64), "topWidget");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v35, "isEqual:", v37))
      {
        SBLogProactiveHome();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_3();
      }
      else
      {
        obja = v37;
        v40 = *(void **)(v33 + 40);
        v39 = *(_QWORD *)(v33 + 48);
        -[NSObject widgetUniqueId](v35, "widgetUniqueId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject extensionBundleId](v35, "extensionBundleId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject widgetKind](v35, "widgetKind");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_iconDataSourceInIcon:withUniqueIdentifier:extensionBundleIdentifier:widgetKind:suggestionSource:", v39, v41, v42, v43, 0);
        v38 = objc_claimAutoreleasedReturnValue();

        SBLogProactiveHome();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v38)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_5((uint64_t)v38, v30, v45);

          objc_msgSend(*v30, "setStackChangeReason:", 2);
          objc_msgSend(*v30, "setActiveDataSource:", v38);
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_4(v35, v45);

        }
        v37 = obja;
      }

    }
    else
    {
      SBLogProactiveHome();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_2(v35);
    }
  }

}

uint64_t __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v3, "suggestionSource") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    SBLogProactiveHome();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_1((uint64_t)v3, v6, v7);

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)_supportedElementClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  _QWORD v26[6];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a4)
  {
    objc_msgSend(v12, "firstIconDataSourceWithUniqueIdentifier:", a4);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_msgSend(MEMORY[0x1E0DAA428], "elementClassWithIdentifier:", v13);
    if (!v17
      || (v18 = v17,
          -[SBProactiveHomeScreenSuggestionProvider _supportedElementClasses](self, "_supportedElementClasses"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "containsObject:", v18),
          v19,
          !v20))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke_2;
      v22[3] = &unk_1E8EB10B0;
      v25 = a7;
      v23 = v13;
      v24 = v14;
      objc_msgSend(v12, "firstWidgetPassingTest:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke;
    v26[3] = &__block_descriptor_48_e32_B16__0___SBLeafIconDataSource__8lu40l8;
    v26[4] = a7;
    v26[5] = v18;
    objc_msgSend(v12, "firstIconDataSourcePassingTest:", v26);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
LABEL_8:

  return v16;
}

uint64_t __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "suggestionSource") == *(_QWORD *)(a1 + 32);

  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (a1[6] && objc_msgSend(v3, "suggestionSource") != a1[6])
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", a1[4]))
    {
      v7 = a1[5];
      v6 = a1 + 5;
      if (v7)
      {
        objc_msgSend(v4, "kind");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *v6);

      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_makeDataSourceForAtxWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DAA428];
  objc_msgSend(v4, "extensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v5, "elementClassWithIdentifier:", v6);

  if (!v7)
    goto LABEL_4;
  -[SBProactiveHomeScreenSuggestionProvider _supportedElementClasses](self, "_supportedElementClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (!v9
    || (v10 = [v7 alloc],
        objc_msgSend(v4, "widgetUniqueId"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = (void *)objc_msgSend(v10, "initWithUniqueIdentifier:", v11),
        v11,
        v13 = (void *)objc_msgSend(v12, "copyWithSuggestionSource:", 1),
        v12,
        !v13))
  {
LABEL_4:
    objc_msgSend(v4, "widgetKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0DAA580]);
      objc_msgSend(v4, "widgetUniqueId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "widgetKind");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extensionBundleId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appBundleId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v16, v17, v18, v19);

      v13 = (void *)-[NSObject copyWithSuggestionSource:](v20, "copyWithSuggestionSource:", 1);
      SBLogWidgets();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject extensionBundleIdentifier](v20, "extensionBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueIdentifier](v20, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v22;
        v27 = 2114;
        v28 = v23;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for home screen suggestion.", (uint8_t *)&v25, 0x16u);

      }
    }
    else
    {
      SBLogProactiveHome();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[SBProactiveHomeScreenSuggestionProvider _makeDataSourceForAtxWidget:].cold.1(v20);
      v13 = 0;
    }

  }
  return v13;
}

- (ATXHomeScreenPrediction)currentPrediction
{
  return self->_currentPrediction;
}

- (void)setCurrentPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_currentPrediction, a3);
}

- (SBIconController)iconController
{
  return (SBIconController *)objc_loadWeakRetained((id *)&self->_iconController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconController);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Error fetching home screen widget predictions: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)processUpdatedPredictions:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "suggestionsForAllStacks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "process updated predictions: %@", (uint8_t *)&v5);

}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "suggestion %@ for stack with identifier: %@");
  OUTLINED_FUNCTION_2_0();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "skipping active data source update because configuration ui is showing", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "skipping active data source update because suggested top widget is nil", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "skipping active data source update because the old top widget (%@) we had was the same as the new one (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_4(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "suggested top widget not found in stack for widget identifier: %@, extension bundle identifier: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_20();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_7_cold_5(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "setting active data source to widget %@ (previously: %@)", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_20();
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "removing suggested widget data source %@ because it's no longer suggested", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)_makeDataSourceForAtxWidget:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "failed to update suggestion data source because widgetKind was nil", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
