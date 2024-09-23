@implementation ICBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController viewWillAppear:](&v25, "viewWillAppear:", a3);
  -[ICBaseViewController updateSearchControllerConfiguration](self, "updateSearchControllerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
  v6 = objc_msgSend(v5, "overrideUserInterfaceStyle");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "setOverrideUserInterfaceStyle:", 0);

  v9 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v9, "configureWithDefaultBackground");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v11, "setStandardAppearance:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
  objc_msgSend(v13, "setCompactAppearance:", v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController transitionCoordinator](self, "transitionCoordinator"));
  if (!v14)
    goto LABEL_6;
  v15 = v14;
  if (!v6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    v17 = objc_msgSend(v16, "isActive");

    if (v17)
      goto LABEL_5;
LABEL_6:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "toolbar"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "standardAppearance"));
    objc_msgSend(v21, "configureWithDefaultBackground");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toolbar"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "compactAppearance"));
    objc_msgSend(v23, "configureWithDefaultBackground");

    goto LABEL_7;
  }

LABEL_5:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController transitionCoordinator](self, "transitionCoordinator"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100045888;
  v24[3] = &unk_1005500E8;
  v24[4] = self;
  objc_msgSend(v18, "animateAlongsideTransition:completion:", v24, 0);
LABEL_7:

  -[ICBaseViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)configureSearchControllerIfNeeded
{
  void *v3;
  ICNoteSearchViewController *v4;
  int64_t v5;
  void *v6;
  ICNoteSearchViewController *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));

  if (!v3)
  {
    v4 = [ICNoteSearchViewController alloc];
    v5 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v7 = -[ICNoteSearchViewController initWithViewMode:viewControllerManager:](v4, "initWithViewMode:viewControllerManager:", v5, v6);
    -[ICBaseViewController setNoteSearchViewController:](self, "setNoteSearchViewController:", v7);

    v8 = objc_alloc((Class)UISearchController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    v18 = objc_msgSend(v8, "initWithSearchResultsController:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v18, "setSearchResultsUpdater:", v10);

    objc_msgSend(v18, "setAutomaticallyShowsSearchResultsController:", 0);
    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(v18, "setObscuresBackgroundDuringPresentation:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchBar"));
    objc_msgSend(v11, "setCenterPlaceholder:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v12, "setSearchBar:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v13, "setSearchController:", v18);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v14, "setSearchController:", v18);

    v15 = ICAccessibilityNeedsAccessibilityElements() ^ 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setHidesSearchBarWhenScrolling:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
    objc_msgSend(v17, "layoutIfNeeded");

  }
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (ICBaseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  id v8;
  ICBaseViewController *v9;
  void *v10;
  uint64_t v11;
  NSManagedObjectContext *legacyViewContext;
  void *v13;
  uint64_t v14;
  NSManagedObjectContext *modernViewContext;
  objc_super v17;

  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICBaseViewController;
  v9 = -[ICBaseViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistenceConfiguration"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legacyViewContext"));
    legacyViewContext = v9->_legacyViewContext;
    v9->_legacyViewContext = (NSManagedObjectContext *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistenceConfiguration"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modernViewContext"));
    modernViewContext = v9->_modernViewContext;
    v9->_modernViewContext = (NSManagedObjectContext *)v14;

    v9->_noteContainerViewMode = a3;
    objc_storeWeak((id *)&v9->_viewControllerManager, v8);
    v9->_viewControllerType = a5;
  }

  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICBaseViewController updateSearchControllerConfiguration](self, "updateSearchControllerConfiguration");
  -[ICBaseViewController addObservers](self, "addObservers");
  -[ICBaseViewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[ICBaseViewController shouldStartSearchWhenViewAppears](self, "shouldStartSearchWhenViewAppears"))
  {
    -[ICBaseViewController startSearchBecomeFirstResponder:](self, "startSearchBecomeFirstResponder:", -[ICBaseViewController shouldBecomeFirstResponderWhenStartingSearch](self, "shouldBecomeFirstResponderWhenStartingSearch"));
    -[ICBaseViewController setShouldStartSearchWhenViewAppears:](self, "setShouldStartSearchWhenViewAppears:", 0);
    -[ICBaseViewController setShouldBecomeFirstResponderWhenStartingSearch:](self, "setShouldBecomeFirstResponderWhenStartingSearch:", 0);
  }
}

- (int64_t)viewControllerType
{
  return self->_viewControllerType;
}

- (void)updateSearchControllerConfiguration
{
  void *v3;
  unsigned int v4;
  int64_t v5;
  int64_t v6;
  char v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v4 = objc_msgSend(v3, "hasCompactWidth");

  v5 = -[ICBaseViewController viewControllerType](self, "viewControllerType");
  v6 = -[ICBaseViewController viewControllerType](self, "viewControllerType");
  if (v5 && (v6 != 2 || ((v4 ^ 1) & 1) != 0))
  {
    if (v6 == 2)
      v7 = v4;
    else
      v7 = 1;
    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchController"));
      v10 = objc_msgSend(v9, "isActive");

      if (v10)
        -[ICBaseViewController deactivateSearch](self, "deactivateSearch");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v11, "setSearchController:", 0);

      -[ICBaseViewController setNoteSearchViewController:](self, "setNoteSearchViewController:", 0);
    }
  }
  else
  {
    -[ICBaseViewController configureSearchControllerIfNeeded](self, "configureSearchControllerIfNeeded");
  }
}

- (void)updateScopeButtonTitles
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (!-[ICBaseViewController viewControllerType](self, "viewControllerType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v4 = objc_msgSend(v3, "countOfAllVisibleAccounts");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scopeButtonTitles"));
    v9 = objc_msgSend(v8, "count");

    if ((unint64_t)v4 < 2 || v9)
    {
      if ((unint64_t)v4 > 1 || !v9)
        return;
      v18 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchBar"));
      objc_msgSend(v15, "setScopeButtonTitles:", &__NSArray0__struct);
    }
    else
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("All Accounts"), &stru_1005704B8, 0));
      objc_msgSend(v18, "insertObject:atIndex:", v11, 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Current Account"), &stru_1005704B8, 0));
      objc_msgSend(v18, "insertObject:atIndex:", v13, 1);

      v14 = objc_msgSend(v18, "copy");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchBar"));
      objc_msgSend(v17, "setScopeButtonTitles:", v14);

    }
  }
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045C30;
  v4[3] = &unk_100550C40;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)shouldStartSearchWhenViewAppears
{
  return self->_shouldStartSearchWhenViewAppears;
}

- (void)setNoteSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_noteSearchViewController, a3);
}

- (ICNoteSearchViewController)noteSearchViewController
{
  return self->_noteSearchViewController;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (BOOL)isShowingActiveSearch
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchController"));

  if (-[ICBaseViewController shouldStartSearchWhenViewAppears](self, "shouldStartSearchWhenViewAppears"))
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isActive"))
  {
    v5 = objc_msgSend(v4, "showsSearchResultsController");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015A1C;
  v3[3] = &unk_100550110;
  v3[4] = self;
  performBlockOnMainThread(v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController dealloc](&v4, "dealloc");
}

- (void)startSearchBecomeFirstResponder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if ((-[ICBaseViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "safeAreaInsets");
    objc_msgSend(v5, "setContentOffset:animated:", 0, 0.0, -v7);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v11, "startSearchBecomeFirstResponder:", v3);
  }
  else
  {
    -[ICBaseViewController setShouldStartSearchWhenViewAppears:](self, "setShouldStartSearchWhenViewAppears:", 1);
    -[ICBaseViewController setShouldBecomeFirstResponderWhenStartingSearch:](self, "setShouldBecomeFirstResponderWhenStartingSearch:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController searchNavigationTitle](self, "searchNavigationTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setTitle:", v8);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchController"));
    objc_msgSend(v10, "setShowsSearchResultsController:", 1);

  }
}

- (void)startSearchWithSearchQuery:(id)a3 searchTokens:(id)a4 searchScope:(unint64_t)a5 becomeFirstResponder:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  objc_msgSend(v12, "cancelSearch");

  -[ICBaseViewController configureSearchControllerIfNeeded](self, "configureSearchControllerIfNeeded");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchBar"));
  objc_msgSend(v14, "setSelectedScopeButtonIndex:", a5);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchBar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchTextField"));
  objc_msgSend(v17, "setText:", v11);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchBar"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchTextField"));
  objc_msgSend(v20, "setTokens:", v10);

  -[ICBaseViewController startSearchBecomeFirstResponder:](self, "startSearchBecomeFirstResponder:", v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController setEditing:animated:](&v9, "setEditing:animated:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
  objc_msgSend(v8, "_setEnabled:animated:", !v5, v4);

}

- (void)noteSearchViewControllerQueryDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;

  v4 = a3;
  v5 = objc_opt_class(NSNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey")));
  v8 = ICDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "BOOLValue");

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    v12 = objc_msgSend(v11, "showsFloatingSuggestions");

    if (v12)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
      objc_msgSend(v13, "setHidden:", v10);

    }
  }
}

- (id)searchNavigationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1005704B8, 0));

  return v3;
}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  ICBaseViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController", a3));
  v5 = (ICBaseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    -[ICBaseViewController updateScopeButtonTitles](self, "updateScopeButtonTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v7, "setToolbarHidden:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v9, "setObservableScrollView:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchController"));
    objc_msgSend(v11, "setShowsSearchResultsController:", 1);

    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
      v13 = objc_msgSend(v12, "showsFloatingSuggestions");

      if ((v13 & 1) == 0)
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
        objc_msgSend(v14, "setHidden:", 1);

      }
    }
  }
}

- (void)didPresentSearchController:(id)a3
{
  void *v4;
  ICBaseViewController *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController", a3));
  v5 = (ICBaseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
    -[ICBaseViewController updateNavigationTitle](self, "updateNavigationTitle");
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  ICBaseViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController", a3));
  v5 = (ICBaseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
  {
    v6 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v7, "setToolbarHidden:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchController"));
    objc_msgSend(v9, "setShowsSearchResultsController:", 0);

    -[ICBaseViewController updateNavigationTitle](self, "updateNavigationTitle");
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
      v11 = objc_msgSend(v10, "showsFloatingSuggestions");

      if ((v11 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController collectionView](self, "collectionView"));
        objc_msgSend(v12, "setHidden:", 0);

      }
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("ICBaseViewControllerWillDismissSearchControllerNotification"), self);

  }
}

- (void)addObservers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = ICDataSourceDataDidUpdateNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "dataSourceDataDidUpdate:", v3, v4);

  v5 = ICDataSourceDataUpdateDidRenderNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "dataSourceDataUpdateDidRender:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "noteSearchViewControllerQueryDidChange:", CFSTR("ICNoteSearchViewControllerQueryDidChangeNotification"), v7);

  objc_msgSend(v8, "addObserver:selector:name:object:", self, "accessibilityStatusDidChange", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "accessibilityStatusDidChange", UIAccessibilitySwitchControlStatusDidChangeNotification, 0);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  uint64_t v5;

  v5 = objc_opt_class(UITraitSplitViewControllerContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v4 = -[ICBaseViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, "updateSearchControllerConfiguration");

}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  id v4;

  self->_noteContainerViewMode = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  objc_msgSend(v4, "setNoteContainerViewMode:", a3);

}

- (void)deactivateSearch
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchController"));
  objc_msgSend(v2, "setActive:", 0);

}

- (void)accessibilityStatusDidChange
{
  uint64_t v3;
  id v4;

  v3 = ICAccessibilityNeedsAccessibilityElements(self, a2) ^ 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", v3);

}

- (ICDataSource)dataSource
{
  return (ICDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setViewControllerType:(int64_t)a3
{
  self->_viewControllerType = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setShouldStartSearchWhenViewAppears:(BOOL)a3
{
  self->_shouldStartSearchWhenViewAppears = a3;
}

- (BOOL)shouldBecomeFirstResponderWhenStartingSearch
{
  return self->_shouldBecomeFirstResponderWhenStartingSearch;
}

- (void)setShouldBecomeFirstResponderWhenStartingSearch:(BOOL)a3
{
  self->_shouldBecomeFirstResponderWhenStartingSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong((id *)&self->_noteSearchViewController, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
}

@end
