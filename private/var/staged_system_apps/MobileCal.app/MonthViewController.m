@implementation MonthViewController

- (MonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9;
  MonthViewController *v10;
  MonthViewController *v11;
  void *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MonthViewController;
  v10 = -[InfiniteScrollViewController initWithCalendarDate:model:window:](&v14, "initWithCalendarDate:model:window:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->super.super._model, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_significantTimeChangeOccurred:", CUIKCalendarModelSignificantTimeChangeNotification, v9);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "_calendarModelTimeZoneChanged:", CUIKCalendarModelTimeZoneChangedNotification, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "weekNumbersPrefChanged", CUIKPreferencesNotification_ShowWeekNumbers, 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "contentSizeCategoryChanged", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v11;
}

- (void)updateBackButtonToDate:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  EKCalendarDate *backButtonDate;
  int v17;
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "year");
  v6 = CUIKTodayComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "year");

  if (v5 == v8)
  {
    v9 = CUIKStringForMonthNumber(objc_msgSend(v4, "month"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v12 = CUIKShortStringForMonthYear();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  v13 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Setting back button title for Month view to: [%@]", (uint8_t *)&v17, 0xCu);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController parentViewController](self, "parentViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationItem"));
  objc_msgSend(v15, "setBackButtonTitle:", v10);
  backButtonDate = self->_backButtonDate;
  self->_backButtonDate = (EKCalendarDate *)v4;

}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[EKEventGestureController invalidate](self->_gestureController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  -[MainViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  MonthTitleView *v3;
  MonthTitleView *monthTitleView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController loadView](&v5, "loadView");
  v3 = objc_alloc_init(MonthTitleView);
  monthTitleView = self->_monthTitleView;
  self->_monthTitleView = v3;

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_selectedDateChanged:", CUIKCalendarModelSelectedDateChangedNotification, self->super.super._model);
  v6.receiver = self;
  v6.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController viewWillAppear:](&v6, "viewWillAppear:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  EKEventGestureController *v12;
  EKEventGestureController *gestureController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
  {

  }
  else
  {
    v6 = EKUIHasFallbackSizingContext();

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self, "navigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

      if (v9)
      {
        EKUIPushFallbackSizingContextWithViewHierarchy(v9);
        -[InfiniteScrollViewController showSelectedDateIfNeeded](self, "showSelectedDateIfNeeded");
        EKUIPopFallbackSizingContextWithViewHierarchy(v9);

        goto LABEL_7;
      }
    }
  }
  -[InfiniteScrollViewController showSelectedDateIfNeeded](self, "showSelectedDateIfNeeded");
LABEL_7:
  -[CUIKCalendarModel setDesiredPaddingDays:](self->super.super._model, "setDesiredPaddingDays:", 14);
  -[CUIKCalendarModel setComponentForExpandingPadding:](self->super.super._model, "setComponentForExpandingPadding:", 4096);
  if (!self->_gestureController)
  {
    v10 = objc_alloc((Class)EKEventGestureController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
    v12 = (EKEventGestureController *)objc_msgSend(v10, "initWithView:", v11);
    gestureController = self->_gestureController;
    self->_gestureController = v12;

    -[EKEventGestureController setUntimedDelegate:](self->_gestureController, "setUntimedDelegate:", self);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKCalendarModelSelectedDateChangedNotification, self->super.super._model);

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
  return v5 < 5;
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return objc_msgSend(a3, "calendarDateForMonth");
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController pastMajorBoundaryCalendarDateForCalendarDate:](self, "pastMajorBoundaryCalendarDateForCalendarDate:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingMonths:", 1));

  return v4;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingWeeks:", -1));
  v6 = objc_msgSend(v5, "month");
  if (v6 != objc_msgSend(v4, "month"))
  {
    v7 = objc_msgSend(v4, "dayOfWeek");
    if (v7 == (id)CUIKOneIndexedWeekStart())
    {
      if ((uint64_t)objc_msgSend(v4, "day") >= 2)
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForMonth"));
LABEL_8:

        v5 = (void *)v8;
      }
    }
    else
    {
      v9 = objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart());
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      objc_msgSend(v10, "absoluteTime");
      v12 = v11;
      objc_msgSend(v4, "absoluteTime");
      if (v12 >= v13)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[MonthViewController _slowComputeCalendarDateForWeekFromStartDate:weekOffset:](self, "_slowComputeCalendarDateForWeekFromStartDate:weekOffset:", v4, -1));
        v5 = v10;
        goto LABEL_8;
      }
      v5 = v10;
    }
  }

  return v5;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingWeeks:", 1));
  v6 = objc_msgSend(v5, "month");
  if (v6 != objc_msgSend(v4, "month"))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForMonth"));
    goto LABEL_5;
  }
  v7 = objc_msgSend(v5, "calendarDateForWeekWithWeekStart:", ((uint64_t (*)(void))CUIKOneIndexedWeekStart)());
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_msgSend(v8, "absoluteTime");
  v11 = v10;
  v12 = objc_msgSend(v4, "calendarDateForEndOfWeekWithWeekStart:", CUIKOneIndexedWeekStart(v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "absoluteTime");
  v15 = v14;

  if (v11 <= v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[MonthViewController _slowComputeCalendarDateForWeekFromStartDate:weekOffset:](self, "_slowComputeCalendarDateForWeekFromStartDate:weekOffset:", v4, 1));
    v5 = v8;
LABEL_5:

    v8 = (void *)v16;
  }

  return v8;
}

- (id)_slowComputeCalendarDateForWeekFromStartDate:(id)a3 weekOffset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendar"));
  v9 = objc_msgSend(v8, "copy");

  objc_msgSend(v9, "setFirstWeekday:", CUIKOneIndexedWeekStart(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 4096, a4, v11, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:", 8206, v12));
  objc_msgSend(v13, "setWeekday:", objc_msgSend(v9, "firstWeekday"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v13));
  v15 = objc_alloc((Class)EKCalendarDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "calendar"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeZone"));
  v19 = objc_msgSend(v15, "initWithDate:timeZone:", v14, v18);

  return v19;
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
  -[MonthViewController showDate:animated:toMonthStart:](self, "showDate:animated:toMonthStart:", v8, v4, 1);

}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = objc_msgSend(v2, "showMonthAsDivided") ^ 1;

  return v3;
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
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[InfiniteScrollViewController unobstructedScrollViewHeight](self, "unobstructedScrollViewHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v15);

  -[MonthViewController frameForTodayHighlight](self, "frameForTodayHighlight");
  v17.origin.x = v10;
  v17.origin.y = v11;
  v17.size.width = v12;
  v17.size.height = v13;
  v16.origin.x = 0.0;
  v16.origin.y = v7;
  v16.size.width = Width;
  v16.size.height = v4;
  return CGRectContainsRect(v16, v17);
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  -[MonthViewController showDate:animated:toMonthStart:](self, "showDate:animated:toMonthStart:", a3, a4, 1);
}

- (void)showDate:(id)a3 animated:(BOOL)a4 toMonthStart:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSMutableArray *v16;
  double v17;
  double v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  double v30;
  void *v31;
  id v32;
  double v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super._model, "calendar"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));

    v37 = (void *)v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController pastMajorBoundaryCalendarDateForCalendarDate:](self, "pastMajorBoundaryCalendarDateForCalendarDate:", v11));
    -[InfiniteScrollViewController unobstructedScrollViewHeight](self, "unobstructedScrollViewHeight");
    v14 = v13;
    v15 = v12;
    v16 = objc_opt_new(NSMutableArray);
    objc_msgSend(v15, "absoluteTime");
    v18 = v17;
    objc_msgSend(v11, "absoluteTime");
    v19 = v15;
    if (v18 <= v20)
    {
      v21 = v15;
      do
      {
        -[NSMutableArray addObject:](v16, "addObject:", v21);
        v19 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", v21));

        objc_msgSend(v19, "absoluteTime");
        v23 = v22;
        objc_msgSend(v11, "absoluteTime");
        v21 = v19;
      }
      while (v23 <= v24);
    }
    v38 = v8;
    v39 = v6;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](v16, "reverseObjectEnumerator", v15));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v42;
      v30 = -10.0;
LABEL_7:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v25);
        v32 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v31);

        -[InfiniteScrollViewController heightForSubviewWithCalendarDate:](self, "heightForSubviewWithCalendarDate:", v32);
        v30 = v30 + v33;
        if (v30 > v14)
          break;
        v19 = v32;

        v31 = (char *)v31 + 1;
        v28 = v19;
        if (v27 == v31)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          v28 = v19;
          if (v27)
            goto LABEL_7;
          goto LABEL_15;
        }
      }
    }
    else
    {
      v28 = 0;
LABEL_15:

      v32 = 0;
    }

    if (!v28)
    {
      v34 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to find best week for showing date: %@", buf, 0xCu);
      }
      v28 = v36;
    }
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "date"));

    v8 = (id)v35;
    v6 = v39;
  }
  v40.receiver = self;
  v40.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController showDate:animated:](&v40, "showDate:animated:", v8, v6);

}

- (id)bestDateForNewEvent
{
  uint64_t v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v20;
  void *v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[MonthViewController frameForTodayHighlight](self, "frameForTodayHighlight");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v26.origin.x = CGRectZero.origin.x;
  v26.origin.y = CGRectZero.origin.y;
  v26.size.width = CGRectZero.size.width;
  v26.size.height = CGRectZero.size.height;
  v9 = CGRectEqualToRect(v22, v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "contentInset");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v14 = CGRectGetHeight(v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v15, "contentInset");
  v17 = v16;

  if (v9)
    goto LABEL_4;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (CGRectGetMinY(v24) > v14 - v17
    || (v25.origin.x = x, v25.origin.y = y, v25.size.width = width, v25.size.height = height, CGRectGetMaxY(v25) < v12))
  {
LABEL_4:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewInBuffer](self, "dateOfCenterViewInBuffer"));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super.super._model, "eventStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timeZone"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v21));
  }

  return v18;
}

- (id)testingRotationWillStartNotificationName
{
  return CFSTR("MonthViewController_RotationAnimationStartedNotification");
}

- (id)testingRotationDidEndNotificationName
{
  return CFSTR("MonthViewController_RotationAnimationCompletedNotification");
}

- (id)sceneTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController bestDateForNewEvent](self, "bestDateForNewEvent"));
  v4 = v3;
  if (!v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super._model, "selectedDay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));

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
  v6 = CUIKStringForMonthYear(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_6:

  return v7;
}

- (void)willBeginDragging
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController willBeginDragging](&v3, "willBeginDragging");
  -[MonthViewController _updateMonthTitle](self, "_updateMonthTitle");
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  return 1.79769313e308;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  return 1.79769313e308;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  return 0.0;
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  void *v6;
  double v7;
  double v8;
  double y;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  double v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double Width;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  CGRect v41;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView", a3.x, a3.y));
  objc_msgSend(v6, "contentOffset");
  v8 = v7;

  y = a4->y;
  v10 = vabdd_f64(y, v8);
  -[MonthViewController decelerationDistanceThresholdForPreferringMonthBoundary](self, "decelerationDistanceThresholdForPreferringMonthBoundary");
  if (v10 > v11)
  {
    -[MonthViewController nearestMajorBoundaryForPoint:](self, "nearestMajorBoundaryForPoint:", a4->x, a4->y);
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
          v18 = (objc_class *)objc_opt_class(self);
          v19 = NSStringFromClass(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = NSStringFromPoint(*a4);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v37 = 138412546;
          v38 = v20;
          v39 = 2112;
          v40 = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Major boundary settling triggered in [%@].  Will settle on offset: [%@]", (uint8_t *)&v37, 0x16u);

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
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v23, "contentOffset");
    v10 = vabdd_f64(v15, v24);

  }
  if (self->_shouldShowMonthTitleHUDWhenScrolling)
  {
    -[MonthViewController decelerationDistanceThresholdForDisplayingMonthBanner](self, "decelerationDistanceThresholdForDisplayingMonthBanner");
    if (v10 > v25)
    {
      self->_monthTitleViewIsVisible = 1;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthTitleView superview](self->_monthTitleView, "superview"));

      if (!v26)
      {
        -[MonthTitleView frame](self->_monthTitleView, "frame");
        v28 = v27;
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v31, "safeAreaInsets");
        v33 = v32;

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
        objc_msgSend(v34, "bounds");
        Width = CGRectGetWidth(v41);

        -[MonthTitleView setFrame:](self->_monthTitleView, "setFrame:", v28, v33, Width, v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
        objc_msgSend(v36, "addSubview:", self->_monthTitleView);

      }
      -[MonthTitleView animateVisible:duration:completion:](self->_monthTitleView, "animateVisible:duration:completion:", 1, 0, 0.25);
    }
  }
}

- (void)didScroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController didScroll](&v3, "didScroll");
  -[MonthViewController _updateMonthTitle](self, "_updateMonthTitle");
}

- (void)didEndScrolling
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MonthViewController;
  -[InfiniteScrollViewController didEndScrolling](&v4, "didEndScrolling");
  -[MonthViewController _updateMonthTitle](self, "_updateMonthTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MonthViewController_ScrollDidEndAnimationNotification"), self, 0);

}

- (void)_selectedDateChanged:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));
  -[MonthViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", v5);

  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
}

- (void)_calendarModelTimeZoneChanged:(id)a3
{
  -[MonthViewController calendarModelTimeZoneChanged](self, "calendarModelTimeZoneChanged", a3);
}

- (void)contentSizeCategoryChanged
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache");
  -[MonthViewController _reloadAllViews](self, "_reloadAllViews");
}

- (void)_reloadAllViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewInBuffer](self, "dateOfCenterViewInBuffer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateInTimeZone:", v6));

  -[InfiniteScrollViewController reinitializeAllViewsWithCalendarDate:](self, "reinitializeAllViewsWithCalendarDate:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));

  -[MonthViewController updateBackButtonToDate:](self, "updateBackButtonToDate:", v8);
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v4, "updateBackButtonToDate:") & 1) != 0)
    objc_msgSend(v4, "updateBackButtonToDate:", v5);

}

- (id)monthTitleView
{
  return self->_monthTitleView;
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  objc_super v11;
  id obj;
  CGPoint result;

  v11.receiver = self;
  v11.super_class = (Class)MonthViewController;
  obj = 0;
  -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](&v11, "nearestMajorBoundaryForPoint:date:", &obj, a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = obj;
  self->_decelerationTargetY = v6;
  objc_storeStrong((id *)&self->_decelerationTargetDate, v8);
  v9 = v5;
  v10 = v7;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_updateMonthTitle
{
  double decelerationTargetY;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unsigned __int8 v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _BYTE *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  MonthTitleView *monthTitleView;
  uint64_t v28;
  id v29;
  BOOL v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];

  if (self->_shouldShowMonthTitleHUDWhenScrolling)
  {
    decelerationTargetY = self->_decelerationTargetY;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v4, "contentOffset");
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    if (objc_msgSend(v7, "isDragging"))
    {
      v8 = -[InfiniteScrollViewController isUserFingerDown](self, "isUserFingerDown");

      if ((v8 & 1) == 0 && self->_monthTitleViewIsVisible)
      {
        -[MonthViewController decelerationDistanceThresholdToStopShowingMonthBanner](self, "decelerationDistanceThresholdToStopShowingMonthBanner");
        if (vabdd_f64(decelerationTargetY, v6) > v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
          objc_msgSend(v10, "contentInset");
          v12 = v11;

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v12));
          if (!v13)
          {
LABEL_23:

            return;
          }
          v14 = decelerationTargetY - v6;
          v33 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
          objc_msgSend(v33, "convertPoint:fromView:", v15, 0.0, v12);
          v17 = v16;

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDate"));
          -[InfiniteScrollViewController showDateVerticalOffsetForDate:](self, "showDateVerticalOffsetForDate:", v18);
          v20 = v19;

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDate"));
          v22 = v21;
          if (v14 <= 0.0)
          {
            v28 = (uint64_t)objc_msgSend(v21, "day");
            v29 = objc_msgSend(v22, "month");
            v30 = v29 == -[EKCalendarDate month](self->_decelerationTargetDate, "month");
            v25 = v33;
            if (!v30 && (v28 < 8 || (unint64_t)(v28 - 8) <= 6 && v17 - v20 < 44.0))
            {
              v26 = -1;
              goto LABEL_21;
            }
          }
          else
          {
            v23 = objc_msgSend(v21, "daysInMonth");
            v24 = (unint64_t)(v23 - (_BYTE *)objc_msgSend(v22, "day")) >= 0xF;
            v25 = v33;
            if (!v24)
            {
              v26 = 1;
LABEL_21:
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDate"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "calendarDateByAddingMonths:", v26));

              goto LABEL_22;
            }
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDate"));
LABEL_22:
          -[MonthTitleView setCalendarDate:](self->_monthTitleView, "setCalendarDate:", v31);

          v13 = v33;
          goto LABEL_23;
        }
      }
    }
    else
    {

    }
    if (self->_monthTitleViewIsVisible)
    {
      self->_monthTitleViewIsVisible = 0;
      monthTitleView = self->_monthTitleView;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10002AEA0;
      v34[3] = &unk_1001B25D0;
      v34[4] = self;
      -[MonthTitleView animateVisible:duration:completion:](monthTitleView, "animateVisible:duration:completion:", 0, v34, 0.75);
    }
  }
}

- (id)adjustSelectedDateForNewMonth:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  v6 = CUIKTodayDate(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super._model, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v7, v9));

  v11 = objc_msgSend(v10, "month");
  if (v11 == objc_msgSend(v4, "month") && (v12 = objc_msgSend(v10, "year"), v12 == objc_msgSend(v4, "year")))
    v13 = v10;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForMonth"));
  v14 = v13;

  return v14;
}

- (id)dateAtPoint:(CGPoint)a3
{
  id v3;
  _QWORD v5[6];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10002B080;
  v11 = sub_10002B090;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002B098;
  v5[3] = &unk_1001B2730;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)updateDraggedOccurrenceView
{
  void *v3;
  EKEvent *draggedOccurrence;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  if (self->_draggedOccurrenceView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_draggedOccurrence, "startCalendarDate"));
    v23 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v3));

    if (objc_msgSend(v23, "conformsToProtocol:", &OBJC_PROTOCOL___InfiniteScrollViewSubview))
    {
      draggedOccurrence = self->_draggedOccurrence;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](draggedOccurrence, "startCalendarDate"));
      objc_msgSend(v23, "frameForOccurrence:onDay:", draggedOccurrence, v5);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      objc_msgSend(v14, "convertRect:fromView:", v23, v7, v9, v11, v13);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v16, v18, v20, v22);
      -[MonthViewOccurrence setNeedsDisplay](self->_draggedOccurrenceView, "setNeedsDisplay");
    }

  }
}

- (void)removeDraggingOccurrenceAnimated:(BOOL)a3
{
  MonthViewOccurrence *draggedOccurrenceView;
  EKEvent *draggedOccurrence;
  _QWORD v6[5];
  _QWORD v7[5];

  if (a3)
  {
    v6[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002B370;
    v7[3] = &unk_1001B2538;
    v7[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002B388;
    v6[3] = &unk_1001B25D0;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v6, 0.4);
  }
  else
  {
    -[MonthViewOccurrence removeFromSuperview](self->_draggedOccurrenceView, "removeFromSuperview");
    draggedOccurrenceView = self->_draggedOccurrenceView;
    self->_draggedOccurrenceView = 0;

    draggedOccurrence = self->_draggedOccurrence;
    self->_draggedOccurrence = 0;

  }
  -[EKEventGestureController endForcedStart](self->_gestureController, "endForcedStart");
}

- (id)pasteboardManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pasteboardManager"));

  return v3;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  BOOL v8;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextOccurrence"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "previousOccurrence"));
  v5 = v4;
  v6 = objc_msgSend(v4, "reminderOccurrenceType");
  if (v5)
    v7 = v6 == (id)1;
  else
    v7 = 1;
  v8 = !v7;

  return v8;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextOccurrence"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousOccurrence"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    -[MonthViewController selectDate:animated:](self, "selectDate:animated:", v9, 1);

    -[MainViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v8, 1, 0, 0);
  }

}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextOccurrence"));

  if (v5)
  {
    -[MonthViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[MainViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousOccurrence"));

  if (v5)
  {
    -[MonthViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[MainViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MonthViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

  -[MainViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v6, 1, 1, v8);
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[MonthViewController showEditorForNewDraggedEvent:inWeek:](self, "showEditorForNewDraggedEvent:inWeek:", a4, 0);
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[MainViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (MonthViewOccurrence)draggedOccurrenceView
{
  return self->_draggedOccurrenceView;
}

- (BOOL)dragAndDropAllowLongPress
{
  return 0;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)dragAndDropIsCurrentlyScrubbing
{
  return 0;
}

- (id)monthWeekSubviewForScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:"));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___MonthInfiniteScrollSubview))
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v9, "convertPoint:toView:", v8, x, y);
      a4->x = v10;
      a4->y = v11;

    }
    v12 = v8;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)scaleForDragging
{
  return 0;
}

- (CGRect)_startingFrameForEvent:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double width;
  double height;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", 0, x, y));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForDay"));

  -[EKCalendarDate absoluteTime](self->_draggedStartDate, "absoluteTime");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDate"));
  objc_msgSend(v13, "absoluteTime");
  v15 = v14;

  if (v12 < v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDate"));

    v10 = (void *)v16;
  }
  objc_msgSend(v8, "frameForOccurrence:onDay:", v7, v10);
  v17 = v40.origin.x;
  v18 = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  if (CGRectIsNull(v40))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v21));

    if (objc_msgSend(v22, "conformsToProtocol:", &OBJC_PROTOCOL___MonthInfiniteScrollSubview))
    {
      objc_msgSend(v22, "frameForOccurrence:onDay:", v7, v10);
      v17 = v23;
      v18 = v24;
      width = v25;
      height = v26;
    }

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v27, "convertRect:fromView:", v8, v17, v18, width, height);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v36 = v29;
  v37 = v31;
  v38 = v33;
  v39 = v35;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3
{
  void *v4;
  id v5;
  void *v6;
  EKCalendarDate *v7;
  EKCalendarDate *draggedStartDate;
  EKCalendarDate *v9;
  EKCalendarDate *v10;
  EKCalendarDate *draggedEndDate;
  EKCalendarDate *v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", a3.x, a3.y));
  v13 = v4;
  if (self->_draggingExistingEvent)
  {
    v5 = objc_msgSend(v4, "differenceInDays:", self->_initialDragDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_draggedOccurrence, "startCalendarDate"));
    v7 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateByAddingDays:", v5));
    draggedStartDate = self->_draggedStartDate;
    self->_draggedStartDate = v7;

    v9 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[EKEvent endCalendarDate](self->_draggedOccurrence, "endCalendarDate"));
    v10 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateByAddingDays:](v9, "calendarDateByAddingDays:", v5));
    draggedEndDate = self->_draggedEndDate;
    self->_draggedEndDate = v10;

  }
  else
  {
    objc_storeStrong((id *)&self->_draggedStartDate, v4);
    v12 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForEndOfDay"));
    v9 = self->_draggedEndDate;
    self->_draggedEndDate = v12;
  }

}

- (void)removeAllWeekHighlights
{
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B2770);
}

- (void)_updateWeekHighlightsForDragPoint:(CGPoint)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002BB30;
  v3[3] = &unk_1001B2798;
  v3[4] = self;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v3);
}

- (void)_animateDraggingOccurrenceToDate:(id)a3 atLastPosition:(BOOL)a4 dropPoint:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  _BOOL8 v8;
  void (**v10)(_QWORD);
  double v11;
  double v12;
  CGFloat width;
  CGFloat height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  _QWORD v33[9];
  CGRect v34;
  CGRect v35;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v10 = (void (**)(_QWORD))a6;
  -[MonthViewController _mainFrameForEvent:atLastPosition:atPoint:](self, "_mainFrameForEvent:atLastPosition:atPoint:", self->_draggedOccurrence, v8, x, y);
  v11 = v34.origin.x;
  v12 = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  if (CGRectIsNull(v34)
    || (v35.origin.x = v11, v35.origin.y = v12, v35.size.width = width, v35.size.height = height, CGRectIsEmpty(v35)))
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
    objc_msgSend(v15, "convertRect:fromView:", v24, v17, v19, v21, v23);
    v26 = v25;
    v28 = v27;

    v29 = (v12 - v28) * (v12 - v28) + (v11 - v26) * (v11 - v26);
    v30 = dbl_1001A13D0[sqrtf(v29) < 50.0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002BE54;
    v33[3] = &unk_1001B27C0;
    v33[4] = self;
    *(double *)&v33[5] = v11;
    *(double *)&v33[6] = v12;
    *(CGFloat *)&v33[7] = width;
    *(CGFloat *)&v33[8] = height;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002BF2C;
    v31[3] = &unk_1001B27E8;
    v32 = v10;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131076, v33, v31, v30, 0.0);

  }
}

- (CGRect)_mainFrameForEvent:(id)a3 atLastPosition:(BOOL)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v7;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  CGFloat height;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint v34;
  CGRect result;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v9 = a3;
  v10 = CGRectZero.origin.x;
  v11 = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v34 = CGPointZero;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v34, x, y));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateAtPoint:", v34));
    if (v16)
    {
      if (v7)
        objc_msgSend(v15, "frameForOccurrenceAfterLastOnDay:", v16);
      else
        objc_msgSend(v15, "frameForOccurrence:onDay:", v9, v16);
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v25, "convertRect:fromView:", v15, v21, v22, v23, v24);
      v10 = v26;
      v11 = v27;
      width = v28;
      height = v29;

    }
  }

  v30 = v10;
  v31 = v11;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_saveDraggedEventWithSpan:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  EKEvent *draggedOccurrence;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;

  if ((-[EKEvent isNew](self->_draggedOccurrence, "isNew") & 1) == 0)
  {
    if (a3
      && -[EKEvent isOrWasPartOfRecurringSeries](self->_draggedOccurrence, "isOrWasPartOfRecurringSeries"))
    {
      if (-[EKEvent isOrWasPartOfRecurringSeries](self->_draggedOccurrence, "isOrWasPartOfRecurringSeries"))v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent singleRecurrenceRule](self->_draggedOccurrence, "singleRecurrenceRule"));
      else
        v5 = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recurrenceEnd"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent committedValueForKey:](self->_draggedOccurrence, "committedValueForKey:", CFSTR("startDate")));
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v10 = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startDate](self->_draggedOccurrence, "startDate"));
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        v13 = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v13 - v10));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[EKRecurrenceEnd recurrenceEndWithEndDate:](EKRecurrenceEnd, "recurrenceEndWithEndDate:", v14));
        objc_msgSend(v5, "setRecurrenceEnd:", v15);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController EKUI_editor](self, "EKUI_editor"));
    draggedOccurrence = self->_draggedOccurrence;
    v21 = 0;
    v18 = objc_msgSend(v16, "saveEvent:span:error:", draggedOccurrence, a3, &v21);
    v19 = v21;

    if ((v18 & 1) == 0)
    {
      v20 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error moving event: %@", buf, 0xCu);
      }
    }

  }
}

- (void)_displayDongleForDraggedOccurrence
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 400.0, 50.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0);
  if ((-[EKEvent isNew](self->_draggedOccurrence, "isNew") & 1) != 0)
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("New Event"), &stru_1001B67C0, 0));
    objc_msgSend(v3, "setText:", v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent title](self->_draggedOccurrence, "title"));
    objc_msgSend(v3, "setText:", v9);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0));
  objc_msgSend(v3, "setFont:", v12);

  objc_msgSend(v3, "setTextAlignment:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v3, "setShadowColor:", v13);

  objc_msgSend(v3, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(v3, "setShadowBlur:", 2.0);
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  v15 = v14;
  v17 = v16;
  -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
  v39.origin.x = (v18 - v15) * 0.5;
  v39.origin.y = -50.0;
  v39.size.width = v15;
  v39.size.height = v17;
  v40 = CGRectInset(v39, -8.0, -8.0);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  -[MonthViewOccurrence bounds](self->_draggedOccurrenceView, "bounds");
  objc_msgSend(v3, "setFrame:", x);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v23, "setCornerRadius:", 8.0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v24, "setMaskedCorners:", 15);

  objc_msgSend(v3, "setClipsToBounds:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent eventStore](self->_draggedOccurrence, "eventStore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](self->_draggedOccurrence, "calendar"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorForCalendar:", v26));

  v28 = CUIKColorLightenedToPercentageWithFinalAlpha(v27, 0.8, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v3, "setBackgroundColor:", v29);

  -[MonthViewOccurrence addSubview:](self->_draggedOccurrenceView, "addSubview:", v3);
  -[MonthViewOccurrence setClipsToBounds:](self->_draggedOccurrenceView, "setClipsToBounds:", 0);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002C66C;
  v33[3] = &unk_1001B27C0;
  v34 = v3;
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002C67C;
  v31[3] = &unk_1001B25D0;
  v32 = v34;
  v30 = v34;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, v31, 0.2);

}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  if (-[MonthViewController dragAndDropAllowLongPress](self, "dragAndDropAllowLongPress"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](self->super.super._model, "defaultCalendarForNewEvents"));
    if (v5)
      v6 = objc_msgSend(v4, "dragGestureInProgress") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)eventGestureController:(id)a3 eventToStartInteractionWithAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  if (-[MonthViewController dragAndDropIsCurrentlyScrubbing](self, "dragAndDropIsCurrentlyScrubbing", a3))
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super.super._model, "eventStore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v8));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](self->super.super._model, "defaultCalendarForNewEvents"));
      objc_msgSend(v7, "setCalendar:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
      if (v11)
      {
        objc_msgSend(v7, "setStartDate:", v11);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v7, "setStartDate:", v12);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", 1.0));
      objc_msgSend(v7, "setEndDate:", v14);

      objc_msgSend(v7, "setAllDay:", 1);
    }
  }
  return v7;
}

- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  EKCalendarDate *v14;
  EKCalendarDate *initialDragDate;
  void *v16;
  EKCalendarDate *v17;
  EKCalendarDate *v18;
  void *v19;
  unsigned int v20;
  BOOL *p_draggingExistingEvent;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  EKEvent **p_draggedOccurrence;
  MonthViewOccurrence *v29;
  MonthViewOccurrence *draggedOccurrenceView;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGPoint *p_dragOffset;
  CGFloat v41;
  CGFloat v42;
  EKCalendarDate *v43;
  EKEvent *v44;
  CGFloat v45;
  CGFloat Height;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  MonthViewOccurrence *v60;
  _QWORD v62[7];
  _QWORD v63[5];
  CGPoint v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  y = a4.y;
  x = a4.x;
  v10 = a5;
  if (!-[MonthViewController dragAndDropIsCurrentlyScrubbing](self, "dragAndDropIsCurrentlyScrubbing"))
  {
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startCalendarDate"));
      v14 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForDay"));
      initialDragDate = self->_initialDragDate;
      self->_initialDragDate = v14;

      v16 = v10;
    }
    else
    {
      v17 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y));
      v18 = self->_initialDragDate;
      self->_initialDragDate = v17;

      if (a6)
        v16 = 0;
      else
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y));
    }
    v64 = CGPointZero;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v64, x, y));
    if (v16)
    {
      v20 = objc_msgSend(v16, "isNew");
      p_draggingExistingEvent = &self->_draggingExistingEvent;
      self->_draggingExistingEvent = v20 ^ 1;
      if (((v20 ^ 1) & 1) != 0)
      {
        v12 = v16;
        goto LABEL_16;
      }
    }
    else
    {
      p_draggingExistingEvent = &self->_draggingExistingEvent;
      self->_draggingExistingEvent = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super.super._model, "eventStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v22));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](self->super.super._model, "defaultCalendarForNewEvents"));
    objc_msgSend(v12, "setCalendar:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_initialDragDate, "date"));
    if (v24)
    {
      objc_msgSend(v12, "setStartDate:", v24);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v12, "setStartDate:", v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateByAddingTimeInterval:", 1.0));
    objc_msgSend(v12, "setEndDate:", v27);

    objc_msgSend(v12, "setAllDay:", 1);
    objc_msgSend(v12, "setTitle:", &stru_1001B67C0);
LABEL_16:
    p_draggedOccurrence = &self->_draggedOccurrence;
    objc_storeStrong((id *)&self->_draggedOccurrence, v12);
    v29 = (MonthViewOccurrence *)objc_msgSend(v19, "newFeedbackViewForDraggingOccurrence:atPoint:", v12, v64);
    draggedOccurrenceView = self->_draggedOccurrenceView;
    self->_draggedOccurrenceView = v29;

    if (self->_draggedOccurrenceView)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      objc_msgSend(v31, "addSubview:", self->_draggedOccurrenceView);

      if (!*p_draggingExistingEvent)
      {
        -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
        v45 = CGRectGetWidth(v66) * -0.5;
        -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
        Height = CGRectGetHeight(v67);
        self->_dragOffset.x = v45;
        self->_dragOffset.y = Height * -0.5;
        -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
        v48 = v47;
        v50 = v49;
        v51 = x + self->_dragOffset.x;
        v52 = y + self->_dragOffset.y;
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v53, "convertRect:fromView:", v54, v51, v52, v48, v50);
        -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");

        goto LABEL_27;
      }
      -[MonthViewController _startingFrameForEvent:atPoint:](self, "_startingFrameForEvent:atPoint:", v12, x, y);
      v36 = v32;
      v37 = v33;
      v38 = v34;
      v39 = v35;
      p_dragOffset = &self->_dragOffset;
      if (v10)
      {
        v41 = CGRectGetWidth(*(CGRect *)&v32) * -0.5;
        v65.origin.x = v36;
        v65.origin.y = v37;
        v65.size.width = v38;
        v65.size.height = v39;
        v42 = CGRectGetHeight(v65) * -0.5;
        p_dragOffset->x = v41;
        self->_dragOffset.y = v42;
        v36 = x + v41;
        v37 = y + v42;
      }
      else
      {
        v55 = CGRectGetMinX(*(CGRect *)&v32) - x;
        v68.origin.x = v36;
        v68.origin.y = v37;
        v68.size.width = v38;
        v68.size.height = v39;
        v56 = CGRectGetMinY(v68) - y;
        p_dragOffset->x = v55;
        self->_dragOffset.y = v56;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v57, "convertRect:fromView:", v58, v36, v37, v38, v39);
      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");

      if (-[MonthViewController scaleForDragging](self, "scaleForDragging"))
      {
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10002CEFC;
        v63[3] = &unk_1001B2538;
        v63[4] = self;
        v59 = objc_retainBlock(v63);
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v59, 0, 0.2, 0.0);

      }
      else
      {
        -[MonthViewOccurrence setAlpha:](self->_draggedOccurrenceView, "setAlpha:", 0.8);
      }
      if ((objc_msgSend(v12, "isEditable") & 1) != 0)
      {
LABEL_27:
        -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
        -[MonthViewController _updateWeekHighlightsForDragPoint:](self, "_updateWeekHighlightsForDragPoint:", x, y);
        if (v10)
          CalPopViewIn(self->_draggedOccurrenceView, 0);
        v11 = v12;
        goto LABEL_32;
      }
      v60 = self->_draggedOccurrenceView;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10002D078;
      v62[3] = &unk_1001B2810;
      v62[4] = self;
      *(double *)&v62[5] = x;
      *(double *)&v62[6] = y;
      CalPlopViewWithScaleFactorAndCompletion(v60, v62, 1.14999998);
      -[MonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0);
    }
    else
    {
      v43 = self->_initialDragDate;
      self->_initialDragDate = 0;

      v44 = *p_draggedOccurrence;
      *p_draggedOccurrence = 0;

    }
    v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
  v11 = 0;
  v12 = v10;
LABEL_33:

  return v11;
}

- (id)eventGestureControllerGetCurrentDraggingView:(id)a3
{
  return self->_draggedOccurrenceView;
}

- (void)eventGestureControllerRequestsUpdateOfDraggingView:(id)a3
{
  -[MonthViewOccurrence updateView](self->_draggedOccurrenceView, "updateView", a3);
}

- (void)eventGestureController:(id)a3 updateToPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
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
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v32[7];

  y = a4.y;
  x = a4.x;
  if (-[MonthViewController dragAndDropIsCurrentlyScrubbing](self, "dragAndDropIsCurrentlyScrubbing", a3))
  {
    -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
  }
  else
  {
    if (-[MonthViewController scaleForDragging](self, "scaleForDragging"))
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002D2D8;
      v32[3] = &unk_1001B2810;
      v32[4] = self;
      *(double *)&v32[5] = x;
      *(double *)&v32[6] = y;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v32, 0, 0.2, 0.0);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
      v18 = v17;
      v20 = v19;

      v21 = x + self->_dragOffset.x;
      v22 = y + self->_dragOffset.y;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      v24 = CalRoundRectToScreenScale(v21, v22, v18, v20);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v23, "convertRect:fromView:", v31, v24, v26, v28, v30);
      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");

    }
    -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
    -[MonthViewController _updateWeekHighlightsForDragPoint:](self, "_updateWeekHighlightsForDragPoint:", x, y);
  }
}

- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  EKCalendarDate *draggedEndDate;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  EKEvent *draggedOccurrence;
  void ***v30;
  MonthViewController *v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void **v61;
  uint64_t v62;
  id (*v63)(uint64_t);
  void *v64;
  MonthViewController *v65;
  _QWORD v66[5];
  _QWORD v67[9];
  _QWORD v68[5];
  id v69;
  double v70;
  double v71;
  CGPoint v72;
  _QWORD v73[5];
  uint8_t buf[16];
  CGPoint v75;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v8)
  {
    v75 = CGPointZero;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v75, x, y));
    if (-[MonthViewController dragAndDropIsCurrentlyScrubbing](self, "dragAndDropIsCurrentlyScrubbing"))
    {
      -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedOccurrence"));

      if (!v11)
      {
        -[MonthViewController dismissDraggedOccurrencePresentationAnimated:](self, "dismissDraggedOccurrencePresentationAnimated:", 1);
        goto LABEL_17;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedOccurrence"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y));
      -[MonthViewController showDetailsForDraggedOccurrence:inWeekView:onDay:creationMethod:](self, "showDetailsForDraggedOccurrence:inWeekView:onDay:creationMethod:", v13, v9, v14, 1);

      goto LABEL_5;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateAtPoint:", v75));
    if (v15 && self->_draggedStartDate)
    {
      draggedEndDate = self->_draggedEndDate;

      if (draggedEndDate)
      {
        -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_draggedStartDate, "date"));
        -[EKEvent setStartDate:](self->_draggedOccurrence, "setStartDate:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_draggedEndDate, "date"));
        -[EKEvent setEndDate:](self->_draggedOccurrence, "setEndDate:", v18);

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        if (objc_msgSend(v12, "optionKeyIsDown"))
        {
          v19 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "duplicating event(s) in large month view because option key is down", buf, 2u);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pasteboardManager"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startDate](self->_draggedOccurrence, "startDate"));
          objc_msgSend(v21, "setDateForPaste:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pasteboardManager"));
          objc_msgSend(v24, "setCalendarForPaste:", 0);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pasteboardManager"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_draggedOccurrence));
          objc_msgSend(v26, "duplicateEvents:withDateMode:delegate:", v27, 2, self);

          -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 0);
          -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
          -[MonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0);
          goto LABEL_6;
        }
        if ((-[EKEvent hasChanges](self->_draggedOccurrence, "hasChanges") & 1) != 0)
        {
          if (-[EKEvent isNew](self->_draggedOccurrence, "isNew"))
            v28 = CFSTR("userTappedAndHeldToCreateEvent");
          else
            v28 = CFSTR("userDraggedEvent");
          CalAnalyticsSendEvent(v28, &off_1001BC910);
          if (self->_draggingExistingEvent
            && -[EKEvent isOrWasPartOfRecurringSeries](self->_draggedOccurrence, "isOrWasPartOfRecurringSeries"))
          {
            draggedOccurrence = self->_draggedOccurrence;
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_10002DBA4;
            v68[3] = &unk_1001B2860;
            v68[4] = self;
            v70 = x;
            v71 = y;
            v69 = v9;
            v72 = v75;
            objc_msgSend(v7, "promptUserForRecurrenceActionOnOccurrence:whenFinished:", draggedOccurrence, v68);

            goto LABEL_6;
          }
          -[MonthViewController _saveDraggedEventWithSpan:](self, "_saveDraggedEventWithSpan:", 0);
          v34 = -[EKEvent isNew](self->_draggedOccurrence, "isNew");
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateAtPoint:", v75));
          if (v34)
          {
            objc_msgSend(v9, "frameForOccurrenceAfterLastOnDay:", v13);
            v36 = v35;
            v38 = v37;
            v40 = v39;
            v42 = v41;
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
            objc_msgSend(v43, "convertRect:fromView:", v9, v36, v38, v40, v42);
            v45 = v44;
            v47 = v46;
            v49 = v48;
            v51 = v50;

            -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
            v53 = v52;
            v55 = v54;
            v57 = v56;
            v59 = v58;
            -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v45, v47, v49, v51);
            -[MonthViewOccurrence setNeedsDisplay](self->_draggedOccurrenceView, "setNeedsDisplay");
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewOccurrence layer](self->_draggedOccurrenceView, "layer"));
            objc_msgSend(v60, "displayIfNeeded");

            -[MonthViewOccurrence setClipsToBounds:](self->_draggedOccurrenceView, "setClipsToBounds:", 1);
            -[MonthViewOccurrence setContentMode:](self->_draggedOccurrenceView, "setContentMode:", 0);
            -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v53, v55, v57, v59);
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_10002DCDC;
            v67[3] = &unk_1001B27C0;
            v67[4] = self;
            *(double *)&v67[5] = v45;
            *(double *)&v67[6] = v47;
            *(double *)&v67[7] = v49;
            *(double *)&v67[8] = v51;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_10002DCFC;
            v66[3] = &unk_1001B25D0;
            v66[4] = self;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v67, v66, 0.4, 0.0);
            -[MonthViewController showEditorForNewDraggedEvent:inWeek:](self, "showEditorForNewDraggedEvent:inWeek:", self->_draggedOccurrence, v9);
LABEL_5:

LABEL_6:
LABEL_17:

            goto LABEL_18;
          }
          v61 = _NSConcreteStackBlock;
          v62 = 3221225472;
          v63 = sub_10002DD38;
          v64 = &unk_1001B2538;
          v65 = self;
          v30 = &v61;
          v31 = self;
          v32 = v13;
          v33 = 1;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateAtPoint:", v75));
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_10002DB68;
          v73[3] = &unk_1001B2538;
          v73[4] = self;
          v30 = (void ***)v73;
          v31 = self;
          v32 = v13;
          v33 = 0;
        }
        -[MonthViewController _animateDraggingOccurrenceToDate:atLastPosition:dropPoint:completion:](v31, "_animateDraggingOccurrenceToDate:atLastPosition:dropPoint:completion:", v32, v33, v30, x, y, v61, v62, v63, v64, v65);
        goto LABEL_5;
      }
    }
    else
    {

    }
    -[MonthViewController draggedOccurrenceWasCancelled:atPoint:](self, "draggedOccurrenceWasCancelled:atPoint:", self->_draggedOccurrence, x, y);
    -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1);
    -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
    goto LABEL_17;
  }
LABEL_18:

}

- (CGRect)eventGestureController:(id)a3 finalFrameAfterCommitAtPoint:(CGPoint)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[MonthViewController _mainFrameForEvent:atLastPosition:atPoint:](self, "_mainFrameForEvent:atLastPosition:atPoint:", self->_draggedOccurrence, 0, a4.x, a4.y);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)eventGestureControllerCancelled:(id)a3
{
  -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1);
  -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
}

- (void)eventGestureControllerScrollTimerFired:(id)a3
{
  void *v4;
  double MaxY;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double MinY;
  void *v15;
  double v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (self->_draggedOccurrence)
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController existingPalette](self, "existingPalette", a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superview"));
    objc_msgSend(v30, "frame");
    MaxY = CGRectGetMaxY(v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
    objc_msgSend(v4, "convertPoint:toView:", v6, 0.0, MaxY);
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolbar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self, "navigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toolbar"));
    objc_msgSend(v13, "frame");
    MinY = CGRectGetMinY(v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
    objc_msgSend(v11, "convertPoint:toView:", v15, 0.0, MinY);
    v17 = v16;

    -[MonthViewOccurrence frame](self->_draggedOccurrenceView, "frame");
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    if (CGRectGetMinY(v33) >= v8 + 15.0)
    {
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      if (CGRectGetMaxY(v35) <= v17 + -15.0)
      {
LABEL_10:

        return;
      }
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v22 = CGRectGetMaxY(v36) - (v17 + -15.0);
    }
    else
    {
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v22 = CGRectGetMinY(v34) - v8 + -15.0;
    }
    if (v22 != 0.0)
    {
      if (CGFloatIsValid(v22))
      {
        v23 = v22 * 0.25;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v24, "contentOffset");
        v26 = v25;
        v28 = v27;

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v29, "setContentOffset:", v26, v23 + v28);

      }
    }
    goto LABEL_10;
  }
}

- (void)eventGestureController:(id)a3 setDraggingViewHidden:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[MonthViewOccurrence setHidden:](self->_draggedOccurrenceView, "setHidden:", a4);
  if (v4)
    -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  -[MonthViewController dragAndDropRequestsPresentationOfViewController:](self, "dragAndDropRequestsPresentationOfViewController:", a4);
}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
  id v5;

  v5 = a4;
  -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 0);
  -[MainViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, 0);

}

- (void)eventGestureController:(id)a3 requestedCancellationAnimationAtPoint:(CGPoint)a4 withOccurrence:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  MonthViewController *v27;
  id v28;
  CGPoint v29;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));

  if (!v9)
  {
    if (!v8)
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y));
    v29 = CGPointZero;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v29, x, y));
    v11 = objc_msgSend(v10, "newFeedbackViewForDraggingOccurrence:atPoint:", v8, v29);
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      objc_msgSend(v12, "addSubview:", v11);

      -[MonthViewController _startingFrameForEvent:atPoint:](self, "_startingFrameForEvent:atPoint:", v8, x, y);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v21, "convertRect:fromView:", v22, v14, v16, v18, v20);
      objc_msgSend(v11, "setFrame:");

      objc_msgSend(v11, "setAlpha:", 0.8);
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_10002E294;
      v26 = &unk_1001B26A0;
      v27 = self;
      v28 = v11;
      CalPlopViewWithScaleFactorAndCompletion(v28, &v23, 1.14999998);
      -[MonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0, v23, v24, v25, v26, v27);

    }
  }

}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (BOOL)shouldShowMonthTitleHUDWhenScrolling
{
  return self->_shouldShowMonthTitleHUDWhenScrolling;
}

- (void)setShouldShowMonthTitleHUDWhenScrolling:(BOOL)a3
{
  self->_shouldShowMonthTitleHUDWhenScrolling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFont, 0);
  objc_storeStrong((id *)&self->_draggedOccurrenceView, 0);
  objc_storeStrong((id *)&self->_draggedOccurrence, 0);
  objc_storeStrong((id *)&self->_draggedEndDate, 0);
  objc_storeStrong((id *)&self->_draggedStartDate, 0);
  objc_storeStrong((id *)&self->_initialDragDate, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_monthTitleView, 0);
  objc_storeStrong((id *)&self->_decelerationTargetDate, 0);
  objc_storeStrong((id *)&self->_backButtonDate, 0);
}

- (int64_t)intendedSizeClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

- (CGRect)frameForWeekContainingDate:(id)a3
{
  uint64_t v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)frameForTodayHighlight
{
  uint64_t v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)cellFramesForWeekContainingDate:(id)a3
{
  uint64_t v3;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  return 0;
}

@end
