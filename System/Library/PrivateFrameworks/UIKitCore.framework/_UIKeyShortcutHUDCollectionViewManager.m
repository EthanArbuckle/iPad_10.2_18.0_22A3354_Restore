@implementation _UIKeyShortcutHUDCollectionViewManager

- (void)setMenu:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_menu, obj);
    objc_msgSend(obj, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _configureCollectionView:](self, "_configureCollectionView:", v6);

  }
}

- (void)setToolbar:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_toolbar, obj);
    objc_msgSend(obj, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _configureCollectionView:](self, "_configureCollectionView:", v6);

  }
}

- (void)setSearchButton:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchButton);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_searchButton, obj);
    objc_msgSend(obj, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _configureCollectionView:](self, "_configureCollectionView:", v6);

  }
}

- (void)_configureCollectionView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setSelectionFollowsFocus:", 1);
  +[_UIKeyShortcutHUDUtilities sharedFocusGroupIdentifier]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFocusGroupIdentifier:", v5);

  objc_msgSend(v6, "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(v6, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);

}

- (id)_clientForCollectionView:(id)a3
{
  id v4;
  _UIKeyShortcutHUDCollectionViewManagerClient **p_toolbar;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  p_toolbar = &self->_toolbar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  objc_msgSend(WeakRetained, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v4)
  {
    p_toolbar = &self->_menu;
    v8 = objc_loadWeakRetained((id *)&self->_menu);
    objc_msgSend(v8, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v4)
      p_toolbar = &self->_searchButton;
  }
  v10 = objc_loadWeakRetained((id *)p_toolbar);

  return v10;
}

- (NSArray)allClients
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  v8[0] = WeakRetained;
  v4 = objc_loadWeakRetained((id *)&self->_menu);
  v8[1] = v4;
  v5 = objc_loadWeakRetained((id *)&self->_searchButton);
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!-[_UIKeyShortcutHUDCollectionViewManager nextFocusUpdatePrefersTopSearchResult](self, "nextFocusUpdatePrefersTopSearchResult"))goto LABEL_3;
  -[_UIKeyShortcutHUDCollectionViewManager setNextFocusUpdatePrefersTopSearchResult:](self, "setNextFocusUpdatePrefersTopSearchResult:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    -[_UIKeyShortcutHUDIndexPath client](self->_selectedIndexPath, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDIndexPath indexPath](self->_selectedIndexPath, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_UIKeyShortcutHUDIndexPath client](self->_categoryVisibleIndexPath, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyShortcutHUDIndexPath indexPath](self->_categoryVisibleIndexPath, "indexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v13 = objc_loadWeakRetained((id *)&self->_searchButton);
        objc_msgSend(v13, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "visibleCells");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v16 = objc_loadWeakRetained((id *)&self->_hudVC);
  if ((objc_msgSend(v16, "isSearching") & 1) != 0)
  {
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {

      return (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {

  }
  if (v6)
  {
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v19;
  }
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _UIKeyShortcutHUDIndexPath *selectedIndexPath;
  id v12;

  objc_msgSend(a3, "nextFocusedItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v12;
    objc_msgSend(v7, "_collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIKeyShortcutHUDCollectionViewManager client:selectCellAtIndexPath:](self, "client:selectCellAtIndexPath:", v9, v10);
LABEL_5:

    goto LABEL_6;
  }
  selectedIndexPath = self->_selectedIndexPath;
  if (selectedIndexPath)
  {
    -[_UIKeyShortcutHUDIndexPath client](selectedIndexPath, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDIndexPath indexPath](self->_selectedIndexPath, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _client:deselectCellAtIndexPath:](self, "_client:deselectCellAtIndexPath:", v8, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)client:(id)a3 shouldHideSeparatorAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[_UIKeyShortcutHUDCollectionViewManager allClients](self, "allClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "indexPathsForCellsUsingSeparatorAtIndexPath:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      while (2)
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v17, "client", (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "collectionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "indexPath");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "cellForItemAtIndexPath:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v20) = objc_msgSend(v21, "isBackgroundVisible");
          if ((v20 & 1) != 0)
          {
            LOBYTE(v14) = 1;
            goto LABEL_19;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_19:

  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)client:(id)a3 reloadSeparatorAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supplementaryViewForElementKind:atIndexPath:", v9, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[_UIKeyShortcutHUDCollectionViewManager client:shouldHideSeparatorAtIndexPath:](self, "client:shouldHideSeparatorAtIndexPath:", v7, v6);
  objc_msgSend(v12, "separatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorHidden:", v10);

}

- (void)reloadAllVisibleSeparatorsForClient:(id)a3
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleSupplementaryElementsOfKind:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[_UIKeyShortcutHUDCollectionViewManager client:reloadSeparatorAtIndexPath:](self, "client:reloadSeparatorAtIndexPath:", v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)client:(id)a3 flashCellIfPossibleAtIndexPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  double v29;
  double v30;
  dispatch_time_t v31;
  _QWORD block[4];
  id v33;
  _UIKeyShortcutHUDCollectionViewManager *v34;
  id v35;
  id v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "bounds");
    objc_msgSend(v11, "convertRect:fromView:", v12);
    v39.origin.x = v21;
    v39.origin.y = v22;
    v39.size.width = v23;
    v39.size.height = v24;
    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    if (CGRectIntersectsRect(v38, v39))
    {
      -[_UIKeyShortcutHUDIndexPath client](self->_selectedIndexPath, "client");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 == v8)
      {
        -[_UIKeyShortcutHUDIndexPath indexPath](self->_selectedIndexPath, "indexPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", v9);

        if ((v27 & 1) != 0)
        {
LABEL_8:
          objc_msgSend(v12, "setFlashing:", 1);
          -[_UIKeyShortcutHUDCollectionViewManager _collectionView:updateSeparatorVisibilityForCellAtIndexPath:](self, "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", v11, v9);
          +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cellFlashDuration");
          v30 = v29;

          v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __98___UIKeyShortcutHUDCollectionViewManager_client_flashCellIfPossibleAtIndexPath_completionHandler___block_invoke;
          block[3] = &unk_1E16C0EF8;
          v33 = v12;
          v34 = self;
          v35 = v11;
          v36 = v9;
          v37 = v10;
          dispatch_after(v31, MEMORY[0x1E0C80D38], block);

          goto LABEL_9;
        }
      }
      else
      {

      }
      -[_UIKeyShortcutHUDCollectionViewManager client:selectCellAtIndexPath:](self, "client:selectCellAtIndexPath:", v8, 0);
      goto LABEL_8;
    }
  }
  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_9:

}

- (void)client:(id)a3 selectCellAtIndexPath:(id)a4
{
  _UIKeyShortcutHUDIndexPath *selectedIndexPath;
  id v7;
  void *v8;
  void *v9;
  id v10;

  selectedIndexPath = self->_selectedIndexPath;
  v7 = a4;
  v10 = a3;
  -[_UIKeyShortcutHUDIndexPath client](selectedIndexPath, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDIndexPath indexPath](self->_selectedIndexPath, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _client:deselectCellAtIndexPath:](self, "_client:deselectCellAtIndexPath:", v8, v9);

  -[_UIKeyShortcutHUDCollectionViewManager _client:selectCellAtIndexPath:](self, "_client:selectCellAtIndexPath:", v10, v7);
}

- (void)_client:(id)a3 deselectCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v8 = a3;
    objc_msgSend(v8, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 0);

    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForDeselectingCellAtIndexPath:](self, "_client:performBookkeepingForDeselectingCellAtIndexPath:", v8, v6);
  }
}

- (void)_client:(id)a3 performBookkeepingForDeselectingCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _UIKeyShortcutHUDIndexPath *selectedIndexPath;

  v6 = a4;
  objc_msgSend(a3, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _collectionView:updateSeparatorVisibilityForCellAtIndexPath:](self, "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", v7, v6);

  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;

}

- (void)_client:(id)a3 selectCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v8 = a3;
    objc_msgSend(v8, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);

    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForSelectingCellAtIndexPath:](self, "_client:performBookkeepingForSelectingCellAtIndexPath:", v8, v6);
  }
}

- (void)_client:(id)a3 performBookkeepingForSelectingCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIKeyShortcutHUDIndexPath *v9;
  _UIKeyShortcutHUDIndexPath *selectedIndexPath;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _collectionView:updateSeparatorVisibilityForCellAtIndexPath:](self, "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", v8, v6);

  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", v7, v6);
  v9 = (_UIKeyShortcutHUDIndexPath *)objc_claimAutoreleasedReturnValue();

  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v9;

}

- (void)deselectCurrentlySelectedCell
{
  _UIKeyShortcutHUDIndexPath *selectedIndexPath;
  void *v4;
  id v5;

  selectedIndexPath = self->_selectedIndexPath;
  if (selectedIndexPath)
  {
    -[_UIKeyShortcutHUDIndexPath client](selectedIndexPath, "client");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDIndexPath indexPath](self->_selectedIndexPath, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDCollectionViewManager _client:deselectCellAtIndexPath:](self, "_client:deselectCellAtIndexPath:", v5, v4);

  }
}

- (void)client:(id)a3 highlightCellAtIndexPath:(id)a4
{
  _UIKeyShortcutHUDIndexPath *highlightedIndexPath;
  id v7;
  void *v8;
  void *v9;
  id v10;

  highlightedIndexPath = self->_highlightedIndexPath;
  v7 = a4;
  v10 = a3;
  -[_UIKeyShortcutHUDIndexPath client](highlightedIndexPath, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDIndexPath indexPath](self->_highlightedIndexPath, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _client:unhighlightCellAtIndexPath:](self, "_client:unhighlightCellAtIndexPath:", v8, v9);

  -[_UIKeyShortcutHUDCollectionViewManager _client:highlightCellAtIndexPath:](self, "_client:highlightCellAtIndexPath:", v10, v7);
}

- (void)_client:(id)a3 unhighlightCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setHighlighted:", 0);
    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForUnhighlightingCellAtIndexPath:](self, "_client:performBookkeepingForUnhighlightingCellAtIndexPath:", v7, v6);

  }
}

- (void)_client:(id)a3 performBookkeepingForUnhighlightingCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _UIKeyShortcutHUDIndexPath *highlightedIndexPath;

  v6 = a4;
  objc_msgSend(a3, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _collectionView:updateSeparatorVisibilityForCellAtIndexPath:](self, "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", v7, v6);

  highlightedIndexPath = self->_highlightedIndexPath;
  self->_highlightedIndexPath = 0;

}

- (void)_client:(id)a3 highlightCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setHighlighted:", 1);
    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForHighlightingCellAtIndexPath:](self, "_client:performBookkeepingForHighlightingCellAtIndexPath:", v7, v6);

  }
}

- (void)_client:(id)a3 performBookkeepingForHighlightingCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIKeyShortcutHUDIndexPath *v9;
  _UIKeyShortcutHUDIndexPath *highlightedIndexPath;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _collectionView:updateSeparatorVisibilityForCellAtIndexPath:](self, "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", v8, v6);

  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", v7, v6);
  v9 = (_UIKeyShortcutHUDIndexPath *)objc_claimAutoreleasedReturnValue();

  highlightedIndexPath = self->_highlightedIndexPath;
  self->_highlightedIndexPath = v9;

}

- (BOOL)client:(id)a3 isCategoryVisibleForCellAtIndexPath:(id)a4
{
  id v6;
  _UIKeyShortcutHUDIndexPath *categoryVisibleIndexPath;
  id v8;
  id v9;
  char v10;
  void *v11;

  v6 = a4;
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  v8 = a3;
  -[_UIKeyShortcutHUDIndexPath client](categoryVisibleIndexPath, "client");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[_UIKeyShortcutHUDIndexPath indexPath](self->_categoryVisibleIndexPath, "indexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isEqual:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4
{
  _UIKeyShortcutHUDIndexPath *categoryVisibleIndexPath;
  id v7;
  void *v8;
  void *v9;
  id v10;

  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  v7 = a4;
  v10 = a3;
  -[_UIKeyShortcutHUDIndexPath client](categoryVisibleIndexPath, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDIndexPath indexPath](self->_categoryVisibleIndexPath, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _client:removeCategoryVisibleForCellAtIndexPath:](self, "_client:removeCategoryVisibleForCellAtIndexPath:", v8, v9);

  -[_UIKeyShortcutHUDCollectionViewManager _client:setCategoryVisibleForCellAtIndexPath:](self, "_client:setCategoryVisibleForCellAtIndexPath:", v10, v7);
}

- (void)_client:(id)a3 removeCategoryVisibleForCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setCategoryVisible:", 0);
    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:](self, "_client:performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:", v7, v6);

  }
}

- (void)_client:(id)a3 performBookkeepingForRemovingCategoryVisibleForCellAtIndexPath:(id)a4
{
  _UIKeyShortcutHUDIndexPath *categoryVisibleIndexPath;

  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  self->_categoryVisibleIndexPath = 0;

}

- (void)_client:(id)a3 setCategoryVisibleForCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setCategoryVisible:", 1);
    -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:](self, "_client:performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:", v7, v6);

  }
}

- (void)_client:(id)a3 performBookkeepingForSettingCategoryVisibleForCellAtIndexPath:(id)a4
{
  _UIKeyShortcutHUDIndexPath *v5;
  _UIKeyShortcutHUDIndexPath *categoryVisibleIndexPath;

  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", a3, a4);
  v5 = (_UIKeyShortcutHUDIndexPath *)objc_claimAutoreleasedReturnValue();
  categoryVisibleIndexPath = self->_categoryVisibleIndexPath;
  self->_categoryVisibleIndexPath = v5;

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForUnhighlightingCellAtIndexPath:](self, "_client:performBookkeepingForUnhighlightingCellAtIndexPath:", v7, v6);

}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager client:highlightCellAtIndexPath:](self, "client:highlightCellAtIndexPath:", v7, v6);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager _client:performBookkeepingForDeselectingCellAtIndexPath:](self, "_client:performBookkeepingForDeselectingCellAtIndexPath:", v7, v6);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "shouldPersistSelectionForCellAtIndexPath:", v6) & 1) != 0
    || (objc_msgSend(v8, "isFocused") & 1) != 0)
  {
    -[_UIKeyShortcutHUDCollectionViewManager client:selectCellAtIndexPath:](self, "client:selectCellAtIndexPath:", v7, v6);
  }
  else
  {
    objc_msgSend(v9, "deselectItemAtIndexPath:animated:", v6, 0);
  }
  -[_UIKeyShortcutHUDCollectionViewManager _collectionView:performActionForSelectingCellAtIndexPath:](self, "_collectionView:performActionForSelectingCellAtIndexPath:", v9, v6);

}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "selectionFollowsFocusForItemAtIndexPath:", v6);

  return (char)self;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", v14);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);

  if (v10 == WeakRetained)
  {
    v12 = v8;
    -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCategoryVisible:", -[_UIKeyShortcutHUDCollectionViewManager client:isCategoryVisibleForCellAtIndexPath:](self, "client:isCategoryVisibleForCellAtIndexPath:", v13, v9));

  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a6;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = -[_UIKeyShortcutHUDCollectionViewManager client:shouldHideSeparatorAtIndexPath:](self, "client:shouldHideSeparatorAtIndexPath:", v13, v10);
    objc_msgSend(v14, "separatorView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSeparatorHidden:", v15);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didScrollCollectionView");

}

- (void)_collectionView:(id)a3 performActionForSelectingCellAtIndexPath:(id)a4
{
  id v6;
  id v7;

  if (a4)
  {
    v6 = a4;
    -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performActionForSelectingCellAtIndexPath:", v6);

  }
}

- (void)_collectionView:(id)a3 updateSeparatorVisibilityForCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[_UIKeyShortcutHUDCollectionViewManager _clientForCollectionView:](self, "_clientForCollectionView:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[_UIKeyShortcutHUDCollectionViewManager allClients](self, "allClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "indexPathsForSeparatorsUsedByCellAtIndexPath:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "unionSet:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v21, "client", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "indexPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKeyShortcutHUDCollectionViewManager client:reloadSeparatorAtIndexPath:](self, "client:reloadSeparatorAtIndexPath:", v22, v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

  }
}

- (_UIKeyShortcutHUDViewController)hudVC
{
  return (_UIKeyShortcutHUDViewController *)objc_loadWeakRetained((id *)&self->_hudVC);
}

- (void)setHudVC:(id)a3
{
  objc_storeWeak((id *)&self->_hudVC, a3);
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)menu
{
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)objc_loadWeakRetained((id *)&self->_menu);
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)toolbar
{
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)objc_loadWeakRetained((id *)&self->_toolbar);
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)searchButton
{
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)objc_loadWeakRetained((id *)&self->_searchButton);
}

- (BOOL)nextFocusUpdatePrefersTopSearchResult
{
  return self->_nextFocusUpdatePrefersTopSearchResult;
}

- (void)setNextFocusUpdatePrefersTopSearchResult:(BOOL)a3
{
  self->_nextFocusUpdatePrefersTopSearchResult = a3;
}

- (_UIKeyShortcutHUDIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (_UIKeyShortcutHUDIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
}

- (_UIKeyShortcutHUDIndexPath)categoryVisibleIndexPath
{
  return self->_categoryVisibleIndexPath;
}

- (void)setCategoryVisibleIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_categoryVisibleIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_destroyWeak((id *)&self->_searchButton);
  objc_destroyWeak((id *)&self->_toolbar);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_hudVC);
}

@end
