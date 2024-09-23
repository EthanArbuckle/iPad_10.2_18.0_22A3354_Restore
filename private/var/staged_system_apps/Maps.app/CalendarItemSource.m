@implementation CalendarItemSource

+ (id)sharedDateFormatter
{
  if (qword_1014D3B48 != -1)
    dispatch_once(&qword_1014D3B48, &stru_1011DD258);
  return (id)qword_1014D3B40;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CalendarItemSource;
  objc_msgSendSuper2(&v2, "initialize");
  if (qword_1014D3B30 != -1)
    dispatch_once(&qword_1014D3B30, &stru_1011DD278);
}

- (CalendarItemSource)init
{
  CalendarItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *updateQueue;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CalendarItemSource;
  v2 = -[CalendarItemSource init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("CalendarItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("calendar item source", v8);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_1014D3B39 = objc_msgSend(v11, "BOOLForKey:", CFSTR("__personalizedMapsCalendarItemsUseGenericPOI"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_1014D3B3A = objc_msgSend(v12, "BOOLForKey:", CFSTR("__personalizedMapsCalendarEnabled"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_1014D3B38 = objc_msgSend(v13, "BOOLForKey:", CFSTR("__personalizedMapsCalendarDisableCanonicalLookupSearch"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, "userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, "eventStoreDidChange:", EKEventStoreChangedNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, "applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, "applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

    -[CalendarItemSource _scheduleUpdateTimer](v2, "_scheduleUpdateTimer");
  }
  return v2;
}

- (void)userDefaultsDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__personalizedMapsCalendarItemsUseGenericPOI"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("__personalizedMapsCalendarEnabled"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__personalizedMapsCalendarDisableCanonicalLookupSearch"));

  if (byte_1014D3B39 != v5
    || byte_1014D3B3A != v7
    || byte_1014D3B38 != v9)
  {
    byte_1014D3B39 = v5;
    byte_1014D3B3A = v7;
    byte_1014D3B38 = v9;
    -[CalendarItemSource loadCalendarItems](self, "loadCalendarItems");
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  -[CalendarItemSource _clearUpdateTimer](self, "_clearUpdateTimer", a3);
  -[CalendarItemSource _scheduleUpdateTimer](self, "_scheduleUpdateTimer");
}

- (void)excludeItemsFromSource:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_exclusionSource, a3);
  v5 = a3;
  objc_msgSend(v5, "addObserver:", self);

}

- (void)dateHasChanged:(id)a3
{
  -[CalendarItemSource _clearUpdateTimer](self, "_clearUpdateTimer", a3);
  -[CalendarItemSource _scheduleUpdateTimer](self, "_scheduleUpdateTimer");
  -[CalendarItemSource loadCalendarItems](self, "loadCalendarItems");
}

- (void)_clearUpdateTimer
{
  NSTimer *updateTimer;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void)_scheduleUpdateTimer
{
  NSTimer *v3;
  NSTimer *updateTimer;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CalendarItemSource _nextUpdateDate](self, "_nextUpdateDate"));
  v3 = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, self, "dateHasChanged:", 0, 0, 0.0);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v5, "addTimer:forMode:", self->_updateTimer, NSDefaultRunLoopMode);

}

- (id)_nextUpdateDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_nextDayAtHour:timeZone:", 0, v3));

  return v4;
}

- (id)allItems
{
  NSObject *lockQueue;
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
  v9 = sub_10097E5BC;
  v10 = sub_10097E5CC;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10097E5D4;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)predicateForDateRangeSince:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v5, "setDay:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v3, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicateForEventsWithStartDate:endDate:calendars:", v3, v6, 0));

  return v8;
}

- (id)predicateForRemindersDueAfter:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v5, "setDay:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v3, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicateForIncompleteRemindersWithDueDateStarting:ending:calendars:", v3, v6, 0));

  return v8;
}

- (id)predicateForIncompleteReminders
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "predicateForIncompleteRemindersWithDueDateStarting:ending:calendars:", 0, 0, 0));

  return v3;
}

- (void)loadCalendarItems
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10097E840;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (void)_updateCalendarItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *lockQueue;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id obj;
  _QWORD block[5];
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  _QWORD v44[5];
  NSObject *v45;
  _QWORD *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  NSObject *v53;
  CalendarItemSource *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _BYTE v62[128];
  _BYTE v63[128];

  if (byte_1014D3B3A)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v3 = objc_claimAutoreleasedReturnValue(-[CalendarItemSource predicateForDateRangeSince:](self, "predicateForDateRangeSince:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore"));
    v36 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventsMatchingPredicate:", v3));

    v6 = dispatch_group_create();
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("_updateCalendarItems", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSource allItems](self->_exclusionSource, "allItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v14)
            objc_enumerationMutation(obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i), "keys"));
          if (v16)
            objc_msgSend(v11, "unionSet:", v16);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v13);
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10097ED68;
    v51[3] = &unk_1011DD2A0;
    v34 = v11;
    v52 = v34;
    v35 = v9;
    v53 = v35;
    v54 = self;
    v33 = v32;
    v55 = v33;
    v17 = objc_retainBlock(v51);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v48 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
          if (-[CalendarItemSource shouldIncludeEvent:](self, "shouldIncludeEvent:", v23))
          {
            dispatch_group_enter(v6);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "structuredLocation"));
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_10097EEE4;
            v44[3] = &unk_1011DD2C8;
            v46 = v17;
            v44[4] = v23;
            v45 = v6;
            sub_10097D024(v24, v44);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v20);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarItemSource predicateForIncompleteReminders](self, "predicateForIncompleteReminders"));
    dispatch_group_enter(v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10097EF50;
    v41[3] = &unk_1011DB7A8;
    v42 = v6;
    v43 = v17;
    v27 = v17;
    v28 = v6;
    v29 = objc_msgSend(v26, "fetchRemindersMatchingPredicate:completion:", v25, v41);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10097F1FC;
    block[3] = &unk_1011AC8B0;
    block[4] = self;
    v40 = v33;
    v30 = v33;
    dispatch_group_notify(v28, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    lockQueue = self->_lockQueue;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10097ED40;
    v61[3] = &unk_1011AC860;
    v61[4] = self;
    dispatch_sync(lockQueue, v61);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10097ED60;
    v60[3] = &unk_1011AC860;
    v60[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v60);
  }
}

- (BOOL)shouldIncludeEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "structuredLocation"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "structuredLocation")),
        v6 = objc_msgSend(v5, "isPrediction"),
        v5,
        (v6 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selfAttendee"));
    v9 = v8;
    v7 = !v8 || ((unint64_t)objc_msgSend(v8, "participantStatus") & 0xFFFFFFFFFFFFFFFDLL) != 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)subtitleFromEventName:(id)a3 eventDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarItemSource sharedDateFormatter](CalendarItemSource, "sharedDateFormatter"));
  v8 = v7;
  if (v6)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v6));
  else
    v9 = 0;
  v10 = v5;
  if (objc_msgSend(v10, "length"))
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\b%@\b"), v10));
  else
    v11 = v10;
  v12 = v11;

  v13 = v9;
  if (objc_msgSend(v13, "length"))
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\b%@\b"), v13));
  else
    v14 = v13;
  v15 = v14;

  v16 = v12;
  v17 = v15;
  if (objc_msgSend(v16, "length"))
  {
    if (objc_msgSend(v17, "length"))
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v16, v17));
    else
      v18 = v16;
  }
  else
  {
    v18 = v17;
  }
  v19 = v18;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_exclusionSource, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
