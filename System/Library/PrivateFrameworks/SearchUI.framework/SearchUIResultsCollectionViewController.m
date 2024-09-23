@implementation SearchUIResultsCollectionViewController

- (double)headerHeight
{
  return 0.0;
}

- (double)cachedHeaderHeight
{
  return self->_cachedHeaderHeight;
}

- (BOOL)sectionShouldBeExpanded:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "sectionShouldBeExpanded:", v4);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (SearchUIResultsCollectionViewController)init
{
  SearchUIResultsCollectionViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SearchUIResultsCollectionViewController;
  v2 = -[SearchUICollectionViewController init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SearchUIResultsCollectionViewController setExpandedSections:](v2, "setExpandedSections:", v3);

    v4 = (void *)objc_opt_new();
    -[SearchUIResultsCollectionViewController setSectionsThatHaveBeenExpanded:](v2, "setSectionsThatHaveBeenExpanded:", v4);

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0DBDA60];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __47__SearchUIResultsCollectionViewController_init__block_invoke;
    v13 = &unk_1EA1F7C08;
    objc_copyWeak(&v14, &location);
    v7 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, &v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_expandCellsIfNeeded, *MEMORY[0x1E0DC5668], 0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setSectionsThatHaveBeenExpanded:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsThatHaveBeenExpanded, a3);
}

- (void)setExpandedSections:(id)a3
{
  objc_storeStrong((id *)&self->_expandedSections, a3);
}

- (void)setCachedHeaderHeight:(double)a3
{
  self->_cachedHeaderHeight = a3;
}

- (void)didPresentToResumeSearch:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SearchUICollectionViewController setIsVisibleFeedbackEnabled:](self, "setIsVisibleFeedbackEnabled:", 1);
  if (v3)
    -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 12);
}

- (id)commandEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIResultsCollectionViewController;
  -[SearchUICollectionViewController commandEnvironment](&v7, sel_commandEnvironment);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController queryString](self, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchString:", v4);

  -[SearchUICollectionViewController tableModel](self, "tableModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueryId:", objc_msgSend(v5, "queryId"));

  return v3;
}

- (void)highlightResult:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v18 = (id)v5;
  if (a3 && v5)
  {
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[SearchUIResultsCollectionViewController setFocusableIndexPath:](self, "setFocusableIndexPath:", 0);
    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "setupManualFocus") & 1) != 0)
    {
      v10 = v18;
    }
    else
    {
      -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SearchUICollectionViewController collectionView:shouldHighlightItemAtIndexPath:](self, "collectionView:shouldHighlightItemAtIndexPath:", v13, v18);

      if (v14)
        v15 = v18;
      else
        v15 = 0;
      v16 = v15;

      -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

      v10 = v16;
    }
    v18 = v10;
    -[SearchUIResultsCollectionViewController setFocusableIndexPath:](self, "setFocusableIndexPath:", v10);
  }
  else
  {
    -[SearchUIResultsCollectionViewController setFocusableIndexPath:](self, "setFocusableIndexPath:", 0);
    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeManualFocus");
    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", 0, 0, 0);

  }
}

- (void)setFocusableIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifierForIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifyingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateKeyboardFocusToResult:cardSection:", v10, v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)SearchUIResultsCollectionViewController;
  -[SearchUICollectionViewController setFocusableIndexPath:](&v12, sel_setFocusableIndexPath_, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 12);
  v5.receiver = self;
  v5.super_class = (Class)SearchUIResultsCollectionViewController;
  -[SearchUICollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4 animated:(BOOL)a5
{
  id v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(void);
  _BOOL4 v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v30 = a5;
  v31 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SearchUICollectionViewController viewWillUpdateHandler](self, "viewWillUpdateHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SearchUICollectionViewController viewWillUpdateHandler](self, "viewWillUpdateHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[SearchUIResultsCollectionViewController sectionsThatHaveBeenExpanded](self, "sectionsThatHaveBeenExpanded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend((id)objc_opt_class(), "hiddenSectionsFromSections:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsCollectionViewController setHiddenSections:](self, "setHiddenSections:", v12);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "sectionShouldBeExpanded:", v18);

          if (!v21)
            continue;
          -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v18);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(v13, "mutableCopy");
  -[SearchUIResultsCollectionViewController hiddenSections](self, "hiddenSections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsInArray:", v23);

  v24 = v22;
  -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITableModel tableModelWithSections:expandedSections:expandedCollectionCardSections:](SearchUITableModel, "tableModelWithSections:expandedSections:expandedCollectionCardSections:", v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController setTableModel:animated:](self, "setTableModel:animated:", v27, v30);
  if (v31)
    -[SearchUIResultsCollectionViewController scrollTableToTop](self, "scrollTableToTop");
  -[SearchUICollectionViewController viewDidUpdateHandler](self, "viewDidUpdateHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SearchUICollectionViewController viewDidUpdateHandler](self, "viewDidUpdateHandler");
    v29 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v29[2]();

  }
}

- (NSMutableSet)expandedSections
{
  return self->_expandedSections;
}

- (void)setHiddenSections:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenSections, a3);
}

- (NSMutableSet)sectionsThatHaveBeenExpanded
{
  return self->_sectionsThatHaveBeenExpanded;
}

- (void)scrollTableToTop
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = -v4;

  -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;

  if (v8 != v5)
  {
    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentOffset:animated:", 0, 0.0, v5);

  }
}

- (NSArray)hiddenSections
{
  return self->_hiddenSections;
}

- (BOOL)updateMustAccountForLayout
{
  return 1;
}

+ (id)hiddenSectionsFromSections:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isInitiallyHidden", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SearchUIResultsCollectionViewController;
  v6 = a4;
  -[SearchUICollectionViewController cellForRowModel:atIndexPath:](&v15, sel_cellForRowModel_atIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController dataSource](self, "dataSource", v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "sectionIdentifierForIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isExpandable"))
  {
    -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resultSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateExpanded:animated:", objc_msgSend(v11, "containsObject:", v13), 0);

  }
  return v7;
}

void __47__SearchUIResultsCollectionViewController_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedHeaderHeight:", 0.0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "purgeAndResetTable");

}

- (id)restorationContext
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIResultsCollectionViewController;
  -[SearchUICollectionViewController restorationContext](&v7, sel_restorationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController tableModel](self, "tableModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSections:", v5);

  return v3;
}

- (void)updateWithResultSections:(id)a3 scrollToTop:(BOOL)a4
{
  -[SearchUIResultsCollectionViewController updateWithResultSections:scrollToTop:animated:](self, "updateWithResultSections:scrollToTop:animated:", a3, a4, 0);
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v17;
  objc_super v18;
  objc_super v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SearchUICollectionViewController focusableIndexPath](self, "focusableIndexPath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUICollectionViewController focusableIndexPath](self, "focusableIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v18.receiver = self;
      v18.super_class = (Class)SearchUIResultsCollectionViewController;
      -[SearchUIResultsCollectionViewController preferredFocusEnvironments](&v18, sel_preferredFocusEnvironments);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController focusableIndexPath](self, "focusableIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "viewForForcedFocus");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v10;
    v14 = v13;

    if (v14)
    {
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)SearchUIResultsCollectionViewController;
      -[SearchUIResultsCollectionViewController preferredFocusEnvironments](&v19, sel_preferredFocusEnvironments);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;

  }
  return v17;
}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (void)returnKeyPressed
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "needsInternalFocus"))
    objc_msgSend(v4, "returnKeyPressed");
  else
    -[SearchUICollectionViewController tapAtIndexPath:](self, "tapAtIndexPath:", v5);

}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[SearchUIResultsCollectionViewController indexPathIsShowMoreSections:](self, "indexPathIsShowMoreSections:", v4))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIResultsCollectionViewController;
    v5 = -[SearchUICollectionViewController canHighlightRowAtIndexPath:](&v7, sel_canHighlightRowAtIndexPath_, v4);
  }

  return v5;
}

- (BOOL)indexPathIsShowMoreSections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");

  objc_msgSend(v5, "sectionIdentifierForIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.other:show_more"));

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  SearchUICommandHandler *v8;
  void *v9;
  void *v10;
  void *v11;
  SearchUICommandHandler *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (-[SearchUIResultsCollectionViewController indexPathIsShowMoreSections:](self, "indexPathIsShowMoreSections:", v7))
  {
    v8 = [SearchUICommandHandler alloc];
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIResultsCollectionViewController commandEnvironment](self, "commandEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SearchUICommandHandler initWithCommand:rowModel:button:environment:](v8, "initWithCommand:rowModel:button:environment:", 0, v10, 0, v11);

    -[SearchUIResultsCollectionViewController showMoreSectionsWithShowMoreButtonIndexPath:](self, "showMoreSectionsWithShowMoreButtonIndexPath:", v7);
    -[SearchUICommandHandler wasPerformedWithTriggerEvent:](v12, "wasPerformedWithTriggerEvent:", 2);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUIResultsCollectionViewController;
    -[SearchUICollectionViewController collectionView:didSelectItemAtIndexPath:](&v13, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  }

}

- (void)purgeAndResetTable
{
  void *v3;
  id v4;

  -[SearchUICollectionViewController tableModel](self, "tableModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController setTableModel:](self, "setTableModel:", 0);
  -[SearchUIResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_purgeReuseQueues");

  -[SearchUICollectionViewController setTableModel:](self, "setTableModel:", v4);
}

- (void)willDismiss
{
  -[SearchUICollectionViewController setIsVisibleFeedbackEnabled:](self, "setIsVisibleFeedbackEnabled:", 0);
}

- (void)toggleExpansionForSectionModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  objc_super v29;

  v4 = a3;
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultSection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "initiallyVisibleCardSectionCount");

    if (!v11)
    {
      objc_msgSend(v4, "section");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "resultSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[SearchUIResultsCollectionViewController sectionShouldBeExpanded:](self, "sectionShouldBeExpanded:", v13);
      -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        objc_msgSend(v15, "removeObject:", v13);

      }
      else
      {
        objc_msgSend(v15, "addObject:", v13);

        -[SearchUIResultsCollectionViewController sectionsThatHaveBeenExpanded](self, "sectionsThatHaveBeenExpanded");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v13);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v13, "results");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "moreResults");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v23 = v21;
          }
          else
          {
            objc_msgSend(v13, "results");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "moreResults");
            v23 = (id)objc_claimAutoreleasedReturnValue();

          }
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke;
          v26[3] = &unk_1EA1F7C30;
          v26[4] = self;
          v27 = v13;
          v28 = v4;
          objc_msgSend(v23, "loadSearchResultsWithCompletionHandler:", v26);

          if (v23)
            goto LABEL_13;
        }
      }
      -[SearchUICollectionViewController performExpansion:withSection:](self, "performExpansion:withSection:", !v14, v4);
      v23 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {

  }
  v29.receiver = self;
  v29.super_class = (Class)SearchUIResultsCollectionViewController;
  -[SearchUICollectionViewController toggleExpansionForSectionModel:](&v29, sel_toggleExpansionForSectionModel_, v4);
LABEL_14:

}

void __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke_2;
  v6[3] = &unk_1EA1F79A0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[1] = 3221225472;
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);

}

void __74__SearchUIResultsCollectionViewController_toggleExpansionForSectionModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "expandedSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "maxInitiallyVisibleResults");
    v5 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v5, "setMaxInitiallyVisibleResults:");
    }
    else
    {
      objc_msgSend(v5, "results");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setMaxInitiallyVisibleResults:", objc_msgSend(v6, "count"));

    }
    objc_msgSend(*(id *)(a1 + 40), "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setResults:", v8);

    objc_msgSend(*(id *)(a1 + 32), "sectionsThatHaveBeenExpanded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "performExpansion:withSection:", 1, *(_QWORD *)(a1 + 56));
  }
}

- (id)tableModelForExpansion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SearchUICollectionViewController tableModel](self, "tableModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedTableModelWithExpandedSections:expandedCollectionCardSections:hiddenSections:atSectionIndex:", v4, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resignTextFieldIfNeeded
{
  id v3;

  if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resignFirstResponder");

  }
}

- (void)showMoreSectionsWithShowMoreButtonIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "section");
  -[SearchUICollectionViewController tableModel](self, "tableModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsCollectionViewController expandedSections](self, "expandedSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsCollectionViewController hiddenSections](self, "hiddenSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedTableModelWithExpandedSections:expandedCollectionCardSections:hiddenSections:atSectionIndex:", v7, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__SearchUIResultsCollectionViewController_showMoreSectionsWithShowMoreButtonIndexPath___block_invoke;
  v11[3] = &unk_1EA1F7C58;
  objc_copyWeak(v12, &location);
  v12[1] = v5;
  -[SearchUICollectionViewController setTableModel:animated:completion:](self, "setTableModel:animated:completion:", v10, 1, v11);
  -[SearchUIResultsCollectionViewController resignTextFieldIfNeeded](self, "resignTextFieldIfNeeded");
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 15);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __87__SearchUIResultsCollectionViewController_showMoreSectionsWithShowMoreButtonIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setFocusableIndexPath:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenSections, 0);
  objc_storeStrong((id *)&self->_sectionsThatHaveBeenExpanded, 0);
  objc_storeStrong((id *)&self->_expandedSections, 0);
}

@end
