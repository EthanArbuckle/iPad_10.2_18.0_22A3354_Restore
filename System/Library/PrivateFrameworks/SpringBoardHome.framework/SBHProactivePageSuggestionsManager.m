@implementation SBHProactivePageSuggestionsManager

- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3
{
  return -[SBHProactivePageSuggestionsManager initWithIconManager:overridingRootFolder:](self, "initWithIconManager:overridingRootFolder:", a3, 0);
}

- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3 overridingRootFolder:(id)a4
{
  id v6;
  id v7;
  SBHProactivePageSuggestionsManager *v8;
  SBHProactivePageSuggestionsManager *v9;
  void *v10;
  ATXSuggestedPagesClient *v11;
  ATXSuggestedPagesClient *suggestedPagesClient;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHProactivePageSuggestionsManager;
  v8 = -[SBHProactivePageSuggestionsManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconManager, v6);
    if (v7)
    {
      objc_storeWeak((id *)&v9->_rootFolder, v7);
    }
    else
    {
      objc_msgSend(v6, "rootFolder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v9->_rootFolder, v10);

    }
    v11 = (ATXSuggestedPagesClient *)objc_alloc_init(MEMORY[0x1E0CF9140]);
    suggestedPagesClient = v9->_suggestedPagesClient;
    v9->_suggestedPagesClient = v11;

  }
  return v9;
}

- (void)addSuggestedPages:(id)a3 withFocusModeIdentifier:(id)a4 forSnapshot:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  SBHFocusMode *v18;
  void *v19;
  SBHFocusMode *v20;
  SBHFocusMode *v21;
  _QWORD v22[5];
  SBHFocusMode *v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a6;
  SBLogFocusModes();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    v29 = 2048;
    v30 = objc_msgSend(v11, "count");
    v31 = 2112;
    v32 = v12;
    v33 = 1024;
    v34 = v7;
    _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "[%@ %@] suggestedPages: %li, focusModeIdentifier: %@, snapshot: %d", buf, 0x30u);

  }
  v18 = [SBHFocusMode alloc];
  -[SBHProactivePageSuggestionsManager rootFolder](self, "rootFolder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBHFocusMode initWithIdentifier:folder:](v18, "initWithIdentifier:folder:", v12, v19);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__SBHProactivePageSuggestionsManager_addSuggestedPages_withFocusModeIdentifier_forSnapshot_completion___block_invoke;
  v22[3] = &unk_1E8D89B28;
  v24 = v7;
  v22[4] = self;
  v23 = v20;
  v21 = v20;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);
  if (v13)
    v13[2](v13);

}

uint64_t __103__SBHProactivePageSuggestionsManager_addSuggestedPages_withFocusModeIdentifier_forSnapshot_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addSuggestedPage:atIndex:forSnapshot:focusMode:", a2, a3, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_addSuggestedPage:(id)a3 atIndex:(unint64_t)a4 forSnapshot:(BOOL)a5 focusMode:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SBWidgetIcon *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  SBHProactivePageSuggestionsManager *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  uint64_t v90;

  v7 = a5;
  v90 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v10 = a6;
  -[SBHProactivePageSuggestionsManager iconManager](self, "iconManager");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  -[SBHProactivePageSuggestionsManager rootFolder](self, "rootFolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "model");
  v59 = v10;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v7;
  if (v7)
  {
    objc_msgSend(v11, "addEmptyList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogFocusModes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "Preparing to add a suggested page for a snapshot (skipping focus mode configuration)...";
LABEL_12:
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    goto LABEL_13;
  }
  objc_msgSend(v11, "insertEmptyListAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogFocusModes();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "Preparing to add a suggested page...", buf, 2u);
  }

  if (!v10)
  {
    SBLogFocusModes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v14 = "No focus mode was provided";
    goto LABEL_12;
  }
  objc_msgSend(v12, "setHidden:", 1);
  objc_msgSend(v10, "addToList:", v12);
  objc_msgSend(v72, "focusModeManager");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addFocusModeRequiringIntroduction:](v13, "addFocusModeRequiringIntroduction:", v16);
  SBLogFocusModes();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v89 = v59;
    _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "Successfully configured suggested page for focus mode: %{public}@", buf, 0xCu);
  }

LABEL_13:
  SBLogFocusModes();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "Adding leaf icons...", buf, 2u);
  }

  objc_msgSend(v62, "leafIcons");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHProactivePageSuggestionsManager _addLeafIcons:toList:iconModel:rootFolder:snapshot:](self, "_addLeafIcons:toList:iconModel:rootFolder:snapshot:");
  SBLogFocusModes();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_DEFAULT, "Adding widgets...", buf, 2u);
  }

  objc_msgSend(v62, "stacks");
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v68)
  {
    v20 = 3;
    if (!v61)
      v20 = 0;
    v64 = v20;
    v65 = *(_QWORD *)v82;
    v66 = v12;
    v67 = v11;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v82 != v65)
          objc_enumerationMutation(obj);
        v71 = v21;
        v22 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v21);
        SBLogFocusModes();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v89 = v22;
          _os_log_impl(&dword_1CFEF3000, v23, OS_LOG_TYPE_DEFAULT, "Widget: %{public}@", buf, 0xCu);
        }

        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v69 = v22;
        objc_msgSend(v22, "widgets");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v78 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v32, "extensionBundleId");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v33);

              objc_msgSend(v32, "widgetKind");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v34);

              objc_msgSend(v32, "appBundleId");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v35);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          }
          while (v29);
        }
        v70 = v24;
        v36 = -[SBWidgetIcon initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:suggestionSource:]([SBWidgetIcon alloc], "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:suggestionSource:", v24, v25, v26, v64);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v37 = v27;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v74 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              objc_msgSend(v42, "intent");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                -[SBIcon uniqueIdentifier](v36, "uniqueIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "widgetUniqueId");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:", v43, v44, v45);

              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          }
          while (v39);
        }

        SBHStackLayoutSizeToIconGridSizeClass(objc_msgSend(v69, "stackLayoutSize"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIcon setGridSizeClass:](v36, "setGridSizeClass:", v46);
        v47 = SBIconCoordinateMake(objc_msgSend(v69, "coordinateColumn") + 1, objc_msgSend(v69, "coordinateRow") + 1);
        v12 = v66;
        v49 = (id)objc_msgSend(v66, "insertIcon:atCoordinate:gridCellInfoOptions:mutationOptions:", v36, v47, v48, 0, 0);

        v21 = v71 + 1;
        v11 = v67;
      }
      while (v71 + 1 != v68);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v68);
  }
  if (objc_msgSend(v12, "isEmpty"))
  {
    objc_msgSend(v11, "removeList:", v12);
    v50 = v62;
  }
  else
  {
    v50 = v62;
    if (!v61)
    {
      objc_msgSend(v12, "uniqueIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setUniqueIdentifier:", v51);

      objc_msgSend(v59, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v59, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setWithObject:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setAssociatedModeUUIDs:", v55);

        v50 = v62;
      }
      -[SBHProactivePageSuggestionsManager suggestedPagesClient](v58, "suggestedPagesClient");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "didInstallSuggestedPage:", v50);

    }
  }

}

- (void)_addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  objc_msgSend(&unk_1E8E177B8, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = objc_alloc_init(MEMORY[0x1E0CF9148]);
  objc_msgSend(v9, "setPageType:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0CF9158]);
  -[SBHProactivePageSuggestionsManager suggestedPagesClient](self, "suggestedPagesClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke;
  v13[3] = &unk_1E8D89B78;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "suggestedPagesWithFilter:layoutOptions:completionHandler:", v9, v10, v13);

}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_2;
  block[3] = &unk_1E8D84F18;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_3;
  v2[3] = &unk_1E8D89B50;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v9 = a2;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a2;
    objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSuggestedPages:withFocusModeIdentifier:forSnapshot:completion:", v8, *(_QWORD *)(a1 + 40), 0, 0, v9, v10);

  }
}

- (void)_addLeafIcons:(id)a3 toList:(id)a4 iconModel:(id)a5 rootFolder:(id)a6 snapshot:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  SBFolder *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  SBFolderIcon *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  NSObject *v50;
  void *v51;
  id obj;
  void *v53;
  NSObject *v54;
  os_log_t log;
  NSObject *loga;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _BOOL4 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  os_log_t v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v61 = a7;
  v76 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v59 = a4;
  v12 = a5;
  v13 = a6;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v14)
  {
    v15 = v14;
    v57 = *(_QWORD *)v67;
    do
    {
      v16 = 0;
      v58 = v15;
      do
      {
        if (*(_QWORD *)v67 != v57)
          objc_enumerationMutation(obj);
        v17 = *(os_log_t *)(*((_QWORD *)&v66 + 1) + 8 * v16);
        SBLogFocusModes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v71 = v17;
          _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "Icon: %{public}@", buf, 0xCu);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = objc_opt_class();
          v20 = v17;
          if (v19)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
          }
          else
          {
            v21 = 0;
          }
          v22 = v21;

          -[SBHProactivePageSuggestionsManager _iconForATXHomeScreenApp:iconModel:rootFolder:](self, "_iconForATXHomeScreenApp:iconModel:rootFolder:", v22, v12, v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "addIcon:", v23);
        }
        objc_opt_class();
        v60 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = objc_opt_class();
          v25 = v17;
          log = v17;
          if (v24)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v26 = v25;
            else
              v26 = 0;
          }
          else
          {
            v26 = 0;
          }
          v27 = v26;

          -[NSObject name](v27, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[SBFolder initWithDisplayName:maxListCount:maxIconCountInLists:]([SBFolder alloc], "initWithDisplayName:maxListCount:maxIconCountInLists:", v53, 9, 9);
          v54 = v27;
          -[NSObject folderPages](v27, "folderPages");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v63 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                SBLogFocusModes();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CFEF3000, v35, OS_LOG_TYPE_DEFAULT, "Adding a folder icon...", buf, 2u);
                }

                objc_msgSend(v34, "contents");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBFolder firstList](v28, "firstList");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBHProactivePageSuggestionsManager _addLeafIcons:toList:iconModel:rootFolder:snapshot:](self, "_addLeafIcons:toList:iconModel:rootFolder:snapshot:", v36, v37, v12, v13, v61);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            }
            while (v31);
          }
          v38 = -[SBFolderIcon initWithFolder:]([SBFolderIcon alloc], "initWithFolder:", v28);
          objc_msgSend(v59, "addIcon:", v38);

          v15 = v58;
          v16 = v60;
          v17 = log;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject identifier](v17, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject bundleIdentifierForDisplay](v17, "bundleIdentifierForDisplay");
          v40 = objc_claimAutoreleasedReturnValue();
          -[NSObject name](v17, "name");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = objc_alloc_init(MEMORY[0x1E0DC3F68]);
          objc_msgSend(v42, "setIdentifier:", v39);
          objc_msgSend(v42, "setShortcutIdentifier:", v39);
          v43 = (void *)v40;
          objc_msgSend(v42, "setApplicationBundleIdentifier:", v40);
          v44 = (void *)v41;
          objc_msgSend(v42, "setTitle:", v41);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shortcuts://x-callback-url/run-shortcut?id=%@&source=homescreen"), v39);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setPageURL:", v46);

          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", -[NSObject icon](v17, "icon"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setIconImage:isPrecomposed:", v47, 0);
          if (!v61 && (objc_msgSend(v42, "createOnDisk") & 1) == 0)
          {
            SBLogIcon();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              loga = v48;
              v50 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v71 = v50;
              v72 = 2112;
              v73 = v42;
              _os_log_impl(&dword_1CFEF3000, loga, OS_LOG_TYPE_DEFAULT, "[%@] Failed to save web clip %@", buf, 0x16u);

              v48 = loga;
            }

          }
          objc_msgSend(v12, "addBookmarkIconForWebClip:", v42);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addIcon:", v51);

          v16 = v60;
          v15 = v58;
        }
        ++v16;
      }
      while (v16 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v15);
  }

}

- (id)_iconForATXHomeScreenApp:(id)a3 iconModel:(id)a4 rootFolder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationIconForBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "indexPathForIcon:includingPlaceholders:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "addAdditionalIconMatchingIcon:", v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v11;
    }
    v15 = v13;
  }
  else
  {
    SBLogFocusModes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[SBHProactivePageSuggestionsManager _iconForATXHomeScreenApp:iconModel:rootFolder:].cold.1((uint64_t)self, (uint64_t)v10, v14);

    v15 = 0;
  }

  return v15;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (SBRootFolder)rootFolder
{
  return (SBRootFolder *)objc_loadWeakRetained((id *)&self->_rootFolder);
}

- (void)setRootFolder:(id)a3
{
  objc_storeWeak((id *)&self->_rootFolder, a3);
}

- (ATXSuggestedPagesClient)suggestedPagesClient
{
  return self->_suggestedPagesClient;
}

- (void)setSuggestedPagesClient:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPagesClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesClient, 0);
  objc_destroyWeak((id *)&self->_rootFolder);
  objc_destroyWeak((id *)&self->_iconManager);
}

- (void)_iconForATXHomeScreenApp:(uint64_t)a1 iconModel:(uint64_t)a2 rootFolder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_fault_impl(&dword_1CFEF3000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to create app icon for suggested bundle identifier: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
