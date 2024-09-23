@implementation MonthScrollViewController

- (MonthScrollViewController)initWithDateCache:(id)a3 workoutsDataProvider:(id)a4 pauseRingsCoordinator:(id)a5
{
  id v9;
  id v10;
  id v11;
  MonthScrollViewController *v12;
  MonthScrollViewController *v13;
  void *v14;
  void *v15;
  UIScrollView *v16;
  UIScrollView *scrollView;
  uint64_t v18;
  ActivitySummaryCache *summaryCache;
  FitnessWorkoutsCache *v20;
  FitnessWorkoutsCache *workoutCache;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MonthScrollViewController;
  v12 = -[MonthScrollViewController init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateCache, a3);
    objc_storeStrong((id *)&v13->_workoutsDataProvider, a4);
    objc_storeStrong((id *)&v13->_pauseRingsCoordinator, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_timeZoneChanged:", NSSystemTimeZoneDidChangeNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_activitySummaryCacheChanged:", CFSTR("ActivitySummaryCacheChangedNotification"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FIPauseRingsCoordinator didUpdatePauseStateNotification](FIPauseRingsCoordinator, "didUpdatePauseStateNotification"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_activitySummaryCacheChanged:", v15, 0);

    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_workoutsCacheChanged:", CFSTR("FitnessActivityWorkoutsChangedNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "todayChanged", CFSTR("FitnessCurrentDeviceDateChangedNotification"), 0);
    v16 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v13->_scrollView;
    v13->_scrollView = v16;

    -[UIScrollView setDelegate:](v13->_scrollView, "setDelegate:", v13);
    -[UIScrollView setContentInset:](v13->_scrollView, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v13->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    v18 = objc_claimAutoreleasedReturnValue(+[ActivitySummaryCache sharedInstance](ActivitySummaryCache, "sharedInstance"));
    summaryCache = v13->_summaryCache;
    v13->_summaryCache = (ActivitySummaryCache *)v18;

    v20 = -[FitnessWorkoutsCache initWithDataProvider:]([FitnessWorkoutsCache alloc], "initWithDataProvider:", v13->_workoutsDataProvider);
    workoutCache = v13->_workoutCache;
    v13->_workoutCache = v20;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MonthScrollViewController;
  -[MonthScrollViewController dealloc](&v4, "dealloc");
}

- (void)_didBecomeActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ActivitySummaryCache sharedInstance](ActivitySummaryCache, "sharedInstance", a3));
  objc_msgSend(v3, "loadDataIfNeeded");

}

- (void)_workoutsCacheChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MSVC] Workouts cache changed, reloading.", v5, 2u);
  }
  -[MonthScrollViewController _reloadAllWorkoutsFromCache](self, "_reloadAllWorkoutsFromCache");
}

- (void)_activitySummaryCacheChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("range")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekViews, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "summaryIndexes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_msgSend(v8, "doubleValue");
  v10 = (uint64_t)v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekViews, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "summaryIndexes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  objc_msgSend(v13, "doubleValue");
  v15 = (uint64_t)v14;

  v16 = sub_10008D794(v5, v10, v15, CFSTR("MSVC"));
  if (v16 || !v5)
  {
    _HKInitializeLogging(v16, v17);
    v18 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MSVC] Activity summaries changed, reloading.", v19, 2u);
    }
    -[MonthScrollViewController _reloadAllActivitySummariesFromCache](self, "_reloadAllActivitySummariesFromCache");
  }

}

- (void)_timeZoneChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MSVC] Time zone changed, build fresh views.", v5, 2u);
  }
  -[MonthScrollViewController _buildFreshViews](self, "_buildFreshViews");
  -[MonthScrollViewController _relayoutRingGroups](self, "_relayoutRingGroups");
  self->_scrollViewAdjustedToBottom = 0;
  -[MonthScrollViewController _reloadAllWorkoutsFromCache](self, "_reloadAllWorkoutsFromCache");
  -[MonthScrollViewController _reloadAllActivitySummariesFromCache](self, "_reloadAllActivitySummariesFromCache");
}

- (void)_buildFreshViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *lastVisibleWeekDate;
  NSMutableArray *weekViews;
  id v17;
  _QWORD v18[4];
  id v19;
  MonthScrollViewController *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController earliestDateToTileForMonth:](self, "earliestDateToTileForMonth:", v12));

  v14 = (NSDate *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController _calculateLastVisibleDate](self, "_calculateLastVisibleDate"));
  lastVisibleWeekDate = self->_lastVisibleWeekDate;
  self->_lastVisibleWeekDate = v14;

  weekViews = self->_weekViews;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008DFB8;
  v18[3] = &unk_1007792B8;
  v21 = v5;
  v22 = v7;
  v23 = v9;
  v24 = v11;
  v19 = v13;
  v20 = self;
  v17 = v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](weekViews, "enumerateObjectsUsingBlock:", v18);
  self->_incrementAmount = 0.0;

}

- (void)todayChanged
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSDate *v8;
  NSDate *v9;
  NSDate *lastVisibleWeekDate;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  MonthWeekView *v17;
  MonthWeekView *lastVisibleWeek;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_weekViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "reloadCells", (_QWORD)v19);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v8 = self->_lastVisibleWeekDate;
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController _calculateLastVisibleDate](self, "_calculateLastVisibleDate"));
  lastVisibleWeekDate = self->_lastVisibleWeekDate;
  self->_lastVisibleWeekDate = v9;

  -[NSDate timeIntervalSinceReferenceDate](self->_lastVisibleWeekDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  -[NSDate timeIntervalSinceReferenceDate](v8, "timeIntervalSinceReferenceDate");
  if (v12 >= v13)
  {
    if (self->_scrollViewAdjustedToBottom)
    {
      self->_scrollViewAdjustedToBottom = 0;
      -[MonthScrollViewController _readjustScrollViewToOffset:weekOffset:](self, "_readjustScrollViewToOffset:weekOffset:", 64.0, -64.0);
      -[MonthScrollViewController _readjustRings](self, "_readjustRings");
    }
  }
  else
  {
    self->_scrollViewAdjustedToBottom = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
    objc_msgSend(v15, "bounds");
    -[MonthScrollViewController scrollToDate:windowHeight:](self, "scrollToDate:windowHeight:", v14, v16);

  }
  v17 = (MonthWeekView *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController weekWithStartDate:](self, "weekWithStartDate:", self->_lastVisibleWeekDate, (_QWORD)v19));
  lastVisibleWeek = self->_lastVisibleWeek;
  self->_lastVisibleWeek = v17;

}

- (void)viewDidLoad
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
  ARUIRingsView *ringsView;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *weekViews;
  int v16;
  MonthWeekView *v17;
  void *v18;
  MonthWeekView *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MonthScrollViewController;
  -[MonthScrollViewController viewDidLoad](&v22, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MonthScrollViewController _createRingsView](self, "_createRingsView");
  ringsView = self->_ringsView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[ARUIRingsView setBackgroundColor:](ringsView, "setBackgroundColor:", v13);

  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v5, v7, v9, v11);
  v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  weekViews = self->_weekViews;
  self->_weekViews = v14;

  v16 = 11;
  do
  {
    v17 = [MonthWeekView alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache dateCache](self->_dateCache, "dateCache"));
    v19 = -[MonthWeekView initWithDateCache:](v17, "initWithDateCache:", v18);

    -[MonthWeekView setDelegate:](v19, "setDelegate:", self);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v19);
    -[NSMutableArray addObject:](self->_weekViews, "addObject:", v19);

    --v16;
  }
  while (v16);
  -[MonthScrollViewController _buildFreshViews](self, "_buildFreshViews");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v11 + 128.0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_ringsView);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v21, "addSubview:", self->_scrollView);

  -[MonthScrollViewController _relayoutRingGroups](self, "_relayoutRingGroups");
  -[MonthScrollViewController _reloadAllActivitySummariesFromCache](self, "_reloadAllActivitySummariesFromCache");
}

- (id)_calculateLastVisibleDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](self->_dateCache, "calendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 14, v4));

  objc_msgSend(v5, "setMonth:", (char *)objc_msgSend(v5, "month") + 1);
  objc_msgSend(v5, "setDay:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](self->_dateCache, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](self->_dateCache, "calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hk_startOfFitnessWeekBeforeDate:", v7));

  return v9;
}

- (BOOL)_isLastVisibleWeek:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastVisibleWeekDate;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (!self->_lastVisibleWeekDate)
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController _calculateLastVisibleDate](self, "_calculateLastVisibleDate"));
    lastVisibleWeekDate = self->_lastVisibleWeekDate;
    self->_lastVisibleWeekDate = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentWeekStartDate"));
  v8 = objc_msgSend(v7, "isEqualToDate:", self->_lastVisibleWeekDate);

  return v8;
}

- (void)_createRingsView
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  unint64_t v14;
  void *v15;
  id v16;
  NSMutableArray *ringGroups;
  ARUIRingsView *v18;
  ARUIRingsView *ringsView;
  NSMutableArray *v20;

  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  if (HKDaysInAWeek)
  {
    v4 = 0;
    if ((unint64_t)(11 * HKDaysInAWeek) <= 1)
      v5 = 1;
    else
      v5 = 11 * HKDaysInAWeek;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MonthRingGroup activityRingGroupForRingType:](MonthRingGroup, "activityRingGroupForRingType:", 3));
      *(float *)&v7 = 40.0;
      objc_msgSend(v6, "setGroupDiameter:", v7);
      *(float *)&v8 = 1.5;
      objc_msgSend(v6, "setInterspacing:", v8);
      objc_msgSend(v6, "groupDiameter");
      v10 = floor(v9 * 0.1);
      *(float *)&v10 = v10;
      objc_msgSend(v6, "setThickness:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rings"));
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v14 = 0;
        do
        {
          LODWORD(v13) = ARUIRingPercentageValueNoRing;
          objc_msgSend(v6, "setPercentage:ofRingAtIndex:animated:", v14++, 0, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rings"));
          v16 = objc_msgSend(v15, "count");

        }
        while (v14 < (unint64_t)v16);
      }
      -[NSMutableArray addObject:](v3, "addObject:", v6);
      objc_msgSend(v6, "setBackingOriginOffset:", 0.0);

      ++v4;
    }
    while (v4 != v5);
  }
  ringGroups = self->_ringGroups;
  self->_ringGroups = v3;
  v20 = v3;

  v18 = (ARUIRingsView *)objc_msgSend(objc_alloc((Class)ARUIRingsView), "initWithRingGroups:", v20);
  ringsView = self->_ringsView;
  self->_ringsView = v18;

  -[ARUIRingsView setDiscardBackBuffers:](self->_ringsView, "setDiscardBackBuffers:", 0);
  -[ARUIRingsView setSynchronizesWithCA:](self->_ringsView, "setSynchronizesWithCA:", 1);

}

- (id)earliestDateToTileForMonth:(id)a3
{
  _TtC10FitnessApp17ActivityDateCache *dateCache;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  dateCache = self->_dateCache;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](dateCache, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 14, v4));

  objc_msgSend(v6, "setDay:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hk_startOfFitnessWeekBeforeDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v8, 0));

  return v9;
}

- (void)scrollToDate:(id)a3 windowHeight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](self->_dateCache, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 14, v25));
  objc_msgSend(v7, "setDay:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hk_startOfFitnessWeekBeforeDate:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController weekWithStartDate:](self, "weekWithStartDate:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hk_startOfFitnessWeekBeforeDate:", v25));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:toDate:options:", 0x2000, v9, v14, 0));
  v16 = (double)((uint64_t)objc_msgSend(v15, "weekOfYear") + 1) * 65.0 + 50.0;
  if (v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
    objc_msgSend(v17, "scaledValueForSmallWidth:bigWidth:", 10.0, 30.0);
    v19 = v18;

    objc_msgSend(v10, "frame");
    v21 = v20 - v19;
    v22 = v13 * 0.5 - v19;
    if (v16 <= a4)
      v22 = -0.0;
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, 0.0, v22 + v21);
  }
  else
  {
    -[MonthScrollViewController _buildFreshViews](self, "_buildFreshViews");
    -[MonthScrollViewController _relayoutRingGroups](self, "_relayoutRingGroups");
    -[MonthScrollViewController _reloadAllActivitySummariesFromCache](self, "_reloadAllActivitySummariesFromCache");
    -[MonthScrollViewController _reloadAllWorkoutsFromCache](self, "_reloadAllWorkoutsFromCache");
    if (v16 > a4)
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:");
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      self->_panAmount.y = v23;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController monthScrollDelegate](self, "monthScrollDelegate"));
    objc_msgSend(v24, "scrolledPastMonthWithDate:", v25);

  }
}

- (void)_relayoutRingGroups
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  if (-[NSMutableArray count](self->_ringGroups, "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_ringGroups, "objectAtIndexedSubscript:", v3));
      v5 = (double)(v3 / 7);
      -[MonthScrollViewController _heightOffsetForWeekRow:](self, "_heightOffsetForWeekRow:", (uint64_t)v5);
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v8, "bounds");
      objc_msgSend(v4, "setBackingOriginOffset:", v7 + (40.0 - v9) * 0.5);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_weekViews, "objectAtIndex:", (unint64_t)v5));
      objc_msgSend(v10, "heightForCellAtIndex:oneTime:", v3 % 7, 1);
      objc_msgSend(v4, "setAdditionalSpacing:");
      objc_msgSend(v4, "backingOriginOffset");
      objc_msgSend(v4, "additionalSpacing");
      -[MonthScrollViewController _centerXForRingAt:percent:](self, "_centerXForRingAt:percent:", v3 % 7, 0.0);
      objc_msgSend(v4, "setCenter:");

      ++v3;
    }
    while (v3 < (unint64_t)-[NSMutableArray count](self->_ringGroups, "count"));
  }
  -[ARUIRingsView setNeedsDisplay](self->_ringsView, "setNeedsDisplay");
}

- (void)_readjustRings
{
  NSMutableArray *ringGroups;
  _QWORD v3[5];

  ringGroups = self->_ringGroups;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008ED70;
  v3[3] = &unk_1007792E0;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](ringGroups, "enumerateObjectsUsingBlock:", v3);
}

- (void)_readjustScrollViewToOffset:(double)a3 weekOffset:(double)a4
{
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_weekViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "frame", (_QWORD)v12);
        objc_msgSend(v11, "setFrame:");
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  self->_incrementAmount = self->_incrementAmount + a4;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  void *v4;
  void *v5;
  double v6;

  self->_scrollViewAdjustedToBottom = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[MonthScrollViewController scrollToDate:windowHeight:](self, "scrollToDate:windowHeight:", v4, v6);

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  CGPoint *p_panAmount;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double MaxY;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  double v28;
  void *i;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;

  p_panAmount = &self->_panAmount;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", a3);
  p_panAmount->x = v5;
  p_panAmount->y = v6;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safeAreaLayoutGuide"));
  objc_msgSend(v13, "layoutFrame");
  MaxY = CGRectGetMaxY(v36);

  v15 = v11 - MaxY;
  -[MonthWeekView frame](self->_lastVisibleWeek, "frame");
  v16 = CGRectGetMaxY(v37) - p_panAmount->y;
  v17 = v11 - v15;
  if (self->_lastVisibleWeek)
    v18 = v16 < v17;
  else
    v18 = 0;
  if (v18 && !self->_scrollViewAdjustedToBottom)
  {
    self->_scrollViewAdjustedToBottom = 1;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v20 = v19 + -128.0;
    -[MonthWeekView frame](self->_lastVisibleWeek, "frame");
    v22 = v20 - v21;
    -[MonthWeekView frame](self->_lastVisibleWeek, "frame");
    -[MonthScrollViewController _readjustScrollViewToOffset:weekOffset:](self, "_readjustScrollViewToOffset:weekOffset:", 128.0, v22 - v23 - v15);
  }
  if (fabs(v8 + -64.0) > 32.0 && (!self->_lastVisibleWeek || v16 > v17 || !self->_scrollViewAdjustedToBottom))
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, 64.0);
    self->_scrollViewAdjustedToBottom = 0;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = self->_weekViews;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      v28 = 64.0 - fabs(v8);
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v30, "frame", (_QWORD)v31);
          objc_msgSend(v30, "setFrame:");
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v26);
    }
    else
    {
      v28 = 64.0 - fabs(v8);
    }

    self->_incrementAmount = v28 + self->_incrementAmount;
    -[MonthScrollViewController _addAndRearrangeWeekviewsAndGroups](self, "_addAndRearrangeWeekviewsAndGroups");
  }
  -[MonthScrollViewController _findCenteredWeekAndUpdateTitleIfNecessary](self, "_findCenteredWeekAndUpdateTitleIfNecessary", (_QWORD)v31);
  -[MonthScrollViewController _readjustRings](self, "_readjustRings");
}

- (void)_findCenteredWeekAndUpdateTitleIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  void *i;
  void *v13;
  UIScrollView *scrollView;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  CGRect v39;
  CGRect v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController monthScrollDelegate](self, "monthScrollDelegate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    v6 = v5;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = self->_weekViews;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = v6 * 0.5;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          scrollView = self->_scrollView;
          objc_msgSend(v13, "frame", (_QWORD)v34);
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
          -[UIScrollView convertRect:toView:](scrollView, "convertRect:toView:", v23, v16, v18, v20, v22);
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;

          v39.origin.x = v25;
          v39.origin.y = v27;
          v39.size.width = v29;
          v39.size.height = v31;
          if (CGRectGetMinY(v39) < v10)
          {
            v40.origin.x = v25;
            v40.origin.y = v27;
            v40.size.width = v29;
            v40.size.height = v31;
            if (CGRectGetMaxY(v40) > v10)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController monthScrollDelegate](self, "monthScrollDelegate"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentWeekStartDate"));
              objc_msgSend(v32, "scrolledPastMonthWithDate:", v33);

            }
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v9);
    }

  }
}

- (double)_heightOffsetForWeekRow:(int64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_weekViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
LABEL_3:
    v10 = 0;
    if (v7 <= a3)
      v11 = a3;
    else
      v11 = v7;
    v12 = v7 - v11;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v4);
      if (!(v12 + v10))
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "preferredHeight", (_QWORD)v15);
      v9 = v9 + v13;
      if (v6 == (id)++v10)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 += v10;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)_addAndRearrangeWeekviewsAndGroups
{
  void *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  double v7;
  char *v8;
  MonthScrollViewController *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;

  v22 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weekViews, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekViews, "lastObject"));
  v4 = (char *)-[NSMutableArray count](self->_ringGroups, "count");
  v5 = HKDaysInAWeek;
  v6 = &v4[-HKDaysInAWeek];
  objc_msgSend(v22, "frame");
  if (v7 > 0.0)
  {
    v8 = (char *)-[NSMutableArray count](self->_weekViews, "count") - 1;
    LOBYTE(v21) = 0;
    v9 = self;
    v10 = 0;
    v11 = v6;
    v12 = v5;
    v13 = 0;
LABEL_5:
    -[MonthScrollViewController _readjustFrom:to:fromGroupRange:toGroupRange:down:](v9, "_readjustFrom:to:fromGroupRange:toGroupRange:down:", v10, v8, v11, v12, v13, v5, v21);
    goto LABEL_6;
  }
  objc_msgSend(v3, "frame");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v16, "frame");
  v18 = v17;
  objc_msgSend(v3, "frame");
  v20 = v18 + v19;

  if (v15 < v20)
  {
    v10 = (char *)-[NSMutableArray count](self->_weekViews, "count") - 1;
    LOBYTE(v21) = 1;
    v9 = self;
    v8 = 0;
    v11 = 0;
    v12 = v5;
    v13 = v6;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_readjustFrom:(unint64_t)a3 to:(unint64_t)a4 fromGroupRange:(_NSRange)a5 toGroupRange:(_NSRange)a6 down:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v12;
  void *v13;
  MonthWeekView *v14;
  NSMutableArray *ringGroups;
  void *v16;
  double v17;
  double v18;
  MonthWeekView *v19;
  MonthWeekView *lastVisibleWeek;
  void *v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  MonthWeekView *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSUInteger v43;
  id v45;
  _QWORD v46[5];
  MonthWeekView *v47;
  double v48;
  BOOL v49;

  length = a6.length;
  location = a6.location;
  v45 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_weekViews, "lastObject"));
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekViews, "objectAtIndexedSubscript:", a3));
  v14 = (MonthWeekView *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekViews, "objectAtIndexedSubscript:", a4));
  ringGroups = self->_ringGroups;
  v43 = length;
  if (a7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](ringGroups, "lastObject"));
    objc_msgSend(v16, "backingOriginOffset");
    v18 = v17;

    -[NSMutableArray removeObjectAtIndex:](self->_weekViews, "removeObjectAtIndex:", a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextWeekStartDate"));
    -[MonthWeekView setMonthWeekStart:](v14, "setMonthWeekStart:");
    if (self->_lastVisibleWeek || !-[MonthScrollViewController _isLastVisibleWeek:](self, "_isLastVisibleWeek:", v14))
      goto LABEL_8;
    v19 = v14;
    lastVisibleWeek = self->_lastVisibleWeek;
    self->_lastVisibleWeek = v19;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](ringGroups, "firstObject"));
    objc_msgSend(v21, "backingOriginOffset");
    v18 = v22;

    -[NSMutableArray removeObjectAtIndex:](self->_weekViews, "removeObjectAtIndex:", a4);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "previousWeekStartDate"));
    -[MonthWeekView setMonthWeekStart:](v14, "setMonthWeekStart:", v23);
    v42 = (void *)v23;
    if (v14 != self->_lastVisibleWeek)
      goto LABEL_8;
    self->_lastVisibleWeek = 0;
    lastVisibleWeek = v14;
  }

LABEL_8:
  objc_msgSend(v13, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[MonthWeekView preferredHeight](v14, "preferredHeight");
  v31 = v30;
  if (a7)
  {
    objc_msgSend(v13, "frame");
  }
  else
  {
    -[MonthWeekView preferredHeight](v14, "preferredHeight");
    v32 = -v33;
  }
  -[MonthWeekView setFrame:](v14, "setFrame:", v25, v27 + v32, v29, v31);
  -[NSMutableArray insertObject:atIndex:](self->_weekViews, "insertObject:atIndex:", v14, v12);
  if (a7)
  {
    objc_msgSend(v45, "frame");
  }
  else
  {
    objc_msgSend(v45, "preferredHeight");
    v34 = -v35;
  }
  v36 = v18 + v34;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_ringGroups, "subarrayWithRange:", a5.location, a5.length));
  -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", a5.location, a5.length);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", location, v43));
  -[NSMutableArray insertObjects:atIndexes:](self->_ringGroups, "insertObjects:atIndexes:", v37, v38);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10008FA48;
  v46[3] = &unk_100779308;
  v49 = a7;
  v46[4] = self;
  v48 = v36;
  v39 = v14;
  v47 = v39;
  objc_msgSend(v37, "enumerateObjectsUsingBlock:", v46);
  -[MonthScrollViewController _loadWorkoutsForWeek:](self, "_loadWorkoutsForWeek:", v39);
  if (a7)
  {
    v40 = HKDaysInAWeek;
    v41 = ((uint64_t)-[NSMutableArray count](self->_weekViews, "count") - 1) * v40;
  }
  else
  {
    v41 = 0;
  }
  -[MonthScrollViewController _loadActivitySummariesForWeek:ringGroupIndex:](self, "_loadActivitySummariesForWeek:ringGroupIndex:", v39, v41);

}

- (id)weekWithStartDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_weekViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentWeekStartDate", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqualToDate:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)_centerXForRingAt:(int64_t)a3 percent:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  v9 = (40.0 - v8) * 0.5;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self, "view"));
  objc_msgSend(v10, "centerXForElementAt:width:percent:", a3 % 7, 40.0, a4);
  v12 = v11;

  return v9 + v12 + 40.0 * -0.5 * a4;
}

- (void)week:(id)a3 pressedOnDay:(int64_t)a4 down:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  unint64_t v9;
  MonthRingGroup *v10;
  MonthRingGroup *pressedRingGroup;

  v5 = a5;
  v8 = -[NSMutableArray indexOfObject:](self->_weekViews, "indexOfObject:", a3);
  v9 = a4 + HKDaysInAWeek * (_QWORD)v8;
  if ((v9 & 0x8000000000000000) == 0 && v9 < (unint64_t)-[NSMutableArray count](self->_ringGroups, "count"))
  {
    v10 = (MonthRingGroup *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_ringGroups, "objectAtIndexedSubscript:", v9));
    pressedRingGroup = self->_pressedRingGroup;
    self->_pressedRingGroup = v10;

    -[MonthScrollViewController _animateRingOnTouch:completion:](self, "_animateRingOnTouch:completion:", v5, 0);
  }
}

- (void)_animateRingOnTouch:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  LODWORD(v8) = 1064178811;
  if (!v4)
    *(float *)&v8 = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIFloatPropertyAnimation animationWithEndingFloatValue:duration:timingFunction:completion:](ARUIFloatPropertyAnimation, "animationWithEndingFloatValue:duration:timingFunction:completion:", v7, v6, v8, 0.2));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_endValue"));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v9, "duration");
  v14 = v13;
  LODWORD(v17) = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionHandler", _NSConcreteStackBlock, 3221225472, sub_10008FF40, &unk_100779330, self, v17));
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", &v16, 0, v15, v14);

}

- (void)week:(id)a3 cellSelected:(id)a4
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "date", a3));
  _HKInitializeLogging(v5, v6);
  v7 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MSVC] Cell selected: %@", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009006C;
  v9[3] = &unk_100777EE0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[MonthScrollViewController _animateRingOnTouch:completion:](self, "_animateRingOnTouch:completion:", 0, v9);

}

- (void)_reloadAllWorkoutsFromCache
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_weekViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[MonthScrollViewController _loadWorkoutsForWeek:](self, "_loadWorkoutsForWeek:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_reloadAllActivitySummariesFromCache
{
  NSMutableArray *weekViews;
  _QWORD v3[5];

  weekViews = self->_weekViews;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009022C;
  v3[3] = &unk_100779358;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](weekViews, "enumerateObjectsUsingBlock:", v3);
}

- (void)_loadActivitySummariesForWeek:(id)a3 ringGroupIndex:(unint64_t)a4
{
  void *v6;
  _QWORD v7[6];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "summaryIndexes"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000902C4;
  v7[3] = &unk_100779380;
  v7[4] = self;
  v7[5] = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (void)_loadWorkoutsForWeek:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "summaryIndexes"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009043C;
  v7[3] = &unk_1007793A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (FitMonthWeekViewDatasource)monthWeekDatasource
{
  return (FitMonthWeekViewDatasource *)objc_loadWeakRetained((id *)&self->_monthWeekDatasource);
}

- (void)setMonthWeekDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_monthWeekDatasource, a3);
}

- (MonthScrollViewDelegate)monthScrollDelegate
{
  return (MonthScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_monthScrollDelegate);
}

- (void)setMonthScrollDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_monthScrollDelegate, a3);
}

- (NSMutableArray)weekViews
{
  return self->_weekViews;
}

- (void)setWeekViews:(id)a3
{
  objc_storeStrong((id *)&self->_weekViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_monthScrollDelegate);
  objc_destroyWeak((id *)&self->_monthWeekDatasource);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_summaryCache, 0);
  objc_storeStrong((id *)&self->_workoutCache, 0);
  objc_storeStrong((id *)&self->_lastVisibleWeekDate, 0);
  objc_storeStrong((id *)&self->_lastVisibleWeek, 0);
  objc_storeStrong((id *)&self->_pressedRingGroup, 0);
  objc_storeStrong((id *)&self->_ringGroups, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
