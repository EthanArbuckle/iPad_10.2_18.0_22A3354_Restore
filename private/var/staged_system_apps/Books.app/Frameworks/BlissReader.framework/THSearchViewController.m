@implementation THSearchViewController

- (THSearchViewController)initWithSearchController:(id)a3
{
  id v5;
  THSearchViewController *v6;
  THSearchViewController *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = -[THSearchViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mSearchController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v9 = -[THSearchViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v8, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  BESearchResultTableViewCell *mDummySearchResultsCell;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[THSearchViewController releaseViews](self, "releaseViews");
  mDummySearchResultsCell = self->mDummySearchResultsCell;
  self->mDummySearchResultsCell = 0;

  v5.receiver = self;
  v5.super_class = (Class)THSearchViewController;
  -[THNavigationViewController dealloc](&v5, "dealloc");
}

- (void)releaseViews
{
  UIViewController *mNoIndexViewController;
  UISearchBar *mSearchBar;
  UIView *mNoIndexView;
  UILabel *mNoIndexViewLabel;
  UIActivityIndicatorView *mNoIndexActivityIndicatorView;
  BESearchResultTableViewCell *mDummySearchResultsCell;
  NSDictionary *mPendingDeferredViewWillAppear;
  objc_super v10;

  -[THSearchViewController setSearchWeb:](self, "setSearchWeb:", 0);
  -[THSearchViewController setSearchEncyclopedia:](self, "setSearchEncyclopedia:", 0);
  -[THSearchViewController setPendingSearchText:](self, "setPendingSearchText:", 0);
  -[THSearchViewController setSpinner:](self, "setSpinner:", 0);
  -[THSearchViewController setProgressView:](self, "setProgressView:", 0);
  -[THSearchViewController setResultsViewController:](self, "setResultsViewController:", 0);
  -[THSearchViewController setDetailsViewController:](self, "setDetailsViewController:", 0);
  -[THSearchViewController setResultsDataSource:](self, "setResultsDataSource:", 0);
  -[THSearchViewController setDetailsDataSource:](self, "setDetailsDataSource:", 0);
  -[THSearchViewController setSuggestionsDataSource:](self, "setSuggestionsDataSource:", 0);
  mNoIndexViewController = self->mNoIndexViewController;
  self->mNoIndexViewController = 0;

  mSearchBar = self->mSearchBar;
  self->mSearchBar = 0;

  mNoIndexView = self->mNoIndexView;
  self->mNoIndexView = 0;

  mNoIndexViewLabel = self->mNoIndexViewLabel;
  self->mNoIndexViewLabel = 0;

  mNoIndexActivityIndicatorView = self->mNoIndexActivityIndicatorView;
  self->mNoIndexActivityIndicatorView = 0;

  mDummySearchResultsCell = self->mDummySearchResultsCell;
  self->mDummySearchResultsCell = 0;

  mPendingDeferredViewWillAppear = self->mPendingDeferredViewWillAppear;
  self->mPendingDeferredViewWillAppear = 0;

  v10.receiver = self;
  v10.super_class = (Class)THSearchViewController;
  -[THNavigationViewController releaseViews](&v10, "releaseViews");
}

- (IMThemePage)themePage
{
  uint64_t v3;

  v3 = objc_opt_class(IMThemePage, a2);
  return (IMThemePage *)BUDynamicCast(v3, self->mTheme);
}

- (BOOL)p_isBottomViewVisible
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    if (v5 <= self->_searchBarHeight)
    {
      v7 = 0;
    }
    else
    {
      -[THSearchViewController preferredContentSize](self, "preferredContentSize");
      v7 = v6 > self->_searchBarHeight;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)p_showBottomView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double searchBarHeight;
  void *v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v20;
  _QWORD *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  _QWORD v26[4];
  _QWORD *v27;
  _QWORD v28[6];

  v4 = a4;
  v5 = a3;
  self->mShowBottomView = a3;
  if (-[THSearchViewController p_presentingFullscreen](self, "p_presentingFullscreen"))
  {
    -[THSearchViewController p_updateButtonState](self, "p_updateButtonState");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController footerViewHeightConstraint](self, "footerViewHeightConstraint"));
    objc_msgSend(v7, "setConstant:", 44.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v8, "setAlpha:", 1.0);

    v25 = (id)objc_claimAutoreleasedReturnValue(-[THNavigationViewController footerView](self, "footerView"));
    objc_msgSend(v25, "setAlpha:", 1.0);

    return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  if (v5)
  {
    -[THSearchViewController p_bestPopoverHeight](self, "p_bestPopoverHeight");
    searchBarHeight = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController footerViewHeightConstraint](self, "footerViewHeightConstraint"));
    objc_msgSend(v14, "setConstant:", 44.0);

    v15 = 1.0;
  }
  else
  {
    searchBarHeight = self->_searchBarHeight;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController footerViewHeightConstraint](self, "footerViewHeightConstraint"));
    v15 = 0.0;
    objc_msgSend(v16, "setConstant:", 0.0);

  }
  v17 = searchBarHeight != self->_searchBarHeight && v4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  objc_msgSend(v18, "frame");
  if (searchBarHeight == v19
    && (-[THSearchViewController preferredContentSize](self, "preferredContentSize"), searchBarHeight == v20))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController footerView](self, "footerView"));
    objc_msgSend(v22, "alpha");
    v24 = v23;

    if (v24 == v15)
      return;
  }
  else
  {

  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_C2134;
  v28[3] = &unk_4291C0;
  v28[4] = self;
  *(double *)&v28[5] = v15;
  v21 = objc_retainBlock(v28);
  -[THSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, searchBarHeight);
  if (v17)
  {
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, 0.3);
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_C21A8;
    v26[3] = &unk_427698;
    v27 = v21;
    +[UIView performBlockWithActionsAndAnimationsDisabled:](UIView, "performBlockWithActionsAndAnimationsDisabled:", v26);

  }
}

- (void)p_changeToSize:(double)a3 animated:(BOOL)a4
{
  void *v6;
  double Width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;

  if (!-[THSearchViewController p_presentingFullscreen](self, "p_presentingFullscreen", a4)
    && -[THSearchViewController p_isBottomViewVisible](self, "p_isBottomViewVisible"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v14);

    if (Width <= 0.0)
      Width = 375.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;

    if (Width != v10 || v12 != a3)
      -[THSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, a3);
  }
}

- (double)p_bestPopoverHeight
{
  double searchBarHeight;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  searchBarHeight = self->_searchBarHeight;
  v4 = objc_opt_class(UITableViewController, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController topViewController](self, "topViewController"));
  TSUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController navigationBar](self, "navigationBar"));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController footerView](self, "footerView"));
    objc_msgSend(v12, "frame");
    v14 = v11 + v13 + -1.0;

    -[THSearchViewController maxContentHeight](self, "maxContentHeight");
    if (v15 <= 0.0)
      v16 = kBESearchPopoverViewMaxContentHeight;
    else
      -[THSearchViewController maxContentHeight](self, "maxContentHeight");
    v17 = v16 - v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsDataSource](self, "resultsDataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController suggestionsDataSource](self, "suggestionsDataSource"));

    if (v18 == v19)
    {
      objc_msgSend(v8, "rowHeight");
      v22 = v21;
      -[THSearchViewController _resultsHeaderHeight](self, "_resultsHeaderHeight");
      v24 = 440.0;
      if (v22 > 0.0)
        v24 = v22 * 10.0;
      if (v24 >= v17)
        v24 = v17;
      v20 = v23 + v24;
    }
    else
    {
      objc_msgSend(v8, "preferredContentHeightWithMax:", v17);
    }
    searchBarHeight = v14 + v20;
  }

  return searchBarHeight;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  -[THSearchViewController p_bestPopoverHeight](self, "p_bestPopoverHeight", a3);
  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  -[THSearchViewController p_bestPopoverHeight](self, "p_bestPopoverHeight", a3);
  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
}

- (void)keyboardWillChangeFrame:(id)a3
{
  -[THSearchViewController p_bestPopoverHeight](self, "p_bestPopoverHeight", a3);
  -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 0);
}

- (void)p_showRecents
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  if ((-[THSearchViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) != 0)
    v3 = 0;
  else
    v3 = -[THSearchViewController isBeingPresented](self, "isBeingPresented") ^ 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C24F4;
  v5[3] = &unk_426DA8;
  v5[4] = self;
  v4 = -[THNavigationViewController popToRootViewControllerAnimated:completion:](self, "popToRootViewControllerAnimated:completion:", v3, v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)THSearchViewController;
  -[THSearchViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v5)
    v6 = -[THSearchViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("ContentSearch"));
  v10 = CFSTR("animated");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  -[THSearchViewController setPendingDeferredViewWillAppear:](self, "setPendingDeferredViewWillAppear:", v8);

  -[THSearchViewController p_updateButtonState](self, "p_updateButtonState");
}

- (void)p_deferredViewWillAppear
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController pendingDeferredViewWillAppear](self, "pendingDeferredViewWillAppear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("animated")));
  v5 = objc_msgSend(v4, "BOOLValue");

  -[THSearchViewController setPendingDeferredViewWillAppear:](self, "setPendingDeferredViewWillAppear:", 0);
  -[THSearchViewController p_configureAnimated:](self, "p_configureAnimated:", v5);
}

- (void)_cancelOperation:(id)a3
{
  -[THSearchViewController p_dismissSearchView:](self, "p_dismissSearchView:", a3);
}

- (void)p_configureAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  v5 = -[THSearchViewController p_wantsCancelButton](self, "p_wantsCancelButton");
  v7 = v5;
  if (v5 && isPad(v5, v6))
    v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "searchBarCancelButtonClicked:");
  else
    v15 = 0;
  -[UISearchBar setShowsCancelButton:](self->mSearchBar, "setShowsCancelButton:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v15);

  if (-[THSearchController indexLoaded](self->mSearchController, "indexLoaded"))
  {
    if (!-[THSearchViewController settingSearchForString](self, "settingSearchForString"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchController currentQuery](self->mSearchController, "currentQuery"));
      if (v10)
      {

      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController pendingSearchText](self, "pendingSearchText"));

        if (!v12)
        {
          -[THSearchViewController p_showRecents](self, "p_showRecents");
          goto LABEL_16;
        }
      }
    }
    v11 = objc_claimAutoreleasedReturnValue(-[THSearchController currentQuery](self->mSearchController, "currentQuery"));

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchController currentQuery](self->mSearchController, "currentQuery"));
      -[UISearchBar setText:](self->mSearchBar, "setText:", v13);

      if (-[THSearchViewController searchingForPredeterminedString](self, "searchingForPredeterminedString")
        && !self->mSearchingForString)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchController currentQuery](self->mSearchController, "currentQuery"));
        v11 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v11 = 1;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  -[THSearchViewController p_showBottomView:animated:](self, "p_showBottomView:animated:", v11, v3);
LABEL_16:

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THSearchViewController;
  -[THSearchViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  if (!self->mSearchingForString)
  {
    v5 = objc_opt_class(UITableViewController, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController topViewController](self, "topViewController"));
    TSUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v9));
    v11 = objc_msgSend(v10, "searchViewMode");

    if (v11 != 2)
      -[UISearchBar becomeFirstResponder](self->mSearchBar, "becomeFirstResponder");

  }
  self->mSearchingForString = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UISearchBar resignFirstResponder](self->mSearchBar, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)THSearchViewController;
  -[THSearchViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)didPresentViewController:(id)a3
{
  if (-[THSearchViewController p_isBottomViewVisible](self, "p_isBottomViewVisible", a3))
  {
    -[THSearchViewController p_bestPopoverHeight](self, "p_bestPopoverHeight");
    -[THSearchViewController p_changeToSize:animated:](self, "p_changeToSize:animated:", 1);
  }
}

- (void)p_searchIndexLoaded:(id)a3
{
  void *v4;
  __CFRunLoop *Main;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, THSearchControllerDidLoadIndexNotification, self->mSearchController);

  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C2B20;
  block[3] = &unk_426D30;
  block[4] = self;
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, block);
}

- (void)p_searchPaginationResultsUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  objc_msgSend(v5, "reloadData");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (void)setTheme:(id)a3
{
  IMTheme *v5;
  IMTheme *v6;

  v5 = (IMTheme *)a3;
  if (self->mTheme != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mTheme, a3);
    -[THSearchViewController stylizeForTheme](self, "stylizeForTheme");
    v5 = v6;
  }

}

- (void)stylizeForTheme
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  NSAttributedStringKey v43;
  uint64_t v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
    v5 = -[THSearchViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
    objc_msgSend(v6, "setOverrideUserInterfaceStyle:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
    objc_msgSend(v7, "setOverrideUserInterfaceStyle:", v5);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextColor"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryTextColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBackgroundColor"));
    if (!v10)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));
    v41 = (void *)v8;
    objc_msgSend(v3, "setTintColor:", v8);
    v42 = v3;
    objc_msgSend(v3, "setBackgroundColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchView](self, "searchView"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v12, "setBackgroundColor:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController footerView](self, "footerView"));
    objc_msgSend(v13, "setBackgroundColor:", v10);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController navigationBar](self, "navigationBar"));
    objc_msgSend(v14, "setBarTintColor:", v10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController popoverPresentationController](self, "popoverPresentationController"));
    objc_msgSend(v15, "setBackgroundColor:", v10);

    -[UISearchBar setBackgroundColor:](self->mSearchBar, "setBackgroundColor:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
    -[THSearchViewController p_configureTableViewControllerColors:](self, "p_configureTableViewControllerColors:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
    -[THSearchViewController p_configureTableViewControllerColors:](self, "p_configureTableViewControllerColors:", v17);

    v43 = NSForegroundColorAttributeName;
    v44 = v9;
    v40 = (void *)v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController navigationBar](self, "navigationBar"));
    objc_msgSend(v19, "setTitleTextAttributes:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dividerColor"));
    -[BEHairlineDividerView setDividerColor:](self->_headerDividerView, "setDividerColor:", v20);
    -[BEHairlineDividerView setDividerColor:](self->_footerTopBorderView, "setDividerColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 14.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageWithConfiguration:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithTintColor:", v39));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageWithRenderingMode:", 1));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 16.0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageWithConfiguration:", v27));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithTintColor:", v39));
    -[UISearchBar setImage:forSearchBarIcon:state:](self->mSearchBar, "setImage:forSearchBarIcon:state:", v25, 1, 0);
    -[UISearchBar setImage:forSearchBarIcon:state:](self->mSearchBar, "setImage:forSearchBarIcon:state:", v29, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchField](self->mSearchBar, "searchField"));
    if ((-[THSearchViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0
      || -[THSearchViewController im_isCompactHeight](self, "im_isCompactHeight"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "secondaryBackgroundColor"));
      objc_msgSend(v30, "setBackgroundColor:", v32);

    }
    else
    {
      objc_msgSend(v30, "setBackgroundColor:", 0);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_placeholderLabel"));
    objc_msgSend(v33, "setTextColor:", v39);

    objc_msgSend(v30, "setTextColor:", v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leftView"));
    objc_msgSend(v34, "setTintColor:", v39);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tableView"));
    objc_msgSend(v36, "reloadData");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "tableView"));
    objc_msgSend(v38, "reloadData");

    v3 = v42;
  }

}

- (void)p_configureTableViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tableView"));
  -[THSearchViewController _resultsHeaderHeight](self, "_resultsHeaderHeight");
  objc_msgSend(v9, "setSectionHeaderHeight:");
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v9, "setFrame:", CGPointZero.x, CGPointZero.y, v6, v8);
  objc_msgSend(v9, "setDataSource:", self);
  objc_msgSend(v9, "setDelegate:", self);

}

- (void)p_configureTableViewControllerColors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBackgroundColor"));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableViewSeparatorColor"));
  objc_msgSend(v6, "setSeparatorColor:", v7);

  objc_msgSend(v6, "setBackgroundColor:", v5);
}

- (BOOL)p_presentingFullscreen
{
  return -[THSearchViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") ^ 1;
}

- (BOOL)p_dismissKeyboardOnScroll
{
  return 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (-[THSearchViewController p_dismissKeyboardOnScroll](self, "p_dismissKeyboardOnScroll", a3))
    -[UISearchBar resignFirstResponder](self->mSearchBar, "resignFirstResponder");
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  UIView *mNoIndexView;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  if (-[THSearchViewController p_presentingFullscreen](self, "p_presentingFullscreen"))
  {
    -[THSearchViewController _resultsEstimatedRowHeight](self, "_resultsEstimatedRowHeight");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableView"));
    objc_msgSend(v6, "setEstimatedRowHeight:", v4);

    -[UIViewController setView:](self->mNoIndexViewController, "setView:", self->mNoIndexView);
    -[UIView frame](self->mNoIndexView, "frame");
    -[UIViewController setPreferredContentSize:](self->mNoIndexViewController, "setPreferredContentSize:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self->mNoIndexViewController, "navigationItem"));
    objc_msgSend(v9, "setTitleView:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self->mNoIndexViewController, "navigationItem"));
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v13 = kBESearchSectionSearchResultCellHeightPad;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tableView"));
    objc_msgSend(v15, "setEstimatedRowHeight:", v13);

    -[UIViewController setView:](self->mNoIndexViewController, "setView:", 0);
    mNoIndexView = self->mNoIndexView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self->mNoIndexViewController, "navigationItem"));
    objc_msgSend(v17, "setTitleView:", mNoIndexView);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self->mNoIndexViewController, "navigationItem"));
    v11 = v10;
    v12 = 1;
  }
  objc_msgSend(v10, "setHidesBackButton:", v12);

  v18 = objc_claimAutoreleasedReturnValue(-[THSearchViewController pendingDeferredViewWillAppear](self, "pendingDeferredViewWillAppear"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController traitCollection](self, "traitCollection"));
    v21 = objc_msgSend(v20, "horizontalSizeClass");

    if (v21)
      -[THSearchViewController p_deferredViewWillAppear](self, "p_deferredViewWillAppear");
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_C3570;
  v4[3] = &unk_4291E8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
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
  v9.super_class = (Class)THSearchViewController;
  v7 = a4;
  -[THSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C3638;
  v8[3] = &unk_4291E8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_429228, v8);

}

- (void)viewDidLoad
{
  void *v3;
  BEHairlineDividerView *v4;
  BEHairlineDividerView *headerDividerView;
  BEHairlineDividerView *v6;
  BEHairlineDividerView *footerTopBorderView;
  UISearchBar *v8;
  UISearchBar *mSearchBar;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  UISearchBar *v39;
  void *v40;
  void *v41;
  THSearchTableViewDataSource *v42;
  void *v43;
  THSearchTableViewDataSource *v44;
  THSearchTableViewDataSource *v45;
  void *v46;
  THSearchTableViewDataSource *v47;
  THSearchTableViewDataSource *v48;
  void *v49;
  THSearchTableViewDataSource *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  UIViewController *v55;
  UIViewController *mNoIndexViewController;
  uint64_t v57;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
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
  UIUserInterfaceLayoutDirection v119;
  void *v120;
  void *v121;
  void *v122;
  objc_super v123;
  _QWORD v124[21];
  CGRect v125;

  v123.receiver = self;
  v123.super_class = (Class)THSearchViewController;
  -[THNavigationViewController viewDidLoad](&v123, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController footerView](self, "footerView"));
  v4 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v4;

  -[BEHairlineDividerView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerDividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BEHairlineDividerView setHorizontal:](self->_headerDividerView, "setHorizontal:", 1);
  -[UIView addSubview:](self->_searchView, "addSubview:", self->_headerDividerView);
  v6 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = v6;

  -[BEHairlineDividerView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerTopBorderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BEHairlineDividerView setHorizontal:](self->_footerTopBorderView, "setHorizontal:", 1);
  objc_msgSend(v3, "addSubview:", self->_footerTopBorderView);
  v8 = (UISearchBar *)objc_claimAutoreleasedReturnValue(+[BESearchViewController p_standardSearchBar](BESearchViewController, "p_standardSearchBar"));
  mSearchBar = self->mSearchBar;
  self->mSearchBar = v8;

  -[UISearchBar setDelegate:](self->mSearchBar, "setDelegate:", self);
  -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->mSearchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISearchBar _setAutoDisableCancelButton:](self->mSearchBar, "_setAutoDisableCancelButton:", 0);
  -[UISearchBar sizeToFit](self->mSearchBar, "sizeToFit");
  -[UISearchBar frame](self->mSearchBar, "frame");
  self->_searchBarHeight = CGRectGetHeight(v125);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  v119 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute"));

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchWeb](self, "searchWeb"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchEncyclopedia](self, "searchEncyclopedia"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController navigationBar](self, "navigationBar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v122, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "safeAreaLayoutGuide"));

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_searchView, "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v117));
  v124[0] = v116;
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_searchView, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
  v124[1] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
  v124[2] = v110;
  v90 = v11;
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
  v124[3] = v107;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToConstant:", self->_searchBarHeight));
  v124[4] = v105;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView topAnchor](self->_headerDividerView, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v124[5] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView centerXAnchor](self->_headerDividerView, "centerXAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v100));
  v124[6] = v99;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView widthAnchor](self->_headerDividerView, "widthAnchor"));
  v121 = v12;
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
  v124[7] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView heightAnchor](self->_headerDividerView, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToConstant:", v17));
  v124[8] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView topAnchor](self->_footerTopBorderView, "topAnchor"));
  v18 = v3;
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v124[9] = v91;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView centerXAnchor](self->_footerTopBorderView, "centerXAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v124[10] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView widthAnchor](self->_footerTopBorderView, "widthAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v124[11] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BEHairlineDividerView heightAnchor](self->_footerTopBorderView, "heightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "scale");
  v21 = 1.0 / v20;

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:", v21));
  v124[12] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 15.0));
  v124[13] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "widthAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:multiplier:constant:", v76, 0.5, -15.0));
  v124[14] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "heightAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v124[15] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v124[16] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trailingAnchor"));
  v120 = v14;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, -15.0));
  v124[17] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "widthAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:multiplier:constant:", v64, 0.5, -15.0));
  v124[18] = v63;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "heightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v124[19] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v124[20] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 21));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  if (v119 == UIUserInterfaceLayoutDirectionRightToLeft)
    v29 = 2;
  else
    v29 = 1;
  if (v119 == UIUserInterfaceLayoutDirectionRightToLeft)
    v30 = 1;
  else
    v30 = 2;
  objc_msgSend(v122, "setContentHorizontalAlignment:", v29);
  objc_msgSend(v89, "setContentHorizontalAlignment:", v30);
  v31 = THBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Search Web"), &stru_43D7D8, 0));
  objc_msgSend(v122, "setTitle:forState:", v33, 0);

  v34 = THBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Search Wikipedia"), &stru_43D7D8, 0));
  objc_msgSend(v89, "setTitle:forState:", v36, 0);

  objc_msgSend(v18, "setHidden:", 0);
  -[THSearchViewController p_showBottomView:animated:](self, "p_showBottomView:animated:", 0, 0);
  v37 = objc_msgSend(objc_alloc((Class)UITableViewController), "initWithNibName:bundle:", 0, 0);
  -[THSearchViewController setResultsViewController:](self, "setResultsViewController:", v37);

  v38 = objc_msgSend(objc_alloc((Class)UITableViewController), "initWithNibName:bundle:", 0, 0);
  -[THSearchViewController setDetailsViewController:](self, "setDetailsViewController:", v38);

  v39 = self->mSearchBar;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "navigationItem"));
  objc_msgSend(v41, "setTitleView:", v39);

  v42 = [THSearchTableViewDataSource alloc];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
  v44 = -[THSearchTableViewDataSource initWithSearchController:searchViewMode:](v42, "initWithSearchController:searchViewMode:", v43, 0);
  -[THSearchViewController setResultsDataSource:](self, "setResultsDataSource:", v44);

  v45 = [THSearchTableViewDataSource alloc];
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
  v47 = -[THSearchTableViewDataSource initWithSearchController:searchViewMode:](v45, "initWithSearchController:searchViewMode:", v46, 2);
  -[THSearchViewController setDetailsDataSource:](self, "setDetailsDataSource:", v47);

  v48 = [THSearchTableViewDataSource alloc];
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
  v50 = -[THSearchTableViewDataSource initWithSearchController:searchViewMode:](v48, "initWithSearchController:searchViewMode:", v49, 1);
  -[THSearchViewController setSuggestionsDataSource:](self, "setSuggestionsDataSource:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  -[THSearchViewController p_configureTableViewController:](self, "p_configureTableViewController:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  -[THSearchViewController p_configureTableViewController:](self, "p_configureTableViewController:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  -[THNavigationViewController pushViewController:animated:](self, "pushViewController:animated:", v53, 0);

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("clearpixel")));
  objc_msgSend(v90, "setBackgroundImage:forBarMetrics:", v54, 0);
  objc_msgSend(v90, "setRequestedContentSize:", 3);
  objc_msgSend(v90, "_setHidesShadow:", 1);
  if (!-[THSearchController indexLoaded](self->mSearchController, "indexLoaded"))
  {
    if (!self->mNoIndexViewController)
    {
      v55 = (UIViewController *)objc_alloc_init((Class)UIViewController);
      mNoIndexViewController = self->mNoIndexViewController;
      self->mNoIndexViewController = v55;

    }
    v57 = THBundle();
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("Search Index Loading…"), &stru_43D7D8, 0));
    -[UILabel setText:](self->mNoIndexViewLabel, "setText:", v59);

    -[UIActivityIndicatorView startAnimating](self->mNoIndexActivityIndicatorView, "startAnimating");
    -[THNavigationViewController pushViewController:animated:](self, "pushViewController:animated:", self->mNoIndexViewController, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v60, "addObserver:selector:name:object:", self, "p_searchIndexLoaded:", THSearchControllerDidLoadIndexNotification, self->mSearchController);
    objc_msgSend(v60, "addObserver:selector:name:object:", self, "p_searchPaginationResultsUpdated:", THSearchControllerDidUpdatePaginationResultsNotification, self->mSearchController);
    -[THSearchController loadIndex](self->mSearchController, "loadIndex");

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v61, "setClipsToBounds:", 1);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view"));
  objc_msgSend(v62, "setClipsToBounds:", 1);

  -[THSearchViewController stylizeForTheme](self, "stylizeForTheme");
}

- (int64_t)overrideUserInterfaceStyle
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THSearchViewController;
  v4 = -[THSearchViewController overrideUserInterfaceStyle](&v10, "overrideUserInterfaceStyle");
  if (!v4)
  {
    v5 = objc_opt_class(IMThemePage, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController theme](self, "theme"));
    TSUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
      v4 = objc_msgSend(v8, "userInterfaceStyle");
    else
      v4 = 0;

  }
  return (int64_t)v4;
}

- (void)p_dismissSearchView:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "searchFinished:completion:", 1, 0);

}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!-[THSearchViewController isViewLoaded](self, "isViewLoaded")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController view](self, "view")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window")),
        v4,
        v3,
        !v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)THSearchViewController;
    -[THSearchViewController didReceiveMemoryWarning](&v5, "didReceiveMemoryWarning");
  }
}

- (void)searchForString:(id)a3
{
  THSearchController *mSearchController;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];

  self->mSearchingForString = 1;
  mSearchController = self->mSearchController;
  v9 = a3;
  if (-[THSearchController indexLoaded](mSearchController, "indexLoaded"))
  {
    self->mTextSetBySearch = 1;
    -[UISearchBar setText:](self->mSearchBar, "setText:", v9);

    self->mTextSetBySearch = 0;
    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[THSearchController clearSearchResults](self->mSearchController, "clearSearchResults");
    -[THSearchViewController setSettingSearchForString:](self, "setSettingSearchForString:", 1);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_C4764;
    v10[3] = &unk_426DA8;
    v10[4] = self;
    v5 = objc_retainBlock(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController topViewController](self, "topViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));

    if (v6 == v7)
      ((void (*)(_QWORD *, uint64_t))v5[2])(v5, 1);
    else
      v8 = -[THNavigationViewController popToRootViewControllerAnimated:completion:](self, "popToRootViewControllerAnimated:completion:", 1, v5);

  }
  else
  {
    -[THSearchViewController setPendingSearchText:](self, "setPendingSearchText:", v9);

  }
}

- (void)p_searchForSuggestion:(id)a3
{
  id v4;
  THSearchController *mSearchController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mSearchController = self->mSearchController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C4824;
  v7[3] = &unk_426D80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[THSearchController suggestionsForSearchString:completionBlock:](mSearchController, "suggestionsForSearchString:completionBlock:", v6, v7);

}

- (void)p_setupSpinner
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 60.0, 60.0);
  -[THSearchViewController setProgressView:](self, "setProgressView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "setCornerRadius:", 7.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v12, "bounds");
  v17 = TSDCenterOfRect(v13, v14, v15, v16);
  v18 = TSDFlooredPoint(v17);
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  objc_msgSend(v21, "setCenter:", v18, v20);

  v22 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  -[THSearchViewController setSpinner:](self, "setSpinner:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[THNavigationViewController contentContainerView](self, "contentContainerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
  objc_msgSend(v23, "addSubview:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  objc_msgSend(v25, "center");
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
  objc_msgSend(v30, "setCenter:", v27, v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
  objc_msgSend(v31, "setAlpha:", 0.0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
  objc_msgSend(v32, "setAlpha:", 0.0);

  v33 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
  objc_msgSend(v33, "startAnimating");

}

- (void)p_removeSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
    objc_msgSend(v4, "stopAnimating");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController spinner](self, "spinner"));
    objc_msgSend(v5, "removeFromSuperview");

    -[THSearchViewController setSpinner:](self, "setSpinner:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController progressView](self, "progressView"));
    objc_msgSend(v7, "removeFromSuperview");

    -[THSearchViewController setProgressView:](self, "setProgressView:", 0);
  }
}

- (void)navigateToSearchResult:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[THSearchViewController p_setupSpinner](self, "p_setupSpinner");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C4C90;
  v5[3] = &unk_426D30;
  v5[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v5, 0, 0.2, 0.5);
  -[THSearchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_navigateToSearchResult:", v4, 0.0);

}

- (void)p_navigateToAbsolutePageIndex:(id)a3
{
  -[THSearchViewController p_navigateToAbsolutePageIndex:animated:](self, "p_navigateToAbsolutePageIndex:animated:", a3, 1);
}

- (void)p_navigateToAbsolutePageIndex:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  -[THSearchViewController p_removeSpinner](self, "p_removeSpinner");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C4DB0;
  v9[3] = &unk_426D80;
  v10 = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v7 = WeakRetained;
  v8 = v6;
  objc_msgSend(v7, "searchFinished:completion:", v4, v9);

}

- (void)p_navigateToSearchResult:(id)a3
{
  -[THSearchViewController p_navigateToSearchResult:animated:](self, "p_navigateToSearchResult:animated:", a3, 1);
}

- (void)p_navigateToSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id WeakRetained;
  THSearchViewController *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  -[THSearchViewController p_removeSpinner](self, "p_removeSpinner");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C4EAC;
  v9[3] = &unk_429250;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = WeakRetained;
  objc_msgSend(v8, "searchFinished:completion:", v4, v9);

}

- (void)navigateToAbsolutePageIndex:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[THSearchViewController p_setupSpinner](self, "p_setupSpinner");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C4FD4;
  v6[3] = &unk_426D30;
  v6[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v6, 0, 0.2, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[THSearchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_navigateToAbsolutePageIndex:", v5, 0.0);

}

- (void)showAllResultsWithKind:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsDataSource](self, "detailsDataSource"));
  objc_msgSend(v6, "updateForResultsKind:", v3);

  objc_msgSend(v13, "reloadData");
  if ((uint64_t)objc_msgSend(v13, "numberOfSections") >= 1
    && (uint64_t)objc_msgSend(v13, "numberOfRowsInSection:", 0) >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    objc_msgSend(v13, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 1, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentQuery"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
  objc_msgSend(v11, "setTitle:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  -[THNavigationViewController pushViewController:animated:](self, "pushViewController:animated:", v12, 1);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  if (!self->mTextSetBySearch)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self, a4);
    -[THSearchController clearSearchResults](self->mSearchController, "clearSearchResults");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_searchText](self, "p_searchText"));
    if (objc_msgSend(v7, "length"))
    {
      -[THSearchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_searchForSuggestion:", v7, 0.25);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController suggestionsDataSource](self, "suggestionsDataSource"));
      objc_msgSend(v6, "setSuggestions:", v5);

      -[THSearchViewController p_showRecents](self, "p_showRecents");
    }
    -[THSearchViewController p_updateButtonState](self, "p_updateButtonState");

  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  THSearchTableViewDataSource *v5;
  void *v6;
  THSearchTableViewDataSource *v7;
  THSearchController *mSearchController;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_searchText](self, "p_searchText", a3));
  if (objc_msgSend(v4, "length"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
    -[THSearchController clearSearchResults](self->mSearchController, "clearSearchResults");
    v5 = [THSearchTableViewDataSource alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
    v7 = -[THSearchTableViewDataSource initWithSearchController:searchViewMode:](v5, "initWithSearchController:searchViewMode:", v6, 2);
    -[THSearchViewController setResultsDataSource:](self, "setResultsDataSource:", v7);

    -[UISearchBar resignFirstResponder](self->mSearchBar, "resignFirstResponder");
    mSearchController = self->mSearchController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_C536C;
    v9[3] = &unk_426D30;
    v9[4] = self;
    -[THSearchController searchForString:completionBlock:](mSearchController, "searchForString:completionBlock:", v4, v9);
  }

}

- (id)p_searchText
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->mSearchBar, "text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3));

  return v4;
}

- (void)p_updateButtonState
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_searchText](self, "p_searchText"));
  v4 = objc_msgSend(v3, "length") != 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchEncyclopedia](self, "searchEncyclopedia"));
  objc_msgSend(v5, "setEnabled:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchWeb](self, "searchWeb"));
  objc_msgSend(v6, "setEnabled:", v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[THSearchViewController p_dismissSearchView:](self, "p_dismissSearchView:", a3);
}

- (void)searchWeb:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->mSearchBar, "text", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("x-web-search:///?"), "stringByAppendingString:", v8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  objc_msgSend(v5, "openURL:options:completionHandler:", v7, &__NSDictionary0__struct, 0);

}

- (void)searchEncyclopedia:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->mSearchBar, "text", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x-web-search://wikipedia/?%@"), v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v7, "openURL:options:completionHandler:", v6, &__NSDictionary0__struct, 0);

}

- (id)tableView:(id)a3 viewForHeaderWithTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("headerCell")));
  if (!v9)
    v9 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithReuseIdentifier:", CFSTR("headerCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
  objc_msgSend(v10, "setText:", v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondaryTextColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
  objc_msgSend(v13, "setTextColor:", v12);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_C57D0;
  v17[3] = &unk_429278;
  v18 = v8;
  v19 = v6;
  v14 = v6;
  v15 = v8;
  objc_msgSend(v9, "_setBackgroundViewConfigurationProvider:", v17);

  return v9;
}

- (id)tableView:(id)a3 cellForPlainString:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("textCell")));
  if (!v8)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("textCell"));
    v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v8, "setSelectedBackgroundView:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v10, "setText:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableViewCellSelectedColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedBackgroundView"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v14, "setHighlightedTextColor:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryTextColor"));
  objc_msgSend(v14, "setTextColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  objc_msgSend(v8, "setBackgroundColor:", v16);

  return v8;
}

- (id)tableView:(id)a3 cellForSearchResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = kBESearchTableViewCellResultsIdentifier;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", kBESearchTableViewCellResultsIdentifier));
  if (!v9)
    v9 = objc_msgSend(objc_alloc((Class)BESearchResultTableViewCell), "initWithStyle:reuseIdentifier:", 3, v8);
  -[THSearchViewController _configureResultsCell:forSearchResult:inTableView:](self, "_configureResultsCell:forSearchResult:inTableView:", v9, v7, v6);

  return v9;
}

- (void)_configureResultsCell:(id)a3 forSearchResult:(id)a4 inTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  THSearchController *mSearchController;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  THSearchViewController *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  CGRect v66;

  v65 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v65, "setSelectedBackgroundView:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  if (v11)
  {

  }
  else if (objc_msgSend(v8, "rank") != 1)
  {
    -[THSearchController resolveTitleForSearchResult:](self->mSearchController, "resolveTitleForSearchResult:", v8);
  }
  v12 = objc_msgSend(v8, "rank");
  if (v12 - 6 >= 2 && v12 == 1)
  {
    v64 = v9;
    v13 = THBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Glossary: %@"), &stru_43D7D8, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "term"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "titleLabel"));
    objc_msgSend(v18, "setText:", v17);

    mSearchController = self->mSearchController;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "term"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchController summaryForGlossaryTerm:](mSearchController, "summaryForGlossaryTerm:", v20));

    if (!v21)
    {
      v22 = THBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("(Glossary entry for \\U201C%@\\U201D)"), &stru_43D7D8, 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "term"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v25));

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "resultLabel"));
    objc_msgSend(v26, "setText:", v21);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentQuery"));
    v29 = self;
    v30 = objc_msgSend(v21, "rangeOfString:", v28);
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "resultLabel"));
    v34 = v30;
    self = v29;
    objc_msgSend(v33, "setBoldRange:", v34, v32);

    v9 = v64;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v36 = objc_msgSend(v35, "length");

    if (v36)
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    else
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "term"));
    v38 = (void *)v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "titleLabel"));
    objc_msgSend(v39, "setText:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayPageNumber"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "pageNumberLabel"));
    objc_msgSend(v41, "setText:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "resultLabel"));
    objc_msgSend(v43, "setText:", v42);

    v44 = objc_msgSend(v8, "contextRangeForResult");
    v46 = v45;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "resultLabel"));
    objc_msgSend(v15, "setBoldRange:", v44, v46);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tableViewCellSelectedColor"));
  objc_msgSend(v10, "setBackgroundColor:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryTextColor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "pageNumberLabel"));
  objc_msgSend(v50, "setTextColor:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "primaryTextColor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "titleLabel"));
  objc_msgSend(v52, "setTextColor:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "resultLabel"));
  objc_msgSend(v53, "setTextColor:", v51);

  objc_msgSend(v9, "frame");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;

  v66.origin.x = v55;
  v66.origin.y = v57;
  v66.size.width = v59;
  v66.size.height = v61;
  objc_msgSend(v65, "setMaxWidth:", CGRectGetWidth(v66));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryBackgroundColor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "focusShapeView"));
  objc_msgSend(v63, "setFillColor:", v62);

  objc_msgSend(v65, "applyLabelFonts");
  objc_msgSend(v65, "updateConstraintsIfNeeded");

}

- (id)tableView:(id)a3 noResultsCellWithKind:(int)a4
{
  uint64_t v4;
  THSearchTableViewNoResultsCell *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = (THSearchTableViewNoResultsCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("noResultsCell")));
  if (!v6)
  {
    v6 = -[THSearchTableViewNoResultsCell initWithStyle:reuseIdentifier:]([THSearchTableViewNoResultsCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("noResultsCell"));
    v7 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[THSearchTableViewNoResultsCell setSelectedBackgroundView:](v6, "setSelectedBackgroundView:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableViewCellSelectedColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewNoResultsCell selectedBackgroundView](v6, "selectedBackgroundView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryTextColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewNoResultsCell textLabel](v6, "textLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewNoResultsCell detailTextLabel](v6, "detailTextLabel"));
  objc_msgSend(v13, "setTextColor:", v11);

  -[THSearchTableViewNoResultsCell setSearchKind:](v6, "setSearchKind:", v4);
  return v6;
}

- (id)tableView:(id)a3 seeAllResultsCellWithKind:(int)a4 count:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("seeAllResultsCell")));
  if (!v8)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("seeAllResultsCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchWeb](self, "searchWeb"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v12, "setFont:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v13, "setTextAlignment:", 0);

    v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v8, "setSelectedBackgroundView:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController themePage](self, "themePage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tableViewCellSelectedColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedBackgroundView"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryTextColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v19, "setTextColor:", v18);

  v20 = THBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (a4)
    v23 = CFSTR("See all %lu media results…");
  else
    v23 = CFSTR("See all %lu text results…");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_43D7D8, 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, a5));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
  objc_msgSend(v26, "setText:", v25);

  return v8;
}

- (double)_resultsEstimatedRowHeight
{
  double *v2;

  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargestHeightPhone;
    }
    else if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge))
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargerHeightPhone;
    }
    else
    {
      v2 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargeHeightPhone;
    }
  }
  else
  {
    v2 = (double *)&kBESearchSectionSearchResultCellHeightPhone;
  }
  return *v2;
}

- (double)_resultsHeaderHeight
{
  double *v2;
  double result;
  double v4;
  unsigned int v5;

  if (!+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    v2 = (double *)&kBESearchTableViewHeaderHeight;
    return *v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))
  {
    v2 = (double *)&kBESearchTableViewAccessibilityHeaderLargestHeight;
    return *v2;
  }
  v4 = kBESearchTableViewAccessibilityHeaderLargeHeight;
  v5 = +[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge);
  result = kBESearchTableViewAccessibilityHeaderLargerHeight;
  if (!v5)
    return v4;
  return result;
}

- (id)p_dataSourceForTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsViewController](self, "resultsViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  if (v6 == v4)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[THSearchViewController resultsDataSource](self, "resultsDataSource"));
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsViewController](self, "detailsViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  if (v8 == v4)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[THSearchViewController detailsDataSource](self, "detailsDataSource"));
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v6));
  v8 = objc_msgSend(v7, "tableView:numberOfRowsInSection:", v6, a4);

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView:cellForRowAtIndexPath:searchViewController:", v7, v6, self));

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v4));
  v6 = objc_msgSend(v5, "numberOfSectionsInTableView:", v4);

  return (int64_t)v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", a3));
  if (objc_msgSend(v7, "searchViewMode") == 2
    && objc_msgSend(v7, "indexPathCorrespondsToSearchResultRow:", v6))
  {
    v8 = objc_msgSend(v7, "indexPathCorrespondsToSeeAllResultsRow:", v6) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v16));
  if (objc_msgSend(v10, "searchViewMode") == 2
    && objc_msgSend(v10, "indexPathCorrespondsToSearchResultRow:", v9))
  {
    v12 = objc_opt_class(BESearchResultTableViewCell, v11);
    TSUDynamicCast(v12, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchResultForTableIndexPath:", v9));
      -[THSearchViewController _configureResultsCell:forSearchResult:inTableView:](self, "_configureResultsCell:forSearchResult:inTableView:", v14, v15, v16);

    }
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleForHeaderInSection:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController tableView:viewForHeaderWithTitle:](self, "tableView:viewForHeaderWithTitle:", v6, v8));

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (BESearchResultTableViewCell)dummySearchResultsCell
{
  BESearchResultTableViewCell *mDummySearchResultsCell;
  BESearchResultTableViewCell *v4;
  BESearchResultTableViewCell *v5;

  mDummySearchResultsCell = self->mDummySearchResultsCell;
  if (!mDummySearchResultsCell)
  {
    v4 = (BESearchResultTableViewCell *)objc_msgSend(objc_alloc((Class)BESearchResultTableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
    v5 = self->mDummySearchResultsCell;
    self->mDummySearchResultsCell = v4;

    mDummySearchResultsCell = self->mDummySearchResultsCell;
  }
  return mDummySearchResultsCell;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (-[THSearchViewController searchViewMode](self, "searchViewMode") == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v6));
    v10 = objc_msgSend(v9, "numberOfResultsInSection:", objc_msgSend(v7, "section"));

    v8 = v7;
    if (!v10)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  v6 = a3;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v16, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController p_dataSourceForTableView:](self, "p_dataSourceForTableView:", v6));

  v8 = objc_msgSend(v7, "searchViewMode");
  switch(v8)
  {
    case 2u:
      v10 = objc_msgSend(v7, "numberOfResultsInSection:", objc_msgSend(v16, "section"));
      if (v10)
      {
        if (objc_msgSend(v16, "row") != v10)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResultForTableIndexPath:", v16));
          -[THSearchViewController navigateToSearchResult:](self, "navigateToSearchResult:", v9);
          goto LABEL_12;
        }
        -[THSearchViewController showAllResultsWithKind:](self, "showAllResultsWithKind:", objc_msgSend(v7, "p_resultKindForSection:", objc_msgSend(v16, "section")));
      }
      break;
    case 1u:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v16, "row")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
      v13 = objc_msgSend(v12, "isEncodedResultForPageNumber:", v9);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController searchController](self, "searchController"));
        v15 = objc_msgSend(v14, "absolutePageIndexFromEncodedPageNumberResult:", v9);

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
          -[THSearchViewController navigateToAbsolutePageIndex:](self, "navigateToAbsolutePageIndex:", v15);
        goto LABEL_12;
      }
      goto LABEL_11;
    case 0u:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchController recentSearchQueryAtIndex:](self->mSearchController, "recentSearchQueryAtIndex:", objc_msgSend(v16, "row")));
LABEL_11:
      -[THSearchViewController searchForString:](self, "searchForString:", v9);
LABEL_12:

      break;
  }

}

- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[THSearchViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingSessionDataForSearchViewController:", self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentDataForSearchViewController:", self));

  if (v9 && v5 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v8, "emitInBookSearchEventWithTracker:readingSessionData:contentData:", v9, v5, v7);

  }
}

- (THSearchViewControllerDelegate)delegate
{
  return (THSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->mDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mDelegate, a3);
}

- (THSearchController)searchController
{
  return self->mSearchController;
}

- (NSString)pendingSearchText
{
  return self->mPendingSearchText;
}

- (void)setPendingSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIActivityIndicatorView)spinner
{
  return self->mSpinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->mSpinner, a3);
}

- (UIView)progressView
{
  return self->mProgressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->mProgressView, a3);
}

- (IMTheme)theme
{
  return self->mTheme;
}

- (void)setDummySearchResultsCell:(id)a3
{
  objc_storeStrong((id *)&self->mDummySearchResultsCell, a3);
}

- (NSDictionary)pendingDeferredViewWillAppear
{
  return self->mPendingDeferredViewWillAppear;
}

- (void)setPendingDeferredViewWillAppear:(id)a3
{
  objc_storeStrong((id *)&self->mPendingDeferredViewWillAppear, a3);
}

- (BOOL)searchingForPredeterminedString
{
  return self->mSearchingForPredeterminedString;
}

- (void)setSearchingForPredeterminedString:(BOOL)a3
{
  self->mSearchingForPredeterminedString = a3;
}

- (int)searchViewMode
{
  return self->_searchViewMode;
}

- (void)setSearchViewMode:(int)a3
{
  self->_searchViewMode = a3;
}

- (UIButton)searchWeb
{
  return self->_searchWeb;
}

- (void)setSearchWeb:(id)a3
{
  objc_storeStrong((id *)&self->_searchWeb, a3);
}

- (UIButton)searchEncyclopedia
{
  return self->_searchEncyclopedia;
}

- (void)setSearchEncyclopedia:(id)a3
{
  objc_storeStrong((id *)&self->_searchEncyclopedia, a3);
}

- (UITableViewController)resultsViewController
{
  return self->_resultsViewController;
}

- (void)setResultsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsViewController, a3);
}

- (UITableViewController)detailsViewController
{
  return self->_detailsViewController;
}

- (void)setDetailsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailsViewController, a3);
}

- (THSearchTableViewDataSource)resultsDataSource
{
  return self->_resultsDataSource;
}

- (void)setResultsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_resultsDataSource, a3);
}

- (THSearchTableViewDataSource)detailsDataSource
{
  return self->_detailsDataSource;
}

- (void)setDetailsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_detailsDataSource, a3);
}

- (THSearchTableViewDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, a3);
}

- (UIBarButtonItem)zeroWidthBarButton
{
  return self->_zeroWidthBarButton;
}

- (void)setZeroWidthBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_zeroWidthBarButton, a3);
}

- (UIView)searchView
{
  return self->_searchView;
}

- (void)setSearchView:(id)a3
{
  objc_storeStrong((id *)&self->_searchView, a3);
}

- (double)maxContentHeight
{
  return self->_maxContentHeight;
}

- (void)setMaxContentHeight:(double)a3
{
  self->_maxContentHeight = a3;
}

- (BOOL)settingSearchForString
{
  return self->_settingSearchForString;
}

- (void)setSettingSearchForString:(BOOL)a3
{
  self->_settingSearchForString = a3;
}

- (NSLayoutConstraint)footerViewHeightConstraint
{
  return self->_footerViewHeightConstraint;
}

- (void)setFooterViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewHeightConstraint, a3);
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDividerView, a3);
}

- (BEHairlineDividerView)footerTopBorderView
{
  return self->_footerTopBorderView;
}

- (void)setFooterTopBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTopBorderView, a3);
}

- (double)searchBarHeight
{
  return self->_searchBarHeight;
}

- (void)setSearchBarHeight:(double)a3
{
  self->_searchBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTopBorderView, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_storeStrong((id *)&self->_footerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_zeroWidthBarButton, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_detailsDataSource, 0);
  objc_storeStrong((id *)&self->_resultsDataSource, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_searchEncyclopedia, 0);
  objc_storeStrong((id *)&self->_searchWeb, 0);
  objc_storeStrong((id *)&self->mPendingDeferredViewWillAppear, 0);
  objc_storeStrong((id *)&self->mDummySearchResultsCell, 0);
  objc_storeStrong((id *)&self->mProgressView, 0);
  objc_storeStrong((id *)&self->mSpinner, 0);
  objc_storeStrong((id *)&self->mPendingSearchText, 0);
  objc_storeStrong((id *)&self->mSearchController, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mNoIndexViewController, 0);
  objc_storeStrong((id *)&self->mNoIndexActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->mNoIndexViewLabel, 0);
  objc_storeStrong((id *)&self->mNoIndexView, 0);
  objc_storeStrong((id *)&self->mTheme, 0);
  objc_storeStrong((id *)&self->mSearchBar, 0);
}

@end
