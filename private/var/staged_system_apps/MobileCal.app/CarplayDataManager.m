@implementation CarplayDataManager

- (CarplayDataManager)initWithEventStore:(id)a3
{
  id v5;
  CarplayDataManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventLoadingQueue;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarplayDataManager;
  v6 = -[CarplayDataManager init](&v11, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.mobilecal.carplay.loading", 0);
    eventLoadingQueue = v6->_eventLoadingQueue;
    v6->_eventLoadingQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_eventStore, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "_timeZoneChanged:", kCalTimeZoneChangedNotification, 0);

  }
  return v6;
}

- (id)collectionForDayType:(int64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDataManager tomorrowLoadedEventCollection](self, "tomorrowLoadedEventCollection"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDataManager loadedEventCollection](self, "loadedEventCollection"));
  return v3;
}

- (id)_selectedCalendars
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = objc_msgSend(objc_alloc((Class)EKCalendarVisibilityManager), "initWithEventStore:visibilityChangedCallback:queue:", self->_eventStore, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCalendars"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarVisibilityManager unselectedCalendarsForFocusModeInEventStore:](EKCalendarVisibilityManager, "unselectedCalendarsForFocusModeInEventStore:", self->_eventStore));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v4));
    objc_msgSend(v6, "minusSet:", v5);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

    v4 = (void *)v7;
  }
  v8 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    v12 = 136315394;
    v13 = "-[CarplayDataManager _selectedCalendars]";
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s found [%@] selected calendars", (uint8_t *)&v12, 0x16u);

  }
  return v4;
}

- (CUIKOccurrencesCollection)loadedEventCollection
{
  NSObject *eventLoadingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10004E434;
  v10 = sub_10004E444;
  v11 = 0;
  eventLoadingQueue = self->_eventLoadingQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E44C;
  v5[3] = &unk_1001B2E60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventLoadingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CUIKOccurrencesCollection *)v3;
}

- (CUIKOccurrencesCollection)tomorrowLoadedEventCollection
{
  NSObject *eventLoadingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10004E434;
  v10 = sub_10004E444;
  v11 = 0;
  eventLoadingQueue = self->_eventLoadingQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E514;
  v5[3] = &unk_1001B2E60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventLoadingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CUIKOccurrencesCollection *)v3;
}

- (void)reloadEvents:(id)a3
{
  id v4;
  NSObject *eventLoadingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventLoadingQueue = self->_eventLoadingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E5A4;
  v7[3] = &unk_1001B26A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventLoadingQueue, v7);

}

- (void)_fetchUpcomingOccurrences:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CUIKOccurrencesCollection *v16;
  void *v17;
  CUIKOccurrencesCollection *v18;
  CUIKOccurrencesCollection *loadedEventCollection;
  CUIKOccurrencesCollection *v20;
  CUIKOccurrencesCollection *tomorrowLoadedEventCollection;
  CUIKOccurrencesCollection *v22;
  CUIKOccurrencesCollection *v23;
  CUIKOccurrencesCollection *v24;
  void *v25;
  CUIKOccurrencesCollection *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  CUIKOccurrencesCollection *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  CUIKOccurrencesCollection *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  CUIKOccurrencesCollection *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;

  v4 = a3;
  v5 = CUIKCalendar(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "copy");
  objc_msgSend(v7, "setHour:", 23);
  objc_msgSend(v7, "setMinute:", 59);
  objc_msgSend(v7, "setSecond:", 59);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v4));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

  v47 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingDays:inCalendar:", 1, v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 254, v11));
  objc_msgSend(v12, "setHour:", 23);
  objc_msgSend(v12, "setMinute:", 59);
  objc_msgSend(v12, "setSecond:", 59);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startOfDayForDate:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDataManager _selectedCalendars](self, "_selectedCalendars"));
  v48 = (void *)v9;
  v49 = (void *)v8;
  v46 = (void *)v13;
  if (objc_msgSend(v15, "count"))
  {
    v16 = (CUIKOccurrencesCollection *)objc_claimAutoreleasedReturnValue(-[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v13, v14, v15));
    v18 = (CUIKOccurrencesCollection *)objc_claimAutoreleasedReturnValue(-[CarplayDataManager _calendarOccurrencesCollectionFromPredicate:](self, "_calendarOccurrencesCollectionFromPredicate:", v16));
    loadedEventCollection = self->_loadedEventCollection;
    self->_loadedEventCollection = v18;

    v20 = (CUIKOccurrencesCollection *)objc_claimAutoreleasedReturnValue(-[CarplayDataManager _calendarOccurrencesCollectionFromPredicate:](self, "_calendarOccurrencesCollectionFromPredicate:", v17));
    tomorrowLoadedEventCollection = self->_tomorrowLoadedEventCollection;
    self->_tomorrowLoadedEventCollection = v20;

  }
  else
  {
    v22 = (CUIKOccurrencesCollection *)objc_msgSend(objc_alloc((Class)CUIKOccurrencesCollection), "initWithOccurrences:timedOccurrences:allDayOccurrences:", 0, &__NSArray0__struct, &__NSArray0__struct);
    v23 = self->_loadedEventCollection;
    self->_loadedEventCollection = v22;

    v24 = (CUIKOccurrencesCollection *)objc_msgSend(objc_alloc((Class)CUIKOccurrencesCollection), "initWithOccurrences:timedOccurrences:allDayOccurrences:", 0, &__NSArray0__struct, &__NSArray0__struct);
    v16 = self->_tomorrowLoadedEventCollection;
    self->_tomorrowLoadedEventCollection = v24;
  }

  v25 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v26 = self->_loadedEventCollection;
    v27 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKOccurrencesCollection timedOccurrences](v26, "timedOccurrences"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "count")));
    *(_DWORD *)buf = 136315394;
    v51 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    v52 = 2112;
    v53 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s fetched [%@] timed occurrences for today", buf, 0x16u);

  }
  v30 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v31 = self->_loadedEventCollection;
    v32 = v30;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKOccurrencesCollection allDayOccurrences](v31, "allDayOccurrences"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "count")));
    *(_DWORD *)buf = 136315394;
    v51 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    v52 = 2112;
    v53 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s fetched [%@] all-day occurrences for today", buf, 0x16u);

  }
  v35 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v36 = self->_tomorrowLoadedEventCollection;
    v37 = v35;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKOccurrencesCollection timedOccurrences](v36, "timedOccurrences"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "count")));
    *(_DWORD *)buf = 136315394;
    v51 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    v52 = 2112;
    v53 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s fetched [%@] timed occurrences for tomorrow", buf, 0x16u);

  }
  v40 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v41 = self->_tomorrowLoadedEventCollection;
    v42 = v40;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKOccurrencesCollection allDayOccurrences](v41, "allDayOccurrences"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "count")));
    *(_DWORD *)buf = 136315394;
    v51 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    v52 = 2112;
    v53 = v44;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s fetched [%@] all-day occurrences for tomorrow", buf, 0x16u);

  }
  -[CarplayDataManager setHasEverCompletedFetch:](self, "setHasEverCompletedFetch:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v45, "postNotificationName:object:", CFSTR("com.apple.mobilecal.carplay.kEventFetchCompletedNotification"), 0);

}

- (id)_calendarOccurrencesCollectionFromPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:", v4));
  v8 = objc_msgSend(v7, "mutableCopy");
  if ((-[EKEventStore showDeclinedEvents](self->_eventStore, "showDeclinedEvents") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1001B2EA0));
    objc_msgSend(v8, "filterUsingPredicate:", v9);

  }
  objc_msgSend(v8, "sortUsingFunction:context:", &_CUIKCompareEKEvents, 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isAllDay", (_QWORD)v19))
          v16 = v6;
        else
          v16 = v5;
        objc_msgSend(v16, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = objc_msgSend(objc_alloc((Class)CUIKOccurrencesCollection), "initWithOccurrences:timedOccurrences:allDayOccurrences:", v10, v5, v6);
  return v17;
}

- (void)_timeZoneChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *eventLoadingQueue;
  _QWORD block[5];
  uint8_t buf[4];
  CarplayDataManager *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%@] received notification: [%@]", buf, 0x16u);
  }
  eventLoadingQueue = self->_eventLoadingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EEF0;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async(eventLoadingQueue, block);

}

- (BOOL)hasEverCompletedFetch
{
  return self->_hasEverCompletedFetch;
}

- (void)setHasEverCompletedFetch:(BOOL)a3
{
  self->_hasEverCompletedFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_tomorrowLoadedEventCollection, 0);
  objc_storeStrong((id *)&self->_loadedEventCollection, 0);
  objc_storeStrong((id *)&self->_eventLoadingQueue, 0);
}

@end
