@implementation SearchViewController

- (SearchViewController)init
{
  SearchViewController *v2;
  SearchViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  v2 = -[SearchViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[SearchViewController initializeCachedTelephonyValue](v2, "initializeCachedTelephonyValue");
  return v3;
}

- (SearchViewController)initWithSearchAlongRoute:(BOOL)a3
{
  _BOOL8 v3;
  SearchViewController *v4;
  SearchViewController *v5;
  void *v6;
  unsigned int v7;

  v3 = a3;
  v4 = -[SearchViewController init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[SearchViewController setSearchingAlongTheRoute:](v4, "setSearchingAlongTheRoute:", v3);
    v5->_isOfflineBrowseRecordedAlready = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = objc_msgSend(v6, "isUsingOfflineMaps");

    if (v7)
      -[SearchViewController _initOfflinePlaceHolderWithCompletion:](v5, "_initOfflinePlaceHolderWithCompletion:", 0);
  }
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITableView *contentTableView;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchViewController;
  -[MapsThemeViewController updateTheme](&v10, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBarPlaceHolderColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController theme](self, "theme"));
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", objc_msgSend(v6, "textFieldKeyboardAppearance"));

  contentTableView = self->_contentTableView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController theme](self, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hairlineColor"));
  -[UITableView setSeparatorColor:](contentTableView, "setSeparatorColor:", v9);

  -[UITableView reloadData](self->_contentTableView, "reloadData");
}

- (void)setNeedsUpdateContentState
{
  _QWORD block[5];

  if (!self->_needsUpdateContentState)
  {
    self->_needsUpdateContentState = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006174BC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)keyCommands
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[HomeViewController isActive](self->_homeViewController, "isActive")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController presentedViewController](self, "presentedViewController")),
        v3,
        !v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController keyCommands](self->_homeViewController, "keyCommands"));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchViewController;
    v4 = -[ContaineeViewController keyCommands](&v10, "keyCommands");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (self->_currentDataSource == &self->_searchHomeDataSource->super)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController presentedViewController](self, "presentedViewController"));

      if (!v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource keyCommands](self->_searchHomeDataSource, "keyCommands"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7));

        return v8;
      }
    }
  }
  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  HomeViewController *homeViewController;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  objc_super v12;

  homeViewController = self->_homeViewController;
  v7 = a4;
  if (-[HomeViewController isActive](homeViewController, "isActive"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[HomeViewController targetForAction:withSender:](self->_homeViewController, "targetForAction:withSender:", a3, v7));
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchViewController;
    v9 = -[SearchViewController targetForAction:withSender:](&v12, "targetForAction:withSender:", a3, v7);
    v8 = objc_claimAutoreleasedReturnValue(v9);
  }
  v10 = (void *)v8;

  return v10;
}

- (void)_hideSearchHereControl
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "redoSearchOverlay"));
  objc_msgSend(v4, "shouldHideFloatingControl:animated:", 1, 0);

}

- (id)browseModeHeaderView
{
  ContainerHeaderView *offlineBrowseHeaderView;
  ContainerHeaderView *v4;
  ContainerHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  offlineBrowseHeaderView = self->_offlineBrowseHeaderView;
  if (!offlineBrowseHeaderView)
  {
    v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_offlineBrowseHeaderView;
    self->_offlineBrowseHeaderView = v4;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_offlineBrowseHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setDelegate:](self->_offlineBrowseHeaderView, "setDelegate:", self);
    -[ContainerHeaderView setHeaderSize:](self->_offlineBrowseHeaderView, "setHeaderSize:", 1);
    -[ContainerHeaderView setHairLineAlpha:](self->_offlineBrowseHeaderView, "setHairLineAlpha:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ContainerHeaderView setBackgroundColor:](self->_offlineBrowseHeaderView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Browse"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[ContainerHeaderView setTitle:](self->_offlineBrowseHeaderView, "setTitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
    objc_msgSend(v9, "addSubview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_constraintsForCenteringInView:edgeInsets:", v12, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    offlineBrowseHeaderView = self->_offlineBrowseHeaderView;
  }
  return offlineBrowseHeaderView;
}

- (id)offlinePlaceholderQueue
{
  OS_dispatch_queue *offlinePlaceholderQueue;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;

  offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  if (!offlinePlaceholderQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v5);
    v7 = self->_offlinePlaceholderQueue;
    self->_offlinePlaceholderQueue = v6;

    offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  }
  return offlinePlaceholderQueue;
}

- (void)_shouldHideOfflineHeaderView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = v3 ^ 1;
  -[PassthruSearchBar setHidden:](self->_searchBar, "setHidden:", v6);
  -[UIButton setHidden:](self->_userProfileButton, "setHidden:", v6);
  -[SearchViewController _updateUserProfileEntryPointButton](self, "_updateUserProfileEntryPointButton");
}

- (void)_offlineSettingChangeHandler
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  SearchHomeDataSource *searchHomeDataSource;
  int v13;
  void *v14;

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v6 = sub_10039E4FC((int)objc_msgSend(v5, "isUsingOfflineMaps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v13 = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Offline setting has changed. New value is : %@", (uint8_t *)&v13, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v9 = objc_msgSend(v8, "isUsingOfflineMaps");

  if (v9)
  {
    -[SearchViewController _setupOfflinePlaceholder](self, "_setupOfflinePlaceholder");
    -[SearchViewController _initOfflinePlaceHolderWithCompletion:](self, "_initOfflinePlaceHolderWithCompletion:", 0);
  }
  else
  {
    -[SearchViewController _setupOnlinePlaceholder](self, "_setupOnlinePlaceholder");
    v10 = sub_10043222C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Setting the placeholder string for online mode", (uint8_t *)&v13, 2u);
    }

  }
  searchHomeDataSource = self->_searchHomeDataSource;
  self->_searchHomeDataSource = 0;

}

- (void)_setupOfflinePlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("__internal__searchBarOfflinePlaceholder"), v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10));

  if (v6)
  {
    -[UITextField setPlaceholder:](self->_searchField, "setPlaceholder:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Browse Offline Maps"), CFSTR("localized string not found"), 0));
    -[UITextField setPlaceholder:](self->_searchField, "setPlaceholder:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v9, "setAllowsDefaultTighteningForTruncation:", 1);

}

- (void)resetOfflineTextSearchSupport
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100617CB4;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  -[SearchViewController _initOfflinePlaceHolderWithCompletion:](self, "_initOfflinePlaceHolderWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)logOfflineBrowseMode:(BOOL)a3
{
  id v3;

  if (!a3 && (!self->_isOfflineBrowseRecordedAlready || self->_supportsFullTextSearch))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 45, 1708, 0);

  }
}

- (void)_initOfflinePlaceHolderWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (!self->_isOfflineServiceRunning)
  {
    self->_isOfflineServiceRunning = 1;
    objc_initWeak(&location, self);
    v5 = objc_claimAutoreleasedReturnValue(-[SearchViewController offlinePlaceholderQueue](self, "offlinePlaceholderQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100617E48;
    v6[3] = &unk_1011BE298;
    v6[4] = self;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_setupOnlinePlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITextField *searchField;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("__internal__searchBarPlaceholderV2"), v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10));

  searchField = self->_searchField;
  if (v6)
  {
    -[UITextField setPlaceholder:](searchField, "setPlaceholder:", v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Search for a place or address"), CFSTR("localized string not found"), 0));
    -[UITextField setPlaceholder:](searchField, "setPlaceholder:", v9);

  }
}

- (void)_setPlaceHolder
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) != 0)
  {
    v3 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "UIApplication shouldMakeUIForDefaultPNG true. The search bar placeholder string will not changed in this case.", buf, 2u);
    }

  }
  else
  {
    -[SearchViewController _setupOnlinePlaceholder](self, "_setupOnlinePlaceholder");
    v5 = (id)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
    objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", 1);

  }
}

- (void)_initPlaceholderWithSubmitTicketIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *placeholderQueue;
  NSObject *v9;
  _QWORD v10[5];
  id location;

  v3 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    if (v3)
    {
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.placeholder", v6);
      placeholderQueue = self->_placeholderQueue;
      self->_placeholderQueue = v7;

      objc_initWeak(&location, self);
      v9 = self->_placeholderQueue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1006184A0;
      v10[3] = &unk_1011AC860;
      v10[4] = self;
      dispatch_async(v9, v10);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SearchViewController _setPlaceHolder](self, "_setPlaceHolder");
    }
  }
}

- (void)_configureSearchBarIfNeeded
{
  if (!self->_isConfigured)
  {
    self->_isConfigured = 1;
    -[SearchViewController _initPlaceholderWithSubmitTicketIfNeeded:](self, "_initPlaceholderWithSubmitTicketIfNeeded:", 1);
  }
}

- (void)_configureForceTouchIfNeeded
{
  SearchResultQuickActionMenuPresenter *v3;
  SearchResultQuickActionMenuPresenter *quickActionMenuPresenter;

  if (!self->_quickActionMenuPresenter)
  {
    v3 = -[SearchResultQuickActionMenuPresenter initWithTableView:]([SearchResultQuickActionMenuPresenter alloc], "initWithTableView:", self->_contentTableView);
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v3;

    -[QuickActionMenuPresenter setDelegate:](self->_quickActionMenuPresenter, "setDelegate:", self);
  }
}

- (void)_addVenueObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venuesManager"));
  objc_msgSend(v4, "addChangeObserver:", self);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self->_localSearchViewController, "browseVenueBusinessController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venuesManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueWithFocus"));
  objc_msgSend(v8, "handleVenueWithFocusDidChange:", v7);

}

- (void)_enableTextFieldNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_textFieldDidChange:", UITextFieldTextDidChangeNotification, self->_searchField);
  else
    objc_msgSend(v5, "removeObserver:name:object:", self, UITextFieldTextDidChangeNotification, self->_searchField);

}

- (void)_startMonitoringCoreRoutine
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CoreRoutineLocationOfInterestManager sharedManager](CoreRoutineLocationOfInterestManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273920));
  objc_msgSend(v3, "monitorLOIsOfTypes:", v2);

}

- (void)_internalViewDidAppear
{
  -[SearchViewController _enableTextFieldNotification:](self, "_enableTextFieldNotification:", 1);
  if (self->_needsToBecomeFirstResponder)
    -[SearchViewController searchBarBecomeFirstResponder](self, "searchBarBecomeFirstResponder");
}

- (void)_internalViewWillAppear
{
  void *v3;
  id v4;

  -[SearchViewController updateDataSource](self, "updateDataSource");
  -[SearchViewController _restoreRetainedQueryIfNeeded](self, "_restoreRetainedQueryIfNeeded");
  -[SearchViewController _configureSearchBarIfNeeded](self, "_configureSearchBarIfNeeded");
  -[SearchViewController _configureForceTouchIfNeeded](self, "_configureForceTouchIfNeeded");
  -[SearchViewController _addVenueObserver](self, "_addVenueObserver");
  if (!self->_currentDataSource)
    -[HomeViewController scrollContentToOriginalPosition](self->_homeViewController, "scrollContentToOriginalPosition");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "observers"));
  objc_msgSend(v3, "registerObserver:queue:", self, &_dispatch_main_q);

}

- (void)_internalViewWillDisappear
{
  -[SearchViewController _enableTextFieldNotification:](self, "_enableTextFieldNotification:", 0);
  -[SearchViewController showDropDown:](self, "showDropDown:", 0);
  -[SearchViewController showDropDown:](self, "showDropDown:", 0);
}

- (void)_internalViewDidDisappear
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venuesManager"));
  objc_msgSend(v4, "removeChangeObserver:", self);

  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 250000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100618AE0;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchViewController;
  -[SearchViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
    -[SearchViewController _internalViewDidAppear](self, "_internalViewDidAppear");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SVC viewWillAppear", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)SearchViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
    -[SearchViewController _internalViewWillAppear](self, "_internalViewWillAppear");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SVC viewWillDisappear", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
    -[SearchViewController _internalViewWillDisappear](self, "_internalViewWillDisappear");
  v9.receiver = self;
  v9.super_class = (Class)SearchViewController;
  -[ContaineeViewController viewWillDisappear:](&v9, "viewWillDisappear:", v3);
  -[SearchViewController _hideSearchHereControl](self, "_hideSearchHereControl");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
    -[SearchViewController _internalViewDidDisappear](self, "_internalViewDidDisappear");
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  -[SearchViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
}

- (void)viewDidLoad
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *mapsSuggestionsLoadingSearchQueue;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RetainedQueryController *v12;
  RetainedQueryController *retainedQueryController;
  PassthruSearchBar *v14;
  PassthruSearchBar *searchBar;
  void *v16;
  UITextField *v17;
  UITextField *searchField;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIButton *v30;
  UIButton *userProfileButton;
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
  void *v44;
  UILayoutGuide *v45;
  UILayoutGuide *searchFieldLayoutGuide;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double right;
  HairlineView *v64;
  HairlineView *bottomHeaderHairline;
  void *v66;
  void *v67;
  void *v68;
  NSLayoutConstraint *v69;
  NSLayoutConstraint *bottomHideableFooterConstraint;
  void *v71;
  double top;
  double bottom;
  double left;
  __objc2_class **v75;
  PassthruSearchBar *v76;
  void *v77;
  void *v78;
  UIView *v79;
  UIView *dropDownView;
  id v81;
  id v82;
  double y;
  double width;
  double height;
  UICollectionView *v86;
  UICollectionView *collectionView;
  void *v88;
  MapsThemeTableView *v89;
  UITableView *contentTableView;
  id v91;
  void *v92;
  void *v93;
  UIView *v94;
  UIView *hideableFooterView;
  id v96;
  void *v97;
  UIView *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  NSLayoutConstraint *v103;
  NSLayoutConstraint *v104;
  void *v105;
  void *v106;
  void *v107;
  NSLayoutConstraint *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  objc_super v129;
  _QWORD v130[3];
  _QWORD v131[4];
  _QWORD v132[4];

  v129.receiver = self;
  v129.super_class = (Class)SearchViewController;
  -[ContaineeViewController viewDidLoad](&v129, "viewDidLoad");
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.mapsSuggestions", v4);
  mapsSuggestionsLoadingSearchQueue = self->_mapsSuggestionsLoadingSearchQueue;
  self->_mapsSuggestionsLoadingSearchQueue = v5;

  self->_isConfigured = 0;
  v7 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "setBlurInCardView:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v11, "setCardColor:", v10);

  }
  else
  {
    objc_msgSend(v8, "setAllowResizeInFloatingStyle:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "setFirstCard:", 1);
  }

  v12 = objc_alloc_init(RetainedQueryController);
  retainedQueryController = self->_retainedQueryController;
  self->_retainedQueryController = v12;

  v14 = -[PassthruSearchBar initWithStyle:]([PassthruSearchBar alloc], "initWithStyle:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"));
  searchBar = self->_searchBar;
  self->_searchBar = v14;

  -[PassthruSearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v16, "addSubview:", self->_searchBar);

  -[PassthruSearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  -[PassthruSearchBar setTextFieldDelegate:](self->_searchBar, "setTextFieldDelegate:", self);
  v17 = (UITextField *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](self->_searchBar, "searchTextField"));
  searchField = self->_searchField;
  self->_searchField = v17;

  self->_isOfflineBrowseRecordedAlready = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v20 = objc_msgSend(v19, "isUsingOfflineMaps");

  if (v20)
  {
    -[SearchViewController _setupOfflinePlaceholder](self, "_setupOfflinePlaceholder");
    -[SearchViewController _initOfflinePlaceHolderWithCompletion:](self, "_initOfflinePlaceHolderWithCompletion:", 0);
  }
  self->_isOfflineServiceRunning = 0;
  if (sub_1002A8AA0(self) == 5)
    -[UITextField setFocusGroupIdentifier:](self->_searchField, "setFocusGroupIdentifier:", CFSTR("DropDownFocusGroupName"));
  -[UITextField setTextDropDelegate:](self->_searchField, "setTextDropDelegate:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController theme](self, "theme"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBarPlaceHolderColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  self->_searchFieldWantsFocus = 1;
  if (sub_1002A8AA0(self) == 5)
  {
    -[UITextField setControlSize:](self->_searchField, "setControlSize:", 2);
    -[PassthruSearchBar setContentInset:](self->_searchBar, "setContentInset:", 3.0, 15.0, 3.0, 15.0);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v25 = objc_msgSend(v24, "effectiveUserInterfaceLayoutDirection");

  if (sub_1002A8AA0(self) != 5 && !-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
  {
    if (v25 == (id)1)
      v26 = 62.0;
    else
      v26 = 16.0;
    if (v25 == (id)1)
      v27 = 16.0;
    else
      v27 = 62.0;
    if (v25 == (id)1)
      v28 = -16.0;
    else
      v28 = -8.0;
    if (v25 == (id)1)
      v29 = -8.0;
    else
      v29 = -16.0;
    -[PassthruSearchBar setContentInset:](self->_searchBar, "setContentInset:", 17.0, v26, 17.0, v27);
    v30 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    userProfileButton = self->_userProfileButton;
    self->_userProfileButton = v30;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_userProfileButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](self->_userProfileButton, "setAccessibilityIdentifier:", CFSTR("userProfileButton"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_userProfileButton, "imageView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    objc_msgSend(v32, "setTintColor:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_userProfileButton, "imageView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", (uint64_t)UIFontWeightRegular, 36.0));
    objc_msgSend(v34, "setPreferredSymbolConfiguration:", v35);

    -[UIButton addTarget:action:forControlEvents:](self->_userProfileButton, "addTarget:action:forControlEvents:", self, "presentUserProfile", 64);
    -[UIButton _setTouchInsets:](self->_userProfileButton, "_setTouchInsets:", -17.0, v28, -17.0, v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v36, "addSubview:", self->_userProfileButton);

    -[SearchViewController _updateUserProfileEntryPointImage](self, "_updateUserProfileEntryPointImage");
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_userProfileButton, "widthAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToConstant:", 36.0));
    v132[0] = v125;
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_userProfileButton, "heightAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_userProfileButton, "widthAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v121));
    v132[1] = v120;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_userProfileButton, "centerYAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar centerYAnchor](self->_searchBar, "centerYAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    v132[2] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_userProfileButton, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -16.0));
    v132[3] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

  }
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
    -[SearchViewController addCloseSearchResultsButtonBesidesSearchBar:](self, "addCloseSearchResultsButtonBesidesSearchBar:", self->_searchBar);
  v45 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  searchFieldLayoutGuide = self->_searchFieldLayoutGuide;
  self->_searchFieldLayoutGuide = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v47, "addLayoutGuide:", self->_searchFieldLayoutGuide);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_searchFieldLayoutGuide, "widthAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToConstant:", 282.0));

  LODWORD(v50) = 1148846080;
  objc_msgSend(v49, "setPriority:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_searchFieldLayoutGuide, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField widthAnchor](self->_searchField, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));

  LODWORD(v54) = 1148829696;
  objc_msgSend(v53, "setPriority:", v54);
  v126 = v53;
  v128 = v49;
  v131[0] = v49;
  v131[1] = v53;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_searchFieldLayoutGuide, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_searchField, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
  v131[2] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_searchFieldLayoutGuide, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_searchField, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  v131[3] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v61);

  -[SearchViewController _initPlaceholderWithSubmitTicketIfNeeded:](self, "_initPlaceholderWithSubmitTicketIfNeeded:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  right = 0.0;
  v64 = (HairlineView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "_maps_addHairlineAtBottomWithMargin:", 0.0));
  bottomHeaderHairline = self->_bottomHeaderHairline;
  self->_bottomHeaderHairline = v64;

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
  v69 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v68));
  bottomHideableFooterConstraint = self->_bottomHideableFooterConstraint;
  self->_bottomHideableFooterConstraint = v69;

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_1002A8AA0(self) == 5)
  {
    top = -4.0;
    bottom = 7.0;
    left = 0.0;
    v75 = off_101198000;
  }
  else
  {
    v75 = off_101198000;
    if (-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
    {
      bottom = 5.0;
      left = 0.0;
      top = 0.0;
    }
    else
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
  }
  v76 = self->_searchBar;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar _maps_constraintsForCenteringInView:edgeInsets:](v76, "_maps_constraintsForCenteringInView:edgeInsets:", v77, top, left, bottom, right));
  v124 = v71;
  objc_msgSend(v71, "addObjectsFromArray:", v78);

  if (sub_1002A8AA0(self) == 5)
  {
    v79 = (UIView *)objc_alloc_init((Class)UIView);
    dropDownView = self->_dropDownView;
    self->_dropDownView = v79;

  }
  v81 = objc_alloc((Class)UICollectionView);
  v82 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v86 = (UICollectionView *)objc_msgSend(v81, "initWithFrame:collectionViewLayout:", v82, CGRectZero.origin.x, y, width, height);
  collectionView = self->_collectionView;
  self->_collectionView = v86;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class clearColor](v75[37], "clearColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v88);

  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("SearchHomeView"));
  -[UICollectionView setPreservesSuperviewLayoutMargins:](self->_collectionView, "setPreservesSuperviewLayoutMargins:", 1);
  if (sub_1002A8AA0(self) == 5)
  {
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, 10.0, 0.0);
    -[UICollectionView setFocusGroupIdentifier:](self->_collectionView, "setFocusGroupIdentifier:", CFSTR("DropDownFocusGroupName"));
  }
  v89 = objc_alloc_init(MapsThemeTableView);
  contentTableView = self->_contentTableView;
  self->_contentTableView = &v89->super;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setEstimatedSectionHeaderHeight:](self->_contentTableView, "setEstimatedSectionHeaderHeight:", 0.0);
  v91 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UITableView setTableFooterView:](self->_contentTableView, "setTableFooterView:", v91);

  -[UITableView _setHeaderAndFooterViewsFloat:](self->_contentTableView, "_setHeaderAndFooterViewsFloat:", 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class clearColor](v75[37], "clearColor"));
  -[UITableView setBackgroundColor:](self->_contentTableView, "setBackgroundColor:", v92);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView layer](self->_contentTableView, "layer"));
  objc_msgSend(v93, "setAllowsGroupOpacity:", 0);

  if (sub_1002A8AA0(self) == 5)
    -[UITableView setFocusGroupIdentifier:](self->_contentTableView, "setFocusGroupIdentifier:", CFSTR("DropDownFocusGroupName"));
  -[UITableView setSectionHeaderTopPadding:](self->_contentTableView, "setSectionHeaderTopPadding:", 0.0);
  -[UITableView setPreservesSuperviewLayoutMargins:](self->_contentTableView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UITableView setAccessibilityIdentifier:](self->_contentTableView, "setAccessibilityIdentifier:", CFSTR("SearchAutocompleteView"));
  v94 = (UIView *)objc_alloc_init((Class)UIView);
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v94;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hideableFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v96 = -[UIView _maps_addHairlineAtTopWithMargin:](self->_hideableFooterView, "_maps_addHairlineAtTopWithMargin:", 0.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v98 = self->_hideableFooterView;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v97, "insertSubview:belowSubview:", v98, v99);

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "bottomAnchor"));
  v103 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v102));
  v104 = self->_bottomHideableFooterConstraint;
  self->_bottomHideableFooterConstraint = v103;

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v106));
  v108 = self->_bottomHideableFooterConstraint;
  v130[0] = v107;
  v130[1] = v108;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "leadingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v111));
  v130[2] = v112;
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 3));
  objc_msgSend(v124, "addObjectsFromArray:", v113);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v124);
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](self->_searchBar, "searchTextField"));
  objc_msgSend(v114, "addTarget:action:forControlEvents:", self, "didSelectSearchBar:", 1);

  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v115, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v116, "addObserver:selector:name:object:", self, "popoverPresented:", CFSTR("MacPopoverPresentationControllerDidPresentPopover"), 0);

  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v117, "addObserver:selector:name:object:", self, "popoverDismissed:", CFSTR("MacPopoverPresentationControllerDidDismissPopover"), 0);

  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v118, "addObserver:selector:name:object:", self, "_offlineSettingChangeHandler", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v119, "addObserver:selector:name:object:", self, "_preventAutoPresentingKeyboard_rdar_126940251", CFSTR("SearchViewPreventAutoPresentingKeyboard_rdar_126940251"), 0);

  -[SearchViewController _startMonitoringCoreRoutine](self, "_startMonitoringCoreRoutine");
  +[KeyboardAvoidingView startObservingKeyboard](KeyboardAvoidingView, "startObservingKeyboard");
  -[SearchViewController _contentAlphaForCurrentLayout](self, "_contentAlphaForCurrentLayout");
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);

}

- (void)didSelectSearchBar:(id)a3
{
  self->_userSelectedSearchBar = 1;
}

- (void)viewDidLayoutSubviews
{
  SearchDataSource *v3;
  SearchDataSource *v4;
  unsigned int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  v3 = (SearchDataSource *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v4 = v3;
  if (v3 == self->_searchDataSource)
  {
    v5 = -[SearchDataSource shouldReloadOnHeightChange](v3, "shouldReloadOnHeightChange");

    if (v5)
      -[SearchViewController reloadContentTableView](self, "reloadContentTableView");
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[SearchViewController _updateDefaultLayoutWithContainerStyle:](self, "_updateDefaultLayoutWithContainerStyle:", objc_msgSend(v6, "containerStyle"));

}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchViewController;
  -[SearchViewController viewLayoutMarginsDidChange](&v4, "viewLayoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "bottomSafeOffset");
  -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");

}

- (void)_updateUserProfileEntryPointImage
{
  UIButton *userProfileButton;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  userProfileButton = self->_userProfileButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userIcon"));
  -[UIButton setImage:forState:](userProfileButton, "setImage:forState:", v4, 0);

}

- (void)_updateUserProfileEntryPointButton
{
  void *v3;
  void *v4;
  id v5;
  PassthruSearchBar *searchBar;
  double v7;
  double v8;
  double v9;
  double v10;

  if (sub_1002A8AA0(self) != 5 && !-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
      v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

      if (-[UIButton isHidden](self->_userProfileButton, "isHidden"))
      {
        searchBar = self->_searchBar;
        v7 = 17.0;
        v8 = 16.0;
      }
      else
      {
        searchBar = self->_searchBar;
        if (v5 != (id)1)
        {
          v10 = 62.0;
          v7 = 17.0;
          v8 = 16.0;
          v9 = 17.0;
          goto LABEL_11;
        }
        v8 = 62.0;
        v7 = 17.0;
      }
      v9 = 17.0;
      v10 = 16.0;
LABEL_11:
      -[PassthruSearchBar setContentInset:](searchBar, "setContentInset:", v7, v8, v9, v10);
    }
  }
}

- (void)presentUserProfile
{
  id v3;

  +[UserProfileAnalyticsManager captureEnterAccountTapAction](UserProfileAnalyticsManager, "captureEnterAccountTapAction");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController homeActionCoordinator](self, "homeActionCoordinator"));
  objc_msgSend(v3, "viewControllerPresentUserProfile:", self);

}

- (MapsDragDestinationHandler)mapsDragDestinationHandler
{
  MapsDragDestinationHandler *mapsDragDestinationHandler;
  MapsDragDestinationHandler *v4;
  MapsDragDestinationHandler *v5;
  void *v6;

  mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  if (!mapsDragDestinationHandler)
  {
    v4 = objc_alloc_init(MapsDragDestinationHandler);
    v5 = self->_mapsDragDestinationHandler;
    self->_mapsDragDestinationHandler = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    -[MapsDragDestinationHandler setDelegate:](self->_mapsDragDestinationHandler, "setDelegate:", v6);

    mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
  }
  return mapsDragDestinationHandler;
}

- (id)searchBar
{
  return self->_searchBar;
}

- (void)handleDismissAction:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  if (-[HomeViewController isActive](self->_homeViewController, "isActive", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController presentedViewController](self, "presentedViewController"));
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      v6 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol);
      v5 = v7;
      if ((v6 & 1) == 0)
      {
        objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
        v5 = v7;
      }
    }

  }
  else
  {
    -[SearchViewController endSearch](self, "endSearch");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  UIView *dropDownView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextFocusedItem"));
  if (!v5)
    goto LABEL_5;
  dropDownView = self->_dropDownView;
  if (!dropDownView)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextFocusedItem"));
  if (+[UIFocusSystem environment:containsEnvironment:](UIFocusSystem, "environment:containsEnvironment:", dropDownView, v7))
  {

LABEL_5:
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextFocusedItem"));
  v13 = +[UIFocusSystem environment:containsEnvironment:](UIFocusSystem, "environment:containsEnvironment:", self, v12);

  if ((v13 & 1) == 0)
    -[SearchViewController showDropDown:](self, "showDropDown:", 0);
LABEL_6:
  if (sub_1002A8AA0(self) != 5 && self->_homeViewController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "focusedItem"));

    if (!v9)
    {
LABEL_18:

      goto LABEL_19;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    if (objc_msgSend(v10, "containerStyle") == (id)6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      if (objc_msgSend(v11, "containeeLayout") == (id)1)
      {

      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        v15 = objc_msgSend(v14, "containeeLayout");

        if (v15 != (id)2)
        {
LABEL_17:
          self->_searchFieldWantsFocus = 1;
          goto LABEL_18;
        }
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "wantsLayout:", 3);
    }

    goto LABEL_17;
  }
LABEL_19:

}

- (void)willBecomeCurrent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *currentDataSource;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchViewController;
  -[ContaineeViewController willBecomeCurrent:](&v10, "willBecomeCurrent:");
  -[SearchViewController _internalViewWillAppear](self, "_internalViewWillAppear");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "updateHistoricalLocations");

  currentDataSource = self->_currentDataSource;
  if (!currentDataSource)
    currentDataSource = self->_homeViewController;
  objc_msgSend(currentDataSource, "setActive:", 1);
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "willBecomeCurrent:", v3);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("SearchWillBecomeCurrentNotification"), self);

}

- (void)willBecomeCurrentByGesture
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  -[ContaineeViewController willBecomeCurrentByGesture](&v5, "willBecomeCurrentByGesture");
  -[SearchViewController _restoreRetainedQueryIfNeeded](self, "_restoreRetainedQueryIfNeeded");
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "willBecomeCurrentByGesture");

  }
}

- (void)didBecomeCurrent
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  -[ContaineeViewController didBecomeCurrent](&v5, "didBecomeCurrent");
  -[SearchViewController _internalViewDidAppear](self, "_internalViewDidAppear");
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "didBecomeCurrent");

  }
}

- (void)willResignCurrent:(BOOL)a3
{
  _BOOL8 v3;
  void *currentDataSource;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[SearchViewController _internalViewWillDisappear](self, "_internalViewWillDisappear");
  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  -[ContaineeViewController willResignCurrent:](&v7, "willResignCurrent:", v3);
  if (!self->_maintainSearchStateWhenDisappearing)
  {
    currentDataSource = self->_currentDataSource;
    if (!currentDataSource)
      currentDataSource = self->_homeViewController;
    objc_msgSend(currentDataSource, "setActive:", 0);
  }
  self->_maintainSearchStateWhenDisappearing = 0;
  -[SearchViewController _hideSearchHereControl](self, "_hideSearchHereControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SearchWillResignCurrentNotification"), self);

}

- (void)didResignCurrent
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SearchViewController _internalViewDidDisappear](self, "_internalViewDidDisappear");
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "didResignCurrent");

  }
  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  -[ContaineeViewController didResignCurrent](&v5, "didResignCurrent");
}

- (unint64_t)preferredPresentationStyle
{
  return 1;
}

- (id)_homeViewController
{
  HomeViewController *homeViewController;
  HomeViewController *v4;
  HomeViewController *v5;
  HomeViewController *v6;

  if (-[SearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    homeViewController = self->_homeViewController;
    if (!homeViewController)
    {
      v4 = -[HomeViewController initWithDelegate:]([HomeViewController alloc], "initWithDelegate:", self);
      v5 = self->_homeViewController;
      self->_homeViewController = v4;

      homeViewController = self->_homeViewController;
    }
    v6 = homeViewController;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)searchHomeDataSource
{
  SearchHomeDataSource *searchHomeDataSource;
  SearchHomeDataSource *v4;
  SearchHomeDataSource *v5;
  SearchHomeDataSource *v6;

  if (-[SearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    searchHomeDataSource = self->_searchHomeDataSource;
    if (!searchHomeDataSource)
    {
      v4 = -[SearchHomeDataSource initWithCollectionView:updateLocation:isSearchAlongRoute:supportsFullTextSearch:]([SearchHomeDataSource alloc], "initWithCollectionView:updateLocation:isSearchAlongRoute:supportsFullTextSearch:", self->_collectionView, 0, -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"), self->_supportsFullTextSearch);
      -[DataSource setDelegate:](v4, "setDelegate:", self);
      -[SearchHomeDataSource setSearchHomeDataSourceDelegate:](v4, "setSearchHomeDataSourceDelegate:", self);
      v5 = self->_searchHomeDataSource;
      self->_searchHomeDataSource = v4;

      searchHomeDataSource = self->_searchHomeDataSource;
    }
    v6 = searchHomeDataSource;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)searchDataSource
{
  SearchDataSource *searchDataSource;
  SearchDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  SearchDataSource *v8;
  SearchDataSource *v9;

  if (-[SearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    searchDataSource = self->_searchDataSource;
    if (!searchDataSource)
    {
      v4 = -[SearchDataSource initWithTableView:]([SearchDataSource alloc], "initWithTableView:", self->_contentTableView);
      -[DataSource setDelegate:](v4, "setDelegate:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController personalizedItemManager](self, "personalizedItemManager"));
      -[SearchDataSource setMapPersonalizedItems:](v4, "setMapPersonalizedItems:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userLocationSearchResult"));
      -[SearchDataSource setUserLocationSearchResult:](v4, "setUserLocationSearchResult:", v7);

      -[SearchDataSource setShowPlaceContext:](v4, "setShowPlaceContext:", 1);
      -[SearchDataSource setSearchAlongRoute:](v4, "setSearchAlongRoute:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"));
      -[SearchDataSource setUsePlaceSummary:](v4, "setUsePlaceSummary:", sub_1008974F8());
      -[SearchDataSource setCanShowQueryAccelerator:](v4, "setCanShowQueryAccelerator:", 1);
      v8 = self->_searchDataSource;
      self->_searchDataSource = v4;

      searchDataSource = self->_searchDataSource;
    }
    v9 = searchDataSource;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)preferredContentSizeChanged:(id)a3
{
  void *v4;

  -[PassthruSearchBar invalidateIntrinsicContentSize](self->_searchBar, "invalidateIntrinsicContentSize", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

  -[SearchViewController reloadContentTableView](self, "reloadContentTableView");
}

- (void)popoverPresented:(id)a3
{
  self->_didPresentPopover = 1;
}

- (void)popoverDismissed:(id)a3
{
  _QWORD v4[5];

  if (self->_didPresentPopover && self->_userSelectedSearchBar)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10061A7F0;
    v4[3] = &unk_1011AE8F8;
    v4[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &stru_1011BE2E0, v4, 0.0);
    self->_userSelectedSearchBar = 0;
    self->_didPresentPopover = 0;
  }
}

- (void)setPersonalizedItemManager:(id)a3
{
  SearchDataSource *searchDataSource;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_personalizedItemManager, v5);
  searchDataSource = self->_searchDataSource;
  if (searchDataSource)
    -[SearchDataSource setMapPersonalizedItems:](searchDataSource, "setMapPersonalizedItems:", v5);

}

- (PersonalizedItemSource)suggestionsItemSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController _homeViewController](self, "_homeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestionsItemSource"));

  return (PersonalizedItemSource *)v3;
}

- (void)_updateSearchFieldText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentSearchSession](self, "currentSearchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestion"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBarDisplayToken"));

  if (v10)
    v5 = v10;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self->_searchItem, "searchString"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchField](self->_searchBar, "searchField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
  if (objc_msgSend(v8, "isEqualToString:", v6))
  {
    v9 = objc_msgSend(v7, "isFirstResponder");

    if ((v9 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  objc_msgSend(v7, "setText:", v6);
LABEL_9:

}

- (id)currentSearchSession
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSearchSession"));

  return v3;
}

- (void)updateContentState
{
  if (-[SearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SearchViewController updateDataSource](self, "updateDataSource");
    -[SearchViewController resetMapServiceTicket](self, "resetMapServiceTicket");
  }
}

- (void)updateDataSource
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 supportsFullTextSearch;
  void *v17;
  _BOOL4 v18;
  id v19;

  if (!-[SearchViewController isViewLoaded](self, "isViewLoaded"))
    return;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_stringByTrimmingLeadingWhitespace"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else if (sub_1002A8AA0(self) == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v5 = v6 != 0;

  }
  if ((-[UITextField isFirstResponder](self->_searchField, "isFirstResponder") & 1) != 0
    || (-[PassthruSearchBar showsCancelButton](self->_searchBar, "showsCancelButton") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute");
  }
  if (sub_1002A8AA0(self) == 5)
  {
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "macMenuPresentationController"));
      v10 = objc_msgSend(v9, "isPresented");

    }
    else
    {
      v10 = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "macMenuPresentationController"));
    v7 = objc_msgSend(v13, "isPresented");

    if ((v10 & 1) == 0)
      goto LABEL_19;
LABEL_16:
    v11 = objc_claimAutoreleasedReturnValue(-[SearchViewController searchDataSource](self, "searchDataSource"));
    goto LABEL_21;
  }
  if (v5)
    goto LABEL_16;
LABEL_19:
  if (!v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    if (objc_msgSend(v15, "isUsingOfflineMaps"))
    {
      supportsFullTextSearch = self->_supportsFullTextSearch;

      if (!supportsFullTextSearch)
      {
        -[SearchViewController _shouldHideOfflineHeaderView:](self, "_shouldHideOfflineHeaderView:", 1);
        -[UITextField resignFirstResponder](self->_searchField, "resignFirstResponder");
      }
    }
    else
    {

    }
    v14 = 0;
    goto LABEL_27;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
LABEL_21:
  v14 = (void *)v11;
LABEL_27:
  v19 = v14;
  -[SearchViewController setCurrentDataSource:](self, "setCurrentDataSource:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v17, "isUsingOfflineMaps"))
  {
    v18 = self->_supportsFullTextSearch;

    if (!v18)
      -[UITextField resignFirstResponder](self->_searchField, "resignFirstResponder");
  }
  else
  {

  }
}

- (void)setCurrentDataSource:(id)a3
{
  DataSource *v5;
  DataSource *v6;
  DataSource **p_currentDataSource;
  id v8;
  NSObject *v9;
  UIView *v10;
  DataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *homeViewControllerBottomConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  void *v31;
  void *v32;
  void *v33;
  UIView *v34;
  id v35;
  void *v36;
  unsigned int v37;
  UICollectionView *v38;
  void *collectionView;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  HomeViewController *homeViewController;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  UICollectionView *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  _BOOL8 supportsFullTextSearch;
  void *v62;
  _BOOL8 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  UICollectionView *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  DataSource *v79;
  DataSource *v80;
  _QWORD v81[4];
  _QWORD v82[4];
  uint8_t buf[4];
  DataSource *v84;

  v5 = (DataSource *)a3;
  v6 = v5;
  p_currentDataSource = &self->_currentDataSource;
  if (self->_currentDataSource == v5 && (v5 || -[HomeViewController isActive](self->_homeViewController, "isActive")))
    goto LABEL_40;
  v8 = sub_100432EDC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v84 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SVC setCurrentDataSource %@", buf, 0xCu);
  }

  if (*p_currentDataSource)
  {
    -[DataSource setActive:](*p_currentDataSource, "setActive:", 0);
  }
  else if (sub_1002A8AA0(self) != 5)
  {
    -[HomeViewController setActive:](self->_homeViewController, "setActive:", 0);
    -[UIButton setHidden:](self->_userProfileButton, "setHidden:", 1);
    -[SearchViewController _updateUserProfileEntryPointButton](self, "_updateUserProfileEntryPointButton");
  }
  if (*p_currentDataSource == (DataSource *)self->_searchHomeDataSource)
  {
    -[UICollectionView _maps_scrollContentToOriginalPosition](self->_collectionView, "_maps_scrollContentToOriginalPosition");
    if (v6)
    {
LABEL_13:
      -[SearchViewController updateIsTouristHereValue](self, "updateIsTouristHereValue");
      objc_storeStrong((id *)&self->_currentDataSource, a3);
      if (sub_1002A8AA0(self) == 5)
        v10 = self->_dropDownView;
      else
        v10 = (UIView *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v34 = v10;
      v35 = -[DataSource presentationStyle](v6, "presentationStyle");
      if (v35 == (id)1)
      {
        -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", v6);
        if (-[DataSource conformsToProtocol:](v6, "conformsToProtocol:", &OBJC_PROTOCOL___DataSourceCollectionView))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionViewDiffableDataSource](v6, "collectionViewDiffableDataSource"));
          -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", v40);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionViewLayout](v6, "collectionViewLayout"));
          -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v41);

        }
        -[UITableView removeFromSuperview](self->_contentTableView, "removeFromSuperview");
        v38 = self->_collectionView;
        collectionView = self->_collectionView;
      }
      else
      {
        if (v35)
        {
          v38 = 0;
          goto LABEL_35;
        }
        -[UITableView setDelegate:](self->_contentTableView, "setDelegate:", v6);
        if (-[DataSource conformsToProtocol:](v6, "conformsToProtocol:", &OBJC_PROTOCOL___UITableViewDataSource))-[UITableView setDataSource:](self->_contentTableView, "setDataSource:", v6);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
        v37 = objc_msgSend(v36, "deviceSupportsDragAndDrop");

        if (v37)
          -[UITableView setDragDelegate:](self->_contentTableView, "setDragDelegate:", v6);
        -[UICollectionView removeFromSuperview](self->_collectionView, "removeFromSuperview");
        v38 = self->_contentTableView;
        if (sub_1002A8AA0(self) == 5)
          -[UITableView setSeparatorStyle:](self->_contentTableView, "setSeparatorStyle:", 0);
        collectionView = self->_contentTableView;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
      objc_msgSend(v42, "setTrackedScrollview:", collectionView);

LABEL_35:
      v43 = sub_1002A8AA0(self);
      homeViewController = self->_homeViewController;
      v80 = v6;
      if (v43 == 5)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](homeViewController, "view"));
        objc_msgSend(v45, "setAlpha:", 0.300000012);

      }
      else
      {
        -[HomeViewController scrollContentToOriginalPosition](homeViewController, "scrollContentToOriginalPosition");
        -[HomeViewController willMoveToParentViewController:](self->_homeViewController, "willMoveToParentViewController:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
        objc_msgSend(v46, "removeFromSuperview");

        -[HomeViewController removeFromParentViewController](self->_homeViewController, "removeFromParentViewController");
      }
      -[UIView insertSubview:atIndex:](v34, "insertSubview:atIndex:", v38, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v38, "topAnchor"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v34, "topAnchor"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v75));
      v82[0] = v73;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](v38, "leadingAnchor"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v34, "leadingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v67));
      v82[1] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](v38, "trailingAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v34, "trailingAnchor"));
      v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
      v51 = v38;
      v71 = v38;
      v52 = (void *)v50;
      v82[2] = v50;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v51, "bottomAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v34, "bottomAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
      v82[3] = v55;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);

      -[DataSource setActive:](self->_currentDataSource, "setActive:", 1);
      -[SearchViewController reloadContentTableView](self, "reloadContentTableView");

      v6 = v80;
      goto LABEL_39;
    }
  }
  else if (v6)
  {
    goto LABEL_13;
  }
  self->_userSelectedSearchBar = 0;
  -[SearchViewController updateIsTouristHereValue](self, "updateIsTouristHereValue");
  v11 = *p_currentDataSource;
  *p_currentDataSource = 0;

  -[UITableView removeFromSuperview](self->_contentTableView, "removeFromSuperview");
  -[UICollectionView removeFromSuperview](self->_collectionView, "removeFromSuperview");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController parentViewController](self->_homeViewController, "parentViewController"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController _homeViewController](self, "_homeViewController"));
    -[SearchViewController addChildViewController:](self, "addChildViewController:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    objc_msgSend(v14, "insertSubview:atIndex:", v15, 0);

    -[HomeViewController didMoveToParentViewController:](self->_homeViewController, "didMoveToParentViewController:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v79 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    homeViewControllerBottomConstraint = self->_homeViewControllerBottomConstraint;
    self->_homeViewControllerBottomConstraint = v21;

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v72));
    v81[0] = v70;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v23));
    v81[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    v30 = self->_homeViewControllerBottomConstraint;
    v81[2] = v29;
    v81[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    v6 = v79;
  }
  -[HomeViewController setActive:](self->_homeViewController, "setActive:", 1);
  -[UIButton setHidden:](self->_userProfileButton, "setHidden:", -[PassthruSearchBar isHidden](self->_searchBar, "isHidden"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  objc_msgSend(v32, "setHidden:", v33 == 0);

  -[SearchViewController _updateUserProfileEntryPointButton](self, "_updateUserProfileEntryPointButton");
  if (sub_1002A8AA0(self) == 5)
  {
    v34 = (UIView *)objc_claimAutoreleasedReturnValue(-[HomeViewController view](self->_homeViewController, "view"));
    -[UIView setAlpha:](v34, "setAlpha:", 1.0);
LABEL_39:

  }
LABEL_40:
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v58 = objc_msgSend(v57, "isUsingOfflineMaps");

  if (v58)
  {
    if (-[HomeViewController isActive](self->_homeViewController, "isActive"))
    {
      -[UIButton setHidden:](self->_userProfileButton, "setHidden:", 0);
      -[PassthruSearchBar setHidden:](self->_searchBar, "setHidden:", 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
      objc_msgSend(v59, "setHidden:", 1);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
      objc_msgSend(v60, "setHidden:", 1);
    }
    else
    {
      -[PassthruSearchBar setHidden:](self->_searchBar, "setHidden:", !self->_supportsFullTextSearch);
      supportsFullTextSearch = self->_supportsFullTextSearch;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
      objc_msgSend(v62, "setHidden:", supportsFullTextSearch);

      v63 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute")
         || self->_supportsFullTextSearch;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "buttonView"));
      objc_msgSend(v64, "setHidden:", v63);

    }
  }

}

- (int64_t)currentDataSourceType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchDataSource](self, "searchDataSource"));

  if (v3 == v4)
    return 2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
  v7 = v5 == v6;

  return v7;
}

- (MenuContaineeViewController)menuController
{
  MenuContaineeViewController *menuController;
  MenuContaineeViewController *v4;
  MenuContaineeViewController *v5;
  UILayoutGuide *searchFieldLayoutGuide;
  void *v7;
  UILayoutGuide *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PassthruSearchBar *searchBar;

  menuController = self->_menuController;
  if (!menuController)
  {
    v4 = -[MenuContaineeViewController initWithContentView:]([MenuContaineeViewController alloc], "initWithContentView:", self->_dropDownView);
    v5 = self->_menuController;
    self->_menuController = v4;

    -[MenuContaineeViewController setTrackedScrollview:](self->_menuController, "setTrackedScrollview:", self->_collectionView);
    searchFieldLayoutGuide = self->_searchFieldLayoutGuide;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macMenuPresentationController](self->_menuController, "macMenuPresentationController"));
    objc_msgSend(v7, "setAnchorLayoutGuide:", searchFieldLayoutGuide);

    v8 = self->_searchFieldLayoutGuide;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macMenuPresentationController](self->_menuController, "macMenuPresentationController"));
    objc_msgSend(v9, "setWidthLayoutGuide:", v8);

    searchBar = self->_searchBar;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &searchBar, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macMenuPresentationController](self->_menuController, "macMenuPresentationController"));
    objc_msgSend(v11, "setPassThroughViews:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macMenuPresentationController](self->_menuController, "macMenuPresentationController"));
    objc_msgSend(v12, "addObserver:", self);

    menuController = self->_menuController;
  }
  return menuController;
}

- (void)showDropDown:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "macMenuPresentationController"));
      v7 = objc_msgSend(v6, "isPresented");

      if ((v7 & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
        objc_msgSend(v9, "viewController:presentMenuController:animated:fromChrome:completion:", self, v10, 1, 1, 0);

        -[SearchViewController showTitleBarSeparatorWhenScrolling:](self, "showTitleBarSeparatorWhenScrolling:", 0);
      }
    }
    else
    {
      self->_userSelectedSearchBar = 0;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
      objc_msgSend(v11, "viewController:dismissMenuControllerAnimated:", v8, 1);

    }
  }
}

- (void)updateSearchFieldWithItem:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (sub_1002A8AA0(self) == 5 && (objc_msgSend(v6, "isSpotlightSearch") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (uint64_t)objc_msgSend(v5, "isRunningTest");

  }
  else
  {
    v4 = 1;
  }
  -[SearchViewController _updateSearchFieldWithItem:updatingSearchText:](self, "_updateSearchFieldWithItem:updatingSearchText:", v6, v4);

}

- (void)_updateSearchFieldWithItem:(id)a3 updatingSearchText:(BOOL)a4
{
  _BOOL4 v4;
  SearchFieldItem *v7;
  SearchFieldItem *v8;

  v4 = a4;
  v7 = (SearchFieldItem *)a3;
  if (self->_searchItem != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_searchItem, a3);
    -[SearchViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    if (v4)
      -[SearchViewController _updateSearchFieldText](self, "_updateSearchFieldText");
    -[SearchViewController setNeedsUpdateContentState](self, "setNeedsUpdateContentState");
    -[SearchViewController updateDataSource](self, "updateDataSource");
    v7 = v8;
  }

}

- (void)showTitleBarSeparatorWhenScrolling:(BOOL)a3
{
  double v3;

  v3 = -1.0;
  if (a3)
    v3 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_homeViewControllerBottomConstraint, "setConstant:", v3);
}

- (void)showSearchResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentSearchSession](self, "currentSearchSession"));
  if (objc_msgSend(v5, "isInvalidated"))
  {
    v6 = sub_10043222C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[SearchVC] The current search session : %@ was invalidated. Not showing any search results.", (uint8_t *)&v11, 0xCu);
    }

  }
  else if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    -[UIButton setHidden:](self->_userProfileButton, "setHidden:", 1);
    -[SearchViewController displaySearchResultsWithViewController:searchBar:](self, "displaySearchResultsWithViewController:searchBar:", v4, self->_searchBar);
    -[SearchViewController updateCloseSearchResultEntryPointButton:searchBarToButtonSpacing:userButtonWidth:](self, "updateCloseSearchResultEntryPointButton:searchBarToButtonSpacing:userButtonWidth:", self->_searchBar, 10.0, 36.0);
    -[SearchViewController endEditing](self, "endEditing");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentSearchSession](self, "currentSearchSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "refreshSearchHereBusinessController"));
    objc_msgSend(v10, "setSearchSession:", v8);

  }
}

- (BOOL)isShowingOmnipresentSearchBar
{
  int IsEnabled_SearchAndDiscovery;

  IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(self);
  if (IsEnabled_SearchAndDiscovery)
    LOBYTE(IsEnabled_SearchAndDiscovery) = sub_1002A8AA0(self) != 5;
  return IsEnabled_SearchAndDiscovery;
}

- (void)reloadContentTableView
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v4 = objc_msgSend(v3, "presentationStyle");

  if (!v4)
  {
    -[SearchViewController updateRowHeightForCurrentDataSource](self, "updateRowHeightForCurrentDataSource");
    -[SearchViewController _invalidateMediumHeightCache](self, "_invalidateMediumHeightCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));

    if (v5)
      -[UITableView reloadData](self->_contentTableView, "reloadData");
  }
  -[SearchViewController _contentAlphaForCurrentLayout](self, "_contentAlphaForCurrentLayout");
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);
}

- (void)updateRowHeightForCurrentDataSource
{
  DataSource *currentDataSource;
  double v4;
  double v5;
  double v6;

  currentDataSource = self->_currentDataSource;
  if (currentDataSource)
  {
    -[DataSource rowHeight](currentDataSource, "rowHeight");
    v5 = v4;
  }
  else
  {
    v5 = UITableViewAutomaticDimension;
  }
  -[UITableView rowHeight](self->_contentTableView, "rowHeight");
  if (v6 != v5)
    -[UITableView setRowHeight:](self->_contentTableView, "setRowHeight:", v5);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v12 = objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___MapsUICollectionViewDiffableDataSourceCellProviding);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView:cellForItemAtIndexPath:itemIdentifier:", v8, v9, v10));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v12 = objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___MapsUICollectionViewDiffableDataSourceCellProviding);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v8, v9, v10));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)cleanSearch
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;
  NSString *userTypedSearchString;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  if (v7)
  {
    objc_msgSend(v7, "willMoveToParentViewController:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(v7, "removeFromParentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v4, "setHidden:", 1);

  }
  -[SearchDataSource reset](self->_searchDataSource, "reset");
  v5 = objc_alloc_init(SearchFieldItem);
  -[SearchViewController updateSearchFieldWithItem:](self, "updateSearchFieldWithItem:", v5);

  userTypedSearchString = self->_userTypedSearchString;
  self->_userTypedSearchString = 0;

  -[SearchViewController _hideSearchHereControl](self, "_hideSearchHereControl");
}

- (void)endEditing
{
  void *v3;
  id v4;
  void *v5;

  if (-[UITextField isFirstResponder](self->_searchField, "isFirstResponder"))
  {
    -[PassthruSearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v4 = objc_msgSend(v3, "containerStyle");

    if (v4 == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v5, "wantsLayout:", 2);

    }
  }
  -[SearchViewController showDropDown:](self, "showDropDown:", 0);
}

- (void)endSearch
{
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];

  -[SearchViewController _hideSearchHereControl](self, "_hideSearchHereControl");
  self->_searchFieldWantsFocus = 0;
  -[PassthruSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 0, 1);
  -[SearchViewController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
  objc_msgSend(v3, "clearMKLocalSearchCompleterQueryState");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10061C108;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  v4 = objc_retainBlock(v6);
  if (sub_1002A8AA0(self) == 5)
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }
  else
  {
    -[UIButton setHidden:](self->_userProfileButton, "setHidden:", -[PassthruSearchBar isHidden](self->_searchBar, "isHidden"));
    -[SearchViewController _updateUserProfileEntryPointButton](self, "_updateUserProfileEntryPointButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "applyWithAnimations:completion:", v4, &stru_1011BE300);

  }
}

- (void)_invalidateSearchSession:(id)a3
{
  SearchViewController *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  SearchViewController *v16;
  __int16 v17;
  const char *v18;

  v4 = (SearchViewController *)a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 134218242;
    v16 = self;
    v17 = 2080;
    v18 = "-[SearchViewController _invalidateSearchSession:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%p] %s", (uint8_t *)&v15, 0x16u);
  }

  v7 = sub_10043222C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v9)
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Invalidating search session: %@", (uint8_t *)&v15, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    if ((-[SearchViewController isLoading](v4, "isLoading") & 1) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject view](v8, "view")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview")),
          v11,
          v10,
          !v11))
    {
      v12 = sub_10043222C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "If we are showing the SearchAC or a search request is in process, then invalidate the current search and cancel the request: %@", (uint8_t *)&v15, 0xCu);
      }

      -[SearchViewController invalidate](v4, "invalidate");
      -[SearchViewController cancelSearch](v4, "cancelSearch");
      -[SearchViewController _hideSearchHereControl](self, "_hideSearchHereControl");
      v14 = objc_opt_class(ResultsViewController);
      if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
        -[NSObject searchDidCancel:](v8, "searchDidCancel:", 0);
    }
  }
  else if (v9)
  {
    v15 = 134217984;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%p] No search session to invalidate.", (uint8_t *)&v15, 0xCu);
  }

}

- (void)_preventAutoPresentingKeyboard_rdar_126940251
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (-[SearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SearchViewController endEditing](self, "endEditing");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    objc_msgSend(v3, "endEditing:", 1);

    self->_shouldPreventPresentingKeyboardOnRestore = 1;
    v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10061C4A4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchBarBecomeFirstResponder
{
  self->_needsToBecomeFirstResponder = 0;
  if (self->_searchBar)
    -[PassthruSearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
  else
    self->_needsToBecomeFirstResponder = 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentSearchSession](self, "currentSearchSession", a3));
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Search bar begins editing and invalidate the current active search session if there is any: %@", (uint8_t *)&v20, 0xCu);
  }

  -[SearchViewController _invalidateSearchSession:](self, "_invalidateSearchSession:", v4);
  v7 = sub_1002A8AA0(self);
  if (v7 != 5)
  {
    if (MapsFeature_IsEnabled_SearchAndDiscovery(v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "willMoveToParentViewController:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        objc_msgSend(v10, "removeFromSuperview");

        objc_msgSend(v9, "removeFromParentViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
        objc_msgSend(v11, "setHidden:", 1);

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self->_searchItem, "searchString"));
        objc_msgSend(v12, "captureUserAction:onTarget:queryString:", 2001, 101, v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
        -[SearchViewController restoreSearchItem:](self, "restoreSearchItem:", v14);

        -[SearchViewController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v15, "clearSearchPins");

      }
    }
    v16 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1;
    v17 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1;
    -[PassthruSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", v16, 1);
    -[UIButton setHidden:](self->_userProfileButton, "setHidden:", v17);
    -[SearchViewController _updateUserProfileEntryPointButton](self, "_updateUserProfileEntryPointButton");
  }
  -[SearchViewController showDropDown:](self, "showDropDown:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v18, "isUsingOfflineMaps") && !self->_supportsFullTextSearch)
  {
    v19 = -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute");

    if ((v19 & 1) == 0)
      -[SearchViewController _shouldHideOfflineHeaderView:](self, "_shouldHideOfflineHeaderView:", self->_supportsFullTextSearch);
  }
  else
  {

  }
}

- (void)triggerAutocompleteByReplacingQueryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryAcceleratorCompletionString"));
  if (objc_msgSend(v4, "length"))
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryAcceleratorCompletionString"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v6 = (void *)v5;
  -[UITextField setText:](self->_searchField, "setText:", v5);

  -[SearchViewController _textFieldDidChange:tappedQuerySuggestionCompletion:](self, "_textFieldDidChange:tappedQuerySuggestionCompletion:", 0, v7);
  -[SearchViewController searchBarBecomeFirstResponder](self, "searchBarBecomeFirstResponder");

}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueMapItem"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
LABEL_5:
    v6 = (void *)v5;

    -[PassthruSearchBar setText:](self->_searchBar, "setText:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueSearchCategory"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayString"));
    goto LABEL_5;
  }
LABEL_6:
  -[HomeViewController presentVenueWithVenueCardItem:](self->_homeViewController, "presentVenueWithVenueCardItem:", v7);

}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  -[HomeViewController handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:](self->_homeViewController, "handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:", a3, a4, a5);
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
  HomeViewController *homeViewController;

  homeViewController = self->_homeViewController;
  if (homeViewController)
    -[HomeViewController venueDidReceiveEVChargersUpdate:](homeViewController, "venueDidReceiveEVChargersUpdate:", a3);
}

- (void)showCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10061C9BC;
  v6[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SearchViewController _popToHomeWithCompletion:](self, "_popToHomeWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)editCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10061CAD8;
  v6[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SearchViewController _popToHomeWithCompletion:](self, "_popToHomeWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3
{
  return -[HomeViewController sourceViewForProfileTipPopoverWithViewController:](self->_homeViewController, "sourceViewForProfileTipPopoverWithViewController:", a3);
}

- (void)clearSelectionWithReason:(id)a3
{
  -[HomeViewController clearSelectionWithReason:](self->_homeViewController, "clearSelectionWithReason:", a3);
}

- (void)keyboardProxyViewCreated:(id)a3
{
  -[HomeViewController keyboardProxyViewCreated:](self->_homeViewController, "keyboardProxyViewCreated:", a3);
}

- (void)_popToHomeWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  unsigned int v7;
  dispatch_time_t v8;
  _QWORD block[4];
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController menuController](self, "menuController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "macMenuPresentationController"));
  v7 = objc_msgSend(v6, "isPresented");

  if (v7)
  {
    -[SearchViewController endEditing](self, "endEditing");
    v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10061CC40;
    block[3] = &unk_1011ADA00;
    v10 = v4;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)sendSearchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SearchFieldItem *searchItem;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_stringByTrimmingLeadingWhitespace"));
  -[SearchFieldItem setSearchString:](self->_searchItem, "setSearchString:", v4);

  -[SearchFieldItem setUserTypedStringForRAP:](self->_searchItem, "setUserTypedStringForRAP:", self->_userTypedSearchString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RetainedQueryController restoredRetainedSearchQueryMetadata](self->_retainedQueryController, "restoredRetainedSearchQueryMetadata"));
  -[SearchFieldItem setRetainedSearchMetadata:](self->_searchItem, "setRetainedSearchMetadata:", v5);

  -[RetainedQueryController setRestoredRetainedSearchQueryMetadata:](self->_retainedQueryController, "setRestoredRetainedSearchQueryMetadata:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self->_searchItem, "searchString"));
  objc_msgSend(v6, "captureUserAction:onTarget:queryString:", 2014, v7, v8);

  -[SearchViewController retainSearchQuery](self, "retainSearchQuery");
  -[SearchViewController setNeedsUpdateContentState](self, "setNeedsUpdateContentState");
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", &off_1012747A0));
  if (!self->_hasEdited)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10126E3C8, CFSTR("GEOMapServiceTraits_Source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute")));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("SearchAlongRoute"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  searchItem = self->_searchItem;
  v12 = objc_msgSend(v13, "copy");
  objc_msgSend(v10, "viewController:doSearchItem:withUserInfo:", self, searchItem, v12);

  -[SearchViewController endEditing](self, "endEditing");
  -[SearchDataSource clearAutocompleteResults](self->_searchDataSource, "clearAutocompleteResults");

}

- (id)lastViewportChangeDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastMapViewportChangedDate"));

  return v5;
}

- (void)sendACRequestWithTappedQuerySuggestionCompletion:(id)a3 retainQueryMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t IsEnabled_HikingiOS;
  uint64_t v17;
  uint64_t v18;
  SearchDataSource *searchDataSource;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _DWORD v25[2];

  v6 = a3;
  v7 = a4;
  -[SearchViewController updateDataSource](self, "updateDataSource");
  -[SearchViewController setNeedsUpdateContentState](self, "setNeedsUpdateContentState");
  if (self->_currentDataSource == &self->_searchDataSource->super)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v9 = objc_msgSend(v8, "newTraits");

    objc_msgSend(v9, "setNavigating:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"));
    objc_msgSend(v9, "setSupportDirectionIntentAutocomplete:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    objc_msgSend(v9, "setSupportUnresolvedDirectionIntent:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    objc_msgSend(v9, "setSupportAutocompletePublisherResults:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    objc_msgSend(v9, "setSupportAutocompleteGuideResults:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    objc_msgSend(v9, "addSupportedAutocompleteListType:", 2);
    objc_msgSend(v9, "setSupportClientRankingFeatureMetadata:", 1);
    objc_msgSend(v9, "setSupportClientRankingCompositeFeatures:", 1);
    objc_msgSend(v9, "setSupportChildItems:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    objc_msgSend(v9, "useOnlineToOfflineFailoverRequestModeIfAllowed");
    if (!-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
      -[SearchViewController addSupportedChildActionToTraits:](self, "addSupportedChildActionToTraits:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController lastViewportChangeDate](self, "lastViewportChangeDate"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    LODWORD(v13) = vcvtad_u64_f64(v12);
    objc_msgSend(v9, "setTimeSinceMapViewportChanged:", v13);

    v14 = sub_100432B5C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 67109120;
      v25[1] = objc_msgSend(v9, "timeSinceMapViewportChanged");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending AC Request with timeSinceMapViewportChanged: %d", (uint8_t *)v25, 8u);
    }

    objc_msgSend(v9, "setAutocompleteRequestSupportsSectionHeader:", 1);
    objc_msgSend(v9, "addSupportedAutocompleteResultCellType:", 0);
    objc_msgSend(v9, "addSupportedAutocompleteResultCellType:", 3);
    if (!-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
    {
      objc_msgSend(v9, "addSupportedAutocompleteResultCellType:", 1);
      objc_msgSend(v9, "addSupportedAutocompleteResultCellType:", 2);
    }
    IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
    if ((IsEnabled_HikingiOS & 1) != 0)
    {
      v17 = 35;
    }
    else if (MapsFeature_IsEnabled_SearchAndDiscovery(IsEnabled_HikingiOS))
    {
      v17 = 31;
    }
    else
    {
      v17 = 28;
    }
    objc_msgSend(v9, "setPlaceSummaryRevision:", v17);
    -[SearchViewController isTouristHereValue](self, "isTouristHereValue");
    objc_msgSend(v9, "setIsTourist:");
    objc_msgSend(v9, "addKnownRefinementType:", 1);
    objc_msgSend(v9, "addSupportedPlaceSummaryFormatType:", 1);
    objc_msgSend(v9, "addSupportedPlaceSummaryFormatType:", 2);
    objc_msgSend(v9, "addSupportedPlaceSummaryFormatType:", 3);
    objc_msgSend(v9, "setSupportStructuredRapAffordance:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute") ^ 1);
    -[SearchDataSource setRetainedSearchMetadata:](self->_searchDataSource, "setRetainedSearchMetadata:", v7);
    if (-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
      v18 = 14;
    else
      v18 = 11;
    searchDataSource = self->_searchDataSource;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_stringByTrimmingLeadingWhitespace"));
    -[SearchDataSource setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:](searchDataSource, "setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:", v21, v6, v7 != 0, v9, v18);

    if (MapsFeature_IsEnabled_MapsWally(v22)
      && (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) == 0)
    {
      v23 = sub_10043222C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Will not show SearchHome tip again.", (uint8_t *)v25, 2u);
      }

      -[SearchHomeDataSource setShouldRemoveSearchHomeTip:](self->_searchHomeDataSource, "setShouldRemoveSearchHomeTip:", 1);
    }

  }
}

- (void)addSupportedChildActionToTraits:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id IsEnabled_Maps269;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "addSupportedChildAction:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v5 = objc_msgSend(v4, "supports3DImagery");

  if (v5)
    objc_msgSend(v13, "addSupportedChildAction:", 2);
  objc_msgSend(v13, "addSupportedChildAction:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v7 = objc_msgSend(v6, "isMuninEnabled");

  if (v7)
    objc_msgSend(v13, "addSupportedChildAction:", 4);
  if (+[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls"))objc_msgSend(v13, "addSupportedChildAction:", 5);
  v8 = objc_msgSend(v13, "addSupportedChildAction:", 6);
  IsEnabled_Maps269 = (id)MapsFeature_IsEnabled_Maps269(v8, v9, v10);
  if ((_DWORD)IsEnabled_Maps269)
  {
    IsEnabled_Maps269 = (id)sub_1002A8AA0(self);
    if (IsEnabled_Maps269 != (id)5)
      IsEnabled_Maps269 = objc_msgSend(v13, "addSupportedChildAction:", 7);
  }
  if (GEOSupportsOfflineMaps(IsEnabled_Maps269, v12))
    objc_msgSend(v13, "addSupportedChildAction:", 8);

}

- (void)initializeCachedTelephonyValue
{
  +[TUCallCapabilities initializeCachedValues](TUCallCapabilities, "initializeCachedValues");
}

- (void)updateIsTouristHereValue
{
  NSObject *mapsSuggestionsLoadingSearchQueue;
  _QWORD block[5];

  mapsSuggestionsLoadingSearchQueue = self->_mapsSuggestionsLoadingSearchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10061D3EC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(mapsSuggestionsLoadingSearchQueue, block);
}

- (void)resetMapServiceTicket
{
  MKMapServiceTicket *mapServiceTicket;

  -[MKMapServiceTicket cancel](self->_mapServiceTicket, "cancel");
  mapServiceTicket = self->_mapServiceTicket;
  self->_mapServiceTicket = 0;

}

- (BOOL)shouldRetainSearchQuery
{
  return -[RetainedQueryController shouldRetainSearchQuery](self->_retainedQueryController, "shouldRetainSearchQuery");
}

- (void)clearRetainedSearchQuery
{
  -[RetainedQueryController clearRetainedSearchQuery](self->_retainedQueryController, "clearRetainedSearchQuery");
}

- (id)defaultSearchQueryToRetain
{
  NSString *userTypedSearchString;

  userTypedSearchString = -[NSString length](self->_userTypedSearchString, "length");
  if (userTypedSearchString)
    userTypedSearchString = self->_userTypedSearchString;
  return userTypedSearchString;
}

- (void)retainSpotlightQuery:(id)a3 metadata:(id)a4
{
  -[RetainedQueryController retainSearchQuery:metadata:forTimeInterval:](self->_retainedQueryController, "retainSearchQuery:metadata:forTimeInterval:", a3, a4, 86400.0);
}

- (void)retainSearchQuery
{
  RetainedQueryController *retainedQueryController;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController defaultSearchQueryToRetain](self, "defaultSearchQueryToRetain"));
  if (v5)
  {
    retainedQueryController = self->_retainedQueryController;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
    objc_msgSend(v4, "retainSearchTime");
    -[RetainedQueryController retainSearchQuery:metadata:forTimeInterval:](retainedQueryController, "retainSearchQuery:metadata:forTimeInterval:", v5, 0);

  }
}

- (void)retainSearchQueryForSelectedAutocompleteItem:(id)a3 forTimeInterval:(double)a4
{
  RetainedQueryController *retainedQueryController;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  retainedQueryController = self->_retainedQueryController;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController defaultSearchQueryToRetain](self, "defaultSearchQueryToRetain"));
  if (a4 == 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
    objc_msgSend(v8, "retainSearchTime");
    -[RetainedQueryController retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:](retainedQueryController, "retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:", v9, v7);

  }
  else
  {
    -[RetainedQueryController retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:](retainedQueryController, "retainSearchQueryForSelectedAutocompleteItem:query:forTimeInterval:", v9, v7, 1.0);
  }

}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3
{
  RetainedQueryController *retainedQueryController;
  id v5;
  void *v6;
  id v7;

  retainedQueryController = self->_retainedQueryController;
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController defaultSearchQueryToRetain](self, "defaultSearchQueryToRetain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
  objc_msgSend(v6, "retainSearchTime");
  -[RetainedQueryController retainSearchQueryForSelectedSearchResult:query:forTimeInterval:](retainedQueryController, "retainSearchQueryForSelectedSearchResult:query:forTimeInterval:", v5, v7);

}

- (void)_restoreRetainedQueryIfNeeded
{
  void *v3;
  RetainedQueryController *retainedQueryController;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentSearchSession](self, "currentSearchSession"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    retainedQueryController = self->_retainedQueryController;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10061D75C;
    v5[3] = &unk_1011BE328;
    objc_copyWeak(&v6, &location);
    -[RetainedQueryController restoreIfNeededWithBlock:](retainedQueryController, "restoreIfNeededWithBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)restoreSearchItem:(id)a3
{
  id v4;
  NSString *userTypedSearchString;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  if (v4)
  {
    self->_hasEdited = 1;
    userTypedSearchString = self->_userTypedSearchString;
    self->_userTypedSearchString = 0;

    -[UITextField setTextSelectionBehavior:](self->_searchField, "setTextSelectionBehavior:", 0);
    -[SearchDataSource reset](self->_searchDataSource, "reset");
    -[SearchViewController updateSearchFieldWithItem:](self, "updateSearchFieldWithItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "wantsLayout:", 3);

    if (!self->_shouldPreventPresentingKeyboardOnRestore)
      -[UITextField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "retainedSearchMetadata"));
    -[SearchViewController sendACRequestWithTappedQuerySuggestionCompletion:retainQueryMetadata:](self, "sendACRequestWithTappedQuerySuggestionCompletion:retainQueryMetadata:", 0, v7);

  }
  else
  {
    v8 = sub_10043222C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[SearchVC] Nothing to restore for searchItem.", v10, 2u);
    }

  }
}

- (int64_t)floatingControlsOptions
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v3 = objc_msgSend(v2, "containerStyle");

  if (v3 == (id)6)
    return 255;
  else
    return 251;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SearchViewController;
  -[ContaineeViewController willChangeLayout:](&v14, "willChangeLayout:");
  if ((-[UITextField isFirstResponder](self->_searchField, "isFirstResponder") & 1) == 0)
    -[PassthruSearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 0, 1);
  if (a3 - 1 <= 1)
  {
    if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController")),
          v5,
          v5))
    {
      v6 = sub_10043222C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not dismissing search results while changing the layout as we are presenting results.", v13, 2u);
      }

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
      v9 = objc_opt_class(SearchDataSource);
      isKindOfClass = objc_opt_isKindOfClass(v8, v9);

      if ((isKindOfClass & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController presentedViewController](self, "presentedViewController"));

        if (!v11)
          -[SearchViewController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
        objc_msgSend(v12, "clearMKLocalSearchCompleterQueryState");

      }
      -[PassthruSearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
      -[SearchViewController cleanSearch](self, "cleanSearch");
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  double Height;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double result;
  CGRect v26;

  if (a3 - 3 < 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v13, "availableHeight");
  }
  else
  {
    if (a3 != 2)
    {
      v4 = -1.0;
      if (a3 == 1)
      {
        if (!-[LocalSearchViewController shouldBeVisible](self->_localSearchViewController, "shouldBeVisible"))
          goto LABEL_18;
        -[UIView frame](self->_hideableFooterView, "frame");
        Height = CGRectGetHeight(v26);
        v6 = self->_hideableFooterView;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](v6, "window"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](v6, "window"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
          objc_msgSend(v10, "nativeScale");
          v12 = v11;

        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
          objc_msgSend(v9, "nativeScale");
          v12 = v17;
        }

        v18 = v12 <= 0.0 ? 1.0 : 1.0 / v12;
        v19 = Height - v18;
        if (v19 == 0.0)
        {
LABEL_18:
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
          objc_msgSend(v20, "bottomSafeOffset");
          v19 = v21;

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
        if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar") && v22)
        {
          objc_msgSend(v22, "heightForLayout:", 1);
          v4 = v19 + v23 + 50.0;
        }
        else
        {
          -[ContaineeViewController headerHeight](self, "headerHeight");
          v4 = v19 + v24;
        }

      }
      return v4;
    }
    if (!-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar")
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController")),
          v15,
          !v15))
    {
      -[SearchViewController heightForContaineeLayoutMedium](self, "heightForContaineeLayoutMedium");
      return result;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v13, "bounds");
    v14 = UIRoundToScreenScale(v13, v16 * 0.449999988);
  }
  v4 = v14;

  return v4;
}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchViewController;
  -[ContaineeViewController didChangeLayout:](&v7, "didChangeLayout:");
  if (-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "didChangeLayout:", a3);

  }
  -[SearchViewController updateRefreshFooter](self, "updateRefreshFooter");
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));

  if (v5)
  {
    -[SearchViewController _invalidateMediumHeightCache](self, "_invalidateMediumHeightCache");
    -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", a3 != 6);
    -[SearchViewController _updateDefaultLayoutWithContainerStyle:](self, "_updateDefaultLayoutWithContainerStyle:", a3);
  }
}

- (void)_updateDefaultLayoutWithContainerStyle:(unint64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 == 6)
    v3 = 3;
  else
    v3 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setDefaultContaineeLayout:", v3);

}

- (void)applyAlphaToContent:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0, a3);
}

- (double)heightForContaineeLayoutMedium
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  result = self->_cachedMediumHeight;
  if (result == 0.0)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v5 = v4;
    sub_1005EC2E4();
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v9 = objc_msgSend(v8, "containerStyle");

    if (v9 == (id)6)
    {
      if (self->_currentDataSource)
      {
        if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
        {
          v10 = UITableViewAutomaticDimension;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
          +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight");
          objc_msgSend(v12, "_mapkit_scaledValueForValue:");
          v10 = v13;

        }
        v7 = v10 * 3.0 + -1.0;
      }
      else
      {
        -[HomeViewController mediumContentHeight](self->_homeViewController, "mediumContentHeight");
        v7 = v11;
      }
    }
    else if (v5 + v7 > v7)
    {
      v7 = v7 - v5;
    }
    result = v5 + v7;
    self->_cachedMediumHeight = v5 + v7;
  }
  return result;
}

- (void)_invalidateMediumHeightCache
{
  self->_cachedMediumHeight = 0.0;
}

- (void)updateRefreshFooter
{
  -[SearchViewController updateRefreshFooterAnimated:](self, "updateRefreshFooterAnimated:", 1);
}

- (void)updateRefreshFooterAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  BOOL v8;
  void *v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = (unint64_t)objc_msgSend(v5, "containerStyle");

  v7 = (v6 < 6) & (0x3Au >> v6);
  if (-[LocalSearchViewController showInCardFooterWhenCardHasExpandedLayout](self->_localSearchViewController, "showInCardFooterWhenCardHasExpandedLayout"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v8 = objc_msgSend(v9, "containeeLayout") != (id)1;

  }
  if (self->_refreshFooterEnabled != v7 && !v8)
  {
    self->_refreshFooterEnabled = v7;
    -[SearchViewController addRefreshFooter:animated:](self, "addRefreshFooter:animated:", v7, v3);
  }
}

- (void)addRefreshFooter:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _QWORD v30[5];
  BOOL v31;
  _QWORD v32[5];
  BOOL v33;
  _QWORD v34[4];

  if (a3)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
    if (!v9)
    {
      v29 = v6;
      -[SearchViewController addChildViewController:](self, "addChildViewController:", self->_localSearchViewController);
      -[UIView insertSubview:atIndex:](self->_hideableFooterView, "insertSubview:atIndex:", v8, 0);
      -[LocalSearchViewController didMoveToParentViewController:](self->_localSearchViewController, "didMoveToParentViewController:", self);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_hideableFooterView, "leadingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
      v34[0] = v26;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_hideableFooterView, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
      v34[1] = v23;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_hideableFooterView, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v12));
      v34[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_hideableFooterView, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
      v34[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      v6 = v29;
    }
    -[UIView layoutIfNeeded](self->_hideableFooterView, "layoutIfNeeded");
    -[UIView frame](self->_hideableFooterView, "frame");
    v19 = v18;
    if (!self->_showRefreshFooter
      || !-[LocalSearchViewController shouldBeVisible](self->_localSearchViewController, "shouldBeVisible"))
    {
      -[NSLayoutConstraint setConstant:](self->_bottomHideableFooterConstraint, "setConstant:", v19);
    }
    -[NSLayoutConstraint constant](self->_bottomHideableFooterConstraint, "constant");
    v21 = v20;

    if (v6 && v21 != 0.0)
      goto LABEL_12;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self->_localSearchViewController, "view", a3, a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

    if (v11)
    {
LABEL_12:
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10061E488;
      v32[3] = &unk_1011ACE58;
      v33 = a3;
      v32[4] = self;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10061E514;
      v30[3] = &unk_1011AF4D8;
      v31 = a3;
      v30[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v32, v30, 0.25);
      return;
    }
  }
  self->_showRefreshFooter = a3;
}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
  if (v5)
  {
    -[NSLayoutConstraint constant](self->_bottomHideableFooterConstraint, "constant");
    v7 = v6 == 0.0;
  }
  else
  {
    v7 = 0;
  }

  v8 = objc_msgSend(v4, "shouldBeVisible");
  if (v7 != (_DWORD)v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

    if (v9)
      -[SearchViewController updateConstraintsForHideableFooterForWasVisible:isVisible:](self, "updateConstraintsForHideableFooterForWasVisible:isVisible:", v7, v8);
    else
      -[SearchViewController updateRefreshFooterAnimated:](self, "updateRefreshFooterAnimated:", 1);
  }

}

- (void)localSearchViewControllerSizeDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

  if (v4)
  {
    -[NSLayoutConstraint constant](self->_bottomHideableFooterConstraint, "constant");
    if (v5 == 0.0)
    {
      -[SearchViewController updateConstraintsForHideableFooterForWasVisible:isVisible:](self, "updateConstraintsForHideableFooterForWasVisible:isVisible:", 1, 1);
    }
    else
    {
      -[UIView layoutIfNeeded](self->_hideableFooterView, "layoutIfNeeded");
      -[UIView frame](self->_hideableFooterView, "frame");
      -[NSLayoutConstraint setConstant:](self->_bottomHideableFooterConstraint, "setConstant:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v7, "updateHeightForCurrentLayout");

    }
  }

}

- (void)updateConstraintsForHideableFooterForWasVisible:(BOOL)a3 isVisible:(BOOL)a4
{
  void *v7;
  CGFloat Height;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;
  _QWORD v12[6];
  BOOL v13;
  BOOL v14;
  CGRect v15;

  if (a4 && !a3)
    -[UIView layoutIfNeeded](self->_hideableFooterView, "layoutIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  Height = CGRectGetHeight(v15);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10061E820;
  v12[3] = &unk_1011BE350;
  v13 = a3;
  v14 = a4;
  v12[4] = self;
  *(CGFloat *)&v12[5] = Height;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10061E918;
  v9[3] = &unk_1011BE378;
  v10 = a3;
  v11 = a4;
  v9[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v9, 0.25);
}

- (VKVenueFeatureMarker)venueWithFocus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venuesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueWithFocus"));

  return (VKVenueFeatureMarker *)v4;
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v3, "presentPlaceCardForVenueWithFocusAndAddToHistory:source:centeringOnVenue:", 1, 7, 0);

}

- (BOOL)shouldInjectVenueSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    if (objc_msgSend(v5, "_venueFeatureType"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSearchSession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentResultsSearchInfo"));
      v9 = objc_msgSend(v8, "shouldInjectSearchResults") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)localSearchViewController
{
  LocalSearchViewController *localSearchViewController;
  LocalSearchViewController *v4;
  LocalSearchViewController *v5;
  void *v6;
  void *v7;
  void *v8;

  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    v4 = -[LocalSearchViewController initAsButton:]([LocalSearchViewController alloc], "initAsButton:", 0);
    v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self->_localSearchViewController, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "bottomSafeOffset");
    -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", objc_msgSend(v8, "containerStyle") != (id)6);

    -[LocalSearchViewController setDelegate:](self->_localSearchViewController, "setDelegate:", self);
    localSearchViewController = self->_localSearchViewController;
  }
  return localSearchViewController;
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  uint64_t Integer;
  double Double;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v5 = objc_msgSend(v4, "isUsingOfflineMaps");

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", self->_mapViewRegion.center.latitude, self->_mapViewRegion.center.longitude);
    v7 = objc_alloc((Class)CLLocation);
    objc_msgSend(v21, "region");
    v9 = v8;
    objc_msgSend(v21, "region");
    v10 = objc_msgSend(v7, "initWithLatitude:longitude:", v9);
    objc_msgSend(v6, "distanceFromLocation:", v10);
    v12 = v11;
    Integer = GEOConfigGetInteger(MapsConfig_ViewPortPanDistance, off_1014B4F18);
    Double = GEOConfigGetDouble(MapsConfig_ViewPortZoomLevel, off_1014B4F28);
    if (v12 > (double)Integer || (objc_msgSend(v21, "_zoomLevel"), vabdd_f64(v15, self->_zoomLevel) > Double))
    {
      objc_msgSend(v21, "region");
      self->_mapViewRegion.center.latitude = v16;
      self->_mapViewRegion.center.longitude = v17;
      self->_mapViewRegion.span.latitudeDelta = v18;
      self->_mapViewRegion.span.longitudeDelta = v19;
      objc_msgSend(v21, "_zoomLevel");
      self->_zoomLevel = v20;
      -[SearchViewController _initOfflinePlaceHolderWithCompletion:](self, "_initOfflinePlaceHolderWithCompletion:", 0);
    }

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_tappedTrackingButton)
  {
    self->_tappedTrackingButton = 0;
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refreshSearchHereBusinessController"));
    v8 = objc_msgSend(v7, "didStopRespondingToGesture:", v5);

    -[SearchViewController showSearchingHereIfNeeded:](self, "showSearchingHereIfNeeded:", v8);
  }
}

- (void)showSearchingHereIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int64_t v36;
  __int16 v37;
  void *v38;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSearchSession"));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchInfo"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v6, "isLoading");

    if (!v9)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject view](v11, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));

      if (!v16)
      {
        -[SearchViewController _invalidateSearchSession:](self, "_invalidateSearchSession:", v6);
        v25 = sub_100432AEC();
        v13 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v35 = 134218242;
          v36 = -[SearchViewController currentDataSourceType](self, "currentDataSourceType");
          v37 = 2112;
          v38 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[SearchVC] Not showing search here overlay. Autocomplete is active: %ld, Search session : %@", (uint8_t *)&v35, 0x16u);
        }
        goto LABEL_6;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containerViewController"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeViewController"));

      if (v3)
      {
        v19 = sub_100432AEC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentSearchSession"));
          v35 = 138412290;
          v36 = (int64_t)v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[SearchVC] Trigerred auto-redo search: %@", (uint8_t *)&v35, 0xCu);

        }
        -[NSObject setNeedsUpdateComponent:animated:](v13, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject redoSearchOverlay](v13, "redoSearchOverlay"));
        objc_msgSend(v23, "updateSearchOverlayWithState:", 0);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject redoSearchOverlay](v13, "redoSearchOverlay"));
        objc_msgSend(v24, "shouldHideFloatingControl:animated:", 0, 1);

        self->_didTriggerAutoRedoSearch = 1;
        -[SearchViewController refreshCurrentSearch](self, "refreshCurrentSearch");
        goto LABEL_6;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "refreshSearchHereBusinessController"));
      v28 = objc_msgSend(v27, "shouldShowManualRedoButton");

      if (!MapsFeature_IsEnabled_SearchAndDiscovery(v29) || !v28)
      {
LABEL_6:

        goto LABEL_7;
      }
      v30 = sub_100432AEC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentSearchSession"));
        v35 = 138412290;
        v36 = (int64_t)v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[SearchVC] Showing search here button as we did not trigger Auto-Redo: %@", (uint8_t *)&v35, 0xCu);

      }
      -[NSObject setNeedsUpdateComponent:animated:](v13, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject redoSearchOverlay](v13, "redoSearchOverlay"));
      objc_msgSend(v34, "updateSearchOverlayWithState:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", 460, 503, 0);
LABEL_5:

      goto LABEL_6;
    }
  }
  v10 = sub_100432AEC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = NSStringFromBOOL(objc_msgSend(v6, "isLoading"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchInfo"));
    v35 = 138412546;
    v36 = (int64_t)v13;
    v37 = 2112;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[SearchVC] Not showing search here overlay. Search session loading:(%@) or doesn't have searchInfo: %@", (uint8_t *)&v35, 0x16u);
    goto LABEL_5;
  }
LABEL_7:

}

- (void)didUpdateSearchResults
{
  if (self->_didTriggerAutoRedoSearch)
    self->_didTriggerAutoRedoSearch = 0;
}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](self->_localSearchViewController, "browseVenueBusinessController", a3));
  objc_msgSend(v5, "handleMapTypeDidChange:", a4);

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v7 = a3;
  v8 = sub_100432AEC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSearchSession"));
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[SearchVC] willStartRespondingToGesture:%@, searchSession:%@", (uint8_t *)&v14, 0x16u);

  }
  if (!a4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "refreshSearchHereBusinessController"));
    objc_msgSend(v13, "didStartRespondingToGesture:", v7);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  v10 = a3;
  v11 = sub_100432AEC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentSearchSession"));
    v18 = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[SearchVC] didStopRespondingToGesture:%@, searchSession:%@", (uint8_t *)&v18, 0x16u);

  }
  if (!a4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "refreshSearchHereBusinessController"));
    v17 = objc_msgSend(v16, "didStopRespondingToGesture:", v10);

    -[SearchViewController showSearchingHereIfNeeded:](self, "showSearchingHereIfNeeded:", v17);
  }

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v6 = a6;
  v8 = a3;
  if (v6)
  {
    v9 = sub_100432AEC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSearchSession"));
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[SearchVC] didChangeUserTrackingMode:%@, searchSession:%@", (uint8_t *)&v15, 0x16u);

    }
    self->_tappedTrackingButton = 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refreshSearchHereBusinessController"));
    objc_msgSend(v14, "didStartRespondingToGesture:", v8);

  }
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  LocalSearchViewController *localSearchViewController;
  id v6;
  id v7;

  localSearchViewController = self->_localSearchViewController;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController browseVenueBusinessController](localSearchViewController, "browseVenueBusinessController"));
  objc_msgSend(v7, "handleVenueWithFocusDidChange:", v6);

}

- (int)listForDataSource:(id)a3
{
  SearchDataSource *currentDataSource;

  currentDataSource = (SearchDataSource *)self->_currentDataSource;
  if (currentDataSource == (SearchDataSource *)self->_searchHomeDataSource)
    return 1;
  else
    return 4 * (currentDataSource == self->_searchDataSource);
}

- (void)dataSourceUpdated:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  UITableView *v9;
  void *v10;
  UITableView *contentTableView;
  int v12;
  id v13;
  __int16 v14;
  UITableView *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));

  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      contentTableView = self->_contentTableView;
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = contentTableView;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SVC dataSource %@ reloading %@", (uint8_t *)&v12, 0x16u);
    }

    -[SearchViewController reloadContentTableView](self, "reloadContentTableView");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_contentTableView;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](v9, "dataSource"));
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "SVC dataSource %@ not current delegate of %@. Current DataSource: %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  -[SearchViewController dataSource:itemTapped:childItemParent:](self, "dataSource:itemTapped:childItemParent:", a3, a4, 0);
}

- (void)dataSource:(id)a3 itemTapped:(id)a4 childItemParent:(id)a5
{
  DirectionItem *v7;
  id v8;
  NSObject *v9;
  DirectionItem *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  id v17;
  DirectionItem *v18;
  void *v19;
  id v20;
  SearchFieldItem *v21;
  void *v22;
  DirectionItem *v23;
  DirectionItem *v24;
  id *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  DirectionItem *v30;
  void *i;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  DirectionItem *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  DirectionItem *v51;
  void *v52;
  uint64_t v53;
  NSNumber *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  DirectionItem *v59;
  void *v60;
  uint64_t v61;
  NSNumber *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  DirectionItem *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  SearchViewController *v80;
  void *v81;
  uint64_t v82;
  DirectionItem *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  DirectionItem *v89;
  __objc2_prot *v90;
  uint64_t v91;
  DirectionItem *v92;
  DirectionItem *v93;
  DirectionItem *v94;
  void *v95;
  unsigned int v96;
  DirectionItem *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  DirectionItem *v101;
  __objc2_prot *v102;
  uint64_t v103;
  DirectionItem *v104;
  DirectionItem *v105;
  DirectionItem *v106;
  void *v107;
  unsigned int v108;
  DirectionItem *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  char v115;
  void *v116;
  DirectionItem *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  BOOL v123;
  void *v124;
  void *v125;
  DirectionItem *v126;
  __objc2_prot *v127;
  uint64_t v128;
  DirectionItem *v129;
  DirectionItem *v130;
  DirectionItem *v131;
  void *v132;
  unsigned int v133;
  DirectionItem *v134;
  id v135;
  uint64_t v136;
  void *v137;
  DirectionItem *v138;
  __objc2_prot *v139;
  uint64_t v140;
  DirectionItem *v141;
  DirectionItem *v142;
  DirectionItem *v143;
  void *v144;
  unsigned int v145;
  DirectionItem *v146;
  void *v147;
  void *v148;
  void *v149;
  DirectionItem *v150;
  __objc2_prot *v151;
  uint64_t v152;
  DirectionItem *v153;
  DirectionItem *v154;
  DirectionItem *v155;
  void *v156;
  unsigned int v157;
  DirectionItem *v158;
  IncompleteTransitLineItem *v159;
  void *v160;
  DirectionItem *v161;
  __objc2_prot *v162;
  uint64_t v163;
  DirectionItem *v164;
  DirectionItem *v165;
  id v166;
  void *v167;
  unsigned int v168;
  DirectionItem *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  DirectionItem *v181;
  id v182;
  void *v183;
  void *v184;
  BOOL v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  SearchResult *v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  BOOL v199;
  void *v200;
  VenueCategoryItem *v201;
  void *v202;
  VenueCategoryItem *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  DirectionItem *v207;
  void *v208;
  SearchHomeDataSource *currentDataSource;
  _UNKNOWN **v210;
  DirectionItem *v211;
  __objc2_prot *v212;
  uint64_t v213;
  DirectionItem *v214;
  DirectionItem *v215;
  DirectionItem *v216;
  void *v217;
  unsigned int v218;
  DirectionItem *v219;
  char v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  BOOL v228;
  void *v229;
  void *v230;
  void *v231;
  unsigned int v232;
  void *v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  DirectionItem *v237;
  DirectionItem *v238;
  DirectionItem *v239;
  DirectionItem *v240;
  id obj;
  id v243;
  uint64_t v244;
  id v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  DirectionItem *v253;
  _QWORD v254[4];
  id v255;
  _QWORD v256[5];
  id v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  _QWORD v262[4];
  id v263;
  _QWORD v264[4];
  id v265;
  _QWORD v266[4];
  id v267;
  id location;
  SearchResult *v269;
  DirectionItem *v270;
  _QWORD v271[2];
  _QWORD v272[2];
  const __CFString *v273;
  void *v274;
  uint8_t v275[128];
  uint8_t buf[4];
  DirectionItem *v277;
  __int16 v278;
  DirectionItem *v279;
  __int16 v280;
  DirectionItem *v281;

  v239 = (DirectionItem *)a3;
  v7 = (DirectionItem *)a4;
  v240 = (DirectionItem *)a5;
  v8 = sub_100432EDC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v277 = v239;
    v278 = 2112;
    v279 = v7;
    v280 = 2112;
    v281 = v240;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "dataSource: %@ itemTapped: %@ childItemParent: %@", buf, 0x20u);
  }

  -[SearchViewController resetMapServiceTicket](self, "resetMapServiceTicket");
  if (v240)
    v10 = v240;
  else
    v10 = v7;
  -[SearchViewController retainSearchQueryForSelectedAutocompleteItem:forTimeInterval:](self, "retainSearchQueryForSelectedAutocompleteItem:forTimeInterval:", v10, 0.0);
  if (sub_1002A8AA0(self) == 5)
  {
    v11 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v7, "historyEntry"));
      v13 = objc_opt_class(MSHistorySearchItem);
      isKindOfClass = objc_opt_isKindOfClass(v12, v13);

      if ((isKindOfClass & 1) != 0)
        -[HomeViewController scrollContentToOriginalPosition](self->_homeViewController, "scrollContentToOriginalPosition");
    }
  }
  v15 = objc_opt_class(MKSearchCompletion);
  if ((objc_opt_isKindOfClass(v7, v15) & 1) == 0 || -[DirectionItem entryTapBehavior](v7, "entryTapBehavior") != (id)1)
  {
    v16 = objc_opt_class(GEOMapItemChildItem);
    if ((objc_opt_isKindOfClass(v7, v16) & 1) != 0)
    {
      v7 = v7;
      v17 = -[DirectionItem childItemType](v7, "childItemType");
      if (v17 == (id)3)
      {
        v18 = v240;

      }
      else
      {
        if (v17 == (id)2)
        {
          objc_initWeak(&location, self);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem childItemAction](v7, "childItemAction"));
          v20 = objc_msgSend(v19, "childActionType");

          v18 = v7;
          switch((unint64_t)v20)
          {
            case 1uLL:
              v21 = objc_alloc_init(SearchFieldItem);
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
              -[SearchFieldItem setSearchResult:](v21, "setSearchResult:", v22);

              v23 = (DirectionItem *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v240));
              v24 = (DirectionItem *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
              -[DirectionItem addObject:](v24, "addObject:", v21);
              if (v23)
              {
                -[DirectionItem addObject:](v24, "addObject:", v23);
              }
              else
              {
                v26 = sub_10043222C();
                v27 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v277 = v240;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Cannot select Directions child item with childItemParent: %@", buf, 0xCu);
                }

              }
              v18 = -[DirectionItem initWithItems:ignoreMapType:transportType:]([DirectionItem alloc], "initWithItems:ignoreMapType:transportType:", v24, 0, 0);

              goto LABEL_36;
            case 2uLL:
              v266[0] = _NSConcreteStackBlock;
              v266[1] = 3221225472;
              v266[2] = sub_1006214F0;
              v266[3] = &unk_1011BE3A0;
              v25 = &v267;
              objc_copyWeak(&v267, &location);
              -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v240, v266);
              goto LABEL_28;
            case 3uLL:
              v21 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(-[DirectionItem childItemAction](v7, "childItemAction"));
              v23 = (DirectionItem *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem childActionSearch](v21, "childActionSearch"));
              v18 = (DirectionItem *)objc_claimAutoreleasedReturnValue(-[DirectionItem relatedSearchSuggestion](v23, "relatedSearchSuggestion"));
              v24 = v7;
LABEL_36:

              goto LABEL_37;
            case 4uLL:
              v264[0] = _NSConcreteStackBlock;
              v264[1] = 3221225472;
              v264[2] = sub_100621560;
              v264[3] = &unk_1011BE3A0;
              v25 = &v265;
              objc_copyWeak(&v265, &location);
              -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v240, v264);
              goto LABEL_28;
            case 5uLL:
              -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v240, &stru_1011BE3E0);
              goto LABEL_31;
            case 6uLL:
              v262[0] = _NSConcreteStackBlock;
              v262[1] = 3221225472;
              v262[2] = sub_10062169C;
              v262[3] = &unk_1011BE3A0;
              v25 = &v263;
              objc_copyWeak(&v263, &location);
              -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v240, v262);
LABEL_28:
              objc_destroyWeak(v25);
              goto LABEL_31;
            case 7uLL:
              -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v240, 0);
              v21 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(-[DirectionItem childItemAction](v7, "childItemAction"));
              v18 = (DirectionItem *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem guideLocation](v21, "guideLocation"));
              v23 = v7;
LABEL_37:

              goto LABEL_38;
            case 8uLL:
              -[SearchViewController showRegionSelectorForMapItem:](self, "showRegionSelectorForMapItem:", v240);
LABEL_31:
              objc_destroyWeak(&location);

              goto LABEL_86;
            default:
LABEL_38:
              objc_destroyWeak(&location);
              goto LABEL_39;
          }
        }
        v18 = v7;
        if (v17 == (id)1)
        {
          v18 = (DirectionItem *)objc_claimAutoreleasedReturnValue(-[DirectionItem childItemPlace](v7, "childItemPlace"));

        }
      }
LABEL_39:

    }
    else
    {
      v18 = v7;
    }
    v28 = objc_opt_class(GEOResultRefinement);
    if ((objc_opt_isKindOfClass(v18, v28) & 1) != 0)
    {
      v238 = v240;
      v29 = objc_opt_class(MKLocalSearchCompletion);
      if ((objc_opt_isKindOfClass(v238, v29) & 1) != 0)
        v30 = v238;
      else
        v30 = 0;
      v237 = v30;

      if (!v237)
        goto LABEL_85;
      v253 = v18;
      v245 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
      objc_msgSend(v245, "setResultRefinementOriginType:", 3);
      v260 = 0u;
      v261 = 0u;
      v258 = 0u;
      v259 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[DirectionItem resultRefinements](v237, "resultRefinements"));
      v246 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v275, 16);
      if (v246)
      {
        v244 = *(_QWORD *)v259;
        do
        {
          for (i = 0; i != v246; i = (char *)i + 1)
          {
            if (*(_QWORD *)v259 != v244)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v32, "isEqual:", v253))
            {
              v243 = objc_alloc((Class)GEOResultRefinementToggle);
              v252 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "displayName"));
              v251 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v33 = objc_msgSend(v251, "isSelected");
              v250 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "metadata"));
              v249 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v34 = objc_msgSend(v249, "toggleType");
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v36 = objc_msgSend(v35, "evChargingConnectorType");
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v38 = objc_msgSend(v37, "selectionFromView");
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "refinementKey"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem toggle](v253, "toggle"));
              LOBYTE(v236) = objc_msgSend(v41, "showAsSelected");
              LOBYTE(v235) = v38;
              v42 = objc_msgSend(v243, "initWithDisplayName:isSelected:metadata:toggleType:evChargingConnectorType:selectionSequenceNumber:selectionFromView:refinementKey:showAsSelected:", v248, v33 ^ 1, v247, v34, v36, &off_10126E3E0, v235, v40, v236);

              v43 = objc_msgSend(objc_alloc((Class)GEOResultRefinement), "initWithToggle:", v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "convertToGEOPDResultRefinement"));
              objc_msgSend(v245, "addRefinement:", v44);

            }
            else
            {
              v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "convertToGEOPDResultRefinement"));
              objc_msgSend(v245, "addRefinement:", v42);
            }

          }
          v246 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v275, 16);
        }
        while (v246);
      }

      v45 = v237;
      v18 = v238;
    }
    else
    {
      v245 = 0;
    }
    v46 = objc_opt_class(GEOMapItemIdentifier);
    if ((objc_opt_isKindOfClass(v18, v46) & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      v256[0] = _NSConcreteStackBlock;
      v256[1] = 3221225472;
      v256[2] = sub_100621720;
      v256[3] = &unk_1011BE408;
      objc_copyWeak(&v257, (id *)buf);
      v256[4] = self;
      -[SearchViewController fetchMapItemWithIdentifier:completion:](self, "fetchMapItemWithIdentifier:completion:", v18, v256);
      objc_destroyWeak(&v257);
      objc_destroyWeak((id *)buf);
LABEL_84:

LABEL_85:
      v7 = v18;
      goto LABEL_86;
    }
    -[SearchViewController showDropDown:](self, "showDropDown:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    objc_msgSend(v47, "endEditing:", 1);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute")));
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, CFSTR("SearchAlongRoute"));

    v50 = objc_opt_class(MapsSuggestionsEntry);
    if ((objc_opt_isKindOfClass(v18, v50) & 1) != 0)
    {
      v51 = v18;
      objc_msgSend(v48, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("NoHistoryEntry"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
      v53 = objc_opt_class(SearchDataSource);
      v54 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_opt_isKindOfClass(v52, v53) & 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, CFSTR("MSGEntryForceShowPlacecardOnTap"));

      if (-[DirectionItem isShortcut](v51, "isShortcut"))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem shortcutIdentifier](v51, "shortcutIdentifier"));
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v56, CFSTR("ShortcutIdentifier"));

      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v57, "viewController:openMapsSuggestionEntry:withUserInfo:", self, v51, v48);

      goto LABEL_83;
    }
    v58 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
    if ((objc_opt_isKindOfClass(v18, v58) & 1) != 0)
    {
      v59 = v18;
      objc_msgSend(v48, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("NoHistoryEntry"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
      v61 = objc_opt_class(SearchDataSource);
      v62 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_opt_isKindOfClass(v60, v61) & 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v63, CFSTR("MSGEntryForceShowPlacecardOnTap"));

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem identifier](v59, "identifier"));
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v64, CFSTR("ShortcutIdentifier"));

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v65, "viewController:openFavoriteItem:withUserInfo:", self, v59, v48);

LABEL_83:
      goto LABEL_84;
    }
    v66 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v18, v66) & 1) != 0
      && -[DirectionItem isEqualToString:](v18, "isEqualToString:", CFSTR("FavoritesEntry")))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v67, "viewControllerShowCollections:", self);

      goto LABEL_83;
    }
    v68 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v18, v68) & 1) != 0
      && -[DirectionItem isEqualToString:](v18, "isEqualToString:", CFSTR("newShortcutEntry")))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSession](ShortcutEditSession, "addSession"));
      objc_msgSend(v69, "viewController:showAddShortcut:", self, v70);

      goto LABEL_83;
    }
    v71 = objc_opt_class(SharedTripSummary);
    if ((objc_opt_isKindOfClass(v18, v71) & 1) != 0)
    {
      v72 = v18;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem sharedTrips](v72, "sharedTrips"));
      v74 = objc_msgSend(v73, "count") == (id)1;

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v76 = v75;
      if (v74)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem sharedTrips](v72, "sharedTrips"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "firstObject"));
        objc_msgSend(v76, "presentSharedTrip:", v78);

      }
      else
      {
        objc_msgSend(v75, "presentSharedTrips");
      }

      goto LABEL_83;
    }
    v79 = objc_opt_class(DirectionItem);
    if ((objc_opt_isKindOfClass(v18, v79) & 1) != 0)
    {
      objc_msgSend(v48, "setObject:forKeyedSubscript:", &off_10126E3F8, CFSTR("DirectionsSessionInitiatorKey"));
      v80 = self;
      if (self->_currentDataSource == &self->_searchDataSource->super)
      {
        objc_msgSend(v48, "setObject:forKeyedSubscript:", &off_10126E410, CFSTR("GEOMapServiceTraits_Source"));
        v80 = self;
      }
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](v80, "delegate"));
      objc_msgSend(v81, "viewController:doDirectionItem:withUserInfo:", self, v18, v48);

      goto LABEL_83;
    }
    v82 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v18, v82) & 1) != 0)
    {
      v83 = v18;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem directionIntent](v83, "directionIntent"));

      if (v84)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v85, "viewController:doDirectionIntentWithLocalSearchCompletion:", self, v83);

        goto LABEL_83;
      }

    }
    v86 = objc_opt_class(_TtC4Maps22PlaceLibraryHomeAction);
    if ((objc_opt_isKindOfClass(v18, v86) & 1) != 0)
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v87, "viewControllerShowLibraryRootView:", self);

      goto LABEL_83;
    }
    v88 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v18, v88) & 1) != 0)
    {
      v89 = v18;
      v90 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
      v91 = objc_opt_class(HistoryEntryRecentsItem);
      v92 = v89;
      if ((objc_opt_isKindOfClass(v92, v91) & 1) != 0)
        v93 = v92;
      else
        v93 = 0;
      v94 = v93;

      if (v94
        && (v95 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v94, "historyEntry")),
            v96 = objc_msgSend(v95, "conformsToProtocol:", v90),
            v95,
            v96))
      {
        v97 = v92;
      }
      else
      {
        v97 = 0;
      }

      if (v97)
      {
        v101 = v92;
        v102 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
        v103 = objc_opt_class(HistoryEntryRecentsItem);
        v104 = v101;
        if ((objc_opt_isKindOfClass(v104, v103) & 1) != 0)
          v105 = v104;
        else
          v105 = 0;
        v106 = v105;

        if (v106
          && (v107 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v106, "historyEntry")),
              v108 = objc_msgSend(v107, "conformsToProtocol:", v102),
              v107,
              v108))
        {
          v109 = v104;
        }
        else
        {
          v109 = 0;
        }

        v112 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v109, "historyEntry"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "endWaypoint"));
        v114 = objc_opt_class(GEOComposedWaypointToRoute);
        v115 = objc_opt_isKindOfClass(v113, v114);

        if ((v115 & 1) != 0)
        {
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "endWaypoint"));
          v117 = (DirectionItem *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "route"));
          v273 = CFSTR("DirectionsRouteUUIDKey");
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "identifier"));
          v274 = v119;
          v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v274, &v273, 1));
          -[DirectionItem viewController:enterRouteCreationWithRoute:withUserInfo:](v117, "viewController:enterRouteCreationWithRoute:withUserInfo:", self, v118, v120);

        }
        else
        {
          v116 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteHistoryEntry:](SearchFieldItem, "searchFieldItemsForRouteHistoryEntry:", v112));
          if ((objc_msgSend(v112, "navigationWasInterrupted") & 1) != 0
            || (unint64_t)objc_msgSend(v116, "count") >= 3)
          {
            v135 = objc_msgSend(v112, "transportType");
          }
          else
          {
            v135 = 0;
          }
          v117 = -[DirectionItem initWithItems:transportType:]([DirectionItem alloc], "initWithItems:transportType:", v116, v135);
          v271[0] = CFSTR("DirectionsSessionInitiatorKey");
          v271[1] = CFSTR("DirectionsRouteUUIDKey");
          v272[0] = &off_10126E3F8;
          v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "identifier"));
          v272[1] = v170;
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v272, v271, 2));

          v119 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          objc_msgSend(v119, "viewController:doDirectionItem:withUserInfo:", self, v117, v118);
        }

        goto LABEL_83;
      }
      v126 = v92;
      v127 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
      v128 = objc_opt_class(HistoryEntryRecentsItem);
      v129 = v126;
      if ((objc_opt_isKindOfClass(v129, v128) & 1) != 0)
        v130 = v129;
      else
        v130 = 0;
      v131 = v130;

      if (v131
        && (v132 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v131, "historyEntry")),
            v133 = objc_msgSend(v132, "conformsToProtocol:", v127),
            v132,
            v133))
      {
        v134 = v129;
      }
      else
      {
        v134 = 0;
      }

      if (v134)
      {
        v138 = v129;
        v139 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
        v140 = objc_opt_class(HistoryEntryRecentsItem);
        v141 = v138;
        if ((objc_opt_isKindOfClass(v141, v140) & 1) != 0)
          v142 = v141;
        else
          v142 = 0;
        v143 = v142;

        if (v143
          && (v144 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v143, "historyEntry")),
              v145 = objc_msgSend(v144, "conformsToProtocol:", v139),
              v144,
              v145))
        {
          v146 = v141;
        }
        else
        {
          v146 = 0;
        }

        v147 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        v148 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v146, "historyEntry"));
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "lineItem"));
        objc_msgSend(v147, "viewController:selectTransitLineItem:zoomToMapRegion:", self, v149, 1);

        goto LABEL_83;
      }
      v150 = v129;
      v151 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      v152 = objc_opt_class(HistoryEntryRecentsItem);
      v153 = v150;
      if ((objc_opt_isKindOfClass(v153, v152) & 1) != 0)
        v154 = v153;
      else
        v154 = 0;
      v155 = v154;

      if (v155
        && (v156 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v155, "historyEntry")),
            v157 = objc_msgSend(v156, "conformsToProtocol:", v151),
            v156,
            v157))
      {
        v158 = v153;
      }
      else
      {
        v158 = 0;
      }

      if (v158)
      {
        v161 = v153;
        v162 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
        v163 = objc_opt_class(HistoryEntryRecentsItem);
        v164 = v161;
        if ((objc_opt_isKindOfClass(v164, v163) & 1) != 0)
          v165 = v164;
        else
          v165 = 0;
        v166 = v165;

        if (v166
          && (v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "historyEntry")),
              v168 = objc_msgSend(v167, "conformsToProtocol:", v162),
              v167,
              v168))
        {
          v169 = v164;
        }
        else
        {
          v169 = 0;
        }

        v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "historyEntry"));
        v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "placeCollection"));

        v175 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v175, "viewController:showCuratedCollection:", self, v174);

        goto LABEL_83;
      }
    }
    else
    {
      v98 = objc_opt_class(ReportASearchAutocompleteResult);
      if ((objc_opt_isKindOfClass(v18, v98) & 1) != 0)
      {
        objc_initWeak((id *)buf, self);
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "rapPresenter"));
        v254[0] = _NSConcreteStackBlock;
        v254[1] = 3221225472;
        v254[2] = sub_1006217D8;
        v254[3] = &unk_1011AD260;
        objc_copyWeak(&v255, (id *)buf);
        objc_msgSend(v100, "presentAddToMapsFromSearchEntryPoint:result:completion:", 11, v18, v254);

        objc_destroyWeak(&v255);
        objc_destroyWeak((id *)buf);
        goto LABEL_83;
      }
      v110 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v18, v110) & 1) != 0 && -[DirectionItem type](v18, "type") == 3)
      {
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v111, "viewController:selectDroppedPin:", self, v18);

        goto LABEL_83;
      }
      v121 = objc_opt_class(MKLocalSearchCompletion);
      if ((objc_opt_isKindOfClass(v18, v121) & 1) != 0)
      {
        v122 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem clientResolved](v18, "clientResolved"));
        v123 = v122 == 0;

        if (!v123)
        {
          v124 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem clientResolved](v18, "clientResolved"));
          v125 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          objc_msgSend(v125, "viewController:selectClientResolvedItem:fromSearchInfo:withUserInfo:", self, v124, 0, 0);

          goto LABEL_83;
        }
      }
      v136 = objc_opt_class(CollectionHandler);
      if ((objc_opt_isKindOfClass(v18, v136) & 1) != 0)
      {
        v137 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v137, "viewController:showCollection:", self, v18);

        goto LABEL_83;
      }
      if (-[DirectionItem conformsToProtocol:](v18, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
      {
        v159 = -[IncompleteTransitLineItem initWithTransitLine:]([IncompleteTransitLineItem alloc], "initWithTransitLine:", v18);
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v160, "viewController:selectTransitLineItem:zoomToMapRegion:", self, v159, 1);

        goto LABEL_83;
      }
      v171 = objc_opt_class(GEOPlaceCollection);
      if ((objc_opt_isKindOfClass(v18, v171) & 1) != 0)
      {
        v172 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v172, "viewController:showCuratedCollection:", self, v18);

        goto LABEL_83;
      }
      v176 = objc_opt_class(GEOPublisher);
      if ((objc_opt_isKindOfClass(v18, v176) & 1) != 0)
      {
        v177 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v177, "viewControllerShowPublisher:", v18);

        goto LABEL_83;
      }
      v178 = objc_opt_class(GEOGuideLocation);
      if ((objc_opt_isKindOfClass(v18, v178) & 1) != 0)
      {
        self->_maintainSearchStateWhenDisappearing = 1;
        v179 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v179, "viewController:showGuidesHome:", self, v18);

        goto LABEL_83;
      }
      v180 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v18, v180) & 1) != 0)
      {
        v181 = v18;
        v182 = -[DirectionItem type](v181, "type");
        if ((_DWORD)v182 != 11
          || (v183 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem relatedSection](v181, "relatedSection")),
              v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "relatedCollectionSection")),
              v185 = v184 == 0,
              v184,
              v183,
              v185))
        {
          if (!MapsFeature_IsEnabled_SearchAndDiscovery(v182)
            || (v227 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem placeCollection](v181, "placeCollection")),
                v228 = v227 == 0,
                v227,
                v228))
          {
            if (-[SearchViewController shouldInjectVenueSearchResult:](self, "shouldInjectVenueSearchResult:", v181))
            {
              v229 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
              objc_msgSend(v229, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:replaceCurrentCard:", self, v181, 1, 2, 1, 0);

              v186 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
              v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "searchPinsManager"));
              v270 = v181;
              v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v270, 1));
              objc_msgSend(v187, "setSearchPins:selectedPin:animated:", v230, v181, 1);

            }
            else
            {
              v231 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem mapItem](v181, "mapItem"));
              v232 = objc_msgSend(v231, "_hasHikeInfo");

              v233 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
              v186 = v233;
              if (v232)
              {
                v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "appCoordinator"));
                v234 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem mapItem](v181, "mapItem"));
                objc_msgSend(v187, "enterRouteCreationWithMapItem:completion:", v234, 0);

              }
              else
              {
                v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "mapSelectionManager"));
                objc_msgSend(v187, "selectSearchResult:animated:", v181, 1);
              }
            }
          }
          else
          {
            v186 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
            v187 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem placeCollection](v181, "placeCollection"));
            objc_msgSend(v186, "viewController:showCuratedCollection:", self, v187);
          }
        }
        else
        {
          v186 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          v187 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem relatedSection](v181, "relatedSection"));
          v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "relatedPlaceCollections"));
          v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("Related Guides"), CFSTR("localized string not found"), 0));
          objc_msgSend(v186, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", self, v188, v190, 0, 0);

        }
        goto LABEL_83;
      }
      v191 = objc_opt_class(MKMapItem);
      if ((objc_opt_isKindOfClass(v18, v191) & 1) != 0)
      {
        v192 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v18);
        v193 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "searchPinsManager"));
        v269 = v192;
        v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v269, 1));
        objc_msgSend(v194, "setSearchPins:selectedPin:animated:", v195, v192, 1);

        goto LABEL_83;
      }
    }
    v196 = objc_opt_class(MKSearchCompletion);
    if ((objc_opt_isKindOfClass(v18, v196) & 1) == 0
      || (v197 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem category](v18, "category")),
          v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "venueIdentifier")),
          v199 = v198 == 0,
          v198,
          v197,
          v199))
    {
      v204 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v18));
    }
    else
    {
      v200 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem category](v18, "category"));
      v201 = [VenueCategoryItem alloc];
      v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "venueIdentifier"));
      v203 = -[VenueCategoryItem initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:](v201, "initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:", v200, v202, objc_msgSend(v200, "displayMode"), 1, 0);

      v204 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v203));
    }
    if (!v204)
    {
LABEL_202:

      goto LABEL_83;
    }
    objc_msgSend(v204, "setUserTypedStringForRAP:", self->_userTypedSearchString);
    v205 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v18, v205) & 1) != 0)
    {
      objc_msgSend(v48, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("NoHistoryEntry"));
    }
    else
    {
      v206 = objc_opt_class(CRRecentContact);
      if ((objc_opt_isKindOfClass(v18, v206) & 1) != 0)
      {
        objc_msgSend(v48, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("NoHistoryEntry"));
        v207 = v18;
        v208 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
        objc_msgSend(v208, "recordCoreRecentContact:", v207);

      }
    }
    currentDataSource = (SearchHomeDataSource *)self->_currentDataSource;
    if (currentDataSource == (SearchHomeDataSource *)self->_searchDataSource)
    {
      v210 = &off_10126E410;
    }
    else
    {
      if (currentDataSource && currentDataSource != self->_searchHomeDataSource)
      {
LABEL_185:
        if (sub_1002A8AA0(self) == 5)
        {
          v211 = v18;
          v212 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
          v213 = objc_opt_class(HistoryEntryRecentsItem);
          v214 = v211;
          v215 = (objc_opt_isKindOfClass(v214, v213) & 1) != 0 ? v214 : 0;
          v216 = v215;

          if (v216
            && (v217 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem historyEntry](v216, "historyEntry")),
                v218 = objc_msgSend(v217, "conformsToProtocol:", v212),
                v217,
                v218))
          {
            v219 = v214;
          }
          else
          {
            v219 = 0;
          }

          if (v219)
          {
            v220 = 1;
          }
          else
          {
            v221 = objc_opt_class(GEOSearchCategory);
            v220 = objc_opt_isKindOfClass(v214, v221);
          }
          if ((v219,
                v222 = objc_opt_class(MKLocalSearchCompletion),
                (objc_opt_isKindOfClass(v214, v222) & 1) != 0)
            && ((v223 = -[DirectionItem _type](v214, "_type")) == 0 || v223 == (id)3)
            || (v220 & 1) != 0)
          {
            v224 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
            objc_msgSend(v224, "clearSearchPins");

            v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "searchString"));
            -[UITextField setText:](self->_searchField, "setText:", v225);

          }
        }
        v226 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v226, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v204, v48, v245);

        -[SearchDataSource clearAutocompleteResults](self->_searchDataSource, "clearAutocompleteResults");
        goto LABEL_202;
      }
      v210 = &off_10126E428;
    }
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v210, CFSTR("GEOMapServiceTraits_Source"));
    goto LABEL_185;
  }
  -[SearchViewController triggerAutocompleteByReplacingQueryWithCompletion:](self, "triggerAutocompleteByReplacingQueryWithCompletion:", v7);
LABEL_86:

}

- (void)didTapOnHomePinnedLibraryItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));

  objc_msgSend(v6, "viewController:editShortcut:", self, v5);
}

- (void)didTapToUnpinLibraryItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));

  objc_msgSend(v6, "viewController:removeShortcut:", self, v5);
}

- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  v5 = objc_opt_class(MKSearchCompletion);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    -[SearchViewController triggerAutocompleteByReplacingQueryWithCompletion:](self, "triggerAutocompleteByReplacingQueryWithCompletion:", v6);

}

- (void)showRegionSelectorForMapItem:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  _QWORD *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100621BA0;
  v19[3] = &unk_1011B21D0;
  v19[4] = self;
  v5 = objc_retainBlock(v19);
  v6 = v4;
  v7 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100621C64;
    v17[3] = &unk_1011BE430;
    v17[4] = self;
    v18 = v5;
    -[SearchViewController fetchSearchCompletion:completion:](self, "fetchSearchCompletion:completion:", v9, v17);

  }
  else
  {
    v10 = v6;
    v11 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));
    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));
      ((void (*)(_QWORD *, NSObject *))v5[2])(v5, v15);
    }
    else
    {
      v16 = sub_10043222C();
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Offline: This type of poi item is not handled :%@.", buf, 0xCu);
      }
    }

  }
}

- (void)fetchSearchCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MKMapServiceTicket *v13;
  MKMapServiceTicket *mapServiceTicket;
  MKMapServiceTicket *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[SearchViewController resetMapServiceTicket](self, "resetMapServiceTicket");
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "newTraits");

  if (self->_currentDataSource == &self->_searchDataSource->super)
    objc_msgSend(v9, "setSource:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryLine"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoCompletionItem"));
  v13 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForSearchQuery:completionItem:traits:searchSessionData:", v11, v12, v9, 0));
  mapServiceTicket = self->_mapServiceTicket;
  self->_mapServiceTicket = v13;

  v15 = self->_mapServiceTicket;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100621E98;
  v17[3] = &unk_1011BE458;
  objc_copyWeak(&v19, &location);
  v16 = v7;
  v18 = v16;
  -[MKMapServiceTicket submitWithRefinedHandler:networkActivity:](v15, "submitWithRefinedHandler:networkActivity:", v17, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)fetchMapItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  Class isa;
  Class v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  id v21;

  v6 = a3;
  v7 = a4;
  -[SearchViewController resetMapServiceTicket](self, "resetMapServiceTicket");
  v8 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithGEOMapItemIdentifier:", v6);
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v21 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v12 = objc_msgSend(v11, "newTraits");
  v13 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForIdentifiers:traits:", v10, v12));
  self = (SearchViewController *)((char *)self + 328);
  isa = self->super.super.super.super.super.super.isa;
  self->super.super.super.super.super.super.isa = v13;

  v15 = self->super.super.super.super.super.super.isa;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10062210C;
  v17[3] = &unk_1011B21F8;
  objc_copyWeak(&v19, &location);
  v16 = v7;
  v18 = v16;
  -[objc_class submitWithHandler:networkActivity:](v15, "submitWithHandler:networkActivity:", v17, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  self->_maintainSearchStateWhenDisappearing = 1;
  v6 = objc_msgSend(v10, "type");
  if (v6 == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userGeneratedCollection"));
    objc_msgSend(v7, "viewController:showCollection:", self, v8);
    goto LABEL_7;
  }
  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeCollections"));
    objc_msgSend(v7, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", self, v8, 0, 0, 0);
    goto LABEL_7;
  }
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeCollections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_msgSend(v7, "viewController:showCuratedCollection:", self, v9);

LABEL_7:
  }

}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  self->_maintainSearchStateWhenDisappearing = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:showCollection:", self, v4);

}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  self->_maintainSearchStateWhenDisappearing = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:showCuratedCollection:", self, v4);

}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  if (sub_1002A8AA0(self) == 5)
    -[SearchViewController showDropDown:](self, "showDropDown:", 0);
  self->_maintainSearchStateWhenDisappearing = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", self, v4, 0, 0, 0);

}

- (id)newTraits
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "newTraits");

  return v3;
}

- (double)isTouristHereValue
{
  return self->_isTouristHereValue;
}

- (id)recentAutocompleteSessionData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_recentAutocompleteSessionData"));

  return v3;
}

- (void)seeAllTappedForCollections
{
  void *v3;
  id v4;

  if (sub_1002A8AA0(self) == 5)
  {
    -[SearchViewController showDropDown:](self, "showDropDown:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    objc_msgSend(v3, "endEditing:", 1);

  }
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v4, "viewControllerShowAllCollections");

}

- (void)seeAllTappedForRecents
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "viewControllerShowMyRecents:includeRecentSearches:", self, 1);

}

- (void)seeAllTappedForUserGuides
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v2, "viewControllerShowCollections:", 0);

}

- (void)shareCollection:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appCoordinator"));
  objc_msgSend(v8, "shareCollection:sourceView:completion:", v6, v7, 0);

}

- (void)showCitySelector
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v2, "viewControllerShowCitySelectorFromGuideLocation:", 0);

}

- (void)showGuidesHomeFromExploreGuides:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideLocation"));

  objc_msgSend(v6, "viewController:showGuidesHome:", self, v5);
}

- (void)homeItemTapped:(id)a3
{
  -[SearchViewController dataSource:itemTapped:](self, "dataSource:itemTapped:", 0, a3);
}

- (void)homePinnedLibraryItemTapped:(id)a3
{
  -[SearchViewController didTapOnHomePinnedLibraryItem:](self, "didTapOnHomePinnedLibraryItem:", a3);
}

- (void)homeDidTapToUnpinLibraryShortcutItem:(id)a3
{
  -[SearchViewController didTapToUnpinLibraryItem:](self, "didTapToUnpinLibraryItem:", a3);
}

- (void)homeSectionHeaderButtonTapped:(int64_t)a3
{
  id v4;

  switch(a3)
  {
    case 5:
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v4, "viewControllerShowMyRecents:includeRecentSearches:", self, 0);
      break;
    case 3:
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v4, "viewControllerShowCollections:", self);
      break;
    case 2:
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v4, "viewControllerShowMyShortcuts:", self);
      break;
    default:
      return;
  }

}

- (void)homeDidTapOnPlaceContextWithViewModel:(id)a3
{
  -[SearchViewController searchDataSource:didTapOnPlaceContextWithViewModel:](self, "searchDataSource:didTapOnPlaceContextWithViewModel:", 0, a3);
}

- (void)homeContentDidUpdate
{
  void *v3;
  id v4;
  id v5;

  -[SearchViewController _contentAlphaForCurrentLayout](self, "_contentAlphaForCurrentLayout");
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 0);
  -[SearchViewController _invalidateMediumHeightCache](self, "_invalidateMediumHeightCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containerStyle");

  if (v4 == (id)6)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "updateHeightForCurrentLayout");

  }
}

- (void)homeDidTapOnContainment:(id)a3 forResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SearchResult *v11;

  v6 = a4;
  v7 = a3;
  v11 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObject:", v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchPinsManager"));
  objc_msgSend(v10, "setSearchPins:selectedPin:animated:", v8, v11, 1);

}

- (void)homeDidTapShareMyLocation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Share My Location [App Delegate]"), CFSTR("localized string not found"), 0));

  v4 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutItem), "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Maps.action.share-location-from-app-delegate"), v7, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryPointsCoordinator"));
  objc_msgSend(v6, "openShortcutItem:", v4);

}

- (void)homeDidTapMarkMyLocation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Mark My Location [App Delegate]"), CFSTR("localized string not found"), 0));

  v4 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutItem), "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Maps.action.mark-my-location-from-app-delegate"), v7, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryPointsCoordinator"));
  objc_msgSend(v6, "openShortcutItem:", v4);

}

- (void)homeDidTapReportAProblem
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "viewControllerShowReports:", self);

}

- (void)homeDidTapTermsAndConditions
{
  uint64_t String;
  void *v4;
  void *v5;
  id v6;

  String = GEOConfigGetString(MapsConfig_MapsHomeTermsAndConditionsURL, off_1014B3EC8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(String);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController homeActionCoordinator](self, "homeActionCoordinator"));
  objc_msgSend(v5, "viewController:openURL:", self, v6);

}

- (ShareDelegate)homeShareDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));

  return (ShareDelegate *)v3;
}

- (ParkedCarActionDelegate)homeParkedCarActionDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));

  return (ParkedCarActionDelegate *)v3;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2003, -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  -[SearchViewController endSearch](self, "endSearch");
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));
    v7 = objc_msgSend(v6, "preferredPresentationStyle");

    if (v7 == (id)3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));
      objc_msgSend(v8, "viewControllerGoPreviousState:withSender:", v10, v4);

    }
  }
  self->_noTypingSent = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 2001, -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v13 = objc_msgSend(v12, "newTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseManager sharedManager](BrowseManager, "sharedManager"));
  objc_msgSend(v14, "setTraits:", v13);

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  SearchFieldItem *v11;
  SearchFieldItem *searchItem;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Search bar selected", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  if (objc_msgSend(v7, "containeeLayout") == (id)1)
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v9 = objc_msgSend(v8, "containeeLayout");

    if (v9 != (id)2)
      goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v10, "wantsLayout:", 3);

LABEL_7:
  if (!self->_searchItem)
  {
    v11 = objc_alloc_init(SearchFieldItem);
    searchItem = self->_searchItem;
    self->_searchItem = v11;

  }
  self->_hasEdited = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100622FFC;
  v22[3] = &unk_1011AC860;
  v22[4] = self;
  v13 = objc_retainBlock(v22);
  if (sub_1002A8AA0(self) == 5)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v14, "applyWithAnimations:completion:", v13, &stru_1011BE478);

  }
  -[SearchViewController updateDataSource](self, "updateDataSource");
  if (sub_1002A8AA0(self) == 5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
      v18 = objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___SearchDataProviding);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
        v20 = objc_msgSend(v19, "hasResults");

        if ((v20 & 1) == 0)
          -[SearchViewController _textFieldDidChange:](self, "_textFieldDidChange:", 0);
      }
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("SearchTextFieldDidBeginEditingNotification"), self);

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  -[SearchViewController setNeedsUpdateContentState](self, "setNeedsUpdateContentState", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SearchTextFieldDidEndEditingNotification"), self);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing text field", v10, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2002, -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  -[SearchViewController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self->_searchDataSource, "searchDataProvider"));
  objc_msgSend(v7, "clearMKLocalSearchCompleterQueryState");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v8, "clearSearch");

  -[SearchDataSource clearAutocompleteResults](self->_searchDataSource, "clearAutocompleteResults");
  if (sub_1002A8AA0(self) != 5)
    -[SearchViewController searchBarBecomeFirstResponder](self, "searchBarBecomeFirstResponder");
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Keyboard search button pressed", v12, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_stringByTrimmingLeadingWhitespace"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v10, "clearSearchPins");

    }
    -[SearchViewController sendSearchRequest](self, "sendSearchRequest");
    -[UITextField resignFirstResponder](self->_searchField, "resignFirstResponder");
  }
  return v9 != 0;
}

- (void)_textFieldDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t BaseLanguage;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Processing autocomplete query: %@", (uint8_t *)&v16, 0xCu);

  }
  -[SearchViewController _textFieldDidChange:tappedQuerySuggestionCompletion:](self, "_textFieldDidChange:tappedQuerySuggestionCompletion:", v4, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentInputMode"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  BaseLanguage = UIKeyboardInputModeGetBaseLanguage();
  v12 = (void *)objc_claimAutoreleasedReturnValue(BaseLanguage);
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ja"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField markedTextRange](self->_searchField, "markedTextRange"));

    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 458, 127, 0);

    }
  }

}

- (void)_textFieldDidChange:(id)a3 tappedQuerySuggestionCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_searchField, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_stringByTrimmingLeadingWhitespace"));

  if (objc_msgSend(v6, "length") == (id)1
    && !self->_noTypingSent
    && self->_currentDataSource == &self->_searchHomeDataSource->super)
  {
    self->_noTypingSent = 1;
    -[SearchHomeDataSource sendNoTypingACAnalytics](self->_searchHomeDataSource, "sendNoTypingACAnalytics");
  }
  self->_hasEdited = 1;
  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = 0;
  objc_storeStrong((id *)&self->_userTypedSearchString, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
    -[SearchViewController clearRetainedSearchQuery](self, "clearRetainedSearchQuery");
  -[SearchViewController sendACRequestWithTappedQuerySuggestionCompletion:retainQueryMetadata:](self, "sendACRequestWithTappedQuerySuggestionCompletion:retainQueryMetadata:", v11, 0);

}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(0, "setDropPerformer:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dropSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDragSession"));

  v8 = objc_alloc((Class)UITextDropProposal);
  if (v7)
  {
    v9 = objc_msgSend(v8, "initWithDropOperation:", 0);
  }
  else
  {
    v9 = objc_msgSend(v8, "initWithDropOperation:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dropSession"));
    objc_msgSend(v10, "beginDrop:", v11);

  }
  return v9;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  v10 = v9 + v8 * 0.5;
  v13 = v12 + v11 * 0.5;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dropSession"));

  objc_msgSend(v15, "performDrop:finishingAtLocation:inView:", v14, v7, v10, v13);
}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController mapsDragDestinationHandler](self, "mapsDragDestinationHandler"));
  objc_msgSend(v6, "endDrop:", v5);

}

- (void)selectNearbyCategoryAtIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
  objc_msgSend(v4, "_ppt_selectCategoryAtIndex:", a3);

}

- (void)refreshCurrentSearch
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!MapsFeature_IsEnabled_SearchAndDiscovery(self))
    goto LABEL_6;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  if (!v7 || (v3 = objc_opt_class(ResultsViewController), (objc_opt_isKindOfClass(v7, v3) & 1) == 0))
  {

LABEL_6:
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSearchSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchFieldItem"));
    objc_msgSend(v7, "viewController:doSearchItem:withUserInfo:", self, v6, &off_1012747C8);

    goto LABEL_7;
  }
  objc_msgSend(v7, "refreshCurrentSearch");
LABEL_7:

}

- (double)_contentAlphaForCurrentLayout
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "contentAlpha");
  v4 = v3;

  return v4;
}

- (void)_updateHeaderHairlineAlphaWithContentAlpha:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  SearchHomeDataSource *currentDataSource;
  void *v9;
  id v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a4;
  v7 = 0.0;
  if (sub_1002A8AA0(self) != 5)
  {
    currentDataSource = (SearchHomeDataSource *)self->_currentDataSource;
    if (currentDataSource)
    {
      if (currentDataSource != self->_searchHomeDataSource
        || !-[SearchHomeDataSource shouldHideHairLine](currentDataSource, "shouldHideHairLine"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
        v10 = objc_msgSend(v9, "presentationStyle");

        if (v10 == (id)1)
        {
          v11 = 216;
        }
        else
        {
          if (v10)
            goto LABEL_16;
          v11 = 208;
        }
        if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v11), "_maps_shouldShowTopHairline"))v7 = a3;
        else
          v7 = 0.0;
      }
    }
    else
    {
      v12 = -[HomeViewController shouldShowTopHairline](self->_homeViewController, "shouldShowTopHairline");
      if (v12)
        v7 = a3;
      else
        v7 = 0.0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeViewController scrollView](self->_homeViewController, "scrollView"));
      objc_msgSend(v13, "setClipsToBounds:", v12);

    }
  }
LABEL_16:
  v14[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006239A0;
  v15[3] = &unk_1011B22D8;
  v15[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1006239B4;
  v14[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", v4, v15, v14, v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[SearchViewController _contentAlphaForCurrentLayout](self, "_contentAlphaForCurrentLayout");
  -[SearchViewController _updateHeaderHairlineAlphaWithContentAlpha:animated:](self, "_updateHeaderHairlineAlphaWithContentAlpha:animated:", 1);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchViewController;
  -[ContaineeViewController scrollViewWillBeginDragging:](&v3, "scrollViewWillBeginDragging:", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  uint64_t v7;
  void *v8;
  objc_super v9;

  y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)SearchViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  if (y <= 0.0)
    v7 = 7;
  else
    v7 = 8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v7, -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (int)currentUITargetForAnalytics
{
  DataSource *currentDataSource;
  uint64_t v4;
  int v5;
  DataSource *v6;
  uint64_t v7;

  currentDataSource = self->_currentDataSource;
  v4 = objc_opt_class(SearchDataSource);
  if ((objc_opt_isKindOfClass(currentDataSource, v4) & 1) != 0)
  {
    v5 = 11;
  }
  else
  {
    v6 = self->_currentDataSource;
    v7 = objc_opt_class(SearchHomeDataSource);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
      return 8;
    v5 = 13;
  }
  if (-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
    return 59;
  else
    return v5;
}

- (void)_addRecentPlaceForSearchResult:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "isHomeOrWork");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchToSupersedeIfRecordedInHistory"));
      +[HistoryEntryRecentsItem saveMapItem:superseedUUID:](HistoryEntryRecentsItem, "saveMapItem:superseedUUID:", v6, v7);

      v4 = v8;
    }
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  void *v5;
  SearchFieldItem *v6;
  void *v7;
  SearchFieldItem *v8;
  DirectionItem *v9;
  void *v10;
  DirectionItem *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _UNKNOWN **v15;
  _QWORD v16[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v5)
  {
    v6 = objc_alloc_init(SearchFieldItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v6, "setSearchResult:", v7);

    v8 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v5);
    v9 = [DirectionItem alloc];
    v16[0] = v6;
    v16[1] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    v11 = -[DirectionItem initWithItems:transportType:](v9, "initWithItems:transportType:", v10, 0);

    v14 = CFSTR("DirectionsSessionInitiatorKey");
    v15 = &off_10126E3F8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v13, "viewController:doDirectionItem:withUserInfo:", 0, v11, v12);

    -[SearchViewController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v5);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:doAudioCallToSearchResult:", 0, v6);

    -[SearchViewController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:openWebsiteForSearchResult:", 0, v6);

    -[SearchViewController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactForSharingToMessages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v6, v7, 0));

    self->_maintainSearchStateWhenDisappearing = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100623F4C;
    v10[3] = &unk_1011AC860;
    v10[4] = self;
    objc_msgSend(v9, "viewController:doShareSheetForShareItem:completion:", 0, v8, v10);

    -[SearchViewController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultQuickActionMenuPresenter indexPath](self->_quickActionMenuPresenter, "indexPath", a3, a4));
  if (v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultQuickActionMenuPresenter indexPath](self->_quickActionMenuPresenter, "indexPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexPath:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
    -[SearchViewController dataSource:itemTapped:](self, "dataSource:itemTapped:", v9, v8);

    v5 = v10;
  }

}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4
{
  return 0;
}

- (int)uiTargetForQuickActionMenu
{
  return 2;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  v4 = objc_msgSend(v3, "newTraits");

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:removeDroppedPin:", 0, v6);

  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

  LOBYTE(v5) = objc_msgSend(v7, "isUserAtSameVenueAsMapItem:", v8) ^ 1;
  return (char)v5;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  v4 = -[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar");
  v5 = 502;
  if (v4 && v3 && sub_1007F7BE8((uint64_t)v3, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v6 = v3;
    if ((objc_opt_respondsToSelector(v6, "currentMapViewTargetForAnalytics") & 1) != 0)
      v5 = objc_msgSend(v6, "currentMapViewTargetForAnalytics");

  }
  return v5;
}

- (UIScrollView)scrollViewForProactive
{
  return -[HomeViewController scrollView](self->_homeViewController, "scrollView");
}

- (void)macMenuPresentationControllerWillDismiss:(id)a3
{
  -[SearchViewController showTitleBarSeparatorWhenScrolling:](self, "showTitleBarSeparatorWhenScrolling:", 1);
}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10062429C;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController homeActionCoordinator](self, "homeActionCoordinator"));
  v5 = objc_opt_class(MacBaseActionCoordinator);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController homeActionCoordinator](self, "homeActionCoordinator"));
    objc_msgSend(v7, "makeMapViewFirstResponder");

  }
  -[SearchViewController updateDataSource](self, "updateDataSource");
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  if (-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController navContaineeDelegate](self, "navContaineeDelegate"));
    objc_msgSend(v5, "dismissAddStop");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 4, -[SearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController browseModeHeaderView](self, "browseModeHeaderView"));
  v8 = objc_msgSend(v7, "isHidden");

  if ((v8 & 1) == 0)
  {
    -[SearchViewController endSearch](self, "endSearch");
    -[SearchViewController _shouldHideOfflineHeaderView:](self, "_shouldHideOfflineHeaderView:", 1);
  }
}

- (UIScrollView)pptTestScrollView
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  if (!-[SearchViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar") || !v3)
  {
LABEL_6:
    if (self->_currentDataSource)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
      v6 = objc_msgSend(v5, "presentationStyle");

      if (v6 == (id)1)
      {
        v7 = 216;
      }
      else
      {
        if (v6)
          goto LABEL_14;
        v7 = 208;
      }
      v8 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v7);
    }
    else
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[HomeViewController scrollView](self->_homeViewController, "scrollView"));
    }
    v5 = v8;
    goto LABEL_14;
  }
  v4 = v3;
  if ((objc_opt_respondsToSelector(v4, "pptTestScrollView") & 1) == 0)
  {

    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pptTestScrollView"));

LABEL_14:
  return (UIScrollView *)v5;
}

- (void)pptSearchBarShouldProvideTextChangeNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_textFieldDidChange:", CFSTR("PPTShouldSendTextChangeNotification"), self->_searchField);

}

- (void)pptSetSearchDataSource
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchDataSource](self, "searchDataSource"));
  -[SearchViewController setCurrentDataSource:](self, "setCurrentDataSource:", v3);

}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
  objc_msgSend(v2, "_ppt_selectSeeAllCuratedCollections");

}

- (void)pptSelectFirstGuidePublisher
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
  objc_msgSend(v2, "_ppt_selectFirstGuidePublisher");

}

- (void)pptSelectFirstCuratedCollection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchHomeDataSource](self, "searchHomeDataSource"));
  objc_msgSend(v2, "_ppt_selectFirstCuratedGuide");

}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];

  v23 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController currentDataSource](self, "currentDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsForAnalytics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(PersonalizedCompoundItem);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autocompleteObject"));
          if ((objc_opt_respondsToSelector(v14, "mapItem") & 1) != 0)
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItem"));
            if (v15)
            {
              v16 = (void *)v15;
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItem"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_shortAddress"));
              v24 = objc_msgSend(v18, "isEqualToString:", v23);

              if (v24)
              {
                v19 = sub_10043222C();
                v20 = objc_claimAutoreleasedReturnValue(v19);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v30 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "PPT: Found map item matching address: %@", buf, 0xCu);
                }

                -[SearchViewController dataSource:itemTapped:](self, "dataSource:itemTapped:", self->_searchDataSource, v14);
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
          v14 = 0;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_18:

}

- (void)didStartDownloadFromAutocomplete
{
  void *v3;
  SearchResult *downloadedSearchResult;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (self->_downloadedSearchResult)
  {
    -[SearchViewController endSearch](self, "endSearch");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v3, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:replaceCurrentCard:", self, self->_downloadedSearchResult, 1, 2, 1, 1);

    downloadedSearchResult = self->_downloadedSearchResult;
    self->_downloadedSearchResult = 0;

  }
  else
  {
    v5 = sub_10043222C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
    }

  }
}

- (BOOL)supportsFullTextSearch
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  return v4 && self->_supportsFullTextSearch;
}

- (BOOL)shouldShowSearchOverlay
{
  unsigned int v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  if (self->_didTriggerAutoRedoSearch)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSearchSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchInfo"));

    if (v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchRedoButtonThreshold")),
          v7,
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController localSearchViewController](self, "localSearchViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refreshSearchHereBusinessController"));
      v10 = objc_msgSend(v9, "shouldShowManualRedoButton");

      v2 = v10 & objc_msgSend(v6, "shouldAllowManualRedoButton");
    }
    else
    {
      LOBYTE(v2) = 0;
    }

  }
  return v2;
}

- (NavActionCoordination)navContaineeDelegate
{
  return (NavActionCoordination *)objc_loadWeakRetained((id *)&self->_navContaineeDelegate);
}

- (void)setNavContaineeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navContaineeDelegate, a3);
}

- (CardButton)closeSearchResultsButton
{
  return self->_closeSearchResultsButton;
}

- (void)setCloseSearchResultsButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeSearchResultsButton, a3);
}

- (PersonalizedItemManager)personalizedItemManager
{
  return (PersonalizedItemManager *)objc_loadWeakRetained((id *)&self->_personalizedItemManager);
}

- (BOOL)maintainSearchStateWhenDisappearing
{
  return self->_maintainSearchStateWhenDisappearing;
}

- (void)setMaintainSearchStateWhenDisappearing:(BOOL)a3
{
  self->_maintainSearchStateWhenDisappearing = a3;
}

- (BOOL)isSearchingAlongTheRoute
{
  return self->_searchingAlongTheRoute;
}

- (void)setSearchingAlongTheRoute:(BOOL)a3
{
  self->_searchingAlongTheRoute = a3;
}

- (DataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (void)setMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_menuController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_destroyWeak((id *)&self->_personalizedItemManager);
  objc_storeStrong((id *)&self->_closeSearchResultsButton, 0);
  objc_destroyWeak((id *)&self->_navContaineeDelegate);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_downloadedSearchResult, 0);
  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
  objc_storeStrong((id *)&self->_offlineBrowseHeaderView, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsLoadingSearchQueue, 0);
  objc_storeStrong((id *)&self->_placeholderQueue, 0);
  objc_storeStrong((id *)&self->_mapServiceTicket, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_retainedQueryController, 0);
  objc_storeStrong((id *)&self->_bottomHideableFooterConstraint, 0);
  objc_storeStrong((id *)&self->_bottomHeaderHairline, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
  objc_storeStrong((id *)&self->_searchFieldLayoutGuide, 0);
  objc_storeStrong((id *)&self->_dropDownView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_homeViewControllerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_homeViewController, 0);
  objc_storeStrong((id *)&self->_searchItem, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_searchHomeDataSource, 0);
  objc_storeStrong((id *)&self->_userProfileButton, 0);
  objc_storeStrong((id *)&self->_userTypedSearchString, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

- (void)endSearchForTesting
{
  id v3;

  -[SearchViewController endSearch](self, "endSearch");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v3, "setText:", &stru_1011EB268);

}

- (void)displaySearchResultsWithViewController:(id)a3 searchBar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  uint64_t IsEnabled_SearchAndDiscovery;
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
  id v24;
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
  _QWORD v40[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v8, "isUsingOfflineMaps")
    && !(v9 = -[SearchViewController supportsFullTextSearch](self, "supportsFullTextSearch")))
  {
    IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(v9);
  }
  else
  {
    IsEnabled_SearchAndDiscovery = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
  objc_msgSend(v11, "setHidden:", IsEnabled_SearchAndDiscovery);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController"));
  if (!v12)
  {
    -[SearchViewController addChildViewController:](self, "addChildViewController:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v13, "addSubview:", v14);

    objc_msgSend(v6, "didMoveToParentViewController:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v40[0] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
    v40[1] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v40[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    v40[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v24 = objc_msgSend(v23, "containeeLayout");

  if (v24 == (id)3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v25, "wantsLayout:animated:", 2, 1);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v26, "updateHeightForCurrentLayout");

  objc_msgSend(v7, "setShowsCancelButton:animated:", 0, 1);
}

- (void)addCloseSearchResultsButtonBesidesSearchBar:(id)a3
{
  id v4;
  CardButton *v5;
  void *v6;
  CardButton *v7;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v4 = a3;
  if (!-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
  {
    v5 = [CardButton alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
    v7 = -[CardButton initWithConfiguration:](v5, "initWithConfiguration:", v6);
    -[SearchViewController setCloseSearchResultsButton:](self, "setCloseSearchResultsButton:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("closeSearchResultsButton"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "closeSearchResultsButtonAction:", 64);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v11, "addSubview:", v12);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v24[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    v24[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    v4 = v20;
  }

}

- (void)updateCloseSearchResultEntryPointButton:(id)a3 searchBarToButtonSpacing:(double)a4 userButtonWidth:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  double v12;
  int v13;
  double v14;
  id v15;

  v15 = a3;
  if (sub_1002A8AA0(self) != 5 && !-[SearchViewController isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController view](self, "view"));
    v9 = objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    v11 = objc_msgSend(v10, "isHidden");

    if (v9 == (id)1)
      v12 = a5 + a4 * 2.0;
    else
      v12 = 16.0;
    if (v9 == (id)1)
      v13 = 1;
    else
      v13 = v11;
    if (v11)
      v12 = 16.0;
    if (v13)
      v14 = 16.0;
    else
      v14 = a5 + a4 * 2.0;
    objc_msgSend(v15, "setContentInset:", 17.0, v12, 17.0, v14);
  }

}

- (void)closeSearchResultsButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController searchResultsViewController](self, "searchResultsViewController", a3));
  if (v4)
  {
    +[SearchResultsAnalyticsManager logCloseSearchResults](SearchResultsAnalyticsManager, "logCloseSearchResults");
    objc_msgSend(v4, "willMoveToParentViewController:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v4, "removeFromParentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController closeSearchResultsButton](self, "closeSearchResultsButton"));
    objc_msgSend(v6, "setHidden:", 1);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A9B2DC;
    v12[3] = &unk_1011AC860;
    v12[4] = self;
    v7 = objc_retainBlock(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "applyWithAnimations:completion:", v7, &stru_1011E1430);

  }
  else
  {
    v9 = sub_10043222C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Tried to close search results when they were not present.", v11, 2u);
    }

  }
}

- (id)searchResultsViewController
{
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (sub_1002A8AA0(self) == 5)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController childViewControllers](self, "childViewControllers"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100A9B414;
  v11 = sub_100A9B424;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A9B42C;
  v6[3] = &unk_1011E1458;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

@end
