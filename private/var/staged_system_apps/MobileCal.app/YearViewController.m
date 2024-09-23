@implementation YearViewController

- (YearViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8;
  id v9;
  id v10;
  YearViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  EKUIOverlayCalendarSignificantDatesProvider *v15;
  EKUIOverlayCalendarSignificantDatesProvider *overlaySignificantDatesProvider;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)YearViewController;
  v11 = -[InfiniteScrollViewController initWithCalendarDate:model:window:](&v21, "initWithCalendarDate:model:window:", v8, v9, v10);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = CUIKCalendarModelSignificantTimeChangeNotification;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](v11, "model"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_significantTimeChanged:", v13, v14);

    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_timeZoneChanged:", CUIKCalendarModelTimeZoneChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);
    -[YearViewController updateBackButtonToDate:](v11, "updateBackButtonToDate:", v8);
    v15 = objc_opt_new(EKUIOverlayCalendarSignificantDatesProvider);
    overlaySignificantDatesProvider = v11->_overlaySignificantDatesProvider;
    v11->_overlaySignificantDatesProvider = v15;

    objc_initWeak(&location, v11);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E2618;
    v18[3] = &unk_1001B5200;
    objc_copyWeak(&v19, &location);
    -[EKUIOverlayCalendarSignificantDatesProvider setSignificantDatesChangedHandler:](v11->_overlaySignificantDatesProvider, "setSignificantDatesChangedHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v11;
}

- (void)updateBackButtonToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EKCalendarDate *backButtonDate;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[YearViewController parentViewController](self, "parentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v7 = CUIKStringForYear();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setBackButtonTitle:", v8);

  backButtonDate = self->_backButtonDate;
  self->_backButtonDate = (EKCalendarDate *)v4;

}

- (void)setPushDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pushDelegate, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController viewWillAppear:](&v7, "viewWillAppear:");
  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
    objc_msgSend(v5, "setHidden:", 0);

  }
  if (self->_requiresReload)
    -[YearViewController _reloadAllViewsForContentSizeCategoryChange](self, "_reloadAllViewsForContentSizeCategoryChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", &stru_1001B67C0);

  -[InfiniteScrollViewController showSelectedDateIfNeeded](self, "showSelectedDateIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v4, "startNotificationMonitor");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2800;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F64D0 != -1)
    dispatch_once(&qword_1001F64D0, block);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[YearViewController _hidePressHighlightWithFadeDuration:](self, "_hidePressHighlightWithFadeDuration:", 0.0);
}

- (void)viewDidLoad
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapRecognizer;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressRecognizer;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_viewTapped:");
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v3;

  v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_viewLongPressed:");
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v5;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressRecognizer, "setMinimumPressDuration:", 0.1);
  -[UILongPressGestureRecognizer setAllowableMovement:](self->_longPressRecognizer, "setAllowableMovement:", 0.0);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressRecognizer, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", self->_tapRecognizer);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v8, "addGestureRecognizer:", self->_longPressRecognizer);

}

- (id)title
{
  return &stru_1001B67C0;
}

- (unint64_t)maximumCachedReusableViews
{
  return 10;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  uint64_t v4;
  unint64_t v5;

  v4 = (uint64_t)objc_msgSend(a3, "differenceInMonths:", a4);
  if (v4 >= 0)
    v5 = v4;
  else
    v5 = -v4;
  return v5 < 0x31;
}

- (id)createInitialViewForDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _flooredCalendarDateForCalendarDate:](self, "_flooredCalendarDateForCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _viewForCalendarDate:](self, "_viewForCalendarDate:", v4));

  return v5;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _viewForCalendarDate:](self, "_viewForCalendarDate:", v4));

  return v5;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _viewForCalendarDate:](self, "_viewForCalendarDate:", v4));

  return v5;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _flooredCalendarDateForCalendarDate:](self, "_flooredCalendarDateForCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingMonths:", (int)-(uint64_t)-[YearViewController monthsPerRow](self, "monthsPerRow")));

  return v5;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController _flooredCalendarDateForCalendarDate:](self, "_flooredCalendarDateForCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingMonths:", (int)-[YearViewController monthsPerRow](self, "monthsPerRow")));

  return v5;
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    objc_msgSend(v6, "mainContentSize");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
    v7 = EKUICurrentWindowSize(v6);
  }
  v9 = v7;
  v10 = v8;

  v11 = -[YearViewController multipleMonthViewClass](self, "multipleMonthViewClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  v13 = EKUIHeightSizeClassForViewHierarchy(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  -[objc_class heightForViewWithCalendarDate:windowSize:heightSizeClass:orientation:](v11, "heightForViewWithCalendarDate:windowSize:heightSizeClass:orientation:", v4, v13, EKUIInterfaceOrientationForViewHierarchy(v14), v9, v10);
  v16 = v15;

  return v16;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  double result;

  -[objc_class topInset](-[YearViewController multipleMonthViewClass](self, "multipleMonthViewClass", a3), "topInset");
  return result;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateForYear"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController traitCollection](self, "traitCollection"));
  LODWORD(v8) = EKUIUsesLargeTextYearView();

  if ((_DWORD)v8)
  {
    v13 = v10;

    v11 = v13;
  }
  -[YearViewController _hidePressHighlightWithFadeDuration:](self, "_hidePressHighlightWithFadeDuration:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
  v15.receiver = self;
  v15.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController showDate:animated:](&v15, "showDate:animated:", v14, v4);

}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  void *v6;
  double v7;
  double v8;
  double y;
  void *v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat v15;
  void *v16;
  NSObject *v17;
  Class v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  CGRect v27;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView", a3.x, a3.y));
  objc_msgSend(v6, "contentOffset");
  v8 = v7;

  y = a4->y;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetHeight(v27) * 0.7;

  if (vabdd_f64(y, v8) > v11)
  {
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:](self, "nearestMajorBoundaryForPoint:", a4->x, a4->y);
    x = v13;
    v15 = v12;
    if (y <= v8)
    {
      if (v12 <= v8)
      {
        v16 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v17 = v16;
          objc_opt_class(self);
          v19 = NSStringFromClass(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = NSStringFromCGPoint(*a4);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = 138412546;
          v24 = v20;
          v25 = 2112;
          v26 = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Major boundary settling triggered in [%@].  Will settle on offset: [%@]", (uint8_t *)&v23, 0x16u);

        }
        goto LABEL_9;
      }
    }
    else if (v12 >= v8)
    {
      goto LABEL_9;
    }
    x = a4->x;
    v15 = a4->y;
LABEL_9:
    a4->x = x;
    a4->y = v15;
  }
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return objc_msgSend(a3, "calendarDateForYear");
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController pastMajorBoundaryCalendarDateForCalendarDate:](self, "pastMajorBoundaryCalendarDateForCalendarDate:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingYears:", 1));

  return v4;
}

- (void)didEndScrolling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController didEndScrolling](&v3, "didEndScrolling");
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
}

- (BOOL)shouldUpdatePreferredReloadDates
{
  return 0;
}

- (void)enableGestureRecognizers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v3, "addGestureRecognizer:", self->_tapRecognizer);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v4, "addGestureRecognizer:", self->_longPressRecognizer);

}

- (void)disableGestureRecognizers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v3, "removeGestureRecognizer:", self->_tapRecognizer);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v4, "removeGestureRecognizer:", self->_longPressRecognizer);

}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  -[YearViewController showDate:animated:](self, "showDate:animated:", v8, v4);

}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 1;
}

- (BOOL)_isTodayCircleFrameFullyUnobstructed
{
  double v3;
  CGFloat v4;
  void *v5;
  double v6;
  CGFloat v7;
  void *v8;
  CGFloat Width;
  CGFloat x;
  CGFloat y;
  CGFloat v12;
  CGFloat height;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[InfiniteScrollViewController unobstructedScrollViewHeight](self, "unobstructedScrollViewHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v15);

  -[YearViewController frameForTodayHighlight](self, "frameForTodayHighlight");
  x = v16.origin.x;
  y = v16.origin.y;
  v12 = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16))
    return 0;
  v17.origin.x = 0.0;
  v17.origin.y = v7;
  v17.size.width = Width;
  v17.size.height = v4;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = v12;
  v18.size.height = height;
  return CGRectContainsRect(v17, v18);
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startCalendarDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController pushedMonthViewControllerWithDate:animated:](self, "pushedMonthViewControllerWithDate:animated:", v12, 0));

    objc_msgSend(v13, "showEvent:animated:showMode:context:", v10, v8, a5, v11);
  }
  else
  {
    v14 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Year View.", v15, 2u);
    }
  }

}

- (id)bestDateForNewEvent
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = CUIKTodayDate(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v7));

  -[YearViewController frameForTodayHighlight](self, "frameForTodayHighlight");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  LOBYTE(v4) = CGRectIsNull(v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v13, "contentInset");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  v17 = CGRectGetHeight(v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v18, "contentInset");
  v20 = v19;

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectGetMinY(v26) > v17 - v20
    || (v27.origin.x = x, v27.origin.y = y, v27.size.width = width, v27.size.height = height, CGRectGetMaxY(v27) < v15))
  {
LABEL_4:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewInBuffer](self, "dateOfCenterViewInBuffer"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "calendarDateForYear"));

  }
  else
  {
    v22 = v8;
  }

  return v22;
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 1;
}

- (id)testingRotationWillStartNotificationName
{
  return CFSTR("YearViewController_RotationAnimationStartedNotification");
}

- (id)testingRotationDidEndNotificationName
{
  return CFSTR("YearViewController_RotationAnimationCompletedNotification");
}

- (id)sceneTitle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedDay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));

  if (v4)
  {
    v5 = CUIKStringForYear(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)transitionToSizeDidEnd
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)YearViewController;
  -[MainViewController transitionToSizeDidEnd](&v8, "transitionToSizeDidEnd");
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E359C;
  v3[3] = &unk_1001B5228;
  v3[4] = &v4;
  v3[5] = -[YearViewController monthsPerRow](self, "monthsPerRow");
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v3);
  if (*((_BYTE *)v5 + 24))
    -[YearViewController _reloadAllViews](self, "_reloadAllViews");
  _Block_object_dispose(&v4, 8);
}

- (void)_selectedDateChanged
{
  void *v3;
  char *v4;
  BOOL v5;
  char *v6;
  void *v7;
  YearViewController *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController navigationController](self, "navigationController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));

  v4 = (char *)objc_msgSend(v9, "count");
  v5 = (unint64_t)v4 >= 2;
  v6 = v4 - 2;
  v7 = v9;
  if (v5)
  {
    v8 = (YearViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));
    if (v8 == self)
      -[YearViewController _updateBackButtonToSelectedDate](self, "_updateBackButtonToSelectedDate");

    v7 = v9;
  }

}

- (void)_significantTimeChanged:(id)a3
{
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B5248);
}

- (void)_timeZoneChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window", a3));
  EKUIPushFallbackSizingContextWithViewHierarchy(v4);
  -[YearViewController _reloadAllViews](self, "_reloadAllViews");
  -[YearViewController timeZoneDidChange](self, "timeZoneDidChange");
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B5268);
  EKUIPopFallbackSizingContextWithViewHierarchy(v4);

}

- (void)_localeChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3730;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
  {

  }
  else
  {
    v6 = EKUIHasFallbackSizingContext();

    if ((v6 & 1) == 0)
    {
      self->_requiresReload = 1;
      goto LABEL_6;
    }
  }
  -[YearViewController _reloadAllViewsForContentSizeCategoryChange](self, "_reloadAllViewsForContentSizeCategoryChange");
LABEL_6:
  EKUIPopFallbackSizingContextWithViewHierarchy(v7);

}

- (void)_reloadAllViewsForContentSizeCategoryChange
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));

  if (v4)
    -[YearViewController _reloadAllViewsWithDate:](self, "_reloadAllViewsWithDate:", v4);
  else
    -[YearViewController _reloadAllViews](self, "_reloadAllViews");

}

- (void)_reloadAllViews
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewInBuffer](self, "dateOfCenterViewInBuffer"));
  -[YearViewController _reloadAllViewsWithDate:](self, "_reloadAllViewsWithDate:", v3);

}

- (void)_reloadAllViewsWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[YearViewController _updateBackButtonToSelectedDate](self, "_updateBackButtonToSelectedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateInTimeZone:", v7));

  -[InfiniteScrollViewController reinitializeAllViewsWithCalendarDate:](self, "reinitializeAllViewsWithCalendarDate:", v8);
}

- (void)_viewTapped:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v20, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", v6, v8));
  if (v9)
  {
    objc_opt_class(YearMultipleMonthView);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
      objc_msgSend(v11, "convertPoint:fromView:", v12, v6, v8);
      v14 = v13;
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startOfMonthForPoint:", v14, v16));
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "touches"));
        v19 = -[YearViewController _containsPreciseTouch:](self, "_containsPreciseTouch:", v18);

        -[YearViewController receivedTapAtLocation:usingDate:precise:](self, "receivedTapAtLocation:usingDate:precise:", v17, v19, v6, v8);
      }

    }
  }

}

- (BOOL)_containsPreciseTouch:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "type", (_QWORD)v8) == (id)1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5
{
  id v6;

  v6 = a4;
  -[YearViewController _pushMonthViewControllerWithDate:animated:](self, "_pushMonthViewControllerWithDate:animated:", v6, -[YearViewController shouldAnimateTransitionsToMonthView](self, "shouldAnimateTransitionsToMonthView"));

}

- (void)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[YearViewController _updateBackButtonToSelectedDate](self, "_updateBackButtonToSelectedDate");
  v6 = -[YearViewController pushedMonthViewControllerWithDate:animated:](self, "pushedMonthViewControllerWithDate:animated:", v7, v4);

}

- (void)_fadePressHighlightViewToAlpha:(double)a3 duration:(double)a4 completion:(id)a5
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E3CEC;
  v5[3] = &unk_1001B2838;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v5, a5, a4, 0.0);
}

- (void)_showPressHighlightWithFadeDuration:(double)a3
{
  -[YearViewController _fadePressHighlightViewToAlpha:duration:completion:](self, "_fadePressHighlightViewToAlpha:duration:completion:", 0, 1.0, a3);
}

- (void)_hidePressHighlightWithFadeDuration:(double)a3
{
  -[YearViewController _fadePressHighlightViewToAlpha:duration:completion:](self, "_fadePressHighlightViewToAlpha:duration:completion:", 0, 0.0, a3);
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UILongPressGestureRecognizer *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  v9 = self->_longPressRecognizer != v6 || objc_msgSend(v7, "type") != (id)1;

  return v9;
}

- (void)_viewLongPressed:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *pressHighlight;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  char v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  int v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int IsRectEffectivelyEqualToRect;
  _QWORD v74[5];
  id v75;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", v7, v9));
  if (v10)
  {
    objc_opt_class(YearMultipleMonthView);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
      objc_msgSend(v12, "convertPoint:fromView:", v13, v7, v9);
      v15 = v14;
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startOfMonthForPoint:", v15, v17));
      if (!v18)
      {
        -[YearViewController _hidePressHighlightWithFadeDuration:](self, "_hidePressHighlightWithFadeDuration:", 0.2);
LABEL_18:

        goto LABEL_19;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "monthViewForCalendarDate:", v18));
      if (!self->_pressHighlight)
      {
        v20 = objc_opt_new(UIView);
        pressHighlight = self->_pressHighlight;
        self->_pressHighlight = v20;

        -[UIView setAlpha:](self->_pressHighlight, "setAlpha:", 0.0);
        -[UIView setUserInteractionEnabled:](self->_pressHighlight, "setUserInteractionEnabled:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v22, "addSubview:", self->_pressHighlight);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v23, "bringSubviewToFront:", self->_pressHighlight);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitCollection"));
      +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorWithAlphaComponent:", 0.8));
      -[UIView setBackgroundColor:](self->_pressHighlight, "setBackgroundColor:", v26);

      v27 = objc_msgSend(v4, "state");
      if (v27 == (id)3)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v19, "bounds");
        objc_msgSend(v59, "convertRect:fromView:", v19);
        v61 = v60;
        v63 = v62;
        v65 = v64;
        v67 = v66;
        v68 = -[UIView frame](self->_pressHighlight, "frame");
        IsRectEffectivelyEqualToRect = CalIsRectEffectivelyEqualToRect(v68, v61, v63, v65, v67, v69, v70, v71, v72);

        if (IsRectEffectivelyEqualToRect)
        {
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_1000E41DC;
          v74[3] = &unk_1001B2F58;
          v74[4] = self;
          v75 = v18;
          -[YearViewController _fadePressHighlightViewToAlpha:duration:completion:](self, "_fadePressHighlightViewToAlpha:duration:completion:", v74, 0.0, 0.1);

        }
        goto LABEL_17;
      }
      if (v27 == (id)2)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v19, "bounds");
        objc_msgSend(v29, "convertRect:fromView:", v19);
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v38 = -[UIView frame](self->_pressHighlight, "frame");
        v43 = CalIsRectEffectivelyEqualToRect(v38, v31, v33, v35, v37, v39, v40, v41, v42);

        if ((v43 & 1) == 0)
        {
          -[YearViewController _hidePressHighlightWithFadeDuration:](self, "_hidePressHighlightWithFadeDuration:", 0.2);
          goto LABEL_17;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v19, "bounds");
        objc_msgSend(v44, "convertRect:fromView:", v19);
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v53 = -[UIView frame](self->_pressHighlight, "frame");
        v58 = CalIsRectEffectivelyEqualToRect(v53, v46, v48, v50, v52, v54, v55, v56, v57);

        if (v58)
          goto LABEL_13;
      }
      else if (v27 == (id)1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
        objc_msgSend(v19, "bounds");
        objc_msgSend(v28, "convertRect:fromView:", v19);
        -[UIView setFrame:](self->_pressHighlight, "setFrame:");

LABEL_13:
        -[YearViewController _showPressHighlightWithFadeDuration:](self, "_showPressHighlightWithFadeDuration:", 0.2);
      }
LABEL_17:

      goto LABEL_18;
    }
  }
LABEL_19:

}

- (id)pushedMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NextLevelMainViewControllerContainerPushDelegate **p_pushDelegate;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = a4;
  p_pushDelegate = &self->_pushDelegate;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pushDelegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pushNextLevelMainViewControllerContainerWithDate:animated:", v6, v4));

  return v8;
}

- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NextLevelMainViewControllerContainerPushDelegate **p_pushDelegate;
  id v8;
  id WeakRetained;

  v5 = a5;
  p_pushDelegate = &self->_pushDelegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pushDelegate);
  objc_msgSend(WeakRetained, "pushContentViewOfType:date:animated:", a3, v8, v5);

}

- (CGRect)frameForTodayHighlight
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat x;
  double v21;
  CGFloat y;
  double v23;
  CGFloat width;
  double v25;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController monthViewForCalendarDate:](self, "monthViewForCalendarDate:", v8));

  if (v9)
  {
    objc_msgSend(v9, "frameForTodayHighlight");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
    objc_msgSend(v18, "convertRect:fromView:", v9, v11, v13, v15, v17);
    x = v19;
    y = v21;
    width = v23;
    height = v25;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)monthFrameForCalendarDate:(id)a3 adjustHeightUp:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController monthViewForCalendarDate:](self, "monthViewForCalendarDate:", a3));
  objc_msgSend(v6, "frameForGridOfDays:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v15, "convertRect:fromView:", v6, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPoint)monthHeaderLocationForCalendarDate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController monthViewForCalendarDate:](self, "monthViewForCalendarDate:", a3));
  objc_msgSend(v4, "headerOrigin");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController view](self, "view"));
  objc_msgSend(v9, "convertPoint:fromView:", v4, v6, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)monthViewForCalendarDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));
  objc_msgSend(v5, "layoutIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "monthViewForCalendarDate:", v4));

  return v6;
}

- (void)_updateBackButtonToSelectedDate
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedDate"));

  if (v4)
  {
    -[YearViewController updateBackButtonToDate:](self, "updateBackButtonToDate:", v4);
  }
  else
  {
    v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No selected date.  Will not update back back title.", v6, 2u);
    }
  }

}

- (void)invalidateBackButtonDate
{
  EKCalendarDate *backButtonDate;

  backButtonDate = self->_backButtonDate;
  self->_backButtonDate = 0;

}

- (id)_flooredCalendarDateForCalendarDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "calendarDateForMonth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendar"));
  v8 = objc_msgSend(v7, "ordinalityOfUnit:inUnit:forDate:", 8, 4, v5);

  v9 = -[YearViewController monthsPerRow](self, "monthsPerRow");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingMonths:", (int)(1 - ((_DWORD)v8 + v9) + ((unint64_t)v8 + v9 - 1) / v9 * v9)));

  return v10;
}

- (id)_viewForCalendarDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setCalendarDate:", v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendar"));

    v7 = objc_msgSend(objc_alloc(-[YearViewController multipleMonthViewClass](self, "multipleMonthViewClass")), "initCalendarDate:calendar:maximumNumberOfMonths:", v4, v9, -[YearViewController monthsPerRow](self, "monthsPerRow"));
    objc_msgSend(v7, "setOverlaySignificantDatesProvider:", self->_overlaySignificantDatesProvider);

  }
  EKUIPopFallbackSizingContextWithViewHierarchy(v5);

  return v7;
}

- (NextLevelMainViewControllerContainerPushDelegate)pushDelegate
{
  return (NextLevelMainViewControllerContainerPushDelegate *)objc_loadWeakRetained((id *)&self->_pushDelegate);
}

- (Class)monthViewControllerClass
{
  return self->_monthViewControllerClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthViewControllerClass, 0);
  objc_destroyWeak((id *)&self->_pushDelegate);
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_backButtonDate, 0);
  objc_storeStrong((id *)&self->_pressHighlight, 0);
}

- (int64_t)intendedSizeClass
{
  uint64_t v2;
  int64_t result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (Class)multipleMonthViewClass
{
  uint64_t v2;
  Class result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (unint64_t)monthsPerRow
{
  uint64_t v2;
  unint64_t result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

@end
