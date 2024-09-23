@implementation DayViewController

- (double)dayViewControllerPersistedHourScalePreference:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState", a3));

  if (!v4)
    return -1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
  objc_msgSend(v5, "dayViewHourScale");
  v7 = v6;

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSString *previousNavigationTitle;
  void *v6;
  unsigned int v7;
  objc_super v8;

  v3 = a3;
  previousNavigationTitle = self->_previousNavigationTitle;
  self->_previousNavigationTitle = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  v7 = objc_msgSend(v6, "extendedLaunchFinished");

  if (v7)
  {
    -[CUIKCalendarModel setDesiredPaddingDays:](self->super._model, "setDesiredPaddingDays:", 1);
    -[CUIKCalendarModel setComponentForExpandingPadding:](self->super._model, "setComponentForExpandingPadding:", 16);
  }
  v8.receiver = self;
  v8.super_class = (Class)DayViewController;
  -[MainViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
}

- (void)extendedLaunchCompletedByViewType:(int)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DayViewController;
  -[MainViewController extendedLaunchCompletedByViewType:](&v6, "extendedLaunchCompletedByViewType:", *(_QWORD *)&a3);
  v4 = dispatch_time(0, 300000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100115B10;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)savedFirstVisibleSecond
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;

  if (!EKUIShouldSaveStateInPreferences(self))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistedSceneState"));

    if (v9)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistedSceneState"));
      v7 = objc_msgSend(v6, "dayViewFirstVisibleSecond");
      goto LABEL_6;
    }
    return -1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dayViewFirstVisibleSecond"));

  if (!v4)
    return -1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dayViewFirstVisibleSecond"));
  v7 = objc_msgSend(v6, "intValue");
LABEL_6:
  v10 = v7;

  return v10;
}

- (void)_receivedSelectedDateChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_day, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateForEndOfDay](self->_day, "calendarDateForEndOfDay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
    objc_msgSend(v9, "setPreferredReloadStartDate:endDate:", v6, v8);

  }
}

- (void)dayViewController:(id)a3 requestsSaveFirstVisibleSecondPreference:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = objc_msgSend(v7, "activationState");

  if (!v8)
    -[DayViewController saveFirstVisibleSecond:](self, "saveFirstVisibleSecond:", v4);
}

- (DayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5
{
  id v8;
  DayViewController *v9;
  DayViewController *v10;
  uint64_t v11;
  EKCalendarDate *day;
  void *v13;
  void *v14;
  void *v15;
  CUIKCalendarModel *model;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DayViewController;
  v9 = -[MainViewController initWithWindow:model:](&v21, "initWithWindow:model:", a5, a4);
  v10 = v9;
  if (v9)
  {
    -[DayViewController setEdgesForExtendedLayout:](v9, "setEdgesForExtendedLayout:", 0);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForDay"));
    day = v10->_day;
    v10->_day = (EKCalendarDate *)v11;

    v10->_hasReloadedWithData = 0;
    v10->_hasEndedExtendedLaunch = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, "_occurrencesChanged:", CUIKCalendarModelDisplayedOccurrencesChangedNotification, v10->super._model);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, v10->super._model);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    model = v10->super._model;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](v10->_day, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateForEndOfDay](v10->_day, "calendarDateForEndOfDay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "date"));
    -[CUIKCalendarModel setPreferredReloadStartDate:endDate:](model, "setPreferredReloadStartDate:endDate:", v17, v19);

  }
  return v10;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  EKDayViewController *dayViewController;
  double v12;
  void *v13;
  objc_super v14;

  if (!self->_hasSetUpDayViewInitialLayout)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy();

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController view](self->_dayViewController, "view"));
    objc_msgSend(v4, "setAutoresizingMask:", 18);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v10 = v9;

    dayViewController = self->_dayViewController;
    -[EKDayViewController gutterWidth](dayViewController, "gutterWidth");
    -[EKDayViewController setFrame:gutterWidth:](dayViewController, "setFrame:gutterWidth:", 0.0, 0.0, v7, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v13);

    self->_hasSetUpDayViewInitialLayout = 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)DayViewController;
  -[DayViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *previousNavigationTitle;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  DayNavigationViewController *scrubberControllerNeue;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)DayViewController;
  -[DayViewController viewWillAppear:](&v27, "viewWillAppear:", a3);
  if (!self->_viewHasDoneFirstAppearance)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_significantTimeChanged:", CUIKCalendarModelSignificantTimeChangeNotification, self->super._model);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_receivedSelectedDateChangeNotification:", CUIKCalendarModelSelectedDateChangedNotification, self->super._model);
    self->_viewHasDoneFirstAppearance = 1;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationItem](self, "navigationItem"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  previousNavigationTitle = self->_previousNavigationTitle;
  self->_previousNavigationTitle = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setTitle:", &stru_1001B67C0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy();

  v10 = -[EKDayViewController view](self->_dayViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController displayDate](self->_dayViewController, "displayDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v12, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super._model, "selectedDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "date"));
  v20 = objc_msgSend(v16, "isDate:inSameDayAsDate:", v17, v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedDate"));
    -[DayViewController selectDate:animated:](self, "selectDate:animated:", v22, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectedDate"));

    v15 = (void *)v24;
  }
  scrubberControllerNeue = self->_scrubberControllerNeue;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
  -[DayNavigationViewController setSelectedDate:animated:](scrubberControllerNeue, "setSelectedDate:animated:", v26, 0);

}

- (CGSize)cellSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self->_scrubberControllerNeue, "weekScrollView"));
  objc_msgSend(v2, "cellSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updatePalette:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setWeekdayHeaderVisible:", 1);
  objc_msgSend(v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
  objc_msgSend(v4, "setDayScrubberController:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(v4, "setUseCustomDayFrames:", 0);
  objc_msgSend(v4, "setFocusBannerPlacement:", 1);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));

  objc_msgSend(v8, "setPreferredHeight:", v7);
}

- (id)dayScrubberController
{
  return self->_scrubberControllerNeue;
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_shouldRespondToApplicationDidBecomeActiveStateChange = a3;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  -[DayViewController selectDate:andTime:animated:](self, "selectDate:andTime:animated:", a3, 0, a4);
}

- (void)dayViewDidChangeSelectedDate:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  EKCalendarDate *v7;
  EKCalendarDate *day;
  id v9;

  model = self->super._model;
  v5 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
  v7 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v6));

  day = self->_day;
  self->_day = v7;

}

- (void)_showNowWhenSameDaySelected
{
  -[DayViewController showNowAnimated:](self, "showNowAnimated:", -[DayViewController shouldRespondToApplicationDidBecomeActiveStateChange](self, "shouldRespondToApplicationDidBecomeActiveStateChange") ^ 1);
  if (-[DayViewController shouldRespondToApplicationDidBecomeActiveStateChange](self, "shouldRespondToApplicationDidBecomeActiveStateChange"))
  {
    -[DayViewController setShouldRespondToApplicationDidBecomeActiveStateChange:](self, "setShouldRespondToApplicationDidBecomeActiveStateChange:", 0);
  }
}

- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange
{
  return self->_shouldRespondToApplicationDidBecomeActiveStateChange;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  EKEventCreationGestureController *v9;
  EKEventCreationGestureController *eventCreationGestureController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DayViewController;
  -[DayViewController viewDidLoad](&v15, "viewDidLoad");
  -[DayViewController selectDate:animated:](self, "selectDate:animated:", self->_day, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_sceneEnteredForeground:", UISceneWillEnterForegroundNotification, 0);
  v4 = -[DayViewController savedFirstVisibleSecond](self, "savedFirstVisibleSecond");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v5, "setStartingFirstVisibleSecond:", v4);

  v6 = objc_alloc((Class)EKEventCreationGestureController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (EKEventCreationGestureController *)objc_msgSend(v6, "initWithView:delegate:", v8, self);
  eventCreationGestureController = self->_eventCreationGestureController;
  self->_eventCreationGestureController = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPushFallbackSizingContextWithViewHierarchy(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController view](self->_dayViewController, "view"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  EKUIPopFallbackSizingContextWithViewHierarchy(v14);

}

- (void)showNowAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v4, "scrollToNow:", v3);

}

- (id)dayView
{
  return self->_dayViewController;
}

- (void)loadView
{
  void *v3;
  DayNavigationViewController *v4;
  DayNavigationViewController *scrubberControllerNeue;
  void *v6;
  EKDayViewController *v7;
  EKDayViewController *dayViewController;
  void *v9;
  id v10;

  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v10, "setBackgroundColor:", v3);

  v4 = -[DayNavigationViewController initWithModel:]([DayNavigationViewController alloc], "initWithModel:", self->super._model);
  scrubberControllerNeue = self->_scrubberControllerNeue;
  self->_scrubberControllerNeue = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController cellFactory](self, "cellFactory"));
  -[DayNavigationViewController setCellFactory:](self->_scrubberControllerNeue, "setCellFactory:", v6);

  -[DayNavigationViewController setDelegate:](self->_scrubberControllerNeue, "setDelegate:", self);
  -[DayViewController addChildViewController:](self, "addChildViewController:", self->_scrubberControllerNeue);
  -[DayNavigationViewController didMoveToParentViewController:](self->_scrubberControllerNeue, "didMoveToParentViewController:", self);
  v7 = (EKDayViewController *)objc_msgSend(objc_alloc((Class)EKDayViewController), "initWithTargetSizeClass:", -[DayViewController intendedSizeClass](self, "intendedSizeClass"));
  dayViewController = self->_dayViewController;
  self->_dayViewController = v7;

  -[EKDayViewController setShouldLogVisibleEvents:](self->_dayViewController, "setShouldLogVisibleEvents:", 1);
  -[EKDayViewController setShouldAutoscrollAfterAppearance:](self->_dayViewController, "setShouldAutoscrollAfterAppearance:", 0);
  -[EKDayViewController setDataSource:](self->_dayViewController, "setDataSource:", self);
  -[EKDayViewController setDelegate:](self->_dayViewController, "setDelegate:", self);
  -[EKDayViewController setShowsBanner:](self->_dayViewController, "setShowsBanner:", 0);
  -[EKDayViewController setAlwaysAnimate:](self->_dayViewController, "setAlwaysAnimate:", 1);
  -[EKDayViewController setDisableNotifyDateChangeDuringTracking:](self->_dayViewController, "setDisableNotifyDateChangeDuringTracking:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  -[EKDayViewController setPreloadExtraDays:](self->_dayViewController, "setPreloadExtraDays:", objc_msgSend(v9, "extendedLaunchFinished"));

  -[EKDayViewController setShowWeekdayLabel:](self->_dayViewController, "setShowWeekdayLabel:", -[DayViewController showWeekdayLabel](self, "showWeekdayLabel"));
  -[DayViewController addChildViewController:](self, "addChildViewController:", self->_dayViewController);
  -[EKDayViewController didMoveToParentViewController:](self->_dayViewController, "didMoveToParentViewController:", self);
  -[DayViewController setView:](self, "setView:", v10);

}

- (void)_occurrencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  EKDayViewController *dayViewController;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedFilteredAllKey));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedGenerationKey));

      if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
        self->_hasReloadedWithData = 1;
      if (self->_viewHasDoneFirstAppearance)
      {
        v15 = objc_msgSend(v14, "intValue");
        dayViewController = self->_dayViewController;
        if (v8 && v10)
          -[EKDayViewController loadDataBetweenStart:end:withTrigger:generation:completionForCurrentDayReload:](dayViewController, "loadDataBetweenStart:end:withTrigger:generation:completionForCurrentDayReload:", v8, v10, 1, v15, 0);
        else
          -[EKDayViewController reloadDataForOccurrenceChangeWithGeneration:](dayViewController, "reloadDataForOccurrenceChangeWithGeneration:", v15);
      }

    }
    else
    {
      -[EKDayViewController reloadData](self->_dayViewController, "reloadData");
    }
  }
  else
  {
    -[EKDayViewController setNeedsReload](self->_dayViewController, "setNeedsReload");
  }

}

- (BOOL)dayViewControllerShouldDrawSynchronously:(id)a3
{
  return !self->_hasEndedExtendedLaunch;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 1;
}

- (EKCalendarDate)day
{
  return self->_day;
}

- (void)dayViewControllerCurrentDayDidCompleteAsyncLoadAndLayout:(id)a3
{
  -[DayViewController asyncLoadAndLayoutCompleted](self, "asyncLoadAndLayoutCompleted", a3);
}

- (void)dayViewController:(id)a3 didChangeDisplayedOccurrencesDueToTrigger:(int)a4
{
  -[DayViewController displayedOccurrencesChangedWithTrigger:](self, "displayedOccurrencesChangedWithTrigger:", *(_QWORD *)&a4);
  if (self->_hasReloadedWithData && !self->_hasEndedExtendedLaunch)
  {
    self->_hasEndedExtendedLaunch = 1;
    -[DayViewController extendedLaunchCompletedByViewType:](self, "extendedLaunchCompletedByViewType:", 3);
  }
}

- (void)dayNavigationViewController:(id)a3 didChangeCellWidth:(double)a4
{
  -[DayViewController dayNavigationViewCellWidthDidChange](self, "dayNavigationViewCellWidthDidChange", a3, a4);
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSelectedOccurrencesChangedNotification, self->super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSignificantTimeChangeNotification, self->super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSelectedDateChangedNotification, self->super._model);

  v4.receiver = self;
  v4.super_class = (Class)DayViewController;
  -[MainViewController dealloc](&v4, "dealloc");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSString *previousNavigationTitle;
  void *v6;
  NSString *v7;
  objc_super v8;

  v3 = a3;
  previousNavigationTitle = self->_previousNavigationTitle;
  if (previousNavigationTitle)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setTitle:", previousNavigationTitle);

    v7 = self->_previousNavigationTitle;
    self->_previousNavigationTitle = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)DayViewController;
  -[DayViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[DayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)DayViewController;
      -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
      objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayScrubberController](self, "dayScrubberController"));
      objc_msgSend(v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

    }
  }

}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
}

- (BOOL)isTodayVisible
{
  return 0;
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKCalendarDate *v13;
  EKCalendarDate *day;
  EKCalendarDate *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  uint8_t buf[4];
  const char *v40;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super._model, "eventStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateInTimeZone:", v11));
      v13 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateForDay"));
      day = self->_day;
      self->_day = v13;

      if (!self->_scrubberControllerNeue || !self->_dayViewController)
      {
LABEL_24:

        goto LABEL_25;
      }
      v37 = v12;
      v38 = v6;
      v15 = self->_day;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController displayDate](self->_dayViewController, "displayDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateFromComponents:", v17));
      v36 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v18, v11));
      v20 = -[EKCalendarDate differenceInDays:](v15, "differenceInDays:", v19);

      if (v20)
        v21 = v5;
      else
        v21 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_day, "date"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v23, "setSelectedDate:", v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateForEndOfDay](self->_day, "calendarDateForEndOfDay"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "date"));
      objc_msgSend(v24, "setPreferredReloadStartDate:endDate:", v22, v26);

      if (v21)
      {
        if (-[DayNavigationViewController canAnimateToDate:](self->_scrubberControllerNeue, "canAnimateToDate:", v22))
        {
          -[DayNavigationViewController setSelectedDate:animated:](self->_scrubberControllerNeue, "setSelectedDate:animated:", v22, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "components:fromDate:", 30, v22));
          -[EKDayViewController setDisplayDate:](self->_dayViewController, "setDisplayDate:", v28);

        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
          v33 = -[EKDayViewController alwaysAnimate](self->_dayViewController, "alwaysAnimate");
          -[EKDayViewController setAlwaysAnimate:](self->_dayViewController, "setAlwaysAnimate:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "components:fromDate:", 30, v22));
          -[EKDayViewController setDisplayDate:](self->_dayViewController, "setDisplayDate:", v34);

          -[EKDayViewController setAlwaysAnimate:](self->_dayViewController, "setAlwaysAnimate:", v33);
          -[DayNavigationViewController setSelectedDate:animated:](self->_scrubberControllerNeue, "setSelectedDate:animated:", v22, 0);
        }
        v11 = v36;

        -[DayViewController dayViewDidChangeSelectedDate:](self, "dayViewDidChangeSelectedDate:", v22);
        v12 = v37;
      }
      else
      {
        -[DayNavigationViewController setSelectedDate:animated:](self->_scrubberControllerNeue, "setSelectedDate:animated:", v22, 0);
        v30 = v20;
        if (!v20 && v5)
          -[DayNavigationViewController pulseToday](self->_scrubberControllerNeue, "pulseToday");
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "components:fromDate:", 30, v22));
        -[EKDayViewController setDisplayDate:](self->_dayViewController, "setDisplayDate:", v32);

        -[DayViewController dayViewDidChangeSelectedDate:](self, "dayViewDidChangeSelectedDate:", v22);
        v11 = v36;
        v12 = v37;
        if (!v30)
        {
          -[DayViewController _showNowWhenSameDaySelected](self, "_showNowWhenSameDaySelected");
LABEL_21:
          if (v38)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
            objc_msgSend(v35, "scrollToDate:animated:", v8, v21);

          }
          goto LABEL_24;
        }
      }
      -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
      goto LABEL_21;
    }
  }
  else
  {
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[DayViewController selectDate:andTime:animated:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s received with nil date.", buf, 0xCu);
    }
  }
LABEL_25:

}

- (BOOL)isDateVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned __int8 v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController displayDate](self->_dayViewController, "displayDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v6));

  v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Day view determining if date %@ is visible. Onscreen date: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = objc_msgSend(v5, "isDate:inSameDayAsDate:", v4, v7);

  return v9;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController displayDate](self->_dayViewController, "displayDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromComponents:", v7));

  if (a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateForStartOfDayInTimeZone:", v10));

  }
  if (a4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingHours:inCalendar:", 1, v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateForEndOfDayInTimeZone:", v13));

  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;

  v8 = a4;
  v12 = a3;
  v10 = a6;
  if (a5)
  {
    if (a5 == 3)
      -[DayViewController beginEditingOccurrence:creationMethod:](self, "beginEditingOccurrence:creationMethod:", v12, 3);
    else
      -[DayViewController _showDetailForEvent:animated:showComments:context:](self, "_showDetailForEvent:animated:showComments:context:", v12, v8, a5 == 2, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startCalendarDate"));
    -[DayViewController selectDate:animated:](self, "selectDate:animated:", v11, v8);

    -[DayViewController clearSelection](self, "clearSelection");
    -[DayViewController addEventToSelection:](self, "addEventToSelection:", v12);
    -[DayViewController didShowEventWithoutShowingDetails:](self, "didShowEventWithoutShowingDetails:", v12);
  }
  -[DayViewController _scrollToEvent:animated:](self, "_scrollToEvent:animated:", v12, v8);

}

- (void)addEventToSelection:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  id v7;

  model = self->super._model;
  v5 = a3;
  -[CUIKCalendarModel selectOccurrence:](model, "selectOccurrence:", v5);
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v6, 1, 0, 0);
}

- (void)removeEventFromSelection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  unsigned int v20;
  DayViewController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  -[CUIKCalendarModel deselectOccurrence:](self->super._model, "deselectOccurrence:", v4);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "occurrence"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          objc_msgSend(v10, "setDelegate:", 0);
          objc_msgSend(v10, "removeFromSuperview");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = self;
  v13 = self->_selectedOccurrenceViews;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "occurrence"));
        v20 = objc_msgSend(v19, "isEqual:", v4);

        if (v20)
        {
          -[NSMutableArray removeObject:](v21->_selectedOccurrenceViews, "removeObject:", v18);
          goto LABEL_21;
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_21:

}

- (void)clearSelection
{
  -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", 0);
}

- (id)bestDateForNewEvent
{
  return -[CUIKCalendarModel selectedDate](self->super._model, "selectedDate");
}

- (BOOL)currentlyEditingEventsWithGestures
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController gestureController](self->_dayViewController, "gestureController"));
  v3 = objc_msgSend(v2, "dragGestureInProgress");

  return v3;
}

- (id)testingRotationWillStartNotificationName
{
  return CFSTR("DayViewController_RotationAnimationStartedNotification");
}

- (id)testingRotationDidEndNotificationName
{
  return CFSTR("DayViewController_RotationAnimationCompletedNotification");
}

- (id)sceneTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController displayDate](self->_dayViewController, "displayDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v3));
  if (v6)
  {
    if (objc_msgSend(v5, "isDateInToday:", v6))
    {
      *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));

    }
    else
    {
      v11 = CUIKLongStringForDateWithCommaAndYear(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  self->_visible = a3;
  -[DayNavigationViewController setVisible:](self->_scrubberControllerNeue, "setVisible:");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EKDayViewController view](self->_dayViewController, "view"));
  objc_msgSend(v5, "setHidden:", !v3);

}

- (double)firstCellInset
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self->_scrubberControllerNeue, "weekScrollView"));
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (CGRect)scrubberFrameWithPaletteView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](self->_scrubberControllerNeue, "view"));
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "convertRect:fromView:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)scrubberFirstVisibleDayOffsetFromSelectedDay
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self->_scrubberControllerNeue, "weekScrollView"));
  v3 = objc_msgSend(v2, "firstVisibleDayOffsetFromSelectedDay");

  return (int64_t)v3;
}

- (UIView)allDayView
{
  return (UIView *)-[EKDayViewController currentAllDayView](self->_dayViewController, "currentAllDayView");
}

- (UIView)topLabelsContainer
{
  return (UIView *)-[EKDayViewController currentTopLabelsContainer](self->_dayViewController, "currentTopLabelsContainer");
}

- (NSArray)timedDayViewContentGridSubviews
{
  return (NSArray *)-[EKDayViewController currentDayContentGridViewSubviews](self->_dayViewController, "currentDayContentGridViewSubviews");
}

- (void)reloadData
{
  self->_hasReloadedWithData = 1;
  -[EKDayViewController reloadData](self->_dayViewController, "reloadData");
}

- (void)presentDetailsForEvents:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a5;
  v7 = a4;
  v13 = a6;
  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    -[DayViewController _showDetailForEvent:animated:showComments:context:](self, "_showDetailForEvent:animated:showComments:context:", v11, v7, v6, v13);

  }
  else
  {
    -[DayViewController _showDetailForEvents:animated:](self, "_showDetailForEvents:animated:", v10, v7);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  -[DayViewController _scrollToEvent:animated:](self, "_scrollToEvent:animated:", v12, v7);
}

- (void)beginEditingOccurrence:(id)a3 creationMethod:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:](AddEventViewController, "editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:", a3, self->super._model, a4, self));
  -[DayViewController showEditViewController:](self, "showEditViewController:", v5);

}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5
{
  id v8;
  id v9;
  void ***v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100116094;
  v15 = &unk_1001B5DF8;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v16 = v9;
  v18 = a5;
  v19 = a4;
  v10 = objc_retainBlock(&v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager", v12, v13, v14, v15));
  objc_msgSend(v11, "dismissTipDueToUserNavigationWithCompletionBlock:", v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5
{
  id v8;
  id v9;
  void ***v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100116208;
  v15 = &unk_1001B5DF8;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v16 = v9;
  v18 = a5;
  v19 = a4;
  v10 = objc_retainBlock(&v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarTipsManager sharedManager](CalendarTipsManager, "sharedManager", v12, v13, v14, v15));
  objc_msgSend(v11, "dismissTipDueToUserNavigationWithCompletionBlock:", v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
  CUIKCalendarModel *model;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  model = self->super._model;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 30, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v15, v9));

  -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateForDay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateForEndOfDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date"));

  -[CUIKCalendarModel setPreferredReloadStartDate:endDate:](self->super._model, "setPreferredReloadStartDate:endDate:", v12, v14);
  -[EKDayViewController setDisplayDate:](self->_dayViewController, "setDisplayDate:", v15);
  -[DayViewController scrubberDidChangeSelectedDate:](self, "scrubberDidChangeSelectedDate:", v6);

  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
  -[DayViewController wasAllowedToChangeDate](self, "wasAllowedToChangeDate");

}

- (BOOL)dayNavigationViewControllerAllowedToChangeSelectedDate
{
  return -[DayViewController allowChangingDate](self, "allowChangingDate");
}

- (void)dayNavigationViewControllerFailedToChangeDate:(id)a3
{
  -[DayViewController wasBlockedFromChangingDate:](self, "wasBlockedFromChangingDate:", a3);
}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 context:(id)a5
{
  -[DayViewController _showDetailForEvent:animated:showComments:context:](self, "_showDetailForEvent:animated:showComments:context:", a3, a4, 0, a5);
}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  CUIKCalendarModel *model;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v6 = a5;
    v7 = a4;
    model = self->super._model;
    v11 = a6;
    v12 = a3;
    -[CUIKCalendarModel setSelectedOccurrence:](model, "setSelectedOccurrence:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController showDetailViewControllerForEvent:context:animated:](self, "showDetailViewControllerForEvent:context:animated:", v12, v11, v7));

    objc_opt_class(EKEventViewController);
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0 && v6)
      objc_msgSend(v14, "openAttendeesDetailItem");

  }
}

- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", v7);
  v6 = -[DayViewController showDetailViewControllerForEvents:animated:](self, "showDetailViewControllerForEvents:animated:", v7, v4);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "setDelegate:", 0);
  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "presentingViewController"));
  objc_opt_class(EKExpandedReminderStackViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "presentingViewController"));
    v10 = v9;
    if (a4 == 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "event"));
      objc_msgSend(v10, "reminderDetailDismissedWithDeletedEvent:", v11);

    }
    else
    {
      objc_msgSend(v9, "reminderDetailDismissedWithDeletedEvent:", 0);
    }

    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));
  objc_opt_class(EKExpandedReminderStackViewController);
  v15 = objc_opt_isKindOfClass(v13, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  v17 = v16;
  if ((v15 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentedViewController"));
    v19 = v18;
    if (a4 == 2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "event"));
      objc_msgSend(v19, "reminderDetailDismissedWithDeletedEvent:", v20);

    }
    else
    {
      objc_msgSend(v18, "reminderDetailDismissedWithDeletedEvent:", 0);
    }

    goto LABEL_13;
  }

  if (!v17)
  {
LABEL_13:
    objc_msgSend(v23, "dismissViewControllerAnimated:completion:", 1, 0);
    v22 = v23;
    goto LABEL_14;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  objc_msgSend(v21, "popViewControllersAfterAndIncluding:animated:", v23, !self->_editorDismissedFromDelete);

  v22 = v23;
  self->_editorDismissedFromDelete = 0;
LABEL_14:

}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController", a3));
  if ((objc_opt_respondsToSelector(v4, "isTransitioningTraitCollection") & 1) == 0)
  {

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  v6 = objc_msgSend(v5, "performSelector:", "isTransitioningTraitCollection");

  if (!v6)
LABEL_5:
    -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", 0);
}

- (void)dayViewController:(id)a3 didSelectEvent:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pasteboardManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
  objc_msgSend(v10, "setDateForPaste:", v11);

  -[DayViewController _showDetailForEvent:animated:userInitiated:](self, "_showDetailForEvent:animated:userInitiated:", v12, v7, v6);
}

- (void)dayViewController:(id)a3 didSelectEvents:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v7 = a5;
  v13 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pasteboardManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
  objc_msgSend(v10, "setDateForPaste:", v12);

  -[DayViewController _showDetailForEvents:animated:userInitiated:](self, "_showDetailForEvents:animated:userInitiated:", v13, v7, v6);
}

- (void)dayViewController:(id)a3 modifySelection:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (v8)
      -[DayViewController removeEventFromSelection:](self, "removeEventFromSelection:", v6);
    else
      -[DayViewController addEventToSelection:](self, "addEventToSelection:", v6);
  }

}

- (void)dayViewController:(id)a3 didChangeDisplayDate:(id)a4
{
  CUIKCalendarModel *model;
  id v6;
  void *v7;
  void *v8;
  EKCalendarDate *v9;
  EKCalendarDate *day;
  EKCalendarDate *v11;

  model = self->super._model;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  v9 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v6, v8));

  day = self->_day;
  self->_day = v9;
  v11 = v9;

  -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", v11);
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
}

- (void)dayViewControllerDidEndScrolling:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  model = self->super._model;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayDate"));

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));
  -[DayNavigationViewController setSelectedDate:animated:](self->_scrubberControllerNeue, "setSelectedDate:animated:", v9, 1);
  if (objc_msgSend(UIApp, "isRunningTest"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("NSString *const DayViewController_DayScrollDidEndAnimationNotification"), self, 0);

  }
}

- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  DayNavigationViewController *scrubberControllerNeue;
  void *v9;
  void *v10;
  id obj;

  v5 = a4;
  CalAnalyticsSendEvent(CFSTR("userSwipedInDayView"), 0);
  -[DayViewController beganHorizontalDeceleration](self, "beganHorizontalDeceleration");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  obj = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v5, v7));

  scrubberControllerNeue = self->_scrubberControllerNeue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "date"));
  -[DayNavigationViewController setSelectedDate:animated:](scrubberControllerNeue, "setSelectedDate:animated:", v9, 1);

  if ((objc_msgSend(obj, "isEqual:", self->_day) & 1) != 0)
  {
    -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", obj);
  }
  else
  {
    objc_storeStrong((id *)&self->_day, obj);
    -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "date"));
    -[DayViewController dayViewDidChangeSelectedDate:](self, "dayViewDidChangeSelectedDate:", v10);

  }
}

- (void)dayViewControllerDidEndDecelerating:(id)a3
{
  -[DayViewController endedHorizontalDeceleration](self, "endedHorizontalDeceleration", a3);
}

- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v7 = a4;
  CalAnalyticsSendEvent(CFSTR("userTappedAndHeldToCreateEvent"), &off_1001BCA00);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super._model, "eventStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v8));

  objc_msgSend(v9, "setStartDate:", v7);
  if (v5)
  {
    v10 = 1.0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CalFoundationPreferences shared](CalFoundationPreferences, "shared"));
    objc_msgSend(v8, "defaultEventDuration");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v10));
  objc_msgSend(v9, "setEndDate:", v11);

  if (!v5)
  objc_msgSend(v9, "setAllDay:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
  objc_msgSend(v9, "setTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](self->super._model, "defaultCalendarForNewEvents"));
  objc_msgSend(v9, "setCalendar:", v13);

  return v9;
}

- (id)dayViewController:(id)a3 createReminderAtDate:(id)a4 allDay:(BOOL)a5
{
  _BOOL8 v5;
  CUIKCalendarModel *model;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  model = self->super._model;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v9));

  objc_msgSend(v10, "setStartDate:", v8);
  objc_msgSend(v10, "setEndDate:", v8);

  objc_msgSend(v10, "setAllDay:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel reminderCalendar](self->super._model, "reminderCalendar"));
  objc_msgSend(v10, "setCalendar:", v11);

  return v10;
}

- (void)dayViewController:(id)a3 awaitsRefreshingOccurrence:(id)a4
{
  -[CUIKCalendarModel addOccurrenceAwaitingRefresh:](self->super._model, "addOccurrenceAwaitingRefresh:", a4);
}

- (void)dayViewController:(id)a3 awaitsDeletingOccurrence:(id)a4
{
  -[CUIKCalendarModel addOccurrenceAwaitingDeletion:](self->super._model, "addOccurrenceAwaitingDeletion:", a4);
}

- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3
{
  void *v4;
  BOOL v5;

  if (!-[DayViewController shouldAllowLongPress](self, "shouldAllowLongPress", a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](self->super._model, "defaultCalendarForNewEvents"));
  v5 = v4 != 0;

  return v5;
}

- (void)dayViewControllerDidTapEmptySpace:(id)a3 onDate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[DayViewController didSelectEvent:userInitiated:](self, "didSelectEvent:userInitiated:", 0, 1);
  -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
    objc_msgSend(v6, "setDateForPaste:", v7);

  }
}

- (void)dayViewController:(id)a3 didReloadDataDueToTrigger:(int)a4
{
  -[DayViewController dataReloadedWithTrigger:](self, "dataReloadedWithTrigger:", *(_QWORD *)&a4);
}

- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4
{
  return -[DayViewController shouldHandleGestureCommits](self, "shouldHandleGestureCommits", a3, a4);
}

- (BOOL)dayViewController:(id)a3 willDuplicateOccurrence:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "optionKeyIsDown");
  if (v9)
  {
    v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "duplicating event(s) in day view because option key is down", v19, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pasteboardManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v12, "setDateForPaste:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pasteboardManager"));
    objc_msgSend(v15, "setCalendarForPaste:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController pasteboardManager](self, "pasteboardManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
    objc_msgSend(v16, "duplicateEvents:withDateMode:delegate:", v17, 1, v6);

  }
  return v9;
}

- (void)dayViewController:(id)a3 handleGestureCommittingOccurrence:(id)a4
{
  -[DayViewController handleGestureCommittingOccurrence:](self, "handleGestureCommittingOccurrence:", a4);
}

- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3
{
  return -[DayViewController allowChangingDate](self, "allowChangingDate", a3);
}

- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3
{
  return -[DayViewController showDetachAlertOnDraggingGestureEnd](self, "showDetachAlertOnDraggingGestureEnd", a3);
}

- (void)dayViewControllerDidBeginMovingEventWithGesture:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "gestureController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = objc_msgSend(v5, "isNew");

  if ((v6 & 1) == 0)
    CalAnalyticsSendEvent(CFSTR("userDraggedEvent"), &off_1001BCA28);
  -[DayViewController didBeginMovingOccurrenceWithGesture](self, "didBeginMovingOccurrenceWithGesture");
}

- (void)dayViewControllerDidFinishPinchingDayView:(id)a3
{
  -[DayViewController finishedPinchingDayView](self, "finishedPinchingDayView", a3);
}

- (void)dayViewControllerIsPinchingDayView:(id)a3
{
  -[DayViewController isPinchingDayView](self, "isPinchingDayView", a3);
}

- (void)dayViewControllerDidRespondToApplicationDidBecomeActiveStateChange:(id)a3
{
  -[DayViewController setShouldRespondToApplicationDidBecomeActiveStateChange:](self, "setShouldRespondToApplicationDidBecomeActiveStateChange:", 0);
}

- (void)dayViewController:(id)a3 requestsPresentationOfViewControllerForGestures:(id)a4
{
  id v5;
  void *v6;
  UnadaptableNavigationController *v7;

  v5 = a4;
  v7 = -[UnadaptableNavigationController initWithRootViewController:]([UnadaptableNavigationController alloc], "initWithRootViewController:", v5);

  -[UnadaptableNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)dayViewController:(id)a3 requestsShowEvent:(id)a4 showDetails:(BOOL)a5
{
  -[DayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a4, 1, a5, 0);
}

- (void)dayViewController:(id)a3 requestsSaveHourScalePreference:(double)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState", a3));
  objc_msgSend(v5, "setDayViewHourScale:", a4);

}

- (id)dayViewController:(id)a3 selectedCopyViewForView:(id)a4
{
  return -[DayViewController selectedCopyViewForOccurrenceView:](self, "selectedCopyViewForOccurrenceView:", a4);
}

- (id)selectedOccurrencesForDayViewController:(id)a3
{
  return -[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences", a3);
}

- (id)selectedEventsForEditMenu
{
  return -[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences");
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;

  v6 = a3;
  if (a4 == 1)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    v6 = v11;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
      -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v10);

      v6 = v11;
    }
  }

}

- (void)_significantTimeChanged:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView", a3));
  -[DayNavigationViewController significantTimeChangeOccurred](self->_scrubberControllerNeue, "significantTimeChangeOccurred");
  objc_msgSend(v14, "significantTimeChangeOccurred");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));
  objc_msgSend(v5, "absoluteTime");
  v7 = v6;

  v9 = CUIKCalendar(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));

  v12 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithAbsoluteTime:timeZone:", v11, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allComponents"));
  objc_msgSend(v14, "setDisplayDate:", v13);
  objc_msgSend(v14, "setTimeZone:", v11);

}

- (void)dayViewController:(id)a3 beginEditingOccurrence:(id)a4 creationMethod:(unint64_t)a5
{
  -[DayViewController beginEditingOccurrence:creationMethod:](self, "beginEditingOccurrence:creationMethod:", a4, a5);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[DayViewController eventEditViewController:didCompleteWithAction:dismissController:](self, "eventEditViewController:didCompleteWithAction:dismissController:", a3, a4, 1);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  -[DayViewController eventEditViewController:didCompleteWithAction:dismissController:completionHandler:](self, "eventEditViewController:didCompleteWithAction:dismissController:completionHandler:", a3, a4, 1, a5);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5
{
  -[DayViewController eventEditViewController:didCompleteWithAction:dismissController:completionHandler:](self, "eventEditViewController:didCompleteWithAction:dismissController:completionHandler:", a3, a4, a5, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  DayViewController *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      if (a4 == 2)
      {
        -[EKDayViewController editorDidDeleteEvent:](self->_dayViewController, "editorDidDeleteEvent:", v12);
      }
      else if (a4 == 1)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendar"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));

        if (v15)
          -[CUIKCalendarModel ensureCalendarVisibleWithId:](self->super._model, "ensureCalendarVisibleWithId:", v15);
        -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v13);
        -[EKDayViewController editorDidSaveEvent:](self->_dayViewController, "editorDidSaveEvent:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "calendar"));
        v18 = objc_msgSend(v17, "sharingStatus");

        if (v18)
          -[MainViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt");

      }
    }
    else
    {
      -[EKDayViewController editorDidCancelEditingEvent:](self->_dayViewController, "editorDidCancelEditingEvent:", v12);
    }
    v20 = (DayViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalEditViewDelegate"));

    if (v20 == self && v7)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentingViewController"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1001176D8;
      v22[3] = &unk_1001B2600;
      v22[4] = self;
      v23 = v11;
      objc_msgSend(v21, "dismissViewControllerAnimated:completion:", 1, v22);

    }
  }
  else
  {
    v19 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[DayViewController eventEditViewController:didCompleteWithAction:dismissController:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s received with nil event.", buf, 0xCu);
    }
  }

}

- (id)eventEditViewControllerDefaultCalendarForNewEvents:(id)a3
{
  return -[CUIKCalendarModel defaultCalendarForNewEvents](self->super._model, "defaultCalendarForNewEvents", a3);
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pasteboardManager"));

  return v4;
}

- (id)calendarModel
{
  return self->super._model;
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
    -[DayViewController selectDate:animated:](self, "selectDate:animated:", v9, 1);

    -[DayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v8, 1, 0, 0);
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
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextOccurrence"));

  if (v5)
  {
    -[DayViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startCalendarDate"));
    -[DayViewController selectDate:animated:](self, "selectDate:animated:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    -[DayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v7);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousOccurrence"));

  if (v5)
  {
    -[DayViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startCalendarDate"));
    -[DayViewController selectDate:animated:](self, "selectDate:animated:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    -[DayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v7);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DayViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

  -[DayViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v6, 1, 1, v8);
}

- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  return -[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self->super._model, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", a4, a5, 1, !self->_hasReloadedWithData);
}

- (id)pasteboardManagerForDayViewController:(id)a3
{
  return -[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager", a3);
}

- (id)defaultCalendarForNewEvents
{
  return -[CUIKCalendarModel defaultCalendarForNewEvents](self->super._model, "defaultCalendarForNewEvents");
}

- (id)calendarForNewIntegrationReminders
{
  return -[CUIKCalendarModel reminderCalendar](self->super._model, "reminderCalendar");
}

- (void)_scrollToEvent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  NSString *scrollToEventIdentifier;
  NSString *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController occurrenceViewForEvent:](self->_dayViewController, "occurrenceViewForEvent:"));
  if (-[DayViewController isViewLoaded](self, "isViewLoaded")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window")),
        v8,
        v7,
        v8)
    && v6)
  {
    -[EKDayViewController scrollEventIntoView:animated:](self->_dayViewController, "scrollEventIntoView:animated:", v11, v4);
    scrollToEventIdentifier = self->_scrollToEventIdentifier;
    self->_scrollToEventIdentifier = 0;
  }
  else
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventIdentifier"));
    scrollToEventIdentifier = self->_scrollToEventIdentifier;
    self->_scrollToEventIdentifier = v10;
  }

}

- (id)gestureController
{
  return -[EKDayViewController gestureController](self->_dayViewController, "gestureController");
}

- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v12;

  v6 = a3;
  if (!v6)
  {
    -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", &__NSArray0__struct);
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) == 0)
    {
      -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v6);
      v12 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v10, 1, 0, 1);

    }
    goto LABEL_7;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", &__NSArray0__struct);
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (!a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v13 = objc_msgSend(v11, "isEqualToSet:", v12);

    if ((v13 & 1) == 0)
    {
      -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", v7);
      -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v7, 1, 0, 1);
    }
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)scrubberDidChangeSelectedDate:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  EKCalendarDate *v7;
  EKCalendarDate *day;
  id v9;

  model = self->super._model;
  v5 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
  v7 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v6));

  day = self->_day;
  self->_day = v7;

}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Day"), &stru_1001B67C0, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setTitle:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v9, self, v15));

  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v16, self, v5, 0);
  return v16;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Day"), &stru_1001B67C0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setTitle:", v10);

  v12 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v6, self);
  objc_msgSend(v12, "setPreferModalPresentation:", 0);
  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v12, self, v4, 0);
  return v12;
}

- (void)showReminderDetail:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", 0));
  v5 = objc_alloc_init((Class)UINavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v4, self, v7));

  objc_msgSend(v5, "pushViewController:animated:", v6, 0);
  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v5, self, 1, 0);

}

- (void)showEditViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "presentModalViewController:withTransition:", v4, 8);

}

- (void)dataReloadedWithTrigger:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController view](self, "view", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super._model, "eventStore"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventWithIdentifier:", self->_scrollToEventIdentifier));

    -[DayViewController _scrollToEvent:animated:](self, "_scrollToEvent:animated:", v7, 1);
  }
}

- (BOOL)shouldHandleGestureCommits
{
  return 0;
}

- (BOOL)showWeekdayLabel
{
  return 1;
}

- (BOOL)allowChangingDate
{
  return 1;
}

- (int)editorShowTransition
{
  return 8;
}

- (int)editorHideTransition
{
  return 9;
}

- (BOOL)showDetachAlertOnDraggingGestureEnd
{
  return 1;
}

- (void)finishedPinchingDayView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrences"));
  -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v3, 0, 1, 1);

}

- (BOOL)shouldAllowLongPress
{
  return -[EKEventCreationGestureController currentlyCreatingEvent](self->_eventCreationGestureController, "currentlyCreatingEvent") ^ 1;
}

- (id)selectedCopyViewForOccurrenceView:(id)a3
{
  return 0;
}

- (void)_sceneEnteredForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_sceneIdentifier"));
  if (!objc_msgSend(v5, "isEqualToString:", v6))
  {

    goto LABEL_5;
  }
  v7 = -[DayViewController savedFirstVisibleSecond](self, "savedFirstVisibleSecond");

  if ((v7 & 0x80000000) == 0)
  {
    v8 = -[DayViewController savedFirstVisibleSecond](self, "savedFirstVisibleSecond");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDayView"));
    objc_msgSend(v5, "setFirstVisibleSecond:", v8);
LABEL_5:

  }
}

- (void)saveFirstVisibleSecond:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  if (EKUIShouldSaveStateInPreferences(self))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v5, "setDayViewFirstVisibleSecond:", v6);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistedSceneState"));
    objc_msgSend(v5, "setDayViewFirstVisibleSecond:", v3);
  }

}

- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController", a3));
  if ((objc_msgSend(v7, "dragGestureInProgress") & 1) != 0)
  {
    v8 = 0;
LABEL_6:

    return v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "draggingView"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _parentViewForCreationGesture](self, "_parentViewForCreationGesture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentDayView"));
    objc_msgSend(v11, "convertPoint:toView:", v13, x, y);
    v15 = v14;
    v17 = v16;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDayView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "occurrenceViewAtPoint:", v15, v17));
    v8 = v19 == 0;

    goto LABEL_6;
  }
  return 0;
}

- (id)_parentViewForCreationGesture
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveEventGestureSuperview"));

  return v3;
}

- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createOccurrenceViewForEventGestures"));

  objc_msgSend(v7, "setOccurrence:", v5);
  objc_msgSend(v7, "setSelected:", 1);
  return v7;
}

- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView", a3, a4, a5.x, a5.y));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentDayView"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentDayView"));
  objc_msgSend(v11, "leftContentInset");
  v13 = v9 - v12;

  return v13;
}

- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView", a3, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDayView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _parentViewForCreationGesture](self, "_parentViewForCreationGesture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDayView"));
  objc_msgSend(v9, "leftContentInset");
  objc_msgSend(v7, "convertPoint:fromView:", v6);
  v11 = v10;

  return v11;
}

- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v8 = v7;

  objc_msgSend(v6, "pointAtDate:isAllDay:", 0, v8);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  objc_msgSend(v6, "showTimelineHighlightForTime:", v5);

}

- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;

  y = a4.y;
  x = a4.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentDayView"));
  objc_msgSend(v7, "dateAtPoint:isAllDay:", 0, x, y);
  v9 = v8;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v9);
}

- (id)creationGestureControllerRequestsNewEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v10 = -[DayViewController dayViewController:createEventAtDate:allDay:](self, "dayViewController:createEventAtDate:allDay:", v9, v8, 0);

  return v10;
}

- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentEditor"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
      objc_msgSend(v11, "setTitle:", &stru_1001B67C0);
    -[DayViewController beginEditingOccurrence:creationMethod:](self, "beginEditingOccurrence:creationMethod:", v11, 4);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  objc_msgSend(v10, "liftUpOccurrenceForEditingEvent:", v11);

}

- (void)creationGestureControllerDidCancel:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView", a3));
  objc_msgSend(v3, "hideTimelineHighlight");

}

- (id)_selectedOccurrenceViews
{
  return self->_selectedOccurrenceViews;
}

- (void)_setUpSelectedOccurrenceViewsWithEvents:(id)a3 animated:(BOOL)a4 autoScroll:(BOOL)a5 resetSelection:(BOOL)a6
{
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableArray *selectedOccurrenceViews;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id obj;
  void *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v33 = a4;
  v34 = a6;
  v32 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = v7;
    v36 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "draggingView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "occurrence"));
        v16 = objc_msgSend(v15, "isEqual:", v12);

        if ((v16 & 1) != 0)
        {
          v17 = 0;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "occurrenceViewForEvent:includeNextAndPreviousDays:", v12, 1));

          if (v17)
          {
            if ((v9 & 1) != 0)
            {
              v19 = v36;
            }
            else
            {
              if (v34)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceFrontmostClonedViews](self, "_selectedOccurrenceFrontmostClonedViews"));
                v21 = objc_msgSend(v20, "count");

                if (v21)
                  -[DayViewController _cleanupSelectedOccurrenceCloneViews](self, "_cleanupSelectedOccurrenceCloneViews");
              }
              if (v32)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
                objc_msgSend(v22, "scrollEventIntoView:animated:", v12, v33);

              }
              selectedOccurrenceViews = self->_selectedOccurrenceViews;
              if (selectedOccurrenceViews)
              {
                if (v34)
                  -[NSMutableArray removeAllObjects](selectedOccurrenceViews, "removeAllObjects");
              }
              else
              {
                v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                v25 = self->_selectedOccurrenceViews;
                self->_selectedOccurrenceViews = v24;

              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController _selectedOccurrenceViews](self, "_selectedOccurrenceViews"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "CalMap:", &stru_1001B5E38));
              v28 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v27));

              v19 = (void *)v28;
            }
            v36 = v19;
            if ((objc_msgSend(v19, "containsObject:", v12) & 1) == 0)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "occurrences"));
              objc_msgSend(v19, "addObjectsFromArray:", v29);

              -[NSMutableArray addObject:](self->_selectedOccurrenceViews, "addObject:", v17);
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
              v31 = objc_msgSend(v17, "copy");
              objc_msgSend(v31, "setDelegate:", 0);
              objc_msgSend(v31, "setIsSelectedCopyView:", 1);
              objc_msgSend(v31, "setSelectedCopy:", 0);
              objc_msgSend(v31, "setSelected:", 1);
              objc_msgSend(v31, "setUserInteractionEnabled:", 0);
              objc_msgSend(v31, "requestContentIfNeeded:completion:", 16, 0);
              objc_msgSend(v17, "setSelectedCopy:", v31);
              objc_msgSend(v30, "addSubview:", v31);
              objc_msgSend(v30, "bringSubviewToFront:", v31);
              if (v33)
              {
                objc_msgSend(v31, "setAlpha:", 0.0);
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v37[2] = sub_100118E80;
                v37[3] = &unk_1001B2538;
                v38 = v31;
                +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v37, 0, 1.5, 0.0, 10.0, 10.0);

              }
            }
            v9 = 1;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }
  else
  {
    v36 = 0;
  }

}

- (id)_selectedOccurrenceFrontmostClonedViews
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100118FC8;
  v14 = sub_100118FD8;
  v15 = 0;
  v3 = objc_opt_new(NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController timedDayViewContentGridSubviews](self, "timedDayViewContentGridSubviews"));
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController allDayView](self, "allDayView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100118FE0;
  v9[3] = &unk_1001B5E60;
  v9[4] = &v10;
  -[NSMutableSet enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)_cleanupSelectedOccurrenceCloneViews
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  -[DayViewController _cleanupSelectedOccurrenceCloneViewsSkipSet:](self, "_cleanupSelectedOccurrenceCloneViewsSkipSet:", v3);

}

- (void)_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedOccurrences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  -[DayViewController _cleanupSelectedOccurrenceCloneViewsSkipSet:](self, "_cleanupSelectedOccurrenceCloneViewsSkipSet:", v4);

}

- (void)_cleanupSelectedOccurrenceCloneViewsSkipSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *selectedOccurrenceViews;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController dayView](self, "dayView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  -[DayViewController _recursiveRemoveSelectedClonedViewsFromViewTree:skipSet:](self, "_recursiveRemoveSelectedClonedViewsFromViewTree:skipSet:", v6, v4);

  selectedOccurrenceViews = self->_selectedOccurrenceViews;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100119224;
  v10[3] = &unk_1001B5E88;
  v11 = v4;
  v8 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v10));
  -[NSMutableArray filterUsingPredicate:](selectedOccurrenceViews, "filterUsingPredicate:", v9);

}

- (void)_recursiveRemoveSelectedClonedViewsFromViewTree:(id)a3 skipSet:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  if (a3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          -[DayViewController _recursiveRemoveSelectedClonedViewsFromViewTree:skipSet:](self, "_recursiveRemoveSelectedClonedViewsFromViewTree:skipSet:", v12, v6);
          objc_opt_class(EKDayOccurrenceView);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = v12;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "occurrence"));
            v16 = objc_msgSend(v6, "containsObject:", v15);

            if ((v16 & 1) == 0)
            {
              if (objc_msgSend(v14, "isSelectedCopyView"))
              {
                objc_msgSend(v14, "setDelegate:", 0);
                objc_msgSend(v14, "removeFromSuperview");
              }
              else
              {
                objc_msgSend(v14, "setSelectedCopy:", 0);
              }
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  -[DayViewController _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected](self, "_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
  v8 = objc_msgSend(v5, "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
    objc_msgSend(v9, "endForcedStart");

  }
  v10 = objc_msgSend(v5, "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_selectedOccurrenceViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrence", (_QWORD)v24));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrence"));
          objc_msgSend(v10, "removeObject:", v18);

        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "event"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewController gestureController](self, "gestureController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "event"));
    objc_msgSend(v10, "removeObject:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects", (_QWORD)v24));
  -[DayViewController _setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:](self, "_setUpSelectedOccurrenceViewsWithEvents:animated:autoScroll:resetSelection:", v23, 1, 0, 0);

}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewController occurrenceViewForEvent:](self->_dayViewController, "occurrenceViewForEvent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8), (_QWORD)v14));
      v10 = v9;
      if (!v9)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occurrences"));
      v12 = objc_msgSend(v11, "count");

      if ((unint64_t)v12 > 1)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        LOBYTE(v10) = 1;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCreationGestureController, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceViews, 0);
  objc_storeStrong((id *)&self->_previousNavigationTitle, 0);
  objc_storeStrong((id *)&self->_dayViewController, 0);
  objc_storeStrong((id *)&self->_scrubberControllerNeue, 0);
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_scrollToEventIdentifier, 0);
}

- (int64_t)intendedSizeClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

- (id)cellFactory
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

@end
