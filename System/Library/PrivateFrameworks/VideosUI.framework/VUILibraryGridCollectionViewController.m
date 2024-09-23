@implementation VUILibraryGridCollectionViewController

- (VUILibraryGridCollectionViewController)initWithDataSource:(id)a3 categoryType:(int64_t)a4
{
  id v7;
  id v8;
  VUILibraryGridCollectionViewController *v9;
  VUIViewControllerContentPresenter *v10;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryGridCollectionViewController;
  v9 = -[VUILibraryGridCollectionViewController initWithCollectionViewLayout:](&v18, sel_initWithCollectionViewLayout_, v8);

  if (v9)
  {
    v9->_gridStyle = 5;
    v9->_lastViewWidth = 0.0;
    v9->_gridType = 1;
    objc_storeStrong((id *)&v9->_entitiesDataSource, a3);
    v10 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v9->_contentPresenter;
    v9->_contentPresenter = v10;

    -[VUIViewControllerContentPresenter setLogName:](v9->_contentPresenter, "setLogName:", CFSTR("VUILibraryGridCollectionViewController"));
    v9->_waitingForFetch = 0;
    v9->_categoryType = a4;
    objc_initWeak(&location, v9);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__VUILibraryGridCollectionViewController_initWithDataSource_categoryType___block_invoke;
    v15[3] = &unk_1E9F99F98;
    objc_copyWeak(&v16, &location);
    v13 = (id)-[VUILibraryGridCollectionViewController registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __74__VUILibraryGridCollectionViewController_initWithDataSource_categoryType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1016) = 1;
    objc_msgSend(v5, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "vuiPreferredContentSizeCategory");
    v11 = objc_msgSend(v6, "vuiPreferredContentSizeCategory");

    if (v10 != v11)
    {
      if (objc_msgSend(v8, "vuiIsViewLoaded"))
      {
        objc_msgSend(v8, "vuiView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "window");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          VUIDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "VUILibraryGridCollectionViewController:: size category changed, update traits to relayout the collection view", v15, 2u);
          }

          objc_msgSend(v8, "updateTraitsIfNeeded");
        }
      }
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[VUILibraryDataSource setDelegate:](self->_entitiesDataSource, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController dealloc](&v3, sel_dealloc);
}

- (void)updateWithLatestMediaEntities:(id)a3
{
  void *v4;
  uint64_t v5;

  -[VUILibraryGridCollectionViewController setMediaEntities:](self, "setMediaEntities:", a3);
  -[VUILibraryGridCollectionViewController _updateCurrentViewIfNeeded](self, "_updateCurrentViewIfNeeded");
  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentContentViewType");

  if (v5 == 3)
    -[VUILibraryGridCollectionViewController _applySnapshotFromEntitiesAndAnimateDifferences:](self, "_applySnapshotFromEntitiesAndAnimateDifferences:", 1);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController loadView](&v4, sel_loadView);
  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  void *v29;
  double v30;
  void *v31;
  UIBarButtonItem *v32;
  UIBarButtonItem *currentNavBarButtonItem;
  UICollectionViewDiffableDataSource *v34;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v45.receiver = self;
  v45.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewDidLoad](&v45, sel_viewDidLoad);
  -[VUILibraryGridCollectionViewController _createCollectionView](self, "_createCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v46);
  -[VUILibraryGridCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", Width, CGRectGetHeight(v47));

  -[VUILibraryGridCollectionViewController setCollectionView:](self, "setCollectionView:", v3);
  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController noContentTitle](self, "noContentTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNoContentErrorTitle:", v8);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController noContentErrorMessage](self, "noContentErrorMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNoContentErrorMessage:", v10);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("LIBRARY_LOADING_MESSAGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLoadingMessage:", v13);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:", CFSTR("LIBRARY_LOADING_TITLE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLoadingTitle:", v16);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:", CFSTR("LIBRARY_CLOUD_UPDATE_FAILED_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCloudUpdateFailedTitle:", v19);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:", CFSTR("LIBRARY_CLOUD_UPDATE_FAILED_MESSAGE"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCloudUpdateFailedMessage:", v22);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCurrentContentViewType:", 1);

  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentView:", v25);

  v26 = (void *)MEMORY[0x1E0DC3F98];
  v27 = -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle");
  v28 = -[VUILibraryGridCollectionViewController gridType](self, "gridType");
  -[VUILibraryGridCollectionViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  objc_msgSend(v26, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", v27, v28, 1, CGRectGetWidth(v48));
  self->_cellWidth = v30;

  self->_requiresRelayout = 1;
  self->_gridFilter = 1;
  -[VUILibraryGridCollectionViewController navigationItem](self, "navigationItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftBarButtonItem");
  v32 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  currentNavBarButtonItem = self->_currentNavBarButtonItem;
  self->_currentNavBarButtonItem = v32;

  -[VUILibraryGridCollectionViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v34 = (UICollectionViewDiffableDataSource *)objc_claimAutoreleasedReturnValue();
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v34;

  -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegate:", self);

  -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v37, "hasCompletedInitialFetch");

  if ((_DWORD)v27)
  {
    -[VUILibraryGridCollectionViewController setWaitingForFetch:](self, "setWaitingForFetch:", 0);
    -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mediaEntities");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");
    -[VUILibraryGridCollectionViewController setMediaEntities:](self, "setMediaEntities:", v40);

    -[VUILibraryGridCollectionViewController _updateCurrentViewIfNeeded](self, "_updateCurrentViewIfNeeded");
    -[VUILibraryGridCollectionViewController _applyInitialSnapshot](self, "_applyInitialSnapshot");
  }
  else
  {
    -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "startFetch");

    -[VUILibraryGridCollectionViewController setWaitingForFetch:](self, "setWaitingForFetch:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library.id=\"%@\"), CFSTR("Collection"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityIdentifier:", v44);

}

- (void)viewWillAppear:(BOOL)a3
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
  v11.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[VUILibraryGridCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  if (self->_lastViewWidth != v6)
    -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", v6, v8);
  -[VUILibraryGridCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[VUILibraryGridCollectionViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[VUILibraryGridCollectionViewController pageType](self, "pageType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VUILibraryGridCollectionViewController pageType](self, "pageType");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("LibraryMain");
  }
  v6 = v5;

  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", v6);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  int *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface") && !self->_forceBackButton)
  {
    -[VUILibraryGridCollectionViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &OBJC_IVAR___VUILibraryGridCollectionViewController__libraryBarButton;
  }
  else
  {
    -[VUILibraryGridCollectionViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &OBJC_IVAR___VUILibraryGridCollectionViewController__currentNavBarButtonItem;
  }
  objc_msgSend(v5, "setLeftBarButtonItem:", *(Class *)((char *)&self->super.super.super.super.isa + *v6));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double Width;
  void *v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryGridCollectionViewController;
  -[VUILibraryGridCollectionViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[VUILibraryGridCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  if (self->_requiresRelayout)
  {
    -[VUILibraryGridCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v7);
    -[VUILibraryGridCollectionViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", Width, CGRectGetHeight(v8));

    self->_requiresRelayout = 0;
  }
}

- (void)setMediaEntities:(id)a3
{
  id v5;
  NSArray **p_mediaEntities;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_mediaEntities = &self->_mediaEntities;
  objc_storeStrong((id *)p_mediaEntities, a3);
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSArray count](*p_mediaEntities, "count");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController:Setting %lu media entities", (uint8_t *)&v9, 0xCu);
  }

}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[VUILibraryGridCollectionViewController setWaitingForFetch:](self, "setWaitingForFetch:", 0);
    -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[VUILibraryGridCollectionViewController setMediaEntities:](self, "setMediaEntities:", v8);

    -[VUILibraryGridCollectionViewController _updateCurrentViewIfNeeded](self, "_updateCurrentViewIfNeeded");
    -[VUILibraryGridCollectionViewController _applySnapshotFromEntitiesAndAnimateDifferences:](self, "_applySnapshotFromEntitiesAndAnimateDifferences:", 0);
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[VUILibraryGridCollectionViewController _computeBottomMargin](self, "_computeBottomMargin", a3, a4, a5);
  v7 = v6;
  v8 = -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle");
  v9 = 0.0;
  if (v8 == 5)
    v9 = 10.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = v7;
  result.right = v11;
  result.bottom = v12;
  result.left = v10;
  result.top = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  NSMutableDictionary *cellMetrics;
  void *v20;
  double v21;
  double v22;
  CGSize result;

  v6 = a5;
  -[VUILibraryGridCollectionViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAXEnabled");

  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cellMetrics, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_cellMetrics, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "CGSizeValue");
      v12 = v11;
      v14 = v13;

    }
    else
    {
      -[VUILibraryGridCollectionViewController _configureSizingCellForItemAtIndexPath:](self, "_configureSizingCellForItemAtIndexPath:", v6);
      -[UICollectionViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", self->_cellWidth, 1.79769313e308);
      v12 = v17;
      v14 = v18;
      cellMetrics = self->_cellMetrics;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](cellMetrics, "setObject:forKey:", v20, v6);

    }
  }
  else
  {
    -[VUILibraryGridCollectionViewController _configureSizingCellForItemAtIndexPath:](self, "_configureSizingCellForItemAtIndexPath:", v6);
    -[UICollectionViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", self->_cellWidth, 1.79769313e308);
    v12 = v15;
    v14 = v16;
    self->_cellSize.width = v15;
    self->_cellSize.height = v16;
  }

  v21 = v12;
  v22 = v14;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v6 = a5;
  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v13, "count");
  v8 = objc_msgSend(v6, "row");

  if ((unint64_t)(v7 - v8) > 0x13)
  {

  }
  else
  {
    v9 = -[VUILibraryGridCollectionViewController waitingForFetch](self, "waitingForFetch");

    if (!v9)
    {
      -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "loadNextEntityBatch");

        -[VUILibraryGridCollectionViewController setWaitingForFetch:](self, "setWaitingForFetch:", 1);
      }
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[VUILibraryGridCollectionViewController _iOSHandleCellSelectionAtIndexPath:](self, "_iOSHandleCellSelectionAtIndexPath:", a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryGridCollectionViewController;
  v7 = a4;
  -[VUILibraryGridCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__VUILibraryGridCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9FA1528;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __93__VUILibraryGridCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_iOSHandleCellSelectionAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "row");

  objc_msgSend(v17, "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "gridCollectionViewController:didSelectMediaEntity:", self, v6);
  }
  else
  {
    -[VUILibraryGridCollectionViewController familyMember](self, "familyMember");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILibraryViewFactory viewControllerForMediaEntity:withFamilyMember:](VUILibraryViewFactory, "viewControllerForMediaEntity:withFamilyMember:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Library.id=\"%@\"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityIdentifier:", v15);

    -[VUILibraryGridCollectionViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushViewController:animated:", v9, 1);

    +[VUILibraryMetrics recordClickOnMediaEntity:](VUILibraryMetrics, "recordClickOnMediaEntity:", v6);
  }

}

- (void)setTitle:(id)a3 withLargeTitleDisplayEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[VUILibraryGridCollectionViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v10);
  if (!a4)
    objc_msgSend(v6, "setLargeTitleDisplayMode:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library.id=\"%@\"), v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v9);

}

- (id)_createCollectionView
{
  void *v2;
  VUILegacyCollectionView *v3;
  VUILegacyCollectionView *v4;
  void *v5;

  -[VUILibraryGridCollectionViewController _createCollectionViewFlowLayout](self, "_createCollectionViewFlowLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [VUILegacyCollectionView alloc];
  v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUILegacyCollectionView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
  -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUILibraryLockupCellReuseIdentifier"));
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[VUILegacyCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("VUILibraryCollectionHeaderReuseIdentifier"));
  return v4;
}

- (id)_createCollectionViewFlowLayout
{
  VUITopAlignedCollectionViewFlowLayout *v2;

  v2 = objc_alloc_init(VUITopAlignedCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v2, "setMinimumLineSpacing:", 0.0);
  return v2;
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
  -[VUILibraryGridCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__VUILibraryGridCollectionViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E9F98F50;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __67__VUILibraryGridCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryLockupCellReuseIdentifier"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "cellWidth");
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", v8, v11, 0);
  if (objc_msgSend(WeakRetained, "hideLockupTitles"))
    objc_msgSend(v8, "setHideTitleLabel:", 1);

  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSUInteger v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  NSUInteger v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14[0] = CFSTR("GridMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUILibraryGridCollectionViewController _getEntityIdentifiersFromEntities](self, "_getEntityIdentifiersFromEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("GridMainSection"));
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    v8 = -[NSArray count](self->_mediaEntities, "count");
    v10 = 134218240;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController:Creating snapshot using %lu media entity identifiers and %lu entities", (uint8_t *)&v10, 0x16u);
  }

  return v3;
}

- (id)_getEntityIdentifiersFromEntities
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_configureSizingCellForItemAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UICollectionViewCell *sizingCell;
  VUILibraryLockupViewCell *v10;
  UICollectionViewCell *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v13, "row");

  if (v5 <= v6)
  {
    v8 = 0;
  }
  else
  {
    -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v13, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v10 = objc_alloc_init(VUILibraryLockupViewCell);
    v11 = self->_sizingCell;
    self->_sizingCell = &v10->super;

    -[UICollectionViewCell setHidden:](self->_sizingCell, "setHidden:", 1);
    -[VUILibraryGridCollectionViewController vuiView](self, "vuiView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_sizingCell);

    sizingCell = self->_sizingCell;
  }
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", sizingCell, v8, 1, self->_cellWidth);
  if (-[VUILibraryGridCollectionViewController hideLockupTitles](self, "hideLockupTitles"))
    -[UICollectionViewCell setHideTitleLabel:](self->_sizingCell, "setHideTitleLabel:", 1);

}

- (double)_computeBottomMargin
{
  void *v3;
  UICollectionViewCell *sizingCell;
  double result;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController _configureSizingCellForItemAtIndexPath:](self, "_configureSizingCellForItemAtIndexPath:", v3);

  sizingCell = self->_sizingCell;
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  -[UICollectionViewCell bottomMarginWithBaselineMargin:](sizingCell, "bottomMarginWithBaselineMargin:");
  if (result == 0.0)
  {
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
    v7 = v6;
    -[VUILibraryGridCollectionViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v8, v7);
    v10 = v9;

    return v10;
  }
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
  -[VUILibraryGridCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUILibraryGridCollectionViewController navigationController](self, "navigationController");
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
  -[VUILibraryGridCollectionViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUILibraryGridCollectionViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (void)_updateLayoutForSize:(CGSize)a3
{
  CGFloat width;
  NSMutableDictionary *v5;
  NSMutableDictionary *cellMetrics;
  uint64_t v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  width = a3.width;
  self->_cellSize = (CGSize)*MEMORY[0x1E0C9D820];
  v5 = (NSMutableDictionary *)objc_opt_new();
  cellMetrics = self->_cellMetrics;
  self->_cellMetrics = v5;

  v7 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", width);
  v8 = 3;
  if ((unint64_t)(v7 - 4) < 3)
    v8 = 5;
  self->_gridStyle = v8;
  -[VUILibraryGridCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionViewLayout");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_collectionInteritemSpace:gridType:windowWidth:", -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle"), -[VUILibraryGridCollectionViewController gridType](self, "gridType"), width);
  objc_msgSend(v22, "setMinimumInteritemSpacing:");
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle"), -[VUILibraryGridCollectionViewController gridType](self, "gridType"), 1, width);
  self->_cellWidth = v10;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", width);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[VUILibraryGridCollectionViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentInset:", v12, v14, v16, v18);

  self->_lastViewWidth = width;
  -[VUILibraryGridCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "collectionViewLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidateLayout");

}

- (void)_updateCurrentViewIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  id v8;

  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 3;
  }
  else if (-[VUILibraryGridCollectionViewController _isDeviceMediaLibraryInitialUpdateInProgress](self, "_isDeviceMediaLibraryInitialUpdateInProgress"))
  {
    -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 1;
  }
  else
  {
    v7 = -[VUILibraryGridCollectionViewController _didFailUpdateCloudLibrary](self, "_didFailUpdateCloudLibrary");
    -[VUILibraryGridCollectionViewController contentPresenter](self, "contentPresenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
      v6 = 4;
    else
      v6 = 2;
  }
  objc_msgSend(v5, "setCurrentContentViewType:", v6);

}

- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress
{
  void *v2;
  void *v3;
  char v4;

  -[VUILibraryGridCollectionViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isInitialUpdateInProgress");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_didFailUpdateCloudLibrary
{
  void *v2;
  void *v3;
  char v4;

  -[VUILibraryGridCollectionViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "didFailUpdateCloudLibrary");
  else
    v4 = 0;

  return v4;
}

- (id)_deviceMediaLibrary
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v4 = +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");

  if (!v4)
  {
    v6 = 0;
    return v6;
  }
  -[VUILibraryGridCollectionViewController entitiesDataSource](self, "entitiesDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v3;
    v6 = v3;
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (void)_applyInitialSnapshot
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 0x35)
  {
    -[VUILibraryGridCollectionViewController mediaEntities](self, "mediaEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subarrayWithRange:", 0, 54);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "identifier", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_opt_new();
    v22 = CFSTR("GridMainSection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendSectionsWithIdentifiers:", v15);

    objc_msgSend(v7, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, CFSTR("GridMainSection"));

    -[VUILibraryGridCollectionViewController diffableDataSource](self, "diffableDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applySnapshot:animatingDifferences:", v14, 0);

    -[VUILibraryGridCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__applySnapshotFromEntitiesAndAnimateDifferences_, MEMORY[0x1E0C9AAB0], 2.0);
  }
  else
  {
    -[VUILibraryGridCollectionViewController _applySnapshotFromEntitiesAndAnimateDifferences:](self, "_applySnapshotFromEntitiesAndAnimateDifferences:", 0);
  }
}

- (void)_applySnapshotFromEntitiesAndAnimateDifferences:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Creating full snapshot", buf, 2u);
  }

  -[VUILibraryGridCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Snapshot created", v9, 2u);
  }

  -[VUILibraryGridCollectionViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySnapshot:animatingDifferences:completion:", v6, v3, &__block_literal_global_114);

}

void __90__VUILibraryGridCollectionViewController__applySnapshotFromEntitiesAndAnimateDifferences___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VUIDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D96EE000, v0, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Snapshot applied", v1, 2u);
  }

}

- (id)noContentTitle
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[VUILibraryGridCollectionViewController categoryType](self, "categoryType");
  if (v2)
  {
    if (v2 == 3)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_NO_TV_SHOWS_TITLE");
    }
    else if (v2 == 2)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_NO_MOVIES_TITLE");
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_GENERIC_FETCH_ERROR_TITLE");
    }
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LIBRARY_EMPTY_TITLE_NEW");
  }
  objc_msgSend(v3, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)noContentErrorMessage
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = -[VUILibraryGridCollectionViewController categoryType](self, "categoryType");
  if (v2)
  {
    if (v2 == 3)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_NO_TV_SHOWS_MESSAGE");
    }
    else
    {
      if (v2 != 2)
      {
        v6 = &stru_1E9FF3598;
        return v6;
      }
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_NO_MOVIES_MESSAGE");
    }
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LIBRARY_EMPTY_DESCRIPTION_NEW");
  }
  objc_msgSend(v3, "localizedStringForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (VUILibraryGridCollectionViewControllerDelegate)delegate
{
  return (VUILibraryGridCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)gridFilter
{
  return self->_gridFilter;
}

- (void)setGridFilter:(int64_t)a3
{
  self->_gridFilter = a3;
}

- (BOOL)hideLockupTitles
{
  return self->_hideLockupTitles;
}

- (void)setHideLockupTitles:(BOOL)a3
{
  self->_hideLockupTitles = a3;
}

- (UIBarButtonItem)libraryBarButton
{
  return self->_libraryBarButton;
}

- (void)setLibraryBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_libraryBarButton, a3);
}

- (BOOL)forceBackButton
{
  return self->_forceBackButton;
}

- (void)setForceBackButton:(BOOL)a3
{
  self->_forceBackButton = a3;
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
  objc_storeStrong((id *)&self->_pageType, a3);
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (VUIMediaEntitiesDataSource)entitiesDataSource
{
  return self->_entitiesDataSource;
}

- (void)setEntitiesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesDataSource, a3);
}

- (VUIMediaEntityFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (UICollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (UIBarButtonItem)currentNavBarButtonItem
{
  return self->_currentNavBarButtonItem;
}

- (void)setCurrentNavBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentNavBarButtonItem, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (BOOL)waitingForFetch
{
  return self->_waitingForFetch;
}

- (void)setWaitingForFetch:(BOOL)a3
{
  self->_waitingForFetch = a3;
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_currentNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_entitiesDataSource, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_libraryBarButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_sizingHeaderView, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
}

@end
