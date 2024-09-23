@implementation _UISearchSuggestionsListViewController

- (_UISearchSuggestionsListViewController)initWithSearchController:(id)a3
{
  id v4;
  UICollectionLayoutListConfiguration *v5;
  void *v6;
  _UISearchSuggestionsListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UICollectionViewDiffableDataSource *v11;
  void *v12;
  id v13;
  uint64_t v14;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v5 = -[UICollectionLayoutListConfiguration initWithAppearance:]([UICollectionLayoutListConfiguration alloc], "initWithAppearance:", 1);
  +[UICollectionViewCompositionalLayout layoutWithListConfiguration:](UICollectionViewCompositionalLayout, "layoutWithListConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)_UISearchSuggestionsListViewController;
  v7 = -[UICollectionViewController initWithCollectionViewLayout:](&v24, sel_initWithCollectionViewLayout_, v6);

  if (v7)
  {
    objc_storeWeak((id *)&v7->_searchController, v4);
    -[UICollectionViewController setInstallsStandardGestureForInteractiveMovement:](v7, "setInstallsStandardGestureForInteractiveMovement:", 0);
    objc_initWeak(&location, v7);
    v8 = objc_opt_class();
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke;
    v21[3] = &unk_1E16E8158;
    objc_copyWeak(&v22, &location);
    +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v8, v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [UICollectionViewDiffableDataSource alloc];
    -[UICollectionViewController collectionView](v7, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke_27;
    v19[3] = &unk_1E16E8180;
    v13 = v10;
    v20 = v13;
    v14 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v11, "initWithCollectionView:cellProvider:", v12, v19);
    dataSource = v7->_dataSource;
    v7->_dataSource = (UICollectionViewDiffableDataSource *)v14;

    v16 = v7->_dataSource;
    -[UICollectionViewController collectionView](v7, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDataSource:", v16);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (_UISearchSuggestionsListViewController)initWithCoder:(id)a3
{
  id v4;
  _UISearchSuggestionsListViewController *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionsListViewController;
  v5 = -[UICollectionViewController initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SearchControllerForSearchSuggestionsList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_searchController, v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchSuggestionsListViewController;
  v4 = a3;
  -[UICollectionViewController encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
  objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("SearchControllerForSearchSuggestionsList"), v6.receiver, v6.super_class);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchSuggestionsListViewController;
  -[UIViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[_UISearchSuggestionsListViewController updateList](self, "updateList");
}

- (void)updateList
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UICollectionViewDiffableDataSource *dataSource;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[16];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  -[_UISearchSuggestionsListViewController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dci_searchSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if ((unint64_t)v4 >= 2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Unexpected number of sections in snapshot for search suggestions list. Resetting", buf, 2u);
      }

    }
    else
    {
      v23 = updateList___s_category;
      if (!updateList___s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&updateList___s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Unexpected number of sections in snapshot for search suggestions list. Resetting", buf, 2u);
      }
    }
    if (v4 >= 2)
    {
      objc_msgSend(v3, "deleteAllItems");
      if (!v8)
      {
        dataSource = self->_dataSource;
        goto LABEL_36;
      }
    }
    v9 = v8 == 0;
  }
  else
  {
    v9 = v7 == 0;
    if (!(v4 | v7))
      goto LABEL_37;
  }
  if (!objc_msgSend(v3, "numberOfSections"))
  {
    v28[0] = CFSTR("_UISearchSuggestionsList");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v10);

  }
  v11 = objc_msgSend(v3, "numberOfItemsInSection:", CFSTR("_UISearchSuggestionsList"));
  if (v11 >= 1 || !v9)
  {
    v13 = v11;
    v14 = v11 & ~(v11 >> 63);
    if (v14 >= v8)
      v15 = v8;
    else
      v15 = v11 & ~(v11 >> 63);
    if (v15)
    {
      v26 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != v15; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

      }
      objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v16);

      v6 = v26;
    }
    if (v14 >= v8)
    {
      if (v8 >= v14)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v14 - v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v21);

        ++v8;
      }
      while (v14 != v8);
      objc_msgSend(v3, "deleteItemsWithIdentifiers:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8 - v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

        ++v14;
      }
      while (v8 != v14);
      objc_msgSend(v3, "appendItemsWithIdentifiers:", v19);
    }

LABEL_25:
    dataSource = self->_dataSource;
    if (v13 > 0)
    {
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v3, 1);
      goto LABEL_37;
    }
LABEL_36:
    -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](dataSource, "applySnapshotUsingReloadData:", v3);
  }
LABEL_37:

}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[UICollectionViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = objc_msgSend(v6, "row");
    -[_UISearchSuggestionsListViewController searchController](self, "searchController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dci_searchSuggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 < objc_msgSend(v12, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[_UISearchSuggestionsListViewController searchController](self, "searchController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dci_searchSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_searchBarTextFieldDidSelectSearchSuggestion:", v8);

}

- (UISearchController)searchController
{
  return (UISearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

@end
