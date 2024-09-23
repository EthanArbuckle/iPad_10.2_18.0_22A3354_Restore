@implementation VUIDownloadCollectionViewController

- (VUIDownloadCollectionViewController)initWithDataSource:(id)a3
{
  id v4;
  VUIDownloadCollectionViewController *v5;
  VUIDownloadCollectionViewController *v6;
  void *v7;
  void *v8;
  VUIViewControllerContentPresenter *v9;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIDownloadCollectionViewController;
  v5 = -[VUIDownloadCollectionViewController init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VUIDownloadCollectionViewController setDownloadDataSource:](v5, "setDownloadDataSource:", v4);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("DOWNLOADED"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewController setTitle:](v6, "setTitle:", v8);

    -[VUIDownloadCollectionViewController setGridStyle:](v6, "setGridStyle:", 5);
    -[VUIDownloadCollectionViewController setGridType:](v6, "setGridType:", 1);
    v9 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v6->_contentPresenter;
    v6->_contentPresenter = v9;

    -[VUIViewControllerContentPresenter setLogName:](v6->_contentPresenter, "setLogName:", CFSTR("VUIDownloadCollectionViewController"));
    v6->_isEditing = 0;
    v6->_isSelectingAll = 0;
    v6->_lastViewWidth = 0.0;
    -[VUIDownloadCollectionViewController view](v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"Downloaded\"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", v12);

    objc_initWeak(&location, v6);
    v20[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__VUIDownloadCollectionViewController_initWithDataSource___block_invoke;
    v16[3] = &unk_1E9F99F98;
    objc_copyWeak(&v17, &location);
    v14 = (id)-[VUIDownloadCollectionViewController registerForTraitChanges:withHandler:](v6, "registerForTraitChanges:withHandler:", v13, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __58__VUIDownloadCollectionViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  objc_msgSend(WeakRetained, "_updateLayoutForSize:", v2, v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  VUILegacyCollectionView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  VUILegacyCollectionView *v11;
  id v12;
  _QWORD v13[4];
  VUILegacyCollectionView *v14;
  id v15;
  BOOL v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController viewWillAppear:](&v17, sel_viewWillAppear_);
  v5 = self->_collectionView;
  -[VUILegacyCollectionView indexPathsForSelectedItems](v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIDownloadCollectionViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      -[VUILegacyCollectionView deselectItemAtIndexPath:animated:](v5, "deselectItemAtIndexPath:animated:", v7, 1);
    }

  }
}

uint64_t __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *rightBarButtonItem;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *selectAllBarButtonItem;
  void *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *backBarButtonItem;
  UIBarButtonItem *v20;
  UIBarButtonItem *leftBarButtonItem;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController loadView](&v32, sel_loadView);
  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

  -[VUIDownloadCollectionViewController _createCollectionView](self, "_createCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController setCollectionView:](self, "setCollectionView:", v4);

  -[VUIDownloadCollectionViewController _createDiffableDataSource](self, "_createDiffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5);

  if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("EDIT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIBarButtonItem *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, sel__editToggled);
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v9;

    -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", self->_rightBarButtonItem);

    v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (UIBarButtonItem *)objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 0, self, sel__batchSelectToggled);
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v15;

  }
  -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftBarButtonItem");
  v18 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v18;

  v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v20;

  objc_initWeak(&location, self);
  v22 = (void *)MEMORY[0x1E0DC8868];
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __47__VUIDownloadCollectionViewController_loadView__block_invoke;
  v29 = &unk_1E9F9B3A0;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v22, "isFullTVAppEnabledwithCompletion:", &v26);
  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter", v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCurrentContentViewType:", 1);

  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentView:", v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __47__VUIDownloadCollectionViewController_loadView__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VUIDownloadCollectionViewController_loadView__block_invoke_2;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __47__VUIDownloadCollectionViewController_loadView__block_invoke_2(uint64_t a1)
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

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[VUIDownloadCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[VUIDownloadCollectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryDownloaded"));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDownloadDelegate:", self);

  -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasCompletedInitialFetch");

  if ((v5 & 1) != 0)
  {
    -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "downloadEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[VUIDownloadCollectionViewController setDownloadEntities:](self, "setDownloadEntities:", v8);

    -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v13 = objc_msgSend(v11, "currentContentViewType");

      if (v13 != 3)
      {
        -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCurrentContentViewType:", 3);

      }
      -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v15, v13 == 3, 0);

    }
    else
    {
      objc_msgSend(v11, "setCurrentContentViewType:", 2);
    }
  }
  else
  {
    VUIDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Fetching downloads", v17, 2u);
    }

    -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startFetch");
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  -[VUIDownloadCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[VUIDownloadCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", v6, v7);

  -[VUIDownloadCollectionViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)setDownloadEntities:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *downloadEntities;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "identifier", (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[VUIDownloadCollectionViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "mediaEntities");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(v14, "setMediaEntities:", v16);

            v17 = v5;
            v18 = v14;
          }
          else
          {
            v17 = v5;
            v18 = v11;
          }
          -[NSMutableArray addObject:](v17, "addObject:", v18);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  downloadEntities = self->_downloadEntities;
  self->_downloadEntities = v5;

  -[VUIDownloadCollectionViewController _createIdentifierToDownloadEntityDictionary](self, "_createIdentifierToDownloadEntityDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController setIdentifierToDownloadEntityDictionary:](self, "setIdentifierToDownloadEntityDictionary:", v20);

  -[VUIDownloadCollectionViewController _toggleRightBarEditItemIfNeeded](self, "_toggleRightBarEditItemIfNeeded");
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
  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
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
  v9.super_class = (Class)VUIDownloadCollectionViewController;
  v7 = a4;
  -[VUIDownloadCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__VUIDownloadCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __90__VUIDownloadCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v1, "_updateLayoutForSize:", v2, v3);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend(v9, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));
  if (-[VUIDownloadCollectionViewController isEditing](self, "isEditing")
    && -[VUIDownloadCollectionViewController isSelectingAll](self, "isSelectingAll"))
  {
    -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v7, 1, 0);

    objc_msgSend(v9, "setSelected:", 1);
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIDownloadShowDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VUIDownloadShowTableViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  VUIMediaInfo *v32;
  void *v33;
  VUIMediaInfo *v34;
  NSObject *v35;
  VUIMediaInfo *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  _QWORD aBlock[4];
  id v98;
  _QWORD v99[4];
  id v100;
  VUIDownloadCollectionViewController *v101;
  id v102;
  char v103;
  id location;
  _QWORD v105[4];
  NSObject *v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[VUIDownloadCollectionViewController isEditing](self, "isEditing"))
  {
    objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:animated:", 1, 1);
    -[VUIDownloadCollectionViewController _updateSelectAllBarButtonItemIfNecessary](self, "_updateSelectAllBarButtonItemIfNecessary");

  }
  else
  {
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
    -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadCollectionViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v10);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v94, "mediaEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      VUIDefaultLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VUIDownloadCollectionViewController collectionView:didSelectItemAtIndexPath:].cold.1((uint64_t)v10, v24, v25, v26, v27, v28, v29, v30);

      goto LABEL_30;
    }
    if (objc_msgSend(v94, "downloadType"))
    {
      if (objc_msgSend(v94, "downloadType") == 1 || objc_msgSend(v94, "downloadType") == 2)
      {
        +[VUILibraryMetrics recordClickOnMediaEntity:](VUILibraryMetrics, "recordClickOnMediaEntity:", v13);
        v14 = -[VUIDownloadShowDataSource initWithMediaEntity:]([VUIDownloadShowDataSource alloc], "initWithMediaEntity:", v13);
        objc_msgSend(v13, "showIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "seasonsFetchRequestWithShowIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mediaLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = -[VUIDownloadShowTableViewController initWithDataSource:seasonsDataSource:]([VUIDownloadShowTableViewController alloc], "initWithDataSource:seasonsDataSource:", v14, v18);
        objc_msgSend(v13, "showTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[VUIDownloadShowTableViewController navigationItem](v19, "navigationItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "showTitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTitle:", v22);

        }
        -[VUIDownloadCollectionViewController navigationController](self, "navigationController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pushViewController:animated:", v19, 1);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v93 = v13;
        objc_msgSend(v93, "downloadExpirationDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v31;
        if (v31 && !objc_msgSend(v31, "vui_isInTheFuture"))
        {
          objc_msgSend(v93, "availabilityEndDate");
          v36 = (VUIMediaInfo *)objc_claimAutoreleasedReturnValue();
          v34 = v36;
          if (v36 && !-[VUIMediaInfo vui_isInTheFuture](v36, "vui_isInTheFuture"))
          {
            objc_initWeak(&location, self);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
            aBlock[3] = &unk_1E9F99C98;
            objc_copyWeak(&v98, &location);
            v82 = _Block_copy(aBlock);
            v89 = (void *)MEMORY[0x1E0CB3940];
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "brandName");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "stringWithValidatedFormat:validFormatSpecifiers:error:", v63, CFSTR("%@"), 0, v64);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = (void *)MEMORY[0x1E0DC3450];
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "localizedStringForKey:", CFSTR("DOWNLOAD_NO_LONGER_AVAILABLE"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "alertControllerWithTitle:message:preferredStyle:", v67, v85, 1);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            v68 = (void *)MEMORY[0x1E0DC3448];
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "localizedStringForKey:", CFSTR("DELETE"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
            v95[3] = &unk_1E9F9A088;
            v71 = v82;
            v96 = v71;
            objc_msgSend(v68, "actionWithTitle:style:handler:", v70, 0, v95);
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v90, "addAction:", v72);
            -[VUIDownloadCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v90, 1, 0);

            objc_destroyWeak(&v98);
            objc_destroyWeak(&location);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isNetworkReachable");

            if (v38)
            {
              v84 = objc_msgSend(v93, "allowsManualDownloadRenewal");
              +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v84)
              {
                objc_msgSend(v39, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
                v83 = (id *)objc_claimAutoreleasedReturnValue();

                +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = (void *)MEMORY[0x1E0CB3940];
                +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_RENEW"));
              }
              else
              {
                objc_msgSend(v39, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN"));
                v83 = (id *)objc_claimAutoreleasedReturnValue();

                +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN_BUTTON_TITLE"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = (void *)MEMORY[0x1E0CB3940];
                +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_REDOWNLOAD"));
              }
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "brandName");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithValidatedFormat:validFormatSpecifiers:error:", v87, CFSTR("%@"), 0, v44);
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v83, v81, 1);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_initWeak(&location, self);
              v74 = (void *)MEMORY[0x1E0DC3448];
              v99[0] = MEMORY[0x1E0C809B0];
              v99[1] = 3221225472;
              v99[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_78;
              v99[3] = &unk_1E9FA06A8;
              objc_copyWeak(&v102, &location);
              v75 = v93;
              v103 = v84;
              v100 = v75;
              v101 = self;
              objc_msgSend(v74, "actionWithTitle:style:handler:", v80, 0, v99);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "addAction:", v86);
              v76 = (void *)MEMORY[0x1E0DC3448];
              +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "localizedStringForKey:", CFSTR("CANCEL"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "actionWithTitle:style:handler:", v78, 1, 0);
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v91, "addAction:", v79);
              -[VUIDownloadCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v91, 1, 0);

              objc_destroyWeak(&v102);
              objc_destroyWeak(&location);

            }
            else
            {
              v53 = (void *)MEMORY[0x1E0DC3450];
              +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW_MESSAGE"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "alertControllerWithTitle:message:preferredStyle:", v54, v56, 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              v58 = (void *)MEMORY[0x1E0DC3448];
              +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "localizedStringForKey:", CFSTR("OK"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "actionWithTitle:style:handler:", v60, 1, 0);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "addAction:", v61);
              -[VUIDownloadCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v57, 1, 0);

            }
          }
        }
        else
        {
          v32 = [VUIMediaInfo alloc];
          v107[0] = v93;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v32, "initWithPlaybackContext:vuiMediaItems:", 3, v33);

          -[VUIMediaInfo setIntent:](v34, "setIntent:", 1);
          -[VUIMediaInfo setAutomaticPlaybackStart:](v34, "setAutomaticPlaybackStart:", 0);
          if (v34)
          {
            v105[0] = MEMORY[0x1E0C809B0];
            v105[1] = 3221225472;
            v105[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
            v105[3] = &unk_1E9F98DF0;
            v106 = v93;
            +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v34, 0, 0, v105);
            v35 = v106;
          }
          else
          {
            VUIDefaultLogObject();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[VUIDownloadCollectionViewController collectionView:didSelectItemAtIndexPath:].cold.2((uint64_t)v93, v35, v45, v46, v47, v48, v49, v50);
          }

        }
      }
    }

  }
  -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEnabled");

  if ((v52 & 1) == 0)
  {
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 1);
LABEL_30:

  }
}

uint64_t __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:isLaunchingExtras:](VUILibraryMetrics, "recordPlayOfMediaEntity:isLaunchingExtras:", *(_QWORD *)(a1 + 32), 0);
}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_78(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (*(_BYTE *)(a1 + 56))
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
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
        v10[3] = &unk_1E9F9A0B0;
        v11 = *(id *)(a1 + 32);
        objc_msgSend(v5, "preflightDownloadForLibraryMediaEntity:presentingViewController:contentAllowsCellularDownload:completion:", v6, v7, v9, v10);

      }
    }
  }

}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", a3, a4, 0, 1, 0);

  }
}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(WeakRetained, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(WeakRetained, "downloadEntities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained, "_deleteDownloadEntities:", v2);
  objc_msgSend(WeakRetained, "_exitEditingMode");

}

uint64_t __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:animated:", 0, 1);
  -[VUIDownloadCollectionViewController _updateSelectAllBarButtonItemIfNecessary](self, "_updateSelectAllBarButtonItemIfNecessary");

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  VUIDownloadCollectionViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  double cellWidth;
  int v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGSize result;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(VUIDownloadCollectionViewCell);
    -[VUIDownloadCollectionViewController setSizingCell:](self, "setSizingCell:", v8);

  }
  -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadCollectionViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController cellWidth](self, "cellWidth");
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v13, v12, 1);

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController cellWidth](self, "cellWidth");
  objc_msgSend(v15, "sizeThatFits:");
  v17 = v16;
  v19 = v18;

  if (v17 <= 0.0 || v19 <= 0.0)
  {
    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      cellWidth = self->_cellWidth;
      v24 = 134218754;
      v25 = v17;
      v26 = 2048;
      v27 = v19;
      v28 = 2048;
      v29 = cellWidth;
      v30 = 2112;
      v31 = v12;
      _os_log_error_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_ERROR, "[VUIDownloadCollectionViewController] Incorrect sizing for item width:%f height:%f cellWidth:%f forEntity:%@", (uint8_t *)&v24, 0x2Au);
    }

  }
  v21 = v17;
  v22 = v19;
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

  -[VUIDownloadCollectionViewController _computeBottomMargin](self, "_computeBottomMargin", a3, a4, a5);
  v6 = v5;
  v7 = 10.0;
  v8 = 0.0;
  v9 = 0.0;
  result.right = v9;
  result.bottom = v6;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Fetching downloads completed", v16, 2u);
  }

  -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[VUIDownloadCollectionViewController setDownloadEntities:](self, "setDownloadEntities:", v8);

  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "currentContentViewType");

    if (v13 != 3)
    {
      -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCurrentContentViewType:", 3);

    }
    -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v15, v13 == 3, 0);

  }
  else
  {
    objc_msgSend(v11, "setCurrentContentViewType:", 2);
  }

}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Downloads changed", v14, 2u);
  }

  -[VUIDownloadCollectionViewController downloadDataSource](self, "downloadDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[VUIDownloadCollectionViewController setDownloadEntities:](self, "setDownloadEntities:", v8);

  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[VUIDownloadCollectionViewController contentPresenter](self, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "setCurrentContentViewType:", 3);

    -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v13, 1, 0);

  }
  else
  {
    objc_msgSend(v11, "setCurrentContentViewType:", 2);
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
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v17;
  if (v17)
  {
    -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v17, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "mediaEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      if ((objc_msgSend(v11, "markedAsDeleted") & 1) != 0
        || (objc_msgSend(v11, "downloadExpirationDate"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v17, "row"));

        -[VUIDownloadCollectionViewController _createIdentifierToDownloadEntityDictionary](self, "_createIdentifierToDownloadEntityDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadCollectionViewController setIdentifierToDownloadEntityDictionary:](self, "setIdentifierToDownloadEntityDictionary:", v14);

        -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadCollectionViewController _createDiffableDataSourceSnapshot](self, "_createDiffableDataSourceSnapshot");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "applySnapshot:animatingDifferences:completion:", v16, 1, 0);

      }
    }

    v6 = v17;
  }

}

- (id)_createCollectionView
{
  VUITopAlignedCollectionViewFlowLayout *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  VUILegacyCollectionView *v10;
  VUILegacyCollectionView *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  CGRect v17;

  v3 = objc_alloc_init(VUITopAlignedCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  v4 = (void *)MEMORY[0x1E0DC3F98];
  v5 = -[VUIDownloadCollectionViewController gridStyle](self, "gridStyle");
  v6 = -[VUIDownloadCollectionViewController gridType](self, "gridType");
  -[VUIDownloadCollectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v4, "vui_collectionInteritemSpace:gridType:windowWidth:", v5, v6, CGRectGetWidth(v17));
  v9 = v8;

  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", v9);
  v10 = [VUILegacyCollectionView alloc];
  v11 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v10, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[VUILegacyCollectionView setAllowsMultipleSelection:](v11, "setAllowsMultipleSelection:", 1);
  -[VUILegacyCollectionView setDelegate:](v11, "setDelegate:", self);
  -[VUILegacyCollectionView setAlwaysBounceVertical:](v11, "setAlwaysBounceVertical:", 1);
  v13 = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v13, v15);

  return v11;
}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__VUIDownloadCollectionViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E9FA06D0;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v7);

  return v5;
}

id __64__VUIDownloadCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "identifierToDownloadEntityDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cellWidth");
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v12, v14, 0);
  objc_msgSend(v12, "setEditing:", objc_msgSend(*(id *)(a1 + 32), "isEditing"));
  objc_msgSend(v12, "downloadButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "setPresentingViewController:", *(_QWORD *)(a1 + 32));

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
  v7[0] = CFSTR("DownloadGridMainSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[VUIDownloadCollectionViewController _identifiersForDownloadEntities](self, "_identifiersForDownloadEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("DownloadGridMainSection"));

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
  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities", 0);
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
  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities", 0);
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

- (double)_computeBottomMargin
{
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
  double v13;
  double v14;
  void *v15;
  double v16;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifierForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadCollectionViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewController cellWidth](self, "cellWidth");
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v8, v7, 1);

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));

  -[VUIDownloadCollectionViewController sizingCell](self, "sizingCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  objc_msgSend(v10, "bottomMarginWithBaselineMargin:");
  v12 = v11;

  if (v12 == 0.0)
  {
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
    v14 = v13;
    -[VUIDownloadCollectionViewController traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v15, v14);
    v12 = v16;

  }
  return v12;
}

- (void)_updateLayoutForSize:(CGSize)a3
{
  double width;
  double v5;
  uint64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  width = a3.width;
  -[VUIDownloadCollectionViewController lastViewWidth](self, "lastViewWidth", a3.width, a3.height);
  if (v5 != width)
  {
    -[VUIDownloadCollectionViewController setLastViewWidth:](self, "setLastViewWidth:", width);
    v6 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", width);
    v7 = 3;
    if ((unint64_t)(v6 - 4) < 3)
      v7 = 5;
    self->_gridStyle = v7;
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", -[VUIDownloadCollectionViewController gridStyle](self, "gridStyle"), -[VUIDownloadCollectionViewController gridType](self, "gridType"), 1, width);
    self->_cellWidth = v8;
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", width);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionViewLayout");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_collectionInteritemSpace:gridType:windowWidth:", -[VUIDownloadCollectionViewController gridStyle](self, "gridStyle"), -[VUIDownloadCollectionViewController gridType](self, "gridType"), width);
    objc_msgSend(v21, "setMinimumInteritemSpacing:");
    -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentInset:", v10, v12, v14, v16);

    -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "collectionViewLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidateLayout");

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

  if (-[VUIDownloadCollectionViewController isEditing](self, "isEditing"))
  {
    -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForSelectedItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[VUIDownloadCollectionViewController _configureAlertController](self, "_configureAlertController");
      v6 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
      alertController = self->_alertController;
      self->_alertController = v6;

      v8 = self->_alertController;
      if (v8)
        -[VUIDownloadCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      -[VUIDownloadCollectionViewController _exitEditingMode](self, "_exitEditingMode");
    }
  }
  else
  {
    -[VUIDownloadCollectionViewController _enterEditingMode](self, "_enterEditingMode");
  }
  -[VUIDownloadCollectionViewController _updateAllVisibleCellsForEditingMode](self, "_updateAllVisibleCellsForEditingMode");
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
    -[VUIDownloadCollectionViewController setIsSelectingAll:](self, "setIsSelectingAll:", 0);
    -[VUIDownloadCollectionViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v5);

    -[VUIDownloadCollectionViewController _clearSelections](self, "_clearSelections");
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 0;
  }
  else
  {
    -[VUIDownloadCollectionViewController setIsSelectingAll:](self, "setIsSelectingAll:", 1);
    -[VUIDownloadCollectionViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("DESELECT_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

    -[VUIDownloadCollectionViewController _selectAllCells](self, "_selectAllCells");
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "setEnabled:", v7);

}

- (id)_configureAlertController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id location[2];

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("DELETES_EXPLANATION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadCollectionViewController _deleteActionTitleString](self, "_deleteActionTitleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke;
  aBlock[3] = &unk_1E9F99C98;
  objc_copyWeak(&v29, location);
  v21 = _Block_copy(aBlock);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_2;
  v26[3] = &unk_1E9F99C98;
  objc_copyWeak(&v27, location);
  v7 = _Block_copy(v26);
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_3;
    v24[3] = &unk_1E9F9A088;
    v25 = v21;
    v20 = v5;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v5, 2, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v12);
    v13 = (void *)MEMORY[0x1E0DC3448];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:", CFSTR("CANCEL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_4;
    v22[3] = &unk_1E9F9A088;
    v23 = v7;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAction:", v16);
    objc_msgSend(v10, "setModalPresentationStyle:", 7);
    objc_msgSend(v10, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBarButtonItem:", v18);

    v5 = v20;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

  return v10;
}

void __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(WeakRetained, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(WeakRetained, "downloadEntities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained, "_deleteDownloadEntities:", v2);
  objc_msgSend(WeakRetained, "_exitEditingMode");

}

void __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_exitEditingMode");

}

uint64_t __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_deleteActionTitleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("DELETE_DOWNLOAD"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      -[VUIDownloadCollectionViewController diffableDataSource](self, "diffableDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemIdentifierForIndexPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDownloadCollectionViewController identifierToDownloadEntityDictionary](self, "identifierToDownloadEntityDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "numberOfMediaItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v17, "unsignedIntegerValue");

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);

  if (v9 >= 2)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("DELETE_%U_DOWNLOADS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%u"), 0, v9);
    v20 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v20;
LABEL_10:

  }
  return v4;
}

- (void)_configureNavigationBarForEditingMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *selectAllBarButtonItem;
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
  UIBarButtonItem *rightBarButtonItem;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (-[VUIDownloadCollectionViewController isEditing](self, "isEditing"))
  {
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("DELETE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v5);

    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    v22[0] = self->_rightBarButtonItem;
    v22[1] = selectAllBarButtonItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItems:", v9);

    -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", self->_leftBarButtonItem);
  }
  else
  {
    -[VUIDownloadCollectionViewController setIsSelectingAll:](self, "setIsSelectingAll:", 0);
    -[VUIDownloadCollectionViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("SELECT_ALL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v13);

    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("EDIT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v16);

    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", 1);

    -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    rightBarButtonItem = self->_rightBarButtonItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &rightBarButtonItem, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItems:", v19);

    -[VUIDownloadCollectionViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewController backBarButtonItem](self, "backBarButtonItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v20);

  }
}

- (void)_enterEditingMode
{
  -[VUIDownloadCollectionViewController setIsEditing:](self, "setIsEditing:", 1);
  -[VUIDownloadCollectionViewController _configureNavigationBarForEditingMode](self, "_configureNavigationBarForEditingMode");
}

- (void)_exitEditingMode
{
  void *v3;
  id v4;

  -[VUIDownloadCollectionViewController setIsEditing:](self, "setIsEditing:", 0);
  -[VUIDownloadCollectionViewController _updateAllVisibleCellsForEditingMode](self, "_updateAllVisibleCellsForEditingMode");
  -[VUIDownloadCollectionViewController _clearSelections](self, "_clearSelections");
  -[VUIDownloadCollectionViewController _configureNavigationBarForEditingMode](self, "_configureNavigationBarForEditingMode");
  -[VUIDownloadCollectionViewController alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIDownloadCollectionViewController alertController](self, "alertController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

  }
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
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
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
        -[VUIDownloadCollectionViewController collectionView](self, "collectionView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 1);

        -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v10);
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
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
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
        -[VUIDownloadCollectionViewController collectionView](self, "collectionView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v10, 1, 0);

        -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v10);
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

- (void)_deleteDownloadEntities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  VUIDownloadCollectionViewController *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke;
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

void __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke(uint64_t a1)
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
  v12[2] = __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke_2;
  v12[3] = &unk_1E9F98FD8;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  objc_msgSend(v9, "applySnapshot:animatingDifferences:completion:", v10, 1, v12);

}

uint64_t __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke_2(uint64_t a1)
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
              -[VUIDownloadCollectionViewController assetControllersToRemove](self, "assetControllersToRemove");
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

- (void)_updateAllVisibleCellsForEditingMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VUIDownloadCollectionViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateSelectAllBarButtonItemIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;

  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[VUIDownloadCollectionViewController downloadEntities](self, "downloadEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    -[VUIDownloadCollectionViewController setIsSelectingAll:](self, "setIsSelectingAll:", 1);
    -[VUIDownloadCollectionViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("DESELECT_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    v12 = 1;
LABEL_3:
    objc_msgSend(v11, "setEnabled:", v12);

    return;
  }
  -[VUIDownloadCollectionViewController setIsSelectingAll:](self, "setIsSelectingAll:", 0);
  -[VUIDownloadCollectionViewController selectAllBarButtonItem](self, "selectAllBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:", CFSTR("SELECT_ALL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v15);

  -[VUIDownloadCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexPathsForSelectedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEnabled");

    if (v20)
    {
      -[VUIDownloadCollectionViewController rightBarButtonItem](self, "rightBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      v12 = 0;
      goto LABEL_3;
    }
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
  -[VUIDownloadCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUIDownloadCollectionViewController navigationController](self, "navigationController");
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
  -[VUIDownloadCollectionViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUIDownloadCollectionViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDataSource, a3);
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

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (VUIDownloadCollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (UIBarButtonItem)leftBarButtonItem
{
  return self->_leftBarButtonItem;
}

- (void)setLeftBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItem, a3);
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, a3);
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, a3);
}

- (NSMutableArray)downloadEntities
{
  return self->_downloadEntities;
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

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)isSelectingAll
{
  return self->_isSelectingAll;
}

- (void)setIsSelectingAll:(BOOL)a3
{
  self->_isSelectingAll = a3;
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

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_identifierToDownloadEntityDictionary, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
}

- (void)collectionView:(uint64_t)a3 didSelectItemAtIndexPath:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Unable to start playback because no entity found for identifier: %@", a5, a6, a7, a8, 2u);
}

- (void)collectionView:(uint64_t)a3 didSelectItemAtIndexPath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Unable to start playback because mediaInfo is nil; mediaEntity: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
