@implementation MultiColumnMonthViewController

- (MultiColumnMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8;
  id v9;
  id v10;
  MultiColumnMonthViewController *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MultiColumnMonthViewController;
  v11 = -[MonthViewController initWithCalendarDate:model:window:](&v20, "initWithCalendarDate:model:window:", v8, v9, v10);
  if (v11)
  {
    objc_initWeak(&location, v11);
    *(_QWORD *)&v12 = objc_opt_class(UITraitVerticalSizeClass).n128_u64[0];
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v12));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000EFED8;
    v17[3] = &unk_1001B2418;
    objc_copyWeak(&v18, &location);
    v15 = -[MultiColumnMonthViewController registerForTraitChanges:withHandler:](v11, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelCachedOccurrencesChangedNotification, self->super.super.super.super._model);

  v4.receiver = self;
  v4.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  UIView *v3;
  UIView *dividerLineBetweenListAndMonth;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *dividerLineBetweenListAndEventDetails;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController loadView](&v12, "loadView");
  -[MultiColumnMonthViewController _setupListViewController](self, "_setupListViewController");
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  dividerLineBetweenListAndMonth = self->_dividerLineBetweenListAndMonth;
  self->_dividerLineBetweenListAndMonth = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 1.0));
  -[UIView setBackgroundColor:](self->_dividerLineBetweenListAndMonth, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_dividerLineBetweenListAndMonth);

  v7 = (UIView *)objc_alloc_init((Class)UIView);
  dividerLineBetweenListAndEventDetails = self->_dividerLineBetweenListAndEventDetails;
  self->_dividerLineBetweenListAndEventDetails = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 1.0));
  -[UIView setBackgroundColor:](self->_dividerLineBetweenListAndEventDetails, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", self->_dividerLineBetweenListAndEventDetails);

  -[MonthViewController setShouldShowMonthTitleHUDWhenScrolling:](self, "setShouldShowMonthTitleHUDWhenScrolling:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_cachedOccurrencesChanged:", CUIKCalendarModelCachedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_occurrencesChanged:", CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super.super._model);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MultiColumnMonthViewController;
  -[InfiniteScrollViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setDecelerationRate:", UIScrollViewDecelerationRateFast);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController traitCollection](self, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v4);

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dividedModeBackgroundColor", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  EKCalendarDate *navigationBarDisplayedDate;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  objc_super v26;

  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController viewWillAppear:](&v26, "viewWillAppear:");
  if (!self->_hasSetInitialSelectedDate)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController adjustSelectedDateForNewMonth:](self, "adjustSelectedDateForNewMonth:", v5));

    -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v6);
    self->_hasSetInitialSelectedDate = 1;

  }
  self->_shouldSetSelectedDate = 1;
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = 0;

  v8 = objc_alloc_init((Class)UITapGestureRecognizer);
  -[MultiColumnMonthViewController setDayCellsTapGestureRecognizer:](self, "setDayCellsTapGestureRecognizer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v9, "addTarget:action:", self, "_tapGestureCallback:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v10, "addGestureRecognizer:", v11);

  v12 = objc_alloc_init((Class)UILongPressGestureRecognizer);
  -[MultiColumnMonthViewController setDayCellsScrubbingGestureRecognizer:](self, "setDayCellsScrubbingGestureRecognizer:", v12);

  *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v14, "scrubbingMinimumPressDuration", v13);
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v17, "setMinimumPressDuration:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v18, "addTarget:action:", self, "_scrubGestureCallback:");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v19, "addGestureRecognizer:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  LODWORD(v20) = EKUICurrentHeightSizeClassIsRegular();

  if ((_DWORD)v20)
  {
    if (-[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns")
      && !self->_isRotating)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      objc_msgSend(v22, "setLargeListViewDisclosingEventDetails:", 1);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    if (objc_msgSend(v23, "largeListViewDisclosingEventDetails"))
    {
      v24 = -[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn");

      if ((v24 & 1) == 0)
      {
        -[MultiColumnMonthViewController _autoSelectEvent](self, "_autoSelectEvent");
        return;
      }
    }
    else
    {

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v25, "setLargeListViewDisclosingEventDetails:", 0);

    if (-[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn"))
      -[MultiColumnMonthViewController _slideToHideEventDetailsAnimated:](self, "_slideToHideEventDetailsAnimated:", v3);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MultiColumnMonthViewController;
  -[CompactMonthViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v5));
  -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v4, v6, 1);

  self->_currentlyVisible = 1;
  self->_reloadAfterStoppedScrolling = 0;
  if (*(_WORD *)&self->_needToReloadEventsOnAppear)
  {
    self->_needToReloadEventsOnAppear = 0;
    self->_eventLoadingSuspendedForScroll = 0;
    -[MultiColumnMonthViewController _loadEventsForAllSubviews](self, "_loadEventsForAllSubviews");
  }
  -[MultiColumnMonthViewController _refreshListView](self, "_refreshListView");
  -[MultiColumnMonthViewController _startUpdateTimer](self, "_startUpdateTimer");
  -[MultiColumnMonthViewController updatePalette:](self, "updatePalette:", self->_palette);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  UIButton *cancelEventDetailViewModeButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[MultiColumnMonthViewController _resetPaletteState](self, "_resetPaletteState");
  -[MultiColumnMonthViewController _invalidateUpdateTimer](self, "_invalidateUpdateTimer");
  -[UIButton removeFromSuperview](self->_cancelEventDetailViewModeButton, "removeFromSuperview");
  cancelEventDetailViewModeButton = self->_cancelEventDetailViewModeButton;
  self->_cancelEventDetailViewModeButton = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v6, "removeGestureRecognizer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v8, "removeGestureRecognizer:", v9);

  v10.receiver = self;
  v10.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController viewWillDisappear:](&v10, "viewWillDisappear:", v3);
}

- (void)setupUIForTraitCollection:(id)a3
{
  id v4;
  id v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MultiColumnMonthViewController;
  v4 = a3;
  -[MainViewController setupUIForTraitCollection:](&v11, "setupUIForTraitCollection:", v4);
  v5 = objc_msgSend(v4, "verticalSizeClass", v11.receiver, v11.super_class);

  if (v5 == (id)1)
  {
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dividedModeBackgroundColor", v6));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  BOOL IsEmpty;
  objc_super v5;
  CGRect v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  IsEmpty = CGRectIsEmpty(v6);

  if (!IsEmpty)
  {
    -[MultiColumnMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
    -[MultiColumnMonthViewController _updateInfiniteScrollViewFrame](self, "_updateInfiniteScrollViewFrame");
    -[MultiColumnMonthViewController _updateEventDetailsColumnViewFrame](self, "_updateEventDetailsColumnViewFrame");
    v5.receiver = self;
    v5.super_class = (Class)MultiColumnMonthViewController;
    -[InfiniteScrollViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  }
}

- (unint64_t)edgesForExtendedLayout
{
  return 0;
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
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[MultiColumnMonthViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      -[MainViewController transitionToSizeWillStart](self, "transitionToSizeWillStart");
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F0A20;
      v12[3] = &unk_1001B2C38;
      v12[4] = self;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v12);
      self->_isRotating = 1;
      if (-[MultiColumnMonthViewController _threeColumnsDisplayIsAllowed](self, "_threeColumnsDisplayIsAllowed")
        && width > EKUIWidthForWindowSizeParadigm(0x2000, v10))
      {
        if (-[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn"))
          -[MultiColumnMonthViewController _slideToAnimatePalleteShowingBackButton:animated:](self, "_slideToAnimatePalleteShowingBackButton:animated:", 0, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
        objc_msgSend(v11, "setLargeListViewDisclosingEventDetails:", 1);

      }
      else if (height > EKUIHeightForWindowSizeParadigm(0x4000, v10))
      {
        -[MultiColumnMonthViewController _slideToAnimatePalleteShowingBackButton:animated:](self, "_slideToAnimatePalleteShowingBackButton:animated:", -[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn"), 1);
      }
      -[MultiColumnMonthViewController viewWillAppear:](self, "viewWillAppear:", 1);
      self->_isRotating = 0;
    }
  }

}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v10)
  {
    if (a5)
      -[MultiColumnMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", v10, v8, a5, v11);
  }
  else
  {
    v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Month View.", v13, 2u);
    }
  }

}

- (double)palleteViewXOffset
{
  void *v4;
  double MidX;
  CGRect v6;

  if ((CalInterfaceIsLeftToRight(self) & 1) != 0)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v6);

  return MidX;
}

- (void)updatePalette:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  objc_storeStrong((id *)&self->_palette, a3);
  v5 = a3;
  objc_msgSend(v5, "setWeekdayHeaderFillsHalfWidth:", 1);
  objc_msgSend(v5, "setNeedsLayout");
  v10.receiver = self;
  v10.super_class = (Class)MultiColumnMonthViewController;
  -[CompactMonthViewController updatePalette:](&v10, "updatePalette:", v5);
  objc_msgSend(v5, "setTodayButtonVisible:", 1);
  objc_msgSend(v5, "setDateStringVisible:", 1);
  objc_msgSend(v5, "setFocusBannerPlacement:", 2);
  objc_msgSend(v5, "setOpaqueBackground:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "frame");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containingPalette"));

  objc_msgSend(v9, "setPreferredHeight:", v8);
}

- (id)bestDateForNewEvent
{
  return -[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate");
}

- (int)supportedToggleMode
{
  return 0;
}

- (void)updateNavigationBarDisplayedDateString
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  MultiColumnMonthViewController *v9;
  void *v10;
  EKCalendarDate *navigationBarDisplayedDate;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedDate"));

  if (v4)
  {
    if (!self->_navigationBarDisplayedDate
      || (v5 = objc_msgSend(v4, "month"), v5 != -[EKCalendarDate month](self->_navigationBarDisplayedDate, "month"))
      || (v6 = objc_msgSend(v4, "year"), v6 != -[EKCalendarDate year](self->_navigationBarDisplayedDate, "year")))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController navigationController](self, "navigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topMainViewControllerContainer"));
      v9 = (MultiColumnMonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentChildViewController"));

      if (v9 == self)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController navigationController](self, "navigationController"));
        objc_msgSend(v10, "setNavBarStringFromDate:includeMonth:includeYear:", v4, 1, 1);

      }
    }
  }
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = (EKCalendarDate *)v4;

}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MultiColumnMonthViewController;
    v5 = -[MonthViewController preferredPreSizeClassTransitionSelectedDate](&v7, "preferredPreSizeClassTransitionSelectedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (BOOL)_monthWeekViewsUseVerticalCompression
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v3 = objc_msgSend(v2, "verticalSizeClass") == (id)1;

  return v3;
}

- (BOOL)_monthWeekViewsUseHorizontalCompression
{
  return 1;
}

- (unint64_t)maximumCachedReusableViews
{
  return 18;
}

- (id)createInitialViewForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  CompactMonthWeekView *v8;
  CompactMonthWeekView *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = objc_msgSend(v4, "day");
  v6 = v4;
  if (v5 != (id)1)
  {
    v7 = objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  v8 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v8)
  {
    v9 = v8;
    -[CompactMonthWeekView setCompressedVerticalMode:](v8, "setCompressedVerticalMode:", -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));
    -[CompactMonthWeekView setCalendarDate:](v9, "setCalendarDate:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v9 = -[CompactMonthWeekView initWithCalendarDate:calendar:compressed:]([CompactMonthWeekView alloc], "initWithCalendarDate:calendar:compressed:", v6, v10, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));

  }
  -[CompactMonthWeekView setUseLayoutMargins:](v9, "setUseLayoutMargins:", 1);
  if (!self->_selectedMonthWeekView)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v9, "calendarDate"));
    objc_msgSend(v11, "absoluteTime");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v14, "absoluteTime");
    if (v13 > v15)
    {

LABEL_11:
      goto LABEL_12;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v16, "absoluteTime");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v9, "endCalendarDate"));
    objc_msgSend(v19, "absoluteTime");
    v21 = v20;

    if (v18 <= v21)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v11, v9, 0);
      goto LABEL_11;
    }
  }
LABEL_12:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v9, "calendarDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v9, "endCalendarDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _loadEventsForStartDate:endDate:](self, "_loadEventsForStartDate:endDate:", v22, v23));
  -[CompactMonthWeekView setEventData:](v9, "setEventData:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  -[CompactMonthWeekView setShowWeekNumber:](v9, "setShowWeekNumber:", objc_msgSend(v25, "showWeekNumbers"));

  return v9;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  void *v4;
  CompactMonthWeekView *v5;
  CompactMonthWeekView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", a3));
  v5 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v5)
  {
    v6 = v5;
    -[CompactMonthWeekView setCompressedVerticalMode:](v5, "setCompressedVerticalMode:", -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));
    -[CompactMonthWeekView setCalendarDate:](v6, "setCalendarDate:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v6 = -[CompactMonthWeekView initWithCalendarDate:calendar:compressed:]([CompactMonthWeekView alloc], "initWithCalendarDate:calendar:compressed:", v4, v7, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));

  }
  -[CompactMonthWeekView setUseLayoutMargins:](v6, "setUseLayoutMargins:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v6, "calendarDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v6, "endCalendarDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _loadEventsForStartDate:endDate:](self, "_loadEventsForStartDate:endDate:", v8, v9));
  -[CompactMonthWeekView setEventData:animated:](v6, "setEventData:animated:", v10, -[MultiColumnMonthViewController _shouldAnimateDots](self, "_shouldAnimateDots"));

  if (!self->_selectedMonthWeekView)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v6, "calendarDate"));
    objc_msgSend(v11, "absoluteTime");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v14, "absoluteTime");
    if (v13 > v15)
    {

LABEL_9:
      goto LABEL_10;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v16, "absoluteTime");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v6, "endCalendarDate"));
    objc_msgSend(v19, "absoluteTime");
    v21 = v20;

    if (v18 <= v21)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v11, v6, 0);
      goto LABEL_9;
    }
  }
LABEL_10:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  -[CompactMonthWeekView setShowWeekNumber:](v6, "setShowWeekNumber:", objc_msgSend(v22, "showWeekNumbers"));

  return v6;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  void *v4;
  CompactMonthWeekView *v5;
  CompactMonthWeekView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", a3));
  v5 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v5)
  {
    v6 = v5;
    -[CompactMonthWeekView setCompressedVerticalMode:](v5, "setCompressedVerticalMode:", -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));
    -[CompactMonthWeekView setCalendarDate:](v6, "setCalendarDate:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v6 = -[CompactMonthWeekView initWithCalendarDate:calendar:compressed:]([CompactMonthWeekView alloc], "initWithCalendarDate:calendar:compressed:", v4, v7, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));

  }
  -[CompactMonthWeekView setUseLayoutMargins:](v6, "setUseLayoutMargins:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v6, "calendarDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v6, "endCalendarDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _loadEventsForStartDate:endDate:](self, "_loadEventsForStartDate:endDate:", v8, v9));
  -[CompactMonthWeekView setEventData:animated:](v6, "setEventData:animated:", v10, -[MultiColumnMonthViewController _shouldAnimateDots](self, "_shouldAnimateDots"));

  if (!self->_selectedMonthWeekView)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v6, "calendarDate"));
    objc_msgSend(v11, "absoluteTime");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v14, "absoluteTime");
    if (v13 < v15)
    {

LABEL_9:
      goto LABEL_10;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v16, "absoluteTime");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](v6, "endCalendarDate"));
    objc_msgSend(v19, "absoluteTime");
    v21 = v20;

    if (v18 <= v21)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v11, v6, 0);
      goto LABEL_9;
    }
  }
LABEL_10:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  -[CompactMonthWeekView setShowWeekNumber:](v6, "setShowWeekNumber:", objc_msgSend(v22, "showWeekNumbers"));

  return v6;
}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return 0;
}

- (void)didEndScrolling
{
  dispatch_time_t v3;
  void *v4;
  CompactMonthWeekView *v5;
  void *v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController didEndScrolling](&v8, "didEndScrolling");
  if (self->_eventLoadingSuspendedForScroll && !self->_reloadAfterStoppedScrolling)
  {
    self->_eventLoadingSuspendedForScroll = 0;
    self->_reloadAfterStoppedScrolling = 1;
    v3 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F165C;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (self->_currentlyVisible)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v5 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));

    if (v5 != self->_selectedMonthWeekView)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v6, v5, 1);

    }
    -[MultiColumnMonthViewController updateNavigationBarDisplayedDateString](self, "updateNavigationBarDisplayedDateString");

  }
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y;
  CompactMonthWeekView *v7;
  double v8;
  CompactMonthWeekView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  objc_super v73;

  y = a3.y;
  v73.receiver = self;
  v73.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController willEndDraggingWithVelocity:targetContentOffset:](&v73, "willEndDraggingWithVelocity:targetContentOffset:", a3.x);
  v7 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v8 = -y;
  if (y >= 0.0)
    v8 = y;
  if (v8 <= 0.3)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v33, "contentOffset");
    v35 = v34;
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v38, "frame");
    v40 = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v41, "safeAreaInsets");
    v43 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v44, "safeAreaInsets");
    v46 = v40 - (v43 + v45);

    v71 = 0;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v71, v35, v37 + v46 * 0.5);
    v48 = v47;
    v50 = v49;
    v32 = v71;
    a4->x = v48;
    a4->y = v50;
    v9 = v7;
  }
  else
  {
    v9 = self->_selectedMonthWeekView;
    if (!v9)
      v9 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstView](self, "firstView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v11 = v10;
    if (y > 0.0)
      v12 = 1;
    else
      v12 = -1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateByAddingMonths:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForMonth"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v9, "calendarDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:toDate:options:", 0x2000, v17, v18, 0));

    -[CompactMonthWeekView frame](v9, "frame");
    v21 = v20;
    -[CompactMonthWeekView frame](v9, "frame");
    v23 = v22;
    v24 = y <= 0.0;
    v26 = v25 + (double)(uint64_t)objc_msgSend(v19, "weekOfYear") * v21;
    if (v24)
    {
      +[CompactMonthWeekView headerHeight](CompactMonthWeekView, "headerHeight");
      v26 = v26 - v27;
    }
    v72 = v14;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v72, v23, v26);
    v29 = v28;
    v31 = v30;
    v32 = v72;

    a4->x = v29;
    a4->y = v31;

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v52 = objc_msgSend(v51, "month");
  if (v52 == objc_msgSend(v32, "month"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v54 = objc_msgSend(v53, "year");
    v55 = objc_msgSend(v32, "year");

    if (v54 == v55)
    {
      v58 = v32;
      goto LABEL_25;
    }
  }
  else
  {

  }
  v59 = CUIKTodayDate(v56, v57);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "timeZone"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v60, v62));

  v64 = objc_msgSend(v63, "month");
  if (v64 == objc_msgSend(v32, "month") && (v65 = objc_msgSend(v63, "year"), v65 == objc_msgSend(v32, "year")))
    v66 = v63;
  else
    v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "calendarDateForMonth"));
  v58 = v66;

  self->_listViewContainerDidScrollMessagesSuppressed = 1;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v67, "setSelectedDate:", v58);

  self->_listViewContainerDidScrollMessagesSuppressed = 0;
  if (self->_currentlyVisible)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v68));

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v70, v69, 1);

    -[MultiColumnMonthViewController updateNavigationBarDisplayedDateString](self, "updateNavigationBarDisplayedDateString");
  }

LABEL_25:
  -[MultiColumnMonthViewController _scrollListToNewSelectedDateAnimated:](self, "_scrollListToNewSelectedDateAnimated:", 1);

}

- (BOOL)showsYearInMonthLabel
{
  return 1;
}

- (void)didScroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MultiColumnMonthViewController;
  -[CompactMonthViewController didScroll](&v3, "didScroll");
  self->_reloadAfterStoppedScrolling = 0;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[MultiColumnMonthViewController showDate:animated:completionBlock:](self, "showDate:animated:completionBlock:", a3, a4, 0);
  -[MultiColumnMonthViewController _scrollListToNewSelectedDateAnimated:](self, "_scrollListToNewSelectedDateAnimated:", v4);
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v9, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForMonth"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F1CDC;
  v19[3] = &unk_1001B2D00;
  v19[4] = self;
  v20 = v8;
  v15 = v8;
  v16 = objc_retainBlock(v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
  v18.receiver = self;
  v18.super_class = (Class)MultiColumnMonthViewController;
  -[InfiniteScrollViewController showDate:animated:completionBlock:](&v18, "showDate:animated:completionBlock:", v17, v5, v16);

}

- (void)infiniteScrollViewSafeAreasDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v3, "layoutSublayersOfLayer:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)_tapGestureCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000F1F5C;
  v18 = sub_1000F1F6C;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000F1F74;
  v11 = &unk_1001B38F8;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);

  -[MultiColumnMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7, v8, v9, v10, v11);
  -[MultiColumnMonthViewController monthView:gestureEnded:](self, "monthView:gestureEnded:", v15[5], v7);

  _Block_object_dispose(&v14, 8);
}

- (void)_scrubGestureCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000F1F5C;
  v18 = sub_1000F1F6C;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000F21B4;
  v11 = &unk_1001B38F8;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);

  switch((unint64_t)objc_msgSend(v7, "state", v8, v9, v10, v11))
  {
    case 1uLL:
      -[MultiColumnMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7);
      break;
    case 2uLL:
      -[MultiColumnMonthViewController monthView:gestureChanged:](self, "monthView:gestureChanged:", v15[5], v7);
      break;
    case 3uLL:
      -[MultiColumnMonthViewController monthView:gestureEnded:](self, "monthView:gestureEnded:", v15[5], v7);
      break;
    case 4uLL:
    case 5uLL:
      -[MultiColumnMonthViewController monthView:gestureCancelled:](self, "monthView:gestureCancelled:", v15[5], v7);
      break;
    default:
      break;
  }

  _Block_object_dispose(&v14, 8);
}

- (void)_scrollListToNewSelectedDateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  ListViewController *multiDayListViewController;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v3 = a3;
  self->_listViewContainerDidScrollMessagesSuppressed = 1;
  multiDayListViewController = self->_multiDayListViewController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  -[ListViewController scrollToDate:animated:](multiDayListViewController, "scrollToDate:animated:", v7, v3);

  v8 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2344;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_viewFromGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000F1F5C;
  v17 = sub_1000F1F6C;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F2470;
  v12[3] = &unk_1001B2730;
  v12[6] = v7;
  v12[7] = v9;
  v12[4] = self;
  v12[5] = &v13;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)monthView:(id)a3 gestureBegan:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CompactMonthWeekView *v19;

  v19 = (CompactMonthWeekView *)a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v8 = objc_msgSend(v7, "isDecelerating");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v19, v6));
    if (v9)
    {
      if (self->_pressedMonthView != v19 || objc_msgSend(v9, "compare:", self->_pressedDay))
      {
        -[MultiColumnMonthViewController _createMonthHighlightForMonthView:day:](self, "_createMonthHighlightForMonthView:day:", v19, v9);
        -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 1);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v10, "setScrollEnabled:", 0);

      -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v9);
      v11 = -[MultiColumnMonthViewController _scrollListToNewSelectedDateAnimated:](self, "_scrollListToNewSelectedDateAnimated:", 0);
      v13 = CUIKTodayDate(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v14, v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v17));

      if (v18)
        objc_msgSend(v18, "haltTodayPulse");

    }
  }

}

- (void)monthView:(id)a3 gestureChanged:(id)a4
{
  CompactMonthWeekView *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  _BOOL8 v11;
  char v12;
  CompactMonthWeekView *v13;

  v6 = (CompactMonthWeekView *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v9 = objc_msgSend(v8, "isDecelerating");

  if ((v9 & 1) != 0)
  {
    v13 = v6;
  }
  else
  {
    v13 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _viewFromGesture:](self, "_viewFromGesture:", v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v13, v7));
    v11 = v13 == self->_pressedMonthView && -[EKCalendarDate compare:](self->_pressedDay, "compare:", v10) == 0;
    if (v11 != -[TappableDayNumber isSelected](self->_pressHighlight, "isSelected"))
      -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", v11);
    if (v10)
      v12 = v11;
    else
      v12 = 1;
    if ((v12 & 1) == 0)
    {
      -[MultiColumnMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
      -[MultiColumnMonthViewController _createMonthHighlightForMonthView:day:](self, "_createMonthHighlightForMonthView:day:", v13, v10);
      -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 1);
      -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v10);
      -[MultiColumnMonthViewController _scrollListToNewSelectedDateAnimated:](self, "_scrollListToNewSelectedDateAnimated:", 0);
    }

  }
}

- (void)monthView:(id)a3 gestureEnded:(id)a4
{
  CompactMonthWeekView *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  CompactMonthWeekView *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  void *v16;
  dispatch_time_t v17;
  _QWORD block[5];

  v6 = (CompactMonthWeekView *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v9 = objc_msgSend(v8, "isDecelerating");

  if ((v9 & 1) == 0)
  {
    v10 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _viewFromGesture:](self, "_viewFromGesture:", v7));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v10, v7));
    v12 = v11;
    if (v10 != self->_pressedMonthView || v11 == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v14, "setScrollEnabled:", 1);

    }
    else
    {
      v15 = objc_msgSend(v11, "compare:", self->_pressedDay);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v16, "setScrollEnabled:", 1);

      if (!v15)
      {
        -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v12);
        -[MultiColumnMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
        -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v12, v10, 0);
        -[MultiColumnMonthViewController _scrollListToNewSelectedDateAnimated:](self, "_scrollListToNewSelectedDateAnimated:", 1);
        goto LABEL_12;
      }
    }
    -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 0);
    v17 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F2A70;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
LABEL_12:

    goto LABEL_13;
  }
  v10 = v6;
LABEL_13:

}

- (void)monthView:(id)a3 gestureCancelled:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView", a3, a4));
  objc_msgSend(v5, "setScrollEnabled:", 1);

  -[MultiColumnMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
}

- (id)_dayInMonth:(id)a3 fromGesture:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a4, "locationInView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dayForPoint:"));

  return v6;
}

- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4
{
  CompactMonthWeekView *v6;
  EKCalendarDate *v7;
  EKCalendarDate *pressedDay;
  CompactMonthWeekView *pressedMonthView;
  CompactMonthWeekView *v10;
  EKCalendarDate *v11;

  v6 = (CompactMonthWeekView *)a3;
  v7 = (EKCalendarDate *)a4;
  -[MultiColumnMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
  pressedDay = self->_pressedDay;
  self->_pressedDay = v7;
  v11 = v7;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = v6;
  v10 = v6;

  -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v11, v10, 0);
}

- (void)_removeMonthHighlight
{
  TappableDayNumber *v3;
  TappableDayNumber *pressHighlight;
  EKCalendarDate *pressedDay;
  CompactMonthWeekView *pressedMonthView;
  TappableDayNumber *v7;
  _QWORD v8[4];
  TappableDayNumber *v9;
  _QWORD v10[4];
  TappableDayNumber *v11;

  -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", 0, self->_selectedMonthWeekView, 0);
  v3 = self->_pressHighlight;
  pressHighlight = self->_pressHighlight;
  self->_pressHighlight = 0;

  pressedDay = self->_pressedDay;
  self->_pressedDay = 0;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = 0;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F2CB8;
  v10[3] = &unk_1001B2538;
  v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F2CC4;
  v8[3] = &unk_1001B25D0;
  v9 = v11;
  v7 = v11;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v8, 0.2);

}

- (void)_setSelectedDay:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  -[MultiColumnMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v5, v6, 0);

}

- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  CompactMonthWeekView *v8;
  CompactMonthWeekView **p_selectedMonthWeekView;
  CompactMonthWeekView *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = (CompactMonthWeekView *)a4;
  p_selectedMonthWeekView = &self->_selectedMonthWeekView;
  if (*p_selectedMonthWeekView != v8)
  {
    -[CompactMonthWeekView setSelectedDay:animated:](*p_selectedMonthWeekView, "setSelectedDay:animated:", 0, 0);
    v10 = *p_selectedMonthWeekView;
    *p_selectedMonthWeekView = 0;

  }
  if (v11 && v8)
  {
    -[CompactMonthWeekView setSelectedDay:animated:](v8, "setSelectedDay:animated:", v11, v5);
    objc_storeStrong((id *)p_selectedMonthWeekView, a4);
  }

}

- (double)_listviewColumnCollapsedWidth
{
  void *v2;
  double Width;
  double v4;
  CGRect v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v6);
  v4 = EKUIGoldenRatioColumnWidthMinor(Width);

  return v4;
}

- (void)_cachedOccurrencesChanged:(id)a3
{
  if (self->_currentlyVisible)
    -[MultiColumnMonthViewController _loadEventsForAllSubviews](self, "_loadEventsForAllSubviews", a3);
  else
    self->_needToReloadEventsOnAppear = 1;
}

- (void)_occurrencesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_currentlyVisible)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));

    -[MultiColumnMonthViewController _loadEventsForViewsInRangeStartingAt:endingAt:](self, "_loadEventsForViewsInRangeStartingAt:endingAt:", v8, v7);
  }
  else
  {
    self->_needToReloadEventsOnAppear = 1;
  }
}

- (void)_loadEventsForViewsInRangeStartingAt:(id)a3 endingAt:(id)a4
{
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];

  v6 = a3;
  v7 = a4;
  if (!self->_eventLoadingSuspendedForScroll)
  {
    -[MultiColumnMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
    if (v8 < 0.0)
      v8 = -v8;
    if (v8 >= 1.0)
    {
      self->_eventLoadingSuspendedForScroll = 1;
    }
    else
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v10 = v9;
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F3024;
      v12[3] = &unk_1001B3920;
      v12[5] = v11;
      v12[6] = v10;
      v12[4] = self;
      -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v12);
    }
  }

}

- (void)_loadEventsForAllSubviews
{
  double v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  if (self->_currentlyVisible)
  {
    -[MultiColumnMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
    if (v3 < 0.0)
      v3 = -v3;
    v4 = 350;
    if (v3 < 0.4)
    {
      self->_eventLoadingSuspendedForScroll = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000F31F4;
      v6[3] = &unk_1001B2798;
      v6[4] = self;
      -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v6);
      -[MultiColumnMonthViewController _refreshListView](self, "_refreshListView");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v5, "startNotificationMonitor");

      return;
    }
  }
  else
  {
    v4 = 349;
  }
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa + v4) = 1;
}

- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  const void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  BOOL v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  void *v49;
  char *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  dispatch_queue_global_t global_queue;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  _BYTE *v66;
  uint64_t v67;
  void *v68;
  id v69;
  char *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *i;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char *v89;
  void *v90;
  void *v91;
  void *v92;
  char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD block[5];
  void *v104;
  void *v105;
  _BYTE v106[128];

  v6 = a3;
  v7 = a4;
  if (self->_eventLoadingSuspendedForScroll)
  {
    v8 = 0;
LABEL_43:
    v11 = v7;
    v10 = v6;
    goto LABEL_44;
  }
  -[MultiColumnMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 1.0)
  {
    v8 = 0;
    self->_eventLoadingSuspendedForScroll = 1;
    goto LABEL_43;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForDay"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDateForEndOfDay"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v12 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "timeZone"));
  objc_msgSend(v10, "absoluteTime");
  v14 = v13;
  objc_msgSend(v11, "absoluteTime");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
  v104 = 0;
  v105 = 0;
  CalEventOccurrenceCacheCopyBoundsForTimeZone(v12, &v105, &v104);
  if (v12)
    CFRelease(v12);
  v19 = v105;
  v94 = v104;
  v20 = (unint64_t)objc_msgSend(v11, "differenceInDays:", v10);
  v21 = (char *)(v20 + 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v20 + 1));
  if ((v20 & 0x8000000000000000) == 0)
  {
    do
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekDayData dayDataWithEventCount:dayType:](CompactMonthWeekDayData, "dayDataWithEventCount:dayType:", 0, 0));
      objc_msgSend(v22, "addObject:", v23);

      --v21;
    }
    while (v21);
  }
  v91 = v11;
  if (objc_msgSend(v17, "compare:", v19) == (id)1 && objc_msgSend(v18, "compare:", v94) == (id)-1)
  {
    if ((-[CUIKCalendarModel cachedOccurrencesAreLoaded](self->super.super.super.super._model, "cachedOccurrencesAreLoaded") & 1) == 0)
    {
      if (!self->_loadingOccurrenceCache)
      {
        self->_loadingOccurrenceCache = 1;
        global_queue = dispatch_get_global_queue(0, 0);
        v60 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000F3AF8;
        block[3] = &unk_1001B2538;
        block[4] = self;
        dispatch_async(v60, block);

      }
      v8 = 0;
      goto LABEL_41;
    }
    v52 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:](self->super.super.super.super._model, "sectionForCachedOccurrencesOnDate:", v17);
    v89 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:](self->super.super.super.super._model, "sectionForCachedOccurrencesOnDate:", v18);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v52));
    objc_msgSend(v53, "timeIntervalSinceReferenceDate");
    v55 = v54;

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v89));
    objc_msgSend(v56, "timeIntervalSinceReferenceDate");
    v58 = v57;

    if (v55 >= v14)
    {
      if (v58 > v16)
        --v89;
    }
    else
    {
      ++v52;
    }
    if ((uint64_t)v52 <= (uint64_t)v89)
    {
      v96 = v17;
      v86 = v19;
      v88 = v18;
      do
      {
        v61 = (uint64_t)-[CUIKCalendarModel numberOfCachedOccurrencesInSection:](self->super.super.super.super._model, "numberOfCachedOccurrencesInSection:", v52);
        if (v61 >= 1)
        {
          v62 = v61;
          v63 = v18;
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel cachedSpecialDayDataForSection:](self->super.super.super.super._model, "cachedSpecialDayDataForSection:", v52));
          v93 = v52;
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v52));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "components:fromDate:", 30));
          v65 = objc_msgSend(v64, "month");
          if (v65 == objc_msgSend(v10, "month"))
          {
            v66 = objc_msgSend(v64, "day");
            v67 = v66 - (_BYTE *)objc_msgSend(v10, "day");
            if (v67 >= 0 && v67 < (uint64_t)objc_msgSend(v22, "count"))
            {
              v83 = v67;
              v84 = v64;
              if (v92)
              {
                v68 = v92;
                v69 = objc_msgSend(v92, "dayType");
                v70 = v93;
              }
              else
              {
                v69 = 0;
                v70 = v93;
                v68 = 0;
              }
              v71 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekDayData dayDataWithEventCount:dayType:](CompactMonthWeekDayData, "dayDataWithEventCount:dayType:", v62, v69));
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "color"));
              objc_msgSend(v71, "setDayTypeBadgeColor:", v72);

              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "locale"));
              v82 = v71;
              objc_msgSend(v71, "setDayTypeBadgeLocale:", v73);

              v74 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel cachedOccurrencesForSection:](self->super.super.super.super._model, "cachedOccurrencesForSection:", v70));
              v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v74, "count")));
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v76 = v74;
              v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
              if (v77)
              {
                v78 = v77;
                v79 = *(_QWORD *)v100;
                do
                {
                  for (i = 0; i != v78; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v100 != v79)
                      objc_enumerationMutation(v76);
                    v81 = (void *)objc_claimAutoreleasedReturnValue(+[EventSummaryData eventSummaryDataFromEKEvent:](EventSummaryData, "eventSummaryDataFromEKEvent:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i)));
                    objc_msgSend(v75, "addObject:", v81);

                  }
                  v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
                }
                while (v78);
              }

              objc_msgSend(v82, "setEventSummaryData:", v75);
              objc_msgSend(v22, "setObject:atIndexedSubscript:", v82, v83);

              v19 = v86;
              v63 = v88;
              v64 = v84;
            }
          }

          v52 = v93;
          v18 = v63;
          v17 = v96;
        }
        v39 = v52++ == v89;
      }
      while (!v39);
    }
  }
  else
  {
    v85 = v19;
    v87 = v18;
    v95 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self->super.super.super.super._model, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v17, v18, 1, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "occurrences"));

    v26 = (uint64_t)objc_msgSend(v25, "count");
    if (v26 >= 1)
    {
      v27 = v26;
      v28 = 0;
      v97 = v25;
      do
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", v28));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
        objc_msgSend(v30, "timeIntervalSinceReferenceDate");
        v32 = v31;

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
        objc_msgSend(v33, "timeIntervalSinceReferenceDate");
        v35 = v34;

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endCalendarDate"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allComponents"));

        if (!objc_msgSend(v37, "hour") && !objc_msgSend(v37, "minute"))
        {
          v38 = objc_msgSend(v37, "second");
          v39 = v32 != v35 && v38 == 0;
          if (v39)
            v35 = v35 + -1.0;
        }
        if (v32 > v16 || v35 < v14)
        {
          v46 = v37;
        }
        else
        {
          v40 = v27;
          if (v32 >= v14)
            v41 = v32;
          else
            v41 = v14;
          if (v35 <= v16)
            v42 = v35;
          else
            v42 = v16;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v41));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "components:fromDate:", 30, v43));

          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v42));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "components:fromDate:", 30, v45));

          v47 = (char *)objc_msgSend(v44, "day");
          if ((uint64_t)v47 <= (uint64_t)objc_msgSend(v46, "day"))
          {
            do
            {
              v48 = v47 - (_BYTE *)objc_msgSend(v10, "day");
              if (v48 >= 0 && v48 < (uint64_t)objc_msgSend(v22, "count"))
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v48));
                objc_msgSend(v49, "setEventCount:", (char *)objc_msgSend(v49, "eventCount") + 1);
                objc_msgSend(v49, "setDayType:", 0);
                objc_msgSend(v49, "setDayTypeBadgeColor:", 0);
                objc_msgSend(v49, "setDayTypeBadgeLocale:", 0);
                if (v48 < (uint64_t)objc_msgSend(v22, "count"))
                  objc_msgSend(v22, "setObject:atIndexedSubscript:", v49, v48);

              }
            }
            while ((uint64_t)v47++ < (uint64_t)objc_msgSend(v46, "day"));
          }

          v27 = v40;
          v25 = v97;
        }

        ++v28;
      }
      while (v28 != v27);
    }

    v17 = v95;
    v19 = v85;
    v18 = v87;
  }
  v8 = v22;
  v11 = v91;
LABEL_41:

LABEL_44:
  return v8;
}

- (BOOL)_shouldAnimateDots
{
  double v2;

  -[MultiColumnMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
  if (v2 < 0.0)
    v2 = -v2;
  return v2 < 0.05;
}

- (double)_scrollViewVerticalVelocity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  if ((objc_msgSend(v3, "isDragging") & 1) != 0)
    goto LABEL_6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  if ((objc_msgSend(v4, "isTracking") & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v6, "_verticalVelocity");
    v8 = v7;

    return v8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  if (objc_msgSend(v5, "isDecelerating"))
  {

    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v11 = objc_msgSend(v10, "isScrollAnimating");

  if ((v11 & 1) != 0)
    goto LABEL_7;
  return 0.0;
}

- (BOOL)_allowedToDisplayEventDetailsColumn
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  if (EKUICurrentHeightSizeClassIsRegular())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v4 = objc_msgSend(v3, "showExperimentalUI");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_viewingEventDetailsColumn
{
  if (self->_viewingEventDetailsColumn)
    return -[MultiColumnMonthViewController _allowedToDisplayEventDetailsColumn](self, "_allowedToDisplayEventDetailsColumn");
  else
    return 0;
}

- (void)_createEventDetailsColumn
{
  void *v3;
  UINavigationController *v4;
  UINavigationController *eventDetailsColumnNavigationController;
  void *v6;
  LargeDayNavigationWrapperView *v7;
  void *v8;
  LargeDayNavigationWrapperView *v9;
  LargeDayNavigationWrapperView *navigationWrapperView;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationWrapperView superview](self->_navigationWrapperView, "superview"));

  if (!v3)
  {
    v4 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    eventDetailsColumnNavigationController = self->_eventDetailsColumnNavigationController;
    self->_eventDetailsColumnNavigationController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_eventDetailsColumnNavigationController, "view"));
    objc_msgSend(v6, "setClipsToBounds:", 1);

    v7 = [LargeDayNavigationWrapperView alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_eventDetailsColumnNavigationController, "view"));
    v9 = -[LargeDayNavigationWrapperView initWithNavigationView:](v7, "initWithNavigationView:", v8);
    navigationWrapperView = self->_navigationWrapperView;
    self->_navigationWrapperView = v9;

    -[LargeDayNavigationWrapperView setClipsToBounds:](self->_navigationWrapperView, "setClipsToBounds:", 1);
    -[MultiColumnMonthViewController addChildViewController:](self, "addChildViewController:", self->_eventDetailsColumnNavigationController);
    -[UINavigationController didMoveToParentViewController:](self->_eventDetailsColumnNavigationController, "didMoveToParentViewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    objc_msgSend(v11, "addSubview:", self->_navigationWrapperView);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    objc_msgSend(v12, "sendSubviewToBack:", self->_navigationWrapperView);

    -[MultiColumnMonthViewController _updateEventDetailsColumnViewFrame](self, "_updateEventDetailsColumnViewFrame");
  }
}

- (void)_updateEventDetailsColumnViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  unsigned int v13;
  double MaxX;
  double v15;
  double MidX;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  if (!CGRectIsEmpty(v17))
  {
    if (-[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns")
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences")),
          v13 = objc_msgSend(v12, "largeListViewDisclosingEventDetails"),
          v12,
          v13))
    {
      -[UIView frame](self->_dividerLineBetweenListAndEventDetails, "frame");
      MaxX = CGRectGetMaxX(v18);
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      v15 = CGRectGetMaxX(v19);
      -[UIView frame](self->_dividerLineBetweenListAndEventDetails, "frame");
      MidX = v15 - CGRectGetMaxX(v20);
    }
    else
    {
      v21.origin.x = v5;
      v21.origin.y = v7;
      v21.size.width = v9;
      v21.size.height = v11;
      MaxX = CGRectGetMaxX(v21);
      v22.origin.x = v5;
      v22.origin.y = v7;
      v22.size.width = v9;
      v22.size.height = v11;
      MidX = CGRectGetMidX(v22);
    }
    -[LargeDayNavigationWrapperView setFrame:](self->_navigationWrapperView, "setFrame:", MaxX, v7, MidX, v11);
  }
}

- (void)_slideToShowEventDetails:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  UIViewController **p_currentDetailsView;
  UIViewController *currentDetailsView;
  uint64_t v10;
  UIViewController *v11;
  dispatch_time_t v12;
  UIViewController *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  NSObject *v35;
  _QWORD v36[5];
  _QWORD block[5];
  UIViewController *v38;
  BOOL v39;
  uint8_t buf[16];

  v4 = a4;
  v7 = a3;
  if (-[MultiColumnMonthViewController _allowedToDisplayEventDetailsColumn](self, "_allowedToDisplayEventDetailsColumn"))
  {
    -[MultiColumnMonthViewController _createEventDetailsColumn](self, "_createEventDetailsColumn");
    p_currentDetailsView = &self->_currentDetailsView;
    objc_storeStrong((id *)&self->_currentDetailsView, a3);
    currentDetailsView = self->_currentDetailsView;
    objc_opt_class(EKEventViewController);
    if ((objc_opt_isKindOfClass(currentDetailsView, v10) & 1) != 0)
    {
      v11 = *p_currentDetailsView;
      -[UIViewController setAllowsCalendarPreview:](v11, "setAllowsCalendarPreview:", 1);
      -[UIViewController setCalendarPreviewIsInlineDayView:](v11, "setCalendarPreviewIsInlineDayView:", 1);
      -[UIViewController setShowsDoneButton:](v11, "setShowsDoneButton:", 0);
      -[UIViewController setEditorShowTransition:](v11, "setEditorShowTransition:", 6);
      v12 = dispatch_time(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F4310;
      block[3] = &unk_1001B2EC8;
      block[4] = self;
      v38 = v11;
      v39 = v4;
      v13 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentedViewController](self->_eventDetailsColumnNavigationController, "presentedViewController"));
    objc_opt_class(EKEventEditViewController);
    isKindOfClass = objc_opt_isKindOfClass(v14, v15);

    if ((isKindOfClass & 1) != 0)
      -[UINavigationController dismissViewControllerWithTransition:completion:](self->_eventDetailsColumnNavigationController, "dismissViewControllerWithTransition:completion:", 0, 0);
    v17 = -[UINavigationController popToRootViewControllerAnimated:](self->_eventDetailsColumnNavigationController, "popToRootViewControllerAnimated:", 0);
    -[UINavigationController pushViewController:animated:](self->_eventDetailsColumnNavigationController, "pushViewController:animated:", *p_currentDetailsView, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](*p_currentDetailsView, "navigationItem"));
    objc_msgSend(v18, "setHidesBackButton:", 1);

    -[UINavigationController setNavigationBarHidden:](self->_eventDetailsColumnNavigationController, "setNavigationBarHidden:", 0);
    -[MultiColumnMonthViewController viewWillLayoutSubviews](self, "viewWillLayoutSubviews");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_currentDetailsView, "view"));
    objc_msgSend(v19, "layoutMargins");
    v21 = v20;
    v23 = v22;

    -[MultiColumnMonthViewController detailsRightInsetAdjustment](self, "detailsRightInsetAdjustment");
    v25 = v24;
    -[MultiColumnMonthViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
    v27 = v25 + v26;
    -[MultiColumnMonthViewController detailsLeftInsetAdjustment](self, "detailsLeftInsetAdjustment");
    v29 = v28;
    -[MultiColumnMonthViewController rightSplitViewSideInset](self, "rightSplitViewSideInset");
    v31 = v29 + v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_currentDetailsView, "view"));
    objc_msgSend(v32, "setLayoutMargins:", v21, v31, v23, v27);

    if (!-[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      objc_msgSend(v33, "setLargeListViewDisclosingEventDetails:", 1);

      self->_viewingEventDetailsColumn = 1;
      if (!-[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns"))
        -[MultiColumnMonthViewController _slideToAnimatePalleteShowingBackButton:animated:](self, "_slideToAnimatePalleteShowingBackButton:animated:", 1, v4);
      v34 = 0.0;
      if (v4)
        v34 = 0.5;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000F4364;
      v36[3] = &unk_1001B2538;
      v36[4] = self;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v36, &stru_1001B55C0, v34, 0.0, 2.0, 0.0);
    }
  }
  else
  {
    v35 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "MultiColumnMonthViewController tried to slide panels without preference enabled.", buf, 2u);
    }
  }

}

- (void)_slideToAnimatePalleteShowingBackButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  v4 = a4;
  -[UIButton setHidden:](self->_cancelEventDetailViewModeButton, "setHidden:", 0);
  -[UIButton setAlpha:](self->_cancelEventDetailViewModeButton, "setAlpha:", 0.0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F44DC;
  v11[3] = &unk_1001B2510;
  v12 = a3;
  v11[4] = self;
  v7 = objc_retainBlock(v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F4528;
  v9[3] = &unk_1001B3790;
  v10 = a3;
  v9[4] = self;
  v8 = objc_retainBlock(v9);
  if (v4)
  {
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v7, v8, 0.5, 0.0, 2.0, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v7[2])(v7);
    ((void (*)(_QWORD *, uint64_t))v8[2])(v8, 1);
  }

}

- (void)_slideToHideEventDetailsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = a3;
  if (-[MultiColumnMonthViewController _allowedToDisplayEventDetailsColumn](self, "_allowedToDisplayEventDetailsColumn"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self->_multiDayListViewController, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self->_multiDayListViewController, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedRow"));
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v8, "setLargeListViewDisclosingEventDetails:", 0);

    self->_viewingEventDetailsColumn = 0;
    -[MultiColumnMonthViewController _slideToAnimatePalleteShowingBackButton:animated:](self, "_slideToAnimatePalleteShowingBackButton:animated:", 0, v3);
    v9 = 0.0;
    if (v3)
      v9 = 0.5;
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000F46E0;
    v12[3] = &unk_1001B2538;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000F46E8;
    v11[3] = &unk_1001B25D0;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v12, v11, v9, 0.0, 2.0, 0.0);
  }
  else
  {
    v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MultiColumnMonthViewController tried to slide panels without preference enabled.", buf, 2u);
    }
  }
}

- (void)_setPaletteDisplaced
{
  -[PaletteView setWeekdayHeaderMovedBeyondLeftEdge:](self->_palette, "setWeekdayHeaderMovedBeyondLeftEdge:", 1);
  -[PaletteView setNeedsLayout](self->_palette, "setNeedsLayout");
}

- (void)_resetPaletteState
{
  -[PaletteView setWeekdayHeaderMovedBeyondLeftEdge:](self->_palette, "setWeekdayHeaderMovedBeyondLeftEdge:", 0);
  -[PaletteView setNeedsLayout](self->_palette, "setNeedsLayout");
}

- (double)rightSplitViewSideInset
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy"));
  objc_msgSend(v2, "ekui_interfaceOrientation");

  return 23.0;
}

- (double)detailsLeftInsetAdjustment
{
  return 0.0;
}

- (double)detailsRightInsetAdjustment
{
  return 0.0;
}

- (double)monthWeekScale
{
  return 1.0;
}

- (void)_startUpdateTimer
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSTimer *v11;
  NSTimer *refreshTimer;
  void *v13;
  id v14;

  if (!self->_refreshTimer)
  {
    v3 = CUIKCalendar(self);
    v14 = (id)objc_claimAutoreleasedReturnValue(v3);
    v4 = CUIKCalendar(v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 126, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromComponents:", v7));
    v9 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v9, "setMinute:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v9, v8, 0));
    v11 = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v10, self, "_updateTimerFired", 0, 1, 60.0);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v13, "addTimer:forMode:", self->_refreshTimer, NSDefaultRunLoopMode);

  }
}

- (void)_invalidateUpdateTimer
{
  NSTimer *refreshTimer;

  -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;

}

- (void)_refreshListView
{
  -[ListViewController refresh](self->_multiDayListViewController, "refresh");
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController nextLevelWeekViewControllerWithDate:](self, "nextLevelWeekViewControllerWithDate:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  WeekViewContainerViewController *v4;
  CUIKCalendarModel *model;
  void *v6;
  WeekViewContainerViewController *v7;

  -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", a3);
  v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v7 = -[MainViewControllerContainer initWithModel:window:](v4, "initWithModel:window:", model, v6);

  return v7;
}

- (CGRect)frameForWeekContainingDate:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat x;
  double v22;
  CGFloat y;
  double v24;
  CGFloat width;
  double v26;
  CGFloat height;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  model = self->super.super.super.super._model;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v8));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "rectForCells");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    objc_msgSend(v19, "convertRect:fromView:", v10, v12, v14, v16, v18);
    x = v20;
    y = v22;
    width = v24;
    height = v26;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v7));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frameForTodayHighlight");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    objc_msgSend(v18, "convertRect:fromView:", v9, v11, v13, v15, v17);
    x = v19;
    y = v21;
    width = v23;
    height = v25;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
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

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  +[CompactMonthWeekView heightForViewWithCalendarDate:compressed:windowSize:scale:](CompactMonthWeekView, "heightForViewWithCalendarDate:compressed:windowSize:scale:", v4, v5, EKUICurrentWindowSize(v6));
  v8 = v7;

  return v8;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  double result;

  +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance", a3);
  return result;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  double v2;

  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"), 1.0);
  return v2 * 3.5;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  double v2;

  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"), 1.0);
  return v2 * 5.5;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  double v2;

  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"), 1.0);
  return v2 * 1.1;
}

- (double)showDateVerticalOffset
{
  double result;

  -[MultiColumnMonthViewController _showDateVerticalOffsetWithVerticalCompression:](self, "_showDateVerticalOffsetWithVerticalCompression:", -[MultiColumnMonthViewController _monthWeekViewsUseVerticalCompression](self, "_monthWeekViewsUseVerticalCompression"));
  return result;
}

- (double)_showDateVerticalOffsetWithVerticalCompression:(BOOL)a3
{
  MultiColumnMonthViewController *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = self;
  v4 = -12.0;
  if (a3)
  {
    self = (MultiColumnMonthViewController *)+[CompactMonthWeekView headerHeight](CompactMonthWeekView, "headerHeight");
    v4 = v5;
  }
  v6 = v4 + 2.0 / EKUIScaleFactor(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController traitCollection](v3, "traitCollection"));
  v9 = EKUIUsesLargeTextLayout(v7, v8);

  if (v9)
    return v6 + 1.0 / EKUIScaleFactor(v10);
  return v6;
}

- (int64_t)eventCountDisplayedForDate:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));
  v6 = objc_msgSend(v4, "day");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDate"));
  v8 = objc_msgSend(v7, "day");

  if (!v5)
    goto LABEL_7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventData"));
  v10 = 0;
  if (!v9)
    goto LABEL_6;
  v11 = v6 - v8;
  if (v11 < 0)
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventData"));
  v13 = objc_msgSend(v12, "count");

  if (v11 >= (uint64_t)v13)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v11));

  v10 = objc_msgSend(v9, "eventCount");
LABEL_6:

LABEL_8:
  return (int64_t)v10;
}

- (void)_updateInfiniteScrollViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double MinX;
  double v13;
  double MidX;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  int IsLeftToRight;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  if (!CGRectIsEmpty(v25))
  {
    if (-[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns"))
    {
      v26.origin.x = v5;
      v26.origin.y = v7;
      v26.size.width = v9;
      v26.size.height = v11;
      MinX = CGRectGetMinX(v26);
      -[MultiColumnMonthViewController _listviewColumnCollapsedWidth](self, "_listviewColumnCollapsedWidth");
      MidX = v13;
    }
    else
    {
      v27.origin.x = v5;
      v27.origin.y = v7;
      v27.size.width = v9;
      v27.size.height = v11;
      MidX = CGRectGetMidX(v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
      v16 = objc_msgSend(v15, "largeListViewDisclosingEventDetails");

      if (v16)
      {
        v28.origin.x = v5;
        v28.origin.y = v7;
        v28.size.width = v9;
        v28.size.height = v11;
        MinX = -CGRectGetMidX(v28);
      }
      else
      {
        IsLeftToRight = CalInterfaceIsLeftToRight(v17);
        v19 = v5;
        v20 = v7;
        v21 = v9;
        v22 = v11;
        if (IsLeftToRight)
          v23 = CGRectGetMinX(*(CGRect *)&v19);
        else
          v23 = CGRectGetMidX(*(CGRect *)&v19);
        MinX = v23;
      }
    }
    v24 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v24, "setFrame:", MinX, v7, MidX, v11);

  }
}

- (void)_setupListViewController
{
  UIView *v3;
  UIView *listViewContainer;
  void *v5;
  void *v6;
  CompactMonthListViewController *v7;
  CompactMonthListViewController *singleDayListViewController;
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
  ListViewController *v19;
  CUIKCalendarModel *model;
  void *v21;
  ListViewController *v22;
  ListViewController *multiDayListViewController;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;

  if (!self->_listViewContainer)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    listViewContainer = self->_listViewContainer;
    self->_listViewContainer = v3;

    -[UIView setAutoresizingMask:](self->_listViewContainer, "setAutoresizingMask:", 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](self->_listViewContainer, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
    objc_msgSend(v6, "addSubview:", self->_listViewContainer);

    v7 = -[CompactMonthListViewController initWithModel:]([CompactMonthListViewController alloc], "initWithModel:", self->super.super.super.super._model);
    singleDayListViewController = self->_singleDayListViewController;
    self->_singleDayListViewController = v7;

    -[CompactMonthListViewController setCompactMonthListViewDelegate:](self->_singleDayListViewController, "setCompactMonthListViewDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_singleDayListViewController, "view"));
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    -[UIView bounds](self->_listViewContainer, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_singleDayListViewController, "view"));
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    v19 = [ListViewController alloc];
    model = self->super.super.super.super._model;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v22 = -[ListViewController initWithModel:window:](v19, "initWithModel:window:", model, v21);
    multiDayListViewController = self->_multiDayListViewController;
    self->_multiDayListViewController = v22;

    -[ListViewController setAllowExtendedHeightCells:](self->_multiDayListViewController, "setAllowExtendedHeightCells:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController view](self->_multiDayListViewController, "view"));
    objc_msgSend(v24, "setAutoresizingMask:", 18);

    -[UIView bounds](self->_listViewContainer, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController view](self->_multiDayListViewController, "view"));
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    -[ListViewController setDelegate:](self->_multiDayListViewController, "setDelegate:", self);
    -[MultiColumnMonthViewController _updateListViewModeForCurrentTraits](self, "_updateListViewModeForCurrentTraits");
  }
}

- (void)_updateListViewModeForCurrentTraits
{
  void *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  UIView *listViewContainer;
  void *v8;

  if (-[MultiColumnMonthViewController _listViewShowsSingleDay](self, "_listViewShowsSingleDay"))
  {
    -[ListViewController removeFromParentViewController](self->_multiDayListViewController, "removeFromParentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController view](self->_multiDayListViewController, "view"));
    objc_msgSend(v3, "removeFromSuperview");

    v4 = 304;
  }
  else
  {
    -[CompactMonthListViewController removeFromParentViewController](self->_singleDayListViewController, "removeFromParentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_singleDayListViewController, "view"));
    objc_msgSend(v5, "removeFromSuperview");

    v4 = 312;
  }
  v6 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  -[MultiColumnMonthViewController addChildViewController:](self, "addChildViewController:", *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4));
  listViewContainer = self->_listViewContainer;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "view"));
  -[UIView addSubview:](listViewContainer, "addSubview:", v8);

  objc_msgSend(*v6, "didMoveToParentViewController:", self);
}

- (BOOL)_listViewShowsSingleDay
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  if (objc_msgSend(v3, "verticalSizeClass") == (id)1)
    LOBYTE(v4) = 1;
  else
    v4 = !-[MultiColumnMonthViewController _allowedToDisplayEventDetailsColumn](self, "_allowedToDisplayEventDetailsColumn");

  return v4;
}

- (CGRect)frameOfListView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_listViewContainer, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_updateListViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double MidX;
  double MinX;
  void *v15;
  unsigned int v16;
  double v17;
  uint64_t v18;
  CGFloat v19;
  double v20;
  uint64_t v21;
  char IsLeftToRight;
  double MaxX;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  if (CGRectIsEmpty(v24))
    return;
  if (!-[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    v16 = objc_msgSend(v15, "largeListViewDisclosingEventDetails");

    if (v16)
    {
      -[MultiColumnMonthViewController _listviewColumnCollapsedWidth](self, "_listviewColumnCollapsedWidth");
      MidX = v17;
    }
    else
    {
      v25.origin.x = v5;
      v25.origin.y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      MidX = CGRectGetMidX(v25);
      if (CalInterfaceIsLeftToRight(v18))
      {
        v26.origin.x = v5;
        v26.origin.y = v7;
        v26.size.width = v9;
        v26.size.height = v11;
        MinX = CGRectGetMidX(v26);
        goto LABEL_9;
      }
    }
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    MinX = CGRectGetMinX(v27);
    goto LABEL_9;
  }
  -[MultiColumnMonthViewController _listviewColumnCollapsedWidth](self, "_listviewColumnCollapsedWidth");
  MidX = v12;
  -[MultiColumnMonthViewController _listviewColumnCollapsedWidth](self, "_listviewColumnCollapsedWidth");
LABEL_9:
  v19 = MinX;
  v20 = 1.0 / EKUIScaleFactor(-[UIView setFrame:](self->_listViewContainer, "setFrame:", MinX, v7, MidX, v11));
  IsLeftToRight = CalInterfaceIsLeftToRight(v21);
  MaxX = v19;
  if ((IsLeftToRight & 1) == 0)
  {
    v28.origin.x = v19;
    v28.origin.y = v7;
    v28.size.width = MidX;
    v28.size.height = v11;
    MaxX = CGRectGetMaxX(v28);
  }
  -[UIView setFrame:](self->_dividerLineBetweenListAndMonth, "setFrame:", MaxX, v7, v20, v11);
  v29.origin.x = v19;
  v29.origin.y = v7;
  v29.size.width = MidX;
  v29.size.height = v11;
  -[UIView setFrame:](self->_dividerLineBetweenListAndEventDetails, "setFrame:", CGRectGetMaxX(v29), v7, v20, v11);
}

- (void)_cancelEventDetailViewModeButtonPressed:(id)a3
{
  -[MultiColumnMonthViewController _slideToHideEventDetailsAnimated:](self, "_slideToHideEventDetailsAnimated:", 1);
}

- (BOOL)_threeColumnsDisplayIsAllowed
{
  return 0;
}

- (BOOL)_shouldDisplayThreeColumns
{
  return 0;
}

- (void)_autoSelectEvent
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F575C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)navigateToEventDetails:(id)a3 fromController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v9 = CUIKTodayDate(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v10, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v13));
  objc_msgSend(v14, "setDisableTodayPulse:", 1);
  -[CompactMonthListViewController deselectAllRowsAnimated:](self->_singleDayListViewController, "deselectAllRowsAnimated:", 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000F598C;
  v18[3] = &unk_1001B2C88;
  v18[4] = self;
  v19 = v7;
  v20 = v6;
  v21 = v14;
  v15 = v14;
  v16 = v6;
  v17 = v7;
  -[MultiColumnMonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v18);

}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextOccurrence"));

  if (v5)
    -[MultiColumnMonthViewController navigateToEventDetails:fromController:](self, "navigateToEventDetails:fromController:", v5, v6);

}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousOccurrence"));

  if (v5)
    -[MultiColumnMonthViewController navigateToEventDetails:fromController:](self, "navigateToEventDetails:fromController:", v5, v6);

}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  -[MultiColumnMonthViewController navigateToEventDetails:fromController:](self, "navigateToEventDetails:fromController:", a4, a3);
}

- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  MultiColumnMonthViewController *v17;
  unint64_t v18;

  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v10, self, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v13, "setSelectedOccurrence:", v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MultiColumnMonthViewController view](self, "view"));
  LODWORD(v13) = EKUICurrentHeightSizeClassIsRegular();

  if ((_DWORD)v13)
  {
    -[MultiColumnMonthViewController _slideToShowEventDetails:animated:](self, "_slideToShowEventDetails:animated:", v12, v8);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F5D18;
    v15[3] = &unk_1001B5610;
    v17 = self;
    v18 = a5;
    v16 = v12;
    -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v16, self, v8, v15);

  }
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5;
  id v6;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  MultiColumnMonthViewController *v11;
  id v12;

  v5 = a3;
  -[CompactMonthListViewController deselectAllRowsAnimated:](self->_singleDayListViewController, "deselectAllRowsAnimated:", 1);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000F5ED4;
  v10 = &unk_1001B26A0;
  v11 = self;
  v12 = v5;
  v6 = v5;
  -[MultiColumnMonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &v7);
  if (-[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn", v7, v8, v9, v10, v11))
  {
    -[MultiColumnMonthViewController _autoSelectEvent](self, "_autoSelectEvent");
  }

}

- (void)eventViewControllerWillDisappear:(id)a3
{
  -[CUIKCalendarModel setSelectedOccurrence:](self->super.super.super.super._model, "setSelectedOccurrence:", 0);
}

- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4
{
  id v5;
  _QWORD v6[5];

  v5 = a4;
  objc_msgSend(v5, "setModalTransitionStyle:", 2);
  if (*(_WORD *)&self->_editorDismissedFromDelete)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F5FF4;
    v6[3] = &unk_1001B2538;
    v6[4] = self;
    -[MultiColumnMonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
    self->_editorDismissedFromDelete = 0;
    self->_editorPresentedProgramatically = 0;
  }
  else
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  self->_editorDismissedFromDelete = a4;
}

- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "event", a3));
  -[MultiColumnMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", v5, 1, 1, 0);

}

- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5
{
  -[MultiColumnMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", a4, 1, a5, 0);
}

- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3
{
  return !self->_listViewContainerDidScrollMessagesSuppressed;
}

- (void)listViewController:(id)a3 didScrollToDate:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  MultiColumnMonthViewController *v19;
  id v20;

  v5 = a4;
  if (!self->_listViewContainerDidScrollMessagesSuppressed)
  {
    v6 = -[MultiColumnMonthViewController _viewingEventDetailsColumn](self, "_viewingEventDetailsColumn");
    if (!v6 || (v6 = -[MultiColumnMonthViewController _shouldDisplayThreeColumns](self, "_shouldDisplayThreeColumns")))
    {
      v8 = CUIKTodayDate(v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v9, v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v14));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v12));
      objc_msgSend(v16, "setDisableTodayPulse:", 1);
      if ((byte_1001F6560 & 1) == 0)
      {
        byte_1001F6560 = 1;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000F6230;
        v17[3] = &unk_1001B2560;
        v18 = v16;
        v19 = self;
        v20 = v15;
        -[MultiColumnMonthViewController showDate:animated:completionBlock:](self, "showDate:animated:completionBlock:", v5, 1, v17);

      }
    }
  }

}

- (BOOL)listViewControllerContainerHandlesShowEvent
{
  return 1;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (UITapGestureRecognizer)dayCellsTapGestureRecognizer
{
  return self->_dayCellsTapGestureRecognizer;
}

- (void)setDayCellsTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer
{
  return self->_dayCellsScrubbingGestureRecognizer;
}

- (void)setDayCellsScrubbingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_currentDetailsView, 0);
  objc_storeStrong((id *)&self->_navigationWrapperView, 0);
  objc_storeStrong((id *)&self->_blankViewController, 0);
  objc_storeStrong((id *)&self->_eventDetailsColumnNavigationController, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_cancelEventDetailViewModeButton, 0);
  objc_storeStrong((id *)&self->_navigationBarDisplayedDate, 0);
  objc_storeStrong((id *)&self->_dividerLineBetweenListAndEventDetails, 0);
  objc_storeStrong((id *)&self->_dividerLineBetweenListAndMonth, 0);
  objc_storeStrong((id *)&self->_weekCalculationCalendar, 0);
  objc_storeStrong((id *)&self->_multiDayListViewController, 0);
  objc_storeStrong((id *)&self->_singleDayListViewController, 0);
  objc_storeStrong((id *)&self->_listViewContainer, 0);
  objc_storeStrong((id *)&self->_selectedMonthWeekView, 0);
  objc_storeStrong((id *)&self->_pressedMonthView, 0);
  objc_storeStrong((id *)&self->_pressHighlight, 0);
  objc_storeStrong((id *)&self->_pressedDay, 0);
}

@end
