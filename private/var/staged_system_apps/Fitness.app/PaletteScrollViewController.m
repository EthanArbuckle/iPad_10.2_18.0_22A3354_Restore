@implementation PaletteScrollViewController

- (PaletteScrollViewController)initWithPauseRingsCoordinator:(id)a3
{
  id v4;
  PaletteScrollViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PaletteScrollViewController;
  v5 = -[PaletteScrollViewController init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ActivitySummaryCache sharedInstance](ActivitySummaryCache, "sharedInstance"));
    objc_storeWeak((id *)&v5->_activitySummaryProvider, v6);

    objc_storeWeak((id *)&v5->_pauseRingsCoordinator, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FIPauseRingsCoordinator didUpdatePauseStateNotification](FIPauseRingsCoordinator, "didUpdatePauseStateNotification"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, "_paletteActivitySummaryCacheChanged:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "_paletteActivitySummaryCacheChanged:", CFSTR("ActivitySummaryCacheChangedNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PaletteScrollViewController;
  -[PaletteScrollViewController dealloc](&v4, "dealloc");
}

- (void)updateScrollviewOnTodayChanged
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = v5 + self->_panAmount.x;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v8));

    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    if (v11 >= v12)
    {
      -[PaletteScrollViewController _rearrangeWeeks:](self, "_rearrangeWeeks:", 0);
      -[PaletteScrollViewController _add:](self, "_add:", 0);
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v5, 0.0);
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      self->_panAmount.x = v13;
      self->_panAmount.y = v14;
      self->_previousContentOffsetX = v13;
    }

  }
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  ARUIRingsView *ringsView;
  void *v7;
  UIScrollView *v8;
  UIScrollView *scrollView;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PaletteScrollViewController;
  -[PaletteScrollViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  self->_panAmount.x = v4 + v4;
  self->_panAmount.y = 0.0;

  -[PaletteScrollViewController _createRingsView](self, "_createRingsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_ringsView);

  -[ARUIRingsView setOpaque:](self->_ringsView, "setOpaque:", 0);
  ringsView = self->_ringsView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ARUIRingsView setBackgroundColor:](ringsView, "setBackgroundColor:", v7);

  v8 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  -[UIScrollView setHidden:](self->_scrollView, "setHidden:", 1);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  -[UIScrollView setDirectionalLockEnabled:](self->_scrollView, "setDirectionalLockEnabled:", 1);
  -[ARUIRingsView addSubview:](self->_ringsView, "addSubview:", self->_scrollView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"));
  -[ARUIRingsView addGestureRecognizer:](self->_ringsView, "addGestureRecognizer:", v10);
  self->_wasTouched = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[PaletteScrollViewController reloadViewDataAtDate:](self, "reloadViewDataAtDate:", v11);

}

- (void)_createRingsView
{
  NSMutableArray *v3;
  int i;
  void *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  unint64_t v13;
  void *v14;
  id v15;
  NSMutableArray *ringGroups;
  ARUIRingsView *v17;
  ARUIRingsView *ringsView;
  NSMutableArray *v19;

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 21));
  for (i = 0; i != 21; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIRingGroup activityRingGroupForRingType:](ARUIRingGroup, "activityRingGroupForRingType:", 3));
    *(float *)&v6 = 40.0;
    objc_msgSend(v5, "setGroupDiameter:", v6);
    *(float *)&v7 = 1.5;
    objc_msgSend(v5, "setInterspacing:", v7);
    objc_msgSend(v5, "groupDiameter");
    v9 = floor(v8 * 0.1);
    *(float *)&v9 = v9;
    objc_msgSend(v5, "setThickness:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rings"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v13 = 0;
      do
      {
        LODWORD(v12) = ARUIRingPercentageValueNoRing;
        objc_msgSend(v5, "setPercentage:ofRingAtIndex:animated:", v13++, 0, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rings"));
        v15 = objc_msgSend(v14, "count");

      }
      while (v13 < (unint64_t)v15);
    }
    -[NSMutableArray addObject:](v3, "addObject:", v5);

  }
  ringGroups = self->_ringGroups;
  self->_ringGroups = v3;
  v19 = v3;

  v17 = (ARUIRingsView *)objc_msgSend(objc_alloc((Class)ARUIRingsView), "initWithRingGroups:", v19);
  ringsView = self->_ringsView;
  self->_ringsView = v17;

  -[ARUIRingsView setDiscardBackBuffers:](self->_ringsView, "setDiscardBackBuffers:", 0);
  -[ARUIRingsView setContentMode:](self->_ringsView, "setContentMode:", 6);
  -[ARUIRingsView setAutoresizingMask:](self->_ringsView, "setAutoresizingMask:", 0);

}

- (void)_paletteActivitySummaryCacheChanged:(id)a3
{
  NSMutableArray *weekStartingDates;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  weekStartingDates = self->_weekStartingDates;
  v5 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](weekStartingDates, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v6));

  v8 = sub_10008D710(v12);
  v9 = sub_10008D710(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("range")));
  if (sub_10008D794(v11, v8, v9, CFSTR("Palette")) || !v11)
    -[PaletteScrollViewController _reloadActivitySummariesFromCache](self, "_reloadActivitySummariesFromCache");

}

- (void)setActivitySummaryProvider:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_activitySummaryProvider, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[PaletteScrollViewController reloadViewDataAtDate:](self, "reloadViewDataAtDate:", v4);

}

- (void)setIsUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isUserInteractionEnabled = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)_reloadActivitySummariesFromCache
{
  void *v3;
  void *v4;
  NSMutableArray *ringGroups;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  PaletteScrollViewController *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekStartingDates, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  ringGroups = self->_ringGroups;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A3D80;
  v8[3] = &unk_100779978;
  v9 = v4;
  v10 = v3;
  v11 = self;
  v6 = v3;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](ringGroups, "enumerateObjectsUsingBlock:", v8);

}

- (id)startOfFitnessWeekBeforeWeekStarting:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v3, 0));

  return v5;
}

- (id)startOfFitnessWeekAfterWeekStarting:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v3, 0));

  return v5;
}

- (CGPoint)_centerForRingAtIndex:(unint64_t)a3
{
  unint64_t v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v4 = a3 % 7;
  v5 = (double)(a3 / 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  v8 = (40.0 - v7) * 0.5;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  v11 = v8 + v5 * v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v12, "centerXForElementAt:width:percent:", v4, 40.0, 0.0);
  v14 = v11 + v13 - self->_panAmount.x;

  v15 = 10.0;
  v16 = v14;
  result.y = v15;
  result.x = v16;
  return result;
}

- (void)viewWillLayoutSubviews
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
  double v13;
  double v14;
  void *v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PaletteScrollViewController;
  -[PaletteScrollViewController viewWillLayoutSubviews](&v17, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[ARUIRingsView frame](self->_ringsView, "frame");
  if (v11 >= v12)
    -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v5, v7, v9, v11);
  -[ARUIRingsView bounds](self->_ringsView, "bounds");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  -[ARUIRingsView frame](self->_ringsView, "frame");
  v14 = v13 * 3.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v15, "frame");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v14, v16);

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", self->_panAmount.x, self->_panAmount.y);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  -[PaletteScrollViewController _prepareForScrollAnimationStart](self, "_prepareForScrollAnimationStart", a3);
  self->_wasTouched = 1;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[PaletteScrollViewController _scrollAnimationFinished](self, "_scrollAnimationFinished", a3);
  self->_wasTouched = 0;
}

- (void)_prepareForScrollAnimationStart
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (void)_scrollAnimationFinished
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = -[PaletteScrollViewController _readjustOffsetIfNecessary](self, "_readjustOffsetIfNecessary");
  _HKInitializeLogging(v3, v4);
  v5 = HKLogActivity;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSMutableArray count](self->_weekStartingDates, "count");
    if ((unint64_t)v6 < 2)
      v7 = 0;
    else
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekStartingDates, "objectAtIndexedSubscript:", 1));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Palette] Palette was scrolled to date: %@", (uint8_t *)&v9, 0xCu);
    if ((unint64_t)v6 >= 2)

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

}

- (void)_readjustOffsetIfNecessary
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double previousContentOffsetX;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  previousContentOffsetX = self->_previousContentOffsetX;
  if (v4 != previousContentOffsetX)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
    v20 = (id)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v9));

    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;

    v15 = v11 < v14 || v4 < previousContentOffsetX;
    if (v4 != v7 && v15)
    {
      -[PaletteScrollViewController _rearrangeWeeks:](self, "_rearrangeWeeks:", v4 < previousContentOffsetX);
      -[PaletteScrollViewController _add:](self, "_add:", v4 < previousContentOffsetX);
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v7, 0.0);
    }
    if (self->_wasTouched)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController delegate](self, "delegate"));
      objc_msgSend(v17, "paletteScrolledInDirection:", v4 < previousContentOffsetX);

    }
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    self->_panAmount.x = v18;
    self->_panAmount.y = v19;
    self->_previousContentOffsetX = v18;

  }
}

- (id)_currentWeekStartDate
{
  double previousContentOffsetX;
  void *v4;
  double v5;
  uint64_t v6;

  previousContentOffsetX = self->_previousContentOffsetX;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = (uint64_t)(previousContentOffsetX / v5);

  return -[NSMutableArray objectAtIndexedSubscript:](self->_weekStartingDates, "objectAtIndexedSubscript:", v6);
}

- (BOOL)scrollOrRelayoutWeekIfNeededToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekStartingDates, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v6));

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController _currentWeekStartDate](self, "_currentWeekStartDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v10));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  if (v9 < v12 || (objc_msgSend(v7, "timeIntervalSinceReferenceDate"), v9 >= v13))
  {
    -[PaletteScrollViewController reloadViewDataAtDate:](self, "reloadViewDataAtDate:", v4);
    v16 = 1;
  }
  else
  {
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    if (v9 < v14 || (objc_msgSend(v11, "timeIntervalSinceReferenceDate"), v9 >= v15))
    {
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
      objc_msgSend(v19, "bounds");
      v21 = v20;

      v22 = 1.0;
      if (v9 < v18)
        v22 = -1.0;
      v16 = 1;
      -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, self->_previousContentOffsetX + v22 * v21, 0.0);
      -[PaletteScrollViewController _prepareForScrollAnimationStart](self, "_prepareForScrollAnimationStart");
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (void)_rearrangeWeeks:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekStartingDates, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
  if (v3)
  {
    -[NSMutableArray removeLastObject](self->_weekStartingDates, "removeLastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekBeforeWeekStarting:](self, "startOfFitnessWeekBeforeWeekStarting:", v7));
    -[NSMutableArray insertObject:atIndex:](self->_weekStartingDates, "insertObject:atIndex:", v6, 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v5));
    -[NSMutableArray removeObjectAtIndex:](self->_weekStartingDates, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_weekStartingDates, "addObject:", v6);
  }

}

- (void)_add:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  uint64_t v6;
  char *v7;
  NSMutableArray *ringGroups;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = a3;
  v5 = (char *)-[NSMutableArray count](self->_ringGroups, "count");
  v6 = HKDaysInAWeek;
  v7 = &v5[-HKDaysInAWeek];
  ringGroups = self->_ringGroups;
  if (v3)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](ringGroups, "subarrayWithRange:", v7, HKDaysInAWeek));
    -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v6));
    -[NSMutableArray insertObjects:atIndexes:](self->_ringGroups, "insertObjects:atIndexes:", v14, v9);
    v10 = self->_ringGroups;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A4A00;
    v16[3] = &unk_1007799A0;
    v16[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v16);
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekStartingDates, "firstObject"));
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](ringGroups, "subarrayWithRange:", 0, HKDaysInAWeek));
    -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v6));
    -[NSMutableArray insertObjects:atIndexes:](self->_ringGroups, "insertObjects:atIndexes:", v14, v9);
    v12 = self->_ringGroups;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A4A48;
    v15[3] = &unk_1007799A0;
    v15[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v15);
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekStartingDates, "lastObject"));
  }
  v13 = (void *)v11;
  -[PaletteScrollViewController _setDataForGroups:withStartingDate:](self, "_setDataForGroups:withStartingDate:", v14, v11);

}

- (void)_setDataForGroups:(id)a3 withStartingDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PaletteScrollViewController *v13;

  v6 = a4;
  v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A4B54;
  v10[3] = &unk_100779978;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

- (void)reloadViewDataAtDate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  CGPoint *p_panAmount;
  void *v23;
  CGFloat v24;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *weekStartingDates;
  double v30;
  double v31;
  double v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  id v36;

  v4 = a3;
  _HKInitializeLogging(v4, v5);
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PaletteScrollView] Reloading data from cache at date: %@", buf, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hk_startOfFitnessWeekBeforeDate:", v4));
  WeakRetained = objc_loadWeakRetained((id *)&self->_activitySummaryProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hk_dateByAddingDays:toDate:", -(uint64_t)objc_msgSend(WeakRetained, "fitnessStartOfWeekOffset"), v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekBeforeWeekStarting:](self, "startOfFitnessWeekBeforeWeekStarting:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekAfterWeekStarting:](self, "startOfFitnessWeekAfterWeekStarting:", v10));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  if (v14 >= v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController startOfFitnessWeekBeforeWeekStarting:](self, "startOfFitnessWeekBeforeWeekStarting:", v11));
    v26 = objc_alloc((Class)NSMutableArray);
    v34[0] = v25;
    v34[1] = v11;
    v34[2] = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 3));
    v28 = (NSMutableArray *)objc_msgSend(v26, "initWithArray:", v27);
    weekStartingDates = self->_weekStartingDates;
    self->_weekStartingDates = v28;

    -[PaletteScrollViewController _reloadActivitySummariesFromCache](self, "_reloadActivitySummariesFromCache");
    p_panAmount = &self->_panAmount;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
    objc_msgSend(v23, "bounds");
    self->_panAmount.x = v30 + v30;
  }
  else
  {
    v18 = objc_alloc((Class)NSMutableArray);
    v33[0] = v11;
    v33[1] = v10;
    v33[2] = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
    v20 = (NSMutableArray *)objc_msgSend(v18, "initWithArray:", v19);
    v21 = self->_weekStartingDates;
    self->_weekStartingDates = v20;

    -[PaletteScrollViewController _reloadActivitySummariesFromCache](self, "_reloadActivitySummariesFromCache");
    p_panAmount = &self->_panAmount;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
    objc_msgSend(v23, "bounds");
    self->_panAmount.x = v24;
  }
  p_panAmount->y = 0.0;

  self->_previousContentOffsetX = p_panAmount->x;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  if (v32 != CGSizeZero.width || v31 != CGSizeZero.height)
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", p_panAmount->x, p_panAmount->y);

}

- (void)scrollViewDidScroll:(id)a3
{
  CGPoint *p_panAmount;
  CGFloat v5;
  CGFloat v6;
  unint64_t v7;
  void *v8;

  p_panAmount = &self->_panAmount;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", a3);
  p_panAmount->x = v5;
  p_panAmount->y = v6;
  if (-[NSMutableArray count](self->_ringGroups, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_ringGroups, "objectAtIndexedSubscript:", v7));
      -[PaletteScrollViewController _centerForRingAtIndex:](self, "_centerForRingAtIndex:", v7);
      objc_msgSend(v8, "setCenter:");

      ++v7;
    }
    while (v7 < (unint64_t)-[NSMutableArray count](self->_ringGroups, "count"));
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  NSDate *v5;
  NSDate *dateTouched;

  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController _getDayWithTouches:](self, "_getDayWithTouches:", a3, a4));
  dateTouched = self->_dateTouched;
  self->_dateTouched = v5;

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  NSDate *dateTouched;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  dateTouched = self->_dateTouched;
  if (dateTouched)
  {
    -[NSDate timeIntervalSinceReferenceDate](dateTouched, "timeIntervalSinceReferenceDate");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;

    if (v9 <= v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController delegate](self, "delegate"));
      objc_msgSend(v13, "paletteDateSelected:", self->_dateTouched);

    }
  }

}

- (id)_getDayWithTouches:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9 / 7.0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController _currentWeekStartDate](self, "_currentWeekStartDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, vcvtmd_s64_f64(v7 / v10), v11, 0));

  return v13;
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return (FIPauseRingsCoordinator *)objc_loadWeakRetained((id *)&self->_pauseRingsCoordinator);
}

- (void)setPauseRingsCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_pauseRingsCoordinator, a3);
}

- (ActivitySummaryProviding)activitySummaryProvider
{
  return (ActivitySummaryProviding *)objc_loadWeakRetained((id *)&self->_activitySummaryProvider);
}

- (PaletteScrollViewDelegate)delegate
{
  return (PaletteScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_isUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activitySummaryProvider);
  objc_destroyWeak((id *)&self->_pauseRingsCoordinator);
  objc_storeStrong((id *)&self->_dateTouched, 0);
  objc_storeStrong((id *)&self->_weekStartingDates, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_ringGroups, 0);
}

@end
