@implementation CompactWidthMonthViewController

- (CompactWidthMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8;
  id v9;
  id v10;
  CompactWidthMonthViewController *v11;
  CompactWidthMonthViewController *v12;
  void *v13;
  UIScrollView *v14;
  UIScrollView *pinchScrollView;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *reloadQueue;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CompactWidthMonthViewController;
  v11 = -[MonthViewController initWithCalendarDate:model:window:](&v26, "initWithCalendarDate:model:window:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](v11, "model"));
    v12->_dividedListMode = objc_msgSend(v13, "showMonthAsDivided");

    v14 = objc_opt_new(UIScrollView);
    pinchScrollView = v12->_pinchScrollView;
    v12->_pinchScrollView = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("monthReload", v17);
    reloadQueue = v12->_reloadQueue;
    v12->_reloadQueue = (OS_dispatch_queue *)v18;

    objc_initWeak(&location, v12);
    v27 = objc_opt_class(UITraitUserInterfaceStyle);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100080EE0;
    v23[3] = &unk_1001B2418;
    objc_copyWeak(&v24, &location);
    v21 = -[CompactWidthMonthViewController registerForTraitChanges:withHandler:](v12, "registerForTraitChanges:withHandler:", v20, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  DayViewContainerViewController *v6;
  CUIKCalendarModel *model;
  void *v8;
  DayViewContainerViewController *v9;
  void *v10;

  v4 = a4;
  -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", a3);
  v6 = [DayViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v9 = -[MainViewControllerContainer initWithModel:window:](v6, "initWithModel:window:", model, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, v4);

  return v9;
}

- (BOOL)dividedListMode
{
  return self->_dividedListMode;
}

- (int)supportedToggleMode
{
  return 2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKPreferencesNotification_EventsInPhoneMonthView, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelCachedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKPreferencesNotification_WeekStart, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelDidUnlockNotification, self->super.super.super.super._model);

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController dealloc](&v4, "dealloc");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)pinchToZoomAllowed
{
  int v3;

  if ((_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
    || (v3 = _os_feature_enabled_impl("Calendar", "resizeable_month")) != 0)
  {
    LOBYTE(v3) = !self->_dividedListMode;
  }
  return v3;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController loadView](&v10, "loadView");
  -[CompactWidthMonthViewController _updateMonthTitleViewFont](self, "_updateMonthTitleViewFont");
  v3 = objc_msgSend(objc_alloc((Class)UIPinchGestureRecognizer), "initWithTarget:action:", self, "_monthScrollerPinched:");
  -[CompactWidthMonthViewController setPinchRecognizer:](self, "setPinchRecognizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController pinchRecognizer](self, "pinchRecognizer"));
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  v6 = -[CompactWidthMonthViewController pinchToZoomAllowed](self, "pinchToZoomAllowed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController pinchRecognizer](self, "pinchRecognizer"));
  objc_msgSend(v7, "setEnabled:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController pinchRecognizer](self, "pinchRecognizer"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_cachedOccurrencesChanged:", CUIKCalendarModelCachedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_occurrencesChanged:", CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super.super._model);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_weekStartChanged:", CUIKPreferencesNotification_WeekStart, 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_modelUnlocked", CUIKCalendarModelDidUnlockNotification, self->super.super.super.super._model);

}

- (void)viewDidLoad
{
  unsigned int v3;
  const UIScrollViewDecelerationRate *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CompactWidthMonthViewController;
  -[InfiniteScrollViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
  v4 = &UIScrollViewDecelerationRateFast;
  if (!v3)
    v4 = &UIScrollViewDecelerationRateNormal;
  v5 = *v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setDecelerationRate:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController traitCollection](self, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v7);

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    -[CompactWidthMonthViewController _setupListViewController](self, "_setupListViewController");
    -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dividedModeBackgroundColor", v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v11, "setBackgroundColor:", v10);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController adjustSelectedDateForNewMonth:](self, "adjustSelectedDateForNewMonth:", v12));

    -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v13);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_shouldSetSelectedDate = 1;
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[CompactWidthMonthViewController ekui_adjustNavAndToolBarToTranslucentGrayStyles](self, "ekui_adjustNavAndToolBarToTranslucentGrayStyles");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController viewDidAppear:](&v16, "viewDidAppear:");
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    -[CompactWidthMonthViewController _updateDividedListTopLineForDividedMode:animated:](self, "_updateDividedListTopLineForDividedMode:animated:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v6));
    -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v5, v7, v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForEndOfMonth"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v9));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

      if (v12
        || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view")),
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window")),
            v14,
            v13,
            !v15))
      {
        -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
      }
      else
      {
        EKUIPushFallbackSizingContextWithViewHierarchy(v15);
        -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
        EKUIPopFallbackSizingContextWithViewHierarchy(v15);

      }
    }

  }
  self->_reloadAfterStoppedScrolling = 0;
  if (self->_needToReloadEventsOnAppear
    || self->_eventLoadingSuspendedForScroll
    || self->_eventLoadingSuspendedForPinching)
  {
    self->_needToReloadEventsOnAppear = 0;
    self->_eventLoadingSuspendedForScroll = 0;
    self->_eventLoadingSuspendedForPinching = 0;
    -[CompactWidthMonthViewController _loadEventsForAllSubviews](self, "_loadEventsForAllSubviews");
  }
  -[CompactWidthMonthViewController _registerGestureRecognizers](self, "_registerGestureRecognizers");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CompactWidthMonthViewController _unregisterGestureRecognizers](self, "_unregisterGestureRecognizers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  EKCalendarDate *currentBackButtonDate;
  objc_super v6;

  v3 = a3;
  -[CompactWidthMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
  currentBackButtonDate = self->_currentBackButtonDate;
  self->_currentBackButtonDate = 0;

  v6.receiver = self;
  v6.super_class = (Class)CompactWidthMonthViewController;
  -[CompactWidthMonthViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_setupListViewController
{
  UIView *v3;
  UIView *listViewContainer;
  void *v5;
  void *v6;
  void *v7;
  CompactMonthListViewController *v8;
  CompactMonthListViewController *listViewController;
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
  UIView *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double Height;
  UIView *v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  UIView *listViewContainerTopLine;
  CGRect v38;

  if (!self->_listViewController)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    listViewContainer = self->_listViewContainer;
    self->_listViewContainer = v3;

    -[UIView setAutoresizingMask:](self->_listViewContainer, "setAutoresizingMask:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    -[UIView setFrame:](self->_listViewContainer, "setFrame:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UIView setBackgroundColor:](self->_listViewContainer, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v7, "addSubview:", self->_listViewContainer);

    v8 = -[CompactMonthListViewController initWithModel:]([CompactMonthListViewController alloc], "initWithModel:", self->super.super.super.super._model);
    listViewController = self->_listViewController;
    self->_listViewController = v8;

    -[CompactMonthListViewController setCompactMonthListViewDelegate:](self->_listViewController, "setCompactMonthListViewDelegate:", self);
    -[CompactWidthMonthViewController addChildViewController:](self, "addChildViewController:", self->_listViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_listViewController, "view"));
    objc_msgSend(v10, "setAutoresizingMask:", 18);

    -[UIView bounds](self->_listViewContainer, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_listViewController, "view"));
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

    -[CompactMonthListViewController setDisabled:](self->_listViewController, "setDisabled:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") ^ 1);
    v20 = self->_listViewContainer;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_listViewController, "view"));
    -[UIView addSubview:](v20, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v27, "bounds");
    Height = CGRectGetHeight(v38);

    -[UIView setFrame:](self->_listViewContainer, "setFrame:", v24, Height, v26, 320.0);
    -[UIView setHidden:](self->_listViewContainer, "setHidden:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") ^ 1);
    -[UIView setUserInteractionEnabled:](self->_listViewContainer, "setUserInteractionEnabled:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
    v29 = (UIView *)objc_alloc_init((Class)UIView);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v29, "setBackgroundColor:", v30);

    -[UIView setAutoresizingMask:](v29, "setAutoresizingMask:", 34);
    v31 = -[UIView frame](self->_listViewContainer, "frame");
    v33 = v32;
    v34 = EKUIScaleFactor(v31);
    -[UIView setFrame:](v29, "setFrame:", 0.0, 0.0, v33, CalRoundToScreenScale(v35, v36, 1.0 / v34));
    -[UIView addSubview:](self->_listViewContainer, "addSubview:", v29);
    listViewContainerTopLine = self->_listViewContainerTopLine;
    self->_listViewContainerTopLine = v29;

  }
}

- (double)monthWeekScale
{
  double result;
  double v4;
  id v5;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    && !self->_dividedListModeAnimationInProgress)
  {
    return 1.0;
  }
  result = self->_pinchingMonthWeekScale;
  if (result <= 0.0)
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v5, "monthWeekScale", v4);
  }
  return result;
}

+ (double)scaleForSize:(unint64_t)a3
{
  double result;

  if (a3 == 1)
    return 1.0;
  if (a3 == 2)
    +[CompactMonthWeekView narrowScale](CompactMonthWeekView, "narrowScale");
  else
    +[CompactMonthWeekView eventScaleForNumberOfRows:](CompactMonthWeekView, "eventScaleForNumberOfRows:");
  return result;
}

+ (double)monthWeekScale
{
  void *v3;
  id v4;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "monthViewScaleSize");

  objc_msgSend(a1, "scaleForSize:", v4);
  return result;
}

+ (void)setMonthWeekScaleSize:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v4, "setMonthViewScaleSize:", a3);

  if (a3 >= 3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    objc_msgSend(v5, "setMonthViewEventScaleSize:", a3);

  }
}

- (void)relayoutPinchView
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIScrollView *pinchScrollView;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_pinchViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        -[UIScrollView bounds](self->_pinchScrollView, "bounds", (_QWORD)v15);
        objc_msgSend(v9, "sizeThatFits:", v10, v11);
        v13 = v12;
        objc_msgSend(v9, "frame");
        objc_msgSend(v9, "setFrame:");
        v7 = v7 + v13;
        objc_msgSend(v9, "layoutSubviews");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  pinchScrollView = self->_pinchScrollView;
  -[UIScrollView contentSize](pinchScrollView, "contentSize");
  -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
}

- (void)prepareToChangeScaleFromPinch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *pinchViews;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setHidden:", 1);

  -[InfiniteScrollViewController setSuppressViewAdjustments:](self, "setSuppressViewAdjustments:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_pinchScrollView);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  -[UIScrollView setFrame:](self->_pinchScrollView, "setFrame:");

  pinchViews = self->_pinchViews;
  if (!pinchViews)
  {
    v9 = objc_opt_new(NSMutableArray);
    v10 = self->_pinchViews;
    self->_pinchViews = v9;

    pinchViews = self->_pinchViews;
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v11 = pinchViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v13);
  }

  -[NSMutableArray removeAllObjects](self->_pinchViews, "removeAllObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController allViews](self, "allViews"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v17, "frame");
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v18, "convertPoint:fromView:", v23, v20, v22);
  v25 = v24;
  v27 = v26;

  v28 = -v27;
  v57 = v17;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "calendarDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController allViews](self, "allViews"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastObject"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "calendarDate"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController allViews](self, "allViews"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v33));

  -[CompactWidthMonthViewController setSuspendEventLoading:](self, "setSuspendEventLoading:", 1);
  if (v3)
  {
    v35 = 0;
  }
  else
  {
    v35 = (uint64_t)objc_msgSend(v34, "count");
    if (v35 > 8)
    {
      v49 = v32;
      goto LABEL_20;
    }
  }
  v36 = v35 - 9;
  do
  {
    if (v3)
    {
      v37 = -[CompactWidthMonthViewController newTopViewAboveViewWithCalendarDate:](self, "newTopViewAboveViewWithCalendarDate:", v29);
      objc_msgSend(v34, "insertObject:atIndex:", v37, 0);
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "calendarDate"));

      -[UIScrollView bounds](self->_pinchScrollView, "bounds");
      objc_msgSend(v37, "sizeThatFits:", v39, v40);
      v42 = v41;
      objc_msgSend(v37, "setFrame:", 0.0, 0.0, v43, v41);
      v28 = v28 + v42;

      v29 = (void *)v38;
    }
    v44 = -[CompactWidthMonthViewController newBottomViewBelowViewWithCalendarDate:](self, "newBottomViewBelowViewWithCalendarDate:", v32);
    objc_msgSend(v34, "addObject:", v44);
    -[UIScrollView bounds](self->_pinchScrollView, "bounds");
    objc_msgSend(v44, "sizeThatFits:", v45, v46);
    objc_msgSend(v44, "setFrame:", 0.0, 0.0, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "calendarDate"));

    v32 = v49;
  }
  while (!__CFADD__(v36++, 1));
LABEL_20:
  -[CompactWidthMonthViewController setSuspendEventLoading:](self, "setSuspendEventLoading:", 0);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v51 = v34;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v53; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v56, "setDrawWithViews:", 1);
        -[UIScrollView addSubview:](self->_pinchScrollView, "addSubview:", v56);
        -[NSMutableArray addObject:](self->_pinchViews, "addObject:", v56);
        objc_msgSend(v56, "setHidden:", 0);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v53);
  }

  -[CompactWidthMonthViewController relayoutPinchView](self, "relayoutPinchView");
  -[UIScrollView setContentOffset:](self->_pinchScrollView, "setContentOffset:", v25, v28);

}

- (void)applySizeToPinchView:(unint64_t)a3 compressed:(BOOL)a4 snapToBoundary:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSMutableArray *v14;
  id v15;
  _BOOL4 v16;
  double v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  double v33;
  void *j;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIScrollView *pinchScrollView;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "adjustedContentInset");
  v11 = v10;

  -[UIScrollView contentOffset](self->_pinchScrollView, "contentOffset");
  v13 = v12;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = self->_pinchViews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v15)
  {
    v45 = a3;
    v16 = v5;
    v17 = v11 + v13;
    v18 = *(_QWORD *)v51;
    v19 = 0.0;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "frame");
        v19 = v19 + v22;
        if (v19 > v17)
        {
          v15 = v21;
          objc_msgSend(v15, "frame");
          v25 = v17 - (v19 - v24);
          objc_msgSend(v15, "frame");
          v23 = v25 / v26;
          goto LABEL_11;
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v15)
        continue;
      break;
    }
    v23 = 0.0;
LABEL_11:
    v5 = v16;
    a3 = v45;
  }
  else
  {
    v23 = 0.0;
  }

  *(_QWORD *)&v27 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v28, "setMonthWeekScaleSize:", a3, v27);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = self->_pinchViews;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    v33 = 0.0;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v35, "setCompressedVerticalMode:", v6);
        -[UIScrollView bounds](self->_pinchScrollView, "bounds");
        objc_msgSend(v35, "sizeThatFits:", v36, v37);
        v39 = v38;
        objc_msgSend(v35, "frame");
        objc_msgSend(v35, "setFrame:");
        v33 = v33 + v39;
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v31);
  }

  pinchScrollView = self->_pinchScrollView;
  -[UIScrollView contentSize](pinchScrollView, "contentSize");
  -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
  if (v5)
  {
    v41 = 0.0;
    if (objc_msgSend(v15, "containsFirstDayOfMonth"))
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
      v41 = v42;
    }
  }
  else
  {
    objc_msgSend(v15, "frame");
    v41 = v23 * v43;
  }
  objc_msgSend(v15, "frame");
  -[UIScrollView setContentOffset:animated:](self->_pinchScrollView, "setContentOffset:animated:", 0, 0.0, v41 + v44 - v11);

}

- (void)finishChangeScale
{
  UIScrollView **p_pinchScrollView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  p_pinchScrollView = &self->_pinchScrollView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView subviews](self->_pinchScrollView, "subviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView subviews](*p_pinchScrollView, "subviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));

  self->_pinchingMonthWeekScale = 0.0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_pinchViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "frame");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
        objc_msgSend(v7, "addObject:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDate"));
        objc_msgSend(v5, "addObject:", v15);

        objc_msgSend(v12, "layoutSubviews");
        objc_msgSend(v12, "setDrawWithViews:", 0);
        -[CompactWidthMonthViewController _loadEventDataForMonthWeekView:](self, "_loadEventDataForMonthWeekView:", v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  -[InfiniteScrollViewController insertViews:](self, "insertViews:", self->_pinchViews);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v16, "setHidden:", 0);

  -[InfiniteScrollViewController resizeAllViews](self, "resizeAllViews");
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000827D0;
  v18[3] = &unk_1001B3810;
  v18[4] = self;
  v17 = v7;
  v19 = v17;
  v20 = v21;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
  -[InfiniteScrollViewController setSuppressViewAdjustments:](self, "setSuppressViewAdjustments:", 0);
  -[UIScrollView removeFromSuperview](self->_pinchScrollView, "removeFromSuperview");
  -[InfiniteScrollViewController adjustLoadedViewRange](self, "adjustLoadedViewRange");
  -[CompactWidthMonthViewController _resetSelectionForDividedListState:](self, "_resetSelectionForDividedListState:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));

  _Block_object_dispose(v21, 8);
}

- (void)_animateChangeToWeekSize:(unint64_t)a3 divided:(BOOL)a4
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSMutableArray *v11;
  _QWORD *v12;
  NSMutableArray *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  _BOOL4 v33;
  _QWORD v35[5];
  _QWORD *v36;
  BOOL v37;
  _QWORD v38[5];
  BOOL v39;
  _QWORD v40[4];
  NSMutableArray *v41;
  void *v42;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD v51[6];
  BOOL v52;
  _QWORD v53[4];
  NSMutableArray *v54;
  CompactWidthMonthViewController *v55;
  _QWORD *v56;
  _QWORD v57[3];
  char v58;
  _BYTE v59[128];

  v33 = a4;
  +[CompactWidthMonthViewController scaleForSize:](CompactWidthMonthViewController, "scaleForSize:");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  +[CompactWidthMonthViewController scaleForSize:](CompactWidthMonthViewController, "scaleForSize:", objc_msgSend(v7, "monthViewScaleSize"));
  v9 = v8;

  -[CompactWidthMonthViewController prepareToChangeScaleFromPinch:](self, "prepareToChangeScaleFromPinch:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController pinchRecognizer](self, "pinchRecognizer"));
  objc_msgSend(v10, "setEnabled:", 0);

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v58 = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100082E40;
  v53[3] = &unk_1001B3838;
  v56 = v57;
  v11 = objc_opt_new(NSMutableArray);
  v54 = v11;
  v55 = self;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100082EF8;
  v51[3] = &unk_1001B3860;
  v51[4] = self;
  v51[5] = a3;
  v52 = v33;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100082F0C;
  v48[3] = &unk_1001B3888;
  v50 = v57;
  v12 = objc_retainBlock(v53);
  v49 = v12;
  +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 65540, v51, v48, 0.25, 0.0, 0.0, 0.0);
  if (v6 != v9)
  {
    -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", self->_pinchViews);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v13 = self->_pinchViews;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100082F28;
          v40[3] = &unk_1001B3158;
          v41 = v11;
          v42 = v17;
          v43 = v12;
          objc_msgSend(v17, "animateToScale:fromScale:completionBlock:", v40, v6, v9);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
      }
      while (v14);
    }

  }
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") != v33)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v18, "bringSubviewToFront:", self->_listViewContainer);

    if (v33)
    {
      -[UIView setHidden:](self->_listViewContainer, "setHidden:", 0);
      -[CompactMonthListViewController setDisabled:](self->_listViewController, "setDisabled:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self->_listViewController, "view"));
      objc_msgSend(v19, "setAlpha:", 1.0);

      -[UIView setAlpha:](self->_listViewContainerTopLine, "setAlpha:", 1.0);
      -[UIView frame](self->_listViewContainer, "frame");
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
      objc_msgSend(v24, "frame");
      v26 = v25;

      -[UIView setFrame:](self->_listViewContainer, "setFrame:", 0.0, v26, v21, v23);
    }
    else
    {
      -[CompactWidthMonthViewController _resetSelectionForDividedListState:](self, "_resetSelectionForDividedListState:", 0);
    }
    -[CompactWidthMonthViewController _updateDividedListTopLineForDividedMode:animated:](self, "_updateDividedListTopLineForDividedMode:animated:", v33, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v28 = v27;
    v29 = UIScrollViewDecelerationRateFast;
    if (!v33)
      v29 = UIScrollViewDecelerationRateNormal;
    objc_msgSend(v27, "setDecelerationRate:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v30, "setShowMonthAsDivided:", v33);

    -[CompactWidthMonthViewController setDividedListMode:](self, "setDividedListMode:", v33);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100082F58;
    v38[3] = &unk_1001B2510;
    v39 = v33;
    v38[4] = self;
    v31 = objc_retainBlock(v38);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100083058;
    v35[3] = &unk_1001B3430;
    v35[4] = self;
    v37 = v33;
    v36 = v12;
    v32 = objc_retainBlock(v35);
    +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v31, v32, 0.0, 0.0);

  }
  _Block_object_dispose(v57, 8);

}

- (void)animateToMonthWeekSize:(unint64_t)a3 divided:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  CompactWidthMonthViewController *v39;
  NSMutableArray *v40;
  unint64_t v41;
  BOOL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v8 = objc_msgSend(v7, "monthViewScaleSize");

  if (v8 != (id)a3 || -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") != v4)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = self->_pinchViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v13), "animating") & 1) != 0)
          break;
        if (v11 == (id)++v13)
        {
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
LABEL_24:

      return;
    }
LABEL_11:

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    if ((objc_msgSend(v14, "isScrollAnimating") & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      if (!objc_msgSend(v15, "isDecelerating"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        v35 = objc_msgSend(v34, "isDragging");

        if ((v35 & 1) == 0)
          goto LABEL_16;
        goto LABEL_15;
      }

    }
LABEL_15:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v16, "contentOffset");
    v18 = v17;
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v21, "stopScrollingAndZooming");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v22, "setContentOffset:animated:", 0, v18, v20);

LABEL_16:
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") == v4)
    {
      -[CompactWidthMonthViewController _animateChangeToWeekSize:divided:](self, "_animateChangeToWeekSize:divided:", a3, v4);
      return;
    }
    self->_dividedListModeAnimationInProgress = 1;
    v23 = -[CompactWidthMonthViewController _setupListViewController](self, "_setupListViewController");
    v25 = CUIKTodayDate(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "timeZone"));
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v26, v28));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v9));
    objc_msgSend(v29, "setDisableTodayPulse:", 1);
    if (v4)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dateForTopVisibleMonthOnScreen](self, "dateForTopVisibleMonthOnScreen"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "calendarDateForMonth"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "date"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000834DC;
      v36[3] = &unk_1001B38B0;
      v37 = v29;
      v38 = v30;
      v39 = self;
      v40 = v9;
      v41 = a3;
      v42 = v4;
      v33 = v30;
      -[CompactWidthMonthViewController showDate:animated:completionBlock:](self, "showDate:animated:completionBlock:", v32, 1, v36);

    }
    else
    {
      objc_msgSend(v29, "setDisableTodayPulse:", 0);
      -[CompactWidthMonthViewController _animateChangeToWeekSize:divided:](self, "_animateChangeToWeekSize:divided:", a3, 0);
    }

    goto LABEL_24;
  }
}

- (void)_monthScrollerPinched:(id)a3
{
  id v4;
  char *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double x;
  double y;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  double pinchingMonthWeekScale;
  void *v34;
  double v35;
  double v36;
  double v37;
  double originalPinchScale;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  UIScrollView *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  id v54;
  int v55;
  int v56;
  uint64_t v57;
  void *j;
  void *v59;
  unsigned __int8 v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  id v70;
  unint64_t v71;
  UIImpactFeedbackGenerator *v72;
  UIImpactFeedbackGenerator *v73;
  NSMutableArray *v74;
  id v75;
  id v76;
  uint64_t v77;
  double v78;
  void *k;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  UIScrollView *pinchScrollView;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  UIScrollView *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  unint64_t v102;
  CompactWidthMonthViewController *v103;
  id v104;
  CGPoint *p_lastPinchPoint;
  UIScrollView *v106;
  NSMutableArray *obj;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[5];
  _QWORD v117[6];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) <= 2)
  {
    self->_eventLoadingSuspendedForPinching = 0;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v6 = self->_pinchViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v119 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i), "finishAnimations");
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
      }
      while (v8);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pinchViews, "firstObject"));
    -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
    v12 = objc_msgSend(v11, "nearestSnapBoundaryForScale:");
    self->_pinchingMonthWeekScale = 0.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController pinchRecognizer](self, "pinchRecognizer"));
    objc_msgSend(v13, "setEnabled:", 0);

    v116[4] = self;
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_100083E3C;
    v117[3] = &unk_1001B2838;
    v117[4] = self;
    v117[5] = v12;
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_100083E50;
    v116[3] = &unk_1001B25D0;
    +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 65540, v117, v116, 0.25, 0.0, 0.0, 0.0);

  }
  v14 = (unint64_t)objc_msgSend(v4, "numberOfTouches");
  if ((v14 | 2) == 2)
  {
    v15 = v14;
    x = self->_lastPinchPoint.x;
    y = self->_lastPinchPoint.y;
    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
      objc_msgSend(v4, "locationOfTouch:inView:", 0, v18);
      v20 = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
      objc_msgSend(v4, "locationOfTouch:inView:", 1, v21);
      v23 = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v24, "safeAreaInsets");
      self->_lastPinchPoint.x = 0.0;
      self->_lastPinchPoint.y = (v20 + v23) * 0.5 - v25;

    }
    if (v5 == (char *)2)
    {
      pinchingMonthWeekScale = self->_pinchingMonthWeekScale;
      p_lastPinchPoint = &self->_lastPinchPoint;
      if (v15)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
        pinchDistanceForGestureRecognizer(v4, v34);
        v36 = v35;

        v37 = self->_originalPinchScale * (v36 / self->_originalPinchDistance);
      }
      else
      {
        originalPinchScale = self->_originalPinchScale;
        objc_msgSend(v4, "scale");
        v37 = originalPinchScale * v39;
      }
      +[CompactMonthViewController minimumWeekScale](CompactMonthViewController, "minimumWeekScale");
      if (v37 < v40)
      {
        +[CompactMonthViewController minimumWeekScale](CompactMonthViewController, "minimumWeekScale");
        v37 = v41;
      }
      +[CompactMonthViewController maximumWeekScale](CompactMonthViewController, "maximumWeekScale");
      if (v37 > v42)
      {
        +[CompactMonthViewController maximumWeekScale](CompactMonthViewController, "maximumWeekScale");
        v37 = v43;
      }
      v44 = v37 / pinchingMonthWeekScale;
      if (v37 / pinchingMonthWeekScale == 1.0)
      {
        +[CompactMonthViewController minimumWeekScale](CompactMonthViewController, "minimumWeekScale");
        +[CompactMonthViewController maximumWeekScale](CompactMonthViewController, "maximumWeekScale");
        v44 = 1.0;
      }
      v45 = self->_pinchScrollView;
      if (v15)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
        -[UIScrollView convertPoint:fromView:](v45, "convertPoint:fromView:", v46, x, y);
        v48 = v47;
        v50 = v49;

      }
      else
      {
        objc_msgSend(v4, "locationInView:", v45);
        v48 = v51;
        v50 = v52;
      }
      v106 = v45;
      if (v37 / pinchingMonthWeekScale != 1.0)
      {
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        obj = self->_pinchViews;
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
        if (v53)
        {
          v54 = v53;
          v102 = v15;
          v103 = self;
          v104 = v4;
          v55 = 0;
          v56 = 0;
          v57 = *(_QWORD *)v113;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(_QWORD *)v113 != v57)
                objc_enumerationMutation(obj);
              v59 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)j);
              v60 = objc_msgSend(v59, "hideDaySummariesWithScale:", pinchingMonthWeekScale);
              v61 = objc_msgSend(v59, "hideDaySummariesWithScale:", v37);
              v62 = v61;
              v63 = v61 | v55;
              v64 = v61 | v56;
              if ((v60 & 1) != 0)
                v65 = 1;
              else
                v65 = v61 | v56;
              if ((v60 & 1) != 0)
                v66 = 1;
              else
                v66 = v61 | v55;
              if ((v60 & 1) != 0)
              {
                v63 = v55;
                v64 = v56;
              }
              v56 = v61 | v65;
              if (v61)
                v55 = v63;
              else
                v55 = v66;
              if (v61)
                v67 = v64;
              else
                v67 = v65;
              v68 = objc_msgSend(v59, "isNarrowWithScale:", pinchingMonthWeekScale);
              v69 = objc_msgSend(v59, "isNarrowWithScale:", v37);
              if (v68 | v69 ^ 1)
                v56 = v67;
              if (v68 && (v69 & 1) == 0 && ((v62 ^ 1) & 1) == 0)
              {
                objc_msgSend(v59, "finishAnimations");
                v56 = 1;
              }
              if (((objc_msgSend(v59, "animating") | v55) & 1) != 0)
                objc_msgSend(v59, "animateToScale:fromScale:completionBlock:", 0, v37, pinchingMonthWeekScale);
              v70 = objc_msgSend(v59, "nearestSnapBoundaryForScale:", v37);
            }
            v71 = (unint64_t)v70;
            v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
          }
          while (v54);
          self = v103;
          v4 = v104;
          v15 = v102;
        }
        else
        {
          v71 = 0;
          LOBYTE(v56) = 0;
        }

        v72 = objc_opt_new(UIImpactFeedbackGenerator);
        v73 = v72;
        if ((v56 & 1) != 0)
        {
          -[UIImpactFeedbackGenerator impactOccurredWithIntensity:](v72, "impactOccurredWithIntensity:", 2.0);
        }
        else if (v71 != self->_lastSnapScale)
        {
          -[UIImpactFeedbackGenerator impactOccurredWithIntensity:](v72, "impactOccurredWithIntensity:", 1.0);
        }
        self->_lastSnapScale = v71;
        self->_pinchingMonthWeekScale = v37;

      }
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v74 = self->_pinchViews;
      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v109;
        v78 = 0.0;
        do
        {
          for (k = 0; k != v76; k = (char *)k + 1)
          {
            if (*(_QWORD *)v109 != v77)
              objc_enumerationMutation(v74);
            v80 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)k);
            -[UIScrollView bounds](self->_pinchScrollView, "bounds");
            objc_msgSend(v80, "sizeThatFits:", v81, v82);
            v84 = v83;
            objc_msgSend(v80, "frame");
            objc_msgSend(v80, "setFrame:");
            v78 = v78 + v84;
            objc_msgSend(v80, "layoutSubviews");
          }
          v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        }
        while (v76);
      }

      pinchScrollView = self->_pinchScrollView;
      -[UIScrollView contentSize](pinchScrollView, "contentSize");
      -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
      -[UIScrollView contentOffset](self->_pinchScrollView, "contentOffset");
      v87 = v86;
      v89 = v88;
      v90 = v44 * v50;
      if (v15)
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
        v92 = v106;
        objc_msgSend(v91, "convertPoint:fromView:", v106, v48, v90);
        v94 = v93;

        v95 = v94 - p_lastPinchPoint->y;
      }
      else
      {
        v92 = v106;
        objc_msgSend(v4, "locationInView:", v106);
        v95 = v90 - v96;
      }
      v97 = v89 + v95;
      -[UIScrollView contentSize](self->_pinchScrollView, "contentSize");
      v99 = v98;
      -[UIScrollView frame](self->_pinchScrollView, "frame");
      v101 = 0.0;
      if (v97 >= 0.0)
        v101 = v97;
      if (v101 >= v99 - v100)
        v101 = v99 - v100;
      -[UIScrollView setContentOffset:animated:](self->_pinchScrollView, "setContentOffset:animated:", 0, v87, v101);

    }
    else if (v5 == (char *)1)
    {
      self->_eventLoadingSuspendedForPinching = 1;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "panGestureRecognizer"));
      objc_msgSend(v27, "setEnabled:", 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "panGestureRecognizer"));
      objc_msgSend(v29, "setEnabled:", 1);

      if (v15)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
        self->_lastPinchDistance.x = pinchDistanceForGestureRecognizer(v4, v30);
        self->_lastPinchDistance.y = v31;

      }
      -[CompactWidthMonthViewController prepareToChangeScaleFromPinch:](self, "prepareToChangeScaleFromPinch:", 1);
      self->_originalPinchDistance = self->_lastPinchDistance.y;
      -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
      self->_originalPinchScale = v32;
      self->_pinchingMonthWeekScale = v32;
    }
  }

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
  v9.super_class = (Class)CompactWidthMonthViewController;
  v7 = a4;
  -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100083F58;
  v8[3] = &unk_1001B2C38;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

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
  void *v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "day");
  v6 = v4;
  if (v5 != (id)1)
  {
    v7 = objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setCompressedVerticalMode:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
    objc_msgSend(v9, "setCalendarDate:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v12, "monthWeekViewClass", v11)), "initWithCalendarDate:calendar:compressed:", v6, v10, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));

  }
  objc_msgSend(v9, "setWeekDelegate:", self);
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") && !self->_selectedMonthWeekView)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDate"));
    objc_msgSend(v13, "absoluteTime");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v16, "absoluteTime");
    if (v15 > v17)
    {

LABEL_12:
      goto LABEL_13;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v18, "absoluteTime");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endCalendarDate"));
    objc_msgSend(v21, "absoluteTime");
    v23 = v22;

    if (v20 <= v23)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v13, v9, 0);
      goto LABEL_12;
    }
  }
LABEL_13:
  -[CompactWidthMonthViewController _loadEventDataForMonthWeekView:](self, "_loadEventDataForMonthWeekView:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v9, "setShowWeekNumber:", objc_msgSend(v24, "showWeekNumbers"));

  return v9;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  id v9;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setCompressedVerticalMode:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
    objc_msgSend(v6, "setCalendarDate:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "monthWeekViewClass", v8)), "initWithCalendarDate:calendar:compressed:", v4, v7, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));

  }
  objc_msgSend(v6, "setWeekDelegate:", self);
  if (!-[CompactWidthMonthViewController suspendEventLoading](self, "suspendEventLoading"))
    -[CompactWidthMonthViewController _loadEventDataForMonthWeekView:](self, "_loadEventDataForMonthWeekView:", v6);
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") && !self->_selectedMonthWeekView)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDate"));
    objc_msgSend(v10, "absoluteTime");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v13, "absoluteTime");
    if (v12 > v14)
    {

LABEL_12:
      goto LABEL_13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v15, "absoluteTime");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endCalendarDate"));
    objc_msgSend(v18, "absoluteTime");
    v20 = v19;

    if (v17 <= v20)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v10, v6, 0);
      goto LABEL_12;
    }
  }
LABEL_13:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v6, "setShowWeekNumber:", objc_msgSend(v21, "showWeekNumbers"));

  return v6;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  id v9;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setCompressedVerticalMode:", -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
    objc_msgSend(v6, "setCalendarDate:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "monthWeekViewClass", v8)), "initWithCalendarDate:calendar:compressed:", v4, v7, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));

  }
  objc_msgSend(v6, "setWeekDelegate:", self);
  if (!-[CompactWidthMonthViewController suspendEventLoading](self, "suspendEventLoading"))
    -[CompactWidthMonthViewController _loadEventDataForMonthWeekView:](self, "_loadEventDataForMonthWeekView:", v6);
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") && !self->_selectedMonthWeekView)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDate"));
    objc_msgSend(v10, "absoluteTime");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v13, "absoluteTime");
    if (v12 < v14)
    {

LABEL_12:
      goto LABEL_13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    objc_msgSend(v15, "absoluteTime");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endCalendarDate"));
    objc_msgSend(v18, "absoluteTime");
    v20 = v19;

    if (v17 <= v20)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v10, v6, 0);
      goto LABEL_12;
    }
  }
LABEL_13:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  objc_msgSend(v6, "setShowWeekNumber:", objc_msgSend(v21, "showWeekNumbers"));

  return v6;
}

- (void)didEndScrolling
{
  dispatch_time_t v3;
  void *v4;
  CompactMonthWeekView *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController didEndScrolling](&v9, "didEndScrolling");
  if (self->_eventLoadingSuspendedForScroll && !self->_reloadAfterStoppedScrolling)
  {
    self->_reloadAfterStoppedScrolling = 1;
    v3 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000847BC;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    && -[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000847F0;
    v7[3] = &unk_1001B2538;
    v7[4] = self;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v7, 0, 0.0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v5 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));

    if (v5 != self->_selectedMonthWeekView)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v6, v5, 1);

    }
  }
  else if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
         && !-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible"))
  {
    self->_listFrameNeedsUpdate = 1;
  }
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y;
  double x;
  CompactMonthWeekView *v8;
  double v9;
  CompactMonthWeekView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  void *v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[6];
  id v83;
  id v84;
  objc_super v85;
  CGRect v86;

  y = a3.y;
  x = a3.x;
  if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    v85.receiver = self;
    v85.super_class = (Class)CompactWidthMonthViewController;
    -[MonthViewController willEndDraggingWithVelocity:targetContentOffset:](&v85, "willEndDraggingWithVelocity:targetContentOffset:", a4, x, y);
    return;
  }
  v8 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v9 = -y;
  if (y >= 0.0)
    v9 = y;
  if (v9 <= 0.3)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v35, "contentOffset");
    v37 = v36;
    v39 = v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v40, "frame");
    v42 = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v43, "safeAreaInsets");
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v46, "safeAreaInsets");
    v48 = v42 - (v45 + v47);

    -[UIView bounds](self->_listViewContainer, "bounds");
    v83 = 0;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v83, v37, v39 + (v48 - CGRectGetHeight(v86)) * 0.5);
    v50 = v49;
    v52 = v51;
    v34 = v83;
    a4->x = v50;
    a4->y = v52;
    v10 = v8;
  }
  else
  {
    v10 = self->_selectedMonthWeekView;
    if (!v10)
      v10 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstView](self, "firstView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v12 = v11;
    if (y > 0.0)
      v13 = 1;
    else
      v13 = -1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDateByAddingMonths:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "calendarDateForMonth"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](v10, "calendarDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "components:fromDate:toDate:options:", 0x2000, v18, v19, 0));

    -[CompactMonthWeekView frame](v10, "frame");
    v22 = v21;
    -[CompactMonthWeekView frame](v10, "frame");
    v24 = v23;
    v26 = v25 + (double)(uint64_t)objc_msgSend(v20, "weekOfYear") * v22;
    if (y <= 0.0)
    {
      *(_QWORD *)&v27 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(objc_msgSend(v28, "monthWeekViewClass", v27), "headerHeight");
      v26 = v26 - v29;
    }
    v84 = v15;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v84, v24, v26);
    v31 = v30;
    v33 = v32;
    v34 = v84;

    a4->x = v31;
    a4->y = v33;

  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v54 = objc_msgSend(v53, "contentOffset");
  v57 = CalRoundPointToScreenScale(v54, v55, v56);
  v59 = v58;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v60, "stopScrollingAndZooming");

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v61, "setContentOffset:animated:", 0, v57, v59);

  v81[4] = self;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100084DBC;
  v82[3] = &unk_1001B2838;
  v82[4] = self;
  v82[5] = a4;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100084E04;
  v81[3] = &unk_1001B25D0;
  +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 393222, v82, v81, 0.0, y);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v63 = objc_msgSend(v62, "month");
  if (v63 != objc_msgSend(v34, "month"))
  {

LABEL_19:
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController adjustSelectedDateForNewMonth:](self, "adjustSelectedDateForNewMonth:", v34));

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v68, "setSelectedDate:", v67);

    if (-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible"))
    {
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_100084E0C;
      v80[3] = &unk_1001B2538;
      v80[4] = self;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v80, 0, 0.0, 0.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v69));

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v71, v70, 1);

    }
    goto LABEL_21;
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v65 = objc_msgSend(v64, "year");
  v66 = objc_msgSend(v34, "year");

  if (v65 != v66)
    goto LABEL_19;
  v67 = v34;
LABEL_21:
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "calendarDateForMonth"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v73));

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100084E14;
  v78[3] = &unk_1001B2538;
  v79 = v74;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100084E20;
  v76[3] = &unk_1001B25D0;
  v77 = v79;
  v75 = v79;
  +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v78, v76, 0.0, 0.0);

}

- (void)didScroll
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController didScroll](&v4, "didScroll");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController targetCalendarDate](self, "targetCalendarDate"));
  if (v3)
    -[CompactWidthMonthViewController _updateNavigationControllerBackButtonToDate:](self, "_updateNavigationControllerBackButtonToDate:", v3);
  self->_reloadAfterStoppedScrolling = 0;

}

- (id)targetCalendarDate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double Height;
  id v20;
  CGRect v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v14, "safeAreaInsets");
  v16 = v10 - (v13 + v15);

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    && !self->_dividedListModeAnimationInProgress)
  {
    -[UIView frame](self->_listViewContainer, "frame");
    if (v17 >= v16)
      -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
  }
  -[UIView bounds](self->_listViewContainer, "bounds");
  Height = CGRectGetHeight(v21);
  if (-[InfiniteScrollViewController subviewCount](self, "subviewCount") < 1)
    return 0;
  v20 = 0;
  -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v20, v5, v7 + (v16 - Height) * 0.5);
  return v20;
}

- (void)didLoadInitialViews
{
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CompactWidthMonthViewController;
  -[InfiniteScrollViewController showDate:animated:completionBlock:](&v10, "showDate:animated:completionBlock:", a3, a4, a5);
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v9, v8, v5);

  }
}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return !-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
}

- (id)cellFramesForWeekContainingDate:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  model = self->super.super.super.super._model;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dayNumberCellFrames"));

  return v10;
}

- (void)contentSizeCategoryChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController contentSizeCategoryChanged](&v3, "contentSizeCategoryChanged");
  -[CompactWidthMonthViewController _updateMonthTitleViewFont](self, "_updateMonthTitleViewFont");
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v10)
  {
    v12 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startCalendarDate"));
    -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v13);

    if (!v12 || a5)
      -[CompactWidthMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", v10, v8, a5, v11);
  }
  else
  {
    v14 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Month View.", v15, 2u);
    }
  }

}

- (void)updatePalette:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController updatePalette:](&v5, "updatePalette:", v4);

}

- (void)_updateNavigationControllerBackButtonToDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v4, "updateBackButtonToDate:") & 1) != 0)
    objc_msgSend(v4, "updateBackButtonToDate:", v5);

}

- (void)_updateNavigationControllerBackButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  -[CompactWidthMonthViewController _updateNavigationControllerBackButtonToDate:](self, "_updateNavigationControllerBackButtonToDate:", v3);

}

- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3
{
  id v5;
  void *v6;
  EKCalendarDate **p_currentBackButtonDate;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = v5;
  p_currentBackButtonDate = &self->_currentBackButtonDate;
  if (*p_currentBackButtonDate
    && (v8 = objc_msgSend(v5, "month"), v8 == -[EKCalendarDate month](*p_currentBackButtonDate, "month"))
    && (v9 = objc_msgSend(v6, "year"), v9 == -[EKCalendarDate year](*p_currentBackButtonDate, "year"))
    && (v10 = objc_msgSend(v6, "day"), v10 == -[EKCalendarDate day](*p_currentBackButtonDate, "day")))
  {
    v11 = 0;
  }
  else
  {
    objc_storeStrong((id *)p_currentBackButtonDate, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    v13 = CUIKStringForYear();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  return v11;
}

- (id)bestDateForNewEvent
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CompactWidthMonthViewController;
    v5 = -[MonthViewController bestDateForNewEvent](&v7, "bestDateForNewEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (-[CompactWidthMonthViewController isTodayVisible](self, "isTodayVisible")
    && !(v3 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")))
  {
    v8 = CUIKTodayDate(v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v10));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController bestDateForNewEvent](self, "bestDateForNewEvent"));
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      v5 = v5;
      v6 = v5;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForMonth"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDateByAddingDays:", 2));

    }
  }

  return v6;
}

- (id)sceneTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v9;
  objc_super v10;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v6 = CUIKStringForMonthYear(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CompactWidthMonthViewController;
    v9 = -[MonthViewController sceneTitle](&v10, "sceneTitle");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }
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
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
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

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController monthWeekViewForCalendarDate:](self, "monthWeekViewForCalendarDate:", v7));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frameForTodayHighlight");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
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

- (BOOL)_isTodayHighlightVisible
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController monthWeekViewForCalendarDate:](self, "monthWeekViewForCalendarDate:", v7));
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "isTodayHighlightVisible");
  else
    v10 = 0;

  return v10;
}

- (BOOL)isTodayVisible
{
  _BOOL4 v3;

  v3 = -[CompactWidthMonthViewController _isTodayCircleFrameFullyUnobstructed](self, "_isTodayCircleFrameFullyUnobstructed");
  if (v3)
    LOBYTE(v3) = -[CompactWidthMonthViewController _isTodayHighlightVisible](self, "_isTodayHighlightVisible");
  return v3;
}

- (BOOL)_isTodayCircleFrameFullyUnobstructed
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat Width;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[InfiniteScrollViewController unobstructedScrollViewHeight](self, "unobstructedScrollViewHeight");
  v4 = v3;
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    -[CompactWidthMonthViewController frameOfListView](self, "frameOfListView");
    v6 = v4 - v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v7, "safeAreaInsets");
    v4 = v6 + v8;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v19);

  -[CompactWidthMonthViewController frameForTodayHighlight](self, "frameForTodayHighlight");
  v21.origin.x = v14;
  v21.origin.y = v15;
  v21.size.width = v16;
  v21.size.height = v17;
  v20.origin.x = 0.0;
  v20.origin.y = v11;
  v20.size.width = Width;
  v20.size.height = v4;
  return CGRectContainsRect(v20, v21);
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4;
  double v5;
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(v6, "monthWeekViewClass", v5);
  v8 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v10 = EKUICurrentWindowSize(v9);
  v12 = v11;
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  objc_msgSend(v7, "heightForViewWithCalendarDate:compressed:windowSize:scale:", v4, v8, v10, v12, v13);
  v15 = v14;

  return v15;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  _BOOL8 v3;
  double v4;

  v3 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 3.5;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  _BOOL8 v3;
  double v4;

  v3 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 5.5;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  _BOOL8 v3;
  double v4;

  v3 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 1.1;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  double result;

  if (objc_msgSend(a3, "weekOfMonth") != (id)1)
    return 0.0;
  -[CompactWidthMonthViewController _showDateVerticalOffset](self, "_showDateVerticalOffset");
  return result;
}

- (double)_showDateVerticalOffset
{
  double v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = objc_msgSend(v3, "monthWeekViewClass", v2);
  objc_msgSend(v4, "headerHeight");
  v6 = v5;
  objc_msgSend(v4, "grayLineHeight");
  return v6 + v7 + -0.5;
}

- (id)pushedMultiDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MultiDayWeekViewContainerViewController *v6;
  CUIKCalendarModel *model;
  void *v8;
  MultiDayWeekViewContainerViewController *v9;
  void *v10;

  v4 = a4;
  -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", a3);
  v6 = [MultiDayWeekViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v9 = -[MainViewControllerContainer initWithModel:window:](v6, "initWithModel:window:", model, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, v4);

  return v9;
}

- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  ListViewContainerViewController *v6;
  CUIKCalendarModel *model;
  void *v8;
  ListViewContainerViewController *v9;
  void *v10;

  v4 = a4;
  -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", a3);
  v6 = [ListViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v9 = -[MainViewControllerContainer initWithModel:window:](v6, "initWithModel:window:", model, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, v4);

  return v9;
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

- (CGRect)frameOfListView
{
  UIView *listViewContainer;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  listViewContainer = self->_listViewContainer;
  if (listViewContainer)
  {
    if (self->_listFrameNeedsUpdate)
    {
      -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
      listViewContainer = self->_listViewContainer;
    }
    -[UIView frame](listViewContainer, "frame");
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)dateForTopVisibleMonthOnScreen
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  v4 = v3;
  if (v3 && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate")), v5, v5))
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDate"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewOnScreen](self, "dateOfCenterViewOnScreen"));
  v7 = (void *)v6;

  return v7;
}

- (id)dateForCurrentMonthOnScreen
{
  void *v3;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dateForTopVisibleMonthOnScreen](self, "dateForTopVisibleMonthOnScreen"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewOnScreen](self, "dateOfCenterViewOnScreen"));
  return v3;
}

- (void)forceUpdateListView
{
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    -[CompactMonthListViewController forceUpdate](self->_listViewController, "forceUpdate");
}

- (void)_updateMonthTitleViewFont
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle3, 32770, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController monthTitleView](self, "monthTitleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
  objc_msgSend(v3, "setFont:", v4);

}

- (void)_updateDateForDividedList
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingDays:", 1));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForDay"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "date"));
    v7 = CUIKTodayDate(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v5, "compare:", v8);

    if (!v9)
    {
      v12 = CUIKTodayDate(v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v13, v15));
      -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "date"));
      -[MonthViewController showDate:animated:](self, "showDate:animated:", v20, 0);

      -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
    }

  }
}

- (void)significantTimeChangeOccurred
{
  NSCalendar *weekCalculationCalendar;

  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B38D0);
  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  if (-[CUIKCalendarModel currentlyLocked](self->super.super.super.super._model, "currentlyLocked"))
    self->_needsUpdateOnModelUnlock = 1;
  else
    -[CompactWidthMonthViewController _updateDateForDividedList](self, "_updateDateForDividedList");
}

- (void)_modelUnlocked
{
  if (self->_needsUpdateOnModelUnlock)
  {
    self->_needsUpdateOnModelUnlock = 0;
    -[CompactWidthMonthViewController _updateDateForDividedList](self, "_updateDateForDividedList");
  }
}

- (void)localeChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController localeChanged](&v3, "localeChanged");
  -[CompactWidthMonthViewController _updateViewsForTimeZoneChange](self, "_updateViewsForTimeZoneChange");
}

- (void)calendarModelTimeZoneChanged
{
  objc_super v3;

  -[CUIKCalendarModel updateSelectedDateTimeZone](self->super.super.super.super._model, "updateSelectedDateTimeZone");
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  -[MonthViewController calendarModelTimeZoneChanged](&v3, "calendarModelTimeZoneChanged");
  -[CompactWidthMonthViewController _updateViewsForTimeZoneChange](self, "_updateViewsForTimeZoneChange");
}

- (void)_weekStartChanged:(id)a3
{
  NSCalendar *weekCalculationCalendar;
  void *v5;
  void *v6;

  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDate"));
  -[InfiniteScrollViewController reinitializeAllViewsWithCalendarDate:](self, "reinitializeAllViewsWithCalendarDate:", v6);

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");
}

- (void)_updateViewsForTimeZoneChange
{
  void *v3;
  void *v4;
  id v5;
  NSCalendar *weekCalculationCalendar;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeZone"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000865D4;
  v7[3] = &unk_1001B2798;
  v5 = v4;
  v8 = v5;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v7);
  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    -[CompactWidthMonthViewController _updateListViewFrame](self, "_updateListViewFrame");

}

+ (Class)monthWeekViewClass
{
  return (Class)objc_opt_class(CompactMonthWeekView);
}

+ (BOOL)shouldAnimateTransitionToDay
{
  return 1;
}

- (void)_registerGestureRecognizers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc_init((Class)UITapGestureRecognizer);
  -[CompactWidthMonthViewController setDayCellsTapGestureRecognizer:](self, "setDayCellsTapGestureRecognizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v4, "addTarget:action:", self, "_tapGestureCallback:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v5, "addGestureRecognizer:", v6);

  v7 = objc_alloc_init((Class)UILongPressGestureRecognizer);
  -[CompactWidthMonthViewController setDayCellsScrubbingGestureRecognizer:](self, "setDayCellsScrubbingGestureRecognizer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v8, "addTarget:action:", self, "_scrubGestureCallback:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v10, "addGestureRecognizer:", v11);

  *(_QWORD *)&v12 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v13, "scrubbingMinimumPressDuration", v12);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v16, "setMinimumPressDuration:", v15);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "panGestureRecognizer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v17, "requireGestureRecognizerToFail:", v18);

}

- (void)_unregisterGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsTapGestureRecognizer](self, "dayCellsTapGestureRecognizer"));
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

  -[CompactWidthMonthViewController setDayCellsTapGestureRecognizer:](self, "setDayCellsTapGestureRecognizer:", 0);
  -[CompactWidthMonthViewController setDayCellsScrubbingGestureRecognizer:](self, "setDayCellsScrubbingGestureRecognizer:", 0);
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
  v17 = sub_1000869A0;
  v18 = sub_1000869B0;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000869B8;
  v11 = &unk_1001B38F8;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);

  -[CompactWidthMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7, v8, v9, v10, v11);
  -[CompactWidthMonthViewController monthView:gestureEnded:](self, "monthView:gestureEnded:", v15[5], v7);

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
  v17 = sub_1000869A0;
  v18 = sub_1000869B0;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100086BFC;
  v11 = &unk_1001B38F8;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);

  switch((unint64_t)objc_msgSend(v7, "state", v8, v9, v10, v11))
  {
    case 1uLL:
      -[CompactWidthMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7);
      break;
    case 2uLL:
      -[CompactWidthMonthViewController monthView:gestureChanged:](self, "monthView:gestureChanged:", v15[5], v7);
      break;
    case 3uLL:
      -[CompactWidthMonthViewController monthView:gestureEnded:](self, "monthView:gestureEnded:", v15[5], v7);
      break;
    case 4uLL:
    case 5uLL:
      -[CompactWidthMonthViewController monthView:gestureCancelled:](self, "monthView:gestureCancelled:", v15[5], v7);
      break;
    default:
      break;
  }

  _Block_object_dispose(&v14, 8);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_pinchRecognizer == a4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  BOOL v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController dayCellsScrubbingGestureRecognizer](self, "dayCellsScrubbingGestureRecognizer"));
  if (v5 == v4)
  {
    v6 = -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v7 = 1;
LABEL_6:

  return v7;
}

- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4
{
  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", a4, self, 0, 0);
}

- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5
{
  -[CompactWidthMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", a4, 1, a5, 0);
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
  v16 = sub_1000869A0;
  v17 = sub_1000869B0;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100086E78;
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
  if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView")),
        v8 = objc_msgSend(v7, "isDecelerating"),
        v7,
        (v8 & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v19, v6));
    if (v9)
    {
      if (self->_pressedMonthView != v19 || objc_msgSend(v9, "compare:", self->_pressedDay))
      {
        -[CompactWidthMonthViewController _createMonthHighlightForMonthView:day:](self, "_createMonthHighlightForMonthView:day:", v19, v9);
        -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 1);
      }
      if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v10, "setScrollEnabled:", 0);

        v11 = -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v9);
        v13 = CUIKTodayDate(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v14, v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v17));

        if (v18)
          objc_msgSend(v18, "haltTodayPulse");

      }
      else
      {
        self->_shouldSetSelectedDate = 1;
      }
    }

  }
}

- (void)monthView:(id)a3 gestureChanged:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  CompactMonthWeekView *v10;
  void *v11;
  _BOOL8 v12;
  unsigned int v13;
  CompactMonthWeekView *v14;

  v14 = (CompactMonthWeekView *)a3;
  v6 = a4;
  if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView")),
        v8 = objc_msgSend(v7, "isDecelerating"),
        v7,
        (v8 & 1) == 0))
  {
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _viewFromGesture:](self, "_viewFromGesture:", v6));

      v10 = (CompactMonthWeekView *)v9;
    }
    else
    {
      v10 = v14;
    }
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v10, v6));
    v12 = v14 == self->_pressedMonthView && -[EKCalendarDate compare:](self->_pressedDay, "compare:", v11) == 0;
    if (v12 != -[TappableDayNumber isSelected](self->_pressHighlight, "isSelected"))
      -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", v12);
    v13 = !-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode");
    if (!v11)
      v13 = 1;
    if (!(v12 | v13))
    {
      -[CompactWidthMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
      -[CompactWidthMonthViewController _createMonthHighlightForMonthView:day:](self, "_createMonthHighlightForMonthView:day:", v14, v11);
      -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 1);
      -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v11);
    }

  }
}

- (void)monthView:(id)a3 gestureEnded:(id)a4
{
  CompactMonthWeekView *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];

  v6 = (CompactMonthWeekView *)a3;
  v7 = a4;
  if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView")),
        v9 = objc_msgSend(v8, "isDecelerating"),
        v8,
        (v9 & 1) == 0))
  {
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _viewFromGesture:](self, "_viewFromGesture:", v7));

      v6 = (CompactMonthWeekView *)v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _dayInMonth:fromGesture:](self, "_dayInMonth:fromGesture:", v6, v7));
    v12 = v11;
    v13 = v6 != self->_pressedMonthView || v11 == 0;
    if (v13 || objc_msgSend(v11, "compare:", self->_pressedDay))
    {
      v14 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController presentedViewController](self, "presentedViewController"));
      v14 = v18 == 0;

    }
    if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v15, "setScrollEnabled:", 1);

    }
    -[TappableDayNumber setPressed:](self->_pressHighlight, "setPressed:", 0);
    -[TappableDayNumber setHidden:](self->_pressHighlight, "setHidden:", 1);
    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _eventInMonthWeekView:fromGesture:](self, "_eventInMonthWeekView:fromGesture:", v6, v7));
      if (v16)
      {
        -[CompactWidthMonthViewController _showDetailsForEvent:animated:showMode:context:](self, "_showDetailsForEvent:animated:showMode:context:", v16, 1, 1, 0);
      }
      else if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
      {
        -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v12);
        -[CompactWidthMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
        -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v12, v6, 0);
      }
      else if (self->_shouldSetSelectedDate)
      {
        self->_shouldSetSelectedDate = 0;
        -[CUIKCalendarModel setSelectedDate:](self->super.super.super.super._model, "setSelectedDate:", v12);
        *(_QWORD *)&v19 = objc_opt_class(self).n128_u64[0];
        v21 = objc_msgSend(v20, "shouldAnimateTransitionToDay", v19);
        if (-[CUIKCalendarModel showDayAsList](self->super.super.super.super._model, "showDayAsList"))
        {
          v22 = -[CompactWidthMonthViewController pushedListViewControllerWithDate:animated:](self, "pushedListViewControllerWithDate:animated:", v12, v21);
        }
        else
        {
          v23 = (_os_feature_enabled_impl("Calendar", "all_on") & 1) == 0
             && !_os_feature_enabled_impl("MobileCal", "two_day_view");
          v24 = -[CUIKCalendarModel numDaysToShow](self->super.super.super.super._model, "numDaysToShow");
          if (v23 || v24 != (id)2)
            v26 = -[CompactWidthMonthViewController pushedDayViewControllerWithDate:animated:](self, "pushedDayViewControllerWithDate:animated:", v12, v21);
          else
            v25 = -[CompactWidthMonthViewController pushedMultiDayViewControllerWithDate:animated:](self, "pushedMultiDayViewControllerWithDate:animated:", v12, v21);
        }
      }

    }
    else
    {
      v17 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100087618;
      block[3] = &unk_1001B2538;
      block[4] = self;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (void)monthView:(id)a3 gestureCancelled:(id)a4
{
  void *v5;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v5, "setScrollEnabled:", 1);

  }
  -[CompactWidthMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
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

- (id)_eventInMonthWeekView:(id)a3 fromGesture:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a4, "locationInView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrenceAtPoint:"));

  return v6;
}

- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4
{
  id v7;
  TappableDayNumber *v8;
  TappableDayNumber *pressHighlight;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  -[CompactWidthMonthViewController _removeMonthHighlight](self, "_removeMonthHighlight");
  objc_storeStrong((id *)&self->_pressedDay, a4);
  objc_storeStrong((id *)&self->_pressedMonthView, a3);
  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v7, v13, 0);
  }
  else
  {
    v8 = -[TappableDayNumber initWithSizeClass:]([TappableDayNumber alloc], "initWithSizeClass:", 1);
    pressHighlight = self->_pressHighlight;
    self->_pressHighlight = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[TappableDayNumber setBackgroundColor:](self->_pressHighlight, "setBackgroundColor:", v10);

    -[TappableDayNumber setUserInteractionEnabled:](self->_pressHighlight, "setUserInteractionEnabled:", 0);
    objc_msgSend(v13, "adjustHighlight:forDay:", self->_pressHighlight, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    -[TappableDayNumber frame](self->_pressHighlight, "frame");
    objc_msgSend(v11, "convertRect:fromView:", v13);
    -[TappableDayNumber setFrame:](self->_pressHighlight, "setFrame:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v12, "addSubview:", self->_pressHighlight);

    -[TappableDayNumber layoutSubviews](self->_pressHighlight, "layoutSubviews");
  }

}

- (void)_removeMonthHighlight
{
  TappableDayNumber *pressHighlight;
  TappableDayNumber *v4;
  TappableDayNumber *v5;
  EKCalendarDate *pressedDay;
  CompactMonthWeekView *pressedMonthView;
  TappableDayNumber *v8;
  _QWORD v9[4];
  TappableDayNumber *v10;
  _QWORD v11[4];
  TappableDayNumber *v12;

  if (-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
  {
    -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", 0, self->_selectedMonthWeekView, 0);
    pressHighlight = self->_pressHighlight;
  }
  else
  {
    pressHighlight = self->_pressHighlight;
    if (!pressHighlight)
      return;
  }
  v4 = pressHighlight;
  v5 = self->_pressHighlight;
  self->_pressHighlight = 0;

  pressedDay = self->_pressedDay;
  self->_pressedDay = 0;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100087994;
  v11[3] = &unk_1001B2538;
  v12 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000879A0;
  v9[3] = &unk_1001B25D0;
  v10 = v12;
  v8 = v12;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v9, 0.2);

}

- (void)_setSelectedDay:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  -[CompactWidthMonthViewController _setSelectedDay:onMonthWeekView:animated:](self, "_setSelectedDay:onMonthWeekView:animated:", v5, v6, 0);

}

- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  CompactMonthWeekView *v8;
  CompactMonthWeekView **p_selectedMonthWeekView;
  CompactMonthWeekView *selectedMonthWeekView;
  CompactMonthWeekView *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = (CompactMonthWeekView *)a4;
  p_selectedMonthWeekView = &self->_selectedMonthWeekView;
  selectedMonthWeekView = self->_selectedMonthWeekView;
  if (selectedMonthWeekView != v8)
  {
    -[CompactMonthWeekView setSelectedDay:animated:](selectedMonthWeekView, "setSelectedDay:animated:", 0, 0);
    v11 = *p_selectedMonthWeekView;
    *p_selectedMonthWeekView = 0;

  }
  if (v12)
  {
    if (v8)
    {
      -[CompactMonthWeekView setSelectedDay:animated:](v8, "setSelectedDay:animated:", v12, v5);
      objc_storeStrong((id *)&self->_selectedMonthWeekView, a4);
    }
    -[CompactWidthMonthViewController _updateNavigationControllerBackButtonToDate:](self, "_updateNavigationControllerBackButtonToDate:", v12);
  }

}

- (void)_resetSelectionForDividedListState:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CompactMonthWeekView *v12;
  id v13;
  id *p_selectedMonthWeekView;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  CompactMonthWeekView *selectedMonthWeekView;
  CompactMonthWeekView *v22;
  id v23;

  v3 = a3;
  v5 = -[InfiniteScrollViewController subviewCount](self, "subviewCount");
  if (v5)
  {
    v7 = CUIKTodayDate(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    v23 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v23));
    if (v3)
    {
      v12 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
      v13 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v12));
      p_selectedMonthWeekView = (id *)&self->_selectedMonthWeekView;
      v15 = *p_selectedMonthWeekView;
      if (*p_selectedMonthWeekView)
        v16 = v15 == v13;
      else
        v16 = 1;
      if (!v16)
      {
        objc_msgSend(v15, "setSelectedDay:animated:", 0, 0);
        v17 = *p_selectedMonthWeekView;
        *p_selectedMonthWeekView = 0;

      }
      v18 = objc_msgSend(v23, "month");
      if (v18 != -[CompactMonthWeekView month](v12, "month")
        || ((v19 = objc_msgSend(v23, "year"), v19 == -[CompactMonthWeekView year](v12, "year"))
          ? (v20 = v11 == 0)
          : (v20 = 1),
            v20))
      {
        objc_msgSend(v11, "setSelectedDay:animated:", 0, 0);
        objc_msgSend(v13, "setSelectedDay:animated:", v12, 1);
        objc_storeStrong(p_selectedMonthWeekView, v13);
      }
      else
      {
        objc_storeStrong(p_selectedMonthWeekView, v11);
        objc_msgSend(v11, "setSelectedDay:animated:", v23, 1);
      }

    }
    else
    {
      selectedMonthWeekView = self->_selectedMonthWeekView;
      if (selectedMonthWeekView)
      {
        -[CompactMonthWeekView setSelectedDay:animated:](selectedMonthWeekView, "setSelectedDay:animated:", 0, 0);
        v22 = self->_selectedMonthWeekView;
        self->_selectedMonthWeekView = 0;

      }
      if (v11)
        objc_msgSend(v11, "setSelectedDay:animated:", v23, 0);
      v12 = self->_selectedMonthWeekView;
      self->_selectedMonthWeekView = 0;
    }

  }
}

- (void)_cachedOccurrencesChanged:(id)a3
{
  if (-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible", a3))
    -[CompactWidthMonthViewController _loadEventsForAllSubviews](self, "_loadEventsForAllSubviews");
  else
    self->_needToReloadEventsOnAppear = 1;
}

- (void)_occurrencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));

    -[CompactWidthMonthViewController _loadEventsForViewsInRangeStartingAt:endingAt:](self, "_loadEventsForViewsInRangeStartingAt:endingAt:", v5, v7);
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
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];

  v6 = a3;
  v7 = a4;
  if (self->_eventLoadingSuspendedForScroll)
  {
    if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
      if (v8 < 0.0)
        v8 = -v8;
      if (v8 < 0.4)
      {
        self->_eventLoadingSuspendedForScroll = 0;
        -[CompactWidthMonthViewController _loadEventsForAllSubviews](self, "_loadEventsForAllSubviews");
      }
    }
  }
  else
  {
    -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
    if (v9 < 0.0)
      v9 = -v9;
    if (v9 >= 1.0)
    {
      self->_eventLoadingSuspendedForScroll = 1;
    }
    else if (!self->_eventLoadingSuspendedForPinching)
    {
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v11 = v10;
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100087F3C;
      v13[3] = &unk_1001B3920;
      v13[5] = v12;
      v13[6] = v11;
      v13[4] = self;
      -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v13);
    }
  }

}

- (void)_loadEventDataForMonthWeekView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *reloadQueue;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endCalendarDate"));
  reloadQueue = self->_reloadQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000880B8;
  v11[3] = &unk_1001B2C88;
  v11[4] = self;
  v12 = v5;
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  v10 = v5;
  dispatch_async(reloadQueue, v11);

}

- (void)_loadEventsForAllSubviews
{
  double v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  if (-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible"))
  {
    if (self->_loadingOccurrenceCache)
      return;
    -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
    if (v3 < 0.0)
      v3 = -v3;
    v4 = 330;
    if (v3 < 0.4)
    {
      self->_eventLoadingSuspendedForScroll = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000883C8;
      v6[3] = &unk_1001B2798;
      v6[4] = self;
      -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      objc_msgSend(v5, "startNotificationMonitor");

      return;
    }
  }
  else
  {
    v4 = 329;
  }
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa + v4) = 1;
}

- (void)_dayIndexesForRangeStart:(id)a3 rangeEnd:(id)a4 outFirstDayIndex:(int64_t *)a5 outLastDayIndex:(int64_t *)a6
{
  CUIKCalendarModel *model;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a4;
  model = self->super.super.super.super._model;
  v11 = a3;
  v12 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:](model, "sectionForCachedOccurrencesOnDate:", v11);
  v13 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:](self->super.super.super.super._model, "sectionForCachedOccurrencesOnDate:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v12));
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v13));
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v21 = v20;

  if (v16 < v21)
  {
    ++v12;
    if (!a5)
      goto LABEL_8;
LABEL_7:
    *a5 = (int64_t)v12;
    goto LABEL_8;
  }
  objc_msgSend(v23, "timeIntervalSinceReferenceDate");
  if (v19 > v22)
    --v13;
  if (a5)
    goto LABEL_7;
LABEL_8:
  if (a6)
    *a6 = (int64_t)v13;

}

- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  const void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  CUIKCalendarModel *model;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  _BYTE *v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *i;
  void *v71;
  dispatch_queue_global_t global_queue;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  _QWORD v97[5];
  id v98;
  id v99;
  void *v100;
  void *v101;
  _QWORD block[5];
  _BYTE v103[128];
  _BYTE buf[12];
  __int16 v105;
  void *v106;

  v6 = a3;
  v7 = a4;
  if (self->_eventLoadingSuspendedForScroll)
  {
    if (!-[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"))
    {
      -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
      if (v8 < 0.0)
        v8 = -v8;
      if (v8 < 0.4)
      {
        self->_eventLoadingSuspendedForScroll = 0;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100088E74;
        block[3] = &unk_1001B2538;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    goto LABEL_11;
  }
  -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 1.0)
  {
    v10 = 0;
    self->_eventLoadingSuspendedForScroll = 1;
    goto LABEL_13;
  }
  if (!self->_eventLoadingSuspendedForPinching)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForDay"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDateForEndOfDay"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
    v14 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "timeZone"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "date"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
    v100 = 0;
    v101 = 0;
    CalEventOccurrenceCacheCopyBoundsForTimeZone(v14, &v101, &v100);
    if (v14)
      CFRelease(v14);
    v16 = v100;
    v15 = v101;
    v17 = (unint64_t)objc_msgSend(v11, "differenceInDays:", v12);
    if ((v17 & 0x8000000000000000) != 0)
    {
      v51 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        v105 = 2112;
        v106 = v11;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Loading events for week failed, End Date is before Start Date %@ %@", buf, 0x16u);
      }
      v10 = 0;
      v22 = v88;
      goto LABEL_53;
    }
    v18 = (char *)(v17 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v17 + 1));
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekDayData dayDataWithEventCount:dayType:](CompactMonthWeekDayData, "dayDataWithEventCount:dayType:", 0, 0));
      objc_msgSend(v19, "addObject:", v20);

      --v18;
    }
    while (v18);
    if (objc_msgSend(v91, "compare:", v15) != (id)1 || objc_msgSend(v88, "compare:", v16) != (id)-1)
    {
      v79 = v16;
      v81 = v15;
      v83 = v11;
      model = self->super.super.super.super._model;
      v22 = v88;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](model, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v91, v88, 1, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "occurrences"));

      v89 = (uint64_t)objc_msgSend(v24, "count");
      if (v89 >= 1)
      {
        v25 = 0;
        v85 = v24;
        do
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
          objc_msgSend(v27, "timeIntervalSinceReferenceDate");
          v29 = v28;

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
          objc_msgSend(v30, "timeIntervalSinceReferenceDate");
          v32 = v31;

          objc_msgSend(v91, "timeIntervalSinceReferenceDate");
          v34 = v33;
          objc_msgSend(v22, "timeIntervalSinceReferenceDate");
          v36 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endCalendarDate"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allComponents"));

          if (!objc_msgSend(v38, "hour") && !objc_msgSend(v38, "minute"))
          {
            v39 = objc_msgSend(v38, "second");
            if (v29 != v32 && v39 == 0)
              v32 = v32 + -1.0;
          }
          if (v29 > v36 || v32 < v34)
          {
            v45 = v38;
          }
          else
          {
            if (v29 < v34)
              v29 = v34;
            if (v32 > v36)
              v32 = v36;
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[EventSummaryData eventSummaryDataFromEKEvent:](EventSummaryData, "eventSummaryDataFromEKEvent:", v26));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v29));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "components:fromDate:", 30, v42));

            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v32));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "components:fromDate:", 30, v44));

            v46 = (char *)objc_msgSend(v43, "day");
            if ((uint64_t)v46 <= (uint64_t)objc_msgSend(v45, "day"))
            {
              do
              {
                v47 = v46 - (_BYTE *)objc_msgSend(v12, "day");
                if (v47 >= 0 && v47 < (uint64_t)objc_msgSend(v19, "count"))
                {
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v47));
                  objc_msgSend(v48, "setEventCount:", (char *)objc_msgSend(v48, "eventCount") + 1);
                  objc_msgSend(v48, "setDayType:", 0);
                  objc_msgSend(v48, "setDayTypeBadgeColor:", 0);
                  objc_msgSend(v48, "setDayTypeBadgeLocale:", 0);
                  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "eventSummaryData"));
                  if (!v49)
                  {
                    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v19, "count")));
                    objc_msgSend(v48, "setEventSummaryData:", v49);
                  }
                  objc_msgSend(v49, "addObject:", v41);

                }
                v50 = (uint64_t)v46++ < (uint64_t)objc_msgSend(v45, "day");
              }
              while (v50);
            }

            v22 = v88;
            v24 = v85;
          }

          ++v25;
        }
        while (v25 != v89);
      }

      v15 = v81;
      v11 = v83;
      v16 = v79;
LABEL_48:
      v10 = v19;
LABEL_49:

LABEL_53:
      goto LABEL_14;
    }
    if ((-[CUIKCalendarModel cachedOccurrencesAreLoaded](self->super.super.super.super._model, "cachedOccurrencesAreLoaded") & 1) != 0)
    {
      if (!self->_loadingOccurrenceCache)
      {
        *(_QWORD *)buf = 0;
        v96 = 0;
        -[CompactWidthMonthViewController _dayIndexesForRangeStart:rangeEnd:outFirstDayIndex:outLastDayIndex:](self, "_dayIndexesForRangeStart:rangeEnd:outFirstDayIndex:outLastDayIndex:", v91, v88, buf, &v96);
        v52 = *(_QWORD *)buf;
        if (*(uint64_t *)buf <= v96)
        {
          v82 = v15;
          v84 = v11;
          v80 = v16;
          do
          {
            v53 = (uint64_t)-[CUIKCalendarModel numberOfCachedOccurrencesInSection:](self->super.super.super.super._model, "numberOfCachedOccurrencesInSection:", v52);
            if (v53 >= 1)
            {
              v76 = v53;
              v90 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel cachedSpecialDayDataForSection:](self->super.super.super.super._model, "cachedSpecialDayDataForSection:", v52));
              v86 = v52;
              v78 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:](self->super.super.super.super._model, "dateForCachedOccurrencesInSection:", v52));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "components:fromDate:", 30));
              v55 = objc_msgSend(v54, "month");
              if (v55 == objc_msgSend(v12, "month"))
              {
                v56 = objc_msgSend(v54, "day");
                v57 = v56 - (_BYTE *)objc_msgSend(v12, "day");
                if (v57 >= 0 && v57 < (uint64_t)objc_msgSend(v19, "count"))
                {
                  v74 = v57;
                  v75 = v54;
                  if (v90)
                  {
                    v58 = v90;
                    v59 = objc_msgSend(v90, "dayType");
                    v60 = v86;
                  }
                  else
                  {
                    v59 = 0;
                    v60 = v86;
                    v58 = 0;
                  }
                  v61 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekDayData dayDataWithEventCount:dayType:](CompactMonthWeekDayData, "dayDataWithEventCount:dayType:", v76, v59));
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "color"));
                  objc_msgSend(v61, "setDayTypeBadgeColor:", v62);

                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "locale"));
                  v77 = v61;
                  objc_msgSend(v61, "setDayTypeBadgeLocale:", v63);

                  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel cachedOccurrencesForSection:](self->super.super.super.super._model, "cachedOccurrencesForSection:", v60));
                  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v64, "count")));
                  v92 = 0u;
                  v93 = 0u;
                  v94 = 0u;
                  v95 = 0u;
                  v66 = v64;
                  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
                  if (v67)
                  {
                    v68 = v67;
                    v69 = *(_QWORD *)v93;
                    do
                    {
                      for (i = 0; i != v68; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v93 != v69)
                          objc_enumerationMutation(v66);
                        v71 = (void *)objc_claimAutoreleasedReturnValue(+[EventSummaryData eventSummaryDataFromEKEvent:](EventSummaryData, "eventSummaryDataFromEKEvent:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i)));
                        objc_msgSend(v65, "addObject:", v71);

                      }
                      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
                    }
                    while (v68);
                  }

                  objc_msgSend(v77, "setEventSummaryData:", v65);
                  objc_msgSend(v19, "setObject:atIndexedSubscript:", v77, v74);

                  v15 = v82;
                  v11 = v84;
                  v16 = v80;
                  v54 = v75;
                }
              }

              v52 = v86;
            }
            v50 = v52++ < v96;
          }
          while (v50);
        }
        v22 = v88;
        goto LABEL_48;
      }
    }
    else if (!self->_loadingOccurrenceCache)
    {
      self->_loadingOccurrenceCache = 1;
      global_queue = dispatch_get_global_queue(2, 0);
      v73 = objc_claimAutoreleasedReturnValue(global_queue);
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_100088E7C;
      v97[3] = &unk_1001B2CD8;
      v97[4] = self;
      v98 = v91;
      v22 = v88;
      v99 = v88;
      dispatch_async(v73, v97);

      v10 = 0;
      goto LABEL_49;
    }
    v10 = 0;
    v22 = v88;
    goto LABEL_49;
  }
LABEL_11:
  v10 = 0;
LABEL_13:
  v11 = v7;
  v12 = v6;
LABEL_14:

  return v10;
}

- (BOOL)_shouldAnimateDots
{
  double v2;

  -[CompactWidthMonthViewController _scrollViewVerticalVelocity](self, "_scrollViewVerticalVelocity");
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

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)enterAnimationSplitStateWithCutOutArea:(CGRect)a3 topBoundary:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIColor *v24;
  UIColor *originalBackgroundColor;
  void *v26;
  UIColor *v27;
  UIColor *originalScrollViewBackgroundColor;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  TappableDayNumber *pressHighlight;
  NSArray *originalSubviewYs;
  NSArray *v38;
  NSArray *clipViews;
  NSArray *v40;
  NSArray *viewsToMove;
  NSArray *v42;
  void **v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  CompactWidthMonthViewController *v47;
  NSArray *v48;
  NSArray *v49;
  NSArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  if (!self->_inAnimationSplitState)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[InfiniteScrollViewController setSuppressViewAdjustments:](self, "setSuppressViewAdjustments:", 1);
    self->_inAnimationSplitState = 1;
    self->_splitCutOutRect.origin.x = x;
    self->_splitCutOutRect.origin.y = y;
    self->_splitCutOutRect.size.width = width;
    self->_splitCutOutRect.size.height = height;
    self->_topBoundaryY = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v10, "convertRect:fromView:", v11, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[InfiniteScrollViewController subviewCount](self, "subviewCount")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[InfiniteScrollViewController subviewCount](self, "subviewCount")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    v24 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "backgroundColor"));
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v27 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "backgroundColor"));
    originalScrollViewBackgroundColor = self->_originalScrollViewBackgroundColor;
    self->_originalScrollViewBackgroundColor = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v30, "setBackgroundColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v32, "setBackgroundColor:", v31);

    v43 = _NSConcreteStackBlock;
    v44 = 3221225472;
    v45 = sub_10008939C;
    v46 = &unk_1001B3970;
    v47 = self;
    v33 = v20;
    v48 = v33;
    v51 = v13;
    v52 = v15;
    v53 = v17;
    v54 = v19;
    v34 = v21;
    v49 = v34;
    v35 = v22;
    v50 = v35;
    -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &v43);
    pressHighlight = self->_pressHighlight;
    if (pressHighlight)
      -[TappableDayNumber setHidden:](pressHighlight, "setHidden:", 1, v43, v44, v45, v46, v47, v48, v49);
    originalSubviewYs = self->_originalSubviewYs;
    self->_originalSubviewYs = v33;
    v38 = v33;

    clipViews = self->_clipViews;
    self->_clipViews = v34;
    v40 = v34;

    viewsToMove = self->_viewsToMove;
    self->_viewsToMove = v35;
    v42 = v35;

    self->_splitOpen = 0;
  }
}

- (void)endAnimationSplitState
{
  UIColor *originalBackgroundColor;
  void *v4;
  UIColor *originalScrollViewBackgroundColor;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  NSArray *originalSubviewYs;
  NSArray *clipViews;
  NSArray *viewsToMove;
  UIColor *v27;
  UIColor *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  if (self->_inAnimationSplitState)
  {
    originalBackgroundColor = self->_originalBackgroundColor;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v4, "setBackgroundColor:", originalBackgroundColor);

    originalScrollViewBackgroundColor = self->_originalScrollViewBackgroundColor;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v6, "setBackgroundColor:", originalScrollViewBackgroundColor);

    if (-[NSArray count](self->_originalSubviewYs, "count"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewsToMove, "objectAtIndexedSubscript:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_originalSubviewYs, "objectAtIndexedSubscript:", v7));
        objc_msgSend(v8, "frame");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v8, "setFrame:", v11, v16, v13, v15);

        ++v7;
      }
      while (v7 < -[NSArray count](self->_originalSubviewYs, "count"));
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = self->_clipViews;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));
          objc_msgSend(v23, "setTemporarilyHideWeekNumber:", 0);
          objc_msgSend(v22, "removeFromSuperview");

        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B3990);
    originalSubviewYs = self->_originalSubviewYs;
    self->_originalSubviewYs = 0;

    clipViews = self->_clipViews;
    self->_clipViews = 0;

    viewsToMove = self->_viewsToMove;
    self->_viewsToMove = 0;

    v27 = self->_originalBackgroundColor;
    self->_originalBackgroundColor = 0;

    v28 = self->_originalScrollViewBackgroundColor;
    self->_originalScrollViewBackgroundColor = 0;

    -[InfiniteScrollViewController setSuppressViewAdjustments:](self, "setSuppressViewAdjustments:", 0);
    self->_inAnimationSplitState = 0;
  }
}

- (void)setSplitStateOpen:(BOOL)a3
{
  CGRect *p_splitCutOutRect;
  double y;
  double topBoundaryY;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxY;
  _BOOL4 splitOpen;
  NSArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  double v27;
  void *i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  CGRect v54;
  CGRect v55;

  if (self->_inAnimationSplitState && self->_splitOpen != a3)
  {
    self->_splitOpen = a3;
    p_splitCutOutRect = &self->_splitCutOutRect;
    y = self->_splitCutOutRect.origin.y;
    topBoundaryY = self->_topBoundaryY;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    v10 = v9 - (self->_splitCutOutRect.origin.y + self->_splitCutOutRect.size.height);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v11, "convertRect:fromView:", v12, p_splitCutOutRect->origin.x, self->_splitCutOutRect.origin.y, self->_splitCutOutRect.size.width, self->_splitCutOutRect.size.height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v54.origin.x = v14;
    v54.origin.y = v16;
    v54.size.width = v18;
    v54.size.height = v20;
    MaxY = CGRectGetMaxY(v54);
    splitOpen = self->_splitOpen;
    if (!self->_splitOpen)
      v10 = -v10;
    if (a3)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v23 = self->_viewsToMove;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v50;
        if (splitOpen)
          v27 = -(y - topBoundaryY);
        else
          v27 = y - topBoundaryY;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(v23);
            v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v29, "frame", (_QWORD)v49);
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v37 = v36;
            objc_msgSend(v29, "frame");
            if (CGRectGetMinY(v55) >= MaxY)
              v38 = v10;
            else
              v38 = v27;
            objc_msgSend(v29, "setFrame:", v31, v33 + v38, v35, v37);
          }
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v25);
      }

    }
    else if (-[NSArray count](self->_originalSubviewYs, "count"))
    {
      v39 = 0;
      do
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_viewsToMove, "objectAtIndexedSubscript:", v39));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_originalSubviewYs, "objectAtIndexedSubscript:", v39));
        objc_msgSend(v40, "frame");
        v43 = v42;
        v45 = v44;
        v47 = v46;
        objc_msgSend(v41, "doubleValue");
        objc_msgSend(v40, "setFrame:", v43, v48, v45, v47);

        ++v39;
      }
      while (v39 < -[NSArray count](self->_originalSubviewYs, "count"));
    }
  }
}

- (void)toggleDividedListView
{
  -[CompactWidthMonthViewController animateToMonthWeekSize:divided:](self, "animateToMonthWeekSize:divided:", 1, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode") ^ 1);
}

- (void)_updateDividedListTopLineForDividedMode:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  UIView *v17;
  UIView *topLineView;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  UIView *v30;
  double v31;
  _QWORD v32[5];
  BOOL v33;
  CGRect v34;
  CGRect v35;

  v4 = a4;
  v5 = a3;
  if (!self->_topLineView)
  {
    v7 = objc_alloc((Class)UIView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    Width = CGRectGetWidth(v34);
    v14 = EKUIScaleFactor(v13);
    v17 = (UIView *)objc_msgSend(v7, "initWithFrame:", 0.0, v10, Width, CalRoundToScreenScale(v15, v16, 1.0 / v14));
    topLineView = self->_topLineView;
    self->_topLineView = v17;

    -[UIView setAutoresizingMask:](self->_topLineView, "setAutoresizingMask:", 34);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](self->_topLineView, "setBackgroundColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v20, "addSubview:", self->_topLineView);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v21, "safeAreaInsets");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v24, "bounds");
  v25 = CGRectGetWidth(v35);
  v27 = EKUIScaleFactor(v26);
  -[UIView setFrame:](self->_topLineView, "setFrame:", 0.0, v23, v25, CalRoundToScreenScale(v28, v29, 1.0 / v27));

  v30 = self->_topLineView;
  if (v4)
  {
    if (v5)
      v31 = 0.0;
    else
      v31 = 1.0;
    -[UIView setAlpha:](v30, "setAlpha:", v31);
    -[UIView setHidden:](self->_topLineView, "setHidden:", 0);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100089E50;
    v32[3] = &unk_1001B2510;
    v32[4] = self;
    v33 = v5;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v32, 0.2);
  }
  else
  {
    -[UIView setHidden:](v30, "setHidden:", !v5);
  }
}

- (void)_updateListViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CompactMonthListViewController *listViewController;
  void *v12;
  double v13;
  double left;
  double v15;
  double right;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;

  -[UIView frame](self->_listViewContainer, "frame");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[CompactWidthMonthViewController _bottomOfCurrentMonth](self, "_bottomOfCurrentMonth");
  -[UIView setFrame:](self->_listViewContainer, "setFrame:", v4, v10, v6, v9 - v10);
  listViewController = self->_listViewController;
  if (listViewController)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](listViewController, "tableView"));
    objc_msgSend(v12, "safeAreaInsets");
    left = v13;
    right = v15;

  }
  else
  {
    left = UIEdgeInsetsZero.left;
    right = UIEdgeInsetsZero.right;
  }
  v17 = EKUIScaleFactor(listViewController);
  v20 = CalRoundToScreenScale(v18, v19, 1.0 / v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self->_listViewController, "tableView"));
  objc_msgSend(v21, "setContentInset:", v20, left, 0.0, right);

  self->_listFrameNeedsUpdate = 0;
}

- (id)_monthForLastVisibleMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateForEndOfMonth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingWeeks:", (char *)-[CompactWidthMonthViewController _offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth](self, "_offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth")+ 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForMonth"));

  return v6;
}

- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v4 = EKUICurrentWindowHeightWithViewHierarchy(v3);
  v6 = EKUIHeightForWindowSizeParadigm(2048, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v8 = EKUICurrentWindowHeightWithViewHierarchy(v7);
  v10 = EKUIHeightForWindowSizeParadigm(0x2000, v9);

  v11 = -[CompactWidthMonthViewController _numberOfWeeksInSelectedMonth](self, "_numberOfWeeksInSelectedMonth");
  v12 = -[CompactWidthMonthViewController _offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth](self, "_offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth");
  v13 = 8 - (v11 + v12);
  if (v4 < v6)
    v13 = 0;
  if (v8 >= v10)
    return 11 - (v11 + v12);
  else
    return v13;
}

- (unint64_t)_numberOfWeeksInSelectedMonth
{
  void *v3;
  void *v4;
  NSCalendar *weekCalculationCalendar;
  void *v6;
  NSCalendar *v7;
  NSCalendar *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));

  if (v4)
  {
    weekCalculationCalendar = self->_weekCalculationCalendar;
    if (!weekCalculationCalendar)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
      v7 = (NSCalendar *)objc_msgSend(v6, "copy");
      v8 = self->_weekCalculationCalendar;
      self->_weekCalculationCalendar = v7;

      -[NSCalendar setFirstWeekday:](self->_weekCalculationCalendar, "setFirstWeekday:", CUIKOneIndexedWeekStart(v9));
      weekCalculationCalendar = self->_weekCalculationCalendar;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
    -[NSCalendar rangeOfUnit:inUnit:forDate:](weekCalculationCalendar, "rangeOfUnit:inUnit:forDate:", 4096, 8, v10);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v4 = EKUICurrentWindowHeightWithViewHierarchy(v3);
  v6 = EKUIHeightForWindowSizeParadigm(2048, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v8 = EKUICurrentWindowHeightWithViewHierarchy(v7);
  v10 = EKUIHeightForWindowSizeParadigm(0x2000, v9);

  if (v8 >= v10)
    return 2;
  else
    return v4 >= v6;
}

- (double)_bottomOfCurrentMonth
{
  void *v3;
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
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxY;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  unint64_t v45;
  double v46;
  id v47;
  id v48;
  double v49;
  double v50;
  _QWORD v52[5];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  CGRect v61;
  CGRect v62;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1000869A0;
  v59 = sub_1000869B0;
  v60 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10008A4EC;
  v52[3] = &unk_1001B3838;
  v54 = &v55;
  v52[4] = self;
  v4 = v3;
  v53 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
  v5 = (void *)v56[5];
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    objc_msgSend((id)v56[5], "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v61.origin.x = v17;
    v61.origin.y = v19;
    v61.size.width = v21;
    v61.size.height = v23;
    MaxY = CGRectGetMaxY(v61);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForMonth"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "superview"));
    objc_msgSend(v26, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v27, "convertRect:toView:", v36, v29, v31, v33, v35);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v45 = -[CompactWidthMonthViewController _numberOfWeeksInSelectedMonth](self, "_numberOfWeeksInSelectedMonth");
    *(_QWORD *)&v46 = objc_opt_class(self).n128_u64[0];
    v48 = objc_msgSend(v47, "monthWeekViewClass", v46);
    -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
    objc_msgSend(v48, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, 1);
    v50 = v49;
    v62.origin.x = v38;
    v62.origin.y = v40;
    v62.size.width = v42;
    v62.size.height = v44;
    MaxY = v50 * (double)(v45 - 1) + CGRectGetMaxY(v62);

  }
  _Block_object_dispose(&v55, 8);

  return MaxY;
}

- (CGPoint)_originForSelectedMonthViewInScrollViewWithState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super.super.super.super._model, "selectedDay"));
  *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
  v8 = objc_msgSend(v7, "monthWeekViewClass", v6);
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  objc_msgSend(v8, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super.super._model, "calendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForMonth"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "date"));
  v14 = objc_msgSend(v5, "calendarDateForEndOfWeekWithWeekStart:", CUIKOneIndexedWeekStart(v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "components:fromDate:toDate:options:", 4096, v13, v16, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super.super._model, "selectedDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v18));

  objc_msgSend(v19, "frame");
  v21 = v20 - (double)(uint64_t)objc_msgSend(v17, "weekOfMonth") * v10;
  if ((objc_msgSend(v19, "containsFirstDayOfMonth") & 1) == 0)
  {
    objc_msgSend(v8, "headerHeight");
    v21 = v21 - v22;
  }

  v23 = 0.0;
  v24 = v21;
  result.y = v24;
  result.x = v23;
  return result;
}

- (id)_snapshotViewForDividedListTransition:(id)a3 useFastPath:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double Width;
  void *v26;
  double Height;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  _QWORD v38[8];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  CGRect v47;
  CGRect v48;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForMonth"));
  objc_msgSend(v7, "absoluteTime");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForEndOfMonth"));
  objc_msgSend(v10, "absoluteTime");
  v12 = v11;

  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v13, "contentSize");
  v15 = v14;

  v46 = v15;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10008A9A4;
  v38[3] = &unk_1001B39B8;
  v38[6] = v9;
  v38[7] = v12;
  v38[4] = &v43;
  v38[5] = &v39;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v38);
  if (!*((_BYTE *)v40 + 24))
    goto LABEL_4;
  v16 = v44[3] + -4.0;
  v44[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v17, "convertPoint:fromView:", v18, 0.0, v16);
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
  objc_msgSend(v21, "frame");
  v23 = v22;

  if (v20 < v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v24, "bounds");
    Width = CGRectGetWidth(v47);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v26, "bounds");
    Height = CGRectGetHeight(v48);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController view](self, "view"));
    objc_msgSend(v28, "convertPoint:fromView:", v29, 0.0, v20);
    v31 = v30;
    v33 = v32;

    v34 = Height - v20;
    v35 = objc_msgSend(objc_alloc((Class)UISnapshotView), "initWithFrame:", 0.0, v20, Width, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v35, "captureSnapshotRect:fromView:withSnapshotType:", v36, v4, v31, v33, Width, v34);

  }
  else
  {
LABEL_4:
    v35 = 0;
  }
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v35;
}

- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v12, "setSelectedOccurrence:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v11, self, v13));

  -[CompactWidthMonthViewController ekui_adjustNavAndToolBarToTransparentStyles](self, "ekui_adjustNavAndToolBarToTransparentStyles");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008AB90;
  v16[3] = &unk_1001B2838;
  v17 = v14;
  v18 = a5;
  v15 = v14;
  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v15, self, v7, v16);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", 0);
  -[CUIKCalendarModel setSelectedOccurrence:](self->super.super.super.super._model, "setSelectedOccurrence:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "popViewControllersAfterAndIncluding:animated:", v5, !self->_editorDismissedFromDelete);

  self->_editorDismissedFromDelete = 0;
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
  -[CUIKCalendarModel setSelectedOccurrence:](self->super.super.super.super._model, "setSelectedOccurrence:", 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[CompactWidthMonthViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  void **v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CompactWidthMonthViewController *v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10008AD44;
  v10 = &unk_1001B2600;
  v11 = self;
  v12 = a5;
  v6 = v12;
  -[CompactWidthMonthViewController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", 1, &v7);
  -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1, v7, v8, v9, v10, v11);
  -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");

}

- (id)calendarModel
{
  return self->super.super.super.super._model;
}

- (id)_weekViewAtScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  _QWORD v32[9];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  CGPoint v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1000869A0;
  v37 = sub_1000869B0;
  v38 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v15, "contentOffset");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v21, "safeAreaInsets");
  v23 = v22;

  -[UIView frame](self->_listViewContainer, "frame");
  if (v24 <= 0.01)
  {
    v29 = v14 - v23;
  }
  else
  {
    -[UIView frame](self->_listViewContainer, "frame");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v27, "safeAreaInsets");
    v29 = v26 - v28;

  }
  v40.origin.y = v17 + v20;
  v40.origin.x = v10;
  v40.size.width = v12;
  v40.size.height = v29;
  v39.x = x;
  v39.y = y;
  if (CGRectContainsPoint(v40, v39))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10008AF6C;
    v32[3] = &unk_1001B39E0;
    *(CGFloat *)&v32[6] = x;
    *(CGFloat *)&v32[7] = y;
    v32[8] = a4;
    v32[4] = self;
    v32[5] = &v33;
    -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v32);
    v30 = (id)v34[5];
  }
  else
  {
    v30 = 0;
  }
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (BOOL)dragAndDropAllowLongPress
{
  double v3;
  double v4;
  double v5;

  if (self->_dividedListMode)
    return 0;
  -[CompactWidthMonthViewController monthWeekScale](self, "monthWeekScale");
  v4 = v3;
  +[CompactMonthWeekView eventScale](CompactMonthWeekView, "eventScale");
  return v4 >= v5;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  void *v3;
  void *v4;
  CGPoint v6;

  v6 = CGPointZero;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactWidthMonthViewController _weekViewAtScrollPoint:pointInWeek:](self, "_weekViewAtScrollPoint:pointInWeek:", &v6, a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "occurrenceAtPoint:", v6));

  return v4;
}

- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:](AddEventViewController, "editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:", v5, v6, 1, self));

  -[CompactWidthMonthViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)dragAndDropRequestsPresentationOfViewController:(id)a3
{
  id v4;
  UnadaptableNavigationController *v5;

  v4 = a3;
  v5 = -[UnadaptableNavigationController initWithRootViewController:]([UnadaptableNavigationController alloc], "initWithRootViewController:", v4);

  -[UnadaptableNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
  -[CompactWidthMonthViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (BOOL)scaleForDragging
{
  return 1;
}

- (BOOL)suspendEventLoading
{
  return self->_suspendEventLoading;
}

- (void)setSuspendEventLoading:(BOOL)a3
{
  self->_suspendEventLoading = a3;
}

- (void)setDividedListMode:(BOOL)a3
{
  self->_dividedListMode = a3;
}

- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer
{
  return self->_dayCellsScrubbingGestureRecognizer;
}

- (void)setDayCellsScrubbingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, a3);
}

- (UITapGestureRecognizer)dayCellsTapGestureRecognizer
{
  return self->_dayCellsTapGestureRecognizer;
}

- (void)setDayCellsTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, a3);
}

- (UIPinchGestureRecognizer)pinchRecognizer
{
  return self->_pinchRecognizer;
}

- (void)setPinchRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_pinchViews, 0);
  objc_storeStrong((id *)&self->_pinchScrollView, 0);
  objc_storeStrong((id *)&self->_viewsToMove, 0);
  objc_storeStrong((id *)&self->_originalSubviewYs, 0);
  objc_storeStrong((id *)&self->_clipViews, 0);
  objc_storeStrong((id *)&self->_originalScrollViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_weekCalculationCalendar, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
  objc_storeStrong((id *)&self->_currentBackButtonDate, 0);
  objc_storeStrong((id *)&self->_selectedMonthWeekView, 0);
  objc_storeStrong((id *)&self->_listViewContainerTopLine, 0);
  objc_storeStrong((id *)&self->_listViewContainer, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_pressedMonthView, 0);
  objc_storeStrong((id *)&self->_pressHighlight, 0);
  objc_storeStrong((id *)&self->_pressedDay, 0);
}

@end
