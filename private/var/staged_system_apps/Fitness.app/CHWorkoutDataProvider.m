@implementation CHWorkoutDataProvider

- (void)_handleInitialResults:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *sortingQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKSortedSampleArray insertSamples:](self->_workouts, "insertSamples:", v5);

  os_unfair_lock_unlock(p_lock);
  -[CHWorkoutDataProvider _recreateFilterObjects](self, "_recreateFilterObjects");
  self->_dataAvailable = 1;
  sortingQueue = self->_sortingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C5AC;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async(sortingQueue, block);
}

- (CHWorkoutDataProvider)initWithHealthStore:(id)a3
{
  id v5;
  CHWorkoutDataProvider *v6;
  CHWorkoutDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHWorkoutDataProvider;
  v6 = -[CHWorkoutDataProvider init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    -[CHWorkoutDataProvider _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)addUpdateHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B51D4;
  v7[3] = &unk_100779CB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

- (void)addAnimatedUpdateHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B5214;
  v7[3] = &unk_100779CB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

- (void)_countWorkouts
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *workoutCountByTypeIdentifier;
  HKSortedSampleArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_workouts;
  v4 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutTypeKey initForWorkout:](CHWorkoutTypeKey, "initForWorkout:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)));
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v8));
        if (v9)
          v10 = (_UNKNOWN **)v9;
        else
          v10 = &off_1007B3DA0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v10, "unsignedIntegerValue") + 1));

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v8);
      }
      v5 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_lock);
  v12 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v3);
  workoutCountByTypeIdentifier = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = v12;

}

- (void)_recreateFilterObjects
{
  id v3;
  HKSortedSampleArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_workouts;
  v5 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutTypeKey initForWorkout:](CHWorkoutTypeKey, "initForWorkout:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8)));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  -[CHWorkoutDataProvider _countWorkouts](self, "_countWorkouts");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B5ED8;
  v12[3] = &unk_10077A078;
  v12[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", v12));

  -[CHWorkoutDataProvider setSortedTypeIdentifiers:](self, "setSortedTypeIdentifiers:", v11);
}

- (void)_runAnchoredObjectQueryWithRetryCount:(unint64_t)a3
{
  NSObject *v5;
  void ***v6;
  id v7;
  void *v8;
  HKAnchoredObjectQuery *v9;
  HKAnchoredObjectQuery *currentAnchoredObjectQuery;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, void *, uint64_t, void *);
  void *v14;
  id v15[2];
  uint8_t buf[4];
  unint64_t v17;

  if (self->_currentAnchoredObjectQuery)
  {
    self->_isRetrying = 0;
  }
  else
  {
    _HKInitializeLogging(self, a2);
    v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CHWorkoutDataProvider] Running anchored object workout query with retry count: %lu", buf, 0xCu);
    }
    self->_isFirstQueryReturn = 1;
    objc_initWeak((id *)buf, self);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10000AB8C;
    v14 = &unk_100779FD0;
    v15[1] = (id)a3;
    objc_copyWeak(v15, (id *)buf);
    v6 = objc_retainBlock(&v11);
    v7 = objc_alloc((Class)HKAnchoredObjectQuery);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType workoutType](HKObjectType, "workoutType", v11, v12, v13, v14));
    v9 = (HKAnchoredObjectQuery *)objc_msgSend(v7, "initWithType:predicate:anchor:limit:resultsHandler:", v8, 0, 0, 0, v6);
    currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
    self->_currentAnchoredObjectQuery = v9;

    -[HKAnchoredObjectQuery setUpdateHandler:](self->_currentAnchoredObjectQuery, "setUpdateHandler:", v6);
    -[HKAnchoredObjectQuery setDebugIdentifier:](self->_currentAnchoredObjectQuery, "setDebugIdentifier:", CFSTR("CHWorkoutDataProvider.currentAnchoredObjectQuery"));
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_currentAnchoredObjectQuery);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)hasWorkouts
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HKSortedSampleArray count](self->_workouts, "count");
  os_unfair_lock_unlock(p_lock);
  return (uint64_t)v4 > 0;
}

- (BOOL)dataAvailable
{
  return self->_dataAvailable;
}

- (void)_commonInit
{
  HKHealthStore *v3;
  HKHealthStore *healthStore;
  HKSortedSampleArray *v5;
  HKSortedSampleArray *workouts;
  void *v7;
  NSDictionary *workoutsByMonthAndYear;
  NSDictionary *workoutsByDay;
  NSDictionary *workoutsByIdentifier;
  NSArray *sortedDateComponentKeys;
  NSArray *sortedYearDateComponents;
  NSDictionary *dateComponentsByYear;
  NSDictionary *workoutStatisticsForMonthAndYear;
  NSDictionary *workoutStatisticsForYear;
  NSDictionary *workoutCountByTypeIdentifier;
  NSDictionary *v17;
  NSDictionary *localizedWorkoutTypeNamesByTypeIdentifier;
  NSArray *sortedTypeIdentifiers;
  NSDictionary *v20;
  NSMutableArray *v21;
  NSMutableArray *updateHandlers;
  NSMutableArray *v23;
  NSMutableArray *animatedUpdateHandlers;
  NSMutableArray *v25;
  NSMutableArray *filterActionStartedHandlers;
  NSMutableArray *v27;
  NSMutableArray *filterActionEndedHandlers;
  NSCalendar *v29;
  NSCalendar *gregorianCalendar;
  NSCalendar *v31;
  void *v32;
  NSCalendar *v33;
  NSCalendar *currentCalendar;
  uint64_t v35;
  OS_dispatch_queue *v36;
  OS_dispatch_queue *sortingQueue;
  uint64_t v38;
  OS_dispatch_queue *v39;
  OS_dispatch_queue *handlerQueue;
  void *v41;
  CHDemoDataProvider *v42;
  CHDemoDataProvider *demoDataProvider;

  if (!self->_healthStore)
  {
    v3 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = self->_healthStore;
    self->_healthStore = v3;

  }
  v5 = (HKSortedSampleArray *)objc_alloc_init((Class)HKSortedSampleArray);
  workouts = self->_workouts;
  self->_workouts = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0));
  -[HKSortedSampleArray setSortDescriptor:](self->_workouts, "setSortDescriptor:", v7);

  workoutsByMonthAndYear = self->_workoutsByMonthAndYear;
  self->_workoutsByMonthAndYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutsByDay = self->_workoutsByDay;
  self->_workoutsByDay = (NSDictionary *)&__NSDictionary0__struct;

  workoutsByIdentifier = self->_workoutsByIdentifier;
  self->_workoutsByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  sortedDateComponentKeys = self->_sortedDateComponentKeys;
  self->_sortedDateComponentKeys = (NSArray *)&__NSArray0__struct;

  sortedYearDateComponents = self->_sortedYearDateComponents;
  self->_sortedYearDateComponents = (NSArray *)&__NSArray0__struct;

  dateComponentsByYear = self->_dateComponentsByYear;
  self->_dateComponentsByYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutStatisticsForMonthAndYear = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutStatisticsForYear = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = (NSDictionary *)&__NSDictionary0__struct;

  workoutCountByTypeIdentifier = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  v17 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  localizedWorkoutTypeNamesByTypeIdentifier = self->_localizedWorkoutTypeNamesByTypeIdentifier;
  self->_localizedWorkoutTypeNamesByTypeIdentifier = v17;

  sortedTypeIdentifiers = self->_sortedTypeIdentifiers;
  self->_sortedTypeIdentifiers = (NSArray *)&__NSArray0__struct;

  v20 = self->_workoutCountByTypeIdentifier;
  self->_workoutCountByTypeIdentifier = (NSDictionary *)&__NSDictionary0__struct;

  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  updateHandlers = self->_updateHandlers;
  self->_updateHandlers = v21;

  v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  animatedUpdateHandlers = self->_animatedUpdateHandlers;
  self->_animatedUpdateHandlers = v23;

  v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  filterActionStartedHandlers = self->_filterActionStartedHandlers;
  self->_filterActionStartedHandlers = v25;

  v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  filterActionEndedHandlers = self->_filterActionEndedHandlers;
  self->_filterActionEndedHandlers = v27;

  v29 = (NSCalendar *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = v29;

  v31 = self->_gregorianCalendar;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  -[NSCalendar setTimeZone:](v31, "setTimeZone:", v32);

  v33 = (NSCalendar *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v33;

  v35 = HKCreateSerialDispatchQueueWithQOSClass(self, CFSTR("workoutSortingQueue"), 25);
  v36 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(v35);
  sortingQueue = self->_sortingQueue;
  self->_sortingQueue = v36;

  v38 = HKCreateSerialDispatchQueueWithQOSClass(self, CFSTR("workoutHandlerQueue"), 25);
  v39 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(v38);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v39;

  self->_lock._os_unfair_lock_opaque = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v41, "addObserver:selector:name:object:", self, "_timeZoneDidChange:", NSSystemTimeZoneDidChangeNotification, 0);

  v42 = objc_alloc_init(CHDemoDataProvider);
  demoDataProvider = self->_demoDataProvider;
  self->_demoDataProvider = v42;

}

- (id)unfilteredWorkouts
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKSortedSampleArray allSamples](self->_workouts, "allSamples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_runUpdateHandlers
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5F5C;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_calculateStatistics
{
  id v3;
  NSDictionary *v4;
  NSDictionary *workoutStatisticsForMonthAndYear;
  NSDictionary *v6;
  NSDictionary *workoutStatisticsForYear;
  NSArray *v8;
  id v9;
  _UNKNOWN **v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  void *j;
  _UNKNOWN **v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  id v27;
  NSDictionary *v28;
  NSDictionary *v29;
  NSDictionary *v30;
  NSDictionary *v31;
  void *v32;
  NSArray *obj;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v35 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  workoutStatisticsForMonthAndYear = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = v4;

  v6 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  workoutStatisticsForYear = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = v6;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_sortedDateComponentKeys;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  v10 = &FIUIDistanceTypeForActivityType_ptr;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_workoutsByMonthAndYear, "objectForKeyedSubscript:", v14));
        v16 = objc_msgSend(objc_alloc((Class)FIUIWorkoutStatistics), "initWithWorkouts:", v15);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v11);
  }
  v32 = v3;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = self->_sortedYearDateComponents;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        v18 = v10;
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v20 = objc_alloc_init((Class)NSMutableArray);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_dateComponentsByYear, "objectForKeyedSubscript:", v19));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v38;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_workoutsByMonthAndYear, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k)));
              objc_msgSend(v20, "addObjectsFromArray:", v26);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          }
          while (v23);
        }
        v10 = v18;
        v27 = objc_msgSend(objc_alloc((Class)v18[245]), "initWithWorkouts:", v20);
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v27, v19);

      }
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v36);
  }

  v28 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v32);
  v29 = self->_workoutStatisticsForMonthAndYear;
  self->_workoutStatisticsForMonthAndYear = v28;

  v30 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v35);
  v31 = self->_workoutStatisticsForYear;
  self->_workoutStatisticsForYear = v30;

}

- (void)_queue_sortAllWorkoutsByMonthAndYearWithCurrentFilter
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  NSCalendar *currentCalendar;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  NSCalendar *v32;
  void *v33;
  void *v34;
  id v35;
  CHWorkoutTypeKey *currentFilteredTypeIdentifier;
  void *v37;
  unsigned __int8 v38;
  unint64_t v39;
  unsigned __int8 v40;
  Block_layout *v41;
  int64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSDictionary *v55;
  NSDictionary *workoutsByMonthAndYear;
  NSDictionary *v57;
  NSDictionary *workoutsByDay;
  NSArray *v59;
  NSArray *sortedDateComponentKeys;
  NSArray *v61;
  NSArray *sortedYearDateComponents;
  NSDictionary *v63;
  NSDictionary *dateComponentsByYear;
  NSDictionary *v65;
  NSDictionary *workoutsByIdentifier;
  void *v67;
  CHWorkoutDataProvider *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id obj;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  _QWORD v81[5];
  unsigned __int8 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKSortedSampleArray allSamples](self->_workouts, "allSamples"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  v71 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v75 = objc_alloc_init((Class)NSMutableDictionary);
  v70 = objc_alloc_init((Class)NSMutableArray);
  v8 = v7;
  v74 = objc_alloc_init((Class)NSMutableDictionary);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v88 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v13, v15);

        currentCalendar = self->_currentCalendar;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](currentCalendar, "components:fromDate:", 12, v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v18));
        if (!v19)
        {
          objc_msgSend(v71, "addObject:", v18);
          v20 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v18);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v22 = _HKActivityCacheDateComponentsFromDate(v21, self->_currentCalendar);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v23));
        if (!v24)
        {
          v25 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v23);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v23));
        objc_msgSend(v26, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v10);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v72 = v71;
  v27 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v84 != v29)
          objc_enumerationMutation(v72);
        v31 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
        v32 = self->_currentCalendar;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v32, "dateFromComponents:", v31));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v32, "components:fromDate:", 4, v33));

        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", v34));
        if (!v35)
        {
          v35 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v70, "addObject:", v34);
        }
        objc_msgSend(v35, "addObject:", v31);
        objc_msgSend(v74, "setObject:forKeyedSubscript:", v35, v34);

      }
      v28 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    }
    while (v28);
  }
  v69 = v8;

  currentFilteredTypeIdentifier = self->_currentFilteredTypeIdentifier;
  v68 = self;
  if (currentFilteredTypeIdentifier)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutTypeKey emptyKey](CHWorkoutTypeKey, "emptyKey"));
    v38 = -[CHWorkoutTypeKey isEqual:](currentFilteredTypeIdentifier, "isEqual:", v37);

    if ((v38 & 1) == 0)
    {
      v39 = -[CHWorkoutTypeKey activityType](self->_currentFilteredTypeIdentifier, "activityType");
      v40 = -[CHWorkoutTypeKey isIndoor](self->_currentFilteredTypeIdentifier, "isIndoor");
      if (+[CHWorkoutTypeKey historyFilterDisambiguatesLocationForActivityType:](CHWorkoutTypeKey, "historyFilterDisambiguatesLocationForActivityType:", v39))
      {
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_1000B5DD0;
        v81[3] = &unk_100779FF0;
        v82 = v40;
        v81[4] = v39;
        v41 = (Block_layout *)v81;
      }
      else if (v39 == 77)
      {
        v41 = &stru_10077A050;
      }
      else
      {
        if (v39 != 46)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CHWorkoutTypeKey activityType](self->_currentFilteredTypeIdentifier, "activityType")));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("workoutActivityType==%@"), v67));

          goto LABEL_30;
        }
        v42 = -[CHWorkoutTypeKey swimLocationType](self->_currentFilteredTypeIdentifier, "swimLocationType");
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_1000B5E44;
        v80[3] = &unk_10077A010;
        v80[4] = v42;
        v41 = (Block_layout *)v80;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v41));
LABEL_30:
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "filteredArrayUsingPredicate:", v43));

      obj = (id)v44;
    }
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v45 = obj;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v77;
    do
    {
      for (k = 0; k != v47; k = (char *)k + 1)
      {
        if (*(_QWORD *)v77 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)k);
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "endDate"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "components:fromDate:", 12, v52));

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v53));
        objc_msgSend(v54, "addObject:", v50);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, v53);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
    }
    while (v47);
  }

  v55 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v6);
  workoutsByMonthAndYear = v68->_workoutsByMonthAndYear;
  v68->_workoutsByMonthAndYear = v55;

  v57 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v69);
  workoutsByDay = v68->_workoutsByDay;
  v68->_workoutsByDay = v57;

  v59 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v72);
  sortedDateComponentKeys = v68->_sortedDateComponentKeys;
  v68->_sortedDateComponentKeys = v59;

  v61 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v70);
  sortedYearDateComponents = v68->_sortedYearDateComponents;
  v68->_sortedYearDateComponents = v61;

  v63 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v74);
  dateComponentsByYear = v68->_dateComponentsByYear;
  v68->_dateComponentsByYear = v63;

  v65 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v75);
  workoutsByIdentifier = v68->_workoutsByIdentifier;
  v68->_workoutsByIdentifier = v65;

  -[CHWorkoutDataProvider _calculateStatistics](v68, "_calculateStatistics");
}

- (NSDictionary)workoutsByDay
{
  return self->_workoutsByDay;
}

- (void)startFetching
{
  id v3;

  if (-[CHDemoDataProvider hasDemoWorkouts](self->_demoDataProvider, "hasDemoWorkouts"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CHDemoDataProvider workouts](self->_demoDataProvider, "workouts"));
    -[CHWorkoutDataProvider _handleInitialResults:](self, "_handleInitialResults:", v3);

  }
  else
  {
    -[CHWorkoutDataProvider _runAnchoredObjectQueryWithRetryCount:](self, "_runAnchoredObjectQueryWithRetryCount:", 0);
  }
}

- (void)setSortedTypeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sortedTypeIdentifiers, a3);
}

+ (id)localizedNameForWorkoutTypeKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "activityType");
  if (v4 != (id)_HKWorkoutActivityTypeNone)
  {
    v10 = v4;
    v11 = (unint64_t)objc_msgSend(v3, "activityType");
    if (v11 <= 0x3F)
    {
      if (((1 << v11) & 0x8010102000010000) != 0)
        goto LABEL_7;
      if (v11 == 13)
      {
        v18 = objc_msgSend(v3, "isIndoor");
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        if (v18)
          v7 = CFSTR("WORKOUT_FILTER_INDOOR_CYCLE_DESCRIPTION");
        else
          v7 = CFSTR("WORKOUT_FILTER_OUTDOOR_CYCLE_DESCRIPTION");
        v8 = CFSTR("Localizable");
        goto LABEL_4;
      }
      if (v11 == 46)
      {
        v15 = objc_msgSend(v3, "swimLocationType");
        if (v15)
        {
          if (v15 == (id)2)
          {
            v20 = FIUIBundle(2);
            v5 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v6 = v5;
            v7 = CFSTR("SWIMMING_DESCRIPTION_OPEN_WATER");
          }
          else
          {
            if (v15 != (id)1)
            {
              v9 = 0;
              goto LABEL_9;
            }
            v16 = FIUIBundle(1);
            v5 = (void *)objc_claimAutoreleasedReturnValue(v16);
            v6 = v5;
            v7 = CFSTR("SWIMMING_DESCRIPTION_POOL");
          }
        }
        else
        {
          v19 = FIUIBundle(0);
          v5 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v6 = v5;
          v7 = CFSTR("SWIMMING_DESCRIPTION");
        }
        v8 = CFSTR("Localizable-Ariel");
        goto LABEL_4;
      }
    }
    if (v11 == 84)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("UNDERWATER_DIVING_DESCRIPTION");
      goto LABEL_3;
    }
    if (v11 != 3000)
    {
      v17 = FILocalizedNameForActivityType(objc_msgSend(v3, "activityType"), objc_msgSend(v3, "swimLocationType"), objc_msgSend(v3, "isIndoor"));
      v13 = objc_claimAutoreleasedReturnValue(v17);
      goto LABEL_8;
    }
LABEL_7:
    v12 = FILocalizedNameForIndoorAgnosticActivityType(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
LABEL_8:
    v9 = (void *)v13;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  v7 = CFSTR("ALL_WORKOUTS");
LABEL_3:
  v8 = CFSTR("Localizable");
LABEL_4:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1007AE1D0, v8));

LABEL_9:
  return v9;
}

+ (id)localizedShortNameForWorkoutTypeKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = _HKWorkoutActivityNameForActivityType(objc_msgSend(v4, "activityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WORKOUT_FILTER_SHORT_TITLE_%@"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_1007AE1D0, CFSTR("Localizable")));

  if (objc_msgSend(v9, "isEqualToString:", v7))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedNameForWorkoutTypeKey:", v4));

    v9 = (void *)v10;
  }

  return v9;
}

- (CHWorkoutDataProvider)init
{

  return 0;
}

- (void)_timeZoneDidChange:(id)a3
{
  NSCalendar *gregorianCalendar;
  id v4;

  gregorianCalendar = self->_gregorianCalendar;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone", a3));
  -[NSCalendar setTimeZone:](gregorianCalendar, "setTimeZone:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDataProvider;
  -[CHWorkoutDataProvider dealloc](&v4, "dealloc");
}

- (BOOL)isCurrentFilterValid
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider currentFilteredTypeIdentifier](self, "currentFilteredTypeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_workoutCountByTypeIdentifier, "objectForKeyedSubscript:", v3));
  v5 = (uint64_t)objc_msgSend(v4, "integerValue") > 0;

  return v5;
}

- (id)unfilteredWorkoutsWithMaxCount:(int64_t)a3
{
  id v5;
  id v6;
  int64_t v7;
  uint64_t i;
  void *v9;

  v5 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_lock);
  v6 = -[HKSortedSampleArray count](self->_workouts, "count");
  if ((uint64_t)v6 >= a3)
    v7 = a3;
  else
    v7 = (int64_t)v6;
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HKSortedSampleArray sampleAtIndex:](self->_workouts, "sampleAtIndex:", i));
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (NSDictionary)workoutsByMonthAndYear
{
  return self->_workoutsByMonthAndYear;
}

- (NSDictionary)workoutStatisticsForMonthAndYear
{
  return self->_workoutStatisticsForMonthAndYear;
}

- (id)workoutForUUID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_workoutsByIdentifier, "objectForKeyedSubscript:", a3);
}

- (NSArray)sortedDateComponentKeys
{
  return self->_sortedDateComponentKeys;
}

- (void)cancelAllFetches
{
  HKAnchoredObjectQuery *currentAnchoredObjectQuery;

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_currentAnchoredObjectQuery);
  currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
  self->_currentAnchoredObjectQuery = 0;

}

- (void)addFilterActionStartedHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B52D0;
  v7[3] = &unk_100779CB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

- (void)addFilterActionFinishedHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B538C;
  v7[3] = &unk_100779CB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

- (id)workoutsEndingInDateInterval:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HKSortedSampleArray allSamples](self->_workouts, "allSamples", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
        v14 = objc_msgSend(v4, "containsDate:", v13);

        if (v14)
        {
          objc_msgSend(v6, "addObject:", v12);
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
          objc_msgSend(v15, "timeIntervalSinceReferenceDate");
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          v20 = v19;

          if (v17 < v20)
            goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)deleteWorkout:(id)a3 shouldDeleteAssociatedSamples:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  HKHealthStore *healthStore;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v8 = a5;
  healthStore = self->_healthStore;
  v15 = a3;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B5680;
  v13[3] = &unk_100779F58;
  v14 = v8;
  v12 = v8;
  -[HKHealthStore _deleteObjects:options:completion:](healthStore, "_deleteObjects:options:completion:", v11, v5, v13);

}

- (void)setCurrentFilteredTypeIdentifier:(id)a3
{
  -[CHWorkoutDataProvider setCurrentFilteredTypeIdentifier:completion:](self, "setCurrentFilteredTypeIdentifier:completion:", a3, 0);
}

- (void)setCurrentFilteredTypeIdentifier:(id)a3 completion:(id)a4
{
  CHWorkoutTypeKey *v6;
  id v7;
  CHWorkoutTypeKey *currentFilteredTypeIdentifier;
  CHWorkoutTypeKey *v9;
  NSObject *sortingQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = (CHWorkoutTypeKey *)a3;
  v7 = a4;
  currentFilteredTypeIdentifier = self->_currentFilteredTypeIdentifier;
  self->_currentFilteredTypeIdentifier = v6;
  v9 = v6;

  -[CHWorkoutDataProvider _runFilterActionStartedHandlers](self, "_runFilterActionStartedHandlers");
  sortingQueue = self->_sortingQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B57F0;
  v12[3] = &unk_100779CB8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  dispatch_async(sortingQueue, v12);

}

- (void)_retryAnchoredObjectQueryWithRetryCount:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  HKAnchoredObjectQuery *currentAnchoredObjectQuery;
  unint64_t v8;
  dispatch_time_t v9;
  _QWORD v10[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isRetrying = 1;
  v6 = (uint64_t)-[HKSortedSampleArray count](self->_workouts, "count");
  -[HKSortedSampleArray removeAllSamples](self->_workouts, "removeAllSamples");
  os_unfair_lock_unlock(p_lock);
  currentAnchoredObjectQuery = self->_currentAnchoredObjectQuery;
  self->_currentAnchoredObjectQuery = 0;

  if (v6 >= 1)
    -[CHWorkoutDataProvider _runUpdateHandlers](self, "_runUpdateHandlers");
  v8 = 5;
  if (a3 < 5)
    v8 = a3;
  v9 = dispatch_time(0, 1000000000 * v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B5988;
  v10[3] = &unk_100779460;
  v10[4] = self;
  v10[5] = a3;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_handleRemovedObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  id v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "UUID", (_QWORD)v14));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  -[HKSortedSampleArray removeSamplesWithUUIDs:](self->_workouts, "removeSamplesWithUUIDs:", v5);
  os_unfair_lock_unlock(&self->_lock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18 = CFSTR("CHDeletedWorkoutKey");
  v19 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("FitnessWorkoutWasDeletedNotification"), self, v13);

}

- (void)_runAnimatedUpdateHandlers
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B5FF8;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_runFilterActionStartedHandlers
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B6094;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_runFilterActionFinishedHandlers
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B6130;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

- (void)_runHandlers:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B61EC;
  block[3] = &unk_100777E20;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_UUIDsForWorkoutsWithEndDate:(id)a3
{
  id v4;
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HKSortedSampleArray reverseSampleEnumerator](self->_workouts, "reverseSampleEnumerator", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
        if (objc_msgSend(v13, "compare:", v4) == (id)1)
        {

          goto LABEL_13;
        }
        if (objc_msgSend(v13, "isEqualToDate:", v4))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isWatchWorkout:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  HKSortedSampleArray *v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_workouts;
  v7 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID", (_QWORD)v16));
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
          v9 = objc_msgSend(v12, "_isWatchWorkout");
      }
      v8 = -[HKSortedSampleArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v9 & 1;
}

- (void)setDataAvailable:(BOOL)a3
{
  self->_dataAvailable = a3;
}

- (NSDictionary)workoutStatisticsForYear
{
  return self->_workoutStatisticsForYear;
}

- (NSArray)sortedYearDateComponents
{
  return self->_sortedYearDateComponents;
}

- (NSDictionary)dateComponentsByYear
{
  return self->_dateComponentsByYear;
}

- (NSArray)sortedTypeIdentifiers
{
  return self->_sortedTypeIdentifiers;
}

- (BOOL)isRetrying
{
  return self->_isRetrying;
}

- (CHWorkoutTypeKey)currentFilteredTypeIdentifier
{
  return self->_currentFilteredTypeIdentifier;
}

- (NSDictionary)localizedWorkoutTypeNamesByTypeIdentifier
{
  return self->_localizedWorkoutTypeNamesByTypeIdentifier;
}

- (void)setLocalizedWorkoutTypeNamesByTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localizedWorkoutTypeNamesByTypeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedWorkoutTypeNamesByTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_currentFilteredTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_demoDataProvider, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_sortingQueue, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentAnchoredObjectQuery, 0);
  objc_storeStrong((id *)&self->_filterActionEndedHandlers, 0);
  objc_storeStrong((id *)&self->_filterActionStartedHandlers, 0);
  objc_storeStrong((id *)&self->_animatedUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_workoutCountByTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutStatisticsForYear, 0);
  objc_storeStrong((id *)&self->_workoutStatisticsForMonthAndYear, 0);
  objc_storeStrong((id *)&self->_dateComponentsByYear, 0);
  objc_storeStrong((id *)&self->_sortedYearDateComponents, 0);
  objc_storeStrong((id *)&self->_sortedDateComponentKeys, 0);
  objc_storeStrong((id *)&self->_workoutsByIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutsByDay, 0);
  objc_storeStrong((id *)&self->_workoutsByMonthAndYear, 0);
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
