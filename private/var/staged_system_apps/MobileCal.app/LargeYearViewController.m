@implementation LargeYearViewController

- (BOOL)_usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)_orientationForSize:(CGSize)a3
{
  if (-[LargeYearViewController _usePortraitLayoutForSize:](self, "_usePortraitLayoutForSize:", a3.width, a3.height))
    return 1;
  else
    return 4;
}

- (int64_t)_currentOrientation
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v6 = -[LargeYearViewController _orientationForSize:](self, "_orientationForSize:", v4, v5);

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *orientationForCurrentViewLayout;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (!self->_viewHasAppearedBefore
    || (orientationForCurrentViewLayout = (void *)self->_orientationForCurrentViewLayout,
        orientationForCurrentViewLayout != (void *)-[LargeYearViewController _currentOrientation](self, "_currentOrientation"))|| !self->_viewHasAppearedBefore)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedDate"));

    -[LargeYearViewController reinitializeAllViewsWithCalendarDate:](self, "reinitializeAllViewsWithCalendarDate:", v7);
    self->_viewHasAppearedBefore = 1;
    self->_orientationForCurrentViewLayout = -[LargeYearViewController _currentOrientation](self, "_currentOrientation");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v8, "setNeedsLayout");

  v9.receiver = self;
  v9.super_class = (Class)LargeYearViewController;
  -[YearViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
}

- (void)reinitializeAllViewsWithCalendarDate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeYearViewController;
  -[InfiniteScrollViewController reinitializeAllViewsWithCalendarDate:](&v4, "reinitializeAllViewsWithCalendarDate:", a3);
  self->_orientationForCurrentViewLayout = -[LargeYearViewController _currentOrientation](self, "_currentOrientation");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKCalendarDate *currentYearNumber;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v3 = a3;
  v5 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  self->_viewIsVisible = 1;
  currentYearNumber = self->_currentYearNumber;
  self->_currentYearNumber = 0;

  -[LargeYearViewController _updateYearNumbersAnimated:withForce:](self, "_updateYearNumbersAnimated:withForce:", 1, 1);
  v14.receiver = self;
  v14.super_class = (Class)LargeYearViewController;
  -[YearViewController viewDidAppear:](&v14, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  EKCalendarDate *currentYearNumber;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  -[YearViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  self->_viewIsVisible = 0;
  currentYearNumber = self->_currentYearNumber;
  self->_currentYearNumber = 0;

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
  void *v9;
  void *v10;
  id v11;
  EKCalendarDate *v12;
  EKCalendarDate *activeDateDuringRotation;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LargeYearViewController;
  -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = objc_msgSend(v10, "activationState");

  if (v11 != (id)2)
  {
    self->_orientationForCurrentViewLayout = -[LargeYearViewController _orientationForSize:](self, "_orientationForSize:", width, height);
    v12 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewInBuffer](self, "dateOfCenterViewInBuffer"));
    activeDateDuringRotation = self->_activeDateDuringRotation;
    self->_activeDateDuringRotation = v12;

    self->_isRotating = 1;
    self->_targetSizeAfterTransition.width = width;
    self->_targetSizeAfterTransition.height = height;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
    objc_msgSend(v14, "setNeedsLayout");

    v15[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000EC088;
    v16[3] = &unk_1001B2C38;
    v16[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000EC154;
    v15[3] = &unk_1001B54E8;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, v15);
  }

}

- (void)viewWillLayoutSubviews
{
  unsigned int v3;
  EKCalendarDate *activeDateDuringRotation;
  EKCalendarDate *v5;
  EKCalendarDate *v7;
  int v8;
  EKCalendarDate *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double width;
  double height;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  void ***v23;
  void ***v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  LargeYearViewController *v29;
  EKCalendarDate *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)LargeYearViewController;
  -[InfiniteScrollViewController viewWillLayoutSubviews](&v31, "viewWillLayoutSubviews");
  v3 = -[LargeYearViewController isViewLoaded](self, "isViewLoaded");
  activeDateDuringRotation = self->_activeDateDuringRotation;
  if (v3)
  {
    v5 = activeDateDuringRotation;
    if (self->_isRotating || activeDateDuringRotation != 0)
    {
      if (!activeDateDuringRotation)
      {
        v7 = 0;
        goto LABEL_21;
      }
      v7 = v5;
      v8 = 1;
      goto LABEL_16;
    }
    v9 = 0;
  }
  else
  {
    v9 = activeDateDuringRotation;
    v7 = v9;
    if (self->_isRotating)
      goto LABEL_21;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  width = self->_previousViewSize.width;
  height = self->_previousViewSize.height;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedDate"));
  v7 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "calendarDateForEndOfMonth"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v19, "bounds");
  self->_previousViewSize.width = v20;
  self->_previousViewSize.height = v21;

  if (width != v12 || height != v14)
  {
    v8 = 0;
LABEL_16:
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_1000EC388;
    v28 = &unk_1001B26A0;
    v29 = self;
    v7 = v7;
    v30 = v7;
    v23 = objc_retainBlock(&v25);
    v24 = v23;
    if (v8)
      ((void (*)(void ***))v23[2])(v23);
    else
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23, v25, v26, v27, v28, v29);

  }
LABEL_21:

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  objc_super v5;

  if (self->_activeDateDuringRotation)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  return -[YearViewController shouldAnimateScrollToDate:fromClosestDate:](&v5, "shouldAnimateScrollToDate:fromClosestDate:", a3, a4);
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  __int128 v15;
  double v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  v7 = EKUICurrentWindowSizeParadigmForViewHierarchy(v5, v6);

  v8 = 32.0;
  if (v7 >= 0x800000)
  {
    if (v7 > 0x7FFFFFF)
    {
      if (v7 == 0x8000000)
        goto LABEL_15;
      v9 = 0x20000000;
    }
    else
    {
      if (v7 == 0x800000)
        goto LABEL_15;
      v9 = 0x2000000;
    }
    if (v7 != v9)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v7 <= 4095)
  {
    if (v7 == 512)
    {
      v8 = 10.0;
      goto LABEL_16;
    }
    if (v7 != 1024)
      goto LABEL_16;
LABEL_15:
    v8 = 0.0;
    goto LABEL_16;
  }
  if (v7 == 4096)
  {
    v8 = 18.0;
    goto LABEL_16;
  }
  if (v7 == 0x80000)
    goto LABEL_15;
LABEL_16:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController traitCollection](self, "traitCollection"));
  if (EKUIUsesLargeTextYearView())
  {
    v11 = objc_msgSend(v4, "month");
    v12 = -[LargeYearViewController monthsPerRow](self, "monthsPerRow");

    v13 = 0.0;
    if ((unint64_t)v11 > v12)
      goto LABEL_25;
  }
  else
  {

  }
  *((_QWORD *)&v15 + 1) = v7;
  *(_QWORD *)&v15 = v7 - 512;
  v14 = v15 >> 9;
  if (v14 <= 7 && ((1 << v14) & 0x83) != 0)
    v16 = 63.0;
  else
    v16 = 43.0;
  v13 = v8 + v16;
LABEL_25:

  return v13;
}

- (void)didScroll
{
  if (self->_viewIsVisible)
    -[LargeYearViewController _updateYearNumbersAnimated:withForce:](self, "_updateYearNumbersAnimated:withForce:", 1, 0);
}

- (void)didEndScrolling
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  -[YearViewController didEndScrolling](&v5, "didEndScrolling");
  if (self->_viewIsVisible)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController _currentlyViewingCalendarDate](self, "_currentlyViewingCalendarDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v4, "setSelectedDate:", v3);

  }
  -[LargeYearViewController _updateYearNumbersAnimated:withForce:](self, "_updateYearNumbersAnimated:withForce:", 1, 1);
}

- (Class)multipleMonthViewClass
{
  void *v2;
  int v3;
  __objc2_class **v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();

  v4 = off_1001B1658;
  if (!v3)
    v4 = off_1001B1670;
  objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (unint64_t)monthsPerRow
{
  void *v3;
  double v4;
  double v5;
  double height;
  double width;
  uint64_t v8;
  double v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v4 = EKUICurrentWindowSize(v3);
  if (self->_isRotating)
  {
    width = self->_targetSizeAfterTransition.width;
    height = self->_targetSizeAfterTransition.height;
  }
  else
  {
    width = v4;
    height = v5;
    objc_opt_class(MobileCalWindow);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      objc_msgSend(v3, "mainContentSize");
      width = v9;
    }
  }
  objc_opt_class(self);
  v11 = objc_msgSend(v10, "_monthsPerRowForWindowSize:", width, height);

  return (unint64_t)v11;
}

+ (unint64_t)_monthsPerRowForWindowSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (EKUIUsesLargeTextYearView(0, a2))
    return +[LargeTextLargeYearMultipleMonthView numberOfMonthsPerRowForWindowSize:](LargeTextLargeYearMultipleMonthView, "numberOfMonthsPerRowForWindowSize:", width, height);
  else
    return (unint64_t)objc_msgSend(a1, "defaultMonthsPerRowForWindowSize:", width, height);
}

+ (unint64_t)defaultMonthsPerRowForWindowSize:(CGSize)a3
{
  CGFloat height;
  double width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  __n128 v9;
  unint64_t result;
  double v11;

  height = a3.height;
  width = a3.width;
  v5 = EKUIWindowSizeParadigmForWindowSize(a3.width);
  if ((EKUIUsesLargeTextYearView(0, v6) & 1) == 0)
  {
    result = 6;
    if (v5 <= 0x1FFFFFF)
    {
      if (v5 == 0x80000 || v5 == 0x800000)
        return result;
    }
    else if (v5 == 0x2000000 || v5 == 0x8000000 || v5 == 0x20000000)
    {
      return result;
    }
  }
  v8.n128_f64[0] = width;
  v9.n128_f64[0] = height;
  if (EKUIWindowInterfaceParadigmForWindowSize(0, v7, v8, v9) == 8)
    return 4;
  if (EKUIWindowSizeParadigmForWindowSize(width) == 0x2000)
    return 3;
  if (qword_1001F6548 != -1)
    dispatch_once(&qword_1001F6548, &stru_1001B5508);
  objc_msgSend((id)qword_1001F6540, "valueForSize:", width);
  return (unint64_t)v11;
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v12, "setSelectedOccurrence:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startCalendarDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewController pushedMonthViewControllerWithDate:animated:](self, "pushedMonthViewControllerWithDate:animated:", v13, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentChildViewController"));

    objc_opt_class(LargeMonthViewController);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      objc_msgSend(v15, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 1);
    objc_msgSend(v15, "showEvent:animated:showMode:context:", v10, v8, a5, v11);

  }
  else
  {
    v17 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Year View.", v18, 2u);
    }
  }

}

- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", x, y));
  if (!v5)
    goto LABEL_8;
  objc_opt_class(YearMultipleMonthView);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    goto LABEL_8;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v12, "convertPoint:fromView:", v13, x, y);
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startOfMonthForPoint:", v15, v17));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "monthViewForCalendarDate:", v18));
  if (!v19)
  {
LABEL_7:

LABEL_8:
    v30.receiver = self;
    v30.super_class = (Class)LargeYearViewController;
    -[YearViewController receivedTapAtLocation:usingDate:precise:](&v30, "receivedTapAtLocation:usingDate:precise:", v9, v5, x, y);
    goto LABEL_9;
  }
  v20 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  objc_msgSend(v20, "convertPoint:fromView:", v21, x, y);
  v23 = v22;
  v25 = v24;

  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendarDateForPoint:", v23, v25));
  if (!v26)
  {

    goto LABEL_7;
  }
  v27 = (void *)v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistedSceneState"));
  -[YearViewController pushContentViewOfType:date:animated:](self, "pushContentViewOfType:date:animated:", objc_msgSend(v29, "lastUsedNonYearView"), v27, 0);

LABEL_9:
}

- (double)leftBarButtonBlankFixedSpaceWidth
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double result;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  v5 = EKUICurrentWindowSizeParadigmForViewHierarchy(v3, v4);

  if (v5 <= 0x1FFFFFF)
  {
    if (v5 != 0x80000 && v5 != 0x800000)
      goto LABEL_10;
LABEL_8:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
    EKUILayoutMarginsForFullscreenLayoutRectWithSize(v11, v8, v10);
    v13 = v12;

    return -v13;
  }
  if (v5 == 0x2000000 || v5 == 0x20000000 || v5 == 0x8000000)
    goto LABEL_8;
LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(v15, v16) == 0x100000)
  {
LABEL_13:

    return -11.0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
  v19 = EKUICurrentWindowSizeParadigmForViewHierarchy(v17, v18);

  result = -11.0;
  if (v19 != 0x200000)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view", -11.0));
    if (EKUICurrentWindowSizeParadigmForViewHierarchy(v15, v20) == 0x4000)
      goto LABEL_13;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController view](self, "view"));
    v23 = EKUICurrentWindowSizeParadigmForViewHierarchy(v21, v22);

    result = -15.0;
    if (v23 == 0x2000)
      return -11.0;
  }
  return result;
}

- (void)updateNavigationBarDisplayedDateString
{
  -[LargeYearViewController _updateYearNumbersAnimated:withForce:](self, "_updateYearNumbersAnimated:withForce:", 0, 1);
}

- (void)updatePalette:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setWeekdayHeaderVisible:", 0);
  objc_msgSend(v4, "setDayScrubberController:", 0);
  objc_msgSend(v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  objc_msgSend(v4, "setTodayButtonVisible:", 1);
  objc_msgSend(v4, "setDateStringVisible:", 1);
  objc_msgSend(v4, "setDividerLineVisible:", 0);
  objc_msgSend(v4, "setFocusBannerPlacement:", 2);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  objc_msgSend(v7, "setPreferredHeight:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "_setBottomPalette:", v9);

}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (id)sceneTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController _currentlyViewingCalendarDate](self, "_currentlyViewingCalendarDate"));
  v4 = v3;
  if (!v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = CUIKStringForYear(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_6:

  return v7;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeYearViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 1, a3);
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeYearViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 0, a3);
}

- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));

  if (v5)
    v8 = 1;
  else
    v8 = -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateByAddingYears:", v8));
  -[YearViewController selectDate:animated:](self, "selectDate:animated:", v9, v4);

}

- (void)timeZoneDidChange
{
  -[LargeYearViewController _queueForcedUpdateToYearNumbers](self, "_queueForcedUpdateToYearNumbers");
}

- (void)localeDidChange
{
  -[LargeYearViewController _queueForcedUpdateToYearNumbers](self, "_queueForcedUpdateToYearNumbers");
}

- (void)_queueForcedUpdateToYearNumbers
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED068;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_currentlyViewingCalendarDate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentInset");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v5 + 72.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDate"));

  return v7;
}

- (void)_updateYearNumbersAnimated:(BOOL)a3 withForce:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  LargeYearViewController *v11;
  void *v12;
  EKCalendarDate *currentYearNumber;
  _QWORD v14[5];
  BOOL v15;

  v4 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[LargeYearViewController _currentlyViewingCalendarDate](self, "_currentlyViewingCalendarDate"));
  v8 = (void *)v7;
  if (v4
    || v7
    && ((currentYearNumber = self->_currentYearNumber) == 0
     || -[EKCalendarDate compare:](currentYearNumber, "compare:", v8)))
  {
    objc_storeStrong((id *)&self->_currentYearNumber, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topMainViewControllerContainer"));
    v11 = (LargeYearViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentChildViewController"));

    if (v11 == self)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewController navigationController](self, "navigationController"));
      objc_msgSend(v12, "setNavBarStringFromDate:includeMonth:includeYear:", v8, 0, 1);

    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000ED240;
    v14[3] = &unk_1001B5530;
    v14[4] = self;
    v15 = a3;
    -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentYearNumber, 0);
  objc_storeStrong((id *)&self->_activeDateDuringRotation, 0);
}

@end
