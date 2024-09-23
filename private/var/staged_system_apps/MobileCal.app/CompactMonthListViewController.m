@implementation CompactMonthListViewController

- (CompactMonthListViewController)initWithModel:(id)a3
{
  id v5;
  CompactMonthListViewController *v6;
  CompactMonthListViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthListViewController;
  v6 = -[CompactMonthListViewController initWithStyle:](&v9, "initWithStyle:", 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v7->_cachedRowHeight = -1.0;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double left;
  double bottom;
  double right;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *multiSelectGestureRecognizer;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CompactMonthListViewController;
  -[CompactMonthListViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setSeparatorStyle:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setAllowsMultipleSelection:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("CompactMonthListViewTable"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v12 = objc_opt_class(EKUIListViewAllDayEventCell);
  v13 = (objc_class *)objc_opt_class(EKUIListViewAllDayEventCell);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v12, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v17 = objc_opt_class(EKUIListViewReminderCell);
  v18 = (objc_class *)objc_opt_class(EKUIListViewReminderCell);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v17, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v22 = objc_opt_class(EKUIListViewTimedEventCell);
  v23 = (objc_class *)objc_opt_class(EKUIListViewTimedEventCell);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", v22, v25);

  v26 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_multiSelect:");
  multiSelectGestureRecognizer = self->_multiSelectGestureRecognizer;
  self->_multiSelectGestureRecognizer = v26;

  -[UITapGestureRecognizer setAllowedTouchTypes:](self->_multiSelectGestureRecognizer, "setAllowedTouchTypes:", &off_1001BC730);
  -[UITapGestureRecognizer setDelegate:](self->_multiSelectGestureRecognizer, "setDelegate:", self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v28, "addGestureRecognizer:", self->_multiSelectGestureRecognizer);

  self->_shouldScrollToIdealPosition = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v17.receiver = self;
  v17.super_class = (Class)CompactMonthListViewController;
  -[CompactMonthListViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  if (v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController navigationController](self, "navigationController")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window")),
        v13,
        v12,
        !v14))
  {
    -[CompactMonthListViewController _reloadOccurrenceData](self, "_reloadOccurrenceData");
  }
  else
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v14);
    -[CompactMonthListViewController _reloadOccurrenceData](self, "_reloadOccurrenceData");
    EKUIPopFallbackSizingContextWithViewHierarchy(v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_selectedDateChanged:", CUIKCalendarModelSelectedDateChangedNotification, self->_model);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_occurrencesChanged:", CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->_model);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, self->_model);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_significantTimeChange:", CUIKCalendarModelSignificantTimeChangeNotification, self->_model);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_localeChanged:", CUIKLocaleChangedNotification, 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "_contentCategorySizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v16, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CompactMonthListViewController;
  -[CompactMonthListViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKCalendarModelSelectedDateChangedNotification, self->_model);
  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->_model);
  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKCalendarModelSignificantTimeChangeNotification, self->_model);
  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKLocaleChangedNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_flashOccurrenceTableScrollIndicators", 0);

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    if (!a3)
      -[CompactMonthListViewController _reloadTableViewAndScrollIfNeededWithForceScroll:](self, "_reloadTableViewAndScrollIfNeededWithForceScroll:", 1);
  }
}

- (void)_selectedDateChanged:(id)a3
{
  self->_shouldScrollToIdealPosition = 1;
  -[CompactMonthListViewController _updateOccurrenceTable](self, "_updateOccurrenceTable", a3);
}

- (void)_occurrencesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));

  if (v21)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v10 = v9;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForDay"));
    objc_msgSend(v14, "absoluteTime");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForEndOfDay"));
    objc_msgSend(v17, "absoluteTime");
    v19 = v18;

    if (v10 <= v19 && v12 >= v16)
      -[CompactMonthListViewController _updateOccurrenceTable](self, "_updateOccurrenceTable");

  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_shouldIgnoreSelectedOccurrencesChangedNotification)
  {
    -[CompactMonthListViewController deselectAllRowsAnimated:](self, "deselectAllRowsAnimated:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = -[NSMutableArray indexOfObject:](self->_selectedDayOccurrences, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i));
          if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = v9;
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, 0));
            objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v12, 0, 0);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
}

- (void)_significantTimeChange:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey));

  v5 = objc_msgSend(v7, "BOOLValue");
  v6 = v7;
  if ((v5 & 1) != 0 || !v7)
  {
    -[CompactMonthListViewController _reloadTableViewAndScrollIfNeededWithForceScroll:](self, "_reloadTableViewAndScrollIfNeededWithForceScroll:", 1);
    v6 = v7;
  }

}

- (void)_localeChanged:(id)a3
{
  -[CompactMonthListViewController _reloadTableViewAndScrollIfNeededWithForceScroll:](self, "_reloadTableViewAndScrollIfNeededWithForceScroll:", 1);
}

- (void)_contentCategorySizeChanged:(id)a3
{
  self->_cachedRowHeight = -1.0;
  -[CompactMonthListViewController _reloadTableViewAndScrollIfNeededWithForceScroll:](self, "_reloadTableViewAndScrollIfNeededWithForceScroll:", 1);
}

- (void)_reloadOccurrenceData
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  if (-[CUIKCalendarModel cachedOccurrencesAreLoaded](self->_model, "cachedOccurrencesAreLoaded"))
  {
    -[CompactMonthListViewController _updateOccurrenceTable](self, "_updateOccurrenceTable");
    -[CompactMonthListViewController _scrollToIdealPosition](self, "_scrollToIdealPosition");
  }
  else if (!self->_loadingOccurrenceCache)
  {
    self->_loadingOccurrenceCache = 1;
    v3 = -[CUIKCalendarModel selectedDateOccurrences:loadIsComplete:](self->_model, "selectedDateOccurrences:loadIsComplete:", 0, 0);
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003F56C;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)_updateOccurrenceTable
{
  -[CompactMonthListViewController _updateOccurrenceTableWithForce:](self, "_updateOccurrenceTableWithForce:", 0);
}

- (void)_updateOccurrenceTableWithForce:(BOOL)a3
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  void *v11;
  NSMutableArray *selectedDayOccurrences;
  char v13;

  if (self->_loadingOccurrenceCache && !a3)
    return;
  v4 = a3;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));

  if (!v6)
  {
    selectedDayOccurrences = self->_selectedDayOccurrences;
    self->_selectedDayOccurrences = 0;

    v13 = 1;
LABEL_13:
    -[CompactMonthListViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDateOccurrences:loadIsComplete:](self->_model, "selectedDateOccurrences:loadIsComplete:", v4, &v13));
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));
  v9 = self->_selectedDayOccurrences;
  self->_selectedDayOccurrences = v8;

  v10 = -[NSMutableArray count](self->_selectedDayOccurrences, "count");
  -[CompactMonthListViewController _reloadTableViewAndScrollIfNeededWithForceScroll:](self, "_reloadTableViewAndScrollIfNeededWithForceScroll:", 0);
  if (v10)
  {
    if (self->_willFlashOccurrenceTableScrollIndicators)
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_flashOccurrenceTableScrollIndicators", 0);
    self->_willFlashOccurrenceTableScrollIndicators = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
    objc_msgSend(v11, "setShowsVerticalScrollIndicator:", 0);

    -[CompactMonthListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_flashOccurrenceTableScrollIndicators", 0, 0.2);
  }

  if (v13)
    goto LABEL_13;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[NSMutableArray count](self->_selectedDayOccurrences, "count", a3))
  {
    -[CompactMonthListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No Events"), &stru_1001B67C0, 0));
    objc_msgSend(v9, "setText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textProperties"));
    objc_msgSend(v8, "setColor:", v7);

    -[CompactMonthListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v9);
  }
}

- (void)_flashOccurrenceTableScrollIndicators
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "flashScrollIndicators");

  self->_willFlashOccurrenceTableScrollIndicators = 0;
}

- (void)deselectAllRowsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedRows"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView", (_QWORD)v14));
        objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v12, v3);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)forceUpdate
{
  -[CompactMonthListViewController _updateOccurrenceTableWithForce:](self, "_updateOccurrenceTableWithForce:", 1);
}

- (void)_ignoreSelectedOccurrencesChangedNotification:(id)a3
{
  self->_shouldIgnoreSelectedOccurrencesChangedNotification = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_shouldIgnoreSelectedOccurrencesChangedNotification = 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  if (a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a4, a5.x, a5.y));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      v8 = objc_msgSend(v7, "containsObject:", v6);

      if ((v8 & 1) == 0)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10003FBA8;
        v14[3] = &unk_1001B26A0;
        v14[4] = self;
        v15 = v6;
        -[CompactMonthListViewController _ignoreSelectedOccurrencesChangedNotification:](self, "_ignoreSelectedOccurrencesChangedNotification:", v14);

      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003FC38;
      v12[3] = &unk_1001B2628;
      v13 = v6;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10003FC68;
      v11[3] = &unk_1001B2678;
      v11[4] = self;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v12, v11));

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  v8 = objc_opt_class(EKUIReadonlyEventViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  else
    v9 = 0;

  objc_msgSend(v9, "willCommitPreview");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003FE18;
  v11[3] = &unk_1001B26A0;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v6, "addAnimations:", v11);

}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", a3, a4, a5));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
    -[CUIKCalendarModel setSelectedOccurrences:](self->_model, "setSelectedOccurrences:", &__NSArray0__struct);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[CompactMonthListViewController disabled](self, "disabled", a3, a4))
    return 0;
  else
    return (int64_t)-[NSMutableArray count](self->_selectedDayOccurrences, "count");
}

- (id)_eventForRowAtIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_selectedDayOccurrences, "objectAtIndex:", objc_msgSend(a3, "row")));
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  char *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  void *v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));

  if (CUIKNSDateIsToday(v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    v15 = CUIKNowDate(v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v12, "compare:", v16) == (id)-1;

  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v8, "isReminderIntegrationEvent"))
  {
    v18 = (objc_class *)objc_opt_class(EKUIListViewReminderCell);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v7));

    objc_msgSend(v21, "setDelegate:", self);
  }
  else
  {
    if (!objc_msgSend(v8, "isAllDay"))
    {
      v25 = (objc_class *)objc_opt_class(EKUIListViewTimedEventCell);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v27, v7));

      v29 = CUIKCalendar(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v40 = v11;
      v31 = v6;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDateUnadjustedForLegacyClients"));
      v34 = objc_msgSend(v30, "cal_isMultidayEventForUIWithStartDate:endDate:", v32, v33);

      v6 = v31;
      v11 = v40;

      objc_msgSend(v21, "updateWithEvent:isMultiday:occurrenceStartDate:dimmed:", v8, v34, v40, v17);
      goto LABEL_10;
    }
    v22 = (objc_class *)objc_opt_class(EKUIListViewAllDayEventCell);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v24, v7));

  }
  objc_msgSend(v21, "updateWithEvent:dimmed:", v8, v17);
LABEL_10:
  objc_msgSend((id)objc_opt_class(v21), "adjustedSeparatorInsets");
  objc_msgSend(v21, "setSeparatorInset:");
  v35 = (char *)-[NSMutableArray count](self->_selectedDayOccurrences, "count");
  if ((uint64_t)objc_msgSend(v7, "row") >= (uint64_t)(v35 - 1)
    || -[CompactMonthListViewController _rowDrawsBackground:](self, "_rowDrawsBackground:", v7))
  {
    v36 = 0;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v7, "row") + 1, objc_msgSend(v7, "section")));
    v38 = -[CompactMonthListViewController _rowDrawsBackground:](self, "_rowDrawsBackground:", v37);

    v36 = v38 ^ 1;
  }
  objc_msgSend(v21, "setDrawsOwnRowSeparators:", v36);

  return v21;
}

- (BOOL)_rowDrawsBackground:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a3));
  v4 = +[EKUIListViewCell drawsBackgroundForEvent:](EKUIListViewCell, "drawsBackgroundForEvent:", v3);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (uint64_t)objc_msgSend(v6, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController presentedViewController](self, "presentedViewController"));
  if (v8
    || v7 == 0x7FFFFFFFFFFFFFFFLL
    || !self->_compactMonthListViewDelegate
    || v7 >= (uint64_t)-[NSMutableArray count](self->_selectedDayOccurrences, "count"))
  {
    goto LABEL_7;
  }
  if ((v7 & 0x8000000000000000) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v6));
    -[CompactMonthListViewControllerDelegate compactMonthListViewController:didSelectEvent:showMode:](self->_compactMonthListViewDelegate, "compactMonthListViewController:didSelectEvent:showMode:", self, v8, 1);
    -[CompactMonthListViewController deselectAllRowsAnimated:](self, "deselectAllRowsAnimated:", 1);
    objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v6, 1, 0);
LABEL_7:

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a4));
  -[CUIKCalendarModel deselectOccurrence:](self->_model, "deselectOccurrence:", v5);

}

- (void)_reloadTableViewAndScrollIfNeededWithForceScroll:(BOOL)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

  self->_shouldScrollToIdealPosition |= a3;
  -[CompactMonthListViewController _scrollToIdealPosition](self, "_scrollToIdealPosition");
}

- (void)_scrollToIdealPosition
{
  void *v3;
  void *v4;
  unsigned __int8 IsToday;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_shouldScrollToIdealPosition && !self->_disabled)
  {
    self->_shouldScrollToIdealPosition = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateForDay"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

    IsToday = CUIKNSDateIsToday(v18);
    if (-[NSMutableArray count](self->_selectedDayOccurrences, "count"))
    {
      v6 = 0;
      while (1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_selectedDayOccurrences, "objectAtIndexedSubscript:", v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
        v11 = CUIKNowDate(v8, v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = objc_msgSend(v8, "CalIsAfterDate:", v12);

        if ((IsToday & v13 & 1) != 0)
          break;
        if (++v6 >= (unint64_t)-[NSMutableArray count](self->_selectedDayOccurrences, "count"))
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      v6 = 0;
    }
    v14 = -[NSMutableArray count](self->_selectedDayOccurrences, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
    v16 = v15;
    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
      objc_msgSend(v16, "scrollToRowAtIndexPath:atScrollPosition:animated:", v17, 1, 0);

    }
    else
    {
      objc_msgSend(v15, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);
    }

  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v11 = objc_msgSend(v10, "swipeToDeleteEnabled");

  if (a4 == 1 && v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100040754;
    v12[3] = &unk_1001B26C8;
    v12[4] = self;
    v13 = v9;
    v14 = v8;
    -[CompactMonthListViewController _deleteEventAtIndexPath:withCompletionHandler:](self, "_deleteEventAtIndexPath:withCompletionHandler:", v13, v12);

  }
}

- (void)_purgeCachedOccurrence:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v5 = -[CompactMonthListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v4, 0);

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v7));
      if (objc_msgSend(v8, "isEqual:", v9))
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_selectedDayOccurrences, "removeObjectAtIndex:", v6);

  }
LABEL_7:

}

- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  EKUIRecurrenceAlertController *v14;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v6));
  objc_initWeak(&location, self);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1001B67C0, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100040A60;
  v16[3] = &unk_1001B2D28;
  objc_copyWeak(&v19, &location);
  v12 = v8;
  v17 = v12;
  v13 = v7;
  v18 = v13;
  v14 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue(+[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:barButtonItem:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:barButtonItem:forEvent:stringForDeleteButton:withCompletionHandler:", 0, self, 0, v12, v11, v16));
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  if (!objc_msgSend(v5, "swipeToDeleteEnabled"))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "isEditable");

  if ((v6 & 1) == 0)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

- (id)pasteboardManager
{
  return -[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager");
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:calendarModel:](EKUIAppReviewUtils, "displayReviewPromptIfNeededInScene:calendarModel:", v4, self->_model);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0)
  {
    if ("paste:" == a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
      v7 = objc_msgSend(v8, "canPerformPaste");

      goto LABEL_11;
    }
    if ("copy:" == a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      v10 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        v12.receiver = self;
        v12.super_class = (Class)CompactMonthListViewController;
        v7 = -[CompactMonthListViewController canPerformAction:withSender:](&v12, "canPerformAction:withSender:", a3, v6);
        goto LABEL_11;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences"));
      v10 = 0;
    }
    v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v10, v9);

    goto LABEL_11;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "cutEvents:delegate:", v5, self);

  }
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->_model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "copyEvents:delegate:", v5, self);

  }
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->_model, "selectedOccurrence", a3));
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v4, "setDateForPaste:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager"));
  objc_msgSend(v6, "pasteEventsWithDateMode:delegate:", 0, self);

}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[CompactMonthListViewControllerDelegate compactMonthListViewController:didSelectEvent:showMode:](self->_compactMonthListViewDelegate, "compactMonthListViewController:didSelectEvent:showMode:", self, a4, 3);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[CompactMonthListViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  BOOL v6;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  v6 = self->_multiSelectGestureRecognizer != v4
    || ((unint64_t)-[UITapGestureRecognizer modifierFlags](v4, "modifierFlags") & 0x120000) != 0;

  return v6;
}

- (void)_multiSelect:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9));

  v11 = v18;
  if (v18)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathsForSelectedRows"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v18));
    v15 = objc_msgSend(v13, "containsObject:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController tableView](self, "tableView"));
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v18, 1);

      -[CUIKCalendarModel deselectOccurrence:](self->_model, "deselectOccurrence:", v14);
    }
    else
    {
      objc_msgSend(v16, "selectRowAtIndexPath:animated:scrollPosition:", v18, 1, 0);

      -[CUIKCalendarModel selectOccurrence:](self->_model, "selectOccurrence:", v14);
    }

    v11 = v18;
  }

}

- (void)eventIconButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  objc_msgSend(v4, "setCompleted:", objc_msgSend(v4, "completed") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListViewController EKUI_editor](self, "EKUI_editor"));
  v9 = 0;
  v6 = objc_msgSend(v5, "saveEvent:span:error:", v4, 0, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
    }
  }

}

- (CompactMonthListViewControllerDelegate)compactMonthListViewDelegate
{
  return self->_compactMonthListViewDelegate;
}

- (void)setCompactMonthListViewDelegate:(id)a3
{
  self->_compactMonthListViewDelegate = (CompactMonthListViewControllerDelegate *)a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_selectedDayOccurrences, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
