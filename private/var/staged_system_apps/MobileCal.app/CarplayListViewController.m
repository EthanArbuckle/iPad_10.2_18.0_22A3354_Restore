@implementation CarplayListViewController

- (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039CE4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F60A0 != -1)
    dispatch_once(&qword_1001F60A0, block);
  return (id)qword_1001F6098;
}

- (CarplayListViewController)initWithModel:(id)a3
{
  id v5;
  CarplayListViewController *v6;
  CarplayListViewController *v7;
  id *p_model;
  uint64_t v9;
  UITableView *listView;
  CarplayNoEventsView *v11;
  CarplayNoEventsView *noEventsView;
  uint64_t v13;
  NSMutableSet *changedObjectIDs;
  uint64_t v15;
  NSMutableDictionary *calendarColorMapping;
  id v17;
  void *v18;
  CarplayListViewController *v19;
  EKCalendarVisibilityManager *v20;
  EKCalendarVisibilityManager *visibilityManager;
  CarplayTableViewSection *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  CarplayTableViewSection *v30;
  CarplayTableViewSection *todaySection;
  CarplayTableViewSection *v32;
  NSBundle *v33;
  void *v34;
  void *v35;
  CarplayTableViewSection *v36;
  CarplayTableViewSection *tomorrowSection;
  uint64_t v38;
  NSArray *sections;
  void **v41;
  uint64_t v42;
  id (*v43)(uint64_t);
  void *v44;
  CarplayListViewController *v45;
  objc_super v46;
  _QWORD v47[2];

  v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CarplayListViewController;
  v6 = -[CarplayListViewController init](&v46, "init");
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    v9 = objc_claimAutoreleasedReturnValue(-[CarplayListViewController _createListView](v7, "_createListView"));
    listView = v7->_listView;
    v7->_listView = (UITableView *)v9;

    v11 = objc_opt_new(CarplayNoEventsView);
    noEventsView = v7->_noEventsView;
    v7->_noEventsView = v11;

    -[CarplayNoEventsView setAnyCalendarsHiddenByFocus:](v7->_noEventsView, "setAnyCalendarsHiddenByFocus:", objc_msgSend(*p_model, "focusFilterMode") == (id)1);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    changedObjectIDs = v7->_changedObjectIDs;
    v7->_changedObjectIDs = (NSMutableSet *)v13;

    v7->_needsForceRefresh = 1;
    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    calendarColorMapping = v7->_calendarColorMapping;
    v7->_calendarColorMapping = (NSMutableDictionary *)v15;

    v17 = objc_alloc((Class)EKCalendarVisibilityManager);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventStore"));
    v41 = _NSConcreteStackBlock;
    v42 = 3221225472;
    v43 = sub_10003A078;
    v44 = &unk_1001B2538;
    v19 = v7;
    v45 = v19;
    v20 = (EKCalendarVisibilityManager *)objc_msgSend(v17, "initWithEventStore:visibilityChangedCallback:queue:", v18, &v41, &_dispatch_main_q);
    visibilityManager = v19->_visibilityManager;
    v19->_visibilityManager = v20;

    v22 = [CarplayTableViewSection alloc];
    v26 = CUIKNowDate(v22, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = CUIKStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext(v27, 0, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[CarplayTableViewSection initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:](v22, "initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:", 1, v29, 1, *p_model, v41, v42, v43, v44);
    todaySection = v19->_todaySection;
    v19->_todaySection = v30;

    v32 = [CarplayTableViewSection alloc];
    v33 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v19));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Tomorrow"), &stru_1001B67C0, 0));
    v36 = -[CarplayTableViewSection initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:](v32, "initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:", 0, v35, 1, *p_model);
    tomorrowSection = v19->_tomorrowSection;
    v19->_tomorrowSection = v36;

    v47[0] = v19->_todaySection;
    v47[1] = v19->_tomorrowSection;
    v38 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
    sections = v19->_sections;
    v19->_sections = (NSArray *)v38;

  }
  return v7;
}

- (int64_t)sectionForEvent:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[CarplayListViewController _shouldShowNoEventsView](self, "_shouldShowNoEventsView"))
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _allFetchedOccurrences:](self, "_allFetchedOccurrences:", 0));
    v5 = 0;
    if ((objc_msgSend(v6, "containsObject:", v4) & 1) == 0)
    {
      if (!-[CarplayListViewController _shouldShowTomorrowSection](self, "_shouldShowTomorrowSection")
        || (v5 = 1,
            v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _allFetchedOccurrences:](self, "_allFetchedOccurrences:", 1)),
            v8 = objc_msgSend(v7, "containsObject:", v4),
            v7,
            (v8 & 1) == 0))
      {
        v5 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }

  }
  return v5;
}

- (void)scrollToDate:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  double v23;

  v19 = a3;
  if (-[CarplayListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_listView) >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = 1.79769313e308;
    do
    {
      if (-[CarplayListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_listView, v5) >= 1)
      {
        v7 = 0;
        do
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, v5));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", self->_listView, v8));
          v10 = objc_opt_class(EKUIListViewAllDayEventCell);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
            || (v11 = objc_opt_class(EKUIListViewTimedEventCell),
                (objc_opt_isKindOfClass(v9, v11) & 1) != 0)
            || (v12 = objc_opt_class(EKUIListViewReminderCell), (objc_opt_isKindOfClass(v9, v12) & 1) != 0))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startCalendarDate"));

            if (v14)
            {
              objc_msgSend(v19, "differenceInSeconds:", v14);
              if (v15 < v6)
              {
                v16 = v15;
                if (v15 >= 0.0)
                {
                  v17 = v8;

                  v6 = v16;
                  v4 = v17;
                }
              }
            }
          }
          else
          {
            v14 = 0;
          }

          ++v7;
        }
        while (v7 < -[CarplayListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_listView, v5));
      }
      ++v5;
    }
    while (v5 < -[CarplayListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", self->_listView));
    if (v4)
    {
      v18 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v4;
        v22 = 2048;
        v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Scrolling list to indexPath: %@, with foundDifference: %f", buf, 0x16u);
      }
      -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_listView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 1, 1);

    }
  }

}

- (void)setViewControllerTitleForSelectedEventInSection:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = CUIKNowDate(self, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v14 = (id)v6;
  if (a3 == 1)
  {
    v7 = CUIKCalendar(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingDays:inCalendar:", 1, v8));

    v10 = CUIKStringForDate(v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v12, "setTitle:", v11);
    v14 = (id)v9;
  }
  else
  {
    v13 = CUIKStringForDate(v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v12, "setTitle:", v11);
  }

}

- (id)_createListView
{
  CarplayHeaderFooterTableView *v3;

  v3 = -[CarplayHeaderFooterTableView initWithFrame:style:]([CarplayHeaderFooterTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarplayHeaderFooterTableView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarplayHeaderFooterTableView setDelegate:](v3, "setDelegate:", self);
  -[CarplayHeaderFooterTableView setDataSource:](v3, "setDataSource:", self);
  +[CarplayTableViewSection registerClassesOnTableView:](CarplayTableViewSection, "registerClassesOnTableView:", v3);
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNavigationBarHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_databaseDidChange:", EKEventStoreChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_significantTimeChange:", UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_significantTimeChange:", CUIKTodayChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_eventFetchCompleted", CFSTR("com.apple.mobilecal.carplay.kEventFetchCompletedNotification"), 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_localeChanged", CUIKLocaleChangedNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_focusModeConfigurationChanged", CUIKCalendarModelFocusModeConfigurationChangedNotification, self->_model);
  -[CarplayListViewController _refreshTodayView](self, "_refreshTodayView");
  self->_needsForceRefresh = 1;
  -[CarplayListViewController _setViewStatesForCachedEventCollection](self, "_setViewStatesForCachedEventCollection");
  v7.receiver = self;
  v7.super_class = (Class)CarplayListViewController;
  -[CarplayListViewController viewWillAppear:](&v7, "viewWillAppear:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, EKEventStoreChangedNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CUIKTodayChangedNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.mobilecal.carplay.kEventFetchCompletedNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CUIKLocaleChangedNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CUIKCalendarModelFocusModeConfigurationChangedNotification, self->_model);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "setNavigationBarHidden:", 0);

  v7.receiver = self;
  v7.super_class = (Class)CarplayListViewController;
  -[CarplayListViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);

}

- (void)_databaseDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CarplayListViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A828;
  v5[3] = &unk_1001B26A0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)_significantTimeChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A910;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_localeChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AA18;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_focusModeConfigurationChanged
{
  -[UITableView reloadData](self->_listView, "reloadData");
  -[CarplayNoEventsView setAnyCalendarsHiddenByFocus:](self->_noEventsView, "setAnyCalendarsHiddenByFocus:", -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") == (id)1);
  -[CarplayListViewController _refreshTodayView](self, "_refreshTodayView");
}

- (void)_refreshTodayView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarplayListViewController sharedManager](self, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _currentDateComponents](self, "_currentDateComponents"));
  objc_msgSend(v4, "reloadEvents:", v3);

}

- (void)_eventFetchCompleted
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AB24;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setViewStatesForCachedEventCollection
{
  -[CarplayListViewController _loadAndShowAppropriateContentView](self, "_loadAndShowAppropriateContentView");
  -[CarplayListViewController _updateContent](self, "_updateContent");
}

- (BOOL)_shouldShowTomorrowSection
{
  void *v3;
  BOOL v4;

  if (!-[CarplayListViewController _anyOccurrencesAvailable:](self, "_anyOccurrencesAvailable:", 1))
    return 0;
  if (!-[CarplayListViewController _anyOccurrencesAvailable:](self, "_anyOccurrencesAvailable:", 0))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _currentDateComponents](self, "_currentDateComponents"));
  v4 = (uint64_t)objc_msgSend(v3, "hour") > 16;

  return v4;
}

- (BOOL)_shouldShowNoEventsView
{
  if (-[CarplayListViewController _anyOccurrencesAvailable:](self, "_anyOccurrencesAvailable:", 0))
    return 0;
  else
    return !-[CarplayListViewController _anyOccurrencesAvailable:](self, "_anyOccurrencesAvailable:", 1);
}

- (void)_loadAndShowAppropriateContentView
{
  -[CarplayListViewController _setShowingNoEventsMode:](self, "_setShowingNoEventsMode:", -[CarplayListViewController _shouldShowNoEventsView](self, "_shouldShowNoEventsView"));
}

- (void)_updateContent
{
  CarplayListViewController *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char **v7;
  char **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableSet *changedObjectIDs;
  void *v13;
  NSMutableDictionary *calendarColorMapping;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  NSMutableSet *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  CarplayListViewController *v62;
  id v63;
  void *v64;
  void *v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  int v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];

  v2 = self;
  if (-[CarplayListViewController _shouldShowNoEventsView](self, "_shouldShowNoEventsView"))
    return;
  -[CarplayListViewController setShowingTomorrowSection:](v2, "setShowingTomorrowSection:", -[CarplayListViewController _shouldShowTomorrowSection](v2, "_shouldShowTomorrowSection"));
  -[CarplayTableViewSection setPaddingCellEnabled:](v2->_todaySection, "setPaddingCellEnabled:", -[CarplayListViewController showingTomorrowSection](v2, "showingTomorrowSection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _allFetchedOccurrences:](v2, "_allFetchedOccurrences:", 0));
  v4 = 1;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _allFetchedOccurrences:](v2, "_allFetchedOccurrences:", 1));
  v5 = objc_claimAutoreleasedReturnValue(-[CarplayTableViewSection events](v2->_todaySection, "events"));
  v6 = objc_claimAutoreleasedReturnValue(-[CarplayTableViewSection events](v2->_tomorrowSection, "events"));
  v7 = &selRef_diagnosticsViewControllerDidDismiss;
  v8 = &selRef_diagnosticsViewControllerDidDismiss;
  v72 = (void *)v6;
  v73 = (void *)v5;
  if (!v2->_needsForceRefresh)
  {
    v9 = v6;
    if (objc_msgSend(v3, "isEqualToArray:", v5) && objc_msgSend(v75, "isEqualToArray:", v9))
    {
      if (-[NSMutableSet count](v2->_changedObjectIDs, "count"))
      {
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        obj = v3;
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        if (v69)
        {
          v67 = *(_QWORD *)v90;
          v65 = v3;
LABEL_8:
          v10 = 0;
          while (1)
          {
            if (*(_QWORD *)v90 != v67)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v10);
            changedObjectIDs = v2->_changedObjectIDs;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID", v65));
            if ((-[NSMutableSet containsObject:](changedObjectIDs, "containsObject:", v13) & 1) != 0)
              break;
            calendarColorMapping = v2->_calendarColorMapping;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendar"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](calendarColorMapping, "objectForKeyedSubscript:", v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendar"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorString"));
            v20 = objc_msgSend(v17, "isEqualToString:", v19);

            if (!v20)
            {
LABEL_50:
              v4 = 1;
              v3 = v65;
              v8 = &selRef_diagnosticsViewControllerDidDismiss;
LABEL_51:
              v7 = &selRef_diagnosticsViewControllerDidDismiss;
              goto LABEL_53;
            }
            v10 = (char *)v10 + 1;
            v8 = &selRef_diagnosticsViewControllerDidDismiss;
            if (v69 == v10)
            {
              v3 = v65;
              v7 = &selRef_diagnosticsViewControllerDidDismiss;
              v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
              if (v69)
                goto LABEL_8;
              goto LABEL_15;
            }
          }
        }
        else
        {
LABEL_15:

          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          obj = v75;
          v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
          if (!v70)
          {
            v4 = 0;
            goto LABEL_53;
          }
          v65 = v3;
          v68 = *(_QWORD *)v86;
LABEL_17:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v86 != v68)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v21);
            v23 = v2->_changedObjectIDs;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectID", v65));
            if ((-[NSMutableSet containsObject:](v23, "containsObject:", v13) & 1) != 0)
              break;
            v24 = *(Class *)((char *)&v2->super.super.super.isa + *((int *)v8 + 794));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendar"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v26));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendar"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "colorString"));
            v30 = objc_msgSend(v27, "isEqualToString:", v29);

            if (!v30)
              goto LABEL_50;
            v21 = (char *)v21 + 1;
            v8 = &selRef_diagnosticsViewControllerDidDismiss;
            if (v70 == v21)
            {
              v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
              if (v70)
                goto LABEL_17;
              v4 = 0;
              v3 = v65;
              goto LABEL_51;
            }
          }
        }
        v3 = v65;
        v7 = &selRef_diagnosticsViewControllerDidDismiss;

        v4 = 1;
LABEL_53:

        goto LABEL_26;
      }
      v4 = 0;
    }
    else
    {
      v4 = 1;
    }
  }
LABEL_26:
  v71 = v4;
  objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + *((int *)v7 + 792)), "removeAllObjects");
  v2->_needsForceRefresh = 0;
  v31 = *((int *)v8 + 794);
  objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v31), "removeAllObjects");
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v74 = v3;
  v32 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v34)
          objc_enumerationMutation(v74);
        v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        v37 = *(Class *)((char *)&v2->super.super.super.isa + v31);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "calendar"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v39));

        if (!v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "calendar"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "colorString"));
          v43 = *(Class *)((char *)&v2->super.super.super.isa + v31);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "calendar"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectID"));
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v45);

        }
      }
      v33 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v33);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v46 = v75;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(_QWORD *)v78 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
        v52 = *(Class *)((char *)&v2->super.super.super.isa + v31);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "calendar"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectID"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v54));

        if (!v55)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "calendar"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "colorString"));
          v57 = *(Class *)((char *)&v2->super.super.super.isa + v31);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "calendar"));
          v59 = v31;
          v60 = v48;
          v61 = v49;
          v62 = v2;
          v63 = v46;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectID"));
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, v64);

          v46 = v63;
          v2 = v62;
          v49 = v61;
          v48 = v60;
          v31 = v59;

        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    }
    while (v48);
  }

  if (v71)
  {
    -[CarplayTableViewSection updateWithEvents:](v2->_todaySection, "updateWithEvents:", v74);
    -[CarplayTableViewSection updateWithEvents:](v2->_tomorrowSection, "updateWithEvents:", v46);
    -[UITableView reloadData](v2->_listView, "reloadData");
  }

}

- (void)_setShowingNoEventsMode:(BOOL)a3
{
  if (a3)
  {
    -[UITableView removeFromSuperview](self->_listView, "removeFromSuperview");
    -[CarplayListViewController _showNoEventsView](self, "_showNoEventsView");
  }
  else
  {
    -[CarplayNoEventsView removeFromSuperview](self->_noEventsView, "removeFromSuperview");
    -[CarplayListViewController _showListView](self, "_showListView");
  }
}

- (void)_showNoEventsView
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  -[CarplayNoEventsView removeFromSuperview](self->_noEventsView, "removeFromSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_noEventsView);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView leadingAnchor](self->_noEventsView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "safeAreaLayoutGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView trailingAnchor](self->_noEventsView, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView bottomAnchor](self->_noEventsView, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v6));
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView topAnchor](self->_noEventsView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v11));
  v25[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)_showListView
{
  UITableView *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;

  v3 = self->_listView;
  v25 = objc_opt_new(NSMutableArray);
  -[UITableView removeFromSuperview](v3, "removeFromSuperview");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  objc_msgSend(v4, "addSubview:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](v3, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  -[NSMutableArray addObject:](v25, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](v3, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v25, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "safeAreaLayoutGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](v3, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  -[NSMutableArray addObject:](v25, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](v3, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
  -[NSMutableArray addObject:](v25, "addObject:", v24);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);
}

- (id)_currentDateComponents
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = CUIKCalendar(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6 = CUIKNowDate(v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 254, v7));

  v10 = CUIKCalendar(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "setCalendar:", v11);

  return v8;
}

- (BOOL)_anyOccurrencesAvailable:(int64_t)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController _allFetchedOccurrences:](self, "_allFetchedOccurrences:", a3));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_allFetchedOccurrences:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController sharedManager](self, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionForDayType:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrences"));

  return v6;
}

- (id)_timedOccurrences:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController sharedManager](self, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionForDayType:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timedOccurrences"));

  return v6;
}

- (id)_allDayOccurrences:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController sharedManager](self, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionForDayType:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allDayOccurrences"));

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[CarplayListViewController showingTomorrowSection](self, "showingTomorrowSection", a3))
    return 2;
  else
    return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  objc_msgSend(v4, "heightForHeaderInSection");
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSArray *sections;
  id v6;
  void *v7;
  void *v8;

  sections = self->_sections;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerForSectionInTableView:", v6));

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "numberOfRows");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayUtilities dateForSection:](CarplayUtilities, "dateForSection:", objc_msgSend(v6, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  v10 = objc_msgSend(v6, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForRow:underDate:inTableView:", v10, v8, v7));
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v10, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView:didSelectRowAtIndexPath:", v6, v10));

  if (v8)
  {
    -[CarplayListViewController setViewControllerTitleForSelectedEventInSection:](self, "setViewControllerTitleForSelectedEventInSection:", objc_msgSend(v10, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayListViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  -[CarplayListViewController _forceUpdateCell:](self, "_forceUpdateCell:", v5);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  -[CarplayListViewController _forceUpdateCell:](self, "_forceUpdateCell:", v5);

}

- (void)_forceUpdateCell:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_opt_class(CarplayCollapsedAllDayTableViewCell);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    objc_msgSend(v4, "forceUpdateOfAllElements");

}

- (BOOL)showingTomorrowSection
{
  return self->_showingTomorrowSection;
}

- (void)setShowingTomorrowSection:(BOOL)a3
{
  self->_showingTomorrowSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarColorMapping, 0);
  objc_storeStrong((id *)&self->_changedObjectIDs, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tomorrowSection, 0);
  objc_storeStrong((id *)&self->_todaySection, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_noEventsView, 0);
  objc_storeStrong((id *)&self->_visibilityManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
