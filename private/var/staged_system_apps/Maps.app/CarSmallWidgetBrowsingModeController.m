@implementation CarSmallWidgetBrowsingModeController

- (CarSmallWidgetBrowsingModeController)init
{
  CarSmallWidgetBrowsingModeController *v2;
  void *v3;
  CarWidgetShortcutsProvider *v4;
  CarWidgetShortcutsProvider *shortcutsProvider;
  BrowseManager *v6;
  BrowseManager *browseManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CarSmallWidgetBrowsingModeController;
  v2 = -[CarSmallWidgetBrowsingModeController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      objc_msgSend(v3, "registerObserver:", v2);

    }
    else
    {
      v4 = objc_alloc_init(CarWidgetShortcutsProvider);
      shortcutsProvider = v2->_shortcutsProvider;
      v2->_shortcutsProvider = v4;

      -[CarShortcutsProvider setDelegate:](v2->_shortcutsProvider, "setDelegate:", v2);
      -[CarShortcutsProvider start](v2->_shortcutsProvider, "start");
    }
    v6 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", CFSTR("Stark"));
    browseManager = v2->_browseManager;
    v2->_browseManager = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](v2->_browseManager, "imageManager"));
    objc_msgSend(v8, "setDesiredImageSize:", 29.0, 29.0);

    -[BrowseManager readCategoriesFromDiskIfNeeded](v2->_browseManager, "readCategoriesFromDiskIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](v2->_browseManager, "cachedCategories"));
    -[CarSmallWidgetBrowsingModeController setSearchCategories:](v2, "setSearchCategories:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v3, "unregisterObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider stop](self->_shortcutsProvider, "stop");
  }
  v4.receiver = self;
  v4.super_class = (Class)CarSmallWidgetBrowsingModeController;
  -[CarSmallWidgetBrowsingModeController dealloc](&v4, "dealloc");
}

- (BOOL)modeHandlesGestures
{
  return (char *)-[CarSmallWidgetBrowsingModeController browsingState](self, "browsingState") - 1 < (char *)2;
}

- (void)_updateWidgetContents
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");

    if ((v4 & 1) == 0)
      goto LABEL_7;
  }
  else
  {

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutsForCarplay"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");

    if (v7)
    {
LABEL_7:
      -[CarSmallWidgetBrowsingModeController setBrowsingState:](self, "setBrowsingState:", 1);
      -[CarSmallWidgetShortcutsView refreshShortcuts](self->_shortcutsView, "refreshShortcuts");
      return;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController searchCategories](self, "searchCategories"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[CarSmallWidgetBrowsingModeController setBrowsingState:](self, "setBrowsingState:", 2);
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController searchCategories](self, "searchCategories"));
    -[CarSmallWidgetSearchCategoriesView setCategories:](self->_searchCategoriesView, "setCategories:", v10);

  }
  else
  {
    -[CarSmallWidgetBrowsingModeController setBrowsingState:](self, "setBrowsingState:", 3);
  }
}

- (void)setBrowsingState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  int64_t browsingState;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;

  if (self->_browsingState != a3)
  {
    v5 = sub_10043379C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_browsingState - 1;
      if (v7 > 2)
        v8 = CFSTR("Unknown");
      else
        v8 = *(&off_1011DA110 + v7);
      if ((unint64_t)(a3 - 1) > 2)
        v9 = CFSTR("Unknown");
      else
        v9 = *(&off_1011DA110 + a3 - 1);
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Set CarSmallWidgetBrowsingState from %@ to %@", buf, 0x16u);
    }

    self->_browsingState = a3;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subviews"));

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    -[CarSmallWidgetBrowsingModeController _clearFocusableItems](self, "_clearFocusableItems");
    browsingState = self->_browsingState;
    if (browsingState == 2)
    {
      -[CarSmallWidgetBrowsingModeController _addSearchCategoriesView](self, "_addSearchCategoriesView");
    }
    else if (browsingState == 1)
    {
      -[CarSmallWidgetBrowsingModeController _addShortcutsView](self, "_addShortcutsView");
    }
    else
    {
      -[CarSmallWidgetBrowsingModeController _addNoContentView](self, "_addNoContentView");
    }
  }
}

- (void)setSearchCategories:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_searchCategories, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_searchCategories, a3);
    -[CarSmallWidgetBrowsingModeController _updateWidgetContents](self, "_updateWidgetContents");
  }

}

- (void)_addShortcutsView
{
  CarSmallWidgetShortcutsView *v3;
  CarSmallWidgetShortcutsView *shortcutsView;
  void *v5;
  CarSmallWidgetShortcutsView *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_shortcutsView)
  {
    v3 = -[CarSmallWidgetShortcutsView initWithShortcutsProvider:]([CarSmallWidgetShortcutsView alloc], "initWithShortcutsProvider:", self->_shortcutsProvider);
    shortcutsView = self->_shortcutsView;
    self->_shortcutsView = v3;

    -[CarSmallWidgetShortcutsView setTranslatesAutoresizingMaskIntoConstraints:](self->_shortcutsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_shortcutsView);

  v6 = self->_shortcutsView;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  LODWORD(v8) = 1148846080;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetShortcutsView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

}

- (void)_addSearchCategoriesView
{
  CarSmallWidgetSearchCategoriesView *v3;
  CarSmallWidgetSearchCategoriesView *searchCategoriesView;
  void *v5;
  CarSmallWidgetSearchCategoriesView *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_searchCategoriesView)
  {
    v3 = -[CarSmallWidgetCollectionView initWithFrame:]([CarSmallWidgetSearchCategoriesView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    searchCategoriesView = self->_searchCategoriesView;
    self->_searchCategoriesView = v3;

    -[CarSmallWidgetSearchCategoriesView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchCategoriesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_searchCategoriesView);

  v6 = self->_searchCategoriesView;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  LODWORD(v8) = 1148846080;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetSearchCategoriesView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

}

- (void)_addNoContentView
{
  CarSmallWidgetNoContentView *v3;
  CarSmallWidgetNoContentView *noContentView;
  void *v5;
  CarSmallWidgetNoContentView *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_noContentView)
  {
    v3 = -[CarSmallWidgetNoContentView initWithFrame:]([CarSmallWidgetNoContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    noContentView = self->_noContentView;
    self->_noContentView = v3;

    -[CarSmallWidgetNoContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_noContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_noContentView);

  v6 = self->_noContentView;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  LODWORD(v8) = 1148846080;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNoContentView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarSmallWidgetBrowsingModeController;
  -[CarSmallWidgetBrowsingModeController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CarSmallWidgetBrowsingModeController _clearFocusableItems](self, "_clearFocusableItems");
}

- (BOOL)showsMapView
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  BrowseManager *browseManager;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  -[CarSmallWidgetBrowsingModeController _updateWidgetContents](self, "_updateWidgetContents");
  objc_initWeak(&location, self);
  browseManager = self->_browseManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100896FE8;
  v9[3] = &unk_1011AD9D0;
  objc_copyWeak(&v10, &location);
  -[BrowseManager getCategoriesWithCompletion:](browseManager, "getCategoriesWithCompletion:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  -[CarSmallWidgetBrowsingModeController _clearFocusableItems](self, "_clearFocusableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextTopContext"));

  v7 = objc_opt_class(CarSmallWidgetRouteGeniusModeController);
  LOBYTE(v5) = objc_opt_isKindOfClass(v6, v7);

  if ((v5 & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeGeniusManager"));
    objc_msgSend(v8, "deactivateForAllChromes");

  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)_clearFocusableItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = objc_opt_class(CRSUIDashboardWidgetWindow);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetBrowsingModeController view](self, "view"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    objc_msgSend(v8, "_maps_safeSetFocusableViews:", &__NSArray0__struct);
  }
}

- (void)shortcutsProviderUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043379C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received an update through shortcutsProviderUpdated:", v6, 2u);
  }

  -[CarSmallWidgetBrowsingModeController _updateWidgetContents](self, "_updateWidgetContents");
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043379C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received an update through homeDataProvidingObjectDidUpdate:", v6, 2u);
  }

  -[CarSmallWidgetBrowsingModeController _updateWidgetContents](self, "_updateWidgetContents");
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v4, "registerObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider stop](self->_shortcutsProvider, "stop");
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v4, "unregisterObserver:", self);

  }
  else
  {
    -[CarShortcutsProvider stop](self->_shortcutsProvider, "stop");
  }
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (int64_t)browsingState
{
  return self->_browsingState;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_searchCategoriesView, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_shortcutsView, 0);
  objc_storeStrong((id *)&self->_shortcutsProvider, 0);
}

@end
