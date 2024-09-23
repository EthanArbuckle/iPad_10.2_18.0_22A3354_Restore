@implementation UISearchDisplayController

- (UISearchDisplayController)init
{
  return -[UISearchDisplayController initWithSearchBar:contentsController:](self, "initWithSearchBar:contentsController:", 0, 0);
}

- (UISearchDisplayController)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController
{
  return -[UISearchDisplayController initWithSearchBar:contentsController:searchResultsTableViewStyle:](self, "initWithSearchBar:contentsController:searchResultsTableViewStyle:", searchBar, viewController, 0);
}

+ (void)_uiibSetRequiresSearchDisplayControllerSupport
{
  __UISearchDisplayControllerSupportRequired = 1;
}

- (UISearchDisplayController)initWithSearchBar:(id)a3 contentsController:(id)a4 searchResultsTableViewStyle:(int64_t)a5
{
  id v9;
  id v10;
  UISearchDisplayController *v11;
  objc_super v13;

  v9 = a3;
  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UISearchDisplayController;
  v11 = -[UISearchDisplayController init](&v13, sel_init);
  if (v11)
  {
    if ((__UISearchDisplayControllerSupportRequired & 1) == 0)
      UISearchDisplayControllerNoLongerSupported();
    objc_storeWeak((id *)&v11->_viewController, v10);
    objc_storeStrong((id *)&v11->_searchBar, a3);
    if (v11->_searchBar)
      -[UISearchDisplayController _configureNewSearchBar](v11, "_configureNewSearchBar");
    objc_msgSend(v10, "_setSearchDisplayControllerUnretained:", v11);
    UISearchDisplayControllerCommonInit(v11);
    v11->_searchResultsTableViewStyle = a5;
  }

  return v11;
}

- (UISearchDisplayController)initWithCoder:(id)a3
{
  id v4;
  UISearchDisplayController *v5;
  uint64_t v6;
  NSString *resultsTitle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchDisplayController;
  v5 = -[UISearchDisplayController init](&v9, sel_init);
  if (v5)
  {
    if ((unint64_t)_UIApplicationPackedMinimumDeploymentVersion() >= 0xD0000)
      UISearchDisplayControllerNoLongerSupported();
    UISearchDisplayControllerCommonInit(v5);
    v5->_searchResultsTableViewStyle = 0;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIResultsTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    resultsTitle = v5->_resultsTitle;
    v5->_resultsTitle = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *resultsTitle;

  resultsTitle = self->_resultsTitle;
  if (resultsTitle)
    objc_msgSend(a3, "encodeObject:forKey:", resultsTitle, CFSTR("UIResultsTitle"));
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  _UISearchControllerDidScrollDelegate *didScrollDelegate;
  void *v7;
  __CFArray *containingScrollViews;
  UIView *tableViewBackgroundHeaderView;
  objc_super v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  -[UISearchBar setController:](self->_searchBar, "setController:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "_clearRecordedContentScrollView");
  objc_msgSend(WeakRetained, "_setSearchDisplayControllerUnretained:", 0);
  -[UISearchDisplayController _destroyManagedTableView](self, "_destroyManagedTableView");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("UIWindowWillAnimateRotationNotification");
  v11[1] = CFSTR("UIWindowDidRotateNotification");
  v11[2] = 0x1E1712780;
  v11[3] = 0x1E17127A0;
  v11[4] = 0x1E17127C0;
  v11[5] = CFSTR("UIKeyboardDidShowNotification");
  v11[6] = CFSTR("UIKeyboardDidHideNotification");
  v11[7] = CFSTR("UIKeyboardPrivateWillShowNotification");
  v11[8] = CFSTR("UIKeyboardPrivateWillHideNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  didScrollDelegate = self->_didScrollDelegate;
  if (didScrollDelegate)
  {
    -[_UISearchControllerDidScrollDelegate scrollView](didScrollDelegate, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_removeScrollViewScrollObserver:", self->_didScrollDelegate);

  }
  containingScrollViews = self->_containingScrollViews;
  if (containingScrollViews)
    CFRelease(containingScrollViews);
  tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
  self->_tableViewBackgroundHeaderView = 0;

  v10.receiver = self;
  v10.super_class = (Class)UISearchDisplayController;
  -[UISearchDisplayController dealloc](&v10, sel_dealloc);
}

- (void)_configureSearchBarForTableView
{
  void *v3;
  UISearchBar *v4;
  UISearchBar *searchBar;
  UIView *tableViewBackgroundHeaderView;
  UIView *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  id v11;

  -[UISearchDisplayController _containingTableView](self, "_containingTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = v3;
    objc_msgSend(v3, "tableHeaderView");
    v4 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;

    if (v4 == searchBar)
    {
      -[UISearchBar _setShowsSeparator:](self->_searchBar, "_setShowsSeparator:", 0);
      tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
      if (!tableViewBackgroundHeaderView
        || (objc_msgSend(v11, "_tableHeaderBackgroundView"),
            v7 = (UIView *)objc_claimAutoreleasedReturnValue(),
            v7,
            tableViewBackgroundHeaderView != v7))
      {
        if ((objc_msgSend(v11, "_usingCustomBackgroundView") & 1) == 0)
        {
          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTableHeaderBackgroundColor:", v8);

        }
        -[UISearchDisplayController _updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:](self, "_updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:", v11, 0.0);
        objc_msgSend(v11, "_tableHeaderBackgroundView");
        v9 = (UIView *)objc_claimAutoreleasedReturnValue();
        v10 = self->_tableViewBackgroundHeaderView;
        self->_tableViewBackgroundHeaderView = v9;

      }
    }
    -[UISearchBar _updateInsetsForTableView:](self->_searchBar, "_updateInsetsForTableView:", v11);
    -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 1);
    v3 = v11;
  }

}

- (void)_cleanUpSearchBar
{
  void *v3;
  UIView *tableViewBackgroundHeaderView;
  id v5;

  -[UISearchDisplayController _containingTableView](self, "_containingTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    if ((objc_msgSend(v3, "_usingCustomBackgroundView") & 1) == 0)
      objc_msgSend(v5, "setTableHeaderBackgroundColor:", 0);
    tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
    self->_tableViewBackgroundHeaderView = 0;

    -[UISearchBar _updateInsetsForTableView:](self->_searchBar, "_updateInsetsForTableView:", 0);
    -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 0);
    v3 = v5;
  }

}

- (BOOL)_areSearchContentsSplitViewMaster
{
  UIViewController **p_viewController;
  id WeakRetained;
  void *v4;
  id *v5;
  id *v6;
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;

  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "masterViewController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();

  v6 = (id *)objc_loadWeakRetained((id *)p_viewController);
  v7 = v6;
  v8 = v6 != 0;
  if (v6 && v6 != v5)
  {
    do
    {
      v9 = v7;
      v7 = (id *)v7[13];

      v8 = v7 != 0;
      if (v7)
        v10 = v7 == v5;
      else
        v10 = 1;
    }
    while (!v10);
  }

  return v8;
}

- (void)_configureNewSearchBar
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  UISearchBar *searchBar;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[UISearchBar _setRequiresLegacyVisualProvider](self->_searchBar, "_setRequiresLegacyVisualProvider");
  -[UISearchBar setController:](self->_searchBar, "setController:", self);
  -[UISearchBar setShowsScopeBar:](self->_searchBar, "setShowsScopeBar:", *(_WORD *)&self->_searchDisplayControllerFlags & 1);
  -[UIView frame](self->_searchBar, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UISearchBar _defaultHeight](self->_searchBar, "_defaultHeight");
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v4, v6, v8, v9);
  -[UISearchBar _setAutoDisableCancelButton:](self->_searchBar, "_setAutoDisableCancelButton:", 0);
  -[UISearchBar setUsesEmbeddedAppearance:](self->_searchBar, "setUsesEmbeddedAppearance:", 1);
  -[UISearchBar _setAllowsInlineScopeBar:](self->_searchBar, "_setAllowsInlineScopeBar:", -[UISearchDisplayController _areSearchContentsSplitViewMaster](self, "_areSearchContentsSplitViewMaster") ^ 1);
  if (!-[UISearchBar showsScopeBar](self->_searchBar, "showsScopeBar"))
    -[UISearchBar _setScopeBarHidden:](self->_searchBar, "_setScopeBarHidden:", 1);
  -[UISearchBar placeholder](self->_searchBar, "placeholder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    searchBar = self->_searchBar;
    _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setPlaceholder:](searchBar, "setPlaceholder:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->_searchBar, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_windowWillAnimateRotation_, CFSTR("UIWindowWillAnimateRotationNotification"), v14);

  -[UIView window](self->_searchBar, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_windowDidRotate_, CFSTR("UIWindowDidRotateNotification"), v15);

  -[UISearchDisplayController _configureSearchBarForTableView](self, "_configureSearchBarForTableView");
}

- (void)setSearchBar:(id)a3
{
  UISearchBar *v5;
  UISearchBar *searchBar;
  void *v7;
  void *v8;
  void *v9;
  UISearchBar *v10;

  v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    v10 = v5;
    if (searchBar)
    {
      -[UISearchBar setController:](searchBar, "setController:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self->_searchBar, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("UIWindowWillAnimateRotationNotification"), v8);

      -[UIView window](self->_searchBar, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("UIWindowDidRotateNotification"), v9);

    }
    objc_storeStrong((id *)&self->_searchBar, a3);
    -[UISearchDisplayController _configureNewSearchBar](self, "_configureNewSearchBar");
    v5 = v10;
  }

}

- (void)_setupNoResultsLabelIfNecessary
{
  UILabel *v3;
  UILabel *v4;
  UILabel *noResultsLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  if (!self->_noResultsLabel)
  {
    v3 = [UILabel alloc];
    v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    noResultsLabel = self->_noResultsLabel;
    self->_noResultsLabel = v4;

    v6 = self->_noResultsLabel;
    -[UISearchDisplayController noResultsMessage](self, "noResultsMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6, "setText:", v7);

    -[UILabel setTextAlignment:](self->_noResultsLabel, "setTextAlignment:", 1);
    -[UIView setAutoresizingMask:](self->_noResultsLabel, "setAutoresizingMask:", 5);
    v8 = self->_noResultsLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = self->_noResultsLabel;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    v12 = self->_noResultsLabel;
    UISystemFontBoldForSize();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

  }
}

- (void)setSearchContentsController:(id)a3
{
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_viewController, obj);
    -[UISearchBar _setAllowsInlineScopeBar:](self->_searchBar, "_setAllowsInlineScopeBar:", -[UISearchDisplayController _areSearchContentsSplitViewMaster](self, "_areSearchContentsSplitViewMaster") ^ 1);
    v6 = -[UISearchDisplayController isNavigationBarHidingEnabled](self, "isNavigationBarHidingEnabled");
    v5 = obj;
    if (v6)
    {
      objc_msgSend(obj, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPretendNavBarHidden:", -[UISearchDisplayController isActive](self, "isActive"));
      if (v7 && objc_msgSend(v7, "searchBarHidNavBar"))
        *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;

      v5 = obj;
    }
  }

}

- (id)_containingViewOfClass:(Class)a3
{
  void *v4;
  id *WeakRetained;
  id *v6;
  id *v7;
  uint64_t v8;

  -[UIView superview](self->_searchBar, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_viewController);
    if (!WeakRetained)
    {
      v4 = 0;
      return v4;
    }
    v6 = WeakRetained;
    do
    {
      v7 = v6;
      objc_msgSend(v6, "savedHeaderSuperview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id *)v6[13];

    }
    while (!v4 && v6);

  }
  if (v4)
  {
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    while (v8);
  }
  return v4;
}

- (id)_containingTableView
{
  UIScrollView **p_savedContainingScrollView;
  id WeakRetained;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;

  p_savedContainingScrollView = &self->_savedContainingScrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_savedContainingScrollView);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_savedContainingScrollView),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_savedContainingScrollView);
  }
  else
  {
    -[UISearchDisplayController _containingViewOfClass:](self, "_containingViewOfClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_topShadowView
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UITableView _topShadowView](self->_tableView, "_topShadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)hidNavigationBar
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 3) & 1;
}

- (BOOL)_isSearchBarInBar
{
  return -[UISearchBar _isInBarButNotHosted](self->_searchBar, "_isInBarButNotHosted");
}

- (void)_popoverKeyboardDidShow:(id)a3
{
  void *v4;
  UISearchBar *searchBar;
  void *v6;
  id v7;

  if (self->_popoverController)
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    searchBar = self->_searchBar;
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObjects:", searchBar, v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController setPassthroughViews:](self->_popoverController, "setPassthroughViews:", v6);

  }
}

- (void)_popoverKeyboardDidHide:(id)a3
{
  id v4;

  if (self->_popoverController)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_searchBar, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController setPassthroughViews:](self->_popoverController, "setPassthroughViews:", v4);

  }
}

- (void)_popoverClearButtonPressed:(id)a3
{
  -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E16EDF20);
  -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 1);
}

- (id)_createPopoverController
{
  UITableViewController *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  void *v15;
  UINavigationController *v16;
  UIPopoverController *v17;

  v3 = -[UITableViewController initWithStyle:]([UITableViewController alloc], "initWithStyle:", self->_searchResultsTableViewStyle);
  -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView __setViewDelegate:](v4, 0);

  -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

  -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController setTableView:](v3, "setTableView:", v7);

  -[UISearchDisplayController searchResultsTitle](self, "searchResultsTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    -[UISearchDisplayController searchResultsTitle](self, "searchResultsTitle");
  else
    _UINSLocalizedStringWithDefaultValue(CFSTR("Results"), CFSTR("Results"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationItem](v3, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

  if (-[UISearchBar showsSearchResultsButton](self->_searchBar, "showsSearchResultsButton")
    && -[UISearchBar isSearchResultsButtonSelected](self->_searchBar, "isSearchResultsButtonSelected"))
  {
    v11 = [UIBarButtonItem alloc];
    _UIKitBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Clear[Search]"), CFSTR("Clear"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIBarButtonItem initWithTitle:style:target:action:](v11, "initWithTitle:style:target:action:", v13, 1, self, sel__popoverClearButtonPressed_);
    -[UIViewController navigationItem](v3, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", v14);

  }
  v16 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v3);
  v17 = -[UIPopoverController initWithContentViewController:]([UIPopoverController alloc], "initWithContentViewController:", v16);
  -[UIPopoverController setDelegate:](v17, "setDelegate:", self);

  return v17;
}

- (void)_destroyManagedTableView
{
  UITableView *tableView;
  UITableView *v4;
  UIPopoverController *popoverController;
  UIPopoverController *v6;
  UIPopoverController *v7;

  tableView = self->_tableView;
  if (tableView)
  {
    -[UIScrollView removeFromSuperview](tableView, "removeFromSuperview");
    v4 = self->_tableView;
    self->_tableView = 0;

  }
  popoverController = self->_popoverController;
  if (popoverController)
  {
    if (-[UIPopoverController isPopoverVisible](popoverController, "isPopoverVisible"))
      -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
    v6 = objc_retainAutorelease(self->_popoverController);
    v7 = self->_popoverController;
    self->_popoverController = 0;

  }
}

- (void)_disableParentScrollViews
{
  __CFArray *Mutable;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_containingScrollViews
    || (Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]),
        (self->_containingScrollViews = Mutable) != 0))
  {
    -[UIView superview](self->_searchBar, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 && -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
      || -[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
    {
      -[UIView superview](self->_containerView, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    if (v4)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v4, "isScrollEnabled"))
          {
            objc_msgSend(v4, "setScrollEnabled:", 0);
            objc_msgSend(v4, "setProgrammaticScrollEnabled:", 0);
            CFArrayAppendValue(self->_containingScrollViews, v4);
          }
        }
        objc_msgSend(v4, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

- (void)_enableParentScrollViews
{
  __CFArray *containingScrollViews;
  CFRange v4;

  containingScrollViews = self->_containingScrollViews;
  if (containingScrollViews)
  {
    v4.length = CFArrayGetCount(self->_containingScrollViews);
    v4.location = 0;
    CFArrayApplyFunction(containingScrollViews, v4, (CFArrayApplierFunction)_EnableScrollView, 0);
    CFArrayRemoveAllValues(self->_containingScrollViews);
    CFRelease(self->_containingScrollViews);
    self->_containingScrollViews = 0;
  }
}

- (UIEdgeInsets)_tableViewContentInsets
{
  _BOOL4 v3;
  double v4;
  id v5;
  char v6;
  double Height;
  id v8;
  void *v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  UIEdgeInsets result;

  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) == 0)
  {
    v3 = -[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent");
    v4 = 0.0;
    if (!v3)
      goto LABEL_15;
  }
  if (!-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
  {
    if (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
    {
      -[UIView bounds](self->_searchBar, "bounds");
      Height = CGRectGetHeight(v22);
      goto LABEL_12;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    Height = CGRectGetHeight(v21);
    goto LABEL_9;
  }
  v5 = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = objc_msgSend(v5, "edgesForExtendedLayout");

  Height = 0.0;
  if ((v6 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v8, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "existingPaletteForEdge:", 2);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "frame");
    Height = CGRectGetHeight(v19);
    if (-[UISearchDisplayController isNavigationBarHidingEnabled](self, "isNavigationBarHidingEnabled"))
    {
LABEL_10:

      goto LABEL_12;
    }
    v11 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    Height = Height + CGRectGetHeight(v20);

LABEL_9:
    goto LABEL_10;
  }
LABEL_12:
  v14 = -[UISearchDisplayController _shouldAccountForStatusBarHeight](self, "_shouldAccountForStatusBarHeight");
  v15 = 0.0;
  if (v14)
    -[UISearchDisplayController _statusBarHeight](self, "_statusBarHeight", 0.0);
  v4 = Height + v15;
LABEL_15:
  v16 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v4;
  return result;
}

- (void)_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double lastFooterAdjustment;
  double v35;
  double v36;
  double v37;
  id v38;

  if (a3)
  {
    v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v37 = *MEMORY[0x1E0C9D538];
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    -[UIScrollView contentOffset](self->_tableView, "contentOffset");
    v36 = v9;
    v37 = v8;
    -[UIScrollView contentInset](self->_tableView, "contentInset");
    v4 = v10;
    v5 = v11;
    v6 = v12;
    v7 = v13;
  }
  -[UISearchDisplayController _tableViewContentInsets](self, "_tableViewContentInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20 + self->_lastFooterAdjustment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "navigationController");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v23 = v38;
  if (v38)
  {
    v35 = v5;
    v24 = v4;
    v25 = v7;
    v26 = v6;
    v27 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v38, "_scrollViewBottomContentInsetForViewController:", v27);
    v29 = v28;

    lastFooterAdjustment = self->_lastFooterAdjustment;
    if (lastFooterAdjustment != v29)
    {
      self->_lastFooterAdjustment = lastFooterAdjustment + v29 - lastFooterAdjustment;
      v21 = v21 + v29 - lastFooterAdjustment;
    }
    v6 = v26;
    v23 = v38;
    v7 = v25;
    v4 = v24;
    v5 = v35;
  }
  if (v5 != v17 || v4 != v15 || v7 != v19 || v6 != v21)
  {
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v15, v17, v21, v19);
    -[UIScrollView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v15, v17, v21, v19);
    v23 = v38;
    if (v4 != v15 || v5 != v17)
    {
      -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", v37 + v5 - v17, v36 + v4 - v15);
      v23 = v38;
    }
  }

}

- (void)_hoistSearchBar
{
  void *v3;
  void *v4;
  void *WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  double v13;
  void *v14;
  unint64_t v15;
  UIScrollView **p_savedContainingScrollView;
  UISearchBar *searchBar;
  id v18;
  CGRect v19;

  -[UIView superview](self->_searchBar, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchDisplayControllerContainerView topView](self->_containerView, "topView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0)
      return;
    p_savedContainingScrollView = &self->_savedContainingScrollView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_savedContainingScrollView);
    if (WeakRetained)
    {
      v18 = WeakRetained;
      if (self->_savedSearchBarResizingMask != -1)
      {
        -[UIView setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:");
        self->_savedSearchBarResizingMask = -1;
      }
      *(_WORD *)&self->_searchDisplayControllerFlags |= 0x8000u;
      objc_msgSend(v18, "addSubview:", self->_searchBar);
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x8000u;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        searchBar = self->_searchBar;
        objc_msgSend(v18, "_rectForTableHeaderView");
        -[UISearchBar setFrame:](searchBar, "setFrame:");
      }
      objc_msgSend(v18, "layoutBelowIfNeeded");
      objc_storeWeak((id *)p_savedContainingScrollView, 0);
      goto LABEL_15;
    }
  }
  else
  {
    -[UISearchDisplayController _containingViewOfClass:](self, "_containingViewOfClass:", objc_opt_class());
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      v18 = WeakRetained;
      objc_storeWeak((id *)&self->_savedContainingScrollView, WeakRetained);
      -[UIView frame](self->_searchBar, "frame");
      v7 = v6;
      v9 = v8;
      v10 = *MEMORY[0x1E0C9D538];
      -[UISearchDisplayControllerContainerView topView](self->_containerView, "topView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      Width = CGRectGetWidth(v19);

      if (Width == 0.0)
        v7 = 0.0;
      -[UISearchDisplayController _additionalNonCollapsingHeightAboveSearchBar](self, "_additionalNonCollapsingHeightAboveSearchBar");
      -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v10, v13, v7, v9);
      *(_WORD *)&self->_searchDisplayControllerFlags |= 0x8000u;
      -[UISearchDisplayControllerContainerView topView](self->_containerView, "topView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_searchBar);

      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x8000u;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v18, "_pinsTableHeaderView"))
        {
          v15 = -[UIView autoresizingMask](self->_searchBar, "autoresizingMask");
          self->_savedSearchBarResizingMask = v15;
          -[UIView setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:", v15 | 2);
        }
      }
LABEL_15:
      WeakRetained = v18;
    }
  }

}

- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  UIPopoverController *v10;
  UIPopoverController *popoverController;
  unint64_t v12;
  void *v13;
  UISearchBar *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIPopoverController *v22;
  UIPopoverController *v23;
  void *v24;
  uint64_t v25;
  UISearchDisplayControllerContainerView *containerView;
  uint64_t v27;
  void *v28;
  UISearchBar *searchBar;
  UITableView *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  UIPopoverController *v48;

  v4 = a3;
  v6 = -[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar", a3, a4);
  v7 = -[UIView isHidden](self->_tableView, "isHidden");
  if (v4)
  {
    if (!v7)
    {
      if (!v6)
        return;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "userInterfaceIdiom");

      if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1
        || -[UIPopoverController isPopoverVisible](self->_popoverController, "isPopoverVisible"))
      {
        return;
      }
    }
    -[UISearchDisplayController _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:](self, "_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISearchDisplayDelegate searchDisplayController:willShowSearchResultsTableView:](self->_delegate, "searchDisplayController:willShowSearchResultsTableView:", self, self->_tableView);
    if (!v6
      || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "userInterfaceIdiom"),
          v8,
          (v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      || -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
      && -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") != 3)
    {
      -[UIView setHidden:](self->_tableView, "setHidden:", 0);
      -[UIView setHidden:](self->_dimmingView, "setHidden:", 1);
      self->_lastKeyboardAdjustment = 0.0;
      if (UIKeyboardAutomaticIsOnScreen())
        -[UITableView _adjustForAutomaticKeyboardInfo:animated:lastAdjustment:](self->_tableView, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &self->_lastKeyboardAdjustment);
      containerView = self->_containerView;
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0)
        v27 = 0;
      else
        v27 = -[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent") ^ 1;
      -[UISearchDisplayControllerContainerView setBottomViewUserInteractionEnabled:](containerView, "setBottomViewUserInteractionEnabled:", v27);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
      {
        goto LABEL_46;
      }
      searchBar = self->_searchBar;
      v30 = self->_tableView;
      -[UISearchBar _makeShadowView](searchBar, "_makeShadowView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView _setTopShadowView:](v30, "_setTopShadowView:", v31);

LABEL_45:
LABEL_46:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UISearchDisplayDelegate searchDisplayController:didShowSearchResultsTableView:](self->_delegate, "searchDisplayController:didShowSearchResultsTableView:", self, self->_tableView);
      -[UISearchDisplayController _updateNoSearchResultsMessageVisiblity](self, "_updateNoSearchResultsMessageVisiblity");
      return;
    }
    if (!self->_popoverController)
    {
      v10 = -[UISearchDisplayController _createPopoverController](self, "_createPopoverController");
      popoverController = self->_popoverController;
      self->_popoverController = v10;

    }
    v12 = -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing");
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = self->_searchBar;
    if (v12 == 3)
    {
      -[UISearchBar searchField](self->_searchBar, "searchField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithObjects:", v15, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController setPassthroughViews:](self->_popoverController, "setPassthroughViews:", v17);

      -[UISearchBar searchField](self->_searchBar, "searchField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
    }
    else
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithObjects:", v14, v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController setPassthroughViews:](self->_popoverController, "setPassthroughViews:", v33);

      v34 = -[UISearchBar isSearchResultsButtonSelected](self->_searchBar, "isSearchResultsButtonSelected");
      -[UISearchBar searchField](self->_searchBar, "searchField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v34)
      {
        -[UISearchBar searchField](self->_searchBar, "searchField");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bounds");
        objc_msgSend(v19, "rightViewRectForBounds:");
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;

LABEL_44:
        v48 = self->_popoverController;
        -[UISearchBar searchField](self->_searchBar, "searchField");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v48, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v31, 3, 1, v37, v39, v41, v43);
        goto LABEL_45;
      }
    }
    objc_msgSend(v18, "bounds");
    v37 = v44;
    v39 = v45;
    v41 = v46;
    v43 = v47;
    goto LABEL_44;
  }
  if (!v7 || v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISearchDisplayDelegate searchDisplayController:willHideSearchResultsTableView:](self->_delegate, "searchDisplayController:willHideSearchResultsTableView:", self, self->_tableView);
    if (v6
      && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "userInterfaceIdiom"),
          v20,
          (v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      && (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
       || -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 3))
    {
      -[UISearchBar setSearchResultsButtonSelected:](self->_searchBar, "setSearchResultsButtonSelected:", 0);
      if (-[UIPopoverController isPopoverVisible](self->_popoverController, "isPopoverVisible"))
        -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
      v22 = objc_retainAutorelease(self->_popoverController);
      v23 = self->_popoverController;
      self->_popoverController = 0;

    }
    else
    {
      if (-[UISearchDisplayController dimTableViewOnEmptySearchString](self, "dimTableViewOnEmptySearchString"))
        -[UIView setHidden:](self->_dimmingView, "setHidden:", 0);
      -[UIView setHidden:](self->_tableView, "setHidden:", 1);
      -[UIView setAlpha:](self->_tableView, "setAlpha:", 1.0);
      -[UISearchDisplayControllerContainerView setBottomViewUserInteractionEnabled:](self->_containerView, "setBottomViewUserInteractionEnabled:", -[UISearchDisplayController dimTableViewOnEmptySearchString](self, "dimTableViewOnEmptySearchString"));
    }
    -[UISearchBar searchField](self->_searchBar, "searchField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setSuffix:withColor:", 0, 0);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISearchDisplayDelegate searchDisplayController:didHideSearchResultsTableView:](self->_delegate, "searchDisplayController:didHideSearchResultsTableView:", self, self->_tableView);
  }
}

- (void)_searchBarSuperviewWillChange
{
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x80000000) == 0)
    -[UISearchDisplayController _cleanUpSearchBar](self, "_cleanUpSearchBar");
}

- (void)_searchBarSuperviewChanged
{
  void *v3;

  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x80000000) == 0)
  {
    if (-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_navigationControllerWillShowViewController_, 0x1E1712780, 0);

    }
    -[UISearchDisplayController _configureSearchBarForTableView](self, "_configureSearchBarForTableView");
  }
}

- (void)_hideVisibleRefreshControl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[UISearchDisplayController _containingTableView](self, "_containingTableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    objc_msgSend(v2, "_refreshControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v8;
    if (v3)
    {
      objc_msgSend(v8, "_refreshControl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "refreshControlState") == 2)
      {

LABEL_6:
        objc_msgSend(v8, "_refreshControl");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_removeInsets");

        v2 = v8;
        goto LABEL_7;
      }
      objc_msgSend(v8, "_refreshControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "refreshControlState");

      v2 = v8;
      if (v6 == 3)
        goto LABEL_6;
    }
  }
LABEL_7:

}

- (double)_dimmingViewAlpha
{
  void *v3;
  id v4;
  double Alpha;

  -[UISearchDisplayController _dimmingOverlayColor](self, "_dimmingOverlayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UISearchDisplayController _dimmingOverlayColor](self, "_dimmingOverlayColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v4, "CGColor"));

  }
  else
  {
    Alpha = 0.4;
  }

  return Alpha;
}

- (id)_dimmingViewColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v8;
  double v9;
  double v10;

  -[UISearchDisplayController _dimmingOverlayColor](self, "_dimmingOverlayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v9 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
    -[UISearchDisplayController _dimmingOverlayColor](self, "_dimmingOverlayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "getRed:green:blue:alpha:", &v10, &v9, &v8, 0);

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10, v9, v8, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_sendDelegateDidBeginDidEndSearch
{
  __int16 searchDisplayControllerFlags;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UISearchDisplayDelegate searchDisplayControllerDidBeginSearch:](self->_delegate, "searchDisplayControllerDidBeginSearch:", self);
      return;
    }
    searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  }
  if ((searchDisplayControllerFlags & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    -[UISearchDisplayDelegate searchDisplayControllerDidEndSearch:](self->_delegate, "searchDisplayControllerDidEndSearch:", self);
}

- (void)showHideAnimationDidFinish
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  UISearchBar *searchBar;
  _BOOL8 v8;
  id v9;
  void *v10;

  if ((!-[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField")
     || -[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField")
     && (*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0)
    && !-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
  {
    -[UISearchDisplayController _hoistSearchBar](self, "_hoistSearchBar");
  }
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0)
  {
    -[UISearchDisplayController _containingTableView](self, "_containingTableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_pinsTableHeaderView"))
      objc_msgSend(v3, "_setIgnorePinnedTableHeaderUpdates:", 0);
    if (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(WeakRetained, "_existingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchDisplayController _setTableViewVisible:inView:](self, "_setTableViewVisible:inView:", 0, v5);

    }
    -[UISearchBar _destroyCancelButton](self->_searchBar, "_destroyCancelButton");
    if (-[UISearchBar isTranslucent](self->_searchBar, "isTranslucent"))
      -[UISearchBar _setScopeBarHidden:](self->_searchBar, "_setScopeBarHidden:", 1);
    if (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
      && (*(_WORD *)&self->_searchDisplayControllerFlags & 0x2000) == 0)
    {
      -[UIView removeFromSuperview](self->_containerView, "removeFromSuperview");
    }
    v6 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v6, "_clearRecordedContentScrollView");

    if (-[UISearchBar barPosition](self->_searchBar, "barPosition") != 3)
    {
      -[UISearchBar _setMaskActive:](self->_searchBar, "_setMaskActive:", 1);
      searchBar = self->_searchBar;
      -[UIView bounds](searchBar, "bounds");
      -[UISearchBar _setMaskBounds:](searchBar, "_setMaskBounds:");
    }
    -[UISearchDisplayController _updateSearchBarMaskIfNecessary](self, "_updateSearchBarMaskIfNecessary");
    goto LABEL_25;
  }
  -[UISearchBar _allowCursorToAppear:](self->_searchBar, "_allowCursorToAppear:", 1);
  if (-[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar"))
  {
    -[UISearchBar text](self->_searchBar, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "length")
      || -[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField")
      || -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 3;
    v9 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v9, "_existingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchDisplayController _setTableViewVisible:inView:](self, "_setTableViewVisible:inView:", v8, v10);

LABEL_25:
  }
  -[UISearchDisplayController _sendDelegateDidBeginDidEndSearch](self, "_sendDelegateDidBeginDidEndSearch");
}

- (void)setActive:(BOOL)visible animated:(BOOL)animated
{
  _BOOL8 v4;
  __int16 searchDisplayControllerFlags;
  void *v7;
  int v8;
  UIPopoverController *popoverController;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _BOOL4 v19;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  __objc2_class **v27;
  uint64_t v28;
  id v29;
  void *v30;
  UISearchBar *searchBar;
  void *v32;
  uint64_t v33;
  UIViewController **p_viewController;
  id v35;
  id v36;
  int v37;
  __int16 v38;
  __int16 v39;
  _BOOL4 v40;
  UISearchBar *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  UISearchBar *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  UISearchDisplayControllerContainerView *v55;
  void *v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int16 v67;
  double v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  UISearchDisplayControllerContainerView *containerView;
  UISearchDisplayControllerContainerView *v88;
  void *v89;
  UISearchDisplayControllerContainerView *v90;
  void *v91;
  CGFloat v92;
  CGFloat v93;
  id v94;
  _BOOL8 v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  double v110;
  void *v111;
  uint64_t v112;
  id v113;
  void *v114;
  int v115;
  void *v116;
  double v117;
  void *v118;
  __int16 v119;
  id v120;
  char v121;
  void *v122;
  double Height;
  double v124;
  UISearchDisplayControllerContainerView *v125;
  void *v126;
  void *v127;
  char v128;
  id v129;
  void *v130;
  void *v131;
  __objc2_class *v132;
  id v133;
  id v134;
  BOOL v135;
  __int16 v136;
  void *v137;
  UIView **p_dimmingView;
  void *v139;
  int v140;
  uint64_t v141;
  void *v142;
  __objc2_class *v143;
  __objc2_class *v144;
  __objc2_class *v145;
  void *v146;
  uint64_t v147;
  id v148;
  id v149;
  double v150;
  void *v151;
  void *v152;
  int v153;
  double v154;
  void *v155;
  __int16 v156;
  void *v157;
  id v158;
  double v159;
  double v160;
  char isKindOfClass;
  $8D6B8881E49F585262256A31217E692A v162;
  int v163;
  uint64_t v164;
  UISearchBar *v165;
  double v166;
  void *v167;
  CGFloat v168;
  CGFloat v169;
  id v170;
  id v171;
  void *v172;
  UIView **v173;
  void *v174;
  double v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  id v179;
  BOOL v180;
  id v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  double v188;
  void *v189;
  int v190;
  id *location;
  void *v192;
  char v193;
  BOOL v194;
  void *v195;
  int v196;
  SEL v197;
  void *v198;
  unint64_t v199;
  int v200;
  void *v201;
  id v202;
  _BOOL4 v203;
  _QWORD v204[5];
  BOOL v205;
  _QWORD v206[5];
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  BOOL v212;
  BOOL v213;
  BOOL v214;
  char v215;
  BOOL v216;
  char v217;
  _QWORD v218[5];
  _QWORD v219[4];
  id v220;
  UISearchDisplayController *v221;
  double v222;
  _QWORD aBlock[6];
  _QWORD v224[7];
  _QWORD v225[5];
  BOOL v226;
  _QWORD v227[5];
  BOOL v228;
  _QWORD v229[5];
  BOOL v230;
  _QWORD v231[6];
  _QWORD v232[5];
  _QWORD v233[5];
  _QWORD v234[5];
  id v235;
  BOOL v236;
  _QWORD v237[5];
  id v238;
  id v239;
  BOOL v240;
  _QWORD v241[5];
  BOOL v242;
  _QWORD v243[5];
  BOOL v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;

  v4 = visible;
  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 1) == 0) ^ visible) & 1) == 0)
  {
    v19 = animated;
    *(_WORD *)&self->_searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFFC | visible | 2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UISearchDisplayDelegate searchDisplayControllerWillBeginSearch:](self->_delegate, "searchDisplayControllerWillBeginSearch:", self);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UISearchDisplayDelegate searchDisplayControllerWillEndSearch:](self->_delegate, "searchDisplayControllerWillEndSearch:", self);
    }
    if (-[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar"))
    {
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x1000u;
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(WeakRetained, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "userInterfaceIdiom");

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
           || -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 3))
        {
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__popoverKeyboardDidShow_, CFSTR("UIKeyboardDidShowNotification"), 0);
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__popoverKeyboardDidHide_, CFSTR("UIKeyboardDidHideNotification"), 0);
        }
        if (v23)
        {
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerWillShowViewController_, 0x1E1712780, v23);
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidShowViewController_, 0x1E17127A0, v23);
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidCancelShowingViewController_, 0x1E17127C0, v23);
        }
      }
      else
      {
        searchBar = self->_searchBar;
        -[UISearchBar text](searchBar, "text");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
          v33 = -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar") ^ 1;
        else
          v33 = 0;
        -[UISearchBar setShowsSearchResultsButton:](searchBar, "setShowsSearchResultsButton:", v33);

        if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x100) == 0)
        {
          -[UISearchBar searchField](self->_searchBar, "searchField");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "resignFirstResponder");

          -[UISearchBar searchField](self->_searchBar, "searchField");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "_clearBecomeFirstResponderWhenCapable");

        }
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "userInterfaceIdiom");

        if ((v78 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
           || -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 3))
        {
          objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidShowNotification"), 0);
          objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidHideNotification"), 0);
        }
        if (v23)
        {
          objc_msgSend(v21, "removeObserver:name:object:", self, 0x1E1712780, v23);
          objc_msgSend(v21, "removeObserver:name:object:", self, 0x1E17127A0, v23);
          objc_msgSend(v21, "removeObserver:name:object:", self, 0x1E17127C0, v23);
        }
        -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E16EDF20);
      }
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "userInterfaceIdiom");

      if ((v80 & 0xFFFFFFFFFFFFFFFBLL) != 1
        && -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
      {
        v81 = objc_loadWeakRetained((id *)&self->_viewController);
        v82 = v81;
        if (v4)
        {
          objc_msgSend(v81, "view");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          -[UISearchDisplayController _hideVisibleRefreshControl](self, "_hideVisibleRefreshControl");
          -[UIView _screen](self->_searchBar, "_screen");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v84);

          -[UIView _screen](self->_searchBar, "_screen");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v85);

          v86 = -[UISearchDisplayController _containerView](self, "_containerView");
          containerView = self->_containerView;
          objc_msgSend(v83, "bounds");
          -[UIView setFrame:](containerView, "setFrame:");
          v88 = self->_containerView;
          objc_msgSend(v23, "navigationBar");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "frame");
          -[UISearchDisplayControllerContainerView updateTopViewHeight:](v88, "updateTopViewHeight:", CGRectGetHeight(v245));

          objc_msgSend(v83, "addSubview:", self->_containerView);
          -[UISearchDisplayController _disableParentScrollViews](self, "_disableParentScrollViews");
          v90 = self->_containerView;
          -[UISearchDisplayController _statusBarHeight](self, "_statusBarHeight");
          -[UISearchDisplayControllerContainerView updateTopAttributeConstant:](v90, "updateTopAttributeConstant:");
          -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "contentOffset");
          self->_containingScrollViewContentOffset.x = v92;
          self->_containingScrollViewContentOffset.y = v93;
          objc_msgSend(v91, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
          -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 1);

        }
        else
        {
          objc_msgSend(v81, "_existingView");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E16EDF20);
          -[UISearchDisplayController _enableParentScrollViews](self, "_enableParentScrollViews");
          objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillShowNotification"), 0);
          objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillHideNotification"), 0);
          -[UISearchBar searchField](self->_searchBar, "searchField");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "resignFirstResponder");

          -[UISearchBar searchField](self->_searchBar, "searchField");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "_clearBecomeFirstResponderWhenCapable");

          -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

          -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 0);
        }
        v243[0] = MEMORY[0x1E0C809B0];
        v243[1] = 3221225472;
        v243[2] = __48__UISearchDisplayController_setActive_animated___block_invoke;
        v243[3] = &unk_1E16B1B78;
        v244 = v4;
        v243[4] = self;
        v241[0] = MEMORY[0x1E0C809B0];
        v241[1] = 3221225472;
        v241[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_2;
        v241[3] = &unk_1E16B7F38;
        v242 = v4;
        v241[4] = self;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v243, v241, 0.25);

      }
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
      goto LABEL_201;
    }
    v26 = -[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette");
    v27 = off_1E167B000;
    v28 = MEMORY[0x1E0C809B0];
    v203 = v19;
    if (v26)
    {
      v29 = objc_loadWeakRetained((id *)&self->_viewController);
      v30 = v29;
      if (v4)
        objc_msgSend(v29, "view");
      else
        objc_msgSend(v29, "_existingView");
      v201 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(v45, "navigationController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "existingPaletteForEdge:", 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)&self->_searchDisplayControllerFlags &= ~0x1000u;
      if (!v4)
      {
        -[UISearchDisplayController _enableParentScrollViews](self, "_enableParentScrollViews");
        -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E16EDF20);
        objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillShowNotification"), 0);
        objc_msgSend(v21, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillHideNotification"), 0);
        objc_msgSend(v21, "removeObserver:name:object:", self, 0x1E17127A0, v46);
        objc_msgSend(v21, "removeObserver:name:object:", self, 0x1E17127C0, v46);
        -[UISearchBar searchField](self->_searchBar, "searchField");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "resignFirstResponder");

        -[UISearchBar searchField](self->_searchBar, "searchField");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "_clearBecomeFirstResponderWhenCapable");

        -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

        -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 0);
        -[UISearchBar searchField](self->_searchBar, "searchField");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "_setSuffix:withColor:", 0, 0);

        v67 = (__int16)self->_searchDisplayControllerFlags;
        if ((v67 & 8) != 0)
        {
          *(_WORD *)&self->_searchDisplayControllerFlags = v67 & 0xFFF7;
          v68 = 0.0;
          if (v19)
            v68 = 0.25;
          objc_msgSend(v46, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 0, 1, v68);
          -[UISearchBar _setBarPosition:](self->_searchBar, "_setBarPosition:", self->_unactivatedBarPosition);
          objc_msgSend(v47, "setPinningBarShadowIsHidden:", (*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1);
        }
LABEL_123:
        v132 = v27[372];
        v237[0] = v28;
        v237[1] = 3221225472;
        v237[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_3;
        v237[3] = &unk_1E16B4030;
        v240 = v4;
        v237[4] = self;
        v238 = v47;
        v133 = v201;
        v239 = v133;
        v234[0] = v28;
        v234[1] = 3221225472;
        v234[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_4;
        v234[3] = &unk_1E16B7110;
        v236 = v4;
        v234[4] = self;
        v134 = v238;
        v235 = v134;
        -[__objc2_class animateWithDuration:animations:completion:](v132, "animateWithDuration:animations:completion:", v237, v234, 0.25);
        if (!v19 || v4)
        {
          v136 = (__int16)self->_searchDisplayControllerFlags;
        }
        else
        {
          v135 = -[UIView isHidden](self->_tableView, "isHidden");
          v136 = (__int16)self->_searchDisplayControllerFlags;
          if (!v135)
          {
            *(_WORD *)&self->_searchDisplayControllerFlags = v136 | 0x2000;
            -[UIView backgroundColor](self->_tableView, "backgroundColor");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            p_dimmingView = &self->_dimmingView;
            if (v137)
              -[UIView backgroundColor](self->_tableView, "backgroundColor");
            else
              +[UIColor whiteColor](UIColor, "whiteColor");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setBackgroundColor:](*p_dimmingView, "setBackgroundColor:", v142);

            -[UIView setAlpha:](*p_dimmingView, "setAlpha:", 0.0);
            v141 = 0;
            v140 = 1;
            v27 = off_1E167B000;
LABEL_132:
            -[UIView setHidden:](*p_dimmingView, "setHidden:", v141);
            if (v4)
            {
              if (-[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField"))
              {
                -[UIView setHidden:](self->_dimmingView, "setHidden:", 1);
                -[UISearchDisplayController _setTableViewVisible:inView:](self, "_setTableViewVisible:inView:", 1, 0);
                if (v203)
                {
                  -[UIView setAlpha:](self->_tableView, "setAlpha:", 0.0);
                  v143 = v27[372];
                  v233[0] = v28;
                  v233[1] = 3221225472;
                  v233[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_5;
                  v233[3] = &unk_1E16B1B28;
                  v233[4] = self;
                  -[__objc2_class animateWithDuration:animations:](v143, "animateWithDuration:animations:", v233, 0.25);
                }
              }
            }
            v144 = v27[372];
            if (v140)
            {
              v232[0] = v28;
              v232[1] = 3221225472;
              v232[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_6;
              v232[3] = &unk_1E16B1B28;
              v232[4] = self;
              v231[0] = v28;
              v231[1] = 3221225472;
              v231[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_7;
              v231[3] = &unk_1E16B7A60;
              v231[4] = self;
              v231[5] = 0x3FC0000000000000;
              -[__objc2_class animateWithDuration:animations:completion:](v144, "animateWithDuration:animations:completion:", v232, v231, 0.125);
            }
            else
            {
              v229[0] = v28;
              v229[1] = 3221225472;
              v229[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_9;
              v229[3] = &unk_1E16B1B78;
              v229[4] = self;
              v230 = v4;
              -[__objc2_class animateWithDuration:animations:](v144, "animateWithDuration:animations:", v229, 0.125);
            }
            v145 = v27[372];
            v227[0] = v28;
            v227[1] = 3221225472;
            v227[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_10;
            v227[3] = &unk_1E16B1B78;
            v227[4] = self;
            v228 = v4;
            v225[0] = v28;
            v225[1] = 3221225472;
            v225[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_11;
            v225[3] = &unk_1E16B7F38;
            v226 = v4;
            v225[4] = self;
            -[__objc2_class animateWithDuration:delay:options:animations:completion:](v145, "animateWithDuration:delay:options:animations:completion:", 4, v227, v225, 0.25, 0.0);

            *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
            if (v203)
              goto LABEL_203;
            goto LABEL_201;
          }
        }
        *(_WORD *)&self->_searchDisplayControllerFlags = v136 & 0xDFFF;
        -[UISearchDisplayController _dimmingViewColor](self, "_dimmingViewColor");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        p_dimmingView = &self->_dimmingView;
        -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v139);

        -[UISearchDisplayController _dimmingViewAlpha](self, "_dimmingViewAlpha");
        -[UIView setAlpha:](self->_dimmingView, "setAlpha:");
        v140 = 0;
        v141 = -[UISearchDisplayController dimTableViewOnEmptySearchString](self, "dimTableViewOnEmptySearchString") ^ 1;
        goto LABEL_132;
      }
      v48 = self->_searchBar;
      objc_msgSend(v46, "navigationBar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_appearanceStorage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_barButtonAppearanceStorage");
      v198 = v47;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchBar _setupCancelButtonWithAppearance:](v48, "_setupCancelButtonWithAppearance:", v51);

      -[UISearchBar set_forceCenteredPlaceholderLayout:](self->_searchBar, "set_forceCenteredPlaceholderLayout:", 1);
      -[UIView layoutBelowIfNeeded](self->_searchBar, "layoutBelowIfNeeded");
      -[UISearchBar set_forceCenteredPlaceholderLayout:](self->_searchBar, "set_forceCenteredPlaceholderLayout:", 0);
      -[UISearchDisplayController _hideVisibleRefreshControl](self, "_hideVisibleRefreshControl");
      -[UIView _screen](self->_searchBar, "_screen");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v52);

      -[UIView _screen](self->_searchBar, "_screen");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v53);

      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidShowViewController_, 0x1E17127A0, v46);
      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidCancelShowingViewController_, 0x1E17127C0, v46);
      v54 = -[UISearchDisplayController _containerView](self, "_containerView");
      v55 = self->_containerView;
      objc_msgSend(v201, "bounds");
      -[UIView setFrame:](v55, "setFrame:");
      objc_msgSend(v201, "addSubview:", self->_containerView);
      -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "contentOffset");
      self->_containingScrollViewContentOffset.x = v57;
      self->_containingScrollViewContentOffset.y = v58;
      objc_msgSend(v56, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
      -[UISearchDisplayController _watchContainingTableViewForScrolling:](self, "_watchContainingTableViewForScrolling:", 1);
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0)
      {
        if (!-[UISearchDisplayController isNavigationBarHidingEnabled](self, "isNavigationBarHidingEnabled")
          || objc_msgSend(v46, "isNavigationBarHidden"))
        {
          *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
LABEL_109:
          v120 = objc_loadWeakRetained((id *)&self->_viewController);
          v121 = objc_msgSend(v120, "edgesForExtendedLayout");

          if ((v121 & 1) != 0)
          {
            objc_msgSend(v46, "navigationBar");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "frame");
            Height = CGRectGetHeight(v246);
            v47 = v198;
            objc_msgSend(v198, "bounds");
            v124 = Height + CGRectGetHeight(v247);

            -[UISearchDisplayControllerContainerView updateTopViewHeight:](self->_containerView, "updateTopViewHeight:", v124);
          }
          else
          {
            -[UISearchDisplayControllerContainerView collapseTopView](self->_containerView, "collapseTopView");
            v47 = v198;
          }
          if (-[UISearchDisplayController _shouldAccountForStatusBarHeight](self, "_shouldAccountForStatusBarHeight"))
          {
            v125 = self->_containerView;
            -[UISearchDisplayController _statusBarHeight](self, "_statusBarHeight");
            -[UISearchDisplayControllerContainerView updateTopAttributeConstant:](v125, "updateTopAttributeConstant:");
          }
          -[UIView layoutIfNeeded](self->_containerView, "layoutIfNeeded");
          -[UISearchBar _allowCursorToAppear:](self->_searchBar, "_allowCursorToAppear:", 0);
          self->_unactivatedBarPosition = -[UISearchBar barPosition](self->_searchBar, "barPosition");
          if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0 && objc_msgSend(v47, "boundaryEdge") == 2)
          {
            -[UIView window](self->_searchBar, "window");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            __UIStatusBarManagerForWindow(v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = objc_msgSend(v127, "isStatusBarHidden");

            v47 = v198;
            if ((v128 & 1) == 0
              && (-[UISearchBar barPosition](self->_searchBar, "barPosition") == 2
               || !-[UISearchBar barPosition](self->_searchBar, "barPosition")))
            {
              if (!-[UISearchDisplayController _containedInPopover](self, "_containedInPopover"))
                goto LABEL_121;
              v129 = objc_loadWeakRetained((id *)&self->_viewController);
              objc_msgSend(v129, "_popoverController");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "_managingSplitViewController");
              v131 = (void *)objc_claimAutoreleasedReturnValue();

              v47 = v198;
              if (v131)
LABEL_121:
                -[UISearchBar _setBarPosition:](self->_searchBar, "_setBarPosition:", 3);
            }
          }
          -[UISearchDisplayController _disableParentScrollViews](self, "_disableParentScrollViews");

          v28 = MEMORY[0x1E0C809B0];
          v27 = off_1E167B000;
          goto LABEL_123;
        }
        *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;
      }
      objc_msgSend(v198, "setVisibleWhenPinningBarIsHidden:", 1);
      v117 = 0.0;
      if (v19)
        v117 = 0.25;
      objc_msgSend(v46, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 1, 1, v117);
      objc_msgSend(v46, "navigationBar");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v118, "_hidesShadow"))
        v119 = 0x4000;
      else
        v119 = 0;
      *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xBFFF | v119;

      objc_msgSend(v198, "setPinningBarShadowIsHidden:", 1);
      goto LABEL_109;
    }
    v197 = a2;
    if (!v4)
      -[UISearchDisplayController _enableParentScrollViews](self, "_enableParentScrollViews");
    p_viewController = &self->_viewController;
    v35 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v35, "navigationController");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    v38 = (__int16)self->_searchDisplayControllerFlags;
    v193 = v38;
    v39 = 0;
    if (v19 && !v4)
    {
      v40 = -[UIView isHidden](self->_tableView, "isHidden");
      v37 = !v40;
      if (v40)
        v39 = 0;
      else
        v39 = 0x2000;
      v38 = (__int16)self->_searchDisplayControllerFlags;
    }
    v200 = v37;
    *(_WORD *)&self->_searchDisplayControllerFlags = v39 | v38 & 0xDFFF;
    v194 = -[UISearchBar _scopeBarIsVisible](self->_searchBar, "_scopeBarIsVisible");
    v41 = self->_searchBar;
    if (v4)
    {
      objc_msgSend(v36, "navigationBar");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_appearanceStorage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_barButtonAppearanceStorage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchBar _setupCancelButtonWithAppearance:](v41, "_setupCancelButtonWithAppearance:", v44);

      p_viewController = &self->_viewController;
      -[UISearchBar set_forceCenteredPlaceholderLayout:](self->_searchBar, "set_forceCenteredPlaceholderLayout:", 1);
      -[UIView layoutBelowIfNeeded](self->_searchBar, "layoutBelowIfNeeded");
      -[UISearchBar set_forceCenteredPlaceholderLayout:](self->_searchBar, "set_forceCenteredPlaceholderLayout:", 0);
      -[UISearchBar _allowCursorToAppear:](self->_searchBar, "_allowCursorToAppear:", 0);
    }
    else
    {
      -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E16EDF20);
      -[UISearchBar searchField](self->_searchBar, "searchField");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "resignFirstResponder");

    }
    v60 = (void *)UIApp;
    -[UIView window](self->_searchBar, "window");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v60, "_safeInterfaceOrientationForWindowIfExists:", v61) - 3) > 1)
    {

    }
    else
    {
      v62 = -[UISearchBar _allowsInlineScopeBar](self->_searchBar, "_allowsInlineScopeBar");

      if (v62)
      {
LABEL_51:
        -[UISearchDisplayController _hideVisibleRefreshControl](self, "_hideVisibleRefreshControl");
        if (v4)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "userInterfaceIdiom");

          if ((v70 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            v71 = 0;
          }
          else
          {
            -[UIView _containingScrollView](self->_searchBar, "_containingScrollView");
            v71 = objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend((id)v71, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
          objc_storeWeak(&self->_navigationControllerBookkeeper, v36);
          v73 = objc_loadWeakRetained((id *)p_viewController);
          objc_msgSend(v73, "view");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(0, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
          v72 = objc_loadWeakRetained(&self->_navigationControllerBookkeeper);

          if (v36 != v72)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v189, "handleFailureInMethod:object:file:lineNumber:description:", v197, self, CFSTR("UISearchDisplayController.m"), 1269, CFSTR("search contents navigation controller must not change between -setActive:YES and -setActive:NO"));

          }
          v73 = objc_loadWeakRetained((id *)p_viewController);
          objc_msgSend(v73, "_existingView");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
        }
        v94 = v74;

        if (v94)
        {
          -[UISearchDisplayController _containingTableView](self, "_containingTableView");
          v199 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v199 = 0;
        }
        v192 = (void *)v71;
        if (v4)
        {
          v95 = (v71 | v199) != 0;
          *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xEFFF | (v95 << 12);
          -[UISearchDisplayController _containerView](self, "_containerView");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "configureInteractionForContainment:", v95);

          if (objc_msgSend((id)v199, "_pinsTableHeaderView"))
            objc_msgSend((id)v199, "_setIgnorePinnedTableHeaderUpdates:", 1);
          if (!v36)
          {
            location = (id *)p_viewController;
            v196 = 0;
            v97 = 0;
            v190 = 1;
            goto LABEL_163;
          }
        }
        else if (!v36)
        {
          LOBYTE(v196) = 0;
          goto LABEL_101;
        }
        objc_msgSend(v36, "navigationBar");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v98, "isTranslucent");

        objc_msgSend(v36, "navigationBar");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "_barPosition");

        if (v4)
        {
          v101 = objc_loadWeakRetained((id *)p_viewController);
          v196 = objc_msgSend(v36, "_shouldNavigationBarInsetViewController:", v101);

          location = (id *)p_viewController;
          if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0)
          {
            if (!-[UISearchDisplayController isNavigationBarHidingEnabled](self, "isNavigationBarHidingEnabled")
              || objc_msgSend(v36, "isNavigationBarHidden"))
            {
              *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
LABEL_148:
              self->_unactivatedBarPosition = -[UISearchBar barPosition](self->_searchBar, "barPosition");
              if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
              {
                if (v100 == 3
                  && (-[UIView window](self->_searchBar, "window"),
                      v151 = (void *)objc_claimAutoreleasedReturnValue(),
                      __UIStatusBarManagerForWindow(v151),
                      v152 = (void *)objc_claimAutoreleasedReturnValue(),
                      v153 = objc_msgSend(v152, "isStatusBarHidden"),
                      v152,
                      v151,
                      !v153)
                  || -[UISearchDisplayController _containedInPopover](self, "_containedInPopover")
                  && !-[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar"))
                {
                  -[UISearchDisplayController _additionalNonCollapsingHeightAboveSearchBar](self, "_additionalNonCollapsingHeightAboveSearchBar");
                  if (v154 == 0.0
                    && (-[UISearchBar barPosition](self->_searchBar, "barPosition") == 2
                     || !-[UISearchBar barPosition](self->_searchBar, "barPosition")))
                  {
                    -[UISearchBar _setBarPosition:](self->_searchBar, "_setBarPosition:", 3);
                  }
                }
              }
              if (-[UISearchBar barPosition](self->_searchBar, "barPosition") == 3)
              {
                objc_msgSend(v36, "navigationBar");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v155, "_hidesShadow"))
                  v156 = 0x4000;
                else
                  v156 = 0;
                *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xBFFF | v156;

              }
              objc_msgSend(v36, "navigationBar");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "_setHidesShadow:", 1);

              objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerWillShowViewController_, 0x1E1712780, v36);
              objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidShowViewController_, 0x1E17127A0, v36);
              objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_navigationControllerDidCancelShowingViewController_, 0x1E17127C0, v36);
              v190 = 0;
LABEL_163:
              objc_msgSend(v94, "bounds");
              -[UIView setFrame:](self->_containerView, "setFrame:");
              v158 = objc_loadWeakRetained(location);
              objc_msgSend(v158, "_recordContentScrollView");

              v159 = 0.0;
              if (-[UISearchDisplayController _shouldAccountForStatusBarHeight](self, "_shouldAccountForStatusBarHeight"))
              {
                -[UISearchDisplayController _statusBarHeight](self, "_statusBarHeight");
                v159 = v160 + 0.0;
              }
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v162 = self->_searchDisplayControllerFlags;
              v163 = v97;
              if ((isKindOfClass & 1) != 0)
              {
                if ((v196 & (*(unsigned int *)&v162 >> 3)) == 1)
                {
                  v164 = MEMORY[0x1E0C809B0];
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_13;
                  aBlock[3] = &unk_1E16B1888;
                  aBlock[4] = self;
                  *(double *)&aBlock[5] = v159;
                  v116 = _Block_copy(aBlock);
                  v159 = 0.0;
                  v115 = 1;
                  goto LABEL_172;
                }
              }
              else if ((*(_BYTE *)&v162 & 8) != 0)
              {
                if ((v196 & 1) == 0)
                {
                  objc_msgSend(v36, "navigationBar");
                  v187 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v187, "bounds");
                  v188 = CGRectGetHeight(v248);

                  v159 = v159 + v188;
                  v164 = MEMORY[0x1E0C809B0];
                  v224[0] = MEMORY[0x1E0C809B0];
                  v224[1] = 3221225472;
                  v224[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_12;
                  v224[3] = &unk_1E16B4E70;
                  v224[4] = self;
                  *(double *)&v224[5] = v159;
                  *(double *)&v224[6] = v188;
                  v116 = _Block_copy(v224);
                  v115 = 0;
LABEL_172:
                  v219[0] = v164;
                  v219[1] = 3221225472;
                  v219[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_14;
                  v219[3] = &unk_1E16B1C28;
                  v220 = v94;
                  v221 = self;
                  v222 = v159;
                  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v219);
                  -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v167, "contentOffset");
                  self->_containingScrollViewContentOffset.x = v168;
                  self->_containingScrollViewContentOffset.y = v169;

                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) == 0
                    && ((v190 | v163 | objc_msgSend(v36, "isNavigationBarHidden")) & 1) == 0)
                  {
                    -[UISearchDisplayControllerContainerView collapseTopView](self->_containerView, "collapseTopView");
                  }
                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) == 0)
                  {
                    -[UIView _viewControllerForAncestor](self->_searchBar, "_viewControllerForAncestor");
                    v170 = (id)objc_claimAutoreleasedReturnValue();
                    v171 = objc_loadWeakRetained(location);

                    if (v170 != v171)
                      -[UISearchDisplayControllerContainerView collapseTopView](self->_containerView, "collapseTopView");
                  }

LABEL_179:
                  if (v200)
                  {
                    -[UIView backgroundColor](self->_tableView, "backgroundColor");
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    v173 = &self->_dimmingView;
                    if (v172)
                      -[UIView backgroundColor](self->_tableView, "backgroundColor");
                    else
                      +[UIColor whiteColor](UIColor, "whiteColor");
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIView setBackgroundColor:](*v173, "setBackgroundColor:", v177);

                    -[UIView setAlpha:](*v173, "setAlpha:", 0.0);
                    v176 = 0;
                  }
                  else
                  {
                    -[UISearchDisplayController _dimmingViewColor](self, "_dimmingViewColor");
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    v173 = &self->_dimmingView;
                    -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v174);

                    v175 = 0.0;
                    if (!v4)
                      -[UISearchDisplayController _dimmingViewAlpha](self, "_dimmingViewAlpha", 0.0);
                    -[UIView setAlpha:](self->_dimmingView, "setAlpha:", v175);
                    v176 = -[UISearchDisplayController dimTableViewOnEmptySearchString](self, "dimTableViewOnEmptySearchString") ^ 1;
                  }
                  -[UIView setHidden:](*v173, "setHidden:", v176);
                  v195 = v21;
                  if (v4)
                  {
                    if (-[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField"))
                    {
                      -[UIView setHidden:](self->_dimmingView, "setHidden:", 1);
                      -[UISearchDisplayController _setTableViewVisible:inView:](self, "_setTableViewVisible:inView:", 1, 0);
                      if (v203)
                      {
                        -[UIView setAlpha:](self->_tableView, "setAlpha:", 0.0);
                        v218[0] = MEMORY[0x1E0C809B0];
                        v218[1] = 3221225472;
                        v218[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_15;
                        v218[3] = &unk_1E16B1B28;
                        v218[4] = self;
                        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v218, 0.25);
                      }
                      -[UISearchBar _setMaskActive:](self->_searchBar, "_setMaskActive:", 0);
                    }
                    else
                    {
                      -[UISearchBar _setMaskActive:](self->_searchBar, "_setMaskActive:", 0);
                      if ((v115 & 1) == 0)
                        goto LABEL_197;
                    }
                  }
                  else if (!v115)
                  {
                    goto LABEL_197;
                  }
                  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0)
                    -[UISearchDisplayController _hoistSearchBar](self, "_hoistSearchBar");
LABEL_197:
                  v178 = MEMORY[0x1E0C809B0];
                  v206[0] = MEMORY[0x1E0C809B0];
                  v206[1] = 3221225472;
                  v206[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_17;
                  v206[3] = &unk_1E16C13E8;
                  v206[4] = self;
                  v212 = v4;
                  v179 = v36;
                  v207 = v179;
                  v180 = v203;
                  v213 = v203;
                  v181 = v94;
                  v208 = v181;
                  v182 = v116;
                  v211 = v182;
                  v214 = (v193 & 8) != 0;
                  v215 = v196;
                  v216 = v194;
                  v183 = v192;
                  v209 = v183;
                  v184 = (id)v199;
                  v210 = v184;
                  v217 = v200;
                  v204[0] = v178;
                  v204[1] = 3221225472;
                  v204[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_25;
                  v204[3] = &unk_1E16B7F38;
                  v205 = v203;
                  v204[4] = self;
                  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v203, &__block_literal_global_110_0, v206, v204);
                  if (v4)
                  {
                    -[UISearchDisplayController _disableParentScrollViews](self, "_disableParentScrollViews");
                    -[UIView _screen](self->_searchBar, "_screen");
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = v195;
                    objc_msgSend(v195, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v185);

                    -[UIView _screen](self->_searchBar, "_screen");
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    v180 = v203;
                    objc_msgSend(v195, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v186);
                  }
                  else
                  {
                    v21 = v195;
                    objc_msgSend(v195, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillShowNotification"), 0);
                    objc_msgSend(v195, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillHideNotification"), 0);
                    -[UISearchBar searchField](self->_searchBar, "searchField");
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v186, "_clearBecomeFirstResponderWhenCapable");
                  }

                  *(_WORD *)&self->_searchDisplayControllerFlags &= ~2u;
                  if (v180)
                  {
LABEL_203:

                    return;
                  }
LABEL_201:
                  if (!-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
                    -[UISearchDisplayController showHideAnimationDidFinish](self, "showHideAnimationDidFinish");
                  goto LABEL_203;
                }
              }
              else
              {
                v165 = self->_searchBar;
                -[UIView bounds](v165, "bounds");
                -[UIView convertRect:toView:](v165, "convertRect:toView:", v94);
                v159 = v166;
              }
              v115 = 0;
              v116 = 0;
              v164 = MEMORY[0x1E0C809B0];
              goto LABEL_172;
            }
            *(_WORD *)&self->_searchDisplayControllerFlags |= 8u;
          }
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = objc_msgSend(v146, "userInterfaceIdiom");

          if ((v147 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            objc_msgSend(v36, "setPretendNavBarHidden:", 1);
          v148 = objc_loadWeakRetained(location);
          objc_msgSend(v36, "topViewController");
          v149 = (id)objc_claimAutoreleasedReturnValue();

          if (v148 == v149)
          {
            objc_msgSend(v36, "_setNavigationBarHidesCompletelyOffscreen:", 1);
            v150 = 0.0;
            if (v19)
              v150 = 0.25;
            objc_msgSend(v36, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 1, 1, v150);
          }
          goto LABEL_148;
        }
        if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "userInterfaceIdiom");

          if ((v109 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            objc_msgSend(v36, "setPretendNavBarHidden:", 0);
            objc_msgSend(v36, "setAvoidMovingNavBarOffscreenBeforeUnhiding:", 1);
          }
          *(_WORD *)&self->_searchDisplayControllerFlags &= ~8u;
          v110 = 0.0;
          if (v19)
            v110 = 0.25;
          objc_msgSend(v36, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 0, 1, v110);
          objc_msgSend(v36, "_setNavigationBarHidesCompletelyOffscreen:", 0);
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v111, "userInterfaceIdiom");

          v104 = &unk_1E16C0000;
          if ((v112 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            objc_msgSend(v36, "setAvoidMovingNavBarOffscreenBeforeUnhiding:", 0);
          v113 = objc_loadWeakRetained((id *)p_viewController);
          LOBYTE(v196) = objc_msgSend(v36, "_shouldNavigationBarInsetViewController:", v113);

          v102 = &unk_1E16C0000;
          v103 = &unk_1E16C0000;
        }
        else
        {
          LOBYTE(v196) = 0;
          v102 = (_QWORD *)&unk_1E16C0000;
          v103 = (_QWORD *)&unk_1E16C0000;
          v104 = (_QWORD *)&unk_1E16C0000;
        }
        -[UISearchBar _setBarPosition:](self->_searchBar, "_setBarPosition:", self->_unactivatedBarPosition);
        objc_msgSend(v36, "navigationBar");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "_setHidesShadow:", (*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1);

        objc_msgSend(v21, "removeObserver:name:object:", self, v104[175], v36);
        objc_msgSend(v21, "removeObserver:name:object:", self, v103[176], v36);
        objc_msgSend(v21, "removeObserver:name:object:", self, v102[177], v36);
LABEL_101:
        v115 = 0;
        v116 = 0;
        goto LABEL_179;
      }
    }
    -[UISearchBar _setShowsScopeBar:animateOpacity:](self->_searchBar, "_setShowsScopeBar:animateOpacity:", v4, 1);
    goto LABEL_51;
  }
  if (visible
    && -[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar", visible, animated)
    && -[UISearchBar isSearchResultsButtonSelected](self->_searchBar, "isSearchResultsButtonSelected"))
  {
    -[UISearchBar searchField](self->_searchBar, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEditing");

    if (v8)
    {
      popoverController = self->_popoverController;
      -[UISearchBar searchField](self->_searchBar, "searchField");
      v202 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[UISearchBar searchField](self->_searchBar, "searchField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v18, 3, 1, v11, v13, v15, v17);

    }
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke(uint64_t a1)
{
  double v2;

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "isHidden"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 0);
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", v2);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 128), "setHidden:", 1);
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 128), "removeFromSuperview");
  }
  return result;
}

void __48__UISearchDisplayController_setActive_animated___block_invoke_3(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  int v6;
  __int16 v7;
  id v8;
  CGRect v9;

  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "isHidden"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 0);
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 56))
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v3 + 256) & 8) != 0)
    {
      v4 = *(void **)(v3 + 128);
      objc_msgSend(*(id *)(a1 + 40), "bounds");
      objc_msgSend(v4, "updateTopViewHeight:animateUpdate:", 1, CGRectGetHeight(v9));
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(id *)(a1 + 48);
    v6 = *(unsigned __int8 *)(a1 + 56);
    v8 = v5;
    if (*(_BYTE *)(a1 + 56))
    {
      if (objc_msgSend(v5, "isIndexHidden"))
        v7 = 0;
      else
        v7 = 4;
      *(_WORD *)(*(_QWORD *)(a1 + 32) + 256) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 256) & 0xFFFB | v7;
    }
    else if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 256) & 4) == 0)
    {
LABEL_18:

      return;
    }
    objc_msgSend(v8, "setIndexHiddenForSearch:", v6 != 0);
    v5 = v8;
    goto LABEL_18;
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "setVisibleWhenPinningBarIsHidden:", *(unsigned __int8 *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateDidBeginDidEndSearch");
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 1.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 1.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_7(uint64_t a1)
{
  double v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setHidden:", 1);
  v2 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_8;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, v2);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_9(uint64_t a1)
{
  double v2;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_dimmingViewAlpha");
  else
    v2 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", v2);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_10(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_WORD *)(v1 + 256) & 0x200) == 0)
    return objc_msgSend(*(id *)(v1 + 32), "_setShowsCancelButton:", *(unsigned __int8 *)(result + 40));
  return result;
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_11(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 32), "_allowCursorToAppear:", 1);
  return result;
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "updateTopAttributeConstant:", *(double *)(a1 + 40) - *(double *)(a1 + 48));
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "updateTopAttributeConstant:", *(double *)(a1 + 40));
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "updateTopAttributeConstant:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "layoutIfNeeded");
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 1.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, 0.25, 0.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double Height;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v29;
  void *v30;
  double v31;
  _QWORD v32[6];
  _QWORD v33[4];
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setShadowVisibleIfNecessary:", *(unsigned __int8 *)(a1 + 80));
  if (*(_BYTE *)(a1 + 80) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isTranslucent"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setScopeBarHidden:", 0);
  v2 = (void *)UIApp;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v2, "_safeInterfaceOrientationForWindowIfExists:", v3) - 3) > 1)
  {

  }
  else
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_allowsInlineScopeBar");

    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setShowsScopeBar:animateOpacity:", *(unsigned __int8 *)(a1 + 80), 1);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchBarStyle") == 2)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_backgroundBackdropStyle");

      if (!v6)
        goto LABEL_14;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_updateBackgroundToBackdropStyle:", v6);
  }
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sizeToFit");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 128);
  objc_msgSend(*(id *)(v7 + 32), "bounds");
  Height = CGRectGetHeight(v37);
  objc_msgSend(*(id *)(a1 + 32), "_additionalNonCollapsingHeightAboveSearchBar");
  objc_msgSend(v8, "updateTopViewHeight:animateUpdate:", 1, Height + v10);
  v11 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 80))
  {
    v12 = *(unsigned __int8 *)(a1 + 81);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_19;
    v35[3] = &unk_1E16B1B50;
    v35[4] = *(_QWORD *)(a1 + 32);
    v36 = *(id *)(a1 + 48);
    +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v12, &__block_literal_global_111, v35, 0);
    v13 = *(_QWORD *)(a1 + 72);
    if (v13)
      (*(void (**)(void))(v13 + 16))();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 82) && *(_BYTE *)(a1 + 83))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "updateTopAttributeConstant:", 0.0);
    }
    else if (*(_BYTE *)(a1 + 82) && !*(_BYTE *)(a1 + 83))
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bounds");
      v31 = CGRectGetHeight(v39);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "adjustTopAttributeConstantByDelta:", v31);
    }
  }
  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setSuffix:withColor:", 0, 0);

    if (*(_BYTE *)(a1 + 84))
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isHidden") & 1) == 0
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_allowsInlineScopeBar") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:", 0);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "_setAutomaticContentOffsetAdjustmentEnabled:", 1);
  v14 = *(void **)(a1 + 64);
  if (v14)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      if (objc_msgSend(v14, "isIndexHidden"))
        v15 = 0;
      else
        v15 = 4;
      *(_WORD *)(*(_QWORD *)(a1 + 32) + 256) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 256) & 0xFFFB | v15;
      objc_msgSend(*(id *)(a1 + 64), "setIndexHiddenForSearch:", 1);
      v16 = 0;
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 32);
      if ((*(_WORD *)(v18 + 256) & 4) == 0)
        goto LABEL_36;
      objc_msgSend(v14, "setIndexHiddenForSearch:", 0);
      v16 = *(_QWORD *)(a1 + 64);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_updateInsetsForTableView:", v16);
    v18 = *(_QWORD *)(a1 + 32);
LABEL_36:
    objc_msgSend(*(id *)(v18 + 32), "bounds");
    v19 = CGRectGetHeight(v38);
    v20 = 0.0;
    if (*(_BYTE *)(a1 + 80) && *(_BYTE *)(a1 + 83))
    {
      objc_msgSend(*(id *)(a1 + 32), "_statusBarHeight");
      v20 = v21;
    }
    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 64), "tableHeaderView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v23)
    {
      v24 = v19 + v20;
      objc_msgSend(*(id *)(a1 + 64), "heightForTableHeaderViewHiding");
      v26 = v25;

      if (v24 != v26)
        objc_msgSend(*(id *)(a1 + 64), "_tableHeaderHeightDidChangeToHeight:", v24);
    }
    else
    {

    }
    if (*(_BYTE *)(a1 + 81))
      objc_msgSend(*(id *)(a1 + 64), "layoutBelowIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_updatePinnedSearchBar");
  }
  v27 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v27 + 256) & 0x200) == 0)
  {
    objc_msgSend(*(id *)(v27 + 32), "_setShowsCancelButton:", *(unsigned __int8 *)(a1 + 80));
    v27 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v27 + 32), "layoutBelowIfNeeded");
  if (*(_BYTE *)(a1 + 85))
  {
    v33[0] = v11;
    v33[1] = 3221225472;
    v33[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_20;
    v33[3] = &unk_1E16B1B28;
    v34 = *(_QWORD *)(a1 + 32);
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_21;
    v32[3] = &unk_1E16B7A60;
    v32[4] = v34;
    v32[5] = 0x3FC0000000000000;
    return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v33, v32, 0.125, 0.0);
  }
  else
  {
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 32), "_dimmingViewAlpha");
    else
      v29 = 0.0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", v29);
  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, 0.0, 0.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_19(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  return objc_msgSend(v1, "setFrame:");
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 1.0);
}

void __48__UISearchDisplayController_setActive_animated___block_invoke_21(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 0.0);
  v2 = *(double *)(a1 + 40);
  v3 = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_22;
  v10[3] = &unk_1E16B1B28;
  v11 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_23;
  v9[3] = &unk_1E16B3FD8;
  v9[4] = v11;
  v10[0] = MEMORY[0x1E0C809B0];
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v10, v9, v2, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_topShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(double *)(a1 + 40);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __48__UISearchDisplayController_setActive_animated___block_invoke_24;
    v7[3] = &unk_1E16B1B28;
    v8 = v4;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6);

  }
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeFromSuperview");
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __48__UISearchDisplayController_setActive_animated___block_invoke_25(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "showHideAnimationDidFinish");
  return result;
}

- (void)setActive:(BOOL)active
{
  -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", active, 0);
}

- (BOOL)isActive
{
  return *(_WORD *)&self->_searchDisplayControllerFlags & 1;
}

- (void)_updatePinnedSearchBar
{
  id v3;

  -[UISearchDisplayController _containingTableView](self, "_containingTableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_pinsTableHeaderView")
    && (~*(_WORD *)&self->_searchDisplayControllerFlags & 3) == 0
    && !-[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField"))
  {
    objc_msgSend(v3, "_rectForTableHeaderView");
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
  }

}

- (double)_updateNavigationPalette
{
  void *v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UISearchBar *searchBar;
  double Height;
  CGRect v17;
  CGRect v18;

  -[UISearchBar prompt](self->_searchBar, "prompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    -[UIView bounds](self->_searchBar, "bounds");
    return CGRectGetHeight(v17);
  }
  if (-[UISearchBar _scopeBarIsVisible](self->_searchBar, "_scopeBarIsVisible"))
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingPaletteForEdge:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UINavigationBar defaultSizeForOrientation:](UINavigationBar, "defaultSizeForOrientation:", objc_msgSend(v8, "interfaceOrientation"));
    v10 = v9;
    v12 = v11;

    objc_msgSend(v7, "frame");
    if (v14 != v10 || v13 != v12)
    {
      objc_msgSend(v7, "frame");
      objc_msgSend(v7, "setFrame:");
      searchBar = self->_searchBar;
      objc_msgSend(v7, "bounds");
      -[UISearchBar setFrame:](searchBar, "setFrame:");
      -[UISearchBar setNeedsLayout](self->_searchBar, "setNeedsLayout");
      -[UIView layoutIfNeeded](self->_searchBar, "layoutIfNeeded");
    }
    objc_msgSend(v7, "frame");
    Height = CGRectGetHeight(v18);
  }
  else
  {
    Height = -1.0;
  }

  return Height;
}

- (void)_keyboardWillShow:(id)a3
{
  UITableView *tableView;
  id v5;

  tableView = self->_tableView;
  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView _adjustForAutomaticKeyboardInfo:animated:lastAdjustment:](tableView, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", v5, 1, &self->_lastKeyboardAdjustment);

}

- (void)_keyboardWillHide:(id)a3
{
  UITableView *tableView;
  id v5;

  tableView = self->_tableView;
  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView _adjustForAutomaticKeyboardInfo:animated:lastAdjustment:](tableView, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", v5, 1, &self->_lastKeyboardAdjustment);

}

- (void)windowWillAnimateRotation:(id)a3
{
  UIPopoverController *popoverController;
  double v5;
  double Height;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  UISearchDisplayControllerContainerView *containerView;
  void *v12;
  void *v13;
  UISearchBar *searchBar;
  UISearchBar *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v25 = a3;
  popoverController = self->_popoverController;
  if (popoverController && -[UIPopoverController isPopoverVisible](popoverController, "isPopoverVisible"))
  {
    *(_WORD *)&self->_searchDisplayControllerFlags |= 0x100u;
    -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 0);
  }
  if (!-[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "_existingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bounds](self->_searchBar, "bounds");
    v10 = v9;
    -[UIView sizeToFit](self->_searchBar, "sizeToFit");
    containerView = self->_containerView;
    -[UIView bounds](self->_searchBar, "bounds");
    -[UISearchDisplayControllerContainerView updateTopViewHeight:](containerView, "updateTopViewHeight:", CGRectGetHeight(v26));
    if (v8)
    {
      -[UISearchDisplayController _containingTableView](self, "_containingTableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        searchBar = self->_searchBar;
        objc_msgSend(v12, "tableHeaderView");
        v15 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
        if (searchBar == v15)
        {
          -[UIView bounds](self->_searchBar, "bounds");
          v23 = v22;

          if (v23 != v10)
          {
            -[UIView bounds](self->_searchBar, "bounds");
            objc_msgSend(v13, "_tableHeaderHeightDidChangeToHeight:", v24);
          }
        }
        else
        {

        }
        objc_msgSend(v13, "layoutBelowIfNeeded");
        -[UISearchDisplayController _updatePinnedSearchBar](self, "_updatePinnedSearchBar");

      }
    }
    -[UISearchBar _setBackgroundLayoutNeedsUpdate](self->_searchBar, "_setBackgroundLayoutNeedsUpdate");
    -[UIView layoutBelowIfNeeded](self->_searchBar, "layoutBelowIfNeeded");
    if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0
      && !-[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar"))
    {
      -[UISearchDisplayController _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:](self, "_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:", 0);
    }
    -[UISearchDisplayController _updateSearchBarMaskIfNecessary](self, "_updateSearchBarMaskIfNecessary");
    goto LABEL_23;
  }
  if (-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
  {
    -[UISearchDisplayController _updateNavigationPalette](self, "_updateNavigationPalette");
    Height = v5;
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v16, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    Height = CGRectGetHeight(v27);

  }
  if (Height >= 0.0
    && -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") != 3)
  {
    -[UISearchDisplayControllerContainerView updateTopViewHeight:](self->_containerView, "updateTopViewHeight:", Height);
    -[UISearchDisplayController _adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:](self, "_adjustTableViewContentInsetsAndOffsetsIgnoringCurrent:", 0);
    -[UISearchBar searchField](self->_searchBar, "searchField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_clearButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:forState:", 0, 0);

    -[UISearchBar setNeedsLayout](self->_searchBar, "setNeedsLayout");
    -[UIView layoutIfNeeded](self->_searchBar, "layoutIfNeeded");
    -[UISearchBar searchField](self->_searchBar, "searchField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_updateButtons");

    if (!-[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing"))
    {
      -[UISearchDisplayController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set_titleViewWidthForAnimations:", 14433663.0);
      objc_msgSend(v8, "updateNavigationBarButtonsAnimated:", 1);
LABEL_23:

    }
  }
  -[UIView setContentMode:](self->_noResultsLabel, "setContentMode:", 4);
  -[UISearchDisplayController _updateNoSearchResultsMessageVisiblity](self, "_updateNoSearchResultsMessageVisiblity");

}

- (void)windowDidRotate:(id)a3
{
  __int16 searchDisplayControllerFlags;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 0x100) != 0)
  {
    -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 1, 1);
    searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  }
  *(_WORD *)&self->_searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFEFF;
  -[UIView setContentMode:](self->_noResultsLabel, "setContentMode:", 3);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  if (-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar", a3)
    && -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 2
    && !-[UISearchDisplayController isActive](self, "isActive"))
  {
    -[UISearchDisplayController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    self->_searchFieldInNavigationBarFrame.origin.x = v6;
    self->_searchFieldInNavigationBarFrame.origin.y = v7;
    self->_searchFieldInNavigationBarFrame.size.width = v8;
    self->_searchFieldInNavigationBarFrame.size.height = v9;

    objc_msgSend(v4, "set_titleViewWidthForAnimations:", 14433663.0);
    objc_msgSend(v4, "updateNavigationBarButtonsAnimated:", 1);

  }
  -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 1, 1);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  void *v19;
  CGSize v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || -[UISearchDisplayDelegate _shouldDeactivateOnCancelButtonClicked](self->_delegate, "_shouldDeactivateOnCancelButtonClicked"))
  {
    if (-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
      && -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 2)
    {
      -[UISearchDisplayController navigationItem](self, "navigationItem");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "titleView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 1);
      objc_msgSend(v21, "titleView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v24.origin.x = v14;
      v24.origin.y = v15;
      v24.size.width = v16;
      v24.size.height = v17;
      v22.origin.x = v6;
      v22.origin.y = v8;
      v22.size.width = v10;
      v22.size.height = v12;
      v18 = CGRectEqualToRect(v22, v24);

      if (v18)
      {
        objc_msgSend(v21, "set_titleViewWidthForAnimations:", self->_searchFieldInNavigationBarFrame.size.width);
      }
      else
      {
        objc_msgSend(v21, "titleView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        objc_msgSend(v21, "set_titleViewWidthForAnimations:", CGRectGetWidth(v23));

      }
      v20 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_searchFieldInNavigationBarFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_searchFieldInNavigationBarFrame.size = v20;
      objc_msgSend(v21, "updateNavigationBarButtonsAnimated:", 1);

    }
    else
    {
      -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 1);
    }
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;

  -[UISearchBar searchField](self->_searchBar, "searchField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)searchBarResultsListButtonClicked:(id)a3
{
  -[UISearchBar setSearchResultsButtonSelected:](self->_searchBar, "setSearchResultsButtonSelected:", (*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0);
  -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", (*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0, 1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  id WeakRetained;
  void *v9;
  id v10;

  v5 = a4;
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 2) == 0)
  {
    v10 = v5;
    -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || -[UISearchDisplayDelegate searchDisplayController:shouldReloadTableForSearchString:](self->_delegate, "searchDisplayController:shouldReloadTableForSearchString:", self, v10))
    {
      objc_msgSend(v6, "reloadData");
    }
    v7 = objc_msgSend(v10, "length")
      || -[UIPopoverController isPopoverVisible](self->_popoverController, "isPopoverVisible")
      || -[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField");
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchDisplayController _setTableViewVisible:inView:](self, "_setTableViewVisible:inView:", v7, v9);

    v5 = v10;
  }

}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) == 0)
    -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || -[UISearchDisplayDelegate searchDisplayController:shouldReloadTableForSearchScope:](self->_delegate, "searchDisplayController:shouldReloadTableForSearchScope:", self, a4))
  {
    -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (void)_clearSavedSelectedCellsWeUsedWhenHedgingOurBets
{
  NSArray *savedSelectedCellsWhenViewWillAppear;

  savedSelectedCellsWhenViewWillAppear = self->_savedSelectedCellsWhenViewWillAppear;
  if (savedSelectedCellsWhenViewWillAppear)
  {
    self->_savedSelectedCellsWhenViewWillAppear = 0;

  }
}

- (void)_saveSelectedRowsInCaseViewDoesNotReallyAppear
{
  void *v3;
  NSArray *v4;
  NSArray *savedSelectedCellsWhenViewWillAppear;
  id v6;

  -[UISearchDisplayController _clearSavedSelectedCellsWeUsedWhenHedgingOurBets](self, "_clearSavedSelectedCellsWeUsedWhenHedgingOurBets");
  -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_msgSend(v3, "copy");
  savedSelectedCellsWhenViewWillAppear = self->_savedSelectedCellsWhenViewWillAppear;
  self->_savedSelectedCellsWhenViewWillAppear = v4;

}

- (void)_restoreSelectedCellsInCaseViewDidNotReallyAppear
{
  void *v3;

  if (self->_savedSelectedCellsWhenViewWillAppear)
  {
    -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_selectRowsAtIndexPaths:animated:scrollPosition:notifyDelegate:", self->_savedSelectedCellsWhenViewWillAppear, 0, 0, 0);

    -[UISearchDisplayController _clearSavedSelectedCellsWeUsedWhenHedgingOurBets](self, "_clearSavedSelectedCellsWeUsedWhenHedgingOurBets");
  }
}

- (void)navigationControllerWillShowViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int16 searchDisplayControllerFlags;
  id WeakRetained;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _UINavigationControllerPalette *attachedNavigationPalette;
  _UINavigationControllerPalette *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  _UINavigationControllerPalette *v31;
  UISearchDisplayController *v32;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", 0x1E17127E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", 0x1E1712800);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", 0x1E1712820);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v6, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0.0;
  if ((_DWORD)v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "transitionDuration");
      v13 = v14;
    }
    else
    {
      v13 = 0.25;
    }
  }
  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  if ((searchDisplayControllerFlags & 1) != 0)
  {
    if (v8 == WeakRetained)
    {
      if ((*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
      {
        if (-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
        {
          attachedNavigationPalette = self->_attachedNavigationPalette;
          if (attachedNavigationPalette)
          {
            -[_UINavigationControllerPalette setVisibleWhenPinningBarIsHidden:](attachedNavigationPalette, "setVisibleWhenPinningBarIsHidden:", 1);
            objc_msgSend(v6, "attachPalette:isPinned:", self->_attachedNavigationPalette, 0);
            -[_UINavigationControllerPalette setPinningBarShadowIsHidden:](self->_attachedNavigationPalette, "setPinningBarShadowIsHidden:", (*(_WORD *)&self->_searchDisplayControllerFlags & 0x4000) == 0);
            if (objc_msgSend(v12, "initiallyInteractive"))
            {
              v30[0] = MEMORY[0x1E0C809B0];
              v30[1] = 3221225472;
              v30[2] = __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke;
              v30[3] = &unk_1E16B2E68;
              v31 = v6;
              v32 = self;
              objc_msgSend(v12, "notifyWhenInteractionEndsUsingBlock:", v30);
              v24 = v31;
            }
            else
            {
              v24 = self->_attachedNavigationPalette;
              self->_attachedNavigationPalette = 0;
            }

          }
        }
        objc_msgSend(v6, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 1, 1, v13);
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "userInterfaceIdiom");

        if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1
          && !-[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent"))
        {
          objc_msgSend(v6, "_sendNavigationBarToBack");
        }
        if (-[UISearchBar barPosition](self->_searchBar, "barPosition") == 3)
        {
          objc_msgSend(v6, "navigationBar");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_setHidesShadow:", (*(_WORD *)&self->_searchDisplayControllerFlags & 0x4000) == 0);

        }
      }
      if (v7)
      {
        if (v6 && objc_msgSend(v6, "isInteractiveTransition"))
          -[UISearchDisplayController _saveSelectedRowsInCaseViewDoesNotReallyAppear](self, "_saveSelectedRowsInCaseViewDoesNotReallyAppear");
        -[UITableView _deselectAllNonMultiSelectRowsAnimated:notifyDelegate:](self->_tableView, "_deselectAllNonMultiSelectRowsAnimated:notifyDelegate:", v10, 0);
      }
    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_viewController);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke_2;
      v28[3] = &unk_1E16C0948;
      v29 = v7;
      v18 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)v17, v28);

      if (v18 && (*(_WORD *)&self->_searchDisplayControllerFlags & 8) != 0)
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceIdiom");

        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          objc_msgSend(v6, "setPretendNavBarHidden:", 0);
        objc_msgSend(v6, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 0, 1, v13);
        if (-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
        {
          objc_msgSend(v6, "existingPaletteForEdge:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setVisibleWhenPinningBarIsHidden:", 0);
          objc_msgSend(v21, "setPinningBarShadowIsHidden:", (*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1);
          if (objc_msgSend(v21, "isAttached") && (objc_msgSend(v21, "isPinned") & 1) == 0)
            objc_storeStrong((id *)&self->_attachedNavigationPalette, v21);

        }
        if (-[UISearchBar barPosition](self->_searchBar, "barPosition") == 3)
        {
          objc_msgSend(v6, "navigationBar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_setHidesShadow:", (*(_WORD *)&self->_searchDisplayControllerFlags >> 14) & 1);

        }
      }

    }
  }
  else if (v8 == WeakRetained
         && -[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
  {
    -[UISearchDisplayController _updateNavigationPalette](self, "_updateNavigationPalette");
  }

}

void __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "detachPalette:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "setVisibleWhenPinningBarIsHidden:", 0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 200);
    *(_QWORD *)(v3 + 200) = 0;

  }
}

BOOL __72__UISearchDisplayController_navigationControllerWillShowViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (void)navigationControllerDidShowViewController:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", 0x1E1712800);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (v7 == WeakRetained)
    -[UISearchDisplayController _clearSavedSelectedCellsWeUsedWhenHedgingOurBets](self, "_clearSavedSelectedCellsWeUsedWhenHedgingOurBets");
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_viewController);

    if (v7 == v6)
      -[UITableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
  }

}

- (void)navigationControllerDidCancelShowingViewController:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", 0x1E1712800);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = v7;
  if (v7 == WeakRetained)
  {
    -[UISearchDisplayController _restoreSelectedCellsInCaseViewDidNotReallyAppear](self, "_restoreSelectedCellsInCaseViewDidNotReallyAppear");
    v6 = v7;
  }

}

- (void)_updateNoSearchResultsMessageVisiblity
{
  __int16 searchDisplayControllerFlags;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 0x20) != 0)
  {
    v4 = -[UITableView numberOfSections](self->_tableView, "numberOfSections");
    if (v4 >= 1)
    {
      v5 = 0;
      v6 = 0;
      v7 = v4;
      do
        v6 += -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", v5++);
      while (v7 != v5);
      if (v6)
        goto LABEL_10;
    }
  }
  else if ((searchDisplayControllerFlags & 0x10) == 0)
  {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITableView _offsetForNoResultsMessage](self->_tableView, "_offsetForNoResultsMessage");
    v9 = v8;
    -[UIView bounds](self->_tableView, "bounds");
    v11 = round(v10);
    -[UITableView rowHeight](self->_tableView, "rowHeight");
    v13 = v12;
    -[UISearchDisplayController _setupNoResultsLabelIfNecessary](self, "_setupNoResultsLabelIfNecessary");
    -[UILabel setFrame:](self->_noResultsLabel, "setFrame:", 0.0, v9, v11, v13);
    -[UIView addSubview:](self->_tableView, "addSubview:", self->_noResultsLabel);
    return;
  }
LABEL_10:
  -[UIView removeFromSuperview](self->_noResultsLabel, "removeFromSuperview");
}

- (void)_managedTableViewDidScroll
{
  id v3;

  if (-[UIScrollView isDragging](self->_tableView, "isDragging")
    && !-[UIScrollView isDecelerating](self->_tableView, "isDecelerating")
    && UIKeyboardAutomaticIsOnScreen())
  {
    -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
    -[UIView keyboardSceneDelegate](self->_searchBar, "keyboardSceneDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "automaticAppearanceEnabled") & 1) == 0)
      objc_msgSend(v3, "forceOrderOutAutomaticAnimated:", 1);

  }
}

- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4
{
  if (a4 == 1)
    -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 0);
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  if (-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar", a3)
    && -[UISearchDisplayController navigationBarSearchFieldSizing](self, "navigationBarSearchFieldSizing") == 3)
  {
    -[UISearchDisplayController _animateNavigationBarSearchBarAppearance:](self, "_animateNavigationBarSearchBarAppearance:", 0);
  }
  return 1;
}

- (UITableView)searchResultsTableView
{
  UITableView *tableView;
  objc_class *v4;
  id v5;
  UITableView *v6;
  UITableView *v7;
  id WeakRetained;
  id v9;
  void *v10;
  double v11;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (objc_class *)objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (objc_class *)-[UISearchDisplayDelegate _resultsTableViewClass](self->_delegate, "_resultsTableViewClass");
    v5 = [v4 alloc];
    v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", self->_searchResultsTableViewStyle, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_tableView;
    self->_tableView = v6;

    WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewDataSource);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", WeakRetained);

    v9 = objc_loadWeakRetained((id *)&self->_tableViewDelegate);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", v9);

    -[UIView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v10);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITableView setController:](self->_tableView, "setController:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISearchDisplayDelegate searchDisplayController:didLoadSearchResultsTableView:](self->_delegate, "searchDisplayController:didLoadSearchResultsTableView:", self, self->_tableView);
    -[UITableView rowHeight](self->_tableView, "rowHeight");
    tableView = self->_tableView;
    if (v11 == -1.0)
    {
      -[UITableView setRowHeight:](tableView, "setRowHeight:", 44.0);
      tableView = self->_tableView;
    }
  }
  return tableView;
}

- (void)setSearchResultsDataSource:(id)searchResultsDataSource
{
  UITableView *tableView;
  id v5;

  v5 = searchResultsDataSource;
  objc_storeWeak((id *)&self->_tableViewDataSource, v5);
  tableView = self->_tableView;
  if (tableView)
    -[UITableView setDataSource:](tableView, "setDataSource:", v5);

}

- (void)setSearchResultsDelegate:(id)searchResultsDelegate
{
  UITableView *tableView;
  id v5;

  v5 = searchResultsDelegate;
  objc_storeWeak((id *)&self->_tableViewDelegate, v5);
  tableView = self->_tableView;
  if (tableView)
    -[UITableView setDelegate:](tableView, "setDelegate:", v5);

}

- (void)setNoResultsMessageVisible:(BOOL)a3
{
  __int16 searchDisplayControllerFlags;
  __int16 v4;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *(_WORD *)&self->_searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFEF | v4;
    -[UISearchDisplayController _updateNoSearchResultsMessageVisiblity](self, "_updateNoSearchResultsMessageVisiblity");
  }
}

- (BOOL)noResultsMessageVisible
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 4) & 1;
}

- (void)setAutomaticallyShowsNoResultsMessage:(BOOL)a3
{
  __int16 searchDisplayControllerFlags;
  __int16 v4;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *(_WORD *)&self->_searchDisplayControllerFlags = searchDisplayControllerFlags & 0xFFDF | v4;
    -[UISearchDisplayController _updateNoSearchResultsMessageVisiblity](self, "_updateNoSearchResultsMessageVisiblity");
  }
}

- (BOOL)automaticallyShowsNoResultsMessage
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 5) & 1;
}

- (void)setNoResultsMessage:(id)a3
{
  UILabel *noResultsLabel;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_noResultsMessage, a3);
  noResultsLabel = self->_noResultsLabel;
  if (noResultsLabel)
  {
    -[UISearchDisplayController noResultsMessage](self, "noResultsMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](noResultsLabel, "setText:", v6);

  }
}

- (NSString)noResultsMessage
{
  NSString *noResultsMessage;

  noResultsMessage = self->_noResultsMessage;
  if (noResultsMessage)
    return noResultsMessage;
  _UINSLocalizedStringWithDefaultValue(CFSTR("No Results"), CFSTR("No Results"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isNavigationBarHidingEnabled
{
  $8D6B8881E49F585262256A31217E692A searchDisplayControllerFlags;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;

  searchDisplayControllerFlags = self->_searchDisplayControllerFlags;
  if ((*(_WORD *)&searchDisplayControllerFlags & 0x400) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    searchDisplayControllerFlags = self->_searchDisplayControllerFlags;
  }
  return (*(unsigned int *)&searchDisplayControllerFlags >> 6) & 1;
}

- (void)setNavigationBarHidingEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFFBF | v3;
}

- (void)_setAllowDisablingNavigationBarHiding:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFBFF | v3;
}

- (BOOL)_allowDisablingNavigationBarHiding
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 10) & 1;
}

- (void)setDimTableViewOnEmptySearchString:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFF7F | v3;
}

- (BOOL)dimTableViewOnEmptySearchString
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 7) & 1;
}

- (void)_clearViewController
{
  objc_storeWeak((id *)&self->_viewController, 0);
}

- (BOOL)_isCancelButtonManagementDisabled
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 9) & 1;
}

- (void)_setCancelButtonManagementDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_searchDisplayControllerFlags = *(_WORD *)&self->_searchDisplayControllerFlags & 0xFDFF | v3;
}

- (id)_noResultsMessageLabel
{
  -[UISearchDisplayController _setupNoResultsLabelIfNecessary](self, "_setupNoResultsLabelIfNecessary");
  return self->_noResultsLabel;
}

- (void)_watchContainingTableViewForScrolling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _UISearchControllerDidScrollDelegate *didScrollDelegate;
  __int16 searchDisplayControllerFlags;
  _BOOL4 v9;
  __int16 v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  _UISearchControllerDidScrollDelegate *v15;
  _UISearchControllerDidScrollDelegate *v16;
  _UISearchControllerDidScrollDelegate *v17;
  void *v18;
  id v19;

  v3 = a3;
  -[UISearchDisplayController _containingTableView](self, "_containingTableView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent"))
  {
    -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if (!v3)
    {
LABEL_3:
      v6 = v19;
      if (v19 || (v6 = v5) != 0)
        objc_msgSend(v6, "_removeScrollViewScrollObserver:", self->_didScrollDelegate);
      didScrollDelegate = self->_didScrollDelegate;
      self->_didScrollDelegate = 0;

      goto LABEL_25;
    }
  }
  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if ((searchDisplayControllerFlags & 2) == 0
    && (searchDisplayControllerFlags & 1) == 0
    && v19
    && (objc_msgSend(v19, "_pinsTableHeaderView") & 1) == 0
    && !-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar"))
  {
    goto LABEL_28;
  }
  v9 = -[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent");
  v10 = (__int16)self->_searchDisplayControllerFlags;
  if (v9 && (v10 & 1) != 0 && v5)
    goto LABEL_28;
  if ((v10 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_viewController);

    if (v13 != v14)
    {
LABEL_28:
      if (!self->_didScrollDelegate)
      {
        v15 = objc_alloc_init(_UISearchControllerDidScrollDelegate);
        v16 = self->_didScrollDelegate;
        self->_didScrollDelegate = v15;

        -[_UISearchControllerDidScrollDelegate setController:](self->_didScrollDelegate, "setController:", self);
      }
      if (v19)
      {
        -[_UISearchControllerDidScrollDelegate setScrollView:](self->_didScrollDelegate, "setScrollView:");
        v17 = self->_didScrollDelegate;
        v18 = v19;
      }
      else
      {
        if (!v5)
          goto LABEL_25;
        -[_UISearchControllerDidScrollDelegate setScrollView:](self->_didScrollDelegate, "setScrollView:", v5);
        v17 = self->_didScrollDelegate;
        v18 = v5;
      }
      objc_msgSend(v18, "_addScrollViewScrollObserver:", v17);
    }
  }
LABEL_25:

}

- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4
{
  void *v6;
  UIView *tableViewBackgroundHeaderView;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "_tableHeaderBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v12, "_usingCustomBackgroundView"))
    {
      objc_msgSend(v12, "setTableHeaderBackgroundColor:", 0);
      tableViewBackgroundHeaderView = self->_tableViewBackgroundHeaderView;
      self->_tableViewBackgroundHeaderView = 0;

    }
    else
    {
      v8 = objc_msgSend(v6, "isHidden");
      if (a4 >= 0.0)
      {
        if ((v8 & 1) == 0)
          objc_msgSend(v6, "setHidden:", 1);
      }
      else
      {
        if (v8)
          objc_msgSend(v6, "setHidden:", 0);
        objc_msgSend(v12, "bounds");
        objc_msgSend(v6, "setFrame:");
        objc_msgSend(v12, "_refreshControl");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9 || (objc_msgSend(v9, "backgroundColor"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "setBackgroundColor:", v11);

      }
    }
  }

}

- (void)_updateSearchBarMaskIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  double Height;
  double v9;
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
  double Width;
  double v23;
  id v24;
  CGRect v25;

  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 3) == 0)
  {
    -[UIView window](self->_searchBar, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!-[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent"))
      {
        -[UISearchDisplayController _containingTableView](self, "_containingTableView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v4;
        if (v4)
        {
          v5 = v4;
          objc_msgSend(v5, "_refreshControl");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[UIView _containingScrollView](self->_searchBar, "_containingScrollView");
          v7 = objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
LABEL_18:

            return;
          }
          v5 = (id)v7;
          v6 = 0;
        }
        -[UIView bounds](self->_searchBar, "bounds");
        Height = CGRectGetHeight(v25);
        objc_msgSend(v5, "contentInset");
        v10 = v9;
        objc_msgSend(v5, "contentOffset");
        v12 = v10 + v11;
        -[UIView frame](self->_searchBar, "frame");
        v14 = v12 - v13;
        if (v6 && (objc_msgSend(v6, "refreshControlState") == 2 || objc_msgSend(v6, "refreshControlState") == 3))
        {
          objc_msgSend(v6, "_refreshControlHeight");
          v14 = v14 - v15;
        }
        -[UIView _screen](self->_searchBar, "_screen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scale");
        v18 = 1.0 / v17;

        v19 = v14 + v18;
        if (v19 <= Height)
        {
          -[UIView bounds](self->_searchBar, "bounds");
          if (v19 > 0.0)
          {
            Width = CGRectGetWidth(*(CGRect *)&v20);
            v23 = Height - v19;
            v20 = 0.0;
            v21 = v19;
          }
        }
        else
        {
          v20 = *MEMORY[0x1E0C9D648];
          v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          Width = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        }
        -[UISearchBar _setMaskBounds:](self->_searchBar, "_setMaskBounds:", v20, v21, Width, v23);
        -[UISearchDisplayController _updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:](self, "_updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:", v24, v19);

        goto LABEL_18;
      }
    }
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;

  v11 = a3;
  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0)
  {
    -[UIView window](self->_containerView, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIView _containingScrollView](self->_containerView, "_containingScrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentOffset");
      v7 = v6;
      v9 = v8;

      if (v7 != self->_containingScrollViewContentOffset.x || v9 != self->_containingScrollViewContentOffset.y)
      {
        -[UIView frame](self->_containerView, "frame");
        -[UIView setFrame:](self->_containerView, "setFrame:");
        self->_containingScrollViewContentOffset.x = v7;
        self->_containingScrollViewContentOffset.y = v9;
      }
    }
  }
  if (!-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
    && !-[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette"))
  {
    -[UISearchDisplayController _updateSearchBarMaskIfNecessary](self, "_updateSearchBarMaskIfNecessary");
  }

}

- (BOOL)_searchBarShouldScrollToVisible:(id)a3
{
  void *v3;
  int v4;

  if ((*(_WORD *)&self->_searchDisplayControllerFlags & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[UISearchDisplayController _containingTableView](self, "_containingTableView", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_pinsTableHeaderView") ^ 1;

  }
  return v4;
}

- (void)_setShowsResultsForEmptyField:(BOOL)a3
{
  __int16 searchDisplayControllerFlags;
  __int16 v4;

  searchDisplayControllerFlags = (__int16)self->_searchDisplayControllerFlags;
  if (((((searchDisplayControllerFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2048;
    else
      v4 = 0;
    *(_WORD *)&self->_searchDisplayControllerFlags = searchDisplayControllerFlags & 0xF7FF | v4;
  }
}

- (BOOL)_showsResultsForEmptyField
{
  return (*(_WORD *)&self->_searchDisplayControllerFlags >> 11) & 1;
}

- (UINavigationItem)navigationItem
{
  UINavigationItem *v3;
  UINavigationItem *navigationItem;

  if (-[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
    && !self->_navigationItem)
  {
    -[UISearchBar _searchDisplayControllerNavigationItem](self->_searchBar, "_searchDisplayControllerNavigationItem");
    v3 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
    navigationItem = self->_navigationItem;
    self->_navigationItem = v3;

  }
  return self->_navigationItem;
}

- (void)_configureContainerView
{
  _BOOL4 v3;
  UISearchDisplayControllerContainerView *containerView;

  v3 = -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar");
  containerView = self->_containerView;
  if (v3)
  {
    -[UIView setHidden:](containerView, "setHidden:", 1);
    -[UIView setAlpha:](self->_containerView, "setAlpha:", 0.0);
    if (-[UISearchDisplayController dimTableViewOnEmptySearchString](self, "dimTableViewOnEmptySearchString"))
    {
      -[UISearchDisplayController _dimmingViewAlpha](self, "_dimmingViewAlpha");
      -[UIView setAlpha:](self->_dimmingView, "setAlpha:");
      -[UIView setHidden:](self->_dimmingView, "setHidden:", 0);
    }
    if (-[UISearchDisplayController _showsResultsForEmptyField](self, "_showsResultsForEmptyField"))
    {
      -[UIView setHidden:](self->_dimmingView, "setHidden:", 1);
      -[UIView setHidden:](self->_tableView, "setHidden:", 0);
    }
  }
  else
  {
    -[UIView setHidden:](containerView, "setHidden:", 0);
    -[UIView setAlpha:](self->_containerView, "setAlpha:", 1.0);
  }
}

- (id)_containerView
{
  UISearchDisplayControllerContainerView *containerView;
  _BOOL8 v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  BOOL IsIdentity;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UISearchDisplayControllerContainerView *v25;
  UISearchDisplayControllerContainerView *v26;
  UISearchDisplayControllerContainerView *v27;
  _UISearchDisplayControllerDimmingView *v28;
  void *v29;
  _UISearchDisplayControllerDimmingView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CGAffineTransform v38;
  CGRect v39;

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(&v38, 0, sizeof(v38));
    IsIdentity = CGAffineTransformIsIdentity(&v38);

    if (!IsIdentity)
    {
      v19 = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertRect:fromView:", 0, v8, v10, v12, v14);
      v8 = v21;
      v10 = v22;
      v12 = v23;
      v14 = v24;

    }
    v25 = [UISearchDisplayControllerContainerView alloc];
    -[UIView bounds](self->_searchBar, "bounds");
    v26 = -[UISearchDisplayControllerContainerView initWithFrame:topViewHeight:](v25, "initWithFrame:topViewHeight:", v8, v10, v12, v14, CGRectGetHeight(v39));
    v27 = self->_containerView;
    self->_containerView = v26;

    v28 = [_UISearchDisplayControllerDimmingView alloc];
    -[UISearchDisplayControllerContainerView bottomView](self->_containerView, "bottomView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v30 = -[UIControl initWithFrame:](v28, "initWithFrame:");

    -[UIControl addTarget:action:forControlEvents:](v30, "addTarget:action:forControlEvents:", self, sel_searchBarCancelButtonClicked_, 64);
    -[UISearchDisplayController _dimmingViewColor](self, "_dimmingViewColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[UISearchDisplayController _dimmingViewAlpha](self, "_dimmingViewAlpha");
    -[UIView setAlpha:](v30, "setAlpha:");
    -[UIView setOpaque:](v30, "setOpaque:", 0);
    -[UIView setDeliversTouchesForGesturesToSuperview:](v30, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[UIView setAutoresizingMask:](v30, "setAutoresizingMask:", 18);
    -[UISearchDisplayControllerContainerView bottomView](self->_containerView, "bottomView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v30);

    objc_storeStrong((id *)&self->_dimmingView, v30);
    -[UISearchDisplayController searchResultsTableView](self, "searchResultsTableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", 1);
    objc_msgSend(v33, "setAutoresizingMask:", 18);
    objc_storeStrong((id *)&self->_tableView, v33);
    if ((*(_WORD *)&self->_searchDisplayControllerFlags & 0x1000) != 0
      || -[UISearchDisplayController _searchBarInNavigationControllerComponent](self, "_searchBarInNavigationControllerComponent"))
    {
      -[UISearchDisplayControllerContainerView behindView](self->_containerView, "behindView", *(_OWORD *)&v38.a, *(_OWORD *)&v38.c, *(_OWORD *)&v38.tx);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      objc_msgSend(v33, "setFrame:");

      -[UISearchDisplayControllerContainerView behindView](self->_containerView, "behindView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addSubview:", v33);
    }
    else
    {
      -[UISearchDisplayControllerContainerView bottomView](self->_containerView, "bottomView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bounds");
      objc_msgSend(v33, "setFrame:");

      -[UISearchDisplayControllerContainerView bottomView](self->_containerView, "bottomView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "insertSubview:belowSubview:", v33, v30);
    }

    -[UISearchDisplayController _configureContainerView](self, "_configureContainerView");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v4);

    containerView = self->_containerView;
  }
  return containerView;
}

- (void)_animateNavigationBarSearchBarAppearance:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v24;
  double animatingAppearanceNavigationSearchBarWidth;
  double v26;
  double v27;
  double v28;
  id *v29;
  id *v30;
  id v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  void *v47;
  id v48[6];
  _QWORD v49[4];
  void *v50;
  id v51;
  UISearchDisplayController *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  _QWORD v57[4];
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  CGRect v65;
  CGRect v66;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UISearchBar _animatedAppearanceBarButtonItem](self->_searchBar, "_animatedAppearanceBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[UISearchBar _searchDisplayControllerNavigationItem](self->_searchBar, "_searchDisplayControllerNavigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v60 != v13)
          objc_enumerationMutation(v9);
        if ((v12 & 1) != 0)
        {
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
          v12 = 1;
        }
        else
        {
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "isEqual:", v6);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar searchField](self->_searchBar, "searchField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (self->_animatingAppearanceNavigationSearchBarWidth == 0.0)
  {
    objc_msgSend(v16, "bounds");
    self->_animatingAppearanceNavigationSearchBarWidth = CGRectGetWidth(v65);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_animatingAppearanceNavigationButton)
    objc_storeStrong((id *)&self->_animatingAppearanceNavigationButton, a3);
  objc_msgSend(v17, "frame");
  v19 = v18;
  objc_msgSend(v15, "frame");
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  v24 = CGRectGetWidth(v66);
  animatingAppearanceNavigationSearchBarWidth = self->_animatingAppearanceNavigationSearchBarWidth;
  if (v24 == v19 + animatingAppearanceNavigationSearchBarWidth)
  {
    v34 = v24 + -36.0;
    v35 = x + v34;
    v36 = width - v34;
    -[UISearchDisplayController setActive:animated:](self, "setActive:animated:", 0, 1);
    -[UIView setHidden:](self->_animatingAppearanceNavigationButton, "setHidden:", 0);
    -[UIView setAlpha:](self->_animatingAppearanceNavigationButton, "setAlpha:", 0.0);
    objc_msgSend(v17, "_placeholderLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setIgnoresGeometryChanges:", 1);

    v38 = v5;
    v39 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_6;
    v46[3] = &unk_1E16BDF18;
    v29 = &v47;
    v47 = v15;
    v48[2] = *(id *)&v35;
    v48[3] = *(id *)&y;
    v48[4] = *(id *)&v36;
    v48[5] = *(id *)&height;
    v30 = v48;
    v48[0] = v17;
    v48[1] = self;
    v44[0] = v39;
    v44[1] = 3221225472;
    v44[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_7;
    v44[3] = &unk_1E16B2218;
    v44[4] = self;
    v45 = v48[0];
    v40 = v15;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v46, v44, 0.35);
    v42[0] = v39;
    v5 = v38;
    v42[1] = 3221225472;
    v42[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_8;
    v42[3] = &unk_1E16B1B28;
    v43 = v7;
    v41 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v42, 0, 0.1, 0.28);

    v33 = v45;
  }
  else
  {
    v26 = v19 + animatingAppearanceNavigationSearchBarWidth - v24;
    v27 = x - v26;
    v28 = width + v26;
    objc_msgSend(v15, "bounds");
    objc_msgSend(v17, "setFrame:", v19);
    objc_msgSend(v17, "setHidden:", 0);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke;
    v57[3] = &unk_1E16B1B28;
    v29 = &v58;
    v58 = v7;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_2;
    v49[3] = &unk_1E16C1410;
    v30 = &v50;
    v50 = v15;
    v53 = v27;
    v54 = y;
    v55 = v28;
    v56 = height;
    v51 = v17;
    v52 = self;
    v31 = v7;
    v32 = v15;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v57, v49, 0.125);
    v33 = v51;
  }

}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "view", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 0.0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_3;
  v7[3] = &unk_1E16BDF18;
  v8 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 56);
  v12 = v3;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_4;
  v6[3] = &unk_1E16B3FD8;
  v6[4] = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v6, 0.25);

}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 208), "setAlpha:", 0.0);
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_4(uint64_t a1)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_5;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setActive:animated:", 1, 1);
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setNeedsLayout");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "layoutIfNeeded");
}

uint64_t __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 208), "setAlpha:", 1.0);
}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 208);
  *(_QWORD *)(v2 + 208) = 0;

  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_placeholderLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoresGeometryChanges:", 0);

}

void __70__UISearchDisplayController__animateNavigationBarSearchBarAppearance___block_invoke_8(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "view", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 1.0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)setNavigationBarSearchFieldSizing:(unint64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (a3 == 3 && (v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchDisplayController.m"), 2489, CFSTR("UINavigationBarSearchFieldSizingAnimatedAppearance can only be used on iPad"));

  }
  self->_navigationBarSearchFieldSizing = a3;
}

- (void)_setDimmingOverlayColor:(id)a3
{
  id v5;
  UIColor **p_dimmingOverlayColor;
  UIColor *dimmingOverlayColor;
  id v8;

  v5 = a3;
  dimmingOverlayColor = self->_dimmingOverlayColor;
  p_dimmingOverlayColor = &self->_dimmingOverlayColor;
  v8 = v5;
  if (!-[UIColor isEqual:](dimmingOverlayColor, "isEqual:"))
    objc_storeStrong((id *)p_dimmingOverlayColor, a3);

}

- (id)_dimmingOverlayColor
{
  return self->_dimmingOverlayColor;
}

- (BOOL)_searchBarInNavigationControllerComponent
{
  return -[UISearchDisplayController displaysSearchBarInNavigationBar](self, "displaysSearchBarInNavigationBar")
      || -[UISearchBar _containedInNavigationPalette](self->_searchBar, "_containedInNavigationPalette");
}

- (BOOL)_shouldAccountForStatusBarHeight
{
  id WeakRetained;
  BOOL v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;

  v4 = -[UISearchDisplayController _isSearchBarInBar](self, "_isSearchBarInBar");
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    if ((objc_msgSend(WeakRetained, "edgesForExtendedLayout") & 1) != 0)
    {
      if (-[UISearchDisplayController _containedInPopover](self, "_containedInPopover"))
      {
LABEL_7:
        v6 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v6, "_popoverController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_managingSplitViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v8 != 0;

        if (v4)
          return v5;
        goto LABEL_10;
      }
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
LABEL_10:

    return v5;
  }
  if (-[UISearchDisplayController _containedInPopover](self, "_containedInPopover"))
    goto LABEL_7;
  return 1;
}

- (double)_statusBarHeight
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "_statusBarHeightAdjustmentForCurrentOrientation");
  v4 = v3;

  return v4;
}

- (BOOL)_containedInPopover
{
  id WeakRetained;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "_popoverController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = self->_popoverController != 0;

  return v5;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (UISearchDisplayDelegate *)delegate;
}

- (UIViewController)searchContentsController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (id)searchResultsDataSource
{
  return objc_loadWeakRetained((id *)&self->_tableViewDataSource);
}

- (id)searchResultsDelegate
{
  return objc_loadWeakRetained((id *)&self->_tableViewDelegate);
}

- (NSString)searchResultsTitle
{
  return self->_resultsTitle;
}

- (void)setSearchResultsTitle:(NSString *)searchResultsTitle
{
  objc_setProperty_nonatomic_copy(self, a2, searchResultsTitle, 56);
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return self->_displaysSearchBarInNavigationBar;
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)displaysSearchBarInNavigationBar
{
  self->_displaysSearchBarInNavigationBar = displaysSearchBarInNavigationBar;
}

- (unint64_t)navigationBarSearchFieldSizing
{
  return self->_navigationBarSearchFieldSizing;
}

- (double)_activationGapHeight
{
  return self->__activationGapHeight;
}

- (void)set_activationGapHeight:(double)a3
{
  self->__activationGapHeight = a3;
}

- (double)_additionalNonCollapsingHeightAboveSearchBar
{
  return self->__additionalNonCollapsingHeightAboveSearchBar;
}

- (void)set_additionalNonCollapsingHeightAboveSearchBar:(double)a3
{
  self->__additionalNonCollapsingHeightAboveSearchBar = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableViewDelegate);
  objc_destroyWeak((id *)&self->_tableViewDataSource);
  objc_storeStrong((id *)&self->_didScrollDelegate, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundHeaderView, 0);
  objc_storeStrong((id *)&self->_dimmingOverlayColor, 0);
  objc_storeStrong((id *)&self->_animatingAppearanceNavigationButton, 0);
  objc_storeStrong((id *)&self->_attachedNavigationPalette, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_savedContainingScrollView);
  objc_storeStrong((id *)&self->_savedSelectedCellsWhenViewWillAppear, 0);
  objc_destroyWeak(&self->_navigationControllerBookkeeper);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_resultsTitle, 0);
  objc_storeStrong((id *)&self->_noResultsMessage, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
