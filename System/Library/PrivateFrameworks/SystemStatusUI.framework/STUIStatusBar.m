@implementation STUIStatusBar

uint64_t __35__STUIStatusBar__updateRegionItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updatePlacement");
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "prepareForDataUpdate");
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updatedDisplayItemsWithData:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__STUIStatusBar__updateRegionItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "isEnabled");
  v6 = objc_msgSend(v4, "isEnabled");

  if (v5 | v6 ^ 1)
    return v5 & (v6 ^ 1u);
  else
    return -1;
}

- (void)_updateRegionItems
{
  STUIStatusBar *v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  STUIStatusBar *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->_currentData)
    return;
  v2 = self;
  v3 = 544;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayItemStates, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_122_0);
  -[NSDictionary keysSortedByValueUsingComparator:](v2->_regions, "keysSortedByValueUsingComparator:", &__block_literal_global_124);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v40)
    goto LABEL_35;
  v38 = 0;
  v39 = *(_QWORD *)v55;
  v45 = v2;
  do
  {
    for (i = 0; i != v40; i = v23 + 1)
    {
      if (*(_QWORD *)v55 != v39)
        objc_enumerationMutation(obj);
      v42 = i;
      v5 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
      -[NSDictionary objectForKeyedSubscript:](v2->_regions, "objectForKeyedSubscript:", v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      -[STUIStatusBarVisualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:](v2->_visualProvider, "orderedDisplayItemPlacementsInRegionWithIdentifier:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v44 = v7;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      v43 = v6;
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v51 != v10)
              objc_enumerationMutation(v44);
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v3;
            objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v3), "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isCurrentPlacement:", v12);

            if (v16)
            {
              +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[STUIStatusBar itemWithIdentifier:](v2, "itemWithIdentifier:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "displayItemForIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v43;
              objc_msgSend(v20, "setPlacement:", v12);
              objc_msgSend(v43, "addObject:", v20);

              v2 = v45;
            }

            v3 = v14;
          }
          v9 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v9);
      }
      objc_msgSend(v41, "displayItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "isEqual:", v21);

      if ((v22 & 1) != 0)
      {
        v23 = v42;
LABEL_19:
        v24 = v43;
        goto LABEL_23;
      }
      v23 = v42;
      if ((*((_BYTE *)&v2->_statusBarFlags + 1) & 0x10) == 0)
        goto LABEL_19;
      v24 = v43;
      -[STUIStatusBarVisualProvider region:willSetDisplayItems:](v2->_visualProvider, "region:willSetDisplayItems:", v41, v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 != v43)
      {
        v27 = objc_msgSend(v25, "mutableCopy");

        v24 = (void *)v27;
      }

LABEL_23:
      objc_msgSend(v41, "setDisplayItems:", v24);
      objc_msgSend(v41, "displayItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "minusOrderedSet:", v28);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v29 = v24;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v47 != v32)
              objc_enumerationMutation(v29);
            v34 = *(Class *)((char *)&v45->super.super.super.isa + v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "updateToNextEnabledPlacement");

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v31);
        v38 = 1;
        v2 = v45;
      }

    }
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  }
  while (v40);
  if ((v38 & 1) != 0)
    -[STUIStatusBar _updateRegionItems](v2, "_updateRegionItems");
LABEL_35:
  if ((*((_BYTE *)&v2->_statusBarFlags + 1) & 0x20) != 0)
    -[STUIStatusBarVisualProvider statusBarRegionsUpdated](v2->_visualProvider, "statusBarRegionsUpdated");

}

- (STStatusBarData)currentAggregatedData
{
  return (STStatusBarData *)-[STMutableStatusBarData immutableCopy](self->_currentAggregatedData, "immutableCopy");
}

- (BOOL)areAnimationsEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
    return 0;
  -[STUIStatusBar window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[STUIStatusBar window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_hasContext");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "updateWithData:styleAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v4);

}

- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_items, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    +[STUIStatusBarItem createItemForIdentifier:statusBar:](STUIStatusBarItem, "createItemForIdentifier:statusBar:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)&self->_statusBarFlags + 2) & 4) != 0)
      -[STUIStatusBarVisualProvider itemCreated:](self->_visualProvider, "itemCreated:", v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_items, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  return -[STUIStatusBar _itemWithIdentifier:createIfNeeded:](self, "_itemWithIdentifier:createIfNeeded:", a3, 1);
}

- (STUIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

void __41__STUIStatusBar_styleAttributesForStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveStyleFromStyle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "visualProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleAttributesForStyle:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (STUIStatusBarVisualProvider)visualProvider
{
  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  return self->_visualProvider;
}

- (void)_prepareVisualProviderIfNeeded
{
  void *v3;
  objc_class *visualProviderClass;
  void *v5;
  void *v6;
  objc_class *v7;
  Class v8;
  int v9;
  int v10;
  int v11;
  STUIStatusBarVisualProvider *v12;
  STUIStatusBarVisualProvider *visualProvider;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  STUIStatusBarForegroundView *v31;
  STUIStatusBarForegroundView *v32;
  UIPointerInteraction *v33;
  UIPointerInteraction *pointerInteraction;
  void *v35;
  void *v36;
  STUIStatusBarVisualProvider *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDictionary *regions;
  STUIStatusBarVisualProvider *v42;
  STUIStatusBar *v43;
  STUIStatusBar *v44;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  _BOOL8 v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;

  if (self->_targetScreen
    || (-[STUIStatusBar window](self, "window"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    if (!self->_visualProvider)
    {
      visualProviderClass = self->_visualProviderClass;
      if (!visualProviderClass)
      {
        -[STUIStatusBar _effectiveTargetScreen](self, "_effectiveTargetScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBar visualProviderInfo](self, "visualProviderInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        STUIStatusBarGetVisualProviderClassForScreen(v5, v6);
        v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v8 = self->_visualProviderClass;
        self->_visualProviderClass = v7;

        if (-[objc_class scalesWithScreenNativeScale](self->_visualProviderClass, "scalesWithScreenNativeScale"))v9 = 2;
        else
          v9 = 0;
        self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFD | v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = 4;
        else
          v10 = 0;
        self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFB | v10);
        if (-[objc_class requiresIterativeOverflowLayout](self->_visualProviderClass, "requiresIterativeOverflowLayout"))v11 = 8;
        else
          v11 = 0;
        self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFF7 | v11);

        visualProviderClass = self->_visualProviderClass;
      }
      v12 = (STUIStatusBarVisualProvider *)objc_alloc_init(visualProviderClass);
      visualProvider = self->_visualProvider;
      self->_visualProvider = v12;

      -[STUIStatusBarVisualProvider setStatusBar:](self->_visualProvider, "setStatusBar:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 16;
      else
        v14 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFEF | v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = 32;
      else
        v15 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFDF | v15);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 64;
      else
        v16 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFBF | v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = 128;
      else
        v17 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFF7F | v17);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 256;
      else
        v18 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFEFF | v18);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 512;
      else
        v19 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFDFF | v19);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = 1024;
      else
        v20 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFBFF | v20);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = 2048;
      else
        v21 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFF7FF | v21);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = 4096;
      else
        v22 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFEFFF | v22);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = 0x2000;
      else
        v23 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFDFFF | v23);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = 0x4000;
      else
        v24 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFBFFF | v24);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = 0x8000;
      else
        v25 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFF7FFF | v25);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = 0x10000;
      else
        v26 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFEFFFF | v26);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = 0x20000;
      else
        v27 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFDFFFF | v27);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = 0x40000;
      else
        v28 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFBFFFF | v28);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = 0x80000;
      else
        v29 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFF7FFFF | v29);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = 0x100000;
      else
        v30 = 0;
      self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFEFFFFF | v30);
      -[STUIStatusBar _updateActionGestureRecognizerAllowableTouchTypesIfNeeded](self, "_updateActionGestureRecognizerAllowableTouchTypesIfNeeded");
    }
    if (!self->_foregroundView)
    {
      v31 = [STUIStatusBarForegroundView alloc];
      -[STUIStatusBar bounds](self, "bounds");
      v32 = -[STUIStatusBarForegroundView initWithFrame:](v31, "initWithFrame:");
      -[STUIStatusBar setForegroundView:](self, "setForegroundView:", v32);

      v33 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
      pointerInteraction = self->_pointerInteraction;
      self->_pointerInteraction = v33;

      -[STUIStatusBar foregroundView](self, "foregroundView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addInteraction:", self->_pointerInteraction);

      -[STUIStatusBar addSubview:](self, "addSubview:", self->_foregroundView);
    }
    if (!-[NSDictionary count](self->_regions, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = self->_visualProvider;
      -[STUIStatusBar containerView](self, "containerView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarVisualProvider setupInContainerView:](v37, "setupInContainerView:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke;
      v49[3] = &unk_1E8D644C8;
      v49[4] = self;
      v47 = v36;
      v50 = v47;
      objc_msgSend(v39, "enumerateObjectsUsingBlock:", v49);
      objc_storeStrong((id *)&self->_regions, v36);
      regions = self->_regions;
      v48[0] = v40;
      v48[1] = 3221225472;
      v48[2] = __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2;
      v48[3] = &unk_1E8D644F0;
      v48[4] = self;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v48);
      +[STUIStatusBarDisplayItemState setupRelationsBetweenDisplayItemStates:visualProvider:](STUIStatusBarDisplayItemState, "setupRelationsBetweenDisplayItemStates:visualProvider:", self->_displayItemStates, self->_visualProvider);
      if (self->_mode)
      {
        if ((*(_BYTE *)&self->_statusBarFlags & 0x10) != 0)
          -[STUIStatusBarVisualProvider modeUpdatedFromMode:](self->_visualProvider, "modeUpdatedFromMode:", 0);
      }
      if ((*((_BYTE *)&self->_statusBarFlags + 2) & 8) == 0)
        goto LABEL_82;
      v42 = self->_visualProvider;
      v43 = self;
      v44 = v43;
      statusBarFlags = self->_statusBarFlags;
      if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
      {
        if ((v43->_style & 0x3F) == 0)
        {
          v46 = 1;
          goto LABEL_81;
        }
        if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
        {
          v46 = -[STUIStatusBar mode](v43, "mode") != 1;
          goto LABEL_81;
        }
      }
      v46 = 0;
LABEL_81:

      -[STUIStatusBarVisualProvider updateLumaTracking:](v42, "updateLumaTracking:", v46);
LABEL_82:
      -[STUIStatusBar _updateStyleAttributes](self, "_updateStyleAttributes");

    }
  }
}

- (BOOL)_useAutomaticStyle
{
  STUIStatusBar *v2;
  STUIStatusBar *v3;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  BOOL v5;

  v2 = self;
  v3 = v2;
  statusBarFlags = v2->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
  {
    if ((v2->_style & 0x3F) == 0)
    {
      v5 = 1;
      goto LABEL_7;
    }
    if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
    {
      v5 = -[STUIStatusBar mode](v2, "mode") != 1;
      goto LABEL_7;
    }
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  int64_t v3;
  void *v4;

  v3 = a3;
  if (!a3)
  {
    -[STUIStatusBar traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 2)
      v3 = 1;
    else
      v3 = 2;

  }
  return v3;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = 0;
  -[STUIStatusBar traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__STUIStatusBar_styleAttributesForStyle___block_invoke;
  v8[3] = &unk_1E8D645A8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "performAsCurrentTraitCollection:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)setForegroundView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundView, a3);
}

- (UIView)containerView
{
  return self->_foregroundView;
}

- (NSDictionary)visualProviderInfo
{
  return self->_visualProviderInfo;
}

uint64_t __43__STUIStatusBar_resizeSubviewsWithOldSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "resetToPreferredPlacement");
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[STUIStatusBar traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUIStatusBar effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionByReplacingNSIntegerValue:forTrait:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a4, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAction:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[STUIStatusBarIdentifier displayIdentifierFromStringRepresentation:](STUIStatusBarIdentifier, "displayIdentifierFromStringRepresentation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }

  }
  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 0x80) != 0)
  {
    -[STUIStatusBarVisualProvider displayItemIdentifiersForPartWithIdentifier:](self->_visualProvider, "displayItemIdentifiersForPartWithIdentifier:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObjectsFromSet:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        -[STUIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19), (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 && (!v5 || objc_msgSend(v20, "visible")))
          objc_msgSend(v9, "addObject:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  if (!objc_msgSend(v9, "count"))
  {
    -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", v8, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v22);

  }
  return v9;
}

- (id)displayItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar _itemWithIdentifier:createIfNeeded:](self, "_itemWithIdentifier:createIfNeeded:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "displayItemForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "orderedDisplayItemPlacementsInRegionWithIdentifier:", a2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[STUIStatusBarDisplayItemState stateForDisplayItemWithIdentifier:statusBar:](STUIStatusBarDisplayItemState, "stateForDisplayItemWithIdentifier:statusBar:", v11, *(_QWORD *)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addPlacement:inRegion:", v10, v5);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (int64_t)mode
{
  return self->_mode;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIScreen)_effectiveTargetScreen
{
  UIScreen *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = self->_targetScreen;
  if (!v3)
  {
    -[STUIStatusBar window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[STUIStatusBar traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 == 3)
        objc_msgSend(MEMORY[0x1E0DC3BF8], "_carScreen");
      else
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect *p_avoidanceFrame;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  -[STUIStatusBar _effectiveScaleTransform](self, "_effectiveScaleTransform");
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v23 = CGRectApplyAffineTransform(v22, &v21);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  p_avoidanceFrame = &self->_avoidanceFrame;
  if (!CGRectEqualToRect(v23, self->_avoidanceFrame))
  {
    v17 = p_avoidanceFrame->origin.x;
    v18 = self->_avoidanceFrame.origin.y;
    v19 = self->_avoidanceFrame.size.width;
    v20 = self->_avoidanceFrame.size.height;
    p_avoidanceFrame->origin.x = v12;
    self->_avoidanceFrame.origin.y = v13;
    self->_avoidanceFrame.size.width = v14;
    self->_avoidanceFrame.size.height = v15;
    if ((*(_BYTE *)&self->_statusBarFlags & 0x40) != 0)
      -[STUIStatusBarVisualProvider avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:](self->_visualProvider, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", v11, a5, v17, v18, v19, v20);
  }

}

- (CGAffineTransform)_effectiveScaleTransform
{
  CGAffineTransform *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v13;

  if ((LOBYTE(self[9].b) & 2) != 0)
  {
    v4 = self;
    -[CGAffineTransform _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_nativeScale");
    v7 = v6;

    if ((LOBYTE(v4[9].b) & 4) != 0)
    {
      objc_msgSend(*(id *)&v4[12].d, "referenceScreenScale");
      v10 = v11;
    }
    else
    {
      -[CGAffineTransform _screen](v4, "_screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_scale");
      v10 = v9;

    }
    self = (CGAffineTransform *)-[CGAffineTransform mode](v4, "mode");
    if (self != (CGAffineTransform *)1 && v7 != 0.0 && vabdd_f64(v10, v7) > 0.00000011920929)
      return CGAffineTransformMakeScale(retstr, v10 / v7, v10 / v7);
  }
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  return self;
}

- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "style") != a3)
        {
          objc_msgSend(v12, "setStyle:", a3);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__STUIStatusBar_setStyle_forPartWithIdentifier___block_invoke;
      v13[3] = &unk_1E8D62A38;
      v13[4] = self;
      -[STUIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v13);
    }
  }
  else
  {

  }
}

void __73__STUIStatusBar__setAutomaticStyle_additionalStylesForRegionIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
  if (*(_BYTE *)(a1 + 41))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "styleAttributes");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v3, MEMORY[0x1E0C9AA60]);

  }
}

void __26__STUIStatusBar_setStyle___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
  if (*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "count"))
    {
      v2 = *(void **)(a1 + 32);
      objc_msgSend(v2, "styleAttributes");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v3, MEMORY[0x1E0C9AA60]);

    }
  }
}

- (void)_updateWithAggregatedData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  void *v13;
  void (**v14)(_QWORD);
  id updateCompletionHandler;
  _BYTE v16[22];
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  +[STUIStatusBarDataBroadcaster sharedInstance](STUIStatusBarDataBroadcaster, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyUpdate:", v7);

  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 1) != 0)
  {
    -[STUIStatusBarVisualProvider willUpdateWithData:](self->_visualProvider, "willUpdateWithData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (self->_currentAggregatedData)
    -[STMutableStatusBarData applyUpdate:](self->_currentAggregatedData, "applyUpdate:", v5);
  else
    objc_storeStrong((id *)&self->_currentAggregatedData, v5);
  _STUIStatusBar_Log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    v11 = CFSTR("NO");
    *(_DWORD *)v16 = 134218498;
    *(_QWORD *)&v16[4] = self;
    *(_WORD *)&v16[12] = 2112;
    if (v10)
      v11 = CFSTR("YES");
    *(_QWORD *)&v16[14] = v4;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CFE2E000, v9, OS_LOG_TYPE_INFO, "Status bar %p now applying update: %@, animated: %@", v16, 0x20u);
  }

  -[STUIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", v5, 0, v8);
  statusBarFlags = self->_statusBarFlags;
  if ((*(_WORD *)&statusBarFlags & 0x200) != 0)
  {
    -[STUIStatusBarVisualProvider dataUpdated:](self->_visualProvider, "dataUpdated:", v5);
    statusBarFlags = self->_statusBarFlags;
  }
  self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags | 1);
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate", *(_OWORD *)v16);
  -[STUIStatusBar updateCompletionHandler](self, "updateCompletionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void (**)(_QWORD))_Block_copy(self->_updateCompletionHandler);
    updateCompletionHandler = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

    v14[2](v14);
  }

}

- (void)_updateStyleAttributes
{
  STUIStatusBar *v2;
  STUIStatusBar *v3;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = self;
  v3 = v2;
  statusBarFlags = v2->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) == 0)
    goto LABEL_4;
  if ((v2->_style & 0x3F) != 0)
  {
    if ((*(_DWORD *)&statusBarFlags & 0x800000) == 0)
    {
LABEL_4:

LABEL_5:
      v5 = &OBJC_IVAR___STUIStatusBar__style;
      goto LABEL_9;
    }
    v6 = -[STUIStatusBar mode](v2, "mode");

    if (v6 == 1)
      goto LABEL_5;
  }
  else
  {

  }
  v5 = &OBJC_IVAR___STUIStatusBar__automaticStyle;
LABEL_9:
  v7 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v5);
  if (v7 == 2)
    v8 = 1;
  else
    v8 = 2 * (v7 == 1);
  -[STUIStatusBar setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", v8);
  -[STUIStatusBar styleAttributesForStyle:](v3, "styleAttributesForStyle:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar setStyleAttributes:](v3, "setStyleAttributes:", v9);

}

- (void)setStyleAttributes:(id)a3
{
  STUIStatusBarStyleAttributes *v4;
  STUIStatusBarStyleAttributes *styleAttributes;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_styleAttributes) & 1) == 0)
  {
    v4 = (STUIStatusBarStyleAttributes *)objc_msgSend(v6, "copy");
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v4;

    -[STUIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v6, MEMORY[0x1E0C9AA60]);
  }

}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[STUIStatusBar traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke;
  v15[3] = &unk_1E8D64660;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performAsCurrentTraitCollection:", v15);

}

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (CGRect)avoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avoidanceFrame.origin.x;
  y = self->_avoidanceFrame.origin.y;
  width = self->_avoidanceFrame.size.width;
  height = self->_avoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)styleForPartWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  return v5;
}

- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  if (a4)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_statusBarFlags + 2) & 1) != 0)
  {
    -[STUIStatusBarVisualProvider regionIdentifiersForPartWithIdentifier:](self->_visualProvider, "regionIdentifiersForPartWithIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v7;
}

- (void)updateWithAnimations:(id)a3
{
  -[STUIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, 0, a3);
}

void __42__STUIStatusBar__rearrangeOverflowedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "isEnabled") && (objc_msgSend(v11, "disableItemFrameBasedOverflow") & 1) == 0)
  {
    objc_msgSend(v11, "overflowedDisplayItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
LABEL_9:

      goto LABEL_10;
    }
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = objc_msgSend(v8, "priority");
      if (v10 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "priority"))
      {
LABEL_8:

        goto LABEL_9;
      }
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    goto LABEL_8;
  }
LABEL_10:

}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _DWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _DWORD *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_105);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 440) |= 0x200000u;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v22[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3;
  v22[3] = &unk_1E8D64610;
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = v3;
  v24 = *(id *)(a1 + 48);
  v17 = v2;
  v25 = v17;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4;
  v20[3] = &unk_1E8D64638;
  v21 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 440) &= ~0x200000u;
  objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
  STUIStatusBarGetPriorityComparator();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v17, "sortedArrayUsingComparator:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_prepareAnimations:", v17);
  if (objc_msgSend(v17, "count"))
  {
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5;
    v19[3] = &unk_1E8D62A38;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v19);
    v10 = *(_DWORD **)(a1 + 32);
    if ((v10[110] & 0x400008) != 0)
    {
      objc_msgSend(v10, "_rearrangeOverflowedItems");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        do
        {
          objc_msgSend(v12, "prepareForOverflowDataUpdate");
          objc_msgSend(v12, "updateWithData:styleAttributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_prepareAnimations:", v13);
          objc_msgSend(v17, "addObjectsFromArray:", v13);
          v18[0] = v5;
          v18[1] = 3221225472;
          v18[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_6;
          v18[3] = &unk_1E8D62A38;
          v18[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);

          objc_msgSend(*(id *)(a1 + 32), "_rearrangeOverflowedItems");
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
        }
        while (v14);
      }
      v10 = *(_DWORD **)(a1 + 32);
    }
    objc_msgSend(v10, "_performAnimations:", v17);
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
    v15 = *(_DWORD **)(a1 + 32);
    if ((v15[110] & 0x400008) != 0)
    {
      while (1)
      {
        objc_msgSend(v15, "layoutIfNeeded");
        objc_msgSend(*(id *)(a1 + 32), "_rearrangeOverflowedItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          break;
        v15 = *(_DWORD **)(a1 + 32);
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 440) |= 1u;
  }
  objc_msgSend(*(id *)(a1 + 32), "_fixupDisplayItemAttributes");

}

uint64_t __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 56);
  result = objc_msgSend(*(id *)(a1 + 32), "_requestedResolvedStyle");
  if (v2 == result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setStyle:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setForegroundColor:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2;
    v5[3] = &unk_1E8D631F8;
    v5[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  }
  return result;
}

- (void)setStyle:(int64_t)a3
{
  int64_t style;
  int64_t automaticStyle;
  STUIStatusBar *v7;
  STUIStatusBar *v8;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  _BOOL4 v10;
  int64_t v11;
  STUIStatusBar *v12;
  id *p_isa;
  $480163010D8600EFAA81F3B9B74CD7E7 v14;
  _BOOL8 v15;
  int v16;
  id *v18;
  double v19;
  double v21;
  dispatch_time_t v22;
  _QWORD v23[5];
  char v24;
  _QWORD block[4];
  id v26;
  id location;

  style = self->_style;
  if (style == a3)
    return;
  automaticStyle = self->_automaticStyle;
  v7 = self;
  v8 = v7;
  statusBarFlags = v7->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
  {
    if ((self->_style & 0x3F) == 0)
    {
      v10 = 1;
      goto LABEL_8;
    }
    if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
    {
      v10 = -[STUIStatusBar mode](v7, "mode") != 1;
      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:
  v11 = a3 >> 6;

  self->_style = a3;
  v12 = v8;
  p_isa = (id *)&v12->super.super.super.isa;
  v14 = v12->_statusBarFlags;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
    goto LABEL_11;
  if ((self->_style & 0x3F) != 0)
  {
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_11:

      v15 = 0;
      v16 = v11 != automaticStyle || v10;
      goto LABEL_23;
    }
    v15 = -[STUIStatusBar mode](v12, "mode") != 1;
  }
  else
  {
    v15 = 1;
  }

  v16 = v10 ^ v15;
  if (v11 != automaticStyle)
    v16 = 1;
  if (v16 != 1 || !v15)
  {
LABEL_23:
    v18 = p_isa + 54;
    if (!p_isa[54])
      return;
    if (!v16)
      goto LABEL_38;
    goto LABEL_30;
  }
  if ((unint64_t)a3 <= 0x3F)
    v11 = self->_automaticStyle;
  self->_automaticStyle = v11;
  v18 = p_isa + 54;
  if (p_isa[54])
  {
    v15 = 1;
LABEL_30:
    if (((_DWORD)p_isa[55] & 0x1080000) == 0x80000)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
      if (v19 > 0.0 && v15)
      {
        v21 = v19;
        objc_initWeak(&location, p_isa);
        v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __26__STUIStatusBar_setStyle___block_invoke;
        block[3] = &unk_1E8D64228;
        objc_copyWeak(&v26, &location);
        dispatch_after(v22, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(*v18, "updateLumaTracking:", v15);
      }
    }
    LOBYTE(v16) = 1;
LABEL_38:
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __26__STUIStatusBar_setStyle___block_invoke_2;
    v23[3] = &unk_1E8D64580;
    v23[4] = p_isa;
    v24 = v16;
    objc_msgSend(p_isa, "_performWithInheritedAnimation:", v23);
    if (((_BYTE)p_isa[55] & 0x80) != 0)
      objc_msgSend(*v18, "styleUpdatedFromStyle:", style);
  }
}

- (void)setForegroundColor:(id)a3
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    if (self->_visualProvider)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __36__STUIStatusBar_setForegroundColor___block_invoke;
      v6[3] = &unk_1E8D62A38;
      v6[4] = self;
      -[STUIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v6);
    }
  }

}

- (STStatusBarData)currentData
{
  return (STStatusBarData *)-[STMutableStatusBarData immutableCopy](self->_currentData, "immutableCopy");
}

- (int64_t)style
{
  return self->_style;
}

- (void)_prepareAnimations:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id updateCompletionHandler;
  NSObject *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
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
  v4 = a3;
  +[STUIStatusBarAnimation prepareAnimations:forStatusBar:](STUIStatusBarAnimation, "prepareAnimations:forStatusBar:", v4, self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    obj = v5;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "effectiveDelayedItemIdentifiers", obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v22 = v7;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                -[STUIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "dependentEntryKeys");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "unionSet:", v16);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          if (objc_msgSend(v9, "count"))
            -[STUIStatusBar _delayUpdatesWithKeys:fromAnimation:](self, "_delayUpdatesWithKeys:fromAnimation:", v9, v22);

        }
      }
      v5 = obj;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  if (self->_updateCompletionHandler && objc_msgSend(v5, "count"))
  {
    v17 = _Block_copy(self->_updateCompletionHandler);
    updateCompletionHandler = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

    v19 = dispatch_group_create();
    +[STUIStatusBarAnimation _addAnimations:toDispatchGroup:](STUIStatusBarAnimation, "_addAnimations:toDispatchGroup:", v5, v19);
    dispatch_group_notify(v19, MEMORY[0x1E0C80D38], v17);

  }
}

- (void)_fixupDisplayItemAttributes
{
  id v3;
  uint64_t v4;

  v3 = (id)_statusBarRunningAnimations;
  v4 = objc_msgSend(v3, "count");

  if (!v4
    && ((*((_BYTE *)&self->_statusBarFlags + 1) & 4) == 0
     || -[STUIStatusBarVisualProvider canFixupDisplayItemAttributes](self->_visualProvider, "canFixupDisplayItemAttributes")))
  {
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_regions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_109);
  }
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  UIView *foregroundView;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  _OWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBar;
  -[STUIStatusBar resizeSubviewsWithOldSize:](&v12, sel_resizeSubviewsWithOldSize_);
  -[STUIStatusBar bounds](self, "bounds");
  if (width != v7 || height != v6)
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayItemStates, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_114);
  -[STUIStatusBar _effectiveScaleTransform](self, "_effectiveScaleTransform");
  foregroundView = self->_foregroundView;
  v11[0] = v11[3];
  v11[1] = v11[4];
  v11[2] = v11[5];
  -[UIView setTransform:](foregroundView, "setTransform:", v11);
  -[STUIStatusBar bounds](self, "bounds");
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  -[STUIStatusBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  statusBarFlags = self->_statusBarFlags;
  self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags | 1);
  if ((*(_WORD *)&statusBarFlags & 0x800) != 0)
    -[STUIStatusBarVisualProvider sizeUpdatedFromSize:](self->_visualProvider, "sizeUpdatedFromSize:", width, height);
}

- (void)updateWithData:(id)a3
{
  -[STUIStatusBar _updateWithData:completionHandler:](self, "_updateWithData:completionHandler:", a3, 0);
}

- (void)_updateWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  STMutableStatusBarData *currentData;
  STMutableStatusBarData *v12;
  STMutableStatusBarData *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  STUIStatusBar *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  _STUIStatusBar_Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    -[STUIStatusBarDataAggregator delayedEntryKeys](self->_dataAggregator, "delayedEntryKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1CFE2E000, v8, OS_LOG_TYPE_INFO, "Status bar %p update with data: %@, animated: %@, delayedKeys: %@", buf, 0x2Au);

  }
  -[STUIStatusBar setUpdateCompletionHandler:](self, "setUpdateCompletionHandler:", v7);

  currentData = self->_currentData;
  if (currentData)
  {
    -[STMutableStatusBarData applyUpdate:](currentData, "applyUpdate:", v6);
    -[STUIStatusBarDataAggregator updateWithData:](self->_dataAggregator, "updateWithData:", v6);
  }
  else
  {
    v12 = (STMutableStatusBarData *)objc_msgSend(v6, "mutableCopy");
    v13 = self->_currentData;
    self->_currentData = v12;

    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__STUIStatusBar__updateWithData_completionHandler___block_invoke;
    v15[3] = &unk_1E8D62C88;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v14, "performWithoutAnimation:", v15);

  }
}

- (void)setUpdateCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)_performWithInheritedAnimation:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(v3, "begin");
  v5 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v6 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");
  v7 = (void *)MEMORY[0x1E0CD28B0];
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
    objc_msgSend(v7, "setAnimationDuration:");
    v8 = (void *)MEMORY[0x1E0CD28B0];
    MEMORY[0x1D17DDF54](objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationCurve"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnimationTimingFunction:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
  }
  v4[2](v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v5);
}

void __31__STUIStatusBar_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithAggregatedData:", v3);

}

uint64_t __31__STUIStatusBar_initWithStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

void __38__STUIStatusBar_reinitializeStatusBar__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithAggregatedData:", v3);

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBar;
  -[STUIStatusBar updateConstraints](&v3, sel_updateConstraints);
  if ((*((_BYTE *)&self->_statusBarFlags + 2) & 0x20) == 0)
    -[STUIStatusBar _updateRegionItems](self, "_updateRegionItems");
}

- (void)setOverlayData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "isEmpty"))
  {

    v11 = 0;
  }
  -[STUIStatusBar overlayData](self, "overlayData");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v11 != v4)
  {
    -[STUIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[STUIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataByApplyingOverlay:", self->_currentData);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = v11;
      if (v11)
      {
        if (v9)
        {
          objc_msgSend(v9, "applyUpdate:", v11);
LABEL_12:
          -[STUIStatusBarDataAggregator setOverlayData:](self->_dataAggregator, "setOverlayData:", 0);
          -[STUIStatusBarDataAggregator updateWithData:](self->_dataAggregator, "updateWithData:", v9);
          -[STUIStatusBarDataAggregator setOverlayData:](self->_dataAggregator, "setOverlayData:", v11);

          v5 = v11;
          goto LABEL_13;
        }
LABEL_9:
        v11 = v10;
        v9 = (void *)objc_msgSend(v10, "mutableCopy");
        goto LABEL_12;
      }
    }
    else
    {
      v10 = v11;
      if (v11)
        goto LABEL_9;
      v9 = 0;
    }
    v11 = v10;
    goto LABEL_12;
  }
LABEL_13:

}

- (STStatusBarData)overlayData
{
  return -[STUIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id VisualProviderClassForScreen;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  VisualProviderClassForScreen = STUIStatusBarGetVisualProviderClassForScreen(v10, 0);
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(VisualProviderClassForScreen, "intrinsicLockScreenContentSizeForOrientation:", a4);
  else
    objc_msgSend(VisualProviderClassForScreen, "intrinsicContentSizeForOrientation:", a4);
  v14 = v12;
  v15 = v13;
  if (v6)
  {
    objc_msgSend(a1, "_effectiveScaleForVisualProviderClass:targetScreen:", VisualProviderClassForScreen, v10);
    v15 = round(v15 * v16);
  }

  v17 = v14;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (double)_effectiveScaleForVisualProviderClass:(Class)a3 targetScreen:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = 1.0;
  if (-[objc_class scalesWithScreenNativeScale](a3, "scalesWithScreenNativeScale"))
  {
    objc_msgSend(v5, "_nativeScale");
    v8 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[objc_class referenceScreenScale](a3, "referenceScreenScale");
    else
      objc_msgSend(v5, "_scale");
    if (v8 != 0.0 && vabdd_f64(v9, v8) > 0.00000011920929)
      v6 = v9 / v8;
  }

  return v6;
}

- (NSDictionary)regions
{
  return self->_regions;
}

- (void)setHidden:(BOOL)a3 animationParameters:(id)a4
{
  _BOOL4 v4;
  id v6;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  int v8;
  STUIStatusBar *v9;
  STUIStatusBar *v10;
  $480163010D8600EFAA81F3B9B74CD7E7 v11;
  BOOL v12;
  STUIStatusBarVisualProvider *visualProvider;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v6 = a4;
  statusBarFlags = self->_statusBarFlags;
  if (((((*(_DWORD *)&statusBarFlags & 0x1000000) == 0) ^ v4) & 1) == 0)
  {
    if (v4)
      v8 = 0x1000000;
    else
      v8 = 0;
    self->_statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags & 0xFEFFFFFF | v8);
    v9 = self;
    v10 = v9;
    v11 = self->_statusBarFlags;
    if ((*(_DWORD *)&v11 & 0x80000) == 0)
      goto LABEL_8;
    if ((v9->_style & 0x3F) != 0)
    {
      if ((*(_DWORD *)&v11 & 0x800000) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      v12 = -[STUIStatusBar mode](v9, "mode") == 1;
    }
    else
    {
      v12 = 0;
    }

    visualProvider = v10->_visualProvider;
    if (visualProvider && !v12 && (*((_BYTE *)&self->_statusBarFlags + 2) & 8) != 0)
    {
      if (v4)
      {
        -[STUIStatusBarVisualProvider updateLumaTracking:](visualProvider, "updateLumaTracking:", 0);
      }
      else
      {
        objc_initWeak(&location, v10);
        v14 = (void *)*MEMORY[0x1E0DC4730];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __47__STUIStatusBar_setHidden_animationParameters___block_invoke;
        v15[3] = &unk_1E8D64228;
        objc_copyWeak(&v16, &location);
        objc_msgSend(v14, "_performBlockAfterCATransactionCommits:", v15);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_9:

}

- (void)setRegionActionValidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (STUIStatusBar)initWithStyle:(int64_t)a3
{
  char *v4;
  void *v5;
  unsigned int *v6;
  int v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  STUIStatusBarDataAggregator *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  STUIStatusBarActionGestureRecognizer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)STUIStatusBar;
  v4 = -[STUIStatusBar initWithFrame:](&v31, sel_initWithFrame_, 0.0, 0.0, 600.0, 50.0);
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unsigned int *)(v4 + 440);
  if (objc_msgSend(v5, "alwaysAutomaticStyle"))
    v7 = 0x800000;
  else
    v7 = 0;
  *v6 = *((_DWORD *)v4 + 110) & 0xFF7FFFFF | v7;

  if ((*v6 & 0x800000) != 0)
    v8 = 0;
  else
    v8 = a3;
  *((_QWORD *)v4 + 58) = v8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayItemStates:", v10);

  objc_msgSend(v4, "_setHostsLayoutEngine:", 1);
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forcedMode");

  if (v12 != -1)
    *((_QWORD *)v4 + 60) = v12;
  objc_initWeak(&location, v4);
  v13 = [STUIStatusBarDataAggregator alloc];
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __31__STUIStatusBar_initWithStyle___block_invoke;
  v28[3] = &unk_1E8D64478;
  objc_copyWeak(&v29, &location);
  v15 = -[STUIStatusBarDataAggregator initWithUpdateBlock:](v13, "initWithUpdateBlock:", v28);
  v16 = (void *)*((_QWORD *)v4 + 77);
  *((_QWORD *)v4 + 77) = v15;

  +[STUIStatusBarDataBroadcaster sharedInstance](STUIStatusBarDataBroadcaster, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerListener:", v4);

  v18 = -[STUIStatusBarActionGestureRecognizer initWithTarget:action:]([STUIStatusBarActionGestureRecognizer alloc], "initWithTarget:action:", v4, sel_statusBarGesture_);
  v19 = (void *)*((_QWORD *)v4 + 62);
  *((_QWORD *)v4 + 62) = v18;

  objc_msgSend(*((id *)v4 + 62), "setDelegate:", v4);
  objc_msgSend(*((id *)v4 + 62), "setAllowedPressTypes:", &unk_1E8D80390);
  objc_msgSend(*((id *)v4 + 62), "setAllowedTouchTypes:", &unk_1E8D803A8);
  objc_msgSend(v4, "addGestureRecognizer:", *((_QWORD *)v4 + 62));
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3410]), "initWithView:delegate:", v4, v4);
  v21 = (void *)*((_QWORD *)v4 + 74);
  *((_QWORD *)v4 + 74) = v20;

  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __31__STUIStatusBar_initWithStyle___block_invoke_48;
  v26[3] = &unk_1E8D644A0;
  objc_copyWeak(&v27, &location);
  v24 = (id)objc_msgSend(v4, "registerForTraitChanges:withHandler:", v23, v26);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  return (STUIStatusBar *)v4;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)setDisplayItemStates:(id)a3
{
  objc_storeStrong((id *)&self->_displayItemStates, a3);
}

void __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStatusBar:", v3);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

uint64_t __41__STUIStatusBar_Wrapper_forceUpdateData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_delayUpdatesWithKeys:(id)a3 fromAnimation:(id)a4
{
  STUIStatusBarDataAggregator *v6;
  id v7;
  void *v8;
  id v9;
  STUIStatusBarDataAggregator *v10;
  _QWORD v11[4];
  STUIStatusBarDataAggregator *v12;
  id v13;

  v6 = self->_dataAggregator;
  v7 = a4;
  -[STUIStatusBarDataAggregator beginDelayingUpdatesForEntryKeys:](v6, "beginDelayingUpdatesForEntryKeys:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__STUIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke;
  v11[3] = &unk_1E8D62C88;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "addTotalCompletionHandler:", v11);

}

- (void)_performAnimations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 1
          && (objc_msgSend(v9, "displayItemIdentifier"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              -[STUIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", v10),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v11, "visible"),
              v11,
              v10,
              !v12))
        {
          objc_msgSend(v9, "cancel");
        }
        else
        {
          objc_msgSend(v9, "performForStatusBar:", self);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)layoutSubviews
{
  id v3;
  NSDictionary *regions;
  id v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBar;
  v3 = -[STUIStatusBar layoutSubviews](&v7, sel_layoutSubviews);
  __31__STUIStatusBar_layoutSubviews__block_invoke((uint64_t)v3, self->_foregroundView);
  regions = self->_regions;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__STUIStatusBar_layoutSubviews__block_invoke_2;
  v6[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24lu32l8;
  v6[4] = &__block_literal_global_120;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[UIView layoutIfNeeded](self->_foregroundView, "layoutIfNeeded");
  if ((*(_DWORD *)&self->_statusBarFlags & 0x400008) == 0)
    v5 = -[STUIStatusBar _rearrangeOverflowedItems](self, "_rearrangeOverflowedItems");
  -[STUIStatusBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)_rearrangeOverflowedItems
{
  NSDictionary *regions;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  CGRect v15;

  -[STUIStatusBar frame](self, "frame");
  if (CGRectIsEmpty(v15))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = 0;
  regions = self->_regions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__STUIStatusBar__rearrangeOverflowedItems__block_invoke;
  v8[3] = &unk_1E8D64558;
  v8[4] = self;
  v8[5] = &v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = (void *)v10[5];
  if (v5)
  {
    objc_msgSend(v5, "updateToNextEnabledPlacement");
    -[STUIStatusBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[STUIStatusBar setNeedsLayout](self, "setNeedsLayout");
    v6 = (void *)v10[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (void)_setAutomaticStyle:(int64_t)a3 additionalStylesForRegionIdentifiers:(id)a4
{
  id v6;
  NSDictionary **p_automaticStyleOutliers;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  STUIStatusBar *v30;
  STUIStatusBar *v31;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  id obj;
  int64_t automaticStyle;
  int64_t v39;
  STUIStatusBar *v40;
  _QWORD aBlock[5];
  BOOL v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  obj = a4;
  v6 = a4;
  automaticStyle = self->_automaticStyle;
  if (automaticStyle != a3)
    self->_automaticStyle = a3;
  v39 = a3;
  v40 = self;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  p_automaticStyleOutliers = &self->_automaticStyleOutliers;
  v8 = self->_automaticStyleOutliers;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](*p_automaticStyleOutliers, "objectForKeyedSubscript:", v14, obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17 || objc_msgSend(v17, "integerValue") != v16)
        {
          -[STUIStatusBar regionWithIdentifier:](v40, "regionWithIdentifier:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setAutomaticStyle:", 4);

          v11 = 1;
        }

      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](*p_automaticStyleOutliers, "objectForKeyedSubscript:", v25, obj);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "integerValue");

        if (!v26 || v28 != objc_msgSend(v26, "integerValue"))
        {
          -[STUIStatusBar regionWithIdentifier:](v40, "regionWithIdentifier:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setAutomaticStyle:", v28);

          v11 = 1;
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v22);
  }

  objc_storeStrong((id *)p_automaticStyleOutliers, obj);
  if (automaticStyle != v39 || (v11 & 1) != 0)
  {
    v30 = v40;
    v31 = v30;
    statusBarFlags = v30->_statusBarFlags;
    if ((*(_DWORD *)&statusBarFlags & 0x80000) == 0)
    {
LABEL_30:

      goto LABEL_38;
    }
    if ((v30->_style & 0x3F) != 0)
    {
      if ((*(_DWORD *)&statusBarFlags & 0x800000) == 0)
        goto LABEL_30;
      v33 = -[STUIStatusBar mode](v30, "mode");

      if (v33 == 1)
        goto LABEL_38;
    }
    else
    {

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__STUIStatusBar__setAutomaticStyle_additionalStylesForRegionIdentifiers___block_invoke;
    aBlock[3] = &unk_1E8D64840;
    v42 = automaticStyle != v39;
    aBlock[4] = v31;
    v43 = v11 & 1;
    v34 = _Block_copy(aBlock);
    if (-[STUIStatusBar areAnimationsEnabled](v31, "areAnimationsEnabled")
      && (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock") & 1) == 0)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CD8]), "initWithDefaultParameters");
      objc_msgSend(v35, "duration");
      objc_msgSend(v35, "setDuration:", v36 * 0.6);
      objc_msgSend(MEMORY[0x1E0DC3CB8], "animateWithParameters:fromCurrentState:animations:completion:", v35, 1, v34, 0);

    }
    else
    {
      -[STUIStatusBar _performWithInheritedAnimation:](v31, "_performWithInheritedAnimation:", v34, obj);
    }

  }
LABEL_38:

}

- (id)regionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stateForDisplayItemWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_displayItemStates, "objectForKeyedSubscript:", a3);
}

- (unsigned)animationContextId
{
  void *v2;
  unsigned int v3;

  -[STUIStatusBar window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_contextId");

  return v3;
}

void __31__STUIStatusBar_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

void __31__STUIStatusBar_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_is_needsLayout"))
  {
    objc_msgSend(v3, "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

uint64_t __51__STUIStatusBar__updateWithData_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "updateWithData:", *(_QWORD *)(a1 + 40));
}

- (void)setTargetScreen:(id)a3
{
  objc_storeStrong((id *)&self->_targetScreen, a3);
}

- (UIGestureRecognizer)actionGestureRecognizer
{
  return self->_actionGestureRecognizer;
}

- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded
{
  STUIStatusBarVisualProvider *visualProvider;
  void *v4;

  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    if (-[STUIStatusBarVisualProvider supportsIndirectPointerTouchActions](visualProvider, "supportsIndirectPointerTouchActions"))v4 = &unk_1E8D803C0;
    else
      v4 = &unk_1E8D803A8;
    -[UIGestureRecognizer setAllowedTouchTypes:](self->_actionGestureRecognizer, "setAllowedTouchTypes:", v4);
  }
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSDictionary *regions;
  uint64_t v19;
  id v20;
  void *v21;
  NSArray *v22;
  NSArray *obj;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v22 = (NSArray *)a3;
  if (self->_enabledPartIdentifiers != v22)
  {
    objc_storeStrong((id *)&self->_enabledPartIdentifiers, a3);
    -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v21 = (void *)v5;
      v6 = (void *)MEMORY[0x1E0C99E20];
      -[NSDictionary allKeys](self->_regions, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = v22;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", v12, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v29 != v15)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "identifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "removeObject:", v17);

                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              }
              while (v14);
            }

          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v9);
      }

    }
    else
    {
      v8 = (void *)v5;
    }
    regions = self->_regions;
    v19 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke;
    v25[3] = &unk_1E8D64558;
    v20 = v8;
    v26 = v20;
    v27 = &v36;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (*((_BYTE *)v37 + 24))
    {
      if ((*((_BYTE *)&self->_statusBarFlags + 2) & 2) != 0)
        -[STUIStatusBarVisualProvider statusBarEnabledPartsUpdated](self->_visualProvider, "statusBarEnabledPartsUpdated");
      v24[0] = v19;
      v24[1] = 3221225472;
      v24[2] = __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke_2;
      v24[3] = &unk_1E8D62A38;
      v24[4] = self;
      -[STUIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v24);
    }

    _Block_object_dispose(&v36, 8);
  }

}

void __36__STUIStatusBar_resetVisualProvider__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99E40];
  v4 = a3;
  objc_msgSend(v3, "orderedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayItems:", v5);

}

uint64_t __53__STUIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endDelayingUpdates:", *(_QWORD *)(a1 + 40));
}

- (NSMutableDictionary)displayItemStates
{
  return self->_displayItemStates;
}

- (id)displayItemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        -[STUIStatusBarVisualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:](self->_visualProvider, "orderedDisplayItemPlacementsInRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)reinitializeStatusBar
{
  UIView **p_foregroundView;
  void *v4;
  UIPointerInteraction *pointerInteraction;
  UIView *v6;
  STUIStatusBarVisualProvider *visualProvider;
  void *v8;
  STUIStatusBarDataAggregator *v9;
  STUIStatusBarDataAggregator *v10;
  STUIStatusBarDataAggregator *dataAggregator;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSDictionary *regions;
  id v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  NSArray *obj;
  _QWORD v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[4];
  id v61;
  id location;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  p_foregroundView = &self->_foregroundView;
  -[UIView removeFromSuperview](self->_foregroundView, "removeFromSuperview");
  -[STUIStatusBar foregroundView](self, "foregroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", self->_pointerInteraction);

  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = 0;

  v6 = *p_foregroundView;
  *p_foregroundView = 0;

  visualProvider = self->_visualProvider;
  self->_visualProvider = 0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar setItems:](self, "setItems:", v8);

  -[STUIStatusBar resetVisualProvider](self, "resetVisualProvider");
  objc_initWeak(&location, self);
  v9 = [STUIStatusBarDataAggregator alloc];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke;
  v60[3] = &unk_1E8D64478;
  objc_copyWeak(&v61, &location);
  v10 = -[STUIStatusBarDataAggregator initWithUpdateBlock:](v9, "initWithUpdateBlock:", v60);
  dataAggregator = self->_dataAggregator;
  self->_dataAggregator = v10;

  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  if (self->_enabledPartIdentifiers)
  {
    v12 = (void *)MEMORY[0x1E0C99E20];
    -[NSDictionary allKeys](self->_regions, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = self->_enabledPartIdentifiers;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v53 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v49 != v21)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "identifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "removeObject:", v23);

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
            }
            while (v20);
          }

        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      }
      while (v15);
    }

    regions = self->_regions;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke_2;
    v45[3] = &unk_1E8D64558;
    v25 = v14;
    v46 = v25;
    v47 = &v56;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v45);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = self->_disabledPartIdentifiers;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v30, 1, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v63, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v38;
          do
          {
            for (m = 0; m != v32; ++m)
            {
              if (*(_QWORD *)v38 != v33)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "disableWithToken:", 2);
              *((_BYTE *)v57 + 24) = 1;
            }
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v63, 16);
          }
          while (v32);
        }

      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
    }
    while (v27);
  }

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke_3;
  v36[3] = &unk_1E8D62AF8;
  v36[4] = self;
  v36[5] = &v56;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v36);
  _Block_object_dispose(&v56, 8);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)resetVisualProvider
{
  NSDictionary *regions;
  NSMutableDictionary *v4;
  NSMutableDictionary *displayItemStates;

  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_regions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_94);
  regions = self->_regions;
  self->_regions = (NSDictionary *)MEMORY[0x1E0C9AA70];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  displayItemStates = self->_displayItemStates;
  self->_displayItemStates = v4;

}

- (void)setOrientation:(int64_t)a3
{
  STUIStatusBarVisualProvider *visualProvider;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    visualProvider = self->_visualProvider;
    if (visualProvider)
    {
      if ((*(_BYTE *)&self->_statusBarFlags & 0x20) != 0)
        -[STUIStatusBarVisualProvider orientationUpdatedFromOrientation:](visualProvider, "orientationUpdatedFromOrientation:");
    }
  }
  *(_DWORD *)&self->_statusBarFlags |= 1u;
}

uint64_t __38__STUIStatusBar_reinitializeStatusBar__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_prepareVisualProviderIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && (*(_BYTE *)(v2 + 442) & 2) != 0)
  {
    objc_msgSend(*(id *)(v2 + 432), "statusBarEnabledPartsUpdated");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v2, "currentAggregatedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "updateWithData:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (NSMutableDictionary)items
{
  return self->_items;
}

uint64_t __94__STUIStatusBar_Wrapper__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "styleDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = 1;
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "statusBarShouldDisableRegionActions:", WeakRetained) ^ 1;

  return v4;
}

void __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setStyle:forPartWithIdentifier:", objc_msgSend(a3, "integerValue"), v5);

}

uint64_t __64__STUIStatusBar_Wrapper_setForegroundAlpha_animationParameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __37__STUIStatusBar_Wrapper_forceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", 0, 1);
}

void ___STUIStatusBar_Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SystemStatusUI", "STUIStatusBarLog");
  v1 = (void *)_STUIStatusBar_Log___StatusBar_LOG;
  _STUIStatusBar_Log___StatusBar_LOG = (uint64_t)v0;

}

void ___STUIStatusBar_BackgroundActivity_Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SystemStatusUI", "BackgroundActivityLog");
  v1 = (void *)_STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG;
  _STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG = (uint64_t)v0;

}

+ (id)stringForStatusBarStyle:(int64_t)a3
{
  id result;
  __CFString *v4;

  result = 0;
  switch(a3)
  {
    case 0:
      result = CFSTR("_UIStatusBarResolvedStyleDefault");
      break;
    case 1:
      result = CFSTR("_UIStatusBarResolvedStyleLightContent");
      break;
    case 2:
      result = CFSTR("_UIStatusBarResolvedStyleDarkContent");
      break;
    case 3:
      return result;
    case 4:
      result = CFSTR("_UIStatusBarResolvedStyleInherited");
      break;
    default:
      v4 = CFSTR("_UIStatusBarResolvedStyleAutomaticWithDarkBias");
      if (a3 != 128)
        v4 = 0;
      if (a3 == 64)
        result = CFSTR("_UIStatusBarResolvedStyleAutomaticWithLightBias");
      else
        result = v4;
      break;
  }
  return result;
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = _MergedGlobals_7;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_13);
  v8 = (void *)qword_1EDBEE090;
  sensorActivityScreenIdentifier(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v7, v9);
}

void __59__STUIStatusBar_registerSensorActivityIndicator_forScreen___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EDBEE090;
  qword_1EDBEE090 = v0;

}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1EDBEE090;
  sensorActivityScreenIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_forceLayoutEngineSolutionInRationalEdges
{
  return 1;
}

void __31__STUIStatusBar_initWithStyle___block_invoke_48(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__STUIStatusBar_initWithStyle___block_invoke_2;
  v3[3] = &unk_1E8D62A38;
  v4 = WeakRetained;
  v2 = WeakRetained;
  objc_msgSend(v2, "_performWithInheritedAnimation:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[STUIStatusBarDataBroadcaster sharedInstance](STUIStatusBarDataBroadcaster, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar;
  -[STUIStatusBar dealloc](&v4, sel_dealloc);
}

- (void)updateForDataChange:(id)a3
{
  -[STUIStatusBar _updateWithData:completionHandler:](self, "_updateWithData:completionHandler:", self->_currentData, 0);
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBar descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBar debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)_expandedDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBar _expandedDescriptionBuilderWithMultilinePrefix:](self, "_expandedDescriptionBuilderWithMultilinePrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setVisualProviderClassName:(id)a3
{
  if (a3)
    a3 = NSClassFromString((NSString *)a3);
  -[STUIStatusBar _setVisualProviderClass:](self, "_setVisualProviderClass:", a3);
}

- (NSString)_visualProviderClassName
{
  objc_class *v2;

  v2 = -[STUIStatusBar _visualProviderClass](self, "_visualProviderClass");
  if (v2)
  {
    NSStringFromClass(v2);
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

void __38__STUIStatusBar_reinitializeStatusBar__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(v7, "disableWithToken:", 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)setMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  int64_t mode;
  _QWORD v8[5];

  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forcedMode");

  if (v6 == -1)
  {
    mode = self->_mode;
    if (mode != a3)
    {
      self->_mode = a3;
      if (self->_visualProvider)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __25__STUIStatusBar_setMode___block_invoke;
        v8[3] = &unk_1E8D62A38;
        v8[4] = self;
        -[STUIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v8);
        if ((*(_BYTE *)&self->_statusBarFlags & 0x10) != 0)
          -[STUIStatusBarVisualProvider modeUpdatedFromMode:](self->_visualProvider, "modeUpdatedFromMode:", mode);
      }
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
}

uint64_t __25__STUIStatusBar_setMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

- (void)setAvoidanceFrame:(CGRect)a3
{
  -[STUIStatusBar setAvoidanceFrame:animationSettings:options:](self, "setAvoidanceFrame:animationSettings:options:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __26__STUIStatusBar_setStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  id *v3;
  int v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = (id *)WeakRetained;
    v3 = v2;
    v4 = *((_DWORD *)v2 + 110);
    if ((v4 & 0x80000) != 0)
    {
      if (((_BYTE)v2[58] & 0x3F) != 0)
      {
        if ((v4 & 0x800000) == 0)
          goto LABEL_5;
        v5 = objc_msgSend(v2, "mode");

        WeakRetained = v6;
        if (v5 == 1)
          goto LABEL_7;
      }
      else
      {

        WeakRetained = v6;
      }
      if ((*((_BYTE *)v3 + 443) & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v3[54], "updateLumaTracking:", 1);
      goto LABEL_6;
    }
LABEL_5:

LABEL_6:
    WeakRetained = v6;
  }
LABEL_7:

}

uint64_t __36__STUIStatusBar_setForegroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

void __47__STUIStatusBar_setHidden_animationParameters___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  id *v3;
  int v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = (id *)WeakRetained;
    v3 = v2;
    v4 = *((_DWORD *)v2 + 110);
    if ((v4 & 0x80000) != 0)
    {
      if (((_BYTE)v2[58] & 0x3F) != 0)
      {
        if ((v4 & 0x800000) == 0)
          goto LABEL_5;
        v5 = objc_msgSend(v2, "mode");

        WeakRetained = v6;
        if (v5 == 1)
          goto LABEL_7;
      }
      else
      {

        WeakRetained = v6;
      }
      if ((*((_BYTE *)v3 + 443) & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v3[54], "updateLumaTracking:", 1);
      goto LABEL_6;
    }
LABEL_5:

LABEL_6:
    WeakRetained = v6;
  }
LABEL_7:

}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateForcingIterativeOverflow
{
  *(_DWORD *)&self->_statusBarFlags |= 0x400000u;
  -[STUIStatusBar updateWithAnimations:](self, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
  *(_DWORD *)&self->_statusBarFlags &= ~0x400000u;
}

void __44__STUIStatusBar__fixupDisplayItemAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isEnabled"))
  {
    objc_msgSend(v4, "displayItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_111);

  }
}

void __44__STUIStatusBar__fixupDisplayItemAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  __int128 v3;
  _OWORD v4[3];

  v2 = a2;
  objc_msgSend(v2, "setAlpha:", 1.0);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v4);

}

- (BOOL)_showSensorActivityIndicatorWithoutPortalView
{
  if ((*((_BYTE *)&self->_statusBarFlags + 2) & 0x10) != 0)
    return -[STUIStatusBarVisualProvider showSensorActivityIndicatorWithoutPortalView](self->_visualProvider, "showSensorActivityIndicatorWithoutPortalView");
  else
    return 0;
}

- (CGRect)_extendedHoverFrameForActionable:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "absoluteHoverFrame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (!CGRectIsNull(v24))
  {
    objc_msgSend(v4, "extendedHoverInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = -[STUIStatusBar effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v17 == 1)
      v18 = v16;
    else
      v18 = v12;
    if (v17 == 1)
      v19 = v12;
    else
      v19 = v16;
    x = x + v18;
    y = y + v10;
    width = width - (v18 + v19);
    height = height - (v10 + v14);
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideActionable:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[STUIStatusBar _frameForActionable:](self, "_frameForActionable:", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4
{
  double y;
  double x;
  id v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat width;
  CGFloat height;
  BOOL v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[STUIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v7);
  v8 = v16.origin.x;
  v9 = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16))
  {
    v12 = -[STUIStatusBar _cursorLocation:isInsideActionable:](self, "_cursorLocation:isInsideActionable:", v7, x, y);
  }
  else
  {
    v17.origin.x = v8;
    v17.origin.y = v9;
    v17.size.width = width;
    v17.size.height = height;
    v15.x = x;
    v15.y = y;
    v12 = CGRectContainsPoint(v17, v15);
  }
  v13 = v12;

  return v13;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int (**regionActionValidationBlock)(void);
  NSDictionary *regions;
  double x;
  double y;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, void *, _BYTE *);
  void *v26;
  STUIStatusBar *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  CGRect v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  regionActionValidationBlock = (unsigned int (**)(void))self->_regionActionValidationBlock;
  if (regionActionValidationBlock && !regionActionValidationBlock[2]())
  {
    v21 = 0;
  }
  else
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__6;
    v41 = __Block_byref_object_dispose__6;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__6;
    v35 = __Block_byref_object_dispose__6;
    regions = self->_regions;
    v36 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
    v26 = &unk_1E8D647F0;
    v27 = self;
    v28 = v9;
    v29 = &v37;
    v30 = &v31;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", &v23);
    if (v38[5])
    {
      -[STUIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v23, v24, v25, v26, v27);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
      if (CGRectIsNull(v43))
      {
        -[STUIStatusBar _pressFrameForActionable:](self, "_pressFrameForActionable:", v38[5]);
        x = v17;
        y = v18;
        width = v19;
        height = v20;
      }
      objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", v32[5], x, y, width, height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

  }
  return v21;
}

void __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;

  v23 = a3;
  v7 = objc_msgSend(v23, "isEnabled");
  v8 = v23;
  if (v7)
  {
    objc_msgSend(v23, "displayItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {

LABEL_17:
      v8 = v23;
      goto LABEL_18;
    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "location");
    v11 = (void *)objc_msgSend(v10, "_cursorLocation:isInsideActionable:", v23);

    v8 = v23;
    if ((_DWORD)v11)
    {
      objc_msgSend(v23, "displayItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2;
      v24[3] = &unk_1E8D647C8;
      v13 = *(void **)(a1 + 40);
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = v13;
      v26 = *(_OWORD *)(a1 + 48);
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(v23, "action");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEnabled");
        if ((v15 & 1) == 0)
        {
          objc_msgSend(v23, "hoverAction");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEnabled"))
            goto LABEL_14;
        }
        v16 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "location");
        if ((objc_msgSend(v16, "_cursorLocation:isInsideHoverableActionable:", v23) & 1) != 0)
        {
          objc_msgSend(v23, "contentView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "alpha");
          v19 = v18;

          if ((v15 & 1) == 0)
          if (v19 > 0.0)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
            objc_msgSend(v23, "identifier");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = v20;

            *a4 = 1;
          }
          goto LABEL_16;
        }
        if (!v15)
LABEL_14:

      }
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:

}

void __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v4;
  void *v8;
  char v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v15, "hoverAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEnabled") & 1) == 0)
    {

      goto LABEL_9;
    }
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v11 = objc_msgSend(v10, "_cursorLocation:isInsideHoverableActionable:", v15);
  if ((v9 & 1) != 0)
  {

    if (!v11)
      goto LABEL_9;
    goto LABEL_7;
  }

  if ((v11 & 1) != 0)
  {
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(v15, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_9:

}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "identifier", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
  {
    -[STUIStatusBar regionWithIdentifier:](self, "regionWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[STUIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeWeak((id *)&self->_hoveredActionable, v7);

  }
  else
  {
    objc_storeWeak((id *)&self->_hoveredActionable, 0);
  }

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  objc_storeWeak((id *)&self->_hoveredActionable, 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  STUIStatusBarActionable **p_hoveredActionable;
  id WeakRetained;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  char v37;
  void *v38;
  double v39;
  void *v40;
  CGRect v42;
  CGRect v43;

  p_hoveredActionable = &self->_hoveredActionable;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);
  objc_msgSend(WeakRetained, "hoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_hoveredActionable);
    objc_msgSend(v8, "absoluteHoverFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_loadWeakRetained((id *)p_hoveredActionable);
    v18 = objc_msgSend(v17, "hoverHighlightsAsRegion");

    v42.origin.x = v10;
    v42.origin.y = v12;
    v42.size.width = v14;
    v42.size.height = v16;
    if (CGRectIsNull(v42))
    {
      objc_msgSend(v7, "frame");
      v10 = v19;
      v12 = v20;
      v14 = v21;
      v16 = v22;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v7);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0.0;
LABEL_12:
        objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v25);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v24, v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      v27 = (void *)objc_opt_new();
      -[STUIStatusBar convertRect:toView:](self, "convertRect:toView:", v7, v10, v12, v14, v16);
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setVisiblePath:", v28);

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v7, v27);
      if ((v18 & 1) == 0)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBar visualProvider](self, "visualProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "conformsToProtocol:", &unk_1EFC15D28);

    if (v30)
    {
      -[STUIStatusBar visualProvider](self, "visualProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionCursorInsets");
      v10 = v10 + v32;
      v12 = v12 + v33;
      v14 = v14 - (v32 + v34);
      v16 = v16 - (v33 + v35);

      -[STUIStatusBar visualProvider](self, "visualProvider");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend((id)objc_opt_class(), "regionCursorIsPill");

      if ((v37 & 1) == 0)
      {
        -[STUIStatusBar visualProvider](self, "visualProvider");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "regionCursorCornerRadius");
        v25 = v39;

        goto LABEL_12;
      }
    }
    else
    {
      v10 = v10 + -8.0;
      v12 = v12 + -2.0;
      v14 = v14 + 16.0;
      v16 = v16 + 4.0;
    }
    v43.origin.x = v10;
    v43.origin.y = v12;
    v43.size.width = v14;
    v43.size.height = v16;
    v25 = CGRectGetHeight(v43) * 0.5;
    goto LABEL_12;
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (CGRect)_frameForActionable:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "actionInsets");
  -[STUIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_pressFrameForActionable:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[STUIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", a3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v5 = a3;
  objc_msgSend(v5, "layoutItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ui_bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "layoutItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_ui_view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:toView:", self, v8, v10, v12, v14);

  -[STUIStatusBar _currentScreenScale](self, "_currentScreenScale");
  UIRectIntegralWithScale();
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[STUIStatusBar _gestureRecognizer:touchInsideActionable:](self, "_gestureRecognizer:touchInsideActionable:", v6, v7)|| -[STUIStatusBar _gestureRecognizer:pressInsideActionable:](self, "_gestureRecognizer:pressInsideActionable:", v6, v7);

  return v8;
}

- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  -[STUIStatusBar _frameForActionable:](self, "_frameForActionable:", v6);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v21.origin.x = v12;
  v21.origin.y = v14;
  v21.size.width = v16;
  v21.size.height = v18;
  v20.x = v8;
  v20.y = v10;
  return CGRectContainsPoint(v21, v20);
}

- (BOOL)_gestureRecognizer:(id)a3 pressInsideActionable:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;

  v5 = a4;
  -[STUIStatusBar _focusSystem](self, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBar _pressFrameForActionable:](self, "_pressFrameForActionable:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "frame");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  LOBYTE(self) = CGRectContainsRect(v21, v22);

  return (char)self;
}

- (void)statusBarGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  STUIStatusBarActionable **p_targetActionable;
  id WeakRetained;
  _BOOL4 v9;
  id v10;
  id v11;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags;
  STUIStatusBarVisualProvider *visualProvider;
  id v14;
  void *v15;
  STUIStatusBarVisualProvider *v16;
  id v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "state");
  v5 = v4;
  v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 2)
  {
    if ((unint64_t)(v4 - 3) > 2)
    {
      v10 = 0;
      goto LABEL_19;
    }
    v10 = 0;
  }
  else
  {
    p_targetActionable = &self->_targetActionable;
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetActionable);
    v9 = -[STUIStatusBar _gestureRecognizer:isInsideActionable:](self, "_gestureRecognizer:isInsideActionable:", v18, WeakRetained);

    if (v9)
      v10 = objc_loadWeakRetained((id *)&self->_targetActionable);
    else
      v10 = 0;
    if (v6 <= 1)
    {
      v11 = objc_loadWeakRetained((id *)&self->_targetActionable);
      if (v11)
      {
        statusBarFlags = self->_statusBarFlags;

        if ((*(_WORD *)&statusBarFlags & 0x4000) != 0)
        {
          visualProvider = self->_visualProvider;
          v14 = objc_loadWeakRetained((id *)p_targetActionable);
          -[STUIStatusBarVisualProvider actionable:highlighted:initialPress:](visualProvider, "actionable:highlighted:initialPress:", v14, v10 != 0, v5 == 1);

        }
      }
      goto LABEL_19;
    }
    objc_msgSend(v10, "hoverAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (objc_msgSend(v10, "action"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[STUIStatusBar action](self, "action"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v15, "performWithStatusBar:completionHandler:", self, 0);

    }
  }
  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 0x40) != 0)
  {
    v16 = self->_visualProvider;
    v17 = objc_loadWeakRetained((id *)&self->_targetActionable);
    -[STUIStatusBarVisualProvider actionable:highlighted:initialPress:](v16, "actionable:highlighted:initialPress:", v17, 0, 0);

  }
  objc_storeWeak((id *)&self->_targetActionable, 0);
LABEL_19:

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSDictionary *regions;
  id v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_hoveredActionable);
    objc_storeWeak((id *)&self->_targetActionable, v6);

  }
  else
  {
    regions = self->_regions;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E8D64818;
    v11[4] = self;
    v12 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  v8 = objc_loadWeakRetained((id *)&self->_targetActionable);
  v9 = v8 != 0;

  return v9;
}

void __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  int v14;
  id obj;
  _QWORD v16[5];
  id v17;

  obj = a3;
  v6 = objc_msgSend(obj, "isEnabled");
  v7 = obj;
  if (v6)
  {
    objc_msgSend(obj, "displayItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {

LABEL_10:
      v7 = obj;
      goto LABEL_11;
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "_gestureRecognizer:isInsideActionable:", *(_QWORD *)(a1 + 40), obj);

    v7 = obj;
    if (v9)
    {
      objc_msgSend(obj, "displayItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke_2;
      v16[3] = &unk_1E8D63720;
      v11 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v11;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 568));
      if (WeakRetained)
      {

      }
      else
      {
        objc_msgSend(obj, "action");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEnabled");

        if (v14)
        {
          objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 568), obj);
          *a4 = 1;
        }
      }

      goto LABEL_10;
    }
  }
LABEL_11:

}

void __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id obj;

  obj = a2;
  objc_msgSend(obj, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEnabled"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_gestureRecognizer:isInsideActionable:", *(_QWORD *)(a1 + 40), obj);

    v8 = obj;
    if (v7)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 568), obj);
      v8 = obj;
      *a4 = 1;
    }
  }
  else
  {

    v8 = obj;
  }

}

- (id)actionForPartWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
  double vertical;
  double horizontal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setOffset:", horizontal, vertical);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  UIOffset result;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v8, "offsetable") & 1) != 0)
        {
          objc_msgSend(v8, "offset");
          v9 = v11;
          v10 = v12;

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }

  v9 = *MEMORY[0x1E0DC51A8];
  v10 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
LABEL_11:
  v13 = v9;
  v14 = v10;
  result.vertical = v14;
  result.horizontal = v13;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAlpha:", a3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (double)alphaForPartWithIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v5 = 1.0;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "contentView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "alpha");
          v5 = v12;

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __48__STUIStatusBar_setStyle_forPartWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "styleAttributes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v2, MEMORY[0x1E0C9AA60]);

}

void __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  v6 = objc_msgSend(v7, "isEnabled");
  if ((_DWORD)v4)
  {
    if (v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v7, "disableWithToken:", 1);
  }
  else
  {
    if ((v6 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v7, "enableWithToken:", 1);
  }

}

uint64_t __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  NSArray **p_disabledPartIdentifiers;
  id obj;
  NSArray *v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_disabledPartIdentifiers != v5)
  {
    obj = a3;
    -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
    p_disabledPartIdentifiers = &self->_disabledPartIdentifiers;
    v32 = v5;
    -[NSArray arrayByExcludingObjectsInArray:](self->_disabledPartIdentifiers, "arrayByExcludingObjectsInArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v12, 1, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v43 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "enableWithToken:", 2);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
            }
            while (v15);
            v9 = 1;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    -[NSArray arrayByExcludingObjectsInArray:](v32, "arrayByExcludingObjectsInArray:", *p_disabledPartIdentifiers);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_disabledPartIdentifiers, obj);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v24, 1, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v35;
            do
            {
              for (m = 0; m != v27; ++m)
              {
                if (*(_QWORD *)v35 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "disableWithToken:", 2);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
            }
            while (v27);
            v9 = 1;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v21);
    }

    v5 = v32;
    if ((v9 & 1) != 0)
    {
      if ((*((_BYTE *)&self->_statusBarFlags + 2) & 2) != 0)
        -[STUIStatusBarVisualProvider statusBarEnabledPartsUpdated](self->_visualProvider, "statusBarEnabledPartsUpdated");
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __44__STUIStatusBar_setDisabledPartIdentifiers___block_invoke;
      v33[3] = &unk_1E8D62A38;
      v33[4] = self;
      -[STUIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v33);
    }

  }
}

uint64_t __44__STUIStatusBar_setDisabledPartIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
}

- (CGRect)frameForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CGFloat *v7;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect result;
  CGRect v78;
  CGRect v79;

  v4 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (CGFloat *)MEMORY[0x1E0C9D628];
  if ((*(_BYTE *)&self->_statusBarFlags & 1) != 0)
  {
    -[STUIStatusBar layoutIfNeeded](self, "layoutIfNeeded");
    *(_DWORD *)&self->_statusBarFlags &= ~1u;
  }
  x = *v7;
  y = v7[1];
  width = v7[2];
  height = v7[3];
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("clockPartIdentifier"))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v67 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v17, "layoutItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[STUIStatusBarVisualProvider clockBoundsForLayoutItem:](self->_visualProvider, "clockBoundsForLayoutItem:", v17);
          else
            objc_msgSend(v18, "_ui_bounds");
          v23 = v19;
          v24 = v20;
          v25 = v21;
          v26 = v22;
          objc_msgSend(v18, "_ui_view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v27, v23, v24, v25, v26);
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;

          v73.origin.x = x;
          v73.origin.y = y;
          v73.size.width = width;
          v73.size.height = height;
          v78.origin.x = v29;
          v78.origin.y = v31;
          v78.size.width = v33;
          v78.size.height = v35;
          v74 = CGRectUnion(v73, v78);
          x = v74.origin.x;
          y = v74.origin.y;
          width = v74.size.width;
          height = v74.size.height;

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v14);
    }
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "layoutItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "_ui_bounds");
          v42 = v41;
          v44 = v43;
          v46 = v45;
          v48 = v47;
          objc_msgSend(v40, "_ui_view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v49, v42, v44, v46, v48);
          v51 = v50;
          v53 = v52;
          v55 = v54;
          v57 = v56;

          v75.origin.x = x;
          v75.origin.y = y;
          v75.size.width = width;
          v75.size.height = height;
          v79.origin.x = v51;
          v79.origin.y = v53;
          v79.size.width = v55;
          v79.size.height = v57;
          v76 = CGRectUnion(v75, v79);
          x = v76.origin.x;
          y = v76.origin.y;
          width = v76.size.width;
          height = v76.size.height;

        }
        v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v37);
    }
  }

  v58 = x;
  v59 = y;
  v60 = width;
  v61 = height;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[STUIStatusBar frameForPartWithIdentifier:includeInternalItems:](self, "frameForPartWithIdentifier:includeInternalItems:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (NSString)sensorActivityIndicatorPartIdentifier
{
  return (NSString *)CFSTR("trailingPartIdentifier");
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:", a3, a4, a5, 1);
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSSet)dependentDataEntryKeys
{
  void *v3;
  NSMutableDictionary *displayItemStates;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  displayItemStates = self->_displayItemStates;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__STUIStatusBar_dependentDataEntryKeys__block_invoke;
  v9[3] = &unk_1E8D62E40;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayItemStates, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

void __39__STUIStatusBar_dependentDataEntryKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemWithIdentifier:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "dependentEntryKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[STUIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  -[STUIStatusBar window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  if (v3)
    v5 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "_sceneInterfaceOrientationFromWindow:", v3);
  else
    v5 = 0;
  objc_msgSend(v4, "intrinsicContentSizeForOrientation:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)itemsDependingOnKeys:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *items;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__STUIStatusBar_itemsDependingOnKeys___block_invoke;
  v12[3] = &unk_1E8D64868;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](items, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __38__STUIStatusBar_itemsDependingOnKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "dependentEntryKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (CGRect)frameForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableDictionary *items;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  -[STUIStatusBar layoutIfNeeded](self, "layoutIfNeeded");
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  items = self->_items;
  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](items, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "displayItemForIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alpha");
      if (v15 > 0.0)
      {
        objc_msgSend(v14, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "bounds");
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v14);
          v5 = v17;
          v6 = v18;
          v7 = v19;
          v8 = v20;
        }
      }

    }
  }

  v21 = v5;
  v22 = v6;
  v23 = v7;
  v24 = v8;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)itemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar displayItemIdentifiersInRegionsWithIdentifiers:](self, "displayItemIdentifiersInRegionsWithIdentifiers:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__STUIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E8D64890;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

void __57__STUIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)dataEntryKeysForItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[STUIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dependentEntryKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  void *v4;
  BOOL v5;

  -[STUIStatusBar traitCollection](self, "traitCollection", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") != 3;

  return v5;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a4.y;
  x = a4.x;
  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[STUIStatusBar regions](self, "regions", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEnabled"))
        {
          objc_msgSend(v12, "displayItemForHUDAtLocation:", x, y);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_respondsToSelector();

            if ((v16 & 1) != 0)
              goto LABEL_13;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  v14 = 0;
LABEL_13:

  objc_msgSend(v14, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessibilityHUDRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4
{
  return self->_actionGestureRecognizer != a4;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[STUIStatusBar traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  -[STUIStatusBar _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showAccessibilityHUDItem:forView:", v5, self);

}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3;

  -[STUIStatusBar _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dismissAccessibilityHUD");

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBar succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_visualProvider, CFSTR("visualProvider"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBar descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBar _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBar _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;

  v4 = a4;
  -[STUIStatusBar succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseDebugDescription:", v4);
  return v5;
}

- (id)_expandedDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STUIStatusBar *v11;

  -[STUIStatusBar _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeMultilinePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D62C88;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

  v7 = v6;
  return v7;
}

void __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke_2;
  v26 = &unk_1E8D62C88;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v27 = v4;
  v28 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("layout"), v3, &v23);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "enabledPartIdentifiers", v23, v24, v25, v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("enabledPartIdentifiers"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "disabledPartIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("disabledPartIdentifiers"), 1);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "styleAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("styleAttributes"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "regions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendDictionarySection:withName:skipIfEmpty:", v14, CFSTR("regions"), 1);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "appendObject:withName:", v16, CFSTR("currentData"));

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "overlayData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "appendObject:withName:skipIfNil:", v19, CFSTR("overlayData"), 1);

  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayItemStates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendDictionarySection:withName:skipIfEmpty:", v22, CFSTR("displayItemStates"), 1);

}

void __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("frame"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "avoidanceFrame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("avoidanceFrame"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "orientation");
  BSInterfaceOrientationDescription();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("orientation"));

}

- (UIScreen)targetScreen
{
  return self->_targetScreen;
}

- (void)setVisualProviderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_visualProviderInfo, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (int64_t)automaticStyle
{
  return self->_automaticStyle;
}

- (void)setAutomaticStyle:(int64_t)a3
{
  self->_automaticStyle = a3;
}

- (NSDictionary)automaticStyleOutliers
{
  return self->_automaticStyleOutliers;
}

- (void)setAutomaticStyleOutliers:(id)a3
{
  objc_storeStrong((id *)&self->_automaticStyleOutliers, a3);
}

- (STUIStatusBarActionable)targetActionable
{
  return (STUIStatusBarActionable *)objc_loadWeakRetained((id *)&self->_targetActionable);
}

- (void)setTargetActionable:(id)a3
{
  objc_storeWeak((id *)&self->_targetActionable, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (STUIStatusBarActionable)hoveredActionable
{
  return (STUIStatusBarActionable *)objc_loadWeakRetained((id *)&self->_hoveredActionable);
}

- (void)setHoveredActionable:(id)a3
{
  objc_storeWeak((id *)&self->_hoveredActionable, a3);
}

- (UIAccessibilityHUDGestureManager)accessibilityHUDGestureManager
{
  return self->_accessibilityHUDGestureManager;
}

- (void)setAccessibilityHUDGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, a3);
}

- (Class)_visualProviderClass
{
  return self->_visualProviderClass;
}

- (void)_setVisualProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_visualProviderClass, a3);
}

- (STUIStatusBarDataAggregator)dataAggregator
{
  return self->_dataAggregator;
}

- (STUIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)regionActionValidationBlock
{
  return self->_regionActionValidationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regionActionValidationBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_dataAggregator, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_visualProviderClass, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, 0);
  objc_destroyWeak((id *)&self->_hoveredActionable);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_targetActionable);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayItemStates, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_automaticStyleOutliers, 0);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_visualProviderInfo, 0);
  objc_storeStrong((id *)&self->_targetScreen, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_currentAggregatedData, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
}

@end
