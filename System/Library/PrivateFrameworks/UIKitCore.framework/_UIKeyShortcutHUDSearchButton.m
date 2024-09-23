@implementation _UIKeyShortcutHUDSearchButton

- (_UIKeyShortcutHUDSearchButton)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDSearchButton *v3;
  _UIKeyShortcutHUDSearchButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchButton;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIKeyShortcutHUDSearchButton _setupSubviews](v3, "_setupSubviews");
    -[_UIKeyShortcutHUDSearchButton _configureCollectionView](v4, "_configureCollectionView");
  }
  return v4;
}

- (void)_setupSubviews
{
  UICollectionView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UICollectionView *v13;
  UICollectionView *collectionView;

  v3 = [UICollectionView alloc];
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIKeyShortcutHUDSearchButton _collectionViewLayout](self, "_collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UICollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v12, v5, v7, v9, v11);
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  -[UIView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self, "addSubview:", self->_collectionView);
}

- (void)_configureCollectionView
{
  void *v3;
  uint64_t v4;
  void *v5;
  UICollectionViewDiffableDataSource *v6;
  UICollectionView *collectionView;
  id v8;
  UICollectionViewDiffableDataSource *v9;
  UICollectionViewDiffableDataSource *dataSource;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke;
  v14[3] = &unk_1E16E6288;
  objc_copyWeak(&v15, &location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_3;
  v12[3] = &unk_1E16C74C0;
  v8 = v5;
  v13 = v8;
  v9 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v6, "initWithCollectionView:cellProvider:", collectionView, v12);
  dataSource = self->_dataSource;
  self->_dataSource = v9;

  objc_storeStrong((id *)&self->_searchCellRegistration, v5);
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendSectionsWithIdentifiers:", &unk_1E1A94E20);
  objc_msgSend(v11, "appendItemsWithIdentifiers:", &unk_1E1A94E38);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v11, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_collectionViewLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  UICollectionViewCompositionalLayout *v14;

  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679998, "itemWithLayoutSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:subitem:count:", v8, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolbarContentInset");
  v12 = v11;

  objc_msgSend(v9, "setContentInsets:", v12, v12, v12, 0.0);
  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UICollectionViewCompositionalLayout initWithSection:]([UICollectionViewCompositionalLayout alloc], "initWithSection:", v13);

  return v14;
}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  id v4;

  -[_UIKeyShortcutHUDSearchButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchButtonDidPress:", self);

}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
}

- (_UIKeyShortcutHUDIndexPath)searchButtonIndexPath
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:indexPath:](_UIKeyShortcutHUDIndexPath, "hudIndexPathWithClient:indexPath:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDIndexPath *)v4;
}

- (void)setSearching:(BOOL)a3
{
  _BOOL4 v3;
  UICollectionView *collectionView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_searching != a3)
  {
    v3 = a3;
    self->_searching = a3;
    collectionView = self->_collectionView;
    -[_UIKeyShortcutHUDSearchButton searchButtonIndexPath](self, "searchButtonIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
      objc_msgSend(v7, "searchHUDTextColor");
    else
      objc_msgSend(v7, "standardHUDTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSearchIconColor:", v9);

  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  return (_UIKeyShortcutHUDCollectionViewManager *)objc_loadWeakRetained((id *)&self->_collectionViewManager);
}

- (void)setCollectionViewManager:(id)a3
{
  objc_storeWeak((id *)&self->_collectionViewManager, a3);
}

- (_UIKeyShortcutHUDSearchButtonDelegate)delegate
{
  return (_UIKeyShortcutHUDSearchButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIKeyShortcutHUDToolbarViewController)toolbarVC
{
  return (_UIKeyShortcutHUDToolbarViewController *)objc_loadWeakRetained((id *)&self->_toolbarVC);
}

- (void)setToolbarVC:(id)a3
{
  objc_storeWeak((id *)&self->_toolbarVC, a3);
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UICollectionViewCellRegistration)searchCellRegistration
{
  return self->_searchCellRegistration;
}

- (void)setSearchCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_searchCellRegistration, a3);
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
  objc_storeStrong((id *)&self->_searchCellRegistration, 0);
  objc_destroyWeak((id *)&self->_toolbarVC);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
