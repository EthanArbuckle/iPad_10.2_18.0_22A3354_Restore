@implementation SUIKSearchResultsCollectionViewController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUIKSearchResultsCollectionViewController)init
{
  void *v3;
  SUIKSearchResultsCollectionViewController *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA428]), "initWithSectionProvider:", &__block_literal_global_38);
  v4 = -[SUIKSearchResultsCollectionViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v3);

  return v4;
}

id __49__SUIKSearchResultsCollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = reuseIdentifier_block_invoke_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&reuseIdentifier_block_invoke_onceToken, &__block_literal_global_17);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", 0);
  +[PSListController appearance](PSListController, "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foregroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setHeaderMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithListConfiguration:layoutEnvironment:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", *(double *)&reuseIdentifier_block_invoke_iconSize_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", *(double *)&reuseIdentifier_block_invoke_iconSize_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithWidthDimension:heightDimension:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA1B0];
  v14 = SUIKCategoryHeaderKind;
  objc_msgSend((id)reuseIdentifier_block_invoke_cellConfig, "directionalLayoutMargins");
  v16 = v15;
  objc_msgSend(v4, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "contentInsets");
  objc_msgSend(v13, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v12, v14, 2, v16 + v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setPinToVisibleBounds:", 1);
  objc_msgSend(v19, "setExtendsBoundary:", 0);
  objc_msgSend(v19, "setZIndex:", 1000);
  v22[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBoundarySupplementaryItems:", v20);

  return v8;
}

void __49__SUIKSearchResultsCollectionViewController_init__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  PSBlankIconImage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  reuseIdentifier_block_invoke_iconSize_0 = v1;
  reuseIdentifier_block_invoke_iconSize_1 = v2;

  objc_msgSend(MEMORY[0x1E0CEA718], "subtitleCellConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)reuseIdentifier_block_invoke_cellConfig;
  reuseIdentifier_block_invoke_cellConfig = v3;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUIKSearchResultsCollectionViewController;
  -[SUIKSearchResultsCollectionViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[SUIKSearchResultCollectionViewListCell reuseIdentifier](SUIKSearchResultCollectionViewListCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = SUIKCategoryHeaderKind;
  +[SUIKSearchResultCollectionViewSectionHeader reuseIdentifier](SUIKSearchResultCollectionViewSectionHeader, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, v9, v10);

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlwaysBounceVertical:", 1);

  +[PSListController appearance](PSListController, "appearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "foregroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = objc_alloc(MEMORY[0x1E0CEA440]);
  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithCollectionView:cellProvider:", v16, &__block_literal_global_30_0);
  -[SUIKSearchResultsCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v17);

  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v20, &location);
  -[SUIKSearchResultsCollectionViewController diffableDataSource](self, "diffableDataSource", v19, 3221225472, __56__SUIKSearchResultsCollectionViewController_viewDidLoad__block_invoke_2, &unk_1E4A68AF0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSupplementaryViewProvider:", &v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __56__SUIKSearchResultsCollectionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  +[SUIKSearchResultCollectionViewListCell reuseIdentifier](SUIKSearchResultCollectionViewListCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "configureWithSearchableItem:", v6);
  return v10;
}

id __56__SUIKSearchResultsCollectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v8, "isEqualToString:", SUIKCategoryHeaderKind) & 1) != 0)
  {
    v11 = SUIKCategoryHeaderKind;
    +[SUIKSearchResultCollectionViewSectionHeader reuseIdentifier](SUIKSearchResultCollectionViewSectionHeader, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "diffableDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "searchResultsCollectionViewController:iconForCategory:", WeakRetained, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setCategoryImage:", v19);
  }
  else
  {
    PKLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v22;
      v28 = 2114;
      v29 = v9;
      v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_1A3819000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Element kind for indexpath '%{public}@' is '%{public}@'.", (uint8_t *)&v26, 0x20u);

    }
    v23 = objc_alloc(MEMORY[0x1E0CEA408]);
    v13 = (void *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v24);

  }
  return v13;
}

- (double)iconWidth
{
  if (iconWidth_onceToken_0 != -1)
    dispatch_once(&iconWidth_onceToken_0, &__block_literal_global_34);
  return *(double *)&iconWidth_iconWidth_0;
}

double __54__SUIKSearchResultsCollectionViewController_iconWidth__block_invoke()
{
  double v0;
  double result;
  id v2;

  PSBlankIconImage();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  *(double *)&iconWidth_iconWidth_0 = v0 + 15.0;

  return result;
}

- (unint64_t)totalSearchResults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 < 1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 += objc_msgSend(v7, "numberOfItemsInSection:", v5) + 1;

    ++v5;
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfSections");

  }
  while (v9 > v5);
  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[SUIKSearchResultsCollectionViewController diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchResultsCollectionViewController:didSelectURL:", self, v11);

    -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      if (objc_msgSend(v6, "section") < 1)
      {
        v16 = 0;
      }
      else
      {
        v15 = 0;
        v16 = 0;
        do
        {
          -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v16 += objc_msgSend(v17, "numberOfItemsInSection:", v15);

          ++v15;
        }
        while (v15 < objc_msgSend(v6, "section"));
      }
      v18 = objc_msgSend(v6, "item") + v16;
      -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "searchResultsCollectionViewController:didSelectItem:atIndex:", self, v8, v18);

    }
  }
  objc_msgSend(v20, "deselectItemAtIndexPath:animated:", v6, 0);

}

- (void)setResults:(id)a3
{
  id v4;
  void *v5;
  _SUIKSearchResultsUpdateOperation *v6;
  void *v7;
  void *v8;
  _SUIKSearchResultsUpdateOperation *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id location;

  v4 = a3;
  -[SUIKSearchResultsCollectionViewController updateOperation](self, "updateOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[SUIKSearchResultsCollectionViewController setUpdateOperation:](self, "setUpdateOperation:", 0);
  v6 = [_SUIKSearchResultsUpdateOperation alloc];
  -[SUIKSearchResultsCollectionViewController diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_SUIKSearchResultsUpdateOperation initWithResults:diffableDataSource:delegate:](v6, "initWithResults:diffableDataSource:delegate:", v4, v7, v8);
  -[SUIKSearchResultsCollectionViewController setUpdateOperation:](self, "setUpdateOperation:", v9);

  -[SUIKSearchResultsCollectionViewController updateOperation](self, "updateOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  v11 = objc_msgSend(v4, "count");
  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__SUIKSearchResultsCollectionViewController_setResults___block_invoke;
    v12[3] = &unk_1E4A654F0;
    v12[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], v12);
    objc_destroyWeak(&location);
  }
}

void __56__SUIKSearchResultsCollectionViewController_setResults___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfSections"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "numberOfItemsInSection:", 0);

    if (!v3)
      return;
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 1, 1);

  }
}

- (void)searchQueryStarted
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUIKSearchResultsCollectionViewController setResults:](self, "setResults:", v3);

}

- (void)searchQueryTextChanged
{
  -[SUIKSearchResultsCollectionViewController setQueryFoundItems:](self, "setQueryFoundItems:", 0);
}

- (void)searchQueryFoundItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[SUIKSearchResultsCollectionViewController setQueryFoundItems:](self, "setQueryFoundItems:", 1);
  -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __67__SUIKSearchResultsCollectionViewController_searchQueryFoundItems___block_invoke;
    v11 = &unk_1E4A68B18;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "na_filter:", &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIKSearchResultsCollectionViewController setResults:](self, "setResults:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUIKSearchResultsCollectionViewController setResults:](self, "setResults:", v4);
  }

}

uint64_t __67__SUIKSearchResultsCollectionViewController_searchQueryFoundItems___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUIKCategoryFromSearchableItem(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "searchResultsCollectionViewController:shouldShowCategory:", WeakRetained, v6);
  return v7;
}

- (void)searchQueryCompleted
{
  id v3;

  if (!-[SUIKSearchResultsCollectionViewController queryFoundItems](self, "queryFoundItems"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SUIKSearchResultsCollectionViewController setResults:](self, "setResults:", v3);

  }
}

- (void)selectNextSearchResult
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4)
  {
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v7 = objc_msgSend(v17, "item");
      v8 = objc_msgSend(v17, "section");
      -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfItemsInSection:", v8) - 1;

      if (v7 >= v10)
      {
        -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "numberOfSections") - 1;

        if (v8 >= v15)
        {
LABEL_10:

          return;
        }
        v13 = v8 + 1;
        v12 = (void *)MEMORY[0x1E0CB36B0];
        v11 = 0;
      }
      else
      {
        v11 = v7 + 1;
        v12 = (void *)MEMORY[0x1E0CB36B0];
        v13 = v8;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB36B0];
      v11 = 0;
      v13 = 0;
    }
    objc_msgSend(v12, "indexPathForItem:inSection:", v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIKSearchResultsCollectionViewController _selectAndScrollToIndexPath:](self, "_selectAndScrollToIndexPath:", v16);

    goto LABEL_10;
  }
}

- (void)selectPreviousSearchResult
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4)
  {
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v17;
    if (v17)
    {
      v8 = objc_msgSend(v17, "item");
      v9 = objc_msgSend(v17, "section");
      v10 = v9;
      v11 = v8 - 1;
      if (v8 >= 1)
      {
        v12 = (void *)MEMORY[0x1E0CB36B0];
LABEL_8:
        objc_msgSend(v12, "indexPathForItem:inSection:", v11, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUIKSearchResultsCollectionViewController _selectAndScrollToIndexPath:](self, "_selectAndScrollToIndexPath:", v16);

        v7 = v17;
        goto LABEL_9;
      }
      v13 = v9 - 1;
      v7 = v17;
      if (v10 >= 1)
      {
        -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "numberOfItemsInSection:", v13) - 1;

        v12 = (void *)MEMORY[0x1E0CB36B0];
        v11 = v15;
        v10 = v13;
        goto LABEL_8;
      }
    }
LABEL_9:

  }
}

- (void)showSelectedSearchResult
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIKSearchResultsCollectionViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v5, v6);

    -[SUIKSearchResultsCollectionViewController _selectAndScrollToIndexPath:](self, "_selectAndScrollToIndexPath:", v6);
  }

}

- (void)_selectAndScrollToIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v14);

  if (v7 == 1)
  {
    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v14;
    v11 = 1;
  }
  else
  {
    objc_msgSend(v5, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v14);

    -[SUIKSearchResultsCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v14;
    if (v13 == -1)
      v11 = 4;
    else
      v11 = 0;
  }
  objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v10, 1, v11);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUIKSearchResultsCollectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchResultsCollectionViewController:didScrollResultsInScrollView:", self, v7);

  }
}

- (SUIKSearchResultsCollectionViewControllerDelegate)delegate
{
  return (SUIKSearchResultsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (_SUIKSearchResultsUpdateOperation)updateOperation
{
  return self->_updateOperation;
}

- (void)setUpdateOperation:(id)a3
{
  objc_storeStrong((id *)&self->_updateOperation, a3);
}

- (BOOL)queryFoundItems
{
  return self->_queryFoundItems;
}

- (void)setQueryFoundItems:(BOOL)a3
{
  self->_queryFoundItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
