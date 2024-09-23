@implementation SBProactiveHomeScreenUsageObserver

void __84__SBProactiveHomeScreenUsageObserver_widgetIdentifiablesDictionaryForIconListModel___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "isWidgetIcon");
  v4 = v13;
  if (v3)
  {
    objc_msgSend(v13, "activeDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "proactiveWidgetForIconDataSource:ofIcon:", v5, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v13, "uniqueIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v9, "setObject:forKey:", v6, v8);
    }

    v4 = v13;
  }

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4
{
  -[SBProactiveHomeScreenUsageObserver logHomeScreenPageDidAppearWithPageIndex:](self, "logHomeScreenPageDidAppearWithPageIndex:", a4);
}

- (void)logHomeScreenPageDidAppearWithPageIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SBProactiveHomeScreenUsageObserver rootFolder](self, "rootFolder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isValidListIndex:", a3))
  {
    objc_msgSend(v9, "listAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBProactiveHomeScreenUsageObserver widgetIdentifiablesDictionaryForIconListModel:](self, "widgetIdentifiablesDictionaryForIconListModel:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHomeScreenPageDidAppear:topWidgetsByStackIdentifier:prediction:", a3, v6, v8);

  }
}

- (id)widgetIdentifiablesDictionaryForIconListModel:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__49;
  v12 = __Block_byref_object_dispose__49;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__SBProactiveHomeScreenUsageObserver_widgetIdentifiablesDictionaryForIconListModel___block_invoke;
  v7[3] = &unk_1E8EADB78;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateIconsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)rootFolder
{
  void *v2;
  void *v3;

  -[SBProactiveHomeScreenUsageObserver iconModel](self, "iconModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iconModel
{
  void *v2;
  void *v3;
  void *v4;

  -[SBProactiveHomeScreenUsageObserver iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBIconController)iconController
{
  return (SBIconController *)objc_loadWeakRetained((id *)&self->_iconController);
}

- (ATXHomeScreenPrediction)currentPrediction
{
  return self->_currentPrediction;
}

- (id)proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (objc_class *)MEMORY[0x1E0CF8EB0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExtensionBundleId:", v10);

  objc_msgSend(v8, "containerBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAppBundleId:", v11);

  objc_msgSend(v8, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWidgetUniqueId:", v12);

  objc_msgSend(v8, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWidgetKind:", v13);

  objc_msgSend(v9, "setSuggestedWidget:", objc_msgSend(v8, "suggestionSource") == 1);
  objc_msgSend(v9, "setOnboardingWidget:", objc_msgSend(v8, "suggestionSource") == 2);
  -[SBProactiveHomeScreenUsageObserver delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "proactiveHomeScreenUsageObserver:intentForWidget:ofIcon:", self, v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIntent:", v15);
  return v9;
}

- (id)proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForWidget:ofIcon:](self, "proactiveWidgetForWidget:ofIcon:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
    {
      v13 = v6;
      objc_msgSend((id)objc_opt_class(), "elementIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0CF8EB0]);
      objc_msgSend(v10, "setExtensionBundleId:", v14);
      objc_msgSend((id)objc_opt_class(), "elementKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWidgetKind:", v15);
      objc_msgSend(v13, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWidgetUniqueId:", v16);

      objc_msgSend(v10, "setSuggestedWidget:", objc_msgSend(v13, "suggestionSource") == 1);
      v17 = objc_msgSend(v13, "suggestionSource");

      objc_msgSend(v10, "setOnboardingWidget:", v17 == 2);
    }
    else
    {
      v10 = 0;
    }
  }
  objc_msgSend(v7, "gridSizeClass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSize:", SBHIconGridSizeClassToStackLayoutSize());

  return v10;
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v12, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logWidgetDidDisappear:stackId:prediction:", v9, v8, v11);

}

- (SBProactiveHomeScreenUsageObserverDelegate)delegate
{
  return (SBProactiveHomeScreenUsageObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBProactiveHomeScreenUsageObserver)initWithIconController:(id)a3
{
  id v4;
  SBProactiveHomeScreenUsageObserver *v5;
  SBProactiveHomeScreenUsageObserver *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBProactiveHomeScreenUsageObserver;
  v5 = -[SBProactiveHomeScreenUsageObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconController, v4);
    objc_msgSend(v4, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsageMonitoringEnabled:", 1);
    objc_msgSend(v7, "usageMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_deviceLockStateDidChange_, *MEMORY[0x1E0DAC318], 0);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBProactiveHomeScreenUsageObserver pushCurrentHomeScreenConfiguration](self, "pushCurrentHomeScreenConfiguration");
    v5 = obj;
  }

}

- (void)pushCurrentHomeScreenConfiguration
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogProactiveHome();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Gathering new home screen configuration", v4, 2u);
  }

  -[SBProactiveHomeScreenUsageObserver pushCurrentHomeScreenPagesConfiguration](self, "pushCurrentHomeScreenPagesConfiguration");
  -[SBProactiveHomeScreenUsageObserver pushCurrentDockConfiguration](self, "pushCurrentDockConfiguration");
  -[SBProactiveHomeScreenUsageObserver pushCurrentTodayConfiguration](self, "pushCurrentTodayConfiguration");
}

- (void)pushCurrentHomeScreenPagesConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  SBProactiveHomeScreenUsageObserver *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SBProactiveHomeScreenUsageObserver iconController](self, "iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogProactiveHome();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "(%{public}@) Preparing to push current home screen configuration", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  v11 = objc_msgSend(v5, "maxRowCountForListInRootFolderWithInterfaceOrientation:", 1);
  v12 = objc_msgSend(v5, "maxColumnCountForListInRootFolderWithInterfaceOrientation:", 1);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke;
  v21[3] = &unk_1E8EADAC0;
  v25 = v11;
  v26 = v12;
  v27 = v10;
  v14 = v7;
  v22 = v14;
  v23 = self;
  v15 = v9;
  v24 = v15;
  objc_msgSend(v6, "enumerateListsWithOptions:usingBlock:", 4, v21);
  SBLogProactiveHome();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing home screen configuration: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_17;
  v19[3] = &unk_1E8EA78D8;
  v20 = v14;
  v18 = v14;
  objc_msgSend(v17, "writeHomeScreenPageConfigurations:completionHandler:", v15, v19);

}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  v5 = (objc_class *)MEMORY[0x1E0CF8E78];
  v6 = a2;
  v19 = objc_alloc_init(v5);
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUniqueIdentifier:", v7);

  objc_msgSend(v19, "setPageIndex:", a3);
  objc_msgSend(v19, "setHidden:", objc_msgSend(v6, "isHidden"));
  objc_msgSend(v19, "setMaxPortraitRows:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v19, "setMaxPortraitColumns:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v6, "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_2;
  v20[3] = &unk_1E8EADA98;
  v21 = v9;
  v22 = *(id *)(a1 + 32);
  v23 = v10;
  v24 = *(_QWORD *)(a1 + 40);
  v25 = v8;
  v26 = v12;
  v27 = v11;
  v13 = v11;
  v14 = v12;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v6, "enumerateIconsUsingBlock:", v20);
  objc_msgSend(v19, "setStacks:", v13);
  objc_msgSend(v19, "setPanels:", v14);
  objc_msgSend(v19, "setAppLocations:", v17);
  objc_msgSend(v19, "setWebClipLocations:", v16);
  objc_msgSend(v6, "focusModeIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setAssociatedModeUUIDs:", v18);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);

}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "isLeafIcon"))
  {
    objc_msgSend(v5, "applicationBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
      SBLogProactiveHome();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v25 = v9;
        v26 = 2112;
        v27 = v7;
        v10 = "(%{public}@: iconLocation: %@";
LABEL_10:
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, v10, buf, 0x16u);
      }
    }
    else
    {
      if (!objc_msgSend(v5, "isBookmarkIcon"))
      {
        if (!objc_msgSend(v5, "isWidgetIcon"))
          goto LABEL_13;
        objc_msgSend(*(id *)(a1 + 56), "proactiveStackForWidgetIcon:atIndex:gridCellInfo:", v5, a3, *(_QWORD *)(a1 + 64));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "sb_isAppPredictionStack");
        SBLogProactiveHome();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            v17 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v25 = v17;
            v26 = 2112;
            v27 = v7;
            _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@: Panel configuration: %@", buf, 0x16u);
          }

          v18 = (id *)(a1 + 72);
        }
        else
        {
          if (v16)
          {
            v19 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v25 = v19;
            v26 = 2112;
            v27 = v7;
            _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@: Stack configuration: %@", buf, 0x16u);
          }

          v18 = (id *)(a1 + 80);
        }
        objc_msgSend(*v18, "addObject:", v7);
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v5, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v7, v12);

      SBLogProactiveHome();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v25 = v13;
        v26 = 2112;
        v27 = v7;
        v10 = "(%{public}@: bookmark iconLocation: %@";
        goto LABEL_10;
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isFolderIcon"))
  {
    objc_msgSend(v5, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_12;
    v20[3] = &unk_1E8EADA70;
    v23 = a3;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v6, "enumerateAllIconsUsingBlock:", v20);

LABEL_13:
  }

}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isLeafIcon"))
  {
    objc_msgSend(v5, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15[0] = *(_QWORD *)(a1 + 48);
      v15[1] = objc_msgSend(v6, "sbListIndex");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v15, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogProactiveHome();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 138543618;
        v12 = v10;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "(%{public}@: iconLocation: %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v7);
    }

  }
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogProactiveHome();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_17_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushed home screen configuration successfully!", (uint8_t *)&v7, 0xCu);
  }

}

- (void)pushCurrentDockConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBProactiveHomeScreenUsageObserver iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "dock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke;
  v11[3] = &unk_1E8EADAE8;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "enumerateIconsUsingBlock:", v11);

  SBLogProactiveHome();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Pushing dock app list: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeDockAppList:completionHandler:", v8, &__block_literal_global_149);

}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isLeafIcon");
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    SBLogProactiveHome();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_20_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)pushCurrentTodayConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];

  v47[2] = *MEMORY[0x1E0C80C00];
  -[SBProactiveHomeScreenUsageObserver iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayList");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "favoriteTodayList");
  v7 = objc_claimAutoreleasedReturnValue();
  v28 = v3;
  v29 = v2;
  v26 = v5;
  v27 = v4;
  v24 = (void *)v7;
  v25 = (void *)v6;
  if (v6 && v7)
  {
    v47[0] = v7;
    v47[1] = v6;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v47;
    v10 = 2;
LABEL_9:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v24, v6, v5, v4, v3, v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7)
  {
    v46 = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v46;
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  if (v6)
  {
    v45 = v6;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v45;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_10:
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v19, "gridCellInfoWithOptions:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", v24) == 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v17;
        v32[1] = 3221225472;
        v32[2] = __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke;
        v32[3] = &unk_1E8EADB30;
        v32[4] = self;
        v33 = v20;
        v34 = v13;
        v35 = v12;
        v21 = v20;
        objc_msgSend(v19, "enumerateIconsUsingBlock:", v32);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v15);
  }

  SBLogProactiveHome();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "Pushing today list stacks: %@, app prediction stacks: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "writeTodayPageStacks:appPredictionPanels:completionHandler:", v12, v13, &__block_literal_global_23_1);

}

void __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "isWidgetIcon"))
  {
    objc_msgSend(*(id *)(a1 + 32), "proactiveStackForWidgetIcon:atIndex:gridCellInfo:", v5, a3, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogProactiveHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Stack configuration for today: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(v6, "sb_isAppPredictionStack");
    v9 = 56;
    if (v8)
      v9 = 48;
    objc_msgSend(*(id *)(a1 + v9), "addObject:", v6);

  }
}

void __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    SBLogProactiveHome();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_20_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (id)proactiveStackForWidgetIcon:(id)a3 atIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CF8E98]);
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  objc_msgSend(v8, "gridSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStackLayoutSize:", SBHIconGridSizeClassToStackLayoutSize());

  v13 = objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", a4));
  objc_msgSend(v10, "setCoordinateRow:", v14 - 1);
  objc_msgSend(v10, "setCoordinateColumn:", v13 - 1);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "iconDataSources", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  objc_msgSend(v10, "setWidgets:", v15);
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    objc_msgSend(v10, "setAllowsSmartRotate:", 0);
    v22 = 0;
  }
  else
  {
    objc_msgSend(v10, "setAllowsSmartRotate:", objc_msgSend(v8, "allowsSuggestions"));
    v22 = objc_msgSend(v8, "allowsExternalSuggestions");
  }
  objc_msgSend(v10, "setAllowsNewWidget:", v22);

  return v10;
}

- (void)logTodayViewDidAppear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBProactiveHomeScreenUsageObserver rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "todayList");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBProactiveHomeScreenUsageObserver widgetIdentifiablesDictionaryForIconListModel:](self, "widgetIdentifiablesDictionaryForIconListModel:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logSpecialPageDidAppear:widgetsByStackId:prediction:", 2, v4, v6);

}

- (void)deviceLockStateDidChange:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DAC420]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v10, "logDeviceLock");
  else
    objc_msgSend(v10, "logDeviceUnlock");

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteRootControllerWillAppearWithPageIndex:(unint64_t)a4
{
  -[SBProactiveHomeScreenUsageObserver logHomeScreenPageDidAppearWithPageIndex:](self, "logHomeScreenPageDidAppearWithPageIndex:", a4);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "stackChangeReason") - 1;
  if (v6 > 5)
    v7 = 0;
  else
    v7 = qword_1D0E89840[v6];
  if (v5)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v5, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logStackStatusDidChange:widgetOnTop:reason:prediction:", v10, v8, v7, v11);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "firstSuggestedIconDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v5, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:", 3, v8, v6, v9);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "firstSuggestedIconDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v5, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:", 2, v8, v6, v9);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "firstSuggestedIconDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v5, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:", 1, v8, v6, v9);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v7 = a5;
  objc_msgSend(v18, "activeDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v8, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v18, "activeWidget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.news")))
  {

  }
  else
  {
    objc_msgSend(v10, "containerBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.news"));

    if (!v13)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = v7;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logStackDidTap:engagedUrl:widgetOnTop:prediction:", v16, v14, v9, v17);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(v11, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logWidgetDidAppear:stackId:prediction:", v8, v6, v10);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteTodayViewAtLocation:(int64_t)a4 scrolledWithIconVisibility:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  SBProactiveHomeScreenUsageObserver *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "isWidgetIcon"))
        {
          v12 = v11;
          objc_msgSend(v12, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "activeDataSource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[SBProactiveHomeScreenUsageObserver proactiveWidgetForIconDataSource:ofIcon:](self, "proactiveWidgetForIconDataSource:ofIcon:", v14, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
          objc_msgSend(v6, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_CGRectValue");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;

          objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBProactiveHomeScreenUsageObserver currentPrediction](self, "currentPrediction");
          v26 = self;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logStackVisibilityChanged:visibleRect:topWidget:prediction:", v13, v15, v27, v18, v20, v22, v24);

          self = v26;
          v9 = v28;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

}

- (void)homeScreenUsageAggregatorDidStartDiscoveringWidgets:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUserDidStartWidgetOnboarding");

}

- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidAcceptSuggestion:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CF8EA0];
  v5 = a4;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logUserDidAcceptWidgetOnboardingSuggestion:", v5);

}

- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidRejectSuggestion:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CF8EA0];
  v5 = a4;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logUserDidRejectWidgetOnboardingSuggestion:", v5);

}

- (void)homeScreenUsageAggregatorWidgetDiscoverabilityDidEnterEditingMode:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUserDidEnterEditModeForWidgetOnboarding");

}

- (void)setCurrentPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_currentPrediction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_17_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error pushing home screen configuration: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_20_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Error writing dock app list: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
