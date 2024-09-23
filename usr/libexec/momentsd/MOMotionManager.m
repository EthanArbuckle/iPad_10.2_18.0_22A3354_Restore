@implementation MOMotionManager

- (MOMotionManager)initWithUniverse:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  MOMotionManager *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  NSOperationQueue *v29;
  NSOperationQueue *operationQueue;
  void *v31;
  MOMotionManager *v32;
  id os_log;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  objc_super v44;

  v5 = a3;
  v6 = objc_alloc_init((Class)CMMotionActivityManager);
  v7 = objc_alloc_init((Class)CMPedometer);
  v8 = objc_alloc_init((Class)HKHealthStore);
  v10 = (objc_class *)objc_opt_class(MOEventStore, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v12));

  v15 = (objc_class *)objc_opt_class(MOConfigurationManager, v14);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v17));

  v20 = (objc_class *)objc_opt_class(MORoutineServiceManager, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v22));

  if (!v13)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MOMotionManager initWithUniverse:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMotionManager.m"), 65, CFSTR("Invalid parameter not satisfying: eventStore"));

    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
  v44.receiver = self;
  v44.super_class = (Class)MOMotionManager;
  v24 = -[MOMotionManager init](&v44, "init");
  if (v24)
  {
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = dispatch_queue_create("MOMotionManager", v26);
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v27;

    v29 = objc_opt_new(NSOperationQueue);
    operationQueue = v24->_operationQueue;
    v24->_operationQueue = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](v24, "queue"));
    -[NSOperationQueue setUnderlyingQueue:](v24->_operationQueue, "setUnderlyingQueue:", v31);

    objc_storeStrong((id *)&v24->_motionActivityManager, v6);
    objc_storeStrong((id *)&v24->_pedometer, v7);
    objc_storeStrong((id *)&v24->_eventStore, v13);
    objc_storeStrong((id *)&v24->_configurationManager, v18);
    objc_storeStrong((id *)&v24->_routineServiceManager, v23);
    objc_storeStrong((id *)&v24->_healthStore, v8);
  }
  self = v24;
  v32 = self;
LABEL_10:

  return v32;
}

- (void)fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOMotionManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002B5B68;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  id os_log;
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32) && (v3 = (_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40)))
  {
    v9 = 0;
    v10[0] = &v9;
    v10[1] = 0x3032000000;
    v10[2] = __Block_byref_object_copy__38;
    v10[3] = __Block_byref_object_dispose__38;
    v11 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "eventStore"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_89;
    v8[3] = &unk_1002AEC68;
    v8[4] = &v9;
    objc_msgSend(v4, "fetchLastEventOfCategory:CompletionHandler:", 16, v8);

    if (*(_QWORD *)(v10[0] + 40) && objc_msgSend(*v2, "isBeforeDate:"))
      v2 = (id *)(v10[0] + 40);
    v5 = *v2;
    if (objc_msgSend(v5, "isAfterDate:", *v3))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      v7 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_cold_1((uint64_t)v10, (uint64_t *)(a1 + 40), v7);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_fetchAndSaveMotionActivityBetweenStartDate:EndDate:handler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    }

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "endDate"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)_fetchAndSaveMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
  v13[3] = &unk_1002B2348;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[MOMotionManager _fetchMotionActivityBetweenStartDate:EndDate:handler:](self, "_fetchMotionActivityBetweenStartDate:EndDate:handler:", v10, v9, v13);

}

void __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "trying to save motion event into database, count, %lu", buf, 0xCu);
  }

  if (objc_msgSend(v5, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventStore"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_92;
    v10[3] = &unk_1002ADA40;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v9, "storeEvents:CompletionHandler:", v5, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __79__MOMotionManager__fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saving motion event into database failed with error, %@", (uint8_t *)&v9, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchMotionActivityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSMutableArray *obj;
  uint64_t v38;
  id v39;
  _QWORD block[4];
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  id v47;
  MOMotionManager *v48;
  _QWORD *v49;
  _QWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  NSMutableArray *v56;
  _QWORD v57[5];
  id v58;
  _BYTE v59[128];

  v35 = a3;
  v36 = a4;
  v31 = a5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -604800.0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "startOfDayForDate:", v9));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "startOfDayForDate:", v35));
  if (objc_msgSend(v33, "isAfterDate:", v32))
    v10 = v33;
  else
    v10 = v32;
  v11 = v10;
  v12 = objc_opt_new(NSMutableArray);
  v13 = 0;
  if (objc_msgSend(v11, "isBeforeDate:", v36))
  {
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 86400.0));

      if (objc_msgSend(v11, "isAfterDate:", v35))
        v15 = v11;
      else
        v15 = v35;
      v16 = v15;
      if (objc_msgSend(v14, "isBeforeDate:", v36))
        v17 = v14;
      else
        v17 = v36;
      v18 = v17;
      if (objc_msgSend(v16, "isBeforeDate:", v18))
      {
        v19 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v16, v18);
        -[NSMutableArray addObject:](v12, "addObject:", v19);

      }
      v13 = v14;

      v11 = v13;
    }
    while ((objc_msgSend(v13, "isBeforeDate:", v36) & 1) != 0);
  }
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__38;
  v57[4] = __Block_byref_object_dispose__38;
  v58 = 0;
  v20 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__38;
  v55[4] = __Block_byref_object_dispose__38;
  v56 = objc_opt_new(NSMutableArray);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v12;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v21)
  {
    v38 = *(_QWORD *)v52;
    do
    {
      v39 = v21;
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v24 = objc_autoreleasePoolPush();
        dispatch_group_enter(v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager motionActivityManager](self, "motionActivityManager"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager operationQueue](self, "operationQueue"));
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke;
        v44[3] = &unk_1002B5B90;
        v45 = v20;
        v11 = v25;
        v46 = v11;
        v13 = v26;
        v47 = v13;
        v48 = self;
        v49 = v55;
        v50 = v57;
        objc_msgSend(v27, "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:", 1, v11, v13, v28, v44);

        objc_autoreleasePoolPop(v24);
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v21);
  }

  v29 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_2;
  block[3] = &unk_1002B5BB8;
  v41 = v31;
  v42 = v55;
  v43 = v57;
  v30 = v31;
  dispatch_group_notify(v20, v29, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

}

void __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      v9 = "fetch motion activity failed with error, %@";
      v10 = v8;
      v11 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v12 = *(void **)(a1 + 56);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_99;
      v16[3] = &unk_1002B3398;
      v18 = *(_OWORD *)(a1 + 64);
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v12, "_createNewEventsFromActivities:handler:", v5, v16);

      goto LABEL_8;
    }
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = 0;
      v9 = "motion activity fetch result for collection is nil, start date, %@, end date, %@, error, %@";
      v10 = v8;
      v11 = 32;
      goto LABEL_4;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_8:

}

void __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v6);
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __72__MOMotionManager__fetchMotionActivityBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  int v6;
  id v7;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%lu remaining walking events after rejection filter", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createEventsFromActivities:(id)a3 withMininumEventSize:(double)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  NSMutableArray *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_opt_new(NSMutableArray);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
          v14 = objc_autoreleasePoolPush();
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
          objc_msgSend(v16, "timeIntervalSinceDate:", v15);
          if (v17 >= a4)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager createEventForMotionActivityWithStartDate:andEndDate:](self, "createEventForMotionActivityWithStartDate:andEndDate:", v15, v16));
            -[NSMutableArray addObject:](v7, "addObject:", v18);

          }
          objc_autoreleasePoolPop(v14);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    if (-[NSMutableArray count](v7, "count"))
      v19 = v7;
    else
      v19 = (NSMutableArray *)&__NSArray0__struct;

    v6 = v21;
  }
  else
  {
    v19 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v19;
}

- (id)createEventForMotionActivityWithStartDate:(id)a3 andEndDate:(id)a4
{
  id v5;
  id v6;
  MOEvent *v7;
  void *v8;
  void *v9;
  MOEvent *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = [MOEvent alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v7, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v8, v6, v5, v9, 7, 16);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 604800.0));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v11);

  return v10;
}

- (void)fetchPedometerDataFor:(id)a3 toEndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager pedometer](self, "pedometer"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke;
  v13[3] = &unk_1002B5BE0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "queryPedometerDataFromDate:toDate:withHandler:", v10, v9, v13);

}

void __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id os_log;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);

  v4 = a3;
  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v13();

}

+ (BOOL)eligibleForBundling:(unint64_t)a3
{
  return (a3 < 7) & (0x4Cu >> a3);
}

- (void)_setMotionTypeAndDurationFor:(id)a3 fromMotionActivity:(id)a4
{
  id v5;
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
  id v19;

  v19 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "unknown"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v6, "setMotionType:", 0);

  }
  if (objc_msgSend(v5, "stationary"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v7, "setMotionType:", 1);

  }
  if (objc_msgSend(v5, "walking") && (objc_msgSend(v5, "running") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v8, "setMotionType:", 2);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutEvent"));
    objc_msgSend(v9, "setWorkoutType:", CFSTR("MOMotionActivityTypeWalking"));

  }
  if (objc_msgSend(v5, "running") && (objc_msgSend(v5, "walking") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v10, "setMotionType:", 3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutEvent"));
    objc_msgSend(v11, "setWorkoutType:", CFSTR("MOMotionActivityTypeRunning"));

  }
  if (objc_msgSend(v5, "running") && objc_msgSend(v5, "walking"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v12, "setMotionType:", 6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutEvent"));
    objc_msgSend(v13, "setWorkoutType:", CFSTR("MOMotionActivityTypeMixedRunningWalking"));

  }
  if (objc_msgSend(v5, "automotive"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v14, "setMotionType:", 4);

  }
  if (objc_msgSend(v5, "cycling"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "motionActivityEvent"));
    objc_msgSend(v15, "setMotionType:", 5);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutEvent"));
    objc_msgSend(v16, "setWorkoutType:", CFSTR("MOMotionActivityTypeCycling"));

  }
  objc_msgSend(v19, "duration");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutEvent"));
  objc_msgSend(v18, "setWorkoutDuration:", v17);

}

- (void)rehydrateMotionActivity:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MOMotionManager_rehydrateMotionActivity_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __51__MOMotionManager_rehydrateMotionActivity_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateMotionActivity:forLocationSetting:handler:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isAllowedToProcessEventCategory:", 1), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateMotionActivity:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CMMotionActivityManager *motionActivityManager;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *obj;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  MOMotionManager *v47;
  id v48;
  _QWORD *v49;
  BOOL v50;
  _QWORD v51[4];
  NSObject *v52;
  id v53;
  MOMotionManager *v54;
  _QWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  NSMutableArray *v61;
  _BYTE v62[128];

  v43 = a3;
  v34 = a5;
  v7 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "getDurationOfMOEventArray"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "startDate"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -604800.0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "startOfDayForDate:", v9));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "startOfDayForDate:", v40));
  if (objc_msgSend(v37, "isAfterDate:", v36))
    v10 = v37;
  else
    v10 = v36;
  v11 = v10;
  v12 = objc_opt_new(NSMutableArray);
  v13 = 0;
  if (objc_msgSend(v11, "isBeforeDate:", v41))
  {
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 86400.0));

      if (objc_msgSend(v11, "isAfterDate:", v40))
        v15 = v11;
      else
        v15 = v40;
      v16 = v15;
      if (objc_msgSend(v14, "isBeforeDate:", v41))
        v17 = v14;
      else
        v17 = v41;
      v18 = v17;
      if (objc_msgSend(v16, "isBeforeDate:", v18))
      {
        v19 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v16, v18);
        -[NSMutableArray addObject:](v12, "addObject:", v19);

      }
      v13 = v14;

      v11 = v13;
    }
    while ((objc_msgSend(v13, "isBeforeDate:", v41) & 1) != 0);
  }
  v20 = dispatch_group_create();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__38;
  v60[4] = __Block_byref_object_dispose__38;
  v61 = objc_opt_new(NSMutableArray);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v12;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v57;
    do
    {
      v23 = 0;
      v24 = v13;
      v25 = v11;
      do
      {
        if (*(_QWORD *)v57 != v22)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v23);
        v27 = objc_autoreleasePoolPush();
        dispatch_group_enter(v20);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));

        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
        motionActivityManager = self->_motionActivityManager;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager operationQueue](self, "operationQueue"));
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke;
        v51[3] = &unk_1002B5C08;
        v52 = v20;
        v53 = v43;
        v54 = self;
        v55 = v60;
        -[CMMotionActivityManager queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:](motionActivityManager, "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:", 1, v11, v13, v29, v51);

        objc_autoreleasePoolPop(v27);
        v23 = (char *)v23 + 1;
        v24 = v13;
        v25 = v11;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v21);
  }

  v30 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_113;
  block[3] = &unk_1002B5C58;
  v49 = v60;
  v45 = v40;
  v46 = v41;
  v50 = a4;
  v47 = self;
  v48 = v34;
  v31 = v34;
  v32 = v41;
  v33 = v40;
  dispatch_group_notify(v20, v30, block);

  _Block_object_dispose(v60, 8);
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
LABEL_4:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_9;
  }
  v15 = objc_msgSend(v5, "count");
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue(v16);
  v17 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no motion activity is fetched for rehydration", buf, 2u);
    }
    goto LABEL_4;
  }
  if (v17)
  {
    v18 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134217984;
    v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "motion activity update, events, %lu", buf, 0xCu);
  }

  v19 = *(void **)(a1 + 40);
  v20 = *(void **)(a1 + 48);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_112;
  v23[3] = &unk_1002AE1C0;
  v21 = v19;
  v22 = *(_QWORD *)(a1 + 56);
  v24 = v21;
  v26 = v22;
  v25 = *(id *)(a1 + 32);
  objc_msgSend(v20, "_updateMetadataOfMotionEvents:withMotionActities:handler:", v21, v5, v23);

LABEL_9:
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      v7 = 134218240;
      v8 = v6;
      v9 = 2048;
      v10 = objc_msgSend(v3, "count");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "motion activity step count update, motion events, %lu, events, %lu", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_113(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%lu walking events rehydrated for %@ to %@", buf, 0x20u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
    v9 = *(unsigned __int8 *)(a1 + 72);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_114;
    v11[3] = &unk_1002B5C30;
    v13 = v7;
    v10 = *(void **)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v10, "_updateDeviceLocationsForMotionEvents:forLocationSetting:handler:", v8, v9, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v10 = 134218240;
    v11 = v9;
    v12 = 2048;
    v13 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "motion activity location update, motion events, %lu, updated events, %lu", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateDeviceLocationsForMotionEvents:(id)a3 forLocationSetting:(BOOL)a4 handler:(id)a5
{
  NSMutableArray *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSMutableArray *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id obj;
  _QWORD block[4];
  NSMutableArray *v31;
  id v32;
  uint8_t *v33;
  _QWORD v34[5];
  NSMutableArray *v35;
  NSObject *v36;
  uint8_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v27 = a3;
  v28 = a5;
  if (objc_msgSend(v27, "count"))
  {
    if (a4)
    {
      v8 = objc_opt_new(NSMutableArray);
      v9 = dispatch_group_create();
      *(_QWORD *)v42 = 0;
      v43 = v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__38;
      v46 = __Block_byref_object_dispose__38;
      v47 = 0;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v27;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            dispatch_group_enter(v9);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
            v15 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
              *(_DWORD *)buf = 138412802;
              v49 = v13;
              v50 = 2112;
              v51 = v16;
              v52 = 2112;
              v53 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "_updateDeviceLocationsForMotionEvents, event, %@, startDate, %@, endDate, %@", buf, 0x20u);

            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager routineServiceManager](self, "routineServiceManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke;
            v34[3] = &unk_1002B5C80;
            v37 = v42;
            v34[4] = v13;
            v35 = v8;
            v36 = v9;
            objc_msgSend(v18, "fetchDeviceLocationsFromStartDate:endDate:handler:", v19, v20, v34);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
        }
        while (v10);
      }

      v21 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke_115;
      block[3] = &unk_1002B5CA8;
      v31 = v8;
      v32 = v28;
      v33 = v42;
      v22 = v8;
      dispatch_group_notify(v9, v21, block);

      _Block_object_dispose(v42, 8);
    }
    else
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "significant location disabled. return input events", v42, 2u);
      }

      (*((void (**)(id, id, _QWORD))v28 + 2))(v28, v27, 0);
    }
  }
  else
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "motionEvents is empty.", v42, 2u);
    }

    (*((void (**)(id, void *, _QWORD))v28 + 2))(v28, &__NSArray0__struct, 0);
  }

}

void __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
      objc_storeStrong(v8, a3);
  }
  if (objc_msgSend(v5, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workoutEvent"));
    objc_msgSend(v10, "setWorkoutLocationRoute:", v5);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workoutEvent"));
    objc_msgSend(v12, "setWorkoutLocationStart:", v11);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2048;
      v19 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_updateDeviceLocationsForMotionEvents, event, %@, locations, %lu", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __84__MOMotionManager__updateDeviceLocationsForMotionEvents_forLocationSetting_handler___block_invoke_115(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_updateMetadataOfMotionEvents:(id)a3 withMotionActities:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSMutableArray *v34;
  id os_log;
  NSObject *v36;
  const char *v37;
  id v38;
  void (**v39)(id, void *, _QWORD);
  id v40;
  id v41;
  NSObject *group;
  NSMutableArray *v43;
  _QWORD block[4];
  NSMutableArray *v45;
  void (**v46)(id, void *, _QWORD);
  _QWORD v47[5];
  NSMutableArray *v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[8];
  _BYTE v59[128];
  _BYTE v60[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (!objc_msgSend(v9, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v36 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v37 = "no motion activity is fetched for update motion metadata";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, buf, 2u);
    }
LABEL_26:

    v10[2](v10, &__NSArray0__struct, 0);
    goto LABEL_27;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v36 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v37 = "no motion activity is stored for update motion metadata";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v39 = v10;
  v43 = objc_opt_new(NSMutableArray);
  v11 = objc_opt_new(NSMutableDictionary);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v40 = v9;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate", v39));
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v14);
  }

  v41 = v8;
  group = dispatch_group_create();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v11, "allKeys", v39));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
        v27 = objc_msgSend(v25, "containsObject:", v26);

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v28));
          -[MOMotionManager _setMotionTypeAndDurationFor:fromMotionActivity:](self, "_setMotionTypeAndDurationFor:fromMotionActivity:", v24, v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "motionActivityEvent"));
          LODWORD(v28) = +[MOMotionManager eligibleForBundling:](MOMotionManager, "eligibleForBundling:", objc_msgSend(v30, "motionType"));

          if ((_DWORD)v28)
          {
            dispatch_group_enter(group);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke;
            v47[3] = &unk_1002B5CD0;
            v47[4] = v24;
            v48 = v43;
            v49 = group;
            -[MOMotionManager fetchPedometerDataFor:toEndDate:CompletionHandler:](self, "fetchPedometerDataFor:toEndDate:CompletionHandler:", v31, v32, v47);

          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v21);
  }

  v33 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke_2;
  block[3] = &unk_1002B2DE0;
  v10 = v39;
  v45 = v43;
  v46 = v39;
  v34 = v43;
  dispatch_group_notify(group, v33, block);

  v9 = v40;
  v8 = v41;
LABEL_27:

}

void __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 && !a3)
  {
    v4 = a2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "distance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "motionActivityEvent"));
    objc_msgSend(v6, "setMotionDistance:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberOfSteps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "motionActivityEvent"));
    objc_msgSend(v8, "setMotionStepCount:", v7);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __76__MOMotionManager__updateMetadataOfMotionEvents_withMotionActities_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__MOMotionManager_removeMotionActivityDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __63__MOMotionManager_removeMotionActivityDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeMotionActivityDeletedAtSource:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeMotionActivityDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CMMotionActivityManager *motionActivityManager;
  void *v35;
  NSObject *v36;
  id v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableArray *obj;
  uint64_t v47;
  NSMutableArray *v48;
  MOMotionManager *v49;
  void *v50;
  _QWORD block[4];
  NSMutableArray *v52;
  MOMotionManager *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  NSMutableArray *v59;
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v6 = a3;
  v41 = a4;
  v49 = self;
  v7 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v50 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v44 = v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", -604800.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startOfDayForDate:", v13));

  v42 = v11;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startOfDayForDate:", v9));
  v39 = (void *)v15;
  v40 = v14;
  if (objc_msgSend(v14, "isAfterDate:", v15))
    v16 = v14;
  else
    v16 = (void *)v15;
  v17 = v16;
  v18 = objc_opt_new(NSMutableArray);
  v45 = (void *)v10;
  v19 = 0;
  if (objc_msgSend(v17, "isBeforeDate:", v10))
  {
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", 86400.0, v39, v40));

      if (objc_msgSend(v17, "isAfterDate:", v9))
        v21 = v17;
      else
        v21 = (void *)v9;
      v22 = v21;
      if (objc_msgSend(v20, "isBeforeDate:", v10))
        v23 = v20;
      else
        v23 = (void *)v10;
      v24 = v23;
      if (objc_msgSend(v22, "isBeforeDate:", v24))
      {
        v25 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v22, v24);
        -[NSMutableArray addObject:](v18, "addObject:", v25);

        v10 = (uint64_t)v45;
      }
      v19 = v20;

      v17 = v19;
    }
    while ((objc_msgSend(v19, "isBeforeDate:", v10) & 1) != 0);
  }
  v43 = (void *)v9;
  v26 = dispatch_group_create();
  v48 = objc_opt_new(NSMutableArray);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v18;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v27)
  {
    v28 = v27;
    v47 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v31 = objc_autoreleasePoolPush();
        dispatch_group_enter(v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
        motionActivityManager = v49->_motionActivityManager;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager operationQueue](v49, "operationQueue"));
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke;
        v55[3] = &unk_1002B5CF8;
        v17 = v32;
        v56 = v17;
        v19 = v33;
        v57 = v19;
        v58 = v50;
        v59 = v48;
        v60 = v26;
        -[CMMotionActivityManager queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:](motionActivityManager, "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:", 1, v17, v19, v35, v55);

        objc_autoreleasePoolPop(v31);
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v28);
  }

  v36 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](v49, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_118;
  block[3] = &unk_1002AEBA8;
  v52 = v48;
  v53 = v49;
  v54 = v41;
  v37 = v41;
  v38 = v48;
  dispatch_group_notify(v26, v36, block);

}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSMutableDictionary *v8;
  const char *v9;
  NSObject *p_super;
  uint32_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      v9 = "no motion activity is fetched for purge with error, %@";
      p_super = &v8->super.super;
      v11 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
    {
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      v29 = *(void **)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v44 = v29;
      v45 = 2112;
      v46 = v30;
      v47 = 2112;
      v48 = 0;
      v9 = "motion event fetch result for removeMotionActivityDeletedAtSource is nil, start date, %@, end date, %@, error, %@";
      p_super = &v8->super.super;
      v11 = 32;
      goto LABEL_4;
    }
    v31 = 0;
    v8 = objc_opt_new(NSMutableDictionary);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v32 = v5;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate", v31));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v14);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = *(id *)(a1 + 48);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys", v31));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
          v27 = objc_msgSend(v25, "containsObject:", v26);

          if ((v27 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);
    }

    v6 = v31;
    v5 = v32;
  }
LABEL_25:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_118(id *a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "rehydration failed motion event count, %lu", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "eventStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_119;
  v7[3] = &unk_1002AEB58;
  v6 = a1[4];
  v7[4] = a1[5];
  v8 = a1[6];
  objc_msgSend(v5, "removeEvents:CompletionHandler:", v6, v7);

}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2;
  block[3] = &unk_1002AF730;
  v12 = v5;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id os_log;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2_cold_1(v2, v4, v5, v6, v7, v8, v9, v10);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MOMotionManager_fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

id __88__MOMotionManager_fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMotionActivityBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchMotionActivityBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id os_log;
  NSObject *v31;
  CMMotionActivityManager *motionActivityManager;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSMutableArray *obj;
  uint64_t v50;
  void *v51;
  MOMotionManager *v52;
  NSObject *group;
  _QWORD block[4];
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  NSObject *v66;
  MOMotionManager *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];
  NSMutableArray *v78;
  _QWORD v79[5];
  NSMutableArray *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  _QWORD v86[2];

  v47 = a3;
  v48 = a4;
  v43 = a5;
  v39 = a6;
  v52 = self;
  v10 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", -604800.0));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "startOfDayForDate:", v12));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "startOfDayForDate:", v47));
  if (objc_msgSend(v45, "isAfterDate:", v44))
    v13 = v45;
  else
    v13 = v44;
  v14 = v13;
  v15 = objc_opt_new(NSMutableArray);
  v16 = 0;
  if (objc_msgSend(v14, "isBeforeDate:", v48))
  {
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0));

      if (objc_msgSend(v14, "isAfterDate:", v47))
        v18 = v14;
      else
        v18 = v47;
      v19 = v18;
      if (objc_msgSend(v17, "isBeforeDate:", v48))
        v20 = v17;
      else
        v20 = v48;
      v21 = v20;
      if (objc_msgSend(v19, "isBeforeDate:", v21))
      {
        v22 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v19, v21);
        -[NSMutableArray addObject:](v15, "addObject:", v22);

      }
      v16 = v17;

      v14 = v16;
    }
    while ((objc_msgSend(v16, "isBeforeDate:", v48) & 1) != 0);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 16));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 7));
  v86[0] = v42;
  v86[1] = v41;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 2));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v23));

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "filteredArrayUsingPredicate:", v40));
  group = dispatch_group_create();
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__38;
  v79[4] = __Block_byref_object_dispose__38;
  v80 = objc_opt_new(NSMutableArray);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__38;
  v77[4] = __Block_byref_object_dispose__38;
  v78 = objc_opt_new(NSMutableArray);
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__38;
  v75[4] = __Block_byref_object_dispose__38;
  v76 = 0;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v15;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  if (v24)
  {
    v50 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v50)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v27 = objc_autoreleasePoolPush();
        dispatch_group_enter(group);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
        v31 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v28;
          v83 = 2112;
          v84 = v29;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "start fetching motion activity from start date, %@, end date, %@", buf, 0x16u);
        }

        motionActivityManager = v52->_motionActivityManager;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager operationQueue](v52, "operationQueue"));
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
        v62[3] = &unk_1002B5D48;
        v14 = v28;
        v63 = v14;
        v16 = v29;
        v64 = v16;
        v68 = v75;
        v65 = v51;
        v66 = group;
        v67 = v52;
        v69 = v77;
        v70 = v79;
        -[CMMotionActivityManager queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:](motionActivityManager, "queryActivityWithAttribute:fromDate:toDate:toQueue:withHandler:", 1, v14, v16, v33, v62);

        objc_autoreleasePoolPop(v27);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    }
    while (v24);
  }

  v34 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](v52, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_132;
  block[3] = &unk_1002B5D70;
  v59 = v79;
  v60 = v77;
  v55 = v51;
  v56 = v47;
  v61 = v75;
  v57 = v48;
  v58 = v39;
  v35 = v39;
  v36 = v48;
  v37 = v47;
  v38 = v51;
  dispatch_group_notify(group, v34, block);

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(v79, 8);
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  MORehydrationMetrics *v19;
  void *v20;
  MORehydrationMetrics *v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  MORehydrationMetrics *v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    v36 = 2048;
    v37 = objc_msgSend(v5, "count");
    v38 = 2112;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetching motion activity result from start date, %@, end date, %@, number of activities, %ld, error, %@", buf, 0x2Au);
  }

  if (v6)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);

    if (objc_msgSend(v6, "code") == (id)104 || objc_msgSend(v6, "code") == (id)109)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    v19 = [MORehydrationMetrics alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v21 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v19, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 16, 7, 0, v20, objc_msgSend(*(id *)(a1 + 48), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 48), "count"), 0.0);

    v31 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v21, "submitMetricsWithError:", &v31);
    v22 = v31;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

  }
  else
  {
    v23 = *(void **)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 48);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_130;
    v25[3] = &unk_1002B5D20;
    v29 = *(_OWORD *)(a1 + 72);
    v30 = *(_QWORD *)(a1 + 88);
    v26 = (MORehydrationMetrics *)*(id *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v23, "_rehydrateEvents:andCreateNewEventsfromMotionActivity:handler:", v24, v5, v25);

    v21 = v26;
  }

}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(_QWORD *)(v10 + 40);
    v11 = (id *)(v10 + 40);
    if (!v12)
      objc_storeStrong(v11, a4);
  }
  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v8);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObjectsFromArray:", v7);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = 138413058;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2048;
    v22 = objc_msgSend(v8, "count");
    v23 = 2048;
    v24 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Fetching motion activity result from start date, %@, end date, %@, new events count, %ld, rehydrated events count, %ld", (uint8_t *)&v17, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_132(uint64_t a1)
{
  NSMutableDictionary *v2;
  id os_log;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MORehydrationMetrics *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void (*v27)(void);
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;

  v2 = objc_opt_new(NSMutableDictionary);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    v41 = v5;
    v42 = 2048;
    v43 = v6;
    v44 = 2048;
    v45 = v7;
    v46 = 2112;
    v47 = v8;
    v48 = 2112;
    v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%lu stored walking events, %lu walking events rehydrated, %lu new walking events fetched for %@ to %@", buf, 0x34u);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v10)
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v10, CFSTR("newEvents"));
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v11, CFSTR("rehydratedEvents"));
    v12 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 16, 7, 1, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)(objc_msgSend(*(id *)(a1 + 32), "count")- objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count")), 0.0);
    v37 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v12, "submitMetricsWithError:", &v37);

  }
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v13)
    goto LABEL_15;
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));

  if (v14 == CFSTR("MOErrorDomain"))
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_132_cold_1(v29, v30, v31, v32, v33, v34, v35, v36);

    v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_19;
  }
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v15
    || objc_msgSend(v15, "code") != (id)104
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "code") != (id)109)
  {
LABEL_15:
    v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_19:
    v27();
    goto LABEL_20;
  }
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_132_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

  v38 = NSLocalizedDescriptionKey;
  v39 = CFSTR("Provider database is unavailable");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1280, v25));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_20:

}

- (void)_rehydrateEvents:(id)a3 andCreateNewEventsfromMotionActivity:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSMutableArray *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *group;
  id v30;
  id v31;
  id obj;
  _QWORD block[5];
  id v35;
  _QWORD *v36;
  _BYTE *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSMutableArray *v40;
  NSObject *v41;
  _BYTE *v42;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;
  _BYTE v56[128];
  id v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v7 = a3;
  v8 = a4;
  v30 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v7, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "stored events count, %ld, motion activity count, %ld", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__38;
  v60 = __Block_byref_object_dispose__38;
  v61 = 0;
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__38;
  v54[4] = __Block_byref_object_dispose__38;
  v55 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke;
  v50[3] = &unk_1002AE1E8;
  v53 = v54;
  v51 = v7;
  v12 = v11;
  v52 = v12;
  v31 = v51;
  -[MOMotionManager _updateMetadataOfMotionEvents:withMotionActities:handler:](self, "_updateMetadataOfMotionEvents:withMotionActities:handler:", v51, v8, v50);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__38;
  v48[4] = __Block_byref_object_dispose__38;
  v49 = 0;
  v28 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  group = v12;
  v57 = v28;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sortedArrayUsingDescriptors:", v13));

  v15 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v45;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v18);
        if (!objc_msgSend(v14, "count")
          || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate")),
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject")),
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate")),
              v23 = objc_msgSend(v20, "isAfterDate:", v22),
              v22,
              v21,
              v20,
              v23))
        {
          -[NSMutableArray addObject:](v15, "addObject:", v19);
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v16);
  }

  dispatch_group_enter(group);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_140;
  v39[3] = &unk_1002B20E0;
  v42 = buf;
  v43 = v48;
  v24 = v15;
  v40 = v24;
  v25 = group;
  v41 = v25;
  -[MOMotionManager _createNewEventsFromActivities:handler:](self, "_createNewEventsFromActivities:handler:", v24, v39);
  v26 = objc_claimAutoreleasedReturnValue(-[MOMotionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_141;
  block[3] = &unk_1002B5DC0;
  v36 = v54;
  v37 = buf;
  block[4] = self;
  v35 = v30;
  v38 = v48;
  v27 = v30;
  dispatch_group_notify(v25, v26, block);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(buf, 8);
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id os_log;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v9 = 134218240;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "stored events count, %ld, rehydrated count, %ld", (uint8_t *)&v9, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a2;
  v7 = a3;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v12 = 134218240;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "activity events to save count, %ld, new events count, %ld", (uint8_t *)&v12, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_141(uint64_t a1)
{
  id v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isAllowedToProcessEventCategory:", 1);
  v8[0] = _NSConcreteStackBlock;
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8[1] = 3221225472;
  v8[2] = __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_2;
  v8[3] = &unk_1002B5D98;
  v10 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v9 = v6;
  v11 = v7;
  objc_msgSend(v5, "_updateDeviceLocationsForMotionEvents:forLocationSetting:handler:", v4, v2, v8);

}

void __81__MOMotionManager__rehydrateEvents_andCreateNewEventsfromMotionActivity_handler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
    v13 = 134218240;
    v14 = v9;
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "motion activity location update, rehydrated events, %lu, updated events, %lu", (uint8_t *)&v13, 0x16u);
  }

  if (v6)
  {
    v10 = *(_QWORD *)(a1[6] + 8);
    v12 = *(_QWORD *)(v10 + 40);
    v11 = (id *)(v10 + 40);
    if (!v12)
      objc_storeStrong(v11, a3);
  }
  (*(void (**)(void))(a1[4] + 16))();

}

- (void)_createNewEventsFromActivities:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  float v30;
  void *v31;
  id os_log;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  NSObject *v50;
  id v51;
  unsigned __int8 v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  unsigned __int8 v66;
  uint8_t buf[4];
  id v68;
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v60 = v7;
    v8 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("walking==YES")));
    v72 = v9;
    v73 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("running==NO")));
    v62 = (void *)v73;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 2));
    v11 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

    v61 = (void *)v11;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager configurationManager](self, "configurationManager"));
    LODWORD(v14) = 1142292480;
    objc_msgSend(v13, "getFloatSettingForKey:withFallback:", CFSTR("MOMotionWalkingMinimumEventSize"), v14);
    v59 = (void *)v12;
    v16 = objc_claimAutoreleasedReturnValue(-[MOMotionManager createEventsFromActivities:withMininumEventSize:](self, "createEventsFromActivities:withMininumEventSize:", v12, v15));

    v63 = (void *)v16;
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("running==YES")));
    v70 = v17;
    v71 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("walking==NO")));
    v57 = (void *)v71;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 2));
    v19 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v18));

    v56 = (void *)v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager configurationManager](self, "configurationManager"));
    LODWORD(v22) = 1133903872;
    objc_msgSend(v21, "getFloatSettingForKey:withFallback:", CFSTR("MOMotionRunningMinimumEventSize"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager createEventsFromActivities:withMininumEventSize:](self, "createEventsFromActivities:withMininumEventSize:", v20, v23));

    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v24);
    v58 = (void *)v17;
    v69[0] = v17;
    v69[1] = v9;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
    v26 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v25));

    v55 = (void *)v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager configurationManager](self, "configurationManager"));
    LODWORD(v29) = 1142292480;
    objc_msgSend(v28, "getFloatSettingForKey:withFallback:", CFSTR("MOMotionMixedRunWalkMinimumEventSize"), v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMotionManager createEventsFromActivities:withMininumEventSize:](self, "createEventsFromActivities:withMininumEventSize:", v27, v30));

    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v31);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v33 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v68 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Fetched %lu motion classifications", buf, 0xCu);
    }

    v34 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend(v59, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Fetched %lu walking classifications", buf, 0xCu);
    }

    v37 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v7 = v60;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Fetched %lu running classifications", buf, 0xCu);
    }

    v40 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Fetched %lu mixed running & walking classifications", buf, 0xCu);
    }

    v43 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = objc_msgSend(v63, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%lu walking classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    v46 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%lu running classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    v49 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134217984;
      v68 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%lu mixed running & walking classifications met minimum duration requirement for event creation", buf, 0xCu);
    }

    v52 = -[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 1);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke;
    v64[3] = &unk_1002B5DE8;
    v64[4] = self;
    v66 = v52;
    v65 = v60;
    -[MOMotionManager _updateMetadataOfMotionEvents:withMotionActities:handler:](self, "_updateMetadataOfMotionEvents:withMotionActities:handler:", v8, v6, v64);

  }
  else
  {
    v53 = _mo_log_facility_get_os_log(&MOLogFacilityMotionActivity);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "no new motion activity is fetched for creating events", buf, 2u);
    }

    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
  }

}

void __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke_2;
  v5[3] = &unk_1002ADFD8;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_updateDeviceLocationsForMotionEvents:forLocationSetting:handler:", a2, v3, v5);

}

uint64_t __58__MOMotionManager__createNewEventsFromActivities_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (CMPedometer)pedometer
{
  return self->_pedometer;
}

- (void)setPedometer:(id)a3
{
  objc_storeStrong((id *)&self->_pedometer, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineServiceManager, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_pedometer, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: eventStore", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

void __78__MOMotionManager_fetchAndSaveMotionActivityBetweenStartDate_EndDate_handler___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Last motion acvitiy is after the fetch window, last event, %@, end date, %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __69__MOMotionManager_fetchPedometerDataFor_toEndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Fetch steps from pedometer hit error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__MOMotionManager__rehydrateMotionActivity_forLocationSetting_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "no motion activity is fetched for rehydration with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __64__MOMotionManager__removeMotionActivityDeletedAtSource_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "removing motion event for purge failed with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "no motion activity is fetched with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __89__MOMotionManager__fetchMotionActivityBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_132_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Fetch motion activity events failed due to DB unavailability", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

@end
