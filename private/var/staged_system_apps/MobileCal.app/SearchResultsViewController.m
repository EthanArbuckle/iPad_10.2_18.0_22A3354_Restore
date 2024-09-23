@implementation SearchResultsViewController

- (SearchResultsViewController)initWithModel:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  SearchResultsViewController *v8;
  SearchResultsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[2];

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SearchResultsViewController;
  v8 = -[ListViewController initWithModel:window:](&v22, "initWithModel:window:", v6, v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](v8, "model"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchString"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](v9, "model"));
      objc_msgSend(v12, "setSearchString:", 0);

    }
    -[ListViewController setOverrideExtendedEdges:](v9, "setOverrideExtendedEdges:", 0);
    -[ListViewController setDestination:](v9, "setDestination:", 1);
    objc_opt_class(UITraitHorizontalSizeClass);
    v23[0] = v13;
    *(_QWORD *)&v14 = objc_opt_class(UITraitVerticalSizeClass).n128_u64[0];
    v23[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2, v14));
    objc_initWeak(&location, v9);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100103474;
    v19[3] = &unk_1001B2418;
    objc_copyWeak(&v20, &location);
    v17 = -[SearchResultsViewController registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v16, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchResultsViewController cancelTimer](self, "cancelTimer");
  if (!-[SearchResultsViewController shouldLeaveSearchString](self, "shouldLeaveSearchString"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v3, "setSearchString:", 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)SearchResultsViewController;
  -[ListViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  -[SearchResultsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewController;
  -[SearchResultsViewController viewDidLoad](&v3, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController presentingViewController](self, "presentingViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v6);

  -[SearchResultsViewController _updateFilterState](self, "_updateFilterState");
  -[SearchResultsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController presentingViewController](self, "presentingViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v9);

  -[SearchResultsViewController _updateTableAlpha:](self, "_updateTableAlpha:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = CUIKCalendarModelSearchResultsAvailableNotification;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_searchResultsUpdated:", v10, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v12.receiver = self;
  v12.super_class = (Class)SearchResultsViewController;
  -[ListViewController viewWillAppear:](&v12, "viewWillAppear:", 0);
  v11.receiver = self;
  v11.super_class = (Class)SearchResultsViewController;
  -[ListViewController viewDidAppear:](&v11, "viewDidAppear:", 0);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchString"));
    *(_DWORD *)buf = 138543619;
    v14 = v8;
    v15 = 2113;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. searchString = %{private}@", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewController;
  -[ListViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v3);

  -[SearchResultsViewController _setContentInsets](self, "_setContentInsets");
  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewController;
  -[SearchResultsViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v4);

}

- (void)_setContentInsets
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
  void *v12;
  double MaxY;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  uint64_t v24;
  id v25;
  CGRect v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if ((id)-[ListViewController destination](self, "destination") != (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    objc_msgSend(v12, "bounds");
    MaxY = CGRectGetMaxY(v26);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    objc_msgSend(v14, "convertPoint:fromView:", v15, 0.0, MaxY);
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    objc_msgSend(v18, "contentOffset");
    v20 = v17 - v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    v22 = objc_msgSend(v21, "safeAreaInsets");
    v5 = CalRoundToScreenScale(v22, v24, v20 - v23);

  }
  v25 = (id)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  objc_msgSend(v25, "setContentInset:", v5, v7, v9, v11);

}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewController;
  -[SearchResultsViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[SearchResultsViewController _setContentInsets](self, "_setContentInsets");
}

- (BOOL)_useLargeFormatBehavior
{
  void *v2;
  uint64_t v3;
  char ShouldUseLargeFormatInterface;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController _sizingContextWindow](self, "_sizingContextWindow"));
  ShouldUseLargeFormatInterface = EKUICurrentWindowInterfaceParadigm_ShouldUseLargeFormatInterface((uint64_t)v2, v3);

  return ShouldUseLargeFormatInterface;
}

- (void)_updatePreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (-[SearchResultsViewController _useLargeFormatBehavior](self, "_useLargeFormatBehavior"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
    if (objc_msgSend(v4, "length"))
    {

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      v6 = -[ListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v5);

      if (!v6)
      {
        -[SearchResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGSizeZero.width, CGSizeZero.height);
        return;
      }
    }
    -[SearchResultsViewController _maxHeightOfTableView](self, "_maxHeightOfTableView");
    v8 = fmax(v7, 371.0);
    -[SearchResultsViewController preferredContentSize](self, "preferredContentSize");
    if (vabdd_f64(v9, v8) >= 2.22044605e-16)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      objc_msgSend(v11, "frame");
      -[SearchResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v8);

    }
  }
}

- (double)_maxHeightOfTableView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double Height;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    objc_msgSend(v6, "bounds");
    Height = CGRectGetHeight(v17);

  }
  else
  {
    Height = 4000.0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v9 = (uint64_t)objc_msgSend(v8, "numberOfSections");

  if (v9 < 1)
  {
    v11 = 0.0;
LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    objc_msgSend(v14, "estimatedRowHeight");
    Height = v11 + v15;

  }
  else
  {
    v10 = 0;
    v11 = 0.0;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      objc_msgSend(v12, "rectForSection:", v10);
      v11 = v11 + v13;

      if (v11 >= Height)
        break;
      if (v9 == ++v10)
        goto LABEL_10;
    }
  }
  return Height;
}

- (void)_updateTableAlpha:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100103D9C;
  v7[3] = &unk_1001B4028;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v3)
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 0.3, 0.0, 1.0, 0.0);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration searchConfiguration](UIContentUnavailableConfiguration, "searchConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchString"));
  v9 = objc_msgSend(v8, "length");

  *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
  v13 = v12;
  if (v9)
    v14 = CFSTR("No Results");
  else
    v14 = CFSTR("No Events");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1001B67C0, 0));

  objc_msgSend(v6, "setText:", v15);
  return v6;
}

- (void)_updateFilterState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController view](self, "view"));
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v8, v3))
  {
    -[ListViewController setShowFilteredData:](self, "setShowFilteredData:", 1);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController view](self, "view"));
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4, v5))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
      -[ListViewController setShowFilteredData:](self, "setShowFilteredData:", objc_msgSend(v7, "length") != 0);

    }
    else
    {
      -[ListViewController setShowFilteredData:](self, "setShowFilteredData:", 0);
    }

  }
}

- (BOOL)shouldPreserveDateAcrossRefresh
{
  return 1;
}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));

    if (v7)
    {
      v8.receiver = self;
      v8.super_class = (Class)SearchResultsViewController;
      -[ListViewController scrollToDate:animated:](&v8, "scrollToDate:animated:", v6, v4);
    }
  }

}

- (id)backButtonTitleForEventDetails
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v3, v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("String displayed for the back button of the details of an event occurrence when in search mode"), CFSTR("Search"), 0));

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cachedOccurrenceAtIndexPath:usingFilter:", v7, -[ListViewController showFilteredData](self, "showFilteredData")));

  -[SearchResultsViewController showEvent:](self, "showEvent:", v6);
  if ((id)-[ListViewController destination](self, "destination") == (id)2)
    -[ListViewController setCurrentSelectedEvent:](self, "setCurrentSelectedEvent:", v6);
  -[ListViewController updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:](self, "updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:", v7);

}

- (void)showEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if ((id)-[ListViewController destination](self, "destination") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchResultsDelegate](self, "searchResultsDelegate"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchResultsDelegate](self, "searchResultsDelegate"));
      objc_msgSend(v6, "searchResultsViewController:didSelectEvent:", self, v4);

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v7, "horizontalSizeClass") == (id)1)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController traitCollection](self, "traitCollection"));
      v9 = objc_msgSend(v8, "verticalSizeClass");

      if (v9 != (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        objc_msgSend(v15, "setSelectedOccurrence:", v4);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController presentingViewController](self, "presentingViewController"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100104408;
        v17[3] = &unk_1001B26A0;
        v17[4] = self;
        v18 = v4;
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v17);

        goto LABEL_12;
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController presentedViewController](self, "presentedViewController"));

    if (!v10)
    {
      -[ListViewController setPreventScrollingForNextViewAppear:](self, "setPreventScrollingForNextViewAppear:", 1);
      -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v4, 1, 1, 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    objc_msgSend(v11, "resignFirstResponder");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController traitCollection](self, "traitCollection"));
    v13 = objc_msgSend(v12, "horizontalSizeClass");

    if (v13 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController"));
      objc_msgSend(v14, "hideSearchBarForNavigationTransitionAnimated:", 1);

    }
  }
LABEL_12:

}

- (BOOL)prefersShowingViewControllersOnNavigationStack
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "horizontalSizeClass") == (id)1)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController traitCollection](self, "traitCollection"));
    v4 = objc_msgSend(v5, "verticalSizeClass") == (id)1;

  }
  return v4;
}

- (BOOL)shouldUpdateModelSelectedDate
{
  return 0;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  objc_opt_class(EKUIReadonlyEventViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  else
    v9 = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
  objc_msgSend(v9, "willCommitPreview");
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001045D0;
    v11[3] = &unk_1001B26A0;
    v11[4] = self;
    v12 = v10;
    objc_msgSend(v6, "addAnimations:", v11);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  -[SearchResultsViewController searchBar:textDidChange:](self, "searchBar:textDidChange:", v6, v5);

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v4, "setViewControllers:", &__NSArray0__struct);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar", a3));
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  NSTimer *v7;
  NSTimer *timer;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v5 = a4;
  -[SearchResultsViewController cancelTimer](self, "cancelTimer");
  if (objc_msgSend(v5, "length"))
  {
    v14 = CFSTR("text");
    v15 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "beginSearch:", v6, 0, 0.35));
    timer = self->_timer;
    self->_timer = v7;

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v9, "setSearchString:", 0);

    -[SearchResultsViewController _updateFilterState](self, "_updateFilterState");
    v10 = -[SearchResultsViewController _refreshView](self, "_refreshView");
    v12 = CUIKTodayDate(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[SearchResultsViewController scrollToDate:animated:](self, "scrollToDate:animated:", v13, 0);

  }
}

- (void)beginSearch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("text")));

  -[SearchResultsViewController cancelTimer](self, "cancelTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v5, "setSearchString:", v6);

}

- (void)cancelTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (id)_sizingContextWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController presentingViewController](self, "presentingViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    }
  }
  return v4;
}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL IsNull;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v11 = EKUIWidthForWindowSizeParadigm(32, v10);
  v12 = objc_claimAutoreleasedReturnValue(-[SearchResultsViewController _sizingContextWindow](self, "_sizingContextWindow"));
  v14 = (void *)v12;
  if (v12)
  {
    if (!EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v12, v13)
      || (EKUICurrentHeightSizeClassIsRegular(v14) & 1) == 0)
    {
      objc_msgSend(v9, "bounds");
      x = CGRectGetWidth(v26) * 0.5 - v11 * 0.5;
      width = v11;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchField"));
    objc_msgSend(v15, "frame");
    IsNull = CGRectIsNull(v27);

    if (!IsNull)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchField"));
      objc_msgSend(v17, "frame");
      x = v18;
      y = v19;
      width = v20;
      height = v21;

    }
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 0;
}

- (int64_t)editorPresentationStyle
{
  return 3;
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentViewController"));

  objc_msgSend(v9, "presentViewController:animated:completion:", v7, v5, 0);
}

- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController", a3, a4));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar", a3));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  if (!v5)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
  v9 = objc_msgSend(v8, "isEqualToString:", &stru_1001B67C0);

  if (v9)
  {
LABEL_5:
    v12 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController searchBar](self, "searchBar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    -[SearchResultsViewController searchBar:textDidChange:](self, "searchBar:textDidChange:", v12, v11);

  }
}

- (void)_searchResultsUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationController](self, "navigationController"));

  if (v4)
  {
    -[SearchResultsViewController _updateFilterState](self, "_updateFilterState");
    -[SearchResultsViewController _refreshView](self, "_refreshView");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scrollToToday")));

    v7 = objc_msgSend(v6, "BOOLValue");
    if ((_DWORD)v7)
    {
      v9 = CUIKTodayDate(v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[SearchResultsViewController scrollToDate:animated:](self, "scrollToDate:animated:", v10, 0);

    }
    -[SearchResultsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

  }
}

- (void)_refreshView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchString"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", v5 != 0);

  -[ListViewController refresh](self, "refresh");
  -[SearchResultsViewController _updateTableAlpha:](self, "_updateTableAlpha:", 1);
  -[SearchResultsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (SearchResultsViewControllerDelegate)searchResultsDelegate
{
  return (SearchResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_searchResultsDelegate);
}

- (void)setSearchResultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchResultsDelegate, a3);
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (void)setSearchBar:(id)a3
{
  objc_storeWeak((id *)&self->_searchBar, a3);
}

- (BOOL)shouldLeaveSearchString
{
  return self->_shouldLeaveSearchString;
}

- (void)setShouldLeaveSearchString:(BOOL)a3
{
  self->_shouldLeaveSearchString = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchResultsDelegate);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
