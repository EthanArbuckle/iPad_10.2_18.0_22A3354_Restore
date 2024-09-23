@implementation SBHFocusModeManager

- (SBHFocusMode)activeFocusMode
{
  return self->_activeFocusMode;
}

- (SBHFocusModeManager)initWithIconManager:(id)a3
{
  id v4;
  SBHFocusModeManager *v5;
  SBHFocusModeManager *v6;
  uint64_t v7;
  NSMutableDictionary *focusModesBySourceNumber;
  uint64_t v9;
  NSHashTable *observers;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHFocusModeManager;
  v5 = -[SBHFocusModeManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    v7 = objc_opt_new();
    focusModesBySourceNumber = v6->_focusModesBySourceNumber;
    v6->_focusModesBySourceNumber = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__iconEditingDidChange_, CFSTR("SBHIconManagerEditingStateChanged"), v4);
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__iconModelDidChange_, CFSTR("SBHIconManagerIconModelDidChange"), v4);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHFocusModeManager;
  -[SBHFocusModeManager dealloc](&v4, sel_dealloc);
}

- (void)setActiveFocusMode:(id)a3
{
  -[SBHFocusModeManager donateFocusMode:fromSource:](self, "donateFocusMode:fromSource:", a3, 1);
}

- (void)donateFocusMode:(id)a3 fromSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "setSource:", a4);
  -[SBHFocusModeManager focusModesBySourceNumber](self, "focusModesBySourceNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  -[SBHFocusModeManager computeCurrentFocusMode](self, "computeCurrentFocusMode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModeManager applyFocusMode:](self, "applyFocusMode:", v9);

}

- (id)computeCurrentFocusMode
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[4];

  BSDispatchQueueAssertMain();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = -1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  -[SBHFocusModeManager focusModesBySourceNumber](self, "focusModesBySourceNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SBHFocusModeManager_computeCurrentFocusMode__block_invoke;
  v6[3] = &unk_1E8D89F98;
  v6[4] = v13;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __46__SBHFocusModeManager_computeCurrentFocusMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 > *(_QWORD *)(v7 + 24))
  {
    *(_QWORD *)(v7 + 24) = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)applyFocusMode:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogFocusModes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v49 = v8;
    v50 = 2114;
    v51 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] applying focus mode: %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_activeFocusMode, a3);
  -[SBHFocusModeManager iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootFolderController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v37 = v15;
  objc_msgSend(v15, "currentIconListModel");
  v36 = objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v10, "currentPageIndex");
  v33 = objc_msgSend(v10, "trailingCustomViewPageIndex");
  v32 = objc_msgSend(v9, "isMainDisplayLibraryViewVisible");
  objc_msgSend(v9, "rootFolder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModeManager _updateDockWithActiveFocusMode:rootFolder:](self, "_updateDockWithActiveFocusMode:rootFolder:", v5, v16);
  v35 = v16;
  objc_msgSend(v16, "lists");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "customizedHomeScreenPagesEnabled"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "updateForFocusModeActivated:wantsListVisible:", 1, objc_msgSend(v5, "wantsListVisible:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i)));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v20);
    }
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = v17;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "updateForFocusModeActivated:wantsListVisible:", 0, 0);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v25);
    }
  }

  if (v34 == v33)
    v28 = v32;
  else
    v28 = 0;
  if (v28 == 1)
  {
    v29 = objc_msgSend(v10, "trailingCustomViewPageIndex");
    v31 = (void *)v36;
    v30 = v37;
LABEL_33:
    objc_msgSend(v10, "setCurrentPageIndex:animated:", v29, 0);
    goto LABEL_34;
  }
  v31 = (void *)v36;
  v30 = v37;
  if (v36)
  {
    v29 = objc_msgSend(v37, "pageIndexForIconListModel:", v36);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      v29 = objc_msgSend(v37, "defaultPageIndex");
    goto LABEL_33;
  }
LABEL_34:
  objc_msgSend(v9, "updateIconViewAccessoryVisibility");
  -[SBHFocusModeManager updateFocusModePopoverVisibility](self, "updateFocusModePopoverVisibility");
  -[SBHFocusModeManager _notifyObserversOfActiveFocusModeChange](self, "_notifyObserversOfActiveFocusModeChange");

}

- (void)dismissAllFocusModePopovers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBHFocusModeManager focusModeFeatureIntroductionItem](self, "focusModeFeatureIntroductionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "tearDown");
    -[SBHFocusModeManager iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureIntroductionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFeatureIntroductionAtAllLocationsWithItem:", v6);
    -[SBHFocusModeManager setFocusModeFeatureIntroductionItem:](self, "setFocusModeFeatureIntroductionItem:", 0);

    v3 = v6;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBHFocusModeManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBHFocusModeManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)addFocusModeRequiringIntroduction:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[SBHFocusModeManager iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModesRequiringIntroduction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  if ((objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v6, "arrayByAddingObject:", v8);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setFocusModesRequiringIntroduction:", v7);
    v6 = (id)v7;
  }

}

- (void)removeFocusModeRequiringIntroduction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SBHFocusModeManager iconManager](self, "iconManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeScreenDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModeManager _focusModesRequiringIntroduction](self, "_focusModesRequiringIntroduction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusModesRequiringIntroduction:", v7);

}

- (void)updateFocusModePopoverVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  SBHFocusModeFeatureIntroductionItem *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBHFocusModeManager activeFocusMode](self, "activeFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHFocusModeManager _focusModesRequiringIntroduction](self, "_focusModesRequiringIntroduction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v5))
    {
      -[SBHFocusModeManager focusModeFeatureIntroductionItem](self, "focusModeFeatureIntroductionItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[SBHFocusModeManager dismissAllFocusModePopovers](self, "dismissAllFocusModePopovers");
      SBLogFocusModes();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Creating feature introduction item for Focus", (uint8_t *)&v15, 0xCu);

      }
      -[SBHFocusModeManager iconManager](self, "iconManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBHFocusModeFeatureIntroductionItem initWithIconManager:]([SBHFocusModeFeatureIntroductionItem alloc], "initWithIconManager:", v11);

      -[SBHFocusModeManager setFocusModeFeatureIntroductionItem:](self, "setFocusModeFeatureIntroductionItem:", v12);
      objc_msgSend(v11, "displayFeatureIntroductionItemIfUnlocked:", v12);

    }
    else
    {
      SBLogFocusModes();
      v12 = (SBHFocusModeFeatureIntroductionItem *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1CFEF3000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "[%@] Focus does not require feature introduction", (uint8_t *)&v15, 0xCu);

      }
    }

  }
  else
  {
    -[SBHFocusModeManager dismissAllFocusModePopovers](self, "dismissAllFocusModePopovers");
  }

}

- (void)_notifyObserversOfActiveFocusModeChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  -[SBHFocusModeManager observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "focusModeManagerDidUpdateActiveFocusMode:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_focusModesRequiringIntroduction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBHFocusModeManager iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusModesRequiringIntroduction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFocusModesRequiringIntroduction:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateDockWithActiveFocusMode:(id)a3 rootFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  SBIconListModel *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  SBIconListModel *v17;
  SBIconListModel *cachedDock;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "dockList"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    SBLogFocusModes();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v11;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "[%@] Configuring the dock for the active focus mode", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v6, "dockList");
    v12 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
    if (self->_cachedDock)
      goto LABEL_14;
    SBLogFocusModes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v15;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "[%@] Caching original dock configuration", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v7, "dock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (SBIconListModel *)objc_msgSend(v16, "copy");
    cachedDock = self->_cachedDock;
    self->_cachedDock = v17;

  }
  else
  {
    if (!self->_cachedDock)
      goto LABEL_16;
    SBLogFocusModes();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v21;
      _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_INFO, "[%@] Restoring original dock configuration", (uint8_t *)&v24, 0xCu);

    }
    v12 = self->_cachedDock;
    v16 = self->_cachedDock;
    self->_cachedDock = 0;
  }

LABEL_14:
  if (v12)
  {
    objc_msgSend(v7, "dock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v22, "setIconsFromIconListModel:", v12);

  }
LABEL_16:

}

- (void)folder:(id)a3 didAddList:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[SBHFocusModeManager activeFocusMode](self, "activeFocusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "customizedHomeScreenPagesEnabled"))
    objc_msgSend(v6, "addToList:", v7);

}

- (void)_iconEditingDidChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEditing"))
    -[SBHFocusModeManager dismissAllFocusModePopovers](self, "dismissAllFocusModePopovers");

}

- (void)_iconModelDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFolderObserver:", self);

}

- (SBHFocusModeFeatureIntroductionItem)focusModeFeatureIntroductionItem
{
  return self->_focusModeFeatureIntroductionItem;
}

- (void)setFocusModeFeatureIntroductionItem:(id)a3
{
  objc_storeStrong((id *)&self->_focusModeFeatureIntroductionItem, a3);
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (NSMutableDictionary)focusModesBySourceNumber
{
  return self->_focusModesBySourceNumber;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SBIconListModel)cachedDock
{
  return self->_cachedDock;
}

- (void)setCachedDock:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_focusModesBySourceNumber, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_focusModeFeatureIntroductionItem, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
}

@end
