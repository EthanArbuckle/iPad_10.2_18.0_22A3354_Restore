@implementation SearchResultsNavigationController

- (SearchResultsNavigationController)initWithModel:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  SearchResultsNavigationController *v8;
  SearchResultsNavigationController *v9;
  SearchResultsViewController *v10;
  void *v11;
  SearchResultsViewController *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SearchResultsNavigationController;
  v8 = -[SearchResultsNavigationController init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    -[SearchResultsNavigationController setModel:](v8, "setModel:", v6);
    v10 = [SearchResultsViewController alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController model](v9, "model"));
    v12 = -[SearchResultsViewController initWithModel:window:](v10, "initWithModel:window:", v11, v7);
    -[SearchResultsNavigationController setSearchResultsViewController:](v9, "setSearchResultsViewController:", v12);

    -[SearchResultsNavigationController setDelegate:](v9, "setDelegate:", v9);
    objc_initWeak(&location, v9);
    *(_QWORD *)&v13 = objc_opt_class(UITraitHorizontalSizeClass).n128_u64[0];
    v22 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1, v13));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100101614;
    v18[3] = &unk_1001B2418;
    objc_copyWeak(&v19, &location);
    v16 = -[SearchResultsNavigationController registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v15, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsNavigationController;
  -[SearchResultsNavigationController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  -[SearchResultsNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", 1, 0);
  -[SearchResultsNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
  -[SearchResultsNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsNavigationController;
  -[SearchResultsNavigationController viewDidLoad](&v4, "viewDidLoad");
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[10];
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  objc_super v23;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SearchResultsNavigationController;
  -[SearchResultsNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v23, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x4010000000;
  v20[3] = &unk_100195B79;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v8, "frame");
  *(_QWORD *)&v21 = v9;
  *((_QWORD *)&v21 + 1) = v10;
  *(_QWORD *)&v22 = v11;
  *((_QWORD *)&v22 + 1) = v12;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001019B4;
  v19[3] = &unk_1001B5940;
  *(double *)&v19[6] = width;
  *(double *)&v19[7] = height;
  v19[4] = self;
  v19[5] = v20;
  v19[8] = v16;
  v19[9] = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
  _Block_object_dispose(v20, 8);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchResultsNavigationController;
  v4 = a3;
  -[SearchResultsNavigationController preferredContentSizeDidChangeForChildContentContainer:](&v7, "preferredContentSizeDidChangeForChildContentContainer:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController", v7.receiver, v7.super_class));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
    objc_msgSend(v6, "preferredContentSize");
    -[SearchResultsNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
  if (v6 == v18
    && -[SearchResultsNavigationController initialPresentationHasCompleted](self, "initialPresentationHasCompleted"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "horizontalSizeClass");

    if (v8 == (id)1)
      -[SearchResultsNavigationController animateShowingSearchBarAnimated:withCompletion:](self, "animateShowingSearchBarAnimated:withCompletion:", 1, 0);
  }
  else
  {

  }
  -[SearchResultsNavigationController setInitialPresentationHasCompleted:](self, "setInitialPresentationHasCompleted:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
  v10 = v9 == v18;

  -[SearchResultsNavigationController _setSearchBarEnabledState:](self, "_setSearchBarEnabledState:", v10);
  -[SearchResultsNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", v10, 1);
  v11 = v18;
  if (v9 == v18)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController presentingViewController](self, "presentingViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy(v14);

    -[SearchResultsNavigationController _updateTodayButtonPosition](self, "_updateTodayButtonPosition");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController presentingViewController](self, "presentingViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v17);

    v11 = v18;
  }

}

- (void)hideSearchBarForNavigationTransitionAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (a3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController transitionCoordinator](self, "transitionCoordinator")),
        v4,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController transitionCoordinator](self, "transitionCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100102034;
    v10[3] = &unk_1001B2C38;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010203C;
    v9[3] = &unk_1001B2C38;
    objc_msgSend(v5, "animateAlongsideTransitionInView:animation:completion:", v7, v10, v9);

  }
  else
  {
    -[SearchResultsNavigationController _hideSearchBar](self, "_hideSearchBar");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
    objc_msgSend(v8, "setHidden:", 1);

  }
}

- (void)animateShowingSearchBarAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController transitionCoordinator](self, "transitionCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010217C;
    v12[3] = &unk_1001B2C38;
    v12[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100102184;
    v10[3] = &unk_1001B2BC0;
    v11 = v6;
    objc_msgSend(v7, "animateAlongsideTransitionInView:animation:completion:", v9, v12, v10);

  }
  else
  {
    -[SearchResultsNavigationController _showSearchBar](self, "_showSearchBar");
    if (v6)
      v6[2](v6);
  }

}

- (void)_hideSearchBar
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v12 = v5 - CGRectGetWidth(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v13, "setFrame:", v12, v7, v9, v11);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v14, "resignFirstResponder");

}

- (void)_showSearchBar
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[9];
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100102340;
  v14[3] = &unk_1001B27C0;
  v14[4] = self;
  *(double *)&v14[5] = -CGRectGetWidth(v15);
  *(double *)&v14[6] = v7;
  *(double *)&v14[7] = v9;
  *(double *)&v14[8] = v11;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v12, "setFrame:", 0.0, v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  objc_msgSend(v13, "becomeFirstResponder");

}

- (void)setSearchBar:(id)a3
{
  UISearchBar **p_searchBar;
  id v5;
  id v6;

  p_searchBar = &self->_searchBar;
  v5 = a3;
  objc_storeWeak((id *)p_searchBar, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
  objc_msgSend(v6, "setSearchBar:", v5);

}

- (void)_updateTodayButtonPosition
{
  void *v3;
  uint64_t v4;
  int IsRegularInViewHierarchy;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController view](self, "view"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v3, v4);

  if (IsRegularInViewHierarchy)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_leftButton"));

    v9 = CalendarAppTintColor(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v21, "setTitleColor:forState:", v10, 0);

    *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_todayLocalizedString", v11));
    objc_msgSend(v21, "setTitle:forState:", v13, 0);

    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "todayPressed", 64);
    -[SearchResultsNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", 1, 0);

  }
  else
  {
    v14 = objc_alloc((Class)UIBarButtonItem);
    *(_QWORD *)&v15 = objc_opt_class(self).n128_u64[0];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_todayLocalizedString", v15));
    v18 = objc_msgSend(v14, "initWithTitle:style:target:action:", v17, 0, self, "todayPressed");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
    v22 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v19, "setToolbarItems:animated:", v20, 1);

    -[SearchResultsNavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", 0, 0);
  }
}

- (void)_setSearchBarEnabledState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController transitionCoordinator](self, "transitionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchBar](self, "searchBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001026B8;
  v8[3] = &unk_1001B2C10;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "animateAlongsideTransitionInView:animation:completion:", v7, v8, 0);

}

- (void)todayPressed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = CalAnalyticsSendEvent(CFSTR("userTappedTodayButton"), 0);
  v5 = CUIKTodayDate(v3, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));

  v9 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDate:timeZone:", v11, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsNavigationController searchResultsViewController](self, "searchResultsViewController"));
  objc_msgSend(v10, "selectDate:animated:", v9, 1);

}

+ (id)_todayLocalizedString
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v2 = objc_opt_class(a1).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));

  return v5;
}

- (SearchResultsViewController)searchResultsViewController
{
  return self->_searchResultsViewController;
}

- (void)setSearchResultsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsViewController, a3);
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (BOOL)initialPresentationHasCompleted
{
  return self->_initialPresentationHasCompleted;
}

- (void)setInitialPresentationHasCompleted:(BOOL)a3
{
  self->_initialPresentationHasCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
}

@end
