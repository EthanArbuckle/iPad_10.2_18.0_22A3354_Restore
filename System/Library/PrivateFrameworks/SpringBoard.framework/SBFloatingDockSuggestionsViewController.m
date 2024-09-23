@implementation SBFloatingDockSuggestionsViewController

- (SBFloatingDockSuggestionsViewController)initWithNumberOfRecents:(unint64_t)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 layoutStateTransitionCoordinator:(id)a6 suggestionsModel:(id)a7 iconViewProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SBFloatingDockSuggestionsViewController *v19;
  SBFloatingDockSuggestionsViewController *v20;
  uint64_t v21;
  SBIconListModel *suggestionsIconListModel;
  uint64_t v23;
  NSMutableArray *deferredIconUpdates;
  void *v25;
  void *v26;
  objc_super v28;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)SBFloatingDockSuggestionsViewController;
  v19 = -[SBFloatingDockSuggestionsViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v20 = v19;
  if (v19)
  {
    v19->_numberOfRecents = a3;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA5F0]), "initWithFolder:maxIconCount:", 0, a3);
    suggestionsIconListModel = v20->_suggestionsIconListModel;
    v20->_suggestionsIconListModel = (SBIconListModel *)v21;

    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v14);
    objc_storeStrong((id *)&v20->_applicationController, a5);
    objc_storeWeak((id *)&v20->_suggestionsModel, v17);
    objc_msgSend(v17, "setDelegate:", v20);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    deferredIconUpdates = v20->_deferredIconUpdates;
    v20->_deferredIconUpdates = (NSMutableArray *)v23;

    objc_msgSend(v16, "addObserver:", v20);
    objc_storeWeak((id *)&v20->_layoutStateTransitionCoordinator, v16);
    v20->_effectiveEnvironmentMode = 0;
    objc_storeWeak((id *)&v20->_iconViewProvider, v18);
    objc_msgSend(v14, "iconManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v20, sel__iconModelDidChange_, *MEMORY[0x1E0DAA7E0], v25);
    objc_msgSend(v26, "addObserver:selector:name:object:", v20, sel__listLayoutDidChange_, *MEMORY[0x1E0DAA7E8], v25);

  }
  return v20;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockSuggestionsViewController;
  -[SBFloatingDockSuggestionsViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  SBDockSuggestionsIconListView *v4;
  SBIconListModel *suggestionsIconListModel;
  void *v6;
  SBDockSuggestionsIconListView *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;

  -[SBFloatingDockSuggestionsViewController homeScreenContextProvider](self, "homeScreenContextProvider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SBDockSuggestionsIconListView alloc];
  suggestionsIconListModel = self->_suggestionsIconListModel;
  objc_msgSend(v3, "listLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDockIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](v4, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", suggestionsIconListModel, v6, CFSTR("SBIconLocationFloatingDockSuggestions"), 1, self);

  -[SBIconListView setIconViewConfigurationOptions:](v7, "setIconViewConfigurationOptions:", 2);
  objc_msgSend(v3, "iconImageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setIconImageCache:](v7, "setIconImageCache:", v8);

  objc_msgSend(v3, "folderIconImageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setFolderIconImageCache:](v7, "setFolderIconImageCache:", v9);

  -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v7, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
  -[SBFloatingDockSuggestionsViewController setView:](self, "setView:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "currentDisplayItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController _loadAndPlaceIconsInViewForDisplayItems:](self, "_loadAndPlaceIconsInViewForDisplayItems:", v11);

}

- (void)dockViewWillBecomeVisible
{
  id v2;

  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateIconViewsUsingBlock:", &__block_literal_global_112);

}

uint64_t __68__SBFloatingDockSuggestionsViewController_dockViewWillBecomeVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:forReason:", 0, 4);
}

- (void)dockViewWillResignVisible
{
  id v2;

  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateIconViewsUsingBlock:", &__block_literal_global_19);

}

uint64_t __68__SBFloatingDockSuggestionsViewController_dockViewWillResignVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:forReason:", 1, 4);
}

- (void)dockViewDidResignVisible
{
  id WeakRetained;

  -[SBFloatingDockSuggestionsViewController setVisible:](self, "setVisible:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "dockViewDidResignVisible");

  -[SBFloatingDockSuggestionsViewController _performDeferredIconUpdates](self, "_performDeferredIconUpdates");
}

- (void)dockViewDidBecomeVisible
{
  id WeakRetained;

  -[SBFloatingDockSuggestionsViewController setVisible:](self, "setVisible:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "dockViewDidBecomeVisible");

}

- (void)dockFolderWillBeginTransitioning
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "beginPendingUpdatesForReason:", CFSTR("Dock"));

}

- (void)dockFolderDidEndTransitioning
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "endPendingUpdatesForReason:", CFSTR("Dock"));

}

- (void)_performDeferredIconUpdates
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_deferredIconUpdates;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_deferredIconUpdates, "removeAllObjects", (_QWORD)v8);
}

- (void)_didChangeNumberOfIcons
{
  void *v3;
  id v4;

  -[SBFloatingDockSuggestionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:", self);

  -[SBFloatingDockSuggestionsViewController floatingDockViewController](self, "floatingDockViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:", self);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id WeakRetained;
  id v6;

  objc_msgSend(a4, "toLayoutState", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_effectiveEnvironmentMode = objc_msgSend(v6, "unlockedEnvironmentMode");
  if (-[SBFloatingDockSuggestionsViewController _onHomescreen](self, "_onHomescreen"))
    -[SBFloatingDockSuggestionsViewController _performDeferredIconUpdates](self, "_performDeferredIconUpdates");
  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "beginPendingUpdatesForReason:", CFSTR("Transitioning"));

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id WeakRetained;

  if ((objc_msgSend(a4, "isInterrupted", a3) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
    objc_msgSend(WeakRetained, "endPendingUpdatesForReason:", CFSTR("Transitioning"));

  }
}

- (void)_emitPresentedEventInvolvingContinuity:(BOOL)a3 fromModel:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a4, "currentAppSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DAA5C0], "itemForContinuityInfo:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = 2;
      else
        v8 = 1;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  v15[0] = *MEMORY[0x1E0DABD58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = *MEMORY[0x1E0DABD50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DA9D78];
  v13 = v11;
  objc_msgSend(v12, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitEvent:withPayload:", 17, v13);

}

- (void)_performOrDefer:(BOOL)a3 iconUpdate:(id)a4
{
  NSMutableArray *deferredIconUpdates;
  id v5;

  if (a3)
  {
    deferredIconUpdates = self->_deferredIconUpdates;
    v5 = (id)objc_msgSend(a4, "copy");
    -[NSMutableArray addObject:](deferredIconUpdates, "addObject:", v5);

  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)dockSuggestionsModel:(id)a3 didInsertItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL8 v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2048;
    v26 = a5;
    _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did insert item: %@ at index: %lu", buf, 0x20u);
  }

  v13 = -[SBFloatingDockSuggestionsViewController _shouldDeferUpdateInvolvingContinuity:](self, "_shouldDeferUpdateInvolvingContinuity:", v6);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didInsertItem_atIndex_involvesContinuity___block_invoke;
  v16[3] = &unk_1E8EA0CC0;
  v20 = v6;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = a5;
  v14 = v11;
  v15 = v10;
  -[SBFloatingDockSuggestionsViewController _performOrDefer:iconUpdate:](self, "_performOrDefer:iconUpdate:", v13, v16);

}

void __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didInsertItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_emitPresentedEventInvolvingContinuity:fromModel:atIndex:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "listView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iconForDisplayItem:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v10, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIcon:", v2);
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= objc_msgSend(v3, "numberOfIcons"))
      objc_msgSend(v3, "addIcon:", v2);
    else
      v5 = (id)objc_msgSend(v3, "insertIcon:atIndex:", v2, v4);
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "iconViewForIcon:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "appSuggestion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContinuityInfo:", v9);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "isVisible"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fadeInIcon:isReplacing:completion:", v2, 0, 0);
    }
    else
    {
      objc_msgSend(v10, "layoutIconsNow");
      objc_msgSend(*(id *)(a1 + 32), "_didChangeNumberOfIcons");
    }

  }
}

- (void)dockSuggestionsModel:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    v31 = 2048;
    v32 = a5;
    _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did remove old item: %@ at index: %lu", buf, 0x20u);
  }

  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_deferredIconUpdates, "count"))
    -[SBFloatingDockSuggestionsViewController _performDeferredIconUpdates](self, "_performDeferredIconUpdates");
  objc_msgSend(v13, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "numberOfIcons") <= a5)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v14, "iconAtIndex:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v14, "removeIcon:", v15);
      if (-[SBFloatingDockSuggestionsViewController isVisible](self, "isVisible"))
      {
        objc_msgSend(v13, "displayedIconViewForIcon:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayedIconViewForIcon:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "continuityInfo");
        v22 = v10;
        v18 = v6;
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didRemoveItem_atIndex_involvesContinuity___block_invoke;
        v23[3] = &unk_1E8EA8528;
        v26 = v18;
        v10 = v22;
        v24 = v16;
        v25 = v19;
        v20 = v19;
        v21 = v16;
        -[SBFloatingDockSuggestionsViewController _fadeOutIcon:atIndex:isReplacing:completion:](self, "_fadeOutIcon:atIndex:isReplacing:completion:", v15, a5, 0, v23);

LABEL_12:
        goto LABEL_13;
      }
      objc_msgSend(v13, "layoutIconsNow");
      -[SBFloatingDockSuggestionsViewController _didChangeNumberOfIcons](self, "_didChangeNumberOfIcons");
      if (v6)
      {
        objc_msgSend(v13, "displayedIconViewForIcon:", v15);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setContinuityInfo:", 0);
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

void __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didRemoveItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "continuityInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);

    if (v2 == v3)
      objc_msgSend(*(id *)(a1 + 32), "setContinuityInfo:", 0);
  }
}

- (void)dockSuggestionsModel:(id)a3 didReplaceItem:(id)a4 atIndex:(unint64_t)a5 withItem:(id)a6 atIndex:(unint64_t)a7 involvesContinuity:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL8 v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v8 = a8;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  SBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v35 = 2048;
    v36 = a7;
    _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did replace old item: %@ with new item: %@ at index: %lu", buf, 0x2Au);
  }

  v18 = -[SBFloatingDockSuggestionsViewController _shouldDeferUpdateInvolvingContinuity:](self, "_shouldDeferUpdateInvolvingContinuity:", v8);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke;
  v22[3] = &unk_1E8EAAA20;
  v28 = v8;
  v22[4] = self;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v26 = a7;
  v27 = a5;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  -[SBFloatingDockSuggestionsViewController _performOrDefer:iconUpdate:](self, "_performOrDefer:iconUpdate:", v18, v22);

}

void __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;

  objc_msgSend(*(id *)(a1 + 32), "_emitPresentedEventInvolvingContinuity:fromModel:atIndex:", *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "listView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iconForDisplayItem:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iconForDisplayItem:", *(_QWORD *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v2)
  {
    v5 = 0;
    if (v3)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v21, "displayedIconViewForIcon:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v21, "displayedIconViewForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_12;
LABEL_6:
  objc_msgSend(v5, "setContinuityInfo:", 0);
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "appSuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContinuityInfo:", v9);

  }
  if (objc_msgSend(v2, "isEqual:", v4) && *(_QWORD *)(a1 + 72) == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v6, "setAllowsCloseBox:", 0);
  }
  else
  {
LABEL_12:
    objc_msgSend(v21, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4 && objc_msgSend(v10, "directlyContainsIcon:", v4))
    {
      objc_msgSend(v11, "removeIcon:", v4);
      if (objc_msgSend(*(id *)(a1 + 32), "isVisible"))
        objc_msgSend(*(id *)(a1 + 32), "_fadeOutIcon:atIndex:isReplacing:completion:", v4, *(_QWORD *)(a1 + 72), 1, 0);
      v12 = *(_QWORD *)(a1 + 64);
      if (v12 <= objc_msgSend(v11, "numberOfIcons"))
        v18 = (id)objc_msgSend(v11, "insertIcon:atIndex:", v4, *(_QWORD *)(a1 + 64));
      else
        objc_msgSend(v11, "addIcon:", v4);
      if (objc_msgSend(*(id *)(a1 + 32), "isVisible"))
        objc_msgSend(*(id *)(a1 + 32), "_fadeInIcon:isReplacing:completion:", v4, 1, 0);
      objc_msgSend(*(id *)(a1 + 40), "currentDisplayItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke_2;
      v22[3] = &unk_1E8EAA9F8;
      v20 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 64);
      v22[4] = v20;
      v23 = v11;
      v24 = v21;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v22);

    }
    else
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "isVisible");
      if (v2)
      {
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "_fadeOutIcon:atIndex:isReplacing:completion:", v2, *(_QWORD *)(a1 + 72), 1, 0);
          v14 = *(_QWORD *)(a1 + 64);
          if (v14 != *(_QWORD *)(a1 + 72) && v14 < objc_msgSend(v11, "numberOfIcons"))
          {
            objc_msgSend(v11, "iconAtIndex:", *(_QWORD *)(a1 + 64));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_fadeOutIcon:atIndex:isReplacing:completion:", v15, *(_QWORD *)(a1 + 64), 1, 0);

          }
        }
      }
      if (v4)
      {
        v16 = *(_QWORD *)(a1 + 64);
        if (v16 >= objc_msgSend(v11, "numberOfIcons"))
          objc_msgSend(v11, "addIcon:", v4);
        else
          v17 = (id)objc_msgSend(v11, "replaceIconAtIndex:withIcon:options:", v16, v4, 0);
        objc_msgSend(v21, "layoutAndCreateIcon:atIndex:", v4, v16);
        if (objc_msgSend(*(id *)(a1 + 32), "isVisible"))
          objc_msgSend(*(id *)(a1 + 32), "_fadeInIcon:isReplacing:completion:", v4, 1, 0);
      }
    }
    objc_msgSend(v21, "layoutIconsNow");
    objc_msgSend(*(id *)(a1 + 32), "_didChangeNumberOfIcons");

  }
}

void __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;

  if (*(_QWORD *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v4 = a3;
    objc_msgSend(*(id *)(a1 + 32), "_iconForDisplayItem:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = v6;
      v7 = objc_msgSend(*(id *)(a1 + 40), "indexForIcon:");
      v6 = v12;
      if (v7 != v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeIcon:", v12);
        v8 = objc_msgSend(*(id *)(a1 + 40), "numberOfIcons");
        v9 = *(void **)(a1 + 40);
        if (v8 <= v4)
        {
          objc_msgSend(v9, "addIcon:", v12);
          v4 = objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", v12);
        }
        else
        {
          v10 = (id)objc_msgSend(v9, "replaceIconAtIndex:withIcon:options:", v4, v12, 0);
        }
        objc_msgSend(*(id *)(a1 + 48), "layoutAndCreateIcon:atIndex:", v12, v4);
        v11 = objc_msgSend(*(id *)(a1 + 32), "isVisible");
        v6 = v12;
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "_fadeInIcon:isReplacing:completion:", v12, 1, 0);
          v6 = v12;
        }
      }
    }

  }
}

- (void)dockSuggestionsModel:(id)a3 didReloadItems:(id)a4 withItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did reload old items: %@ with new items: %@", buf, 0x20u);
  }

  if ((objc_msgSend(v9, "isEqualToOrderedSet:", v10) & 1) == 0)
  {
    v27 = v9;
    -[SBFloatingDockSuggestionsViewController _performDeferredIconUpdates](self, "_performDeferredIconUpdates");
    -[SBFloatingDockSuggestionsViewController listView](self, "listView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllIconViews");
    v29 = v12;
    objc_msgSend(v12, "model");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeAllIcons");
    v28 = v8;
    objc_msgSend(v8, "currentAppSuggestion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[SBFloatingDockSuggestionsViewController _iconForDisplayItem:](self, "_iconForDisplayItem:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v30, "addIcon:", v20);
            objc_msgSend(v13, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqual:", v22);

            if (v23)
            {
              objc_msgSend(v29, "iconViewForIcon:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setContinuityInfo:", v13);

            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(v29, "layoutIconsNow");
    v9 = v27;
    v25 = objc_msgSend(v27, "count");
    if (v25 != objc_msgSend(v14, "count"))
      -[SBFloatingDockSuggestionsViewController _didChangeNumberOfIcons](self, "_didChangeNumberOfIcons");

    v8 = v28;
    v10 = v26;
  }

}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions"))
    && -[SBIconListModel directlyContainsIcon:](self->_suggestionsIconListModel, "directlyContainsIcon:", v6))
  {
    -[SBFloatingDockSuggestionsViewController listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayedIconViewForIcon:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[SBFloatingDockSuggestionsViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBFloatingDockSuggestionsViewController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return -[SBFloatingDockSuggestionsViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", a3, CFSTR("SBIconLocationFloatingDockSuggestions"));
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockSuggestionsViewController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
  {
    -[SBFloatingDockSuggestionsViewController listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "directlyContainsIcon:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[SBFloatingDockSuggestionsViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayingIconView:", v4);

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
  {
    -[SBFloatingDockSuggestionsViewController listView](self, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDisplayingIconView:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SBFloatingDockSuggestionsViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8EAAA48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v7);

}

uint64_t __81__SBFloatingDockSuggestionsViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  v6 = a3;
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedIconViewForIcon:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9[2](v9, v8);

}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions"));
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBIconLocationFloatingDockSuggestions"));
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockSuggestionsViewController iconViewProvider](self, "iconViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableIconViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFloatingDockSuggestionsViewController iconViewProvider](self, "iconViewProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleIconView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockSuggestionsViewController iconViewProvider](self, "iconViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIconViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SBFloatingDockSuggestionsViewController iconViewProvider](self, "iconViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureIconView:forIcon:", v12, v6);

  objc_msgSend(v12, "setIconContentScalingEnabled:", 1);
  objc_msgSend(v12, "setStartsDragMoreQuickly:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  objc_msgSend(WeakRetained, "currentAppSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v10, "isEqualToString:", v11);
  if ((_DWORD)v6)
    objc_msgSend(v12, "setContinuityInfo:", v9);

}

- (id)_iconForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController homeScreenContextProvider](self, "homeScreenContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 5)
  {
    objc_msgSend(v4, "webClipIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bookmarkIconForWebClipIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "applicationIconForBundleIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_loadAndPlaceIconsInViewForDisplayItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFloatingDockSuggestionsViewController _loadAndPlaceIconsInViewForDisplayItems:].cold.1((uint64_t)v4, v5);

  -[SBFloatingDockSuggestionsViewController suggestionsModel](self, "suggestionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAppSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllIcons");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__SBFloatingDockSuggestionsViewController__loadAndPlaceIconsInViewForDisplayItems___block_invoke;
  v13[3] = &unk_1E8EAAA70;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);

}

void __83__SBFloatingDockSuggestionsViewController__loadAndPlaceIconsInViewForDisplayItems___block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a1[4], "_iconForDisplayItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)objc_msgSend(a1[5], "insertIcon:atIndex:options:", v5, a3, 0);
    objc_msgSend(a1[6], "layoutAndCreateIcon:atIndex:", v5, a3);
    objc_msgSend(a1[7], "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      objc_msgSend(a1[6], "iconViewForIcon:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContinuityInfo:", a1[7]);

    }
  }

}

- (BOOL)_shouldDeferUpdateInvolvingContinuity:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a3;
  v5 = -[SBFloatingDockSuggestionsViewController isVisible](self, "isVisible");
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isChamoisWindowingUIEnabled") & 1) != 0)
    LOBYTE(v8) = 0;
  else
    v8 = v5 & ~(v3 | -[SBFloatingDockSuggestionsViewController _onHomescreen](self, "_onHomescreen"));

  return v8;
}

- (BOOL)_onHomescreen
{
  return self->_effectiveEnvironmentMode == 1;
}

- (void)_iconModelDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBFloatingDockSuggestionsViewController homeScreenContextProvider](self, "homeScreenContextProvider", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconImageCache:", v6);

  objc_msgSend(v4, "folderIconImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFolderIconImageCache:", v7);

}

- (void)_listLayoutDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SBFloatingDockSuggestionsViewController homeScreenContextProvider](self, "homeScreenContextProvider", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutProvider:", v6);

  objc_msgSend(v4, "iconImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconImageCache:", v7);

  objc_msgSend(v4, "folderIconImageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFolderIconImageCache:", v8);

  objc_msgSend(v5, "layoutIconsNow");
}

- (void)_fadeOutIcon:(id)a3 atIndex:(unint64_t)a4 isReplacing:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  int v26;
  double v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  SBFloatingDockSuggestionsViewController *v41;
  id v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;

  v10 = a6;
  v11 = a3;
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "icons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconViewForIcon:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIconImageAndAccessoryAlpha:", 0.0);
  objc_msgSend(v14, "matchingIconViewByAddingConfigurationOptions:removingConfigurationOptions:", 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(v12, "addSubview:", v15);
  objc_msgSend(v15, "setIconImageAndAccessoryAlpha:", 1.0);
  objc_msgSend(v14, "iconContentScale");
  v25 = v24;
  v26 = objc_msgSend(v14, "isShowingContextMenu");
  v27 = 1.15;
  if (!v26)
    v27 = 1.0;
  objc_msgSend(v15, "setIconContentScale:", v25 * v27);
  objc_msgSend(v15, "layoutIfNeeded");
  v28 = (void *)MEMORY[0x1E0CEABB0];
  v29 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke;
  v39[3] = &unk_1E8EA4DD8;
  v49 = a5;
  v40 = v15;
  v41 = self;
  v43 = v12;
  v44 = a4;
  v42 = v13;
  v45 = v17;
  v46 = v19;
  v47 = v21;
  v48 = v23;
  v35[0] = v29;
  v35[1] = 3221225472;
  v35[2] = __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke_2;
  v35[3] = &unk_1E8EA47F0;
  v36 = v40;
  v37 = v14;
  v38 = v10;
  v30 = v10;
  v31 = v14;
  v32 = v40;
  v33 = v12;
  v34 = v13;
  objc_msgSend(v28, "animateWithDuration:animations:completion:", v39, v35, 0.5);

}

uint64_t __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double MaxX;
  CGRect v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "setIconContentScale:", 0.01);
  if (!*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 40), "_didChangeNumberOfIcons");
    v2 = *(_QWORD *)(a1 + 64);
    if (v2 >= objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      objc_msgSend(*(id *)(a1 + 56), "bounds");
      MaxX = CGRectGetMaxX(v16);
    }
    else
    {
      v4 = *(void **)(a1 + 56);
      v3 = *(_QWORD *)(a1 + 64);
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v3 - 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "iconViewForIcon:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        v8 = v7;

        v9 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", *(_QWORD *)(a1 + 64));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "iconViewForIcon:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        v13 = v12;

        MaxX = v8 + (v13 - v8) * 0.5;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "bounds");
        MaxX = CGRectGetMinX(v17);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", MaxX + *(double *)(a1 + 88) * -0.5, *(double *)(a1 + 80));
  }
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageAndAccessoryAlpha:", 0.0);
}

uint64_t __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setIconImageAndAccessoryAlpha:", 1.0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_fadeInIcon:(id)a3 isReplacing:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double MaxX;
  double v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  CGRect v37;
  CGRect v38;

  v8 = a5;
  v9 = a3;
  -[SBFloatingDockSuggestionsViewController listView](self, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v9);
  objc_msgSend(v10, "layoutAndCreateIcon:atIndex:", v9, v12);
  objc_msgSend(v10, "iconViewForIcon:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "count") || v12 >= objc_msgSend(v11, "count") - 1)
  {
    objc_msgSend(v10, "bounds");
    MaxX = CGRectGetMaxX(v37);
LABEL_6:
    v22 = MaxX;
    goto LABEL_7;
  }
  if (!v12)
  {
    objc_msgSend(v10, "bounds");
    MaxX = CGRectGetMinX(v38);
    goto LABEL_6;
  }
  objc_msgSend(v11, "objectAtIndex:", v12 - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v12 + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconViewForIcon:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;

  objc_msgSend(v10, "iconViewForIcon:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;

  v22 = v18 + (v21 - v18) * 0.5;
LABEL_7:
  objc_msgSend(v13, "frame");
  objc_msgSend(v13, "setFrame:", v22 - v24 * 0.5);
  objc_msgSend(v13, "setIconImageAndAccessoryAlpha:", 0.0);
  objc_msgSend(v13, "setIconContentScale:", 0.01);
  v25 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke;
  v34[3] = &unk_1E8EAAA98;
  v36 = v8;
  v26 = v13;
  v35 = v26;
  v27 = v8;
  v28 = (void *)MEMORY[0x1D17E5550](v34);
  objc_msgSend(v26, "setDisallowCursorInteraction:", 1);
  v29 = (void *)MEMORY[0x1E0CEABB0];
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke_2;
  v31[3] = &unk_1E8E9EE00;
  v33 = a4;
  v31[4] = self;
  v32 = v26;
  v30 = v26;
  objc_msgSend(v29, "animateWithDuration:animations:completion:", v31, v28, 0.5);

}

uint64_t __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setDisallowCursorInteraction:", 0);
}

uint64_t __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_didChangeNumberOfIcons");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconContentScale");
  objc_msgSend(v2, "setIconContentScale:");

  return objc_msgSend(*(id *)(a1 + 40), "setIconImageAndAccessoryAlpha:", 1.0);
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return (SBFloatingDockViewController *)objc_loadWeakRetained((id *)&self->_floatingDockViewController);
}

- (void)setFloatingDockViewController:(id)a3
{
  objc_storeWeak((id *)&self->_floatingDockViewController, a3);
}

- (SBFloatingDockSuggestionsViewControllerDelegate)delegate
{
  return (SBFloatingDockSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfRecents
{
  return self->_numberOfRecents;
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  return (SBFloatingDockHomeScreenContextProviding *)objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
}

- (SBApplicationController)applicationController
{
  return self->_applicationController;
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBIconListModel)suggestionsIconListModel
{
  return self->_suggestionsIconListModel;
}

- (SBFloatingDockSuggestionsModel)suggestionsModel
{
  return (SBFloatingDockSuggestionsModel *)objc_loadWeakRetained((id *)&self->_suggestionsModel);
}

- (NSMutableArray)deferredIconUpdates
{
  return self->_deferredIconUpdates;
}

- (void)setDeferredIconUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_deferredIconUpdates, a3);
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return (SBLayoutStateTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (int64_t)effectiveEnvironmentMode
{
  return self->_effectiveEnvironmentMode;
}

- (void)setEffectiveEnvironmentMode:(int64_t)a3
{
  self->_effectiveEnvironmentMode = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_storeStrong((id *)&self->_deferredIconUpdates, 0);
  objc_destroyWeak((id *)&self->_suggestionsModel);
  objc_storeStrong((id *)&self->_suggestionsIconListModel, 0);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_floatingDockViewController);
}

- (void)_loadAndPlaceIconsInViewForDisplayItems:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "floating dock suggestions view load display items: %@", (uint8_t *)&v2, 0xCu);
}

@end
