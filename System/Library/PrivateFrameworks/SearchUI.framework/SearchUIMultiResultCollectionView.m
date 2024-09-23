@implementation SearchUIMultiResultCollectionView

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  +[SearchUIAppIconUtilities preferredHorizontalPlatterInsetForAppIcons](SearchUIAppIconUtilities, "preferredHorizontalPlatterInsetForAppIcons", a3, a4, a5);
  v6 = v5;
  if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
  {
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    v6 = v6 + v7;
  }
  +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell](SearchUIAppIconUtilities, "distanceToTopOfAppIconsForMultiResultCell");
  v9 = v6;
  v10 = v8;
  v11 = v6;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SearchUIMultiResultCollectionView visibleResults](self, "visibleResults", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("multicell"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMultiResultCollectionView visibleResults](self, "visibleResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithResult:", v10);

  -[SearchUIMultiResultCollectionView feedbackDelegate](self, "feedbackDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appIconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFeedbackDelegate:", v11);

  objc_msgSend(v8, "appIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEngagementDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier:ResultCell,Section:%ld,Row:%ld"), objc_msgSend(v6, "section"), objc_msgSend(v6, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v14);

  if (-[SearchUIMultiResultCollectionView highlightFirstCell](self, "highlightFirstCell"))
    v15 = objc_msgSend(v6, "item") == 0;
  else
    v15 = 0;
  objc_msgSend(v8, "appIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAddRoundedKeyboardHighlight:", v15);

  objc_msgSend(v7, "collectionViewLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "minimumInteritemSpacing");
  v19 = v18;
  objc_msgSend(v17, "minimumLineSpacing");
  objc_msgSend(v8, "setHoverHighlightMargins:", v19, v20);

  return v8;
}

- (NSArray)visibleResults
{
  return (NSArray *)objc_getProperty(self, a2, 3296, 1);
}

- (BOOL)highlightFirstCell
{
  return self->_highlightFirstCell;
}

- (SearchUIFeedbackDelegateInternal)feedbackDelegate
{
  return (SearchUIFeedbackDelegateInternal *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToArray:", v6);

  if ((v7 & 1) == 0)
  {
    -[SearchUIMultiResultCollectionView setRowModel:](self, "setRowModel:", v8);
    -[SearchUIMultiResultCollectionView updateCountsAnimated:](self, "updateCountsAnimated:", 0);
  }

}

- (void)updateCountsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v3 = a3;
  v5 = -[SearchUIMultiResultCollectionView isExpanded](self, "isExpanded");
  -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = +[SearchUIAppIconUtilities numberOfAppIconsPerRow](SearchUIAppIconUtilities, "numberOfAppIconsPerRow");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v7, "subarrayWithRange:", 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  -[SearchUIMultiResultCollectionView visibleCells](self, "visibleCells");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v38 = v15;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[SearchUIMultiResultCollectionView visibleResults](self, "visibleResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v34 = v17;
  if (v36[3] && v32[3])
  {
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke;
    aBlock[3] = &unk_1EA1F6D80;
    v29 = &v35;
    aBlock[4] = self;
    v30 = &v31;
    v28 = v7;
    v19 = _Block_copy(aBlock);
    v20 = v19;
    if (v3)
    {
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_2;
      v25[3] = &unk_1EA1F6DA8;
      v26 = v19;
      -[SearchUIMultiResultCollectionView performBatchUpdates:completion:](self, "performBatchUpdates:completion:", v25, 0);
      v21 = v26;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0DC3F10];
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_3;
      v23[3] = &unk_1EA1F6908;
      v23[4] = self;
      v24 = v19;
      objc_msgSend(v22, "performWithoutAnimation:", v23);
      v21 = v24;
    }

  }
  else
  {
    -[SearchUIMultiResultCollectionView setVisibleResults:](self, "setVisibleResults:", v7);
    -[SearchUIMultiResultCollectionView reloadData](self, "reloadData");
    -[SearchUIMultiResultCollectionView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

- (SearchUIMultiResultRowModel)rowModel
{
  return (SearchUIMultiResultRowModel *)objc_getProperty(self, a2, 3288, 1);
}

- (void)setVisibleResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 3296);
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setRowModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 3288);
}

- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  self->_isExpanded = a3;
  -[SearchUIMultiResultCollectionView updateCountsAnimated:](self, "updateCountsAnimated:", a4);
}

- (void)setHighlightFirstCell:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMultiResultCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAddRoundedKeyboardHighlight:", v3);

  self->_highlightFirstCell = v3;
}

- (SearchUIMultiResultCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  SearchUIMultiResultCollectionView *v4;
  SearchUIMultiResultCollectionView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIMultiResultCollectionView;
  v4 = -[SearchUIMultiResultCollectionView initWithFrame:collectionViewLayout:](&v9, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[SearchUIMultiResultCollectionView setDataSource:](v4, "setDataSource:", v4);
    -[SearchUIMultiResultCollectionView setDelegate:](v5, "setDelegate:", v5);
    -[SearchUIMultiResultCollectionView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[SearchUIMultiResultCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("multicell"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_deleteIcon_, *MEMORY[0x1E0DAAA20], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_hideIcon_, CFSTR("SearchUIHomeScreenAppIconViewDidHideIconNotification"), 0);

  }
  return v5;
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier](SearchUIUtilities, "focusGroupIdentifier");
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previouslyFocusedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {

LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)SearchUIMultiResultCollectionView;
    v9 = -[SearchUIMultiResultCollectionView shouldUpdateFocusInContext:](&v11, sel_shouldUpdateFocusInContext_, v4);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "focusHeading");

  if (v7 != 1)
    goto LABEL_5;
  objc_msgSend(v4, "nextFocusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAddRoundedKeyboardHighlight:", 0);

  -[SearchUIMultiResultCollectionView didUpdateKeyboardFocusToResult:cardSection:](self, "didUpdateKeyboardFocusToResult:cardSection:", 0, 0);
  v9 = 0;
LABEL_6:

  return v9;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUIMultiResultCollectionView feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUIMultiResultCollectionView feedbackDelegate](self, "feedbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateKeyboardFocusToResult:cardSection:", v10, v6);

  }
  -[SearchUIMultiResultCollectionView setHighlightFirstCell:](self, "setHighlightFirstCell:", 0);

}

- (void)hideIcon:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SearchUIHomeScreenAppIconViewBundleIdUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIMultiResultCollectionView removeIconWithBundleIdentifier:](self, "removeIconWithBundleIdentifier:", v5);
}

- (void)deleteIcon:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DAABC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIMultiResultCollectionView removeIconWithBundleIdentifier:](self, "removeIconWithBundleIdentifier:", v6);
}

- (void)removeIconWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[SearchUIMultiResultCollectionView visibleResults](self, "visibleResults", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(v10, "applicationBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v10;

      if (!v13)
        goto LABEL_19;
      -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count") == 1)
      {
        -[SearchUIMultiResultCollectionView feedbackDelegate](self, "feedbackDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          -[SearchUIMultiResultCollectionView feedbackDelegate](self, "feedbackDelegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeRowModel:completion:", v19, 0);

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {

      }
      -[SearchUIMultiResultCollectionView rowModel](self, "rowModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "removeResult:", v13);

      -[SearchUIMultiResultCollectionView visibleResults](self, "visibleResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v22, "mutableCopy");

      objc_msgSend(v18, "removeObject:", v13);
      -[SearchUIMultiResultCollectionView setVisibleResults:](self, "setVisibleResults:", v18);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v21, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIMultiResultCollectionView deleteItemsAtIndexPaths:](self, "deleteItemsAtIndexPaths:", v24);

      -[SearchUIMultiResultCollectionView updateCountsAnimated:](self, "updateCountsAnimated:", 1);
      goto LABEL_17;
    }
LABEL_10:
    v13 = v5;
LABEL_18:

  }
LABEL_19:

}

void __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "visibleResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(*(id *)(a1 + 32), "setVisibleResults:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                               + 24))
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      if (v5 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v7 = v9;
        if (v5 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          v7 = v3;
      }
      objc_msgSend(v7, "addObject:", v6);

      ++v5;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v8 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    while (v5 < v8);
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(a1 + 32), "reconfigureItemsAtIndexPaths:", v9);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 32), "deleteItemsAtIndexPaths:", v4);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "insertItemsAtIndexPaths:", v3);
  objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");

}

uint64_t __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_4;
  v2[3] = &unk_1EA1F6DA8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performBatchUpdates:completion:", v2, 0);

}

uint64_t __58__SearchUIMultiResultCollectionView_updateCountsAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_visibleResults, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end
