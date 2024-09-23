@implementation PXSearchHomeViewController

- (PXSearchHomeViewController)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXGadgetCollectionViewLayout *v6;
  PXSearchHomeGadgetDataSourceManager *v7;
  PXSearchHomeViewController *v8;
  PXSearchHomeViewController *v9;
  void *v10;
  uint64_t v11;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v6 = objc_alloc_init(PXGadgetCollectionViewLayout);
  v7 = objc_alloc_init(PXSearchHomeGadgetDataSourceManager);
  v20.receiver = self;
  v20.super_class = (Class)PXSearchHomeViewController;
  v8 = -[PXGadgetUIViewController initWithLayout:dataSourceManager:](&v20, sel_initWithLayout_dataSourceManager_, v6, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    objc_storeStrong((id *)&v9->_searchHomeDataSourceManager, v7);
    objc_initWeak(&location, v9);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__PXSearchHomeViewController_initWithPhotoLibrary___block_invoke;
    v17 = &unk_1E5148D30;
    objc_copyWeak(&v18, &location);
    -[PXSearchHomeGadgetDataSourceManager setZeroKeywordSectionsUpdateHandler:](v9->_searchHomeDataSourceManager, "setZeroKeywordSectionsUpdateHandler:", &v14);
    -[PXGadgetUIViewController setNumberOfInitialGadgetsToLoad:](v9, "setNumberOfInitialGadgetsToLoad:", 0, v14, v15, v16, v17);
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduleDeferredTaskWithQoS:block:", 0, &__block_literal_global_98032);

    -[PXSearchHomeViewController _registerNotificationsForAnalytics](v9, "_registerNotificationsForAnalytics");
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v9->_photoLibrary);
    v11 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v9->_sharedLibraryStatusProvider;
    v9->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v11;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v9->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v9, PXSharedLibraryStatusProviderObservationContext_97965);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_registerNotificationsForAnalytics
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAnalyticsNotification_, *MEMORY[0x1E0D71E70], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAnalyticsNotification_, *MEMORY[0x1E0DC4750], 0);

}

- (void)_reportZeroKeywordsToParsec:(BOOL)a3 searchCancelled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  if (a4)
    goto LABEL_2;
  -[PXSearchHomeViewController searchControllerSearchText](self, "searchControllerSearchText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
LABEL_10:

    return;
  }
  -[PXSearchHomeViewController searchControllerSearchTokens](self, "searchControllerSearchTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_2:
    if (!-[PXSearchHomeViewController searchTabIsSelected](self, "searchTabIsSelected"))
      return;
    -[PXSearchHomeViewController searchHomeDataSourceManager](self, "searchHomeDataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zeroKeywordSections");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[PXSearchHomeViewController _visibleZeroKeywordIndexPaths](self, "_visibleZeroKeywordIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count") && !objc_msgSend(v7, "count")
      || objc_msgSend(v11, "count") && objc_msgSend(v7, "count"))
    {
      +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportZeroKeywordSections:visibleIndexPaths:reportVisibleResultChangesOnly:", v11, v7, v4);

    }
    goto LABEL_10;
  }
}

- (id)searchControllerSearchText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchControllerSearchTokens
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_handleAnalyticsNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D71E70]);

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D71E78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == 12)
      objc_msgSend(v9, "reportSearchTabSelected");
    else
      objc_msgSend(v9, "reportSearchTabDeselected");

  }
  else
  {
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DC4750]);
    if (v12)
      -[PXSearchHomeViewController _reportZeroKeywordsToParsec:searchCancelled:](self, "_reportZeroKeywordsToParsec:searchCancelled:", 0, 0);
  }
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
  PXContentUnavailablePlaceholderManager *v11;
  void *v12;
  PXContentUnavailablePlaceholderManager *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PPT_SearchHomeViewDidLoad"), 0);

  -[PXSearchHomeViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchHomeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PXSearchHomeViewController _configureSearchNavigationBar](self, "_configureSearchNavigationBar");
  PXLocalizedStringFromTable(CFSTR("SEARCH_HOME_NO_SUGGESTIONS_TITLE"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SEARCH_HOME_NO_SUGGESTIONS_DESCRIPTION_%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PXContentUnavailablePlaceholderManager alloc];
  -[PXGadgetUIViewController dataSourceManager](self, "dataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXContentUnavailablePlaceholderManager initWithGadgetDataSourceManager:customTitle:customMessage:](v11, "initWithGadgetDataSourceManager:customTitle:customMessage:", v12, v6, v10);
  -[PXGadgetUIViewController setPlaceholderManager:](self, "setPlaceholderManager:", v13);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXSearchHomeViewController;
  -[PXSearchHomeViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSearchHomeViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 != objc_msgSend(v4, "horizontalSizeClass")
    || (v7 = objc_msgSend(v5, "verticalSizeClass"), v7 != objc_msgSend(v4, "verticalSizeClass")))
  {
    px_dispatch_on_main_queue_when_idle_after_delay();
  }

}

- (BOOL)shouldPreventPlaceholder
{
  void *v2;
  char v3;

  -[PXSearchHomeViewController searchHomeDataSourceManager](self, "searchHomeDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpectedToLoadNonEmptyDataSourceSoon");

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PXSearchHomeViewController searchHomeDataSourceManager](self, "searchHomeDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshData");

  -[PXSearchHomeViewController _updateNavigationBarForSharedLibrary](self, "_updateNavigationBarForSharedLibrary");
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventSourceWillAppear:sender:", 19, self);

}

- (void)viewDidAppear:(BOOL)a3
{
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PPT_SearchHomeViewDidAppear"), 0);

  v5 = (void *)MEMORY[0x1E0DC37E0];
  -[PXSearchHomeViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusSystemForEnvironment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXSearchHomeViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setVisibleRectEdgeInsets:", -200.0, 0.0, -200.0, 0.0);

  }
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isActive"))
  {
    -[PXSearchHomeViewController searchControllerEventTracker](self, "searchControllerEventTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logViewControllerDidAppear:", v10);

    objc_msgSend(v10, "searchResultsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "searchBarWantsFirstResponder"))
    {
      objc_msgSend(v12, "setSearchBarWantsFirstResponder:", 0);
      objc_msgSend(v10, "searchBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "becomeFirstResponder");

    }
  }
  -[PXSearchHomeViewController _reportZeroKeywordsToParsec:searchCancelled:](self, "_reportZeroKeywordsToParsec:searchCancelled:", 0, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventSourceDidDisappear:sender:", 19, self);

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isActive"))
  {
    -[PXSearchHomeViewController searchControllerEventTracker](self, "searchControllerEventTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logViewControllerDidDisappear:", v6);

  }
}

- (void)setDoneButtonHandler:(id)a3
{
  id v4;
  void *v5;
  id doneButtonHandler;
  void *v7;
  void *v8;
  id v9;

  if (self->_doneButtonHandler != a3)
  {
    v4 = a3;
    v5 = _Block_copy(v4);
    doneButtonHandler = self->_doneButtonHandler;
    self->_doneButtonHandler = v5;

    -[PXSearchHomeViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchResultsController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setCancelButtonHandler:", v4);
    -[PXSearchHomeViewController _updateDoneButton](self, "_updateDoneButton");

  }
}

- (void)_configureSearchNavigationBar
{
  void *v3;
  PXUISearchResultsViewController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  id location;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", &unk_1E53F0AE8);

  v4 = -[PXUISearchResultsViewController initWithSearchBar:photoLibrary:]([PXUISearchResultsViewController alloc], "initWithSearchBar:photoLibrary:", 0, 0);
  -[UIViewController px_enableOneUpPresentationFromViewController:](v4, "px_enableOneUpPresentationFromViewController:", self);
  -[PXSearchHomeViewController doneButtonHandler](self, "doneButtonHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController setCancelButtonHandler:](v4, "setCancelButtonHandler:", v5);

  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __59__PXSearchHomeViewController__configureSearchNavigationBar__block_invoke;
  v18 = &unk_1E5125910;
  objc_copyWeak(&v19, &location);
  -[PXUISearchResultsViewController setSearchDidEndHandler:](v4, "setSearchDidEndHandler:", &v15);
  v6 = objc_alloc(MEMORY[0x1E0DC3C40]);
  v7 = (void *)objc_msgSend(v6, "initWithSearchResultsController:", v4, v15, v16, v17, v18);
  objc_msgSend(v7, "setSearchResultsUpdater:", v4);
  objc_msgSend(v7, "setObscuresBackgroundDuringPresentation:", 0);
  -[PXUISearchResultsViewController setSearchController:](v4, "setSearchController:", v7);
  PXViewControllerEventTrackerCreate(CFSTR("SearchBarAndResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchHomeViewController setSearchControllerEventTracker:](self, "setSearchControllerEventTracker:", v8);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("SEARCH_PHOTOS_PLACEHOLDER"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceholder:", v10);

  objc_msgSend(v9, "setAutocapitalizationType:", 0);
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "enableAutoCorrect"))
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(v9, "setAutocorrectionType:", v12);

  objc_msgSend(v9, "setSpellCheckingType:", 1);
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSearchController:", v7);
  objc_msgSend(v13, "setHidesSearchBarWhenScrolling:", 0);
  PXLocalizedStringFromTable(CFSTR("SEARCH_TITLE"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v14);

  objc_msgSend(v13, "setPreferredSearchBarPlacement:", 2);
  -[PXSearchHomeViewController _updateDoneButton](self, "_updateDoneButton");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_updateDoneButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchHomeViewController doneButtonHandler](self, "doneButtonHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setShowsCancelButton:", v5 != 0);
  objc_msgSend(v7, "setAutomaticallyShowsCancelButton:", v5 == 0);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("cancelButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", CFSTR("Done"), 0);

  }
}

- (void)_updateNavigationBarForSharedLibrary
{
  -[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](self->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview");
}

- (void)activateSearchField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isFirstResponder") & 1) == 0)
  {
    objc_msgSend(v11, "becomeFirstResponder");
    -[PXSearchHomeViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectedTextRange:", v10);

  }
}

- (BOOL)searchBarIsActive
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  return v5;
}

- (void)_clearSearchField
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_1E5149688);
  objc_msgSend(v4, "setTokens:", MEMORY[0x1E0C9AA60]);

}

- (void)selectZeroKeyword:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "itemType");
  if (v5 >= 9)
    v6 = 0;
  else
    v6 = v5 + 2;
  -[PXSearchHomeViewController _notifyAnalyticsSearchAction:](self, "_notifyAnalyticsSearchAction:", v6);
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "searchTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXNewSearchToken px_searchTokenFromZeroKeyword:](PXNewSearchToken, "px_searchTokenFromZeroKeyword:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportZeroKeywordSelected:searchToken:", v4, v11);

  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTokens:", v14);

  -[PXSearchHomeViewController activateSearchField](self, "activateSearchField");
}

- (void)performRecentSearch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PXSearchHomeViewController _notifyAnalyticsSearchAction:](self, "_notifyAnalyticsSearchAction:", 0);
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTokens:", v9);
  objc_msgSend(v4, "searchText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v12, "setText:", v10);
  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportRecentSearchSelectedWithSearchText:searchTokens:", v10, v8);

  -[PXSearchHomeViewController activateSearchField](self, "activateSearchField");
}

- (void)presentSpotlightSearch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Spotlight Search: ✅ Presenting Spotlight Search: %@", (uint8_t *)&v12, 0xCu);
  }

  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v4);

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

}

- (void)presentOneYearAgo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "✅ Presenting One Year Ago Search", v12, 2u);
  }

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  +[PXNewSearchToken px_oneYearAgoSearchToken](PXNewSearchToken, "px_oneYearAgoSearchToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTokens:", v11);

  objc_msgSend(v5, "setActive:", 1);
}

- (void)presentForSearchHashtag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "✅ Presenting hashtag search: %@", buf, 0xCu);
  }

  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  +[PXNewSearchToken px_searchTokenForHashtag:](PXNewSearchToken, "px_searchTokenForHashtag:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "searchTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTokens:", v12);

  objc_msgSend(v10, "becomeFirstResponder");
}

- (void)presentSearchWithText:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "✅ Presenting search with search text: %@", (uint8_t *)&v10, 0xCu);
  }

  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "searchTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v4);
  objc_msgSend(v8, "becomeFirstResponder");

}

- (void)presentSearchWithTerms:(id)a3 searchCategories:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  PXNewSearchToken *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotosSearchGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "✅ Presenting search with search terms: %@, searchCategories: %@", buf, 0x16u);
  }

  v9 = objc_msgSend(v6, "count");
  if (v9 != objc_msgSend(v7, "count"))
  {
    PLPhotosSearchGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Presenting search with an unequal count of terms and categories. Generic categories will be used for terms that do not map to a category.", buf, 2u);
    }

  }
  -[PXSearchHomeViewController _clearSearchField](self, "_clearSearchField");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") <= v12)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = -[PXNewSearchToken initWithSearchText:searchCategory:]([PXNewSearchToken alloc], "initWithSearchText:searchCategory:", v13, objc_msgSend(v14, "integerValue"));
      objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v16);

      ++v12;
    }
    while (v12 < objc_msgSend(v6, "count"));
  }
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "searchTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v20, "setTokens:", v21);

  objc_msgSend(v19, "becomeFirstResponder");
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "isTracking"))
  {
    -[PXSearchHomeViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PXSearchHomeViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return objc_msgSend(a3, "type") == 14;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  id v11;
  dispatch_time_t v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  PXSearchHomeViewController *v17;
  void (**v18)(id, uint64_t, _QWORD);

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v8, "type") != 14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchHomeViewController.m"), 533, CFSTR("Only search navigation destinations are supported in the search tab"));

  }
  objc_msgSend(v8, "additionalAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v11 = v10;

  if (!v11)
  {
LABEL_8:
    v9[2](v9, 1, 0);
    v13 = 0;
    goto LABEL_9;
  }
  v12 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXSearchHomeViewController_navigateToDestination_options_completionHandler___block_invoke;
  block[3] = &unk_1E5145688;
  v13 = v11;
  v16 = v13;
  v17 = self;
  v18 = v9;
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);

LABEL_9:
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  return 0;
}

- (id)px_navigationDestination
{
  PXProgrammaticNavigationDestination *px_navigationDestination;
  PXProgrammaticNavigationDestination *v4;
  PXProgrammaticNavigationDestination *v5;

  px_navigationDestination = self->_px_navigationDestination;
  if (!px_navigationDestination)
  {
    v4 = -[PXProgrammaticNavigationDestination initWithType:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:", 14, 0);
    v5 = self->_px_navigationDestination;
    self->_px_navigationDestination = v4;

    px_navigationDestination = self->_px_navigationDestination;
  }
  return px_navigationDestination;
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  if ((a4 & 0x10) != 0)
  {
    v7 = (void *)objc_opt_new();
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PXSearchHomeViewController_gadget_didChange___block_invoke;
    v12[3] = &unk_1E512DF20;
    v13 = v7;
    v9 = v7;
    objc_msgSend(v8, "enumerateGadgetsUsingBlock:", v12);

    +[PXSearchHomeViewController _feedbackTapToRadarViewControllerWithAttachmentURLs:](PXSearchHomeViewController, "_feedbackTapToRadarViewControllerWithAttachmentURLs:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchHomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController gadget:didChange:](&v11, sel_gadget_didChange_, v6, a4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_97965 == a5)
  {
    if ((a4 & 3) == 0)
      goto LABEL_6;
LABEL_5:
    -[PXSearchHomeViewController _updateNavigationBarForSharedLibrary](self, "_updateNavigationBarForSharedLibrary");
    goto LABEL_6;
  }
  if ((void *)PXLibraryFilterStateObservationContext_97966 == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
LABEL_6:

}

- (void)_notifyAnalyticsSearchAction:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "searchResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNextAnalyticsSessionBeginType:", a3);

}

- (int64_t)scrollAnimationIdentifier
{
  return 3;
}

- (void)ppt_prepareZeroKeywordRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchHomeViewController searchHomeDataSourceManager](self, "searchHomeDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ppt_prepareZeroKeywordRequest:", v4);

}

- (void)ppt_prepareForSearchScrollingTestWithSearchText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotosSearchGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PXSearchHomeViewController ppt_prepareForSearchScrollingTestWithSearchText:completion:]";
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "becomeFirstResponder");
  objc_msgSend(v10, "searchResultsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 1000000000);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__PXSearchHomeViewController_ppt_prepareForSearchScrollingTestWithSearchText_completion___block_invoke;
  v18[3] = &unk_1E5148370;
  v19 = v6;
  v20 = v11;
  v21 = v12;
  v22 = v7;
  v14 = v7;
  v15 = v12;
  v16 = v11;
  v17 = v6;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v18);

}

- (void)ppt_prepareForSearchTest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v5 = a3;
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchHomeViewController.m"), 688, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchBar"));

  }
  objc_msgSend(v8, "becomeFirstResponder");
  v9 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXSearchHomeViewController_ppt_prepareForSearchTest___block_invoke;
  block[3] = &unk_1E5148CE0;
  v14 = v8;
  v15 = v5;
  v10 = v8;
  v11 = v5;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

- (void)ppt_dismissKeyboard
{
  void *v2;
  void *v3;
  id v4;

  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchHomeViewController searchControllerEventTracker](self, "searchControllerEventTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logViewControllerDidAppear:", v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchHomeViewController searchControllerEventTracker](self, "searchControllerEventTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logViewControllerDidDisappear:", v4);

}

- (BOOL)pu_handleSecondTabTap
{
  void *v3;
  int v4;

  -[PXSearchHomeViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "px_isScrolledAtEdge:", 1);

  if (!v4)
    return -[PXSearchHomeViewController _scrollToInitialPositionAnimated:](self, "_scrollToInitialPositionAnimated:", 1);
  -[PXSearchHomeViewController activateSearchField](self, "activateSearchField");
  return 1;
}

- (BOOL)_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  PXSearchHomeViewController *v7;
  void *v8;
  int v9;
  PXSearchHomeViewController *v10;
  void *v11;

  v3 = a3;
  -[PXSearchHomeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isActive"))
  {
    objc_msgSend(v6, "searchResultsController");
    v7 = (PXSearchHomeViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!-[PXSearchHomeViewController isViewLoaded](v7, "isViewLoaded")
    || (-[PXSearchHomeViewController view](v7, "view"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isHidden"),
        v8,
        v10 = v7,
        v9))
  {
    v10 = self;
  }
  -[PXSearchHomeViewController collectionView](v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_scrollToEdge:animated:", 1, v3);

  return 1;
}

- (void)_unregisterNotificationsForAnalytics
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D71E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4750], 0);

}

- (void)zeroKeywordGadgetsDidReload
{
  -[PXSearchHomeViewController _reportZeroKeywordsToParsec:searchCancelled:](self, "_reportZeroKeywordsToParsec:searchCancelled:", 0, 0);
}

- (void)_scrollViewStoppedScrolling
{
  -[PXSearchHomeViewController _reportZeroKeywordsToParsec:searchCancelled:](self, "_reportZeroKeywordsToParsec:searchCancelled:", 1, 0);
}

- (BOOL)searchTabIsSelected
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXSearchHomeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_visibleZeroKeywordIndexPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __objc2_class **v22;
  void *v23;
  void *v24;
  __int128 v26;
  void *v27;
  PXSearchHomeViewController *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = (id)objc_opt_new();
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadgetSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = self;
  -[PXSearchHomeViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    v11 = off_1E50B4000;
    *(_QWORD *)&v8 = 138412546;
    v26 = v8;
    v27 = v4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "section", v26);
        if (v14 >= objc_msgSend(v4, "count"))
        {
          PLPhotosSearchGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v35 = v13;
            v36 = 2112;
            v37 = v4;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Encountered an out of bounds ZK section for index path: %@ in ZK sections: %@ while reporting visible objects to Parsec", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
          v15 = objc_claimAutoreleasedReturnValue();
          -[NSObject gadgets](v15, "gadgets");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "collectionView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "indexPathsForVisibleItems");
            v19 = v9;
            v20 = v10;
            v21 = v6;
            v22 = v11;
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            -[PXSearchHomeViewController _adjustedIndexPaths:withSection:](v28, "_adjustedIndexPaths:withSection:", v23, objc_msgSend(v13, "section"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObjectsFromArray:", v24);

            v11 = v22;
            v6 = v21;
            v10 = v20;
            v9 = v19;
            v4 = v27;
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }

  return v29;
}

- (id)_adjustedIndexPaths:(id)a3 withSection:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "item", (_QWORD)v14), a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PXSearchHomeViewController _unregisterNotificationsForAnalytics](self, "_unregisterNotificationsForAnalytics");
  v3.receiver = self;
  v3.super_class = (Class)PXSearchHomeViewController;
  -[PXGadgetUIViewController dealloc](&v3, sel_dealloc);
}

- (id)doneButtonHandler
{
  return self->_doneButtonHandler;
}

- (PXSearchHomeGadgetDataSourceManager)searchHomeDataSourceManager
{
  return self->_searchHomeDataSourceManager;
}

- (void)setSearchHomeDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchHomeDataSourceManager, a3);
}

- (PXViewControllerEventTracker)searchControllerEventTracker
{
  return self->_searchControllerEventTracker;
}

- (void)setSearchControllerEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_searchControllerEventTracker, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_searchControllerEventTracker, 0);
  objc_storeStrong((id *)&self->_searchHomeDataSourceManager, 0);
  objc_storeStrong(&self->_doneButtonHandler, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
}

uint64_t __55__PXSearchHomeViewController_ppt_prepareForSearchTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__PXSearchHomeViewController_ppt_prepareForSearchScrollingTestWithSearchText_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Set Search Text, %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setText:", *(_QWORD *)(a1 + 32));
  v4 = dispatch_time(0, 20000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PXSearchHomeViewController_ppt_prepareForSearchScrollingTestWithSearchText_completion___block_invoke_213;
  v5[3] = &unk_1E5148CE0;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);

}

void __89__PXSearchHomeViewController_ppt_prepareForSearchScrollingTestWithSearchText_completion___block_invoke_213(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "ppt_expandAllSections");
  objc_msgSend(*(id *)(a1 + 32), "ppt_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Begin scroll test: %@", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__PXSearchHomeViewController_gadget_didChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "debugURLsForDiagnostics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

void __78__PXSearchHomeViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "searchText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v6 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3, "presentSearchWithText:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "searchTerms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchCategories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentSearchWithTerms:searchCategories:", v4, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __50__PXSearchHomeViewController_performRecentSearch___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", a2);
}

void __59__PXSearchHomeViewController__configureSearchNavigationBar__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportZeroKeywordsToParsec:searchCancelled:", 0, a3);

}

uint64_t __55__PXSearchHomeViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportZeroKeywordsToParsec:searchCancelled:", 1, 0);
}

void __51__PXSearchHomeViewController_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "zeroKeywordGadgetsDidReload");

}

void __51__PXSearchHomeViewController_initWithPhotoLibrary___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "searchIndex");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preWarmSearchIndexSynchronously:completion:", 0, 0);

}

+ (Class)gadgetSpecClass
{
  return (Class)objc_opt_class();
}

+ (id)_feedbackTapToRadarViewControllerWithAttachmentURLs:(id)a3
{
  id v3;
  void *v4;
  PXFeedbackTapToRadarViewController *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a3;
  +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PXFeedbackTapToRadarViewController);
  -[PXFeedbackTapToRadarViewController setRequestScreenshotPermission:](v5, "setRequestScreenshotPermission:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PXSearchHomeViewController__feedbackTapToRadarViewControllerWithAttachmentURLs___block_invoke;
  v9[3] = &unk_1E5125978;
  v10 = v4;
  v11 = v3;
  v6 = v3;
  v7 = v4;
  -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v5, "setFileRadarHandler:", v9);

  return v5;
}

void __82__PXSearchHomeViewController__feedbackTapToRadarViewControllerWithAttachmentURLs___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a2 || !*(_QWORD *)(a1 + 32))
  {
    v8 = 0;
    if (!a3)
      goto LABEL_4;
LABEL_6:
    v11[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    v11[1] = CFSTR("com.apple.Search.framework.SpotlightDiagnostic");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    goto LABEL_6;
LABEL_4:
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:
  LOWORD(v10) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", 0, CFSTR("Summary:\n\n\nSteps To Reproduce:\n\n\nResults:\n\n\nRegression:\n\n\nNotes:\n\n\n"), CFSTR("Other Bug"), CFSTR("570553"), CFSTR("Photos UI Search"), CFSTR("iOS"), 0, v8, *(_QWORD *)(a1 + 40), v10, v9, 0);

}

@end
