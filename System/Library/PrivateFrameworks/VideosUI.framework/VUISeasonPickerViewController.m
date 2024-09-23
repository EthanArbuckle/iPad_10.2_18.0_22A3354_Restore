@implementation VUISeasonPickerViewController

- (VUISeasonPickerViewController)initWithDataSource:(id)a3
{
  id v5;
  VUISeasonPickerViewController *v6;
  VUISeasonPickerViewController *v7;
  VUIViewControllerContentPresenter *v8;
  VUIViewControllerContentPresenter *contentPresenter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUISeasonPickerViewController;
  v6 = -[VUISeasonPickerViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    -[VUIViewControllerContentPresenter setLogName:](v7->_contentPresenter, "setLogName:", CFSTR("VUISeasonPickerViewController"));
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  _VUISeasonPickerView *v4;
  _VUISeasonPickerView *v5;
  _VUISeasonPickerView *seasonPickerView;
  void *v7;
  void *v8;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UICollectionViewDiffableDataSource *v17;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[VUISeasonPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSupportsTwoLineLargeTitles:", 1);
  v4 = [_VUISeasonPickerView alloc];
  v5 = -[_VUISeasonPickerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  seasonPickerView = self->_seasonPickerView;
  self->_seasonPickerView = v5;

  -[_VUISeasonPickerView collectionView](self->_seasonPickerView, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[_VUISeasonPickerView collectionView](self->_seasonPickerView, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUISeasonPickerCollectionViewCellIdentifier"));

  -[_VUISeasonPickerView setAutoresizingMask:](self->_seasonPickerView, "setAutoresizingMask:", 18);
  -[VUIViewControllerContentPresenter setContentView:](self->_contentPresenter, "setContentView:", self->_seasonPickerView);
  contentPresenter = self->_contentPresenter;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("LIBRARY_GENERIC_FETCH_ERROR_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIViewControllerContentPresenter setNoContentErrorTitle:](contentPresenter, "setNoContentErrorTitle:", v11);

  -[VUIViewControllerContentPresenter setCurrentContentViewType:](self->_contentPresenter, "setCurrentContentViewType:", 1);
  v12 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:", CFSTR("GENERIC_DELETED_ERROR_MESSAGE_FORMAT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISeasonPickerViewController title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIViewControllerContentPresenter setDeletedContentErrorMessage:](self->_contentPresenter, "setDeletedContentErrorMessage:", v16);
  -[VUISeasonPickerViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v17 = (UICollectionViewDiffableDataSource *)objc_claimAutoreleasedReturnValue();
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  -[VUISeasonPickerViewController dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  -[VUISeasonPickerViewController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startFetch");

  -[VUISeasonPickerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"SeasonPicker\"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityIdentifier:", v22);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController viewWillAppear:](&v19, sel_viewWillAppear_);
  -[_VUISeasonPickerView collectionView](self->_seasonPickerView, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUISeasonPickerViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__VUISeasonPickerViewController_viewWillAppear___block_invoke;
      v15[3] = &unk_1E9F98F00;
      v16 = v5;
      v17 = v7;
      v18 = a3;
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __48__VUISeasonPickerViewController_viewWillAppear___block_invoke_2;
      v12[3] = &unk_1E9F98F28;
      v13 = v16;
      v14 = v17;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v15, v12);

    }
    else
    {
      objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v7, 1);
    }

  }
  -[VUISeasonPickerViewController currentSeasonViewController](self, "currentSeasonViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISeasonPickerViewController setLastViewedSeasonWasManuallyDeleted:](self, "setLastViewedSeasonWasManuallyDeleted:", objc_msgSend(v11, "contentHasBeenManuallyDeleted"));

  -[VUISeasonPickerViewController setCurrentSeasonViewController:](self, "setCurrentSeasonViewController:", 0);
}

uint64_t __48__VUISeasonPickerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __48__VUISeasonPickerViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibrarySeasonPicker"));
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController loadView](&v4, sel_loadView);
  -[VUISeasonPickerViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUISeasonPickerViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISeasonPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  VUISeasonPickerCollectionViewCell *v7;
  VUISeasonPickerCollectionViewCell *sizingCell;
  void *v9;
  void *v10;
  void *v11;
  VUISeasonPickerCollectionViewCell *v12;
  void *v13;
  VUISeasonPickerCollectionViewCell *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v6 = a5;
  if (!self->_sizingCell)
  {
    v7 = objc_alloc_init(VUISeasonPickerCollectionViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v7;

  }
  -[VUISeasonPickerViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self->_sizingCell;
  -[VUISeasonPickerViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUISeasonPickerCollectionViewCell configureSeasonPickerCell:withMedia:traitCollection:](VUISeasonPickerCollectionViewCell, "configureSeasonPickerCell:withMedia:traitCollection:", v12, v11, v13);

  v14 = self->_sizingCell;
  -[VUISeasonPickerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  -[VUISeasonPickerCollectionViewCell sizeThatFits:](v14, "sizeThatFits:", v16, 1.79769313e308);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  +[VUIViewSpacer spacerC](VUIViewSpacer, "spacerC", a3, a4, a5);
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.right = v9;
  result.bottom = v6;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[VUISeasonPickerViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[VUISeasonPickerViewController familyMember](self, "familyMember");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryViewFactory viewControllerForMediaEntity:withFamilyMember:](VUILibraryViewFactory, "viewControllerForMediaEntity:withFamilyMember:", v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUISeasonPickerViewController title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  -[VUISeasonPickerViewController setCurrentSeasonViewController:](self, "setCurrentSeasonViewController:", v10);
  -[VUISeasonPickerViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v10, 1);

}

- (void)dataSourceDidFinishFetching:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[VUISeasonPickerViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISeasonPickerViewController diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__VUISeasonPickerViewController_dataSourceDidFinishFetching___block_invoke;
  v6[3] = &unk_1E9F98DF0;
  v6[4] = self;
  objc_msgSend(v5, "applySnapshot:animatingDifferences:completion:", v4, 1, v6);

}

void __61__VUISeasonPickerViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(*(id *)(a1 + 32), "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setCurrentContentViewType:", 3);
  }
  else
  {
    objc_msgSend(v5, "setCurrentContentViewType:", 2);

    objc_msgSend(*(id *)(a1 + 32), "contentPresenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentHasBeenManuallyDeleted:", objc_msgSend(*(id *)(a1 + 32), "lastViewedSeasonWasManuallyDeleted"));
  }

}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[VUISeasonPickerViewController seasonPickerView](self, "seasonPickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VUISeasonPickerViewController__createDiffableDataSource__block_invoke;
  v8[3] = &unk_1E9F98F50;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v5, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __58__VUISeasonPickerViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VUISeparatorView *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  VUISeparatorView *v17;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUISeasonPickerCollectionViewCellIdentifier"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUISeasonPickerCollectionViewCell configureSeasonPickerCell:withMedia:traitCollection:](VUISeasonPickerCollectionViewCell, "configureSeasonPickerCell:withMedia:traitCollection:", v8, v11, v12);

  v13 = objc_alloc_init(VUISeparatorView);
  objc_msgSend(v8, "setTopSeparatorView:", v13);

  v14 = objc_msgSend(v5, "row");
  objc_msgSend(WeakRetained, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaEntities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == objc_msgSend(v16, "count") - 1)
    v17 = objc_alloc_init(VUISeparatorView);
  else
    v17 = 0;

  objc_msgSend(v8, "setBottomSeparatorView:", v17);
  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = CFSTR("SeasonSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUISeasonPickerViewController _getSeasonIdentifiersFromSeasons](self, "_getSeasonIdentifiersFromSeasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("SeasonSection"));

  return v3;
}

- (id)_getSeasonIdentifiersFromSeasons
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUISeasonPickerViewController dataSource](self, "dataSource", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (_VUISeasonPickerView)seasonPickerView
{
  return self->_seasonPickerView;
}

- (void)setSeasonPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_seasonPickerView, a3);
}

- (UIViewController)currentSeasonViewController
{
  return self->_currentSeasonViewController;
}

- (void)setCurrentSeasonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeasonViewController, a3);
}

- (BOOL)lastViewedSeasonWasManuallyDeleted
{
  return self->_lastViewedSeasonWasManuallyDeleted;
}

- (void)setLastViewedSeasonWasManuallyDeleted:(BOOL)a3
{
  self->_lastViewedSeasonWasManuallyDeleted = a3;
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (VUIMediaEntitiesDataSource)dataSource
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_currentSeasonViewController, 0);
  objc_storeStrong((id *)&self->_seasonPickerView, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end
