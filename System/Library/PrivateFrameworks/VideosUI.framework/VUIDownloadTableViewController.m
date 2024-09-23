@implementation VUIDownloadTableViewController

- (VUIDownloadTableViewController)initWithDataSource:(id)a3
{
  id v4;
  VUIDownloadTableViewController *v5;
  VUIDownloadTableViewController *v6;
  VUIViewControllerContentPresenter *v7;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIDownloadTableViewController;
  v5 = -[VUIDownloadTableViewController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VUIDownloadTableViewController setDownloadDataSource:](v5, "setDownloadDataSource:", v4);
    v7 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v6->_contentPresenter;
    v6->_contentPresenter = v7;

    -[VUIViewControllerContentPresenter setLogName:](v6->_contentPresenter, "setLogName:", CFSTR("VUIDownloadTableViewController"));
    objc_initWeak(&location, v6);
    v16[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__VUIDownloadTableViewController_initWithDataSource___block_invoke;
    v12[3] = &unk_1E9F99F98;
    objc_copyWeak(&v13, &location);
    v10 = (id)-[VUIDownloadTableViewController registerForTraitChanges:withHandler:](v6, "registerForTraitChanges:withHandler:", v9, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__VUIDownloadTableViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSizingCell:", 0);

}

- (void)loadView
{
  void *v3;
  id v4;
  UITableView *v5;
  UITableView *downloadEntitiesTableView;
  UITableView *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  UITableView *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *rightBarButtonItem;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  UIBarButtonItem *v23;
  UIBarButtonItem *selectAllBarButtonItem;
  void *v25;
  UIBarButtonItem *v26;
  UIBarButtonItem *backBarButtonItem;
  UIBarButtonItem *v28;
  UIBarButtonItem *leftBarButtonItem;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t v35[16];
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController loadView](&v39, sel_loadView);
  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

  v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  downloadEntitiesTableView = self->_downloadEntitiesTableView;
  self->_downloadEntitiesTableView = v5;

  -[UITableView setDelegate:](self->_downloadEntitiesTableView, "setDelegate:", self);
  -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_downloadEntitiesTableView, "setAllowsMultipleSelectionDuringEditing:", 1);
  -[UITableView setSeparatorStyle:](self->_downloadEntitiesTableView, "setSeparatorStyle:", 0);
  v7 = self->_downloadEntitiesTableView;
  v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v7, "registerClass:forCellReuseIdentifier:", v8, v10);

  v11 = self->_downloadEntitiesTableView;
  v12 = (void *)objc_opt_new();
  -[UITableView setTableFooterView:](v11, "setTableFooterView:", v12);

  -[VUIDownloadTableViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadTableViewController setDiffableDataSource:](self, "setDiffableDataSource:", v13);

  if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("EDIT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (UIBarButtonItem *)objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 0, self, sel__editToggled);
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v17;

    -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRightBarButtonItem:", self->_rightBarButtonItem);

    v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (UIBarButtonItem *)objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 0, self, sel__batchSelectToggled);
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v23;

  }
  -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftBarButtonItem");
  v26 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v26;

  v28 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v28;

  objc_initWeak(&location, self);
  v30 = (void *)MEMORY[0x1E0DC8868];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __42__VUIDownloadTableViewController_loadView__block_invoke;
  v36[3] = &unk_1E9F9B3A0;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v30, "isFullTVAppEnabledwithCompletion:", v36);
  VUIDefaultLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_INFO, "[VUIDownloadTableViewController] - load view - update content view type to loading", v35, 2u);
  }

  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCurrentContentViewType:", 1);

  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setContentView:", self->_downloadEntitiesTableView);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_fullscreenPlaybackUIDidChangeNotification_, VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0], 0);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __42__VUIDownloadTableViewController_loadView__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VUIDownloadTableViewController_loadView__block_invoke_2;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __42__VUIDownloadTableViewController_loadView__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if ((v3 & 1) == 0)
  {
    v13 = WLKIsRegulatedSKU();
    objc_msgSend(WeakRetained, "contentPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (!v13)
    {
      objc_msgSend(v14, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_TITLE_NO_CONNECTION"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNoContentErrorTitle:", v17);

      objc_msgSend(WeakRetained, "contentPresenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LIBRARY_EMPTY_DESCRIPTION_NO_CONNNECTION"), 0, CFSTR("VideosUIEmbedded"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(WeakRetained, "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4)
  {
LABEL_5:
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_TITLE_LIBRARY_ONLY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNoContentErrorTitle:", v15);

    objc_msgSend(WeakRetained, "contentPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("LIBRARY_EMPTY_DESCRIPTION_LIBRARY_ONLY");
    goto LABEL_6;
  }
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_TITLE_NEW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNoContentErrorTitle:", v8);

  objc_msgSend(WeakRetained, "contentPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = CFSTR("LIBRARY_EMPTY_DESCRIPTION_NEW");
LABEL_6:
  objc_msgSend(v10, "localizedStringForKey:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v18 = (void *)v16;
  objc_msgSend(v9, "setNoContentErrorMessage:", v16);

  objc_msgSend(WeakRetained, "contentPresenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "refreshNoContentViewIfNeeded");

  objc_msgSend(WeakRetained, "_toggleRightBarEditItemIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[VUIDownloadTableViewController _clearTableViewSelections:](self, "_clearTableViewSelections:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryDownloaded"));
  -[VUIDownloadTableViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewDidLoad](&v17, sel_viewDidLoad);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("DOWNLOADED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadTableViewController setTitle:](self, "setTitle:", v4);

  -[VUIDownloadDataSource setDownloadDelegate:](self->_downloadDataSource, "setDownloadDelegate:", self);
  if (-[VUILibraryDataSource hasCompletedInitialFetch](self->_downloadDataSource, "hasCompletedInitialFetch"))
  {
    -[VUIDownloadTableViewController downloadDataSource](self, "downloadDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "downloadEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[VUIDownloadTableViewController setDownloadEntities:](self, "setDownloadEntities:", v7);

    -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "currentContentViewType");

      if (v12 != 3)
      {
        -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCurrentContentViewType:", 3);

      }
      -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadTableViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applySnapshot:animatingDifferences:completion:", v14, v12 == 3, 0);

    }
    else
    {
      objc_msgSend(v10, "setCurrentContentViewType:", 2);
    }

    -[VUIDownloadTableViewController _toggleRightBarEditItemIfNeeded](self, "_toggleRightBarEditItemIfNeeded");
  }
  else
  {
    -[VUIDownloadDataSource startFetch](self->_downloadDataSource, "startFetch");
  }
  -[VUIDownloadTableViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"Downloaded\"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v16);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[VUIDownloadTableViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController dealloc](&v4, sel_dealloc);
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
  v9.super_class = (Class)VUIDownloadTableViewController;
  v7 = a4;
  -[VUIDownloadTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__VUIDownloadTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __85__VUIDownloadTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exitEditingMode");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  VUIDownloadEntityTableViewCell *v6;
  VUIDownloadEntityTableViewCell *sizingCell;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VUIDownloadEntityTableViewCell *v12;
  void *v13;
  double v14;
  double v15;
  CGRect v17;

  v5 = a4;
  if (!self->_sizingCell)
  {
    v6 = objc_alloc_init(VUIDownloadEntityTableViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v6;

  }
  -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:](VUIDownloadEntityTableViewCell, "configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:", self->_sizingCell, v11, 1);
  v12 = self->_sizingCell;
  -[VUIDownloadTableViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[VUIDownloadEntityTableViewCell sizeThatFits:](v12, "sizeThatFits:", CGRectGetWidth(v17), 1.79769313e308);
  v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VUIDownloadShowDataSource *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  VUIDownloadShowTableViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  VUIMediaInfo *v31;
  void *v32;
  VUIMediaInfo *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[UITableView isEditing](self->_downloadEntitiesTableView, "isEditing"))
  {
    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemIdentifierForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "downloadType"))
    {
      if (objc_msgSend(v13, "downloadType") == 1 || objc_msgSend(v13, "downloadType") == 2)
      {
        objc_msgSend(v13, "mediaEntities", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILibraryMetrics recordClickOnMediaEntity:](VUILibraryMetrics, "recordClickOnMediaEntity:", v15);
        v16 = -[VUIDownloadShowDataSource initWithMediaEntity:]([VUIDownloadShowDataSource alloc], "initWithMediaEntity:", v15);
        objc_msgSend(v15, "showIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "seasonsFetchRequestWithShowIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mediaLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = -[VUIDownloadShowTableViewController initWithDataSource:seasonsDataSource:]([VUIDownloadShowTableViewController alloc], "initWithDataSource:seasonsDataSource:", v16, v20);
        objc_msgSend(v15, "showTitle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[VUIDownloadShowTableViewController navigationItem](v21, "navigationItem");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "showTitle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setTitle:", v24);

        }
        -[VUIDownloadTableViewController navigationController](self, "navigationController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pushViewController:animated:", v21, 1);

        v10 = v36;
      }
    }
    else
    {
      objc_msgSend(v13, "mediaEntities");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v27;
        objc_msgSend(v28, "downloadExpirationDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29 && !objc_msgSend(v29, "vui_isInTheFuture"))
        {
          -[VUIDownloadTableViewController _configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:](self, "_configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:", v7, 1, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            -[VUIDownloadTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v35, 1, 0);
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

        }
        else
        {
          v31 = [VUIMediaInfo alloc];
          v39[0] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v31, "initWithPlaybackContext:vuiMediaItems:", 3, v32);

          -[VUIMediaInfo setIntent:](v33, "setIntent:", 1);
          -[VUIMediaInfo setAutomaticPlaybackStart:](v33, "setAutomaticPlaybackStart:", 0);
          if (v33)
          {
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __68__VUIDownloadTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
            v37[3] = &unk_1E9F98DF0;
            v38 = v28;
            +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v33, 0, 0, v37);
            v34 = v38;
          }
          else
          {
            VUIDefaultLogObject();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:].cold.1((uint64_t)v28, v34);
          }

        }
      }

    }
    goto LABEL_24;
  }
  -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if ((v9 & 1) == 0)
  {
    -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 1);
LABEL_24:

  }
}

uint64_t __68__VUIDownloadTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:isLaunchingExtras:](VUILibraryMetrics, "recordPlayOfMediaEntity:isLaunchingExtras:", *(_QWORD *)(a1 + 32), 0);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
  {
    -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedRows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);

    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("DONE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("EDIT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id location;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v32 = v6;
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC36C8];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("DELETE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v42[3] = &unk_1E9F99FE8;
    objc_copyWeak(&v44, &location);
    v11 = v6;
    v43 = v11;
    objc_msgSend(v8, "contextualActionWithStyle:title:handler:", 1, v10, v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "addObject:", v31);
    if (v11)
    {
      -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifierForIndexPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "indexPathsForSelectedRows");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v39;
        do
        {
          v19 = 0;
          v20 = v15;
          do
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(v13);
            -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v19), "row"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            ++v19;
            v20 = v15;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v17);
      }
    }

    if (-[VUIDownloadTableViewController _downloadEntityShouldShowRenewOption:](self, "_downloadEntityShouldShowRenewOption:", v15))
    {
      objc_msgSend(v15, "mediaEntities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "downloadExpirationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0DC36C8];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:", CFSTR("RENEW"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
          v35[3] = &unk_1E9F99FE8;
          objc_copyWeak(&v37, &location);
          v36 = v11;
          objc_msgSend(v24, "contextualActionWithStyle:title:handler:", 0, v26, v35);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v27);
          objc_destroyWeak(&v37);
        }

      }
    }
    v28 = (void *)MEMORY[0x1E0DC3D08];
    v29 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v28, "configurationWithActions:", v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

    v6 = v32;
  }

  return v7;
}

void __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureAlertControllerForIndexPath:withCompletion:", *(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setAlertController:", v7);
  objc_msgSend(WeakRetained, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "alertController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

void __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:", *(_QWORD *)(a1 + 32), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_isSelectingAll)
    objc_msgSend(a4, "setSelected:", 1);
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[5];

  -[VUIDownloadTableViewController downloadDataSource](self, "downloadDataSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[VUIDownloadTableViewController setDownloadEntities:](self, "setDownloadEntities:", v7);

  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(v10, "currentContentViewType");

    if (v12 != 3)
    {
      -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCurrentContentViewType:", 3);

    }
    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadTableViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applySnapshot:animatingDifferences:completion:", v14, v12 == 3, 0);

  }
  else
  {
    objc_msgSend(v10, "setCurrentContentViewType:", 2);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__VUIDownloadTableViewController_downloadManager_downloadedFetchDidFinishWithEntities___block_invoke;
    block[3] = &unk_1E9F98DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __87__VUIDownloadTableViewController_downloadManager_downloadedFetchDidFinishWithEntities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popIfNeeded");
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[5];

  -[VUIDownloadTableViewController downloadDataSource](self, "downloadDataSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[VUIDownloadTableViewController setDownloadEntities:](self, "setDownloadEntities:", v7);

  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[VUIDownloadTableViewController contentPresenter](self, "contentPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setCurrentContentViewType:", 3);

    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadTableViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applySnapshot:animatingDifferences:completion:", v12, 1, 0);

  }
  else
  {
    objc_msgSend(v10, "setCurrentContentViewType:", 2);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VUIDownloadTableViewController_downloadManager_downloadsDidChange___block_invoke;
    block[3] = &unk_1E9F98DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __69__VUIDownloadTableViewController_downloadManager_downloadsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popIfNeeded");
}

- (void)setDownloadEntities:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_downloadEntities, a3);
  -[VUIDownloadTableViewController _createIdentifierToDownloadEntityDictionary](self, "_createIdentifierToDownloadEntityDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadTableViewController setIdentifierToDownloadEntityDictionary:](self, "setIdentifierToDownloadEntityDictionary:", v4);

  -[VUIDownloadTableViewController _toggleRightBarEditItemIfNeeded](self, "_toggleRightBarEditItemIfNeeded");
}

- (void)_popIfNeeded
{
  void *v3;
  void *v4;
  VUIDownloadTableViewController *v5;
  id v6;
  id v7;

  -[VUIDownloadTableViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childViewControllers");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") || (unint64_t)objc_msgSend(v7, "count") < 2)
    goto LABEL_5;
  objc_msgSend(v7, "lastObject");
  v5 = (VUIDownloadTableViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[VUIDownloadTableViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);
LABEL_5:

  }
}

- (void)downloadCellDidRequestCancelDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  if (v14)
  {
    -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", objc_msgSend(v14, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      if ((objc_msgSend(v10, "markedAsDeleted") & 1) != 0
        || (objc_msgSend(v10, "downloadExpirationDate"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_downloadEntities, "removeObjectAtIndex:", objc_msgSend(v14, "row"));
        -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadTableViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v13, 1, 0);

      }
    }

    v6 = v14;
  }

}

- (void)_toggleRightBarEditItemIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v8[0] = self->_rightBarButtonItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItems:", v7);

  }
  else
  {
    objc_msgSend(v5, "setRightBarButtonItems:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)_editToggled
{
  void *v3;
  void *v4;
  uint64_t v5;
  UIAlertController *v6;
  UIAlertController *alertController;
  UIAlertController *v8;
  UIBarButtonItem *rightBarButtonItem;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (-[UITableView isEditing](self->_downloadEntitiesTableView, "isEditing"))
  {
    -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForSelectedRows");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[VUIDownloadTableViewController _configureAlertControllerForIndexPath:withCompletion:](self, "_configureAlertControllerForIndexPath:withCompletion:", 0, 0);
      v6 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
      alertController = self->_alertController;
      self->_alertController = v6;

      v8 = self->_alertController;
      if (v8)
        -[VUIDownloadTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      -[VUIDownloadTableViewController _exitEditingMode](self, "_exitEditingMode");
    }
  }
  else
  {
    -[UITableView setEditing:animated:](self->_downloadEntitiesTableView, "setEditing:animated:", 1, 1);
    rightBarButtonItem = self->_rightBarButtonItem;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:", CFSTR("DELETE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](rightBarButtonItem, "setTitle:", v11);

    -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", 0);

    -[VUIDownloadTableViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v15);

    v19 = (id)objc_opt_new();
    if (self->_rightBarButtonItem)
      objc_msgSend(v19, "addObject:");
    if (self->_selectAllBarButtonItem)
      objc_msgSend(v19, "addObject:");
    -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v16, "setRightBarButtonItems:", v17);

    -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeftBarButtonItem:", self->_leftBarButtonItem);

  }
}

- (void)_batchSelectToggled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_isSelectingAll)
  {
    -[VUIDownloadTableViewController setIsSelectingAll:](self, "setIsSelectingAll:", 0);
    -[VUIDownloadTableViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v5);

    -[VUIDownloadTableViewController _clearSelections](self, "_clearSelections");
    -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 0;
  }
  else
  {
    -[VUIDownloadTableViewController setIsSelectingAll:](self, "setIsSelectingAll:", 1);
    -[VUIDownloadTableViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("DESELECT_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

    -[VUIDownloadTableViewController _selectAllCells](self, "_selectAllCells");
    -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "setEnabled:", v7);

}

- (void)_clearSelections
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v10, 1);

        -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForRowAtIndexPath:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setSelected:animated:", 0, 1);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_selectAllCells
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 0);

        -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForRowAtIndexPath:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setSelected:animated:", 1, 1);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)_configureAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  NSMutableArray *v56;
  id *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD aBlock[4];
  NSMutableArray *v73;
  id v74;
  id v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v58 = a4;
  -[UITableView indexPathsForSelectedRows](self->_downloadEntitiesTableView, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v6, "count");

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("DELETE_EXPLANATION"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("DELETE_DOWNLOAD"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIdentifierForIndexPath:", v64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "numberOfMediaItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

  }
  else if (self->_isSelectingAll)
  {
    v14 = -[NSMutableArray count](self->_downloadEntities, "count");
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPathsForSelectedRows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v82 != v18)
            objc_enumerationMutation(v16);
          -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "row"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberOfMediaItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "unsignedIntegerValue");

          v14 += v22;
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      }
      while (v17);
    }

  }
  if (v14 >= 2)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("DELETES_EXPLANATION"));
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:", CFSTR("DELETE_%U_DOWNLOADS"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%u"), 0, v14);
    v28 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v28;
    v63 = (void *)v24;
  }
  v29 = (NSMutableArray *)objc_opt_new();
  if (v64)
  {
    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "itemIdentifierForIndexPath:", v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](v29, "addObject:", v33);
  }
  else if (self->_isSelectingAll)
  {
    v31 = v29;
    v29 = self->_downloadEntities;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "indexPathsForSelectedRows");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v78 != v36)
            objc_enumerationMutation(v31);
          -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "row"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v29, "addObject:", v38);

        }
        v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v35);
    }
  }

  objc_initWeak(&location, self);
  v39 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke;
  aBlock[3] = &unk_1E9F99600;
  v57 = &v75;
  objc_copyWeak(&v75, &location);
  v56 = v29;
  v73 = v56;
  v40 = v58;
  v74 = v40;
  v59 = _Block_copy(aBlock);
  v69[0] = v39;
  v69[1] = 3221225472;
  v69[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_2;
  v69[3] = &unk_1E9F9A060;
  objc_copyWeak(&v71, &location);
  v41 = v40;
  v70 = v41;
  v42 = _Block_copy(v69);
  if (v60)
    v43 = 1;
  else
    v43 = v64 != 0;
  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v63, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v62, CFSTR("%lu"), 0, v60, v56, &v75);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v39;
    v67[1] = 3221225472;
    v67[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_3;
    v67[3] = &unk_1E9F9A088;
    v68 = v59;
    objc_msgSend(v45, "actionWithTitle:style:handler:", v46, 2, v67);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "addAction:", v61);
    v47 = (void *)MEMORY[0x1E0DC3448];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:", CFSTR("CANCEL"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v39;
    v65[1] = 3221225472;
    v65[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_4;
    v65[3] = &unk_1E9F9A088;
    v66 = v42;
    objc_msgSend(v47, "actionWithTitle:style:handler:", v49, 1, v65);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "addAction:", v50);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "userInterfaceIdiom") == 1;

    if (v52)
    {
      objc_msgSend(v44, "setModalPresentationStyle:", 7);
      objc_msgSend(v44, "popoverPresentationController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setBarButtonItem:", v54);

    }
  }
  else
  {
    if (v41)
      (*((void (**)(id, _QWORD))v41 + 2))(v41, 0);
    v44 = 0;
  }

  objc_destroyWeak(&v71);
  objc_destroyWeak(v57);
  objc_destroyWeak(&location);

  return v44;
}

void __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteDownloadEntities:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_exitEditingMode");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);

}

void __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_exitEditingMode");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

}

uint64_t __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void (**v57)(void);
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  id v74;
  void *v75;
  id v76;
  void (**v77)(void);
  _QWORD v78[4];
  id v79;
  _QWORD aBlock[4];
  id v81;
  id v82;
  void (**v83)(void);
  id v84;
  _QWORD v85[4];
  void (**v86)(void);
  _QWORD v87[4];
  void (**v88)(void);
  _QWORD v89[4];
  id v90;
  VUIDownloadTableViewController *v91;
  void (**v92)(void);
  id v93;
  char v94;
  id location;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v77 = (void (**)(void))a5;
  if (v76)
  {
    -[VUIDownloadTableViewController diffableDataSource](self, "diffableDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifierForIndexPath:", v76);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadTableViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathsForSelectedRows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v97;
      do
      {
        v16 = 0;
        v17 = v11;
        do
        {
          if (*(_QWORD *)v97 != v15)
            objc_enumerationMutation(v13);
          -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v16), "row"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v11;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      }
      while (v14);
    }

  }
  objc_msgSend(v11, "mediaEntities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = v19;
    objc_msgSend(v74, "availabilityEndDate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75 && !objc_msgSend(v75, "vui_isInTheFuture"))
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5;
      aBlock[3] = &unk_1E9F997F0;
      objc_copyWeak(&v84, &location);
      v81 = v76;
      v82 = v11;
      v83 = v77;
      v72 = _Block_copy(aBlock);
      v33 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "brandName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0DC3450];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:", CFSTR("DOWNLOAD_NO_LONGER_AVAILABLE"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "alertControllerWithTitle:message:preferredStyle:", v40, v37, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0DC3448];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:", CFSTR("DELETE"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6;
      v78[3] = &unk_1E9F9A088;
      v44 = v72;
      v79 = v44;
      objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, v78);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "addAction:", v45);
      objc_destroyWeak(&v84);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isNetworkReachable");

      if (v21)
      {
        v73 = objc_msgSend(v74, "allowsManualDownloadRenewal");
        if (v73)
        {
          if (a4 == 1)
          {
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v71 = 0;
          }
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_RENEW"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "brandName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithValidatedFormat:validFormatSpecifiers:error:", v50, CFSTR("%@"), 0, v51);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a4 == 1)
          {
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v71 = 0;
          }
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN_BUTTON_TITLE"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_REDOWNLOAD"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "brandName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithValidatedFormat:validFormatSpecifiers:error:", v50, CFSTR("%@"), 0, v51);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v71, v69, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v54 = (void *)MEMORY[0x1E0DC3448];
        v55 = MEMORY[0x1E0C809B0];
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke;
        v89[3] = &unk_1E9F9E6D0;
        objc_copyWeak(&v93, &location);
        v56 = v74;
        v94 = v73;
        v90 = v56;
        v91 = self;
        v57 = v77;
        v92 = v57;
        objc_msgSend(v54, "actionWithTitle:style:handler:", v70, 0, v89);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addAction:", v58);
        v59 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:", CFSTR("CANCEL"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v55;
        v87[1] = 3221225472;
        v87[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3;
        v87[3] = &unk_1E9F9A088;
        v88 = v57;
        objc_msgSend(v59, "actionWithTitle:style:handler:", v61, 1, v87);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "addAction:", v62);
        objc_destroyWeak(&v93);
        objc_destroyWeak(&location);

      }
      else
      {
        v24 = (void *)MEMORY[0x1E0DC3450];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW_MESSAGE"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v26, v28, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:", CFSTR("OK"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4;
        v85[3] = &unk_1E9F9A088;
        v86 = v77;
        objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, v85);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "addAction:", v32);
      }
    }

  }
  else
  {
    if (v77)
      v77[2]();
    v23 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v63, "userInterfaceIdiom") == 1 && v23 != 0;

  if (v65)
  {
    objc_msgSend(v23, "setModalPresentationStyle:", 7);
    objc_msgSend(v23, "popoverPresentationController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setBarButtonItem:", v67);

  }
  return v23;
}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 32), "assetController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fetchNewKeysForDownloadedVideo");

      }
      else
      {
        +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v6, "assetController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "contentAllowsCellularDownload");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2;
        v11[3] = &unk_1E9F9A0B0;
        v12 = *(id *)(a1 + 32);
        objc_msgSend(v5, "preflightDownloadForLibraryMediaEntity:presentingViewController:contentAllowsCellularDownload:completion:", v6, v7, v9, v11);

      }
      v10 = *(_QWORD *)(a1 + 48);
      if (v10)
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
    }
  }

}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", a3, a4, 0, 1, 0);

  }
}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    v5[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_deleteDownloadEntities:", v3);

    objc_msgSend(WeakRetained, "_exitEditingMode");
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }

}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_exitEditingMode
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:animated:", 0, 1);

  -[VUIDownloadTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("EDIT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[VUIDownloadTableViewController setIsSelectingAll:](self, "setIsSelectingAll:", 0);
  -[VUIDownloadTableViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("SELECT_ALL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  v17 = (id)objc_opt_new();
  if (self->_rightBarButtonItem)
    objc_msgSend(v17, "addObject:");
  -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v11, "setRightBarButtonItems:", v12);

  -[VUIDownloadTableViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadTableViewController backBarButtonItem](self, "backBarButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v14);

  -[VUIDownloadTableViewController alertController](self, "alertController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[VUIDownloadTableViewController alertController](self, "alertController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)_deleteDownloadEntities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  VUIDownloadTableViewController *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke;
  v9 = &unk_1E9F98FD8;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v7);

}

void __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "downloadEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDownloadEntities:", v2);
  objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createDiffableDataSourceSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke_2;
  v12[3] = &unk_1E9F98FD8;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  objc_msgSend(v9, "applySnapshot:animatingDifferences:completion:", v10, 1, v12);

}

uint64_t __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteMediaEntitiesInDownloadEntities:", *(_QWORD *)(a1 + 40));
}

- (void)_deleteMediaEntitiesInDownloadEntities:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *assetControllersToRemove;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  assetControllersToRemove = self->_assetControllersToRemove;
  self->_assetControllersToRemove = v5;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v11, "mediaEntities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "assetController");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIDownloadTableViewController assetControllersToRemove](self, "assetControllersToRemove");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v17);

              objc_msgSend(v17, "cancelAndRemoveDownload");
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

}

- (BOOL)_downloadEntityShouldShowRenewOption:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend(v3, "mediaEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "availabilityEndDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "downloadExpirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "vui_isInTheFuture"))
    {
      objc_msgSend(v6, "brandID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "downloadConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "blacklistedEarlyRenewalBrands");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v11) = objc_msgSend(v13, "containsObject:", v10);
        if ((v11 & 1) != 0)
        {

          goto LABEL_12;
        }
      }

    }
    if ((!v7 || objc_msgSend(v7, "vui_isInTheFuture"))
      && (objc_msgSend(v6, "renewsOfflineKeysAutomatically") & 1) == 0)
    {
      v14 = objc_msgSend(v3, "downloadType") == 0;
      goto LABEL_14;
    }
LABEL_12:
    v14 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0DC3D68]);
  -[VUIDownloadTableViewController downloadEntitiesTableView](self, "downloadEntitiesTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VUIDownloadTableViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E9F9E6F8;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, v7);

  return v5;
}

id __59__VUIDownloadTableViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUISeparatorView *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  VUISeparatorView *v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "identifierToDownloadEntityDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDelegate:", *(_QWORD *)(a1 + 32));
  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:](VUIDownloadEntityTableViewCell, "configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:", v12, v14, 0);
  objc_msgSend(v12, "downloadButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "setPresentingViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v14, "setDelegate:", v12);
  if (objc_msgSend(v8, "row"))
  {
    objc_msgSend(v12, "setTopSeparatorView:", 0);
  }
  else
  {
    v17 = objc_alloc_init(VUISeparatorView);
    objc_msgSend(v12, "setTopSeparatorView:", v17);

  }
  v18 = objc_msgSend(v7, "numberOfSections") - 1;
  v19 = objc_msgSend(v7, "numberOfRowsInSection:", v18);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v19 - 1, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "compare:", v20))
  {
    v21 = objc_alloc_init(VUISeparatorView);
    objc_msgSend(v12, "setBottomSeparatorView:", v21);

  }
  else
  {
    objc_msgSend(v12, "setBottomSeparatorView:", 0);
  }

  return v12;
}

- (id)_createDiffableDataSourceSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v7[0] = CFSTR("DownloadTableViewMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUIDownloadTableViewController _identifiersForDownloadEntities](self, "_identifiersForDownloadEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("DownloadTableViewMainSection"));

  return v3;
}

- (id)_createIdentifierToDownloadEntityDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "setValue:forKey:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)_identifiersForDownloadEntities
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
  -[VUIDownloadTableViewController downloadEntities](self, "downloadEntities", 0);
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
        if (v9)
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
  -[VUIDownloadTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUIDownloadTableViewController navigationController](self, "navigationController");
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
  -[VUIDownloadTableViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUIDownloadTableViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (void)_clearTableViewSelections:(BOOL)a3
{
  UITableView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  UITableView *v11;
  id v12;
  _QWORD v13[4];
  UITableView *v14;
  id v15;
  BOOL v16;

  v5 = self->_downloadEntitiesTableView;
  -[UITableView indexPathsForSelectedRows](v5, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIDownloadTableViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      -[UITableView deselectRowAtIndexPath:animated:](v5, "deselectRowAtIndexPath:animated:", v7, 1);
    }

  }
}

uint64_t __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)fullscreenPlaybackUIDidChangeNotification:(id)a3
{
  void *v4;
  char v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreenPlaybackUIBeingShown");

  if ((v5 & 1) == 0)
    -[VUIDownloadTableViewController _clearTableViewSelections:](self, "_clearTableViewSelections:", 1);
}

- (UITableView)downloadEntitiesTableView
{
  return self->_downloadEntitiesTableView;
}

- (void)setDownloadEntitiesTableView:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEntitiesTableView, a3);
}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDataSource, a3);
}

- (UITableViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (NSMutableArray)downloadEntities
{
  return self->_downloadEntities;
}

- (VUIDownloadEntityTableViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, a3);
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, a3);
}

- (UIBarButtonItem)leftBarButtonItem
{
  return self->_leftBarButtonItem;
}

- (void)setLeftBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItem, a3);
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (NSDictionary)identifierToDownloadEntityDictionary
{
  return self->_identifierToDownloadEntityDictionary;
}

- (void)setIdentifierToDownloadEntityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToDownloadEntityDictionary, a3);
}

- (NSMutableArray)assetControllersToRemove
{
  return self->_assetControllersToRemove;
}

- (void)setAssetControllersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (BOOL)isSelectingAll
{
  return self->_isSelectingAll;
}

- (void)setIsSelectingAll:(BOOL)a3
{
  self->_isSelectingAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_identifierToDownloadEntityDictionary, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
  objc_storeStrong((id *)&self->_downloadEntitiesTableView, 0);
}

@end
