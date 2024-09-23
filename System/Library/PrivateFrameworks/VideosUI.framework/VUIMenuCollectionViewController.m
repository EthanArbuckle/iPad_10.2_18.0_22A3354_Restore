@implementation VUIMenuCollectionViewController

- (VUIMenuCollectionViewController)initWithCategories:(id)a3 gridConfiguration:(id)a4
{
  id v6;
  id v7;
  VUIMenuCollectionViewController *v8;
  VUIMenuCollectionViewController *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VUIMenuCollectionViewController;
  v8 = -[VUIMenuCollectionViewController init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VUIMenuCollectionViewController setCollectionConfiguration:](v8, "setCollectionConfiguration:", v7);
    -[VUIMenuCollectionViewController setCategories:](v9, "setCategories:", v6);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = isKindOfClass & 1;
    if ((_DWORD)v13)
      v14 = CFSTR("LIBRARY_GENRES_HEADER");
    else
      v14 = CFSTR("LIBRARY");
    objc_msgSend(v11, "localizedStringForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMenuCollectionViewController setTitle:](v9, "setTitle:", v15);

    -[VUIMenuCollectionViewController setGenresOnlyMenu:](v9, "setGenresOnlyMenu:", v13);
    -[VUIMenuCollectionViewController setShouldShowBackButton:](v9, "setShouldShowBackButton:", 0);
    -[VUIMenuCollectionViewController setShouldShowLeftBarButton:](v9, "setShouldShowLeftBarButton:", 0);
    -[VUIMenuCollectionViewController setShouldDeselectOnViewAppear:](v9, "setShouldDeselectOnViewAppear:", 0);
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  VUILegacyCollectionView *v4;
  VUILegacyCollectionView *menuCollectionView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UICollectionViewCell *v11;
  UICollectionViewCell *sizingCell;
  VUIMenuSectionHeaderCollectionViewCell *v13;
  VUIMenuSectionHeaderCollectionViewCell *sectionHeaderSizingCell;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController loadView](&v18, sel_loadView);
  -[VUIMenuCollectionViewController collectionConfiguration](self, "collectionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateCollectionView");
  v4 = (VUILegacyCollectionView *)objc_claimAutoreleasedReturnValue();
  menuCollectionView = self->_menuCollectionView;
  self->_menuCollectionView = v4;

  -[VUILegacyCollectionView setDelegate:](self->_menuCollectionView, "setDelegate:", self);
  -[VUIMenuCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_menuCollectionView);

  if (-[VUIMenuCollectionViewController shouldShowLeftBarButton](self, "shouldShowLeftBarButton"))
  {
    -[VUIMenuCollectionViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMenuCollectionViewController _leftBarButton](self, "_leftBarButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v8);

  }
  if (-[VUIMenuCollectionViewController shouldShowBackButton](self, "shouldShowBackButton"))
  {
    -[VUIMenuCollectionViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMenuCollectionViewController _backButton](self, "_backButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackBarButtonItem:", v10);

  }
  v11 = (UICollectionViewCell *)objc_alloc_init(MEMORY[0x1E0DC35C0]);
  sizingCell = self->_sizingCell;
  self->_sizingCell = v11;

  v13 = objc_alloc_init(VUIMenuSectionHeaderCollectionViewCell);
  sectionHeaderSizingCell = self->_sectionHeaderSizingCell;
  self->_sectionHeaderSizingCell = v13;

  -[VUIMenuCollectionViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMenuCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v15);

  -[VUIMenuCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMenuCollectionViewController diffableDataSource](self, "diffableDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySnapshot:animatingDifferences:", v16, 0);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[VUIMenuCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "menuCollectionViewControllerDidFinishLoading");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VUIMenuCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[VUIMenuCollectionViewController _selectFirstMenuItemIfNecessary](self, "_selectFirstMenuItemIfNecessary");
}

- (void)viewWillLayoutSubviews
{
  VUILegacyCollectionView *menuCollectionView;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  menuCollectionView = self->_menuCollectionView;
  -[VUIMenuCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[VUILegacyCollectionView setFrame:](menuCollectionView, "setFrame:");

  -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

  -[VUIMenuCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (-[VUIMenuCollectionViewController shouldDeselectOnViewAppear](self, "shouldDeselectOnViewAppear"))
  {
    -[VUILegacyCollectionView indexPathsForSelectedItems](self->_menuCollectionView, "indexPathsForSelectedItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUILegacyCollectionView deselectItemAtIndexPath:animated:](self->_menuCollectionView, "deselectItemAtIndexPath:animated:", v5, 1);
  }
}

- (void)updateWithCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForSelectedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[VUIMenuCollectionViewController setCategories:](self, "setCategories:", v4);
  -[VUIMenuCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[VUIMenuCollectionViewController diffableDataSource](self, "diffableDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__VUIMenuCollectionViewController_updateWithCategories___block_invoke;
  v14[3] = &unk_1E9F9A938;
  objc_copyWeak(&v16, &location);
  v13 = v10;
  v15 = v13;
  objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v11, 1, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __56__VUIMenuCollectionViewController_updateWithCategories___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "menuCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (!v7)
  {
    objc_msgSend(WeakRetained, "mainMenuItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "menuCollectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v10, 1, 0);

      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController: did select menu item at new index path %@", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(WeakRetained, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didSelectMenuItemAtIndexPath:", v10);

    }
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIMenuCollectionViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  objc_msgSend(v5, "_setSupportsTwoLineLargeTitles:", 1);
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__VUIMenuCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F9C3A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __86__VUIMenuCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeToFit");

  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double Width;
  uint64_t v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v6 = a5;
  -[VUIMenuCollectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v21);

  v9 = objc_msgSend(v6, "section");
  v10 = &OBJC_IVAR___VUIMenuCollectionViewController__genreMenuItems;
  if (!v9)
    v10 = &OBJC_IVAR___VUIMenuCollectionViewController__mainMenuItems;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v10), "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMenuCollectionViewController collectionConfiguration](self, "collectionConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureSizingCellForItem:AtIndexPath:", v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sizeThatFits:", Width, 1.79769313e308);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;

  -[VUIMenuCollectionViewController collectionConfiguration](self, "collectionConfiguration", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumLineSpacing");
  v7 = v6;

  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v5 = 0.0;
  if (a5 == 1)
  {
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB", a3, a4);
    v8 = v7;
    -[VUIMenuCollectionViewController traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v9, v8);
    v5 = v10;

  }
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = v5;
  result.right = v13;
  result.bottom = v14;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double Width;
  void *v14;
  VUIMenuSectionHeaderCollectionViewCell *sectionHeaderSizingCell;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;

  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a5 == 1 && !self->_genresOnlyMenu && -[NSArray count](self->_genreMenuItems, "count"))
  {
    -[VUIMenuCollectionViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    Width = CGRectGetWidth(v23);

    -[VUIMenuSectionHeaderCollectionViewCell title](self->_sectionHeaderSizingCell, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      sectionHeaderSizingCell = self->_sectionHeaderSizingCell;
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:", CFSTR("LIBRARY_GENRES_HEADER"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMenuSectionHeaderCollectionViewCell setTitle:](sectionHeaderSizingCell, "setTitle:", v17);

    }
    -[VUIMenuSectionHeaderCollectionViewCell sizeThatFits:](self->_sectionHeaderSizingCell, "sizeThatFits:", Width, 1.79769313e308);
    v10 = v18;
    v11 = v19;
  }

  v20 = v10;
  v21 = v11;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v5 = a4;
  -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathsForSelectedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "isEqual:", v5) ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VUIMenuCollectionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didSelectMenuItemAtIndexPath:", v5);

}

- (void)_backSelected:(id)a3
{
  id v3;
  id v4;

  -[VUIMenuCollectionViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_leftBarButtonSelected:(id)a3
{
  id v4;

  -[VUIMenuCollectionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryMenuViewControllerShouldDismiss:", self);

}

- (void)setCategories:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *mainMenuItems;
  NSObject *v9;
  NSUInteger v10;
  NSUInteger v11;
  int v12;
  NSUInteger v13;
  __int16 v14;
  NSUInteger v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_categories, a3);
  objc_msgSend(v5, "mainMenuItemsWithDefaultItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = v7;

  -[VUIMenuCollectionViewController _setGenreMenuItemsForCategories:](self, "_setGenreMenuItemsForCategories:", v5);
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[NSArray count](self->_mainMenuItems, "count");
    v11 = -[NSArray count](self->_genreMenuItems, "count");
    v12 = 134218240;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController:Setting %lu main menu items, %lu genre menu items", (uint8_t *)&v12, 0x16u);
  }

}

- (void)_setGenreMenuItemsForCategories:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *genreMenuItems;
  NSArray *v8;
  NSArray *genreMenuTypes;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "genreMenuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  genreMenuItems = self->_genreMenuItems;
  self->_genreMenuItems = v6;

  objc_msgSend(v4, "genreTypes");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (NSArray *)objc_msgSend(v10, "copy");
  genreMenuTypes = self->_genreMenuTypes;
  self->_genreMenuTypes = v8;

}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke;
  v10 = &unk_1E9F98F50;
  objc_copyWeak(&v11, &location);
  v5 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, &v7);

  objc_msgSend(v5, "setSupplementaryViewProvider:", &__block_literal_global_44, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

id __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  if (objc_msgSend(v5, "section"))
  {
    objc_msgSend(WeakRetained, "genreMenuItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("title"));
    objc_msgSend(WeakRetained, "genreMenuTypes");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(WeakRetained, "genreMenuTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v16 = objc_msgSend(v5, "row");

      if (v15 > v16)
      {
        objc_msgSend(WeakRetained, "genreMenuTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v5, "row"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("type"));
      }
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "mainMenuItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(WeakRetained, "collectionConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configureCollectionViewCellForCollectionView:ForItem:AtIndexPath:", v7, v11, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a3, CFSTR("MenuSectionHeaderCellIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("LIBRARY_GENRES_HEADER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  return v4;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSArray *mainMenuItems;
  NSArray *genreMenuItems;
  int v9;
  NSArray *v10;
  __int16 v11;
  NSArray *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13[0] = CFSTR("MainSectionIdentifier");
  v13[1] = CFSTR("GenreSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_mainMenuItems, CFSTR("MainSectionIdentifier"));
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_genreMenuItems, CFSTR("GenreSectionIdentifier"));
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mainMenuItems = self->_mainMenuItems;
    genreMenuItems = self->_genreMenuItems;
    v9 = 138412546;
    v10 = mainMenuItems;
    v11 = 2112;
    v12 = genreMenuItems;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController:Creating snapshot with main menu items %@, genre menu items %@", (uint8_t *)&v9, 0x16u);
  }

  return v3;
}

- (void)_applySnapshotsToSectionController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *mainMenuItems;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v3 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[VUIMenuCollectionViewController categories](self, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainMenuItemsWithDefaultItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = v7;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "appendItems:", self->_mainMenuItems);
  -[VUIMenuCollectionViewController sectionController](self, "sectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applySnapshot:toSection:animatingDifferences:", v9, CFSTR("MainSectionIdentifier"), v3);

  -[VUIMenuCollectionViewController categories](self, "categories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMenuCollectionViewController _setGenreMenuItemsForCategories:](self, "_setGenreMenuItemsForCategories:", v11);

  v12 = (void *)objc_opt_new();
  -[NSArray firstObject](self->_genreMenuItems, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray subarrayWithRange:](self->_genreMenuItems, "subarrayWithRange:", 1, -[NSArray count](self->_genreMenuItems, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendItems:", v15);

  objc_msgSend(v12, "appendItems:intoParent:", v14, v13);
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expandItems:", v16);

  -[VUIMenuCollectionViewController sectionController](self, "sectionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySnapshot:toSection:animatingDifferences:", v12, CFSTR("GenreSectionIdentifier"), v3);

}

- (BOOL)_menuHasContent
{
  return -[NSArray count](self->_mainMenuItems, "count") || -[NSArray count](self->_genreMenuItems, "count") != 0;
}

- (id)_backButton
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
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_imageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:forState:", v7, 0);
  objc_msgSend(v3, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("LIBRARY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v10, 0);

  objc_msgSend(v3, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setTextColorFollowsTintColor:", 1);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__backSelected_, 64);
  -[VUIMenuCollectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");

  if (v13 == 1)
    v14 = 0.0;
  else
    v14 = -10.0;
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v3);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:", CFSTR("LIBRARY"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v17);

  return v15;
}

- (id)_leftBarButton
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
  uint64_t v13;
  double v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_imageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:forState:", v7, 0);
  objc_msgSend(v3, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("BACK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v10, 0);

  objc_msgSend(v3, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setTextColorFollowsTintColor:", 1);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__leftBarButtonSelected_, 64);
  -[VUIMenuCollectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");

  if (v13 == 1)
    v14 = 0.0;
  else
    v14 = -10.0;
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v3);

  return v15;
}

- (void)_selectFirstMenuItemIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    -[VUIMenuCollectionViewController mainMenuItems](self, "mainMenuItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIMenuCollectionViewController menuCollectionView](self, "menuCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);
  }

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
  -[VUIMenuCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUIMenuCollectionViewController navigationController](self, "navigationController");
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
  -[VUIMenuCollectionViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUIMenuCollectionViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (VUIMenuCollectionViewControllerDelegate)delegate
{
  return (VUIMenuCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIMenuDataSource)categories
{
  return self->_categories;
}

- (BOOL)shouldShowLeftBarButton
{
  return self->_shouldShowLeftBarButton;
}

- (void)setShouldShowLeftBarButton:(BOOL)a3
{
  self->_shouldShowLeftBarButton = a3;
}

- (BOOL)shouldShowBackButton
{
  return self->_shouldShowBackButton;
}

- (void)setShouldShowBackButton:(BOOL)a3
{
  self->_shouldShowBackButton = a3;
}

- (BOOL)shouldDeselectOnViewAppear
{
  return self->_shouldDeselectOnViewAppear;
}

- (void)setShouldDeselectOnViewAppear:(BOOL)a3
{
  self->_shouldDeselectOnViewAppear = a3;
}

- (BOOL)isInPrimaryOnlyMode
{
  return self->_isInPrimaryOnlyMode;
}

- (void)setIsInPrimaryOnlyMode:(BOOL)a3
{
  self->_isInPrimaryOnlyMode = a3;
}

- (VUICollectionConfiguration)collectionConfiguration
{
  return self->_collectionConfiguration;
}

- (void)setCollectionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_collectionConfiguration, a3);
}

- (BOOL)shouldMarkFirstCategorySelected
{
  return self->_shouldMarkFirstCategorySelected;
}

- (void)setShouldMarkFirstCategorySelected:(BOOL)a3
{
  self->_shouldMarkFirstCategorySelected = a3;
}

- (BOOL)genresOnlyMenu
{
  return self->_genresOnlyMenu;
}

- (void)setGenresOnlyMenu:(BOOL)a3
{
  self->_genresOnlyMenu = a3;
}

- (VUILegacyCollectionView)menuCollectionView
{
  return self->_menuCollectionView;
}

- (void)setMenuCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_menuCollectionView, a3);
}

- (UICollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (VUIMenuSectionHeaderCollectionViewCell)sectionHeaderSizingCell
{
  return self->_sectionHeaderSizingCell;
}

- (void)setSectionHeaderSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderSizingCell, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (NSArray)mainMenuItems
{
  return self->_mainMenuItems;
}

- (void)setMainMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_mainMenuItems, a3);
}

- (NSArray)genreMenuItems
{
  return self->_genreMenuItems;
}

- (void)setGenreMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_genreMenuItems, a3);
}

- (NSArray)genreMenuTypes
{
  return self->_genreMenuTypes;
}

- (void)setGenreMenuTypes:(id)a3
{
  objc_storeStrong((id *)&self->_genreMenuTypes, a3);
}

- (_UIDiffableDataSourceSectionController)sectionController
{
  return self->_sectionController;
}

- (void)setSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_sectionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_genreMenuTypes, 0);
  objc_storeStrong((id *)&self->_genreMenuItems, 0);
  objc_storeStrong((id *)&self->_mainMenuItems, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSizingCell, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_menuCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
