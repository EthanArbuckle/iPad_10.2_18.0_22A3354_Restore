@implementation VUIFamilyMembersViewController

- (VUIFamilyMembersViewController)initWithDataSource:(id)a3
{
  id v5;
  VUIFamilyMembersViewController *v6;
  VUIFamilyMembersViewController *v7;
  VUIViewControllerContentPresenter *v8;
  VUIViewControllerContentPresenter *contentPresenter;
  double v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VUIFamilyMembersViewController;
  v6 = -[VUIFamilyMembersViewController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    -[VUIViewControllerContentPresenter setLogName:](v7->_contentPresenter, "setLogName:", CFSTR("VUIFamilyMembersViewController"));
    v7->_gridType = 1;
    v7->_gridStyle = 16;
    v7->_lastCollectionViewSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_itemWidthForGridStyle:gridType:", v7->_gridStyle, v7->_gridType);
    v7->_tvCellWidth = v10;
    objc_initWeak(&location, v7);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__VUIFamilyMembersViewController_initWithDataSource___block_invoke;
    v14[3] = &unk_1E9F99F98;
    objc_copyWeak(&v15, &location);
    v12 = (id)-[VUIFamilyMembersViewController registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v11, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__VUIFamilyMembersViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

}

- (void)loadView
{
  void *v3;
  void *v4;
  VUILegacyCollectionView *v5;
  VUILegacyCollectionView *collectionView;
  UICollectionViewDiffableDataSource *v7;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController loadView](&v12, sel_loadView);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("LIBRARY_FAMILY_SHARING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilyMembersViewController setTitle:](self, "setTitle:", v4);

  -[VUIFamilyMembersViewController _createCollectionView](self, "_createCollectionView");
  v5 = (VUILegacyCollectionView *)objc_claimAutoreleasedReturnValue();
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[VUIFamilyMembersViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v7 = (UICollectionViewDiffableDataSource *)objc_claimAutoreleasedReturnValue();
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v7;

  -[VUIFamilyMembersViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRootViewForViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[VUIFamilyMembersViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[VUIFamilyMembersViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startFetch");

  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("LIBRARY_GENERIC_FETCH_ERROR_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNoContentErrorTitle:", v7);

  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentContentViewType:", 1);

  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilyMembersViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentView:", v10);

  -[VUIFamilyMembersViewController registerForApplicationNotifications](self, "registerForApplicationNotifications");
  -[VUIFamilyMembersViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"FamilySharing\"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v12);

}

- (void)dealloc
{
  objc_super v3;

  -[VUIFamilyMembersViewController unregisterApplicationNotifications](self, "unregisterApplicationNotifications");
  v3.receiver = self;
  v3.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[VUIFamilyMembersViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureCurrentViewFrameForBounds:", v5, v7, v9, v11);

  -[VUIFamilyMembersViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", v9, v11);
  -[VUIFamilyMembersViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)registerForApplicationNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC6AC0], 0);

}

- (void)unregisterApplicationNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  CGRect v14;
  CGRect v15;

  -[VUIFamilyMembersViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  Width = CGRectGetWidth(v14);
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", Width, CGRectGetHeight(v15));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIFamilyMembersViewController;
  v7 = a4;
  -[VUIFamilyMembersViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__VUIFamilyMembersViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __85__VUIFamilyMembersViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v1, "_updateLayoutForSizeIfNeeded:", v2, v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[VUIFamilyMembersViewController _clearCollectionViewSelections:](self, "_clearCollectionViewSelections:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIFamilyMembersViewController;
  -[VUIFamilyMembersViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[VUIFamilyMembersViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[VUIFamilyMembersViewController _updateLayoutForSizeIfNeeded:](self, "_updateLayoutForSizeIfNeeded:", v6, v8);
  -[VUIFamilyMembersViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[VUIFamilyMembersViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("FamilySharingMembers"));
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[VUIFamilyMembersViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[VUIFamilyMembersViewController _generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:](self, "_generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilyMembersViewController setFamilyMemberHashToFamilyMemberDictionary:](self, "setFamilyMemberHashToFamilyMemberDictionary:", v7);

  -[VUIFamilyMembersViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilyMembersViewController diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VUIFamilyMembersViewController_dataSourceDidFinishFetching___block_invoke;
  v10[3] = &unk_1E9F98DF0;
  v10[4] = self;
  objc_msgSend(v9, "applySnapshot:animatingDifferences:completion:", v8, 1, v10);

}

uint64_t __62__VUIFamilyMembersViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentViewIfNeeded");
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[VUIFamilyMembersViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIFamilyMembersViewController familyMemberHashToFamilyMemberDictionary](self, "familyMemberHashToFamilyMemberDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIFamilyMembersViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "familyMemberViewController:didSelectFamilyMember:", self, v8);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  VUIFamilyMemberCell *v7;
  VUIFamilyMemberCell *v8;
  VUIFamilyMemberCell *sizingCell;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;
  CGRect v28;

  v6 = a5;
  if (!self->_sizingCell)
  {
    v7 = [VUIFamilyMemberCell alloc];
    v8 = -[VUIFamilyMemberCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sizingCell = self->_sizingCell;
    self->_sizingCell = v8;

  }
  -[VUIFamilyMembersViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v14 = v13;

  -[VUIFamilyMembersViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetWidth(v28) - v12 - v14;

  -[VUIFamilyMembersViewController diffableDataSource](self, "diffableDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemIdentifierForIndexPath:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIFamilyMembersViewController familyMemberHashToFamilyMemberDictionary](self, "familyMemberHashToFamilyMemberDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIFamilyMemberCell configureVUIFamilyMemberCell:withFamilyMember:metricsOnly:](VUIFamilyMemberCell, "configureVUIFamilyMemberCell:withFamilyMember:metricsOnly:", self->_sizingCell, v20, 1);
  -[VUIFamilyMemberCell configureMonogramImageLayoutForWindowWidth:](self->_sizingCell, "configureMonogramImageLayoutForWindowWidth:", v16);
  -[VUIFamilyMemberCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v16, 1.79769313e308);
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (id)_createCollectionView
{
  id v3;
  VUILegacyCollectionView *v4;
  VUILegacyCollectionView *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v4 = [VUILegacyCollectionView alloc];
  v5 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUILegacyCollectionView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[VUILegacyCollectionView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);
  -[VUILegacyCollectionView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
  -[VUILegacyCollectionView setAlwaysBounceVertical:](v5, "setAlwaysBounceVertical:", 1);
  -[VUILegacyCollectionView setOpaque:](v5, "setOpaque:", 0);
  -[VUILegacyCollectionView setBackgroundColor:](v5, "setBackgroundColor:", 0);
  -[VUILegacyCollectionView setDelegate:](v5, "setDelegate:", self);
  -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("FamilyMemberCellIdentifier"));

  return v5;
}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[VUIFamilyMembersViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VUIFamilyMembersViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E9F9F440;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __59__VUIFamilyMembersViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("FamilyMemberCellIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "familyMemberHashToFamilyMemberDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIFamilyMemberCell configureVUIFamilyMemberCell:withFamilyMember:metricsOnly:](VUIFamilyMemberCell, "configureVUIFamilyMemberCell:withFamilyMember:metricsOnly:", v11, v13, 0);
  objc_msgSend(WeakRetained, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v11, "configureMonogramImageLayoutForWindowWidth:", CGRectGetWidth(v16));

  return v11;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = CFSTR("FamilyMemberSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUIFamilyMembersViewController _getFamilyMemberIdentifiersFromFamilyMembers](self, "_getFamilyMemberIdentifiersFromFamilyMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("FamilyMemberSection"));

  return v3;
}

- (id)_getFamilyMemberIdentifiersFromFamilyMembers
{
  void *v2;
  void *v3;

  -[VUIFamilyMembersViewController familyMemberHashToFamilyMemberDictionary](self, "familyMemberHashToFamilyMemberDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_generateFamilyMemberHashToFamilyMemberDictionaryForFamilyMembers:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "hash", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)_updateCurrentViewIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[VUIFamilyMembersViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    v6 = 3;
  else
    v6 = 2;
  -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentContentViewType");

  if (v6 != v8)
  {
    -[VUIFamilyMembersViewController contentPresenter](self, "contentPresenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentContentViewType:", v6);

  }
}

- (void)_updateLayoutForSizeIfNeeded:(CGSize)a3
{
  CGFloat height;
  double width;
  double v6;
  VUIFamilyMemberCell *sizingCell;
  void *v8;
  id v9;

  height = a3.height;
  width = a3.width;
  -[VUIFamilyMembersViewController lastCollectionViewSize](self, "lastCollectionViewSize");
  if (width != v6)
  {
    self->_lastCollectionViewSize.width = width;
    self->_lastCollectionViewSize.height = height;
    sizingCell = self->_sizingCell;
    self->_sizingCell = 0;

    -[VUIFamilyMembersViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateLayout");

  }
}

- (void)_clearCollectionViewSelections:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  -[VUIFamilyMembersViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIFamilyMembersViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v7, 1);
    }

  }
}

uint64_t __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __65__VUIFamilyMembersViewController__clearCollectionViewSelections___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)_updateNavigationBarPadding
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIFamilyMembersViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUIFamilyMembersViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    v21 = v16;

    if (v10 == v21)
      return;
  }
  else
  {

  }
  -[VUIFamilyMembersViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUIFamilyMembersViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (VUIFamilyMembersViewControllerDelegate)delegate
{
  return (VUIFamilyMembersViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUILibraryFamilyMembersDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (VUILegacyCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (VUIFamilyMemberCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (NSDictionary)familyMemberHashToFamilyMemberDictionary
{
  return self->_familyMemberHashToFamilyMemberDictionary;
}

- (void)setFamilyMemberHashToFamilyMemberDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberHashToFamilyMemberDictionary, a3);
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (CGSize)lastCollectionViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastCollectionViewSize.width;
  height = self->_lastCollectionViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastCollectionViewSize:(CGSize)a3
{
  self->_lastCollectionViewSize = a3;
}

- (double)tvCellWidth
{
  return self->_tvCellWidth;
}

- (void)setTvCellWidth:(double)a3
{
  self->_tvCellWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberHashToFamilyMemberDictionary, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
