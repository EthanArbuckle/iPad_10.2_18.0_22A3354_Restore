@implementation MainWindowRootViewController

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double MidY;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  char IsLeftToRight;
  double v22;
  double v23;
  id v24;
  CGRect v25;

  -[MainWindowContentContainerViewController layoutSegmentedControl](self->_secondaryContainerVC, "layoutSegmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowControlHeaderView superview](self->_headerView, "superview"));

  if (v3)
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self->_rootNavigationController, "viewSwitcher"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    objc_msgSend(v24, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", v24);
    MidY = CGRectGetMidY(v25);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    +[MainWindowRootViewController minimumStandardWindowWidth](MainWindowRootViewController, "minimumStandardWindowWidth");
    v10 = dbl_1001A18C0[v8 < v9];

    LODWORD(v6) = ((uint64_t (*)(void))CalInterfaceIsLeftToRight)();
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v12;
    v15 = v14;

    if ((_DWORD)v6)
      v16 = v13;
    else
      v16 = v15;
    v17 = v10 + v16;
    v18 = -[MainWindowControlHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    v20 = v19;
    IsLeftToRight = CalInterfaceIsLeftToRight(v18);
    if ((IsLeftToRight & 1) != 0)
    {
      v22 = 0.0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v11, "bounds");
      v22 = v23 - v17;
    }
    -[MainWindowControlHeaderView setFrame:](self->_headerView, "setFrame:", v22, MidY + v20 * -0.5, v17, v20);
    if ((IsLeftToRight & 1) == 0)

    if (!self->_isEndingSearch)
      -[MainWindowRootViewController layoutSearchControl](self, "layoutSearchControl");

  }
}

- (void)willEnterForeground
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  -[MainWindowRootViewController setupSearchControlForTraitCollection:](self, "setupSearchControlForTraitCollection:", v3);

  -[MainWindowContentContainerViewController layoutSegmentedControl](self->_secondaryContainerVC, "layoutSegmentedControl");
}

- (void)setCurrentSidebarState:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  unint64_t currentSidebarState;
  void *v8;
  CalendarsViewControllerPreservedState *calendarsPreservedState;
  _QWORD *v10;
  id v11;
  void *v12;
  UINavigationController *primaryVC;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  MainWindowRootViewController *v30;
  id v31;
  _QWORD v32[6];
  _QWORD v33[4];
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  id v37;

  v6 = (void (**)(id, _QWORD))a4;
  if (!self->_didAppear || -[UISplitViewController isCollapsed](self->_splitViewController, "isCollapsed"))
  {
    if (self->_currentSidebarState != a3)
    {
      self->_needsSidebarSetup = 1;
      self->_pendingState = a3;
    }
    if (v6)
      v6[2](v6, 0);
    goto LABEL_33;
  }
  if (!a3)
    goto LABEL_16;
  if (a3 != 1)
  {
    currentSidebarState = self->_currentSidebarState;
    goto LABEL_15;
  }
  currentSidebarState = self->_currentSidebarState;
  if (currentSidebarState != 1)
    goto LABEL_15;
  if (!self->_calendarsPreservedState)
  {
    currentSidebarState = 1;
LABEL_15:
    if (currentSidebarState != a3)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController viewControllerForSidebarState:](self, "viewControllerForSidebarState:", a3));
      if (v11)
      {
        if (self->_currentSidebarState == 2)
          -[MainWindowRootViewController inboxWillDismiss](self, "inboxWillDismiss");
        primaryVC = self->_primaryVC;
        v37 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
        -[UINavigationController setViewControllers:](primaryVC, "setViewControllers:", v14);

        if (self->_currentSidebarState)
        {
          v15 = objc_msgSend((id)objc_opt_class(self), "shouldHideInlineFocusBannerForSidebarState:", a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController paletteView](self->_rootNavigationController, "paletteView"));
          objc_msgSend(v16, "setShouldHideInlineFocusBanner:", v15);

        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));

          if (v24)
          {

            goto LABEL_32;
          }
          self->_animatingSidebar = (id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)1;
          -[UISplitViewController showColumn:](self->_splitViewController, "showColumn:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1000DD154;
          v32[3] = &unk_1001B5078;
          v32[4] = self;
          v32[5] = a3;
          v26 = _NSConcreteStackBlock;
          v27 = 3221225472;
          v28 = sub_1000DD1F4;
          v29 = &unk_1001B2BE8;
          v30 = self;
          v31 = v11;
          objc_msgSend(v25, "animateAlongsideTransition:completion:", v32, &v26);

        }
        if (a3 == 3)
        {
          v17 = objc_alloc((Class)UIBarButtonItem);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));
          v20 = objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, self, "todayToolbarItemPressed");
          v36 = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
          objc_msgSend(v11, "setToolbarItems:", v21);

        }
        -[MainWindowRootViewController updatePrimaryViewControllerNavBar](self, "updatePrimaryViewControllerNavBar", v26, v27, v28, v29, v30);
        -[MainWindowRootViewController updatePrimaryViewControllerToolbar](self, "updatePrimaryViewControllerToolbar");
      }
      self->_currentSidebarState = a3;

LABEL_30:
      self->_animatingSidebar = 0;
      -[MainWindowControlHeaderView updateButtonStateForSidebar:](self->_headerView, "updateButtonStateForSidebar:", self->_currentSidebarState);
      if (v6)
        ((void (**)(id, id))v6)[2](v6, v11);
      goto LABEL_32;
    }
LABEL_16:
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000DD084;
    v35[3] = &unk_1001B2538;
    v35[4] = self;
    v10 = objc_retainBlock(v35);
    if ((id)-[UISplitViewController displayMode](self->_splitViewController, "displayMode") == (id)1)
      goto LABEL_17;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));

    if (!v12)
    {
      if (self->_currentSidebarState == 2)
        -[MainWindowRootViewController inboxWillDismiss](self, "inboxWillDismiss");
      self->_animatingSidebar = (id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)1;
      -[UISplitViewController hideColumn:](self->_splitViewController, "hideColumn:", 0);
      v22 = objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
      if (v22)
      {
        v23 = (void *)v22;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000DD148;
        v33[3] = &unk_1001B2BC0;
        v34 = v10;
        objc_msgSend(v23, "animateAlongsideTransition:completion:", v33, 0);

        goto LABEL_18;
      }
LABEL_17:
      ((void (*)(_QWORD *))v10[2])(v10);
LABEL_18:
      self->_currentSidebarState = 0;

      v11 = 0;
      goto LABEL_30;
    }

    v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
  objc_msgSend(v8, "restorePreservedState:", self->_calendarsPreservedState);
  calendarsPreservedState = self->_calendarsPreservedState;
  self->_calendarsPreservedState = 0;

  if (v6)
    v6[2](v6, 0);

LABEL_33:
}

- (void)updateInboxCount
{
  NSObject *notificationQ;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  _QWORD block[5];

  notificationQ = self->_notificationQ;
  if (!notificationQ)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.notificationUpdateQ", 0);
    v5 = self->_notificationQ;
    self->_notificationQ = v4;

    notificationQ = self->_notificationQ;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000954C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async(notificationQ, block);
}

- (void)updateNewEventButtonEnabledness
{
  NSObject *buttonQ;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  _QWORD v6[6];
  _QWORD v7[3];
  char v8;

  buttonQ = self->_buttonQ;
  if (!buttonQ)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.buttonUpdateQ", 0);
    v5 = self->_buttonQ;
    self->_buttonQ = v4;

    buttonQ = self->_buttonQ;
  }
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004C20;
  v6[3] = &unk_1001B2E60;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(buttonQ, v6);
  _Block_object_dispose(v7, 8);
}

- (void)layoutSearchControl
{
  id *p_searchBar;
  void *v4;
  void *v5;
  void *v6;
  double MidY;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  UIButton *searchButton;
  void *v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  CGRect v43;

  p_searchBar = (id *)&self->_searchBar;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar superview](self->_searchBar, "superview"));
  if (v4)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton superview](self->_searchButton, "superview"));

    if (!v5)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self->_rootNavigationController, "viewSwitcher"));
  objc_msgSend(v6, "frame");
  MidY = CGRectGetMidY(v43);

  LODWORD(v6) = CalInterfaceIsLeftToRight(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;
  v13 = v12;

  if ((_DWORD)v6)
    v14 = v13;
  else
    v14 = v11;
  v15 = v14 + 16.0;
  if (*p_searchBar)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_searchBar, "superview"));

    if (v16)
    {
      objc_msgSend(*p_searchBar, "sizeToFit");
      -[MainWindowRootViewController searchFieldWidth](self, "searchFieldWidth");
      v18 = v17;
      objc_msgSend(*p_searchBar, "layoutMargins");
      v20 = v19;
      v22 = v21;
      if (self->_isSearching)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy"));
        +[MainWindowRootViewController sidebarWidthForViewHierarchy:](MainWindowRootViewController, "sidebarWidthForViewHierarchy:", v23);
        v18 = v24 - (v15 + 16.0);

      }
      v25 = v22 + v20 + v18;
      v26 = objc_msgSend(*p_searchBar, "frame");
      v28 = v27;
      if ((CalInterfaceIsLeftToRight(v26) & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
        objc_msgSend(v29, "bounds");
        v15 = v30 - v25 - (v15 - v22);

      }
      else
      {
        v15 = v15 - v20;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
      if ((EKUIUsesLargeTextLayout(v39, v40) & 1) != 0)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
        objc_msgSend(v41, "safeAreaInsets");
        v38 = v42;

      }
      else
      {
        v38 = MidY + v28 * -0.5;
      }

LABEL_24:
      objc_msgSend(*p_searchBar, "setFrame:", v15, v38, v25, v28);
      return;
    }
  }
  p_searchBar = (id *)&self->_searchButton;
  searchButton = self->_searchButton;
  if (searchButton)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton superview](searchButton, "superview"));

    if (v32)
    {
      objc_msgSend(*p_searchBar, "sizeToFit");
      v33 = objc_msgSend(*p_searchBar, "frame");
      v25 = v34;
      v28 = v35;
      if (CalInterfaceIsLeftToRight(v33))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
        objc_msgSend(v36, "bounds");
        v15 = v37 - v25 - v15;

      }
      v38 = MidY + v28 * -0.5;
      goto LABEL_24;
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  MainWindowControlHeaderView *headerView;
  void *v7;
  double v8;
  objc_super v9;

  v3 = a3;
  self->_didAppear = 1;
  if (self->_needsSidebarSetup)
  {
    if ((-[UISplitViewController _isCollapsed](self->_splitViewController, "_isCollapsed") & 1) == 0)
      -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", self->_pendingState);
    self->_needsSidebarSetup = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  -[MainWindowRootViewController setupSearchControlForTraitCollection:](self, "setupSearchControlForTraitCollection:", v5);

  -[MainWindowRootViewController layoutSearchControl](self, "layoutSearchControl");
  headerView = self->_headerView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  -[MainWindowControlHeaderView layoutForWidth:](headerView, "layoutForWidth:", v8);

  -[MainWindowRootViewController updateNewEventButtonEnabledness](self, "updateNewEventButtonEnabledness");
  v9.receiver = self;
  v9.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController viewDidAppear:](&v9, "viewDidAppear:", v3);
}

- (void)updateErrorState
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceForSelectedIdentity"));
  v6 = (uint64_t)objc_msgSend(v3, "displayableAccountErrorsForSource:", v5) > 0;

  -[MainWindowControlHeaderView updateErrorState:](self->_headerView, "updateErrorState:", v6);
}

- (void)setupSearchControlForTraitCollection:(id)a3
{
  UISearchBar *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  UIButton *searchButton;
  void *v10;
  void *v11;
  UIButton *v12;
  UIButton *v13;
  UIButton *v14;
  UILargeContentViewerInteraction *v15;
  id v16;

  v16 = a3;
  if (-[MainWindowRootViewController showsSearchBarForTraitCollection:](self, "showsSearchBarForTraitCollection:")
    || self->_isSearching)
  {
    -[MainWindowRootViewController createSearchBarIfNeeded](self, "createSearchBarIfNeeded");
    v4 = self->_searchBar;
    v5 = 72;
  }
  else
  {
    searchButton = self->_searchButton;
    if (!searchButton)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v10));
      v12 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      v13 = self->_searchButton;
      self->_searchButton = v12;

      -[UIButton addTarget:action:forControlEvents:](self->_searchButton, "addTarget:action:forControlEvents:", self, "searchButtonTapped:", 64);
      -[UIButton setImage:forState:](self->_searchButton, "setImage:forState:", v11, 0);
      -[UIButton setShowsLargeContentViewer:](self->_searchButton, "setShowsLargeContentViewer:", 1);
      v14 = self->_searchButton;
      v15 = objc_opt_new(UILargeContentViewerInteraction);
      -[UIButton addInteraction:](v14, "addInteraction:", v15);

      -[UIButton setAccessibilityIdentifier:](self->_searchButton, "setAccessibilityIdentifier:", CFSTR("search-button"));
      searchButton = self->_searchButton;
    }
    v4 = searchButton;
    v5 = 64;
  }
  v6 = *(id *)((char *)&self->super.super.super.isa + v5);
  if (objc_msgSend(v16, "horizontalSizeClass") == (id)2)
  {
    objc_msgSend(v6, "removeFromSuperview");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar superview](v4, "superview"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v8, "addSubview:", v4);

    }
  }
  else
  {
    -[UISearchBar removeFromSuperview](self->_searchBar, "removeFromSuperview");
    -[UIButton removeFromSuperview](self->_searchButton, "removeFromSuperview");
  }

}

- (BOOL)showsSearchBarForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v6 = EKUICurrentWindowWidthWithViewHierarchy();

  v8 = v6 > 750.0 && (EKUIUsesLargeTextLayout(v4, v7) & 1) == 0 && objc_msgSend(v4, "userInterfaceIdiom") != 0;
  return v8;
}

- (MainWindowRootViewController)initWithRootNavigationController:(id)a3
{
  id v5;
  MainWindowRootViewController *v6;
  MainWindowRootViewController *v7;
  id *p_rootNavigationController;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MainWindowRootViewController;
  v6 = -[MainWindowRootViewController init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    p_rootNavigationController = (id *)&v6->_rootNavigationController;
    objc_storeStrong((id *)&v6->_rootNavigationController, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = CUIKCalendarModelNotificationCountsChangedNotification;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_notificationCountChanged:", v10, v11);

    v12 = CUIKCalendarModelIdentityChangedNotification;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_identityChanged:", v12, v13);

    v14 = CUIKCalendarModelDelegatesChangedNotification;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_delegatesChanged:", v14, v15);

    v16 = CUIKCalendarModelCalendarsChangedNotification;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_calendarsChanged:", v16, v17);

    v18 = CUIKCalendarModelAccountErrorCountChangedNotification;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_calendarErrorCountChanged:", v18, v19);

    v20 = CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "model"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_updateAfterExtendedLaunch:", v20, v21);

    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "_updateAfterExtendedLaunch:", CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UISplitViewController *v6;
  UISplitViewController *splitViewController;
  UINavigationController *v8;
  UINavigationController *primaryVC;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MainWindowContentContainerViewController *v15;
  MainWindowContentContainerViewController *secondaryContainerVC;
  MainWindowWrapperNavigationController *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MainWindowControlHeaderView *v21;
  double y;
  double width;
  double height;
  MainWindowControlHeaderView *v25;
  MainWindowControlHeaderView *headerView;
  MasterNavigationPaletteView *v27;
  MasterNavigationPaletteView *paletteView;
  void *v29;
  void *v30;
  MasterNavigationPaletteView *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _UINavigationBarPalette *v48;
  _UINavigationBarPalette *palette;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  RootNavigationController *rootNavigationController;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  MainWindowWrapperNavigationController *v64;
  objc_super v65;
  _QWORD v66[4];

  v65.receiver = self;
  v65.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController viewDidLoad](&v65, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (UISplitViewController *)objc_msgSend(objc_alloc((Class)UISplitViewController), "initWithStyle:", 1);
  splitViewController = self->_splitViewController;
  self->_splitViewController = v6;

  v8 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
  primaryVC = self->_primaryVC;
  self->_primaryVC = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_primaryVC, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_primaryVC, "navigationBar"));
  objc_msgSend(v13, "setBarTintColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_primaryVC, "navigationBar"));
  objc_msgSend(v14, "setForceFullHeightInLandscape:", 1);

  v15 = -[MainWindowContentContainerViewController initWithRootNavigationController:]([MainWindowContentContainerViewController alloc], "initWithRootNavigationController:", self->_rootNavigationController);
  secondaryContainerVC = self->_secondaryContainerVC;
  self->_secondaryContainerVC = v15;

  -[MainWindowContentContainerViewController setDelegate:](self->_secondaryContainerVC, "setDelegate:", self);
  v17 = -[MainWindowWrapperNavigationController initWithRootViewController:]([MainWindowWrapperNavigationController alloc], "initWithRootViewController:", self->_secondaryContainerVC);
  -[MainWindowWrapperNavigationController setNavigationBarHidden:animated:](v17, "setNavigationBarHidden:animated:", 1, 0);
  -[UISplitViewController setDelegate:](self->_splitViewController, "setDelegate:", self);
  -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", 1);
  -[UISplitViewController setPresentsWithGesture:](self->_splitViewController, "setPresentsWithGesture:", 0);
  v18 = objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy"));
  +[MainWindowRootViewController sidebarWidthForViewHierarchy:](MainWindowRootViewController, "sidebarWidthForViewHierarchy:", v18);
  -[UISplitViewController setMinimumPrimaryColumnWidth:](self->_splitViewController, "setMinimumPrimaryColumnWidth:");
  v63 = (void *)v18;
  +[MainWindowRootViewController sidebarWidthForViewHierarchy:](MainWindowRootViewController, "sidebarWidthForViewHierarchy:", v18);
  -[UISplitViewController setMaximumPrimaryColumnWidth:](self->_splitViewController, "setMaximumPrimaryColumnWidth:");
  -[UISplitViewController setViewController:forColumn:](self->_splitViewController, "setViewController:forColumn:", self->_primaryVC, 0);
  v64 = v17;
  -[UISplitViewController setViewController:forColumn:](self->_splitViewController, "setViewController:forColumn:", v17, 2);
  -[MainWindowRootViewController addChildViewController:](self, "addChildViewController:", self->_splitViewController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController view](self->_splitViewController, "view"));
  objc_msgSend(v19, "addSubview:", v20);

  -[UISplitViewController didMoveToParentViewController:](self->_splitViewController, "didMoveToParentViewController:", self);
  v21 = [MainWindowControlHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v25 = -[MainWindowControlHeaderView initWithFrame:](v21, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerView = self->_headerView;
  self->_headerView = v25;

  -[MainWindowControlHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  -[MainWindowRootViewController updateInboxCount](self, "updateInboxCount");
  v27 = -[MasterNavigationPaletteView initWithFrame:]([MasterNavigationPaletteView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  paletteView = self->_paletteView;
  self->_paletteView = v27;

  -[MasterNavigationPaletteView setTranslatesAutoresizingMaskIntoConstraints:](self->_paletteView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  -[MasterNavigationPaletteView setModel:](self->_paletteView, "setModel:", v29);

  -[MasterNavigationPaletteView setDelegate:](self->_paletteView, "setDelegate:", self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  -[MasterNavigationPaletteView setShowIdentity:](self->_paletteView, "setShowIdentity:", objc_msgSend(v30, "containsDelegateSources"));

  v31 = self->_paletteView;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  objc_msgSend(v32, "bounds");
  -[MasterNavigationPaletteView sizeThatFits:](v31, "sizeThatFits:", v33, v34);
  v36 = v35;
  v38 = v37;

  v39 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v36, v38);
  objc_msgSend(v39, "addSubview:", self->_paletteView);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView leadingAnchor](self->_paletteView, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v66[0] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView trailingAnchor](self->_paletteView, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v66[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView topAnchor](self->_paletteView, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  v66[2] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MasterNavigationPaletteView bottomAnchor](self->_paletteView, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  v66[3] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

  v48 = (_UINavigationBarPalette *)objc_msgSend(objc_alloc((Class)_UINavigationBarPalette), "initWithContentView:", v39);
  palette = self->_palette;
  self->_palette = v48;

  -[_UINavigationBarPalette setPreferredHeight:](self->_palette, "setPreferredHeight:", v38);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController paletteView](self->_rootNavigationController, "paletteView"));
  objc_msgSend(v50, "setDelegate:", self);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v52 = objc_msgSend(v51, "horizontalSizeClass");

  if (v52 == (id)2)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    objc_msgSend(v53, "addSubview:", self->_headerView);

    rootNavigationController = self->_rootNavigationController;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
    -[RootNavigationController setAvatarViewVisible:](rootNavigationController, "setAvatarViewVisible:", -[MainWindowRootViewController canShowAvatarViewWithTraitCollection:](self, "canShowAvatarViewWithTraitCollection:", v55));

  }
  else
  {
    -[UINavigationController setNavigationBarHidden:animated:](self->_primaryVC, "setNavigationBarHidden:animated:", 1, 0);
    -[RootNavigationController setAvatarViewVisible:](self->_rootNavigationController, "setAvatarViewVisible:", 0);
  }
  v56 = objc_msgSend((id)objc_opt_class(self), "shouldHideInlineFocusBannerForSidebarState:", self->_currentSidebarState);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController paletteView](self->_rootNavigationController, "paletteView"));
  objc_msgSend(v57, "setShouldHideInlineFocusBanner:", v56);

}

+ (double)sidebarWidthForViewHierarchy:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();
  result = 320.0;
  if (v3)
    return 375.0;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
  v5 = EKUIUseLargeFormatPhoneUI(v3, v4);
  v6 = objc_opt_class(AdaptiveSearchController);
  if (((objc_opt_isKindOfClass(v3, v6) & 1) != 0
     || v5 && self->_isSearching
     || -[MainWindowRootViewController _viewControllerExistsInPresentationChainThatShouldNotRotate](self, "_viewControllerExistsInPresentationChainThatShouldNotRotate"))&& (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view")), v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window")), v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene")), v10 = objc_msgSend(v9, "interfaceOrientation"), v9, v8, v7, v10))
  {
    v11 = 1 << (char)v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MainWindowRootViewController;
    v11 = -[MainWindowRootViewController supportedInterfaceOrientations](&v13, "supportedInterfaceOrientations");
  }

  return v11;
}

- (BOOL)_viewControllerExistsInPresentationChainThatShouldNotRotate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = objc_opt_class(QLPreviewController);
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = objc_msgSend(v3, "containsObject:", objc_opt_class(v6));
      if ((v7 & 1) != 0)
        break;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

      v6 = (void *)v8;
    }
    while (v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)focusFilterMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  v3 = objc_msgSend(v2, "focusFilterMode");

  return (unint64_t)v3;
}

- (id)ekui_futureTraitCollection
{
  return -[RootNavigationController ekui_futureTraitCollection](self->_rootNavigationController, "ekui_futureTraitCollection");
}

- (void)setCurrentSidebarState:(unint64_t)a3
{
  -[MainWindowRootViewController setCurrentSidebarState:completion:](self, "setCurrentSidebarState:completion:", a3, 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_updateAfterExtendedLaunch:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012B6C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (BOOL)shouldHideInlineFocusBannerForSidebarState:(unint64_t)a3
{
  return a3 - 1 < 2;
}

+ (double)minimumStandardWindowWidth
{
  return 750.0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController dealloc](&v4, "dealloc");
}

- (id)traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "horizontalSizeClass") == (id)1 && objc_msgSend(v3, "verticalSizeClass") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollectionByModifyingTraits:", &stru_1001B4FB0));
  else
    v4 = 0;

  return v4;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CalendarsViewControllerPreservedState *v22;
  CalendarsViewControllerPreservedState *calendarsPreservedState;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Class v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  Class v34;
  char isKindOfClass;
  void *v36;
  CalendarsViewControllerPreservedState *v37;
  CalendarsViewControllerPreservedState *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  BOOL v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  MainWindowRootViewController *v48;
  id v49;
  id v50;
  uint64_t *v51;
  BOOL v52;
  _QWORD v53[6];
  BOOL v54;
  BOOL v55;
  BOOL v56;
  CGAffineTransform v57;
  objc_super v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;

  v6 = a3;
  v7 = a4;
  if ((-[MainWindowRootViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:](self, "traitCollectionToUseWhileLoadingViewsDuringTransitioningToTraitCollection:", v6));
    if (v8)
    {
      -[MainWindowRootViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v9, "setNeedsLayout");

      -[MainWindowRootViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", 0);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v10, "setNeedsLayout");

    }
  }
  v45 = v7;
  v11 = objc_msgSend(v6, "horizontalSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v13 = objc_msgSend(v12, "horizontalSizeClass");

  v14 = objc_msgSend(v6, "horizontalSizeClass");
  v43 = v14 == (id)2;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
  v18 = objc_msgSend(v17, "activationState");
  v44 = v18 == (id)2;

  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  -[UINavigationController setNavigationBarHidden:animated:](self->_primaryVC, "setNavigationBarHidden:animated:", v14 != (id)2, 0);
  -[MainWindowRootViewController setupSearchControlForTraitCollection:](self, "setupSearchControlForTraitCollection:", v6);
  if (v18 == (id)2)
    v19 = 0;
  else
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController firstResponder](self, "firstResponder"));
  if (v11 != v13 && v14 == (id)2)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));
    if (!v20)
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
    objc_opt_class(CalendarsViewController);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v22 = (CalendarsViewControllerPreservedState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "preservedState"));
      calendarsPreservedState = self->_calendarsPreservedState;
      self->_calendarsPreservedState = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentingViewController"));
      objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 0, 0);

      v25 = 0;
      v60[3] = 1;
    }
    else
    {
      objc_opt_class(InboxViewController);
      if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0)
      {
        -[RootNavigationController dismissViewControllerAnimated:completion:](self->_rootNavigationController, "dismissViewControllerAnimated:completion:", 0, 0);
        v60[3] = 2;
        objc_storeStrong((id *)&self->_presentedInboxVC, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController displayedDetailViewControllers](self->_presentedInboxVC, "displayedDetailViewControllers"));
      }
      else
      {
        v25 = 0;
      }
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    objc_msgSend(v31, "addSubview:", self->_headerView);

    goto LABEL_28;
  }
  if (v11 == v13)
  {
    v25 = 0;
    goto LABEL_29;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
  if ((id)-[MainWindowRootViewController currentSidebarState](self, "currentSidebarState") == (id)1)
  {
    objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v20, v26) & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewControllers"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
      v29 = NSClassFromString(CFSTR("EKCalendarEditor"));
      if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
      {

LABEL_26:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
        v37 = (CalendarsViewControllerPreservedState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "preservedState"));
        v38 = self->_calendarsPreservedState;
        self->_calendarsPreservedState = v37;

        -[MainWindowRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
        goto LABEL_27;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewControllers"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstObject"));
      v34 = NSClassFromString(CFSTR("EKSubscribedCalendarEditor"));
      isKindOfClass = objc_opt_isKindOfClass(v33, v34);

      if ((isKindOfClass & 1) != 0)
        goto LABEL_26;
    }
  }
LABEL_27:
  -[MainWindowControlHeaderView removeFromSuperview](self->_headerView, "removeFromSuperview");
  v25 = 0;
LABEL_28:

LABEL_29:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController overrideTraitCollectionForChildViewController:](self->_splitViewController, "overrideTraitCollectionForChildViewController:", self->_primaryVC));
  -[UISplitViewController setOverrideTraitCollection:forChildViewController:](self->_splitViewController, "setOverrideTraitCollection:forChildViewController:", 0, self->_primaryVC);
  v58.receiver = self;
  v58.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v58, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v45);
  if (v45)
    objc_msgSend(v45, "targetTransform");
  else
    memset(&v57, 0, sizeof(v57));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000DB708;
  v53[3] = &unk_1001B5000;
  v54 = v43;
  v55 = !CGAffineTransformIsIdentity(&v57);
  v56 = v44;
  v53[4] = self;
  v53[5] = &v59;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000DB88C;
  v46[3] = &unk_1001B5028;
  v40 = v19;
  v47 = v40;
  v48 = self;
  v41 = v39;
  v49 = v41;
  v51 = &v59;
  v52 = v44;
  v42 = v25;
  v50 = v42;
  objc_msgSend(v45, "animateAlongsideTransition:completion:", v53, v46);

  _Block_object_dispose(&v59, 8);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  BOOL IsIdentity;
  long double v10;
  long double v11;
  double v12;
  UISplitViewControllerSplitBehavior v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  _QWORD v39[6];
  BOOL v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGAffineTransform v47;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    IsIdentity = CGAffineTransformIsIdentity(&v47);
    objc_msgSend(v8, "targetTransform");
    v10 = *((double *)&v44 + 1);
    objc_msgSend(v8, "targetTransform");
    v11 = *(double *)&v41;
  }
  else
  {
    memset(&v47, 0, sizeof(v47));
    IsIdentity = CGAffineTransformIsIdentity(&v47);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = 0.0;
    v10 = 0.0;
  }
  v12 = atan2(v10, v11) * 57.2957795;
  if (!self->_currentSidebarState)
  {
    v37 = 1;
    goto LABEL_34;
  }
  v13 = -[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));
  v17 = objc_msgSend(v16, "activationState");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v19 = objc_msgSend(v18, "horizontalSizeClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v21 = objc_msgSend(v20, "horizontalSizeClass");

  if (v19 != v21 || v17 == (id)2)
  {
    if (v19 == v21)
      goto LABEL_8;
LABEL_33:
    v37 = 0;
    goto LABEL_34;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));

  if (!v22)
    goto LABEL_33;
LABEL_8:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy"));
  v29 = (char *)objc_msgSend(v28, "ekui_interfaceOrientation") - 3 < (char *)2 && v17 == (id)2;
  if (v29)
    v30 = 1;
  else
    v30 = v13;
  v31 = fabs(v12);
  if (width >= height)
    v32 = height;
  else
    v32 = width;
  if (v25 >= v27)
    v33 = v27;
  else
    v33 = v25;
  v34 = v32 == v33 && v30 == 2;
  v35 = 2;
  if (!v34)
    v35 = 3;
  v29 = v30 == 2;
  v36 = 2;
  if (v29)
    v36 = 3;
  if (v31 == 180.0)
    v37 = v36;
  else
    v37 = v35;

LABEL_34:
  -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", v37);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000DBDE0;
  v39[3] = &unk_1001B5050;
  v40 = !IsIdentity;
  *(double *)&v39[5] = v12;
  v39[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v39, 0);
  v38.receiver = self;
  v38.super_class = (Class)MainWindowRootViewController;
  -[MainWindowRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v38, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

}

- (void)splitViewController:(id)a3 willExpandToProposedDisplayMode:(int64_t *)a4
{
  UISplitViewControllerSplitBehavior v6;
  int64_t v7;

  if (self->_currentSidebarState)
  {
    v6 = -[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior", a3);
    v7 = 2;
    if (v6 == UISplitViewControllerSplitBehaviorOverlay)
      v7 = 3;
    *a4 = v7;
    -[MainWindowRootViewController updatePrimaryViewControllerToolbar](self, "updatePrimaryViewControllerToolbar");
  }
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t currentSidebarState;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v6 = a3;
  if (!a4
    && self->_currentSidebarState
    && !-[UISplitViewController isCollapsed](self->_splitViewController, "isCollapsed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
    v10 = objc_msgSend(v9, "activationState");

    currentSidebarState = self->_currentSidebarState;
    if (v10 != (id)2)
    {
      if (currentSidebarState == 2)
        -[MainWindowRootViewController inboxWillDismiss](self, "inboxWillDismiss");
      currentSidebarState = 0;
      self->_currentSidebarState = 0;
    }
    -[MainWindowControlHeaderView updateButtonStateForSidebar:](self->_headerView, "updateButtonStateForSidebar:", currentSidebarState);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000DC060;
    v15[3] = &unk_1001B2538;
    v15[4] = self;
    v12 = objc_retainBlock(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
      objc_msgSend(v14, "animateAlongsideTransition:completion:", v12, 0);

    }
    else
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }

  }
}

- (void)setEkui_futureTraitCollection:(id)a3
{
  -[RootNavigationController setEkui_futureTraitCollection:](self->_rootNavigationController, "setEkui_futureTraitCollection:", a3);
}

- (CGSize)mainContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController view](self->_rootNavigationController, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)continueSearchWithTerm:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)1)
    -[RootNavigationController continueSearchWithTerm:animated:removeViewControllersIncapableOfSearchIfNeeded:](self->_rootNavigationController, "continueSearchWithTerm:animated:removeViewControllersIncapableOfSearchIfNeeded:", v6, 1, 1);
  else
    -[MainWindowContentContainerViewController continueSearchWithTerm:](self->_secondaryContainerVC, "continueSearchWithTerm:", v6);

}

- (void)showAddEvent
{
  RootNavigationController *rootNavigationController;
  id v3;

  rootNavigationController = self->_rootNavigationController;
  v3 = -[MainWindowControlHeaderView newEventBarButtonItem](self->_headerView, "newEventBarButtonItem");
  -[RootNavigationController showAddEventAnimated:fromBarButtonItem:](rootNavigationController, "showAddEventAnimated:fromBarButtonItem:", 0, v3);

}

- (void)showAddEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 location:(id)a6 suggestionsKey:(id)a7 allDay:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v19, "horizontalSizeClass") == (id)2)
    v21 = -[MainWindowControlHeaderView newEventBarButtonItem](self->_headerView, "newEventBarButtonItem");
  else
    v21 = 0;

  LOBYTE(v20) = a8;
  -[RootNavigationController showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:](self->_rootNavigationController, "showAddEventAnimated:fromBarButtonItem:withTitle:startDate:exactStartDate:endDate:location:suggestionKey:allDay:completion:", 1, v21, v18, 0, v17, v16, v15, v14, v20, 0);

}

+ (id)sanitizeCalSubCal:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("calsubcal"));

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resourceSpecifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingPercentEncoding"));

    if (v7)
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    else
      v8 = v3;
    v9 = v8;

  }
  else
  {
    v9 = v3;
  }

  return v9;
}

- (void)handleURL:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "horizontalSizeClass");

  if (v10 == (id)2)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("calinvitelist")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
      v12 = objc_msgSend(v11, "allEventNotificationsCount");

      if (v12)
      {
        -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 2);
        goto LABEL_23;
      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v13, "horizontalSizeClass") == (id)2)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("calsubcal")) & 1) != 0)
    {

LABEL_18:
      if (self->_currentSidebarState != 1)
        -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowRootViewController sanitizeCalSubCal:](MainWindowRootViewController, "sanitizeCalSubCal:", v6));
      if (v18)
      {
        -[MainWindowContentContainerViewController cancelSearch](self->_secondaryContainerVC, "cancelSearch");
        objc_msgSend(v17, "showAddSubscribedCalendarWithURL:", v18);
      }

      goto LABEL_23;
    }
    v16 = objc_msgSend(v8, "isEqualToString:", CFSTR("webcal"));

    if ((v16 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  if (v10 == (id)2
    && objc_msgSend(v8, "isEqualToString:", CFSTR("calshow"))
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host")),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("familyCalendar")),
        v14,
        v15))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000DC680;
    v19[3] = &unk_1001B4FD8;
    v19[4] = self;
    -[MainWindowRootViewController showCalendarsViewWithCompletion:](self, "showCalendarsViewWithCompletion:", v19);
  }
  else
  {
    if (self->_currentSidebarState
      && (id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)2)
    {
      -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 0);
    }
    -[MainWindowContentContainerViewController cancelSearch](self->_secondaryContainerVC, "cancelSearch");
    -[RootNavigationController handleURL:context:](self->_rootNavigationController, "handleURL:context:", v6, v7);
  }
LABEL_23:

}

- (void)createSearchBarIfNeeded
{
  MainWindowSearchBar *v3;
  UISearchBar *searchBar;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_searchBar)
  {
    v3 = -[MainWindowSearchBar initWithFrame:]([MainWindowSearchBar alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    searchBar = self->_searchBar;
    self->_searchBar = &v3->super;

    *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Placeholder used in the search bar in the calendar occurrences list"), CFSTR("Search"), 0));
    -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v8);

    -[UISearchBar setDrawsBackground:](self->_searchBar, "setDrawsBackground:", 0);
    -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self->_secondaryContainerVC);
    -[UISearchBar _setAutoDisableCancelButton:](self->_searchBar, "_setAutoDisableCancelButton:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchField](self->_searchBar, "searchField"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("search-bar"));

    -[MainWindowContentContainerViewController setSearchBar:](self->_secondaryContainerVC, "setSearchBar:", self->_searchBar);
  }
}

- (double)searchFieldWidth
{
  void *v2;
  double v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v3 = EKUICurrentWindowWidthWithViewHierarchy(v2);

  if (v3 > 875.0)
    return 223.0;
  if (v3 > 800.0)
    return 193.0;
  result = 0.0;
  if (v3 > 750.0)
    return 172.0;
  return result;
}

- (void)searchButtonTapped:(id)a3
{
  -[MainWindowRootViewController searchButtonTappedCreateAndAddSearchBar:](self, "searchButtonTappedCreateAndAddSearchBar:", 1);
}

- (void)searchButtonTappedCreateAndAddSearchBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  if (!self->_isEndingSearch)
  {
    v3 = a3;
    -[UIButton removeFromSuperview](self->_searchButton, "removeFromSuperview");
    if (v3)
    {
      -[MainWindowRootViewController createSearchBarIfNeeded](self, "createSearchBarIfNeeded");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v5, "addSubview:", self->_searchBar);

    }
    self->_isSearching = 1;
    -[UISearchBar setShowsCancelButton:animated:](self->_searchBar, "setShowsCancelButton:animated:", 1, 0);
    if (v3)
    {
      -[MainWindowRootViewController layoutSearchControl](self, "layoutSearchControl");
      -[UISearchBar layoutIfNeeded](self->_searchBar, "layoutIfNeeded");
      v6 = -[UISearchBar frame](self->_searchBar, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      if ((CalInterfaceIsLeftToRight(v6) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
        objc_msgSend(v13, "bounds");
        v15 = v14;

      }
      else
      {
        v15 = -v10;
      }
      -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v15, v8, v10, v12);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController startSearch](self->_secondaryContainerVC, "startSearch"));
    v17[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000DCAD8;
    v18[3] = &unk_1001B2C38;
    v18[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DCAE0;
    v17[3] = &unk_1001B2C38;
    objc_msgSend(v16, "animateAlongsideTransition:completion:", v18, v17);

  }
}

- (void)updatePrimaryViewControllerNavBar
{
  void *v3;
  id v4;
  double v5;
  _UINavigationBarPalette *palette;
  void *v7;
  void *v8;
  _UINavigationBarPalette *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 == (id)2)
  {
    -[MasterNavigationPaletteView sizeToFit](self->_paletteView, "sizeToFit");
    -[MasterNavigationPaletteView frame](self->_paletteView, "frame");
    -[_UINavigationBarPalette setPreferredHeight:](self->_palette, "setPreferredHeight:", v5);
    palette = self->_palette;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
    v8 = v7;
    v9 = palette;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "_setBottomPalette:", v9);

}

- (void)updatePrimaryViewControllerToolbar
{
  unsigned int v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___SideBarViewController)
    && (objc_opt_respondsToSelector(v5, "toolbarVisibleInSplitBehavior:") & 1) != 0)
  {
    v3 = objc_msgSend(v5, "toolbarVisibleInSplitBehavior:", -[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toolbarItems"));
    v3 = v4 != 0;

  }
  -[UINavigationController setToolbarHidden:](self->_primaryVC, "setToolbarHidden:", v3 ^ 1);

}

- (BOOL)canShowAvatarViewWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  if (objc_msgSend(v5, "containsDelegateSources"))
    v6 = objc_msgSend(v4, "horizontalSizeClass") == (id)2;
  else
    v6 = 0;

  return v6;
}

- (id)viewControllerForSidebarState:(unint64_t)a3
{
  CalendarsViewController *v4;
  void *v5;
  CompactListViewController *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  CompactListViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  InboxViewController *presentedInboxVC;
  void *v17;
  InboxViewController *v18;
  InboxSwitcherViewController *v19;
  void *v20;
  MasterNavigationPaletteView *paletteView;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  CompactListViewController *v27;

  switch(a3)
  {
    case 3uLL:
      v10 = [CompactListViewController alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
      v6 = -[ListViewController initWithModel:window:](v10, "initWithModel:window:", v11, v13);

      -[ListViewController setDelegate:](v6, "setDelegate:", self);
      -[ListViewController setOverrideExtendedEdges:](v6, "setOverrideExtendedEdges:", 0);
      -[ListViewController setDestination:](v6, "setDestination:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Today");
      goto LABEL_6;
    case 2uLL:
      presentedInboxVC = self->_presentedInboxVC;
      if (presentedInboxVC)
      {
        v6 = (CompactListViewController *)objc_claimAutoreleasedReturnValue(-[InboxViewController switcherViewController](presentedInboxVC, "switcherViewController"));
        -[CompactListViewController willMoveToParentViewController:](v6, "willMoveToParentViewController:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController view](v6, "view"));
        objc_msgSend(v17, "removeFromSuperview");

        -[CompactListViewController removeFromParentViewController](v6, "removeFromParentViewController");
        -[CompactListViewController setSwitcherDelegate:](v6, "setSwitcherDelegate:", self);
        -[ListViewController setDestination:](v6, "setDestination:", 2);
        v18 = self->_presentedInboxVC;
        self->_presentedInboxVC = 0;

      }
      else
      {
        v19 = [InboxSwitcherViewController alloc];
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
        v6 = -[InboxSwitcherViewController initWithModel:destination:](v19, "initWithModel:destination:", v20, 2);

        -[CompactListViewController setSwitcherDelegate:](v6, "setSwitcherDelegate:", self);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController segmentedControl](v6, "segmentedControl"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Inbox"), &stru_1001B67C0, 0));
      goto LABEL_12;
    case 1uLL:
      v4 = [CalendarsViewController alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
      v6 = -[CalendarsViewController initWithModel:destination:](v4, "initWithModel:destination:", v5, 2);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Calendars");
LABEL_6:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1001B67C0, 0));
      v15 = 0;
LABEL_12:

      goto LABEL_13;
  }
  v14 = 0;
  v15 = 0;
  v6 = 0;
LABEL_13:
  -[MasterNavigationPaletteView setTitle:](self->_paletteView, "setTitle:", v14);
  -[MasterNavigationPaletteView setSegmentedControl:](self->_paletteView, "setSegmentedControl:", v15);
  -[MasterNavigationPaletteView setNeedsLayout](self->_paletteView, "setNeedsLayout");
  -[MasterNavigationPaletteView layoutIfNeeded](self->_paletteView, "layoutIfNeeded");
  paletteView = self->_paletteView;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_primaryVC, "view"));
  objc_msgSend(v22, "bounds");
  -[MasterNavigationPaletteView sizeThatFits:](paletteView, "sizeThatFits:", v23, v24);

  -[_UINavigationBarPalette frame](self->_palette, "frame");
  -[_UINavigationBarPalette setFrame:](self->_palette, "setFrame:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController navigationItem](v6, "navigationItem"));
  objc_msgSend(v25, "_setAutoScrollEdgeTransitionDistance:", 16.0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CompactListViewController navigationItem](v6, "navigationItem"));
  objc_msgSend(v26, "_setManualScrollEdgeAppearanceEnabled:", 1);

  v27 = v6;
  return v27;
}

- (void)hideMainSideBar
{
  -[MainWindowRootViewController setCurrentSidebarState:completion:](self, "setCurrentSidebarState:completion:", 0, 0);
}

- (void)hideSearchSideBar
{
  -[MainWindowContentContainerViewController cancelSearch](self->_secondaryContainerVC, "cancelSearch");
}

- (void)showCalendarsSideBarWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if ((id)-[MainWindowRootViewController currentSidebarState](self, "currentSidebarState") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
    objc_opt_class(CalendarsViewController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
        v8 = v5;
      else
        v8 = 0;
      ((void (**)(id, void *))v4)[2](v4, v8);
    }

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000DD360;
    v9[3] = &unk_1001B50A0;
    v10 = v4;
    -[MainWindowRootViewController setCurrentSidebarState:completion:](self, "setCurrentSidebarState:completion:", 1, v9);

  }
}

- (void)calendarButtonTapped
{
  -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 1);
}

- (void)showInboxSideBarWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if ((id)-[MainWindowRootViewController currentSidebarState](self, "currentSidebarState") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
    objc_opt_class(InboxViewController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
        v8 = v5;
      else
        v8 = 0;
      ((void (**)(id, void *))v4)[2](v4, v8);
    }

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000DD4AC;
    v9[3] = &unk_1001B50A0;
    v10 = v4;
    -[MainWindowRootViewController setCurrentSidebarState:completion:](self, "setCurrentSidebarState:completion:", 2, v9);

  }
}

- (void)inboxButtonTapped
{
  -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 2);
}

- (void)showListSideBarWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if ((id)-[MainWindowRootViewController currentSidebarState](self, "currentSidebarState") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
    objc_opt_class(ListViewController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
        v8 = v5;
      else
        v8 = 0;
      ((void (**)(id, void *))v4)[2](v4, v8);
    }

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000DD5F8;
    v9[3] = &unk_1001B50A0;
    v10 = v4;
    -[MainWindowRootViewController setCurrentSidebarState:completion:](self, "setCurrentSidebarState:completion:", 3, v9);

  }
}

- (void)listButtonTapped
{
  -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 3);
}

- (void)newEventButtonTapped:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_isSearching)
    -[MainWindowContentContainerViewController cancelSearch](self->_secondaryContainerVC, "cancelSearch");
  -[RootNavigationController showAddEventAnimated:fromBarButtonItem:](self->_rootNavigationController, "showAddEventAnimated:fromBarButtonItem:", 1, v4);

}

- (void)todayToolbarItemPressed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
  v3 = CUIKTodayDate(v5, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "scrollToDate:animated:", v4, 1);

}

- (void)searchTapped
{
  id v3;

  -[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UISearchBar superview](self->_searchBar, "superview"));
  -[MainWindowRootViewController searchButtonTappedCreateAndAddSearchBar:](self, "searchButtonTappedCreateAndAddSearchBar:", v3 == 0);

}

- (void)searchBegan
{
  self->_isSearching = 1;
  -[MainWindowRootViewController layoutSearchControl](self, "layoutSearchControl");
  -[MainWindowRootViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)searchEnding
{
  void *v3;
  unsigned int v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  self->_isSearching = 0;
  self->_isEndingSearch = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v4 = -[MainWindowRootViewController showsSearchBarForTraitCollection:](self, "showsSearchBarForTraitCollection:", v3);

  if (v4)
  {
    -[MainWindowRootViewController layoutSearchControl](self, "layoutSearchControl");
  }
  else
  {
    v5 = -[UISearchBar frame](self->_searchBar, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if ((CalInterfaceIsLeftToRight(v5) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
      objc_msgSend(v12, "bounds");
      v14 = v13;

    }
    else
    {
      v14 = -v9;
    }
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v14, v7, v9, v11);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DD924;
    v17[3] = &unk_1001B2538;
    v17[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    v15 = dispatch_time(0, 100000000);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000DD97C;
    v16[3] = &unk_1001B2538;
    v16[4] = self;
    dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v16);
  }
  -[MainWindowRootViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)searchEnded
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  self->_isEndingSearch = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v4 = -[MainWindowRootViewController showsSearchBarForTraitCollection:](self, "showsSearchBarForTraitCollection:", v3);

  if ((v4 & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
    -[MainWindowRootViewController setupSearchControlForTraitCollection:](self, "setupSearchControlForTraitCollection:", v5);

  }
}

- (void)showEventAndCloseSidebarIfNeeded:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v6 = a4;
  v8 = a3;
  if (self->_currentSidebarState
    && (id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)2
    && (-[MainWindowRootViewController setCurrentSidebarState:](self, "setCurrentSidebarState:", 0),
        (v9 = objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"))) != 0))
  {
    v10 = (void *)v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000DDB94;
    v11[3] = &unk_1001B50C8;
    v11[4] = self;
    v14 = v6;
    v12 = v8;
    v13 = a5;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", v11, 0);

  }
  else
  {
    -[RootNavigationController showEvent:animated:showMode:context:](self->_rootNavigationController, "showEvent:animated:showMode:context:", v8, v6, a5, 0);
  }

}

- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3
{
  return 0;
}

- (BOOL)listViewControllerContainerHandlesShowEvent
{
  return 0;
}

- (BOOL)listViewControllerShouldShowEvent:(id)a3 showMode:(unint64_t)a4
{
  -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self, "showEventAndCloseSidebarIfNeeded:animated:showMode:", a3, 1, a4);
  return 0;
}

- (void)inboxWillDismiss
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v2, "endEditing:", 1);

  objc_msgSend(v3, "inboxWillDismiss");
}

- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4
{
  -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self, "showEventAndCloseSidebarIfNeeded:animated:showMode:", a4, 1, 1);
}

- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4
{
  -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self, "showEventAndCloseSidebarIfNeeded:animated:showMode:", a4, 1, 2);
}

- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  -[MainWindowRootViewController showEventAndCloseSidebarIfNeeded:animated:showMode:](self, "showEventAndCloseSidebarIfNeeded:animated:showMode:", a5, 1, 1);
}

- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:calendarModel:](EKUIAppReviewUtils, "displayReviewPromptIfNeededInScene:calendarModel:", v4, v5);

}

- (void)showIdentitySwitcherFromSourceView:(id)a3
{
  id v4;
  IdentitySwitcherViewController *v5;
  void *v6;
  IdentitySwitcherViewController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = [IdentitySwitcherViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  v7 = -[IdentitySwitcherViewController initWithModel:](v5, "initWithModel:", v6);

  -[IdentitySwitcherViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherViewController popoverPresentationController](v7, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v4);

  if (CalInterfaceIsLeftToRight(v9))
    v10 = 4;
  else
    v10 = 8;
  objc_msgSend(v8, "setPermittedArrowDirections:", v10);
  v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[83058884] Showing identity switcher", v12, 2u);
  }
  -[MainWindowRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)paletteTodayButtonTapped:(id)a3
{
  void *v4;

  -[RootNavigationController todayPressed](self->_rootNavigationController, "todayPressed", a3);
  if (self->_currentSidebarState == 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_primaryVC, "topViewController"));
    objc_msgSend(v4, "scrollToTodayAnimated:", 1);

  }
  -[MainWindowContentContainerViewController todayTapped](self->_secondaryContainerVC, "todayTapped");
}

- (void)paletteAvatarViewTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "avatarView"));
  -[MainWindowRootViewController showIdentitySwitcherFromSourceView:](self, "showIdentitySwitcherFromSourceView:", v4);

}

- (BOOL)paletteShouldShowAvatarView
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController ekui_futureTraitCollection](self->_rootNavigationController, "ekui_futureTraitCollection"));
  if (-[MainWindowRootViewController canShowAvatarViewWithTraitCollection:](self, "canShowAvatarViewWithTraitCollection:", v3))
  {
    v4 = self->_currentSidebarState == 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)palette:(id)a3 identitySwitcherTapped:(id)a4
{
  -[MainWindowRootViewController showIdentitySwitcherFromSourceView:](self, "showIdentitySwitcherFromSourceView:", a4);
}

- (void)setFocusFilterMode:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
  objc_msgSend(v4, "setFocusFilterMode:", a3);

}

- (void)_identityChanged:(id)a3
{
  MasterNavigationPaletteView *paletteView;
  void *v5;
  void *v6;

  paletteView = self->_paletteView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceForSelectedIdentity"));
  -[MasterNavigationPaletteView updateIdentity:](paletteView, "updateIdentity:", v6);

  -[MainWindowRootViewController updateNewEventButtonEnabledness](self, "updateNewEventButtonEnabledness");
  -[MainWindowRootViewController updateErrorState](self, "updateErrorState");
  -[MainWindowRootViewController updateInboxCount](self, "updateInboxCount");
}

- (void)_delegatesChanged:(id)a3
{
  void *v4;
  RootNavigationController *rootNavigationController;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model", a3));
  -[MasterNavigationPaletteView setShowIdentity:](self->_paletteView, "setShowIdentity:", objc_msgSend(v4, "containsDelegateSources"));

  rootNavigationController = self->_rootNavigationController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  -[RootNavigationController setAvatarViewVisible:](rootNavigationController, "setAvatarViewVisible:", -[MainWindowRootViewController canShowAvatarViewWithTraitCollection:](self, "canShowAvatarViewWithTraitCollection:", v6));

  -[MainWindowRootViewController updateNewEventButtonEnabledness](self, "updateNewEventButtonEnabledness");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  RootNavigationController *rootNavigationController;
  id v7;
  unsigned __int8 v8;
  BOOL v9;
  objc_super v11;

  rootNavigationController = self->_rootNavigationController;
  v7 = a4;
  if (-[RootNavigationController shouldHandleCanPerformActionForSelector:](rootNavigationController, "shouldHandleCanPerformActionForSelector:", a3))
  {
    v8 = -[RootNavigationController canPerformAction:withSender:](self->_rootNavigationController, "canPerformAction:withSender:", a3, v7);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MainWindowRootViewController;
    v8 = -[MainWindowRootViewController canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v7);
  }
  v9 = v8;

  return v9;
}

- (void)routeNewEventKeyCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "horizontalSizeClass") != (id)2)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
  if (v4)
  {

LABEL_4:
LABEL_5:
    -[RootNavigationController handleNewEventKeyCommand](self->_rootNavigationController, "handleNewEventKeyCommand");
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));

  if (v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController addEventBarButtonItem](self->_rootNavigationController, "addEventBarButtonItem"));
  v7 = objc_msgSend(v6, "isEnabled");

  if (v7)
    -[MainWindowRootViewController showAddEvent](self, "showAddEvent");
}

- (void)routeSearchKeyCommand
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "horizontalSizeClass") != (id)2)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));
  if (v4)
  {

LABEL_4:
LABEL_5:
    -[RootNavigationController handleSearchKeyCommand](self->_rootNavigationController, "handleSearchKeyCommand");
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));

  if (v5)
    goto LABEL_5;
  -[MainWindowRootViewController searchTapped](self, "searchTapped");
  -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
}

- (void)handleTodayKeyCommand
{
  -[RootNavigationController handleTodayKeyCommand](self->_rootNavigationController, "handleTodayKeyCommand");
}

- (void)handleRefreshKeyCommand
{
  -[RootNavigationController handleRefreshKeyCommand](self->_rootNavigationController, "handleRefreshKeyCommand");
}

- (void)handleGoToNextDateComponentUnitCommand
{
  -[RootNavigationController handleGoToNextDateComponentUnitCommand](self->_rootNavigationController, "handleGoToNextDateComponentUnitCommand");
}

- (void)handleGoToPreviousDateComponentUnitCommand
{
  -[RootNavigationController handleGoToPreviousDateComponentUnitCommand](self->_rootNavigationController, "handleGoToPreviousDateComponentUnitCommand");
}

- (void)handleSelectNextEventCommand
{
  -[RootNavigationController handleSelectNextEventCommand](self->_rootNavigationController, "handleSelectNextEventCommand");
}

- (void)handleSelectPreviousEventCommand
{
  -[RootNavigationController handleSelectPreviousEventCommand](self->_rootNavigationController, "handleSelectPreviousEventCommand");
}

- (void)handleSelectNextOccurrenceCommand
{
  -[RootNavigationController handleSelectNextOccurrenceCommand](self->_rootNavigationController, "handleSelectNextOccurrenceCommand");
}

- (void)handleSelectPreviousOccurrenceCommand
{
  -[RootNavigationController handleSelectPreviousOccurrenceCommand](self->_rootNavigationController, "handleSelectPreviousOccurrenceCommand");
}

- (void)handleDayKeyCommand
{
  -[RootNavigationController handleDayKeyCommand](self->_rootNavigationController, "handleDayKeyCommand");
}

- (void)handleWeekKeyCommand
{
  -[RootNavigationController handleWeekKeyCommand](self->_rootNavigationController, "handleWeekKeyCommand");
}

- (void)handleMonthKeyCommand
{
  -[RootNavigationController handleMonthKeyCommand](self->_rootNavigationController, "handleMonthKeyCommand");
}

- (void)handleYearKeyCommand
{
  -[RootNavigationController handleYearKeyCommand](self->_rootNavigationController, "handleYearKeyCommand");
}

- (void)handleCloseKeyCommand
{
  -[RootNavigationController handleCloseKeyCommand](self->_rootNavigationController, "handleCloseKeyCommand");
}

- (void)handleDismissSplashScreenKeyCommand
{
  -[RootNavigationController handleDismissSplashScreenKeyCommand](self->_rootNavigationController, "handleDismissSplashScreenKeyCommand");
}

- (void)handleViewAvailabilityCommand
{
  -[RootNavigationController handleViewAvailabilityCommand](self->_rootNavigationController, "handleViewAvailabilityCommand");
}

- (void)paste:(id)a3
{
  -[RootNavigationController paste:](self->_rootNavigationController, "paste:", a3);
}

- (void)copy:(id)a3
{
  -[RootNavigationController copy:](self->_rootNavigationController, "copy:", a3);
}

- (void)cut:(id)a3
{
  -[RootNavigationController cut:](self->_rootNavigationController, "cut:", a3);
}

- (void)handleDeleteKeyCommand
{
  -[RootNavigationController handleDeleteKeyCommand](self->_rootNavigationController, "handleDeleteKeyCommand");
}

- (void)handleDuplicateKeyCommand
{
  -[RootNavigationController handleDuplicateKeyCommand](self->_rootNavigationController, "handleDuplicateKeyCommand");
}

- (BOOL)_shouldUseSideBar
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass") == (id)2;

  return v3;
}

- (void)showCalendarsView
{
  -[MainWindowRootViewController showCalendarsViewWithCompletion:](self, "showCalendarsViewWithCompletion:", 0);
}

- (void)showCalendarsViewWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MainWindowRootViewController _shouldUseSideBar](self, "_shouldUseSideBar"))
    -[MainWindowRootViewController showCalendarsSideBarWithCompletion:](self, "showCalendarsSideBarWithCompletion:", v4);
  else
    -[RootNavigationController showCalendarsAnimated:completion:](self->_rootNavigationController, "showCalendarsAnimated:completion:", 1, v4);

}

- (void)showInboxView
{
  id v3;

  if (-[MainWindowRootViewController _shouldUseSideBar](self, "_shouldUseSideBar"))
    -[MainWindowRootViewController showInboxSideBarWithCompletion:](self, "showInboxSideBarWithCompletion:", 0);
  else
    v3 = -[RootNavigationController showInboxAnimated:](self->_rootNavigationController, "showInboxAnimated:", 1);
}

- (void)showListView
{
  void *v3;

  if (-[MainWindowRootViewController _shouldUseSideBar](self, "_shouldUseSideBar"))
  {
    -[MainWindowRootViewController showListSideBarWithCompletion:](self, "showListSideBarWithCompletion:", 0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToDayView](self->_rootNavigationController, "resetToDayView"));

    if (v3)
      -[RootNavigationController toggleDayViewMode:](self->_rootNavigationController, "toggleDayViewMode:", 2);
  }
}

- (void)showSearchView
{
  id v3;

  if (-[MainWindowRootViewController _shouldUseSideBar](self, "_shouldUseSideBar"))
    -[MainWindowRootViewController showSearchSideBar](self, "showSearchSideBar");
  else
    v3 = -[RootNavigationController showSearchAnimated:becomeFirstResponder:completion:](self->_rootNavigationController, "showSearchAnimated:becomeFirstResponder:completion:", 1, 1, 0);
}

- (void)showSplitMonthView
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToMonthView](self->_rootNavigationController, "resetToMonthView"));

  if (v3)
  {
    if (-[MainWindowRootViewController _shouldUseSideBar](self, "_shouldUseSideBar"))
      -[MainWindowRootViewController showListView](self, "showListView");
    else
      v4 = -[RootNavigationController resetToMonthViewSplit:](self->_rootNavigationController, "resetToMonthViewSplit:", 1);
  }
}

- (void)showDayView
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController resetToDayView](self->_rootNavigationController, "resetToDayView"));

  if (v3)
    -[RootNavigationController toggleDayViewMode:](self->_rootNavigationController, "toggleDayViewMode:", 0);
}

- (void)showWeekView
{
  id v2;

  v2 = -[RootNavigationController resetToWeekView](self->_rootNavigationController, "resetToWeekView");
}

- (void)showMonthView
{
  id v2;

  v2 = -[RootNavigationController resetToMonthViewSplit:](self->_rootNavigationController, "resetToMonthViewSplit:", 0);
}

- (void)showYearView
{
  id v2;

  v2 = -[RootNavigationController resetToYearView](self->_rootNavigationController, "resetToYearView");
}

- (void)showInspectorForCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DE79C;
  v7[3] = &unk_1001B50F0;
  v8 = a3;
  v9 = a4;
  v6 = v8;
  -[MainWindowRootViewController showCalendarsViewWithCompletion:](self, "showCalendarsViewWithCompletion:", v7);

}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowRootViewController presentedViewController](self, "presentedViewController"));

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE870;
    v8[3] = &unk_1001B32C0;
    v8[4] = self;
    v10 = v4;
    v9 = v6;
    -[MainWindowRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v8);

  }
  else
  {
    -[RootNavigationController dismissPresentedViewControllerAnimated:completion:](self->_rootNavigationController, "dismissPresentedViewControllerAnimated:completion:", v4, v6);
  }

}

- (id)undoManager
{
  return -[RootNavigationController undoManager](self->_rootNavigationController, "undoManager");
}

- (unint64_t)currentSidebarState
{
  return self->_currentSidebarState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQ, 0);
  objc_storeStrong((id *)&self->_buttonQ, 0);
  objc_storeStrong((id *)&self->_calendarsPreservedState, 0);
  objc_storeStrong((id *)&self->_presentedInboxVC, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_secondaryContainerVC, 0);
  objc_storeStrong((id *)&self->_primaryVC, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
}

@end
