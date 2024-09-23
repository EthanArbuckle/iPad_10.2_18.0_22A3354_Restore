@implementation MORoutineServiceManager

- (MORoutineServiceManager)initWithUniverse:(id)a3
{
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  MORoutineServiceManager *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  GEOMapService *v22;
  GEOMapService *mapServiceManager;
  MORoutineServiceManager *v24;
  id os_log;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  objc_super v31;

  v6 = a3;
  v8 = (objc_class *)objc_opt_class(MOConfigurationManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  if (!v11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MORoutineServiceManager.m"), 84, CFSTR("Invalid parameter not satisfying: configurationManager"));
    goto LABEL_12;
  }
  v13 = (objc_class *)objc_opt_class(MOEventStore, v12);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v15));

  if (!v16)
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager initWithUniverse:].cold.2();

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MORoutineServiceManager.m"), 90, CFSTR("Invalid parameter not satisfying: eventStore"));

LABEL_12:
    v24 = 0;
    goto LABEL_13;
  }
  v31.receiver = self;
  v31.super_class = (Class)MORoutineServiceManager;
  v17 = -[MORoutineServiceManager init](&v31, "init");
  if (v17)
  {
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create("MORoutineServiceManager", v19);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v17->_eventStore, v16);
    objc_storeStrong((id *)&v17->_configurationManager, v11);
    v22 = objc_opt_new(GEOMapService);
    mapServiceManager = v17->_mapServiceManager;
    v17->_mapServiceManager = v22;

    objc_storeStrong((id *)&v17->_universe, a3);
  }
  self = v17;
  v24 = self;
LABEL_13:

  return v24;
}

- (RTRoutineManager)routineManager
{
  RTRoutineManager *routineManager;
  _QWORD block[5];

  routineManager = self->_routineManager;
  if (!routineManager)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __41__MORoutineServiceManager_routineManager__block_invoke;
    block[3] = &unk_1002AD8A8;
    block[4] = self;
    if (routineManager_onceToken != -1)
      dispatch_once(&routineManager_onceToken, block);
    routineManager = self->_routineManager;
  }
  return routineManager;
}

void __41__MORoutineServiceManager_routineManager__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)RTRoutineManager), "initWithRestorationIdentifier:", CFSTR("MORoutineServiceManagerClient"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void)fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MORoutineServiceManager_fetchStitchedVisitsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

id __89__MORoutineServiceManager_fetchStitchedVisitsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchStitchedVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (v16 && v8)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v16, v8);
    v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D9758, 0);
    v13 = objc_alloc((Class)RTStoredVisitFetchOptions);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh));
    v15 = objc_msgSend(v13, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 1, v14, v11, 1, 0, v12);

    -[MORoutineServiceManager _fetchVisitsBetweenStartDate:CompletionHandler:](self, "_fetchVisitsBetweenStartDate:CompletionHandler:", v15, v9);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)_fetchRealTimeVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (v16 && v8)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v16, v8);
    v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D9770, 0);
    v13 = objc_alloc((Class)RTStoredVisitFetchOptions);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh));
    v15 = objc_msgSend(v13, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 1, v14, v11, 1, 0, v12);

    -[MORoutineServiceManager _fetchRealTimeVisitsForStartDate:CompletionHandler:](self, "_fetchRealTimeVisitsForStartDate:CompletionHandler:", v15, v9);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)detectHindsightVisitsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__MORoutineServiceManager_detectHindsightVisitsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1002B0C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

id __70__MORoutineServiceManager_detectHindsightVisitsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_detectHindsightVisitsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_detectHindsightVisitsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id os_log;
  NSObject *v7;
  MOPerformanceMeasurement *v8;
  void *v9;
  MOPerformanceMeasurement *v10;
  id v11;
  _QWORD v12[4];
  MOPerformanceMeasurement *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerVisitTrainingvisitTraining", ", buf, 2u);
  }

  v8 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RoutineVisitTraining"), 0);
  -[MOPerformanceMeasurement startSession](v8, "startSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1002B1710;
  v13 = v8;
  v14 = v4;
  v10 = v8;
  v11 = v4;
  objc_msgSend(v9, "processHindsightVisitsWithHandler:", v12);

}

void __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[8];
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "code") == (id)5 || objc_msgSend(v4, "code") == (id)8))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke_cold_1();

    v12 = NSLocalizedDescriptionKey;
    v13 = CFSTR("Provider database is unavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1088, v7));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerVisitTrainingvisitTraining", ", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_not_V2(v11);

  v12 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __77__MORoutineServiceManager_fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke;
  v16[3] = &unk_1002ADA68;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

id __77__MORoutineServiceManager_fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDeviceLocationsFromStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchDeviceLocationsFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  NSObject *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  NSMutableArray *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  NSMutableArray *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v8, v9);
  LOBYTE(v18) = 1;
  v13 = objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", v12, 20, 0, 14, 1, 1, 60.0, 5.0, v18);
  v14 = objc_opt_new(NSMutableArray);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__24;
  v27 = __Block_byref_object_dispose__24;
  v28 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __78__MORoutineServiceManager__fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke;
  v19[3] = &unk_1002B32A8;
  v16 = v12;
  v20 = v16;
  v17 = v14;
  v21 = v17;
  v22 = &v23;
  objc_msgSend(v15, "enumerateStoredLocationsWithOptions:usingBlock:", v13, v19);

  v10[2](v10, v17, v24[5]);
  _Block_object_dispose(&v23, 8);

}

void __78__MORoutineServiceManager__fetchDeviceLocationsFromStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;

  v7 = a2;
  v8 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(v7, "count");
    v13 = CFSTR("Stop");
    *(_DWORD *)buf = 138413058;
    v23 = v11;
    v24 = 2048;
    if (!a4)
      v13 = CFSTR("Error");
    v25 = v12;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetchStoredLocations returned locations. dates, %@, count, %lu, error, %@, stop, %@", buf, 0x2Au);
  }

  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  if (v8 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(v8, "code") == (id)5 || objc_msgSend(v8, "code") == (id)8)
    {
      v20 = NSLocalizedDescriptionKey;
      v21 = CFSTR("Provider database is unavailable");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1088, v14));
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    else
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = v8;
      v14 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v19;
    }

  }
}

- (void)_fetchVisitsBetweenStartDate:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a4;
  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke;
  v12[3] = &unk_1002B32F8;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v11 = v7;
  objc_msgSend(v10, "fetchStoredVisitsWithOptions:handler:", v8, v12);

}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[2];
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_cold_1();

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchstoredVisits returned visits count, %lu", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 3));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111;
    v17[3] = &unk_1002B32D0;
    v11 = a1[6];
    v17[4] = a1[4];
    v17[5] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v17));
    v18[0] = v10;
    v18[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

    v15 = a1[5];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v14));
    (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

  }
}

uint64_t __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "exit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entry"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 < 300.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111_cold_1(a1, (uint64_t)v3);
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "source") != (id)3)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111_cold_2(a1, (uint64_t)v3);
    goto LABEL_8;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (void)_fetchRealTimeVisitsForStartDate:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke;
  v11[3] = &unk_1002ADFD8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "fetchStoredVisitsWithOptions:handler:", v7, v11);

}

void __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchRealTimestoredVisits returned visits count, %lu", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 1));
    v15 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

    v13 = *(_QWORD *)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v12));
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  }
}

- (void)_fetchGeoMapItemFromHandler:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  GEOMapService *mapServiceManager;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  mapServiceManager = self->_mapServiceManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke;
  v11[3] = &unk_1002B3320;
  v12 = v6;
  v10 = v6;
  -[GEOMapService resolveMapItemFromHandle:completionHandler:](mapServiceManager, "resolveMapItemFromHandle:completionHandler:", v7, v11);

}

void __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id os_log;
  NSObject *v6;
  void (*v7)(void);

  v4 = a3;
  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMapService);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

- (unint64_t)_placeInferencePlaceTypeFromMapItemPlaceType:(unint64_t)a3
{
  if (a3 > 2)
    return 4;
  else
    return qword_10029F0A8[a3];
}

- (BOOL)_shouldMarkAsPreOnboardedVisit:(id)a3
{
  id v4;
  double v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  id os_log;
  NSObject *v14;
  int maxAllowedDaysForVisitLookback;
  id v16;
  int v18;
  NSObject *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;

  v4 = a3;
  LODWORD(v5) = 14.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Visit_PreOnboardingLookBackWindow"), v5);
  self->_maxAllowedDaysForVisitLookback = (int)v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase fDefaultsManager](self->_configurationManager, "fDefaultsManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("OnboardingDate")));

  if (v8 && (v10 = objc_opt_class(NSDate, v9), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    v11 = v8;
    v12 = objc_msgSend(v4, "isBeforeDate:", v11);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      maxAllowedDaysForVisitLookback = self->_maxAllowedDaysForVisitLookback;
      v18 = 138412802;
      v19 = v11;
      v20 = 1024;
      v21 = maxAllowedDaysForVisitLookback;
      v22 = 1024;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "User onboarding date %@,_maxAllowedDaysForVisitLookback, %d,isPreOnboardedVisit, %d", (uint8_t *)&v18, 0x18u);
    }

  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v11 = objc_claimAutoreleasedReturnValue(v16);
    LOBYTE(v12) = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "User onboarding date is nil", (uint8_t *)&v18, 2u);
    }
  }

  return v12;
}

+ (id)_timeZoneFromLocation:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc((Class)CLLocation);
  objc_msgSend(v3, "latitude");
  v6 = v5;
  objc_msgSend(v3, "longitude");
  v8 = v7;

  v9 = objc_msgSend(v4, "initWithLatitude:longitude:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CLGeocoder _timeZoneAtLocation:](CLGeocoder, "_timeZoneAtLocation:", v9));

  return v10;
}

- (void)_setDynamicProperties:(id)a3 visit:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  id os_log;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _BOOL4 v89;
  NSString *v90;
  void *v91;
  void *v92;
  void *v93;
  const char *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _BOOL8 v103;
  void *v104;
  id v105;
  NSObject *v106;
  NSString *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  NSString *v115;
  unsigned int v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char *v133;
  void *v134;
  const char *aSelector;
  char *aSelectora;
  _BOOL4 v137;
  void *v138;
  uint8_t buf[4];
  char *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  const __CFString *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  id v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  id v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  void *v160;
  __int16 v161;
  id v162;
  __int16 v163;
  id v164;
  __int16 v165;
  double v166;
  __int16 v167;
  unsigned int v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  void *v172;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getPlaceName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  objc_msgSend(v12, "confidence");
  v14 = v13;

  HIDWORD(v15) = 1072588390;
  *(float *)&v15 = 0.95;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelHighConfidenceThreshold"), v15);
  v17 = v16;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[MORoutineServiceManager _setDynamicProperties:visit:].cold.2(a2, v8, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "finerGranularityMapItem"));
  v137 = v21 != 0;
  if (v21)
  {
    v22 = (void *)v21;
    v23 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
    objc_msgSend(v24, "finerGranularityMapItemConfidence");
    v26 = v25;

    if (v26 < v23)
    {
      v137 = 0;
      goto LABEL_8;
    }
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getFinerGranularityPlaceName"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "finerGranularityMapItem"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
    objc_msgSend(v20, "finerGranularityMapItemConfidence");
    v14 = v30;
    v11 = (void *)v29;
    v9 = (void *)v27;
  }

LABEL_8:
  v31 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[MORoutineServiceManager _setDynamicProperties:visit:].cold.1(a2);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v33, "setPlaceName:", v9);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getLocation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v35, "setLocation:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  v37 = objc_msgSend(v36, "userType");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v38, "setPlaceUserType:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v39, "setPlaceNameConfidence:", v14);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItemHandle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v41, "setPlaceMapItem:", v40);

  v42 = objc_msgSend(v11, "source");
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v43, "setPlaceSource:", v42);

  v44 = objc_msgSend(v11, "mapItemPlaceType");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v45, "setMapItemPlaceType:", v44);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v47, "setMapItemLocation:", v46);

  v48 = objc_msgSend(v11, "muid");
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v49, "setMapItemID:", v48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  aSelector = a2;
  if (objc_msgSend(v50, "placeType") == (id)4)
    goto LABEL_13;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  if (objc_msgSend(v51, "placeSource") == (id)1)
  {

LABEL_13:
LABEL_14:
    v52 = -[MORoutineServiceManager _placeInferencePlaceTypeFromMapItemPlaceType:](self, "_placeInferencePlaceTypeFromMapItemPlaceType:", objc_msgSend(v11, "mapItemPlaceType"));
    goto LABEL_15;
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v96 = objc_msgSend(v95, "placeSource") == (id)2 || v137;

  if ((v96 & 1) != 0)
    goto LABEL_14;
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  v52 = objc_msgSend(v97, "placeType");

LABEL_15:
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v53, "setPlaceType:", v52);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "category"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v55, "setPoiCategory:", v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "location"));
  if (!v57)
  {

    goto LABEL_21;
  }
  v58 = (void *)v57;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));

  if (!v59)
  {
LABEL_21:
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v74 = v73;
    v75 = -1.0;
    goto LABEL_22;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "location"));
  objc_msgSend(v60, "distanceFromLocation:", v62);
  v64 = v63;

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "location"));
  objc_msgSend(v66, "horizontalUncertainty");
  v68 = v67;

  if (v68 > 0.0)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "location"));
    objc_msgSend(v70, "horizontalUncertainty");
    v72 = v64 - v71;

    v64 = fmax(v72, 0.0);
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v74 = v73;
  v75 = v64;
LABEL_22:
  objc_msgSend(v73, "setDistanceFromVisitToPlace:", v75);

  v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
  if (!v76 || !v11)
    goto LABEL_34;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));

  if (!v77)
    goto LABEL_35;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v80, "setAddress:", v79);

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "address"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "geoAddressObject"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v84, "setGeoAddressObject:", v83);

  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "address"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "geoAddressData"));

  v88 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v76 = objc_claimAutoreleasedReturnValue(v88);
  v89 = os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG);
  if (v87)
  {
    if (v89)
    {
      v90 = NSStringFromSelector(aSelector);
      v133 = (char *)objc_claimAutoreleasedReturnValue(v90);
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "placeName"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v129));
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "geoAddressObject"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "shortAddress"));
      *(_DWORD *)buf = 138412802;
      v140 = v133;
      v141 = 2112;
      v142 = v125;
      v143 = 2112;
      v144 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v92));
      v93 = (void *)v144;
      v94 = "%@, using routine cached GEOAddressObject value for poi, %@, address, %@";
LABEL_42:
      _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, v94, buf, 0x20u);

    }
  }
  else if (v89)
  {
    v115 = NSStringFromSelector(aSelector);
    v133 = (char *)objc_claimAutoreleasedReturnValue(v115);
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "placeName"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v129));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "geoAddressObject"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "shortAddress"));
    *(_DWORD *)buf = 138412802;
    v140 = v133;
    v141 = 2112;
    v142 = v125;
    v143 = 2112;
    v144 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v92));
    v93 = (void *)v144;
    v94 = "%@, using reconstructed GEOAddressObject value for poi, %@, address, %@";
    goto LABEL_42;
  }
LABEL_34:

LABEL_35:
  v98 = (void *)objc_opt_class(self, v78);
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "location"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "_timeZoneFromLocation:", v100));
  objc_msgSend(v7, "setTimeZone:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entry"));
  v103 = -[MORoutineServiceManager _shouldMarkAsPreOnboardedVisit:](self, "_shouldMarkAsPreOnboardedVisit:", v102);
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v104, "setIsPreOnboardedVisit:", v103);

  v105 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v106 = objc_claimAutoreleasedReturnValue(v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    v107 = NSStringFromSelector(aSelector);
    aSelectora = (char *)objc_claimAutoreleasedReturnValue(v107);
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventIdentifier"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "loiIdentifier"));
    if (v137)
      v108 = CFSTR("YES");
    else
      v108 = CFSTR("NO");
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItemHandle"));
    v123 = objc_msgSend(v126, "length");
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventRoutine stringOfPlaceInferencePlaceType:](MOEventRoutine, "stringOfPlaceInferencePlaceType:", v52));
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventRoutine stringOfMapItemPlaceType:](MOEventRoutine, "stringOfMapItemPlaceType:", objc_msgSend(v11, "mapItemPlaceType")));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeInference"));
    v120 = objc_msgSend(v124, "userType");
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v9));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "category"));
    v118 = objc_msgSend(v11, "source");
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extendedAttributes"));
    v117 = objc_msgSend(v122, "wifiFingerprintLabelType");
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v116 = objc_msgSend(v121, "isPreOnboardedVisit");
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    objc_msgSend(v111, "distanceFromVisitToPlace");
    v113 = v112;
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
    *(_DWORD *)buf = 138416386;
    v140 = aSelectora;
    v141 = 2112;
    v142 = v134;
    v143 = 2112;
    v144 = (uint64_t)v130;
    v145 = 2112;
    v146 = v108;
    v147 = 2112;
    v148 = v109;
    v149 = 2048;
    v150 = v123;
    v151 = 2112;
    v152 = v138;
    v153 = 2112;
    v154 = v132;
    v155 = 2048;
    v156 = v120;
    v157 = 2112;
    v158 = v110;
    v159 = 2112;
    v160 = v119;
    v161 = 2048;
    v162 = v118;
    v163 = 2048;
    v164 = v117;
    v165 = 2048;
    v166 = v14;
    v167 = 1024;
    v168 = v116;
    v169 = 2048;
    v170 = v113;
    v171 = 2112;
    v172 = v114;
    _os_log_debug_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "%@, event.id, %@, loi, %@, using Finer Granularity Map Item, %@, mapItem, %@, mapItem.length, %lu, placeType, %@, mapItemPlaceType, %@, userType, %lu, name, %@, category, %@, source, %lu, wifiLabelType, %lu, confidence, %f, isPreOnboardedVisit, %d, distanceFromVisitToPlace, %f, timezone, %@", buf, 0xA8u);

  }
}

- (void)_setDynamicProperties:(id)a3 familiarityIndexResultsLOIs:(id)a4 visit:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  double v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = a3;
  if (v14)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entry"));
    v11 = -[MORoutineServiceManager _shouldMarkAsPreOnboardedVisit:](self, "_shouldMarkAsPreOnboardedVisit:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routineEvent"));
    objc_msgSend(v12, "setIsPreOnboardedVisit:", v11);

    -[MORoutineServiceManager _findMatchingFamiliarityIndexValue:forVisit:](self, "_findMatchingFamiliarityIndexValue:forVisit:", v14, v8);
  }
  else
  {
    v13 = -1.0;
  }
  objc_msgSend(v9, "setFamiliarityIndexLOI:", v13);

}

- (id)_createEventFromVisit:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exit"));
  v9 = v8;
  if (!v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v9, v10, 4, 1);

  if (!v8)
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager configurationManager](self, "configurationManager"));
  LODWORD(v14) = 1242802176;
  objc_msgSend(v13, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", v15));
  -[MOEvent setExpirationDate:](v11, "setExpirationDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  -[MOEvent setSourceCreationDate:](v11, "setSourceCreationDate:", v17);

  -[MORoutineServiceManager _setDynamicProperties:visit:](self, "_setDynamicProperties:visit:", v11, v4);
  return v11;
}

- (void)fetchAndSaveVisitsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke;
  block[3] = &unk_1002AEA58;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = a2;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, block);

}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  unsigned int v5;
  id *v6;
  id v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__24;
  v46 = __Block_byref_object_dispose__24;
  v47 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventStore"));
  v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D9788, 0);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_133;
  v41[3] = &unk_1002AEC68;
  v41[4] = &v42;
  objc_msgSend(v2, "fetchLastEventOfCategories:isHighConfidenceOnly:CompletionHandler:", v3, 1, v41);

  v4 = &v35;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__24;
  v39 = __Block_byref_object_dispose__24;
  v40 = 0;
  if (v43[5] && (v5 = objc_msgSend(*(id *)(a1 + 40), "isBeforeDate:"), v4 = v36, v5))
    v6 = (id *)(v43 + 5);
  else
    v6 = (id *)(a1 + 40);
  v7 = *v6;
  v8 = (void *)v4[5];
  v4[5] = (uint64_t)v7;

  if (objc_msgSend((id)v36[5], "isAfterDate:", *(_QWORD *)(a1 + 48)))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, &__NSDictionary0__struct);
  }
  else
  {
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__24;
    v33[4] = __Block_byref_object_dispose__24;
    v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__24;
    v31[4] = __Block_byref_object_dispose__24;
    v32 = &__NSArray0__struct;
    v13 = *(void **)(a1 + 32);
    v14 = v36[5];
    v15 = *(void **)(a1 + 48);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135;
    v25[3] = &unk_1002B3348;
    v28 = &v35;
    v26 = v15;
    v29 = v31;
    v30 = v33;
    v16 = v12;
    v27 = v16;
    objc_msgSend(v13, "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:", v14, v26, v25);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_136;
    block[3] = &unk_1002B3370;
    v21 = v33;
    v18 = *(id *)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = v18;
    v22 = v31;
    v23 = &v35;
    v24 = *(_QWORD *)(a1 + 64);
    dispatch_group_notify(v16, v17, block);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);

  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v42, 8);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_133(uint64_t a1, void *a2)
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

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "The fetch window for fetchStitchedVisits, start date, %@, end date, %@", (uint8_t *)&v16, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  if (v7)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135_cold_2();

  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135_cold_1((uint64_t *)(a1 + 56));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_136(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id os_log;
  NSObject *v23;
  NSString *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  id v37;
  id obj;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  NSMutableArray *v59;
  uint8_t v60[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];

  v37 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v37)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = v37;
    if (v2)
      (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v37, &__NSDictionary0__struct);
    goto LABEL_38;
  }
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4 && objc_msgSend(v4, "count"))
  {
    *(_QWORD *)v60 = 0;
    v61 = v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__24;
    v64 = __Block_byref_object_dispose__24;
    v65 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__24;
    v58 = __Block_byref_object_dispose__24;
    v59 = objc_opt_new(NSMutableArray);
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__24;
    v52 = __Block_byref_object_dispose__24;
    v53 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventStore"));
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_137;
    v47[3] = &unk_1002AEFF0;
    v47[4] = v60;
    objc_msgSend(v5, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v6, 1, v47);

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = *((_QWORD *)v61 + 5);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_2;
    v46[3] = &unk_1002B20B8;
    v46[4] = &v54;
    v46[5] = &v48;
    objc_msgSend(v7, "_checkAndFetchInvalidEvents:Events:handler:", v8, v9, v46);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
    if (!v10)
      goto LABEL_26;
    v39 = *(_QWORD *)v43;
    *(_QWORD *)&v11 = 138412546;
    v36 = v11;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v39)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v12);
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1)
                                                                                 + 8 * (_QWORD)v12), "entry")),
              v15 = objc_msgSend(v14, "isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)), v14, v15))
        {
          if (!v49[5]
            || (objc_msgSend(*(id *)(a1 + 32), "_visitAlreadyHaveValidEvent:Events:", v13) & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_createEventFromVisit:", v13, v36));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
            if (v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
              if (v18)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
                v21 = objc_msgSend(v19, "isOnOrAfter:", v20);

                if (v21)
                {
                  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
                  v23 = objc_claimAutoreleasedReturnValue(os_log);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    v24 = NSStringFromSelector(*(SEL *)(a1 + 72));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                    *(_DWORD *)buf = v36;
                    v67 = v25;
                    v68 = 2112;
                    v69 = v16;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@, discard event for visit with wrong start/end date, event, %@ ", buf, 0x16u);

                  }
                  goto LABEL_23;
                }
              }
              else
              {

              }
            }
            objc_msgSend(v16, "setMode:", 0);
            objc_msgSend(v16, "setIsHighConfidence:", objc_msgSend(v13, "source") == (id)3);
            objc_msgSend((id)v55[5], "addObject:", v16);
LABEL_23:

          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
      if (!v10)
      {
LABEL_26:

        v26 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = objc_msgSend((id)v55[5], "count");
          *(_DWORD *)buf = 134217984;
          v67 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "save visits as event into database, count, %lu", buf, 0xCu);
        }

        if (objc_msgSend((id)v55[5], "count"))
        {
          v29 = *(void **)(a1 + 40);
          v30 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          v31 = v55[5];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_139;
          v40[3] = &unk_1002ADA40;
          v41 = v29;
          objc_msgSend(v30, "storeEvents:CompletionHandler:", v31, v40);

        }
        else
        {
          v35 = *(_QWORD *)(a1 + 40);
          if (v35)
            (*(void (**)(uint64_t, _QWORD, void *))(v35 + 16))(v35, 0, &__NSDictionary0__struct);
        }
        _Block_object_dispose(&v48, 8);

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(v60, 8);

LABEL_37:
        v3 = 0;
        goto LABEL_38;
      }
    }
  }
  v32 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v60 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "no visits fetched for saving", v60, 2u);
  }

  v34 = *(_QWORD *)(a1 + 40);
  v3 = 0;
  if (v34)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, &__NSDictionary0__struct);
    goto LABEL_37;
  }
LABEL_38:

}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_137(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "copy");
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_139_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (BOOL)_visitAlreadyHaveValidEvent:(id)a3 Events:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(v5, "isEqualToVisitMoment:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13) & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)_checkAndFetchInvalidEvents:(id)a3 Events:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, NSMutableArray *, NSMutableArray *);
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void (**v21)(_QWORD, NSMutableArray *, NSMutableArray *);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, NSMutableArray *, NSMutableArray *))a5;
  if (v8 && objc_msgSend(v8, "count") && v9 && objc_msgSend(v9, "count"))
  {
    v21 = v10;
    v11 = objc_opt_new(NSMutableArray);
    v12 = objc_opt_new(NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager findMatchingVisitFor:inVisits:](self, "findMatchingVisitFor:inVisits:", v18, v8, v21));
          v20 = v12;
          if (!v19)
          {
            objc_msgSend(v18, "setIsInvalid:", 1);
            v20 = v11;
          }
          -[NSMutableArray addObject:](v20, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v10 = v21;
    v21[2](v21, v11, v12);

    v9 = v22;
  }
  else
  {
    v10[2](v10, 0, 0);
  }

}

- (void)rehydrateVisits:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MORoutineServiceManager_rehydrateVisits_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __51__MORoutineServiceManager_rehydrateVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateVisits:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  MORoutineServiceManager *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__24;
  v42[4] = __Block_byref_object_dispose__24;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__24;
  v40[4] = __Block_byref_object_dispose__24;
  v41 = &__NSArray0__struct;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke;
  v36[3] = &unk_1002B3398;
  v38 = v40;
  v39 = v42;
  v12 = v9;
  v37 = v12;
  -[MORoutineServiceManager _fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:", v10, v11, v36);

  v13 = objc_alloc((Class)NSDateInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v16 = objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

  dispatch_group_enter(v12);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__24;
  v34[4] = __Block_byref_object_dispose__24;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__24;
  v32[4] = __Block_byref_object_dispose__24;
  v33 = &__NSArray0__struct;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_2;
  v28[3] = &unk_1002B3398;
  v30 = v32;
  v31 = v34;
  v17 = v12;
  v29 = v17;
  -[MORoutineServiceManager _fetchFamiliarityIndexesLOIForDateInterval:CompletionHandler:](self, "_fetchFamiliarityIndexesLOIForDateInterval:CompletionHandler:", v16, v28);
  v18 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3;
  block[3] = &unk_1002B33C0;
  v24 = v7;
  v25 = v42;
  v22 = v6;
  v23 = self;
  v26 = v40;
  v27 = v32;
  v19 = v7;
  v20 = v6;
  dispatch_group_notify(v17, v18, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  MORehydrationMetrics *v4;
  void *v5;
  MORehydrationMetrics *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v3 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3_cold_1();

    v4 = [MORehydrationMetrics alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description"));
    v6 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v4, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 1, 4, 0, v5, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    v11 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v6, "submitMetricsWithError:", &v11);
    v7 = v11;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v6 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydrateStoreEvents:withVisits:familiarityIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)));
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = -[MORehydrationMetrics count](v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_rehydrateVisits, input event, %lu, rehydrated events, %lu", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_rehydrateStoreEvents:(id)a3 withVisits:(id)a4 familiarityIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  MORehydrationMetrics *v27;
  void *v28;
  id v29;
  void *v30;
  MORehydrationMetrics *v31;
  id os_log;
  id v33;
  NSObject *v34;
  id v36;
  id v37;
  NSMutableArray *v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v8 = a3;
  v9 = a4;
  v37 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v31 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v31->super.super, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager _rehydrateStoreEvents:withVisits:familiarityIndex:].cold.1(a2, &v31->super.super);
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager _rehydrateStoreEvents:withVisits:familiarityIndex:].cold.2(a2, v34);

    v31 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 1, 4, 1, 0, objc_msgSend(v8, "count"), 3, (double)(int)objc_msgSend(v8, "count"), 0.0);
    v46 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v31, "submitMetricsWithError:", &v46);
LABEL_22:
    v39 = 0;
    goto LABEL_23;
  }
  v39 = objc_opt_new(NSMutableArray);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v36 = v8;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  v12 = v37;
  v40 = v9;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v43;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v15);
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v23 = NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          *(_DWORD *)buf = 138412546;
          v48 = v24;
          v49 = 2112;
          v50 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@, event, %@", buf, 0x16u);

          v9 = v40;
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager findMatchingVisitFor:inVisits:](self, "findMatchingVisitFor:inVisits:", v16, v9));
        if (v19)
        {
          v20 = objc_msgSend(v16, "copy");
          -[MORoutineServiceManager _setDynamicProperties:familiarityIndexResultsLOIs:visit:](self, "_setDynamicProperties:familiarityIndexResultsLOIs:visit:", v20, v12, v19);
          -[MORoutineServiceManager _setDynamicProperties:visit:](self, "_setDynamicProperties:visit:", v20, v19);
          v21 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v25 = NSStringFromSelector(a2);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            *(_DWORD *)buf = 138412546;
            v48 = v26;
            v49 = 2112;
            v50 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@, found matching visit, rehydrated event, %@", buf, 0x16u);

            v12 = v37;
          }

          -[NSMutableArray addObject:](v39, "addObject:", v20);
          v9 = v40;
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v13);
  }

  v27 = [MORehydrationMetrics alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v29 = objc_msgSend(v28, "category");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v31 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v27, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v29, objc_msgSend(v30, "provider"), 1, 0, objc_msgSend(v10, "count"), 3, (double)(int)(objc_msgSend(v10, "count") - -[NSMutableArray count](v39, "count")), 0.0);

  v9 = v40;
  v41 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v31, "submitMetricsWithError:", &v41);
  v8 = v36;
LABEL_23:

  return v39;
}

- (void)removeVisitsDeletedAtSource:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002ADA40;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_removeVisitsDeletedAtSource:handler:", v2, v3);

}

uint64_t __63__MORoutineServiceManager_removeVisitsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeVisitsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  NSMutableArray *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__24;
  v17[4] = __Block_byref_object_dispose__24;
  v18 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke;
  v13[3] = &unk_1002B3410;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v16 = v17;
  v12 = v7;
  v15 = v12;
  -[MORoutineServiceManager _fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v13);

  _Block_object_dispose(v17, 8);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  __int128 v19;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2;
  block[3] = &unk_1002B33E8;
  v15 = v6;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v18 = v5;
  v13 = *(_OWORD *)(a1 + 48);
  v10 = (id)v13;
  v19 = v13;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, block);

}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  id os_log;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t v18;
  _BYTE v19[15];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (!*(_QWORD *)(a1 + 32))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "findMatchingVisitFor:inVisits:", v7, *(_QWORD *)(a1 + 56)));
          if (!v8)
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
            v10 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_2(&v18, v19, v10);

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v7);
          }

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }

  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_1(a1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "eventStore"));
  v14 = *(void **)(a1 + 64);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142;
  v16[3] = &unk_1002ADA40;
  v17 = v14;
  objc_msgSend(v13, "removeEvents:CompletionHandler:", v15, v16);

}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142_cold_2();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142_cold_1();
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (id)findMatchingVisitFor:(id)a3 inVisits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(type == %lu)"), 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));

  if (v8 && objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = (char *)objc_msgSend(v8, "count") - 1;
    do
    {
      v11 = &v9[(unint64_t)(v10 - v9) >> 1];
      if (v11 > (char *)objc_msgSend(v8, "count") - 1)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", &v9[(unint64_t)(v10 - v9) >> 1]));
      v13 = objc_msgSend(v12, "isEqualToVisitMoment:", v5);

      if (v13)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", &v9[(unint64_t)(v10 - v9) >> 1]));
        goto LABEL_11;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", &v9[(unint64_t)(v10 - v9) >> 1]));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entry"));
      v17 = objc_msgSend(v14, "isBeforeDate:", v16);

      if (v17)
        v10 = v11 - 1;
      else
        v9 = v11 + 1;
    }
    while (v9 <= v10);
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (id)_findMatchingEventFor:(id)a3 inEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = (char *)objc_msgSend(v7, "count") - 1;
    do
    {
      v10 = &v8[(unint64_t)(v9 - v8) >> 1];
      if (v10 > (char *)objc_msgSend(v7, "count") - 1)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
      v14 = objc_msgSend(v11, "isEqualToDate:", v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
      v18 = objc_msgSend(v15, "isEqualToDate:", v17);

      if (v14 && v18)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
        goto LABEL_12;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entry"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
      v22 = objc_msgSend(v19, "isBeforeDate:", v21);

      if (v22)
        v9 = v10 - 1;
      else
        v8 = v10 + 1;
    }
    while (v8 <= v9);
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (double)_findMatchingFamiliarityIndexValue:(id)a3 forVisit:(id)a4
{
  id v5;
  id v6;
  double v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  double v22;
  unsigned int v24;

  v5 = a3;
  v6 = a4;
  v7 = -1.0;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v8 = 0;
    v9 = (char *)objc_msgSend(v5, "count") - 1;
    do
    {
      v10 = &v8[(unint64_t)(v9 - v8) >> 1];
      if (v10 > (char *)objc_msgSend(v5, "count") - 1)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateInterval"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entry"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
      if ((objc_msgSend(v13, "isEqualToDate:", v14) & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "exit"));
        v16 = v5;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
        v24 = objc_msgSend(v15, "isEqualToDate:", v17);

        v5 = v16;
        if (v24)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", &v8[(unint64_t)(v9 - v8) >> 1]));
          objc_msgSend(v21, "familiarityIndex");
          v7 = v22;

          break;
        }
      }
      else
      {

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entry"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
      v20 = objc_msgSend(v18, "isBeforeDate:", v19);

      if (v20)
        v9 = v10 - 1;
      else
        v8 = v10 + 1;

    }
    while (v8 <= v9);
  }

  return v7;
}

- (void)_fetchFamiliarityIndexesLOIForDateInterval:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)RTFamiliarityIndexOptions), "initWithDateInterval:spatialGranularity:", v7, 1);

  v9 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke;
  v12[3] = &unk_1002ADFD8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "fetchFamiliarityIndexResultsWithOptions:handler:", v8, v12);

}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void (*v9)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_29);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_146(id a1, RTFamiliarityIndexResult *a2, unint64_t a3, BOOL *a4)
{
  RTFamiliarityIndexResult *v4;
  id os_log;
  NSObject *v6;

  v4 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_146_cold_1();

}

- (id)_getLoiInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v6));
  objc_msgSend(v4, "confidence");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, place, %@, confidence, %f"), v5, v7, v9));
  return v10;
}

- (id)_getVisitInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPlaceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _redactString:](self, "_redactString:", v5));
  objc_msgSend(v4, "confidence");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, confidence, %f"), v6, v8));
  return v9;
}

- (id)_redactString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (unint64_t)objc_msgSend(v4, "length");
    if (v5 >> 1 >= 5)
      v6 = 5;
    else
      v6 = v5 >> 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v6));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%lu"), v7, objc_msgSend(v4, "hash")));

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (id)fetchHomeLOI
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  id v8;
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[8];
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__24;
  v26 = __Block_byref_object_dispose__24;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __39__MORoutineServiceManager_fetchHomeLOI__block_invoke;
  v19[3] = &unk_1002ADC00;
  v21 = &v22;
  v5 = v3;
  v20 = v5;
  objc_msgSend(v4, "fetchLocationsOfInterestOfType:withHandler:", 0, v19);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Routine/MORoutineServiceManager.m", 933, "-[MORoutineServiceManager fetchHomeLOI]"));
  v18 = 0;
  v7 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v5, &v18, v6, 30.0);
  v8 = v18;
  if (!v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  if (objc_msgSend((id)v23[5], "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "objectAtIndexedSubscript:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("location")));

    v13 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "fetching homeLOI successful", buf, 2u);
    }
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager fetchHomeLOI].cold.1();
    v12 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __39__MORoutineServiceManager_fetchHomeLOI__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_calculateDistanceFromHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager homeLOI](self, "homeLOI"));
  v6 = objc_alloc((Class)RTLocation);
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v10 = v9;
  objc_msgSend(v4, "horizontalAccuracy");
  v12 = v11;

  v13 = objc_msgSend(v6, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v8, v10, v12);
  v14 = v13;
  v15 = 0;
  if (v5 && v13)
  {
    objc_msgSend(v5, "distanceFromLocation:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }

  return v15;
}

- (id)getPhotosCloseToHome:(id)a3 withDistance:(double)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id os_log;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  double v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  id v29;
  uint32_t v30;
  id v31;
  uint64_t v32;
  NSMutableArray *v33;
  id v34;
  NSObject *v35;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager homeLOI](self, "homeLOI"));

  if (v8)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (!v9)
      goto LABEL_30;
    v10 = v9;
    v11 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "type") != (id)2)
        {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
          continue;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assets"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities fetchAssetUsingID:universe:](MOContextAnnotationUtilities, "fetchAssetUsingID:universe:", v14, self->_universe));
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
            v19 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _calculateDistanceFromHome:](self, "_calculateDistanceFromHome:", v18));

            os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
            v21 = objc_claimAutoreleasedReturnValue(os_log);
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
            if (v19)
            {
              if (v22)
              {
                -[NSObject doubleValue](v19, "doubleValue");
                *(_DWORD *)buf = 138412546;
                v44 = v13;
                v45 = 2048;
                v46 = v23;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Resource,%@,distanceToHomeInMeters,%f", buf, 0x16u);
              }

              -[NSObject doubleValue](v19, "doubleValue");
              if (v24 < a4)
              {
                -[NSMutableArray addObject:](v7, "addObject:", v13);
                v25 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
                v21 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  -[NSObject doubleValue](v19, "doubleValue");
                  *(_DWORD *)buf = 138412546;
                  v44 = v13;
                  v45 = 2048;
                  v46 = v26;
                  v27 = v21;
                  v28 = "Adding photo resource,%@, since distanceToHomeInMeters,%f is cleared";
                  goto LABEL_23;
                }
LABEL_25:

LABEL_26:
                goto LABEL_27;
              }
              v31 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
              v21 = objc_claimAutoreleasedReturnValue(v31);
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                goto LABEL_25;
              -[NSObject doubleValue](v19, "doubleValue");
              *(_DWORD *)buf = 138412546;
              v44 = v13;
              v45 = 2048;
              v46 = v32;
              v27 = v21;
              v28 = "Photo resource,%@, not added since distanceToHomeInMeters,%f is out of range";
LABEL_23:
              v30 = 22;
            }
            else
            {
              if (!v22)
                goto LABEL_25;
              *(_WORD *)buf = 0;
              v27 = v21;
              v28 = "Resource,distanceToHomeInMeters is nil";
              v30 = 2;
            }
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, v30);
            goto LABEL_25;
          }
          v29 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          v19 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Photo resource,%@,location object is nil", buf, 0xCu);
          }
          goto LABEL_26;
        }
LABEL_27:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (!v10)
      {
LABEL_30:

        v33 = v7;
        v6 = v37;
        goto LABEL_34;
      }
    }
  }
  v34 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "getPhotosCloseToHome,home LOI is nil", buf, 2u);
  }

  v33 = 0;
LABEL_34:

  return v33;
}

- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MORoutineServiceManager_fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __88__MORoutineServiceManager_fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  id os_log;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  MOPerformanceMeasurement *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  MOPerformanceMeasurement *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  MOPerformanceMeasurement *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  MOPerformanceMeasurement *v39;
  MOPerformanceMeasurement *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  MORoutineServiceManager *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t *v57;
  _QWORD *v58;
  uint8_t *v59;
  uint8_t *v60;
  _QWORD v61[4];
  NSObject *v62;
  MOPerformanceMeasurement *v63;
  uint8_t *v64;
  uint8_t *v65;
  uint8_t v66[8];
  uint8_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];
  NSObject *v73;
  MOPerformanceMeasurement *v74;
  uint8_t *v75;
  uint8_t *v76;
  uint8_t v77[8];
  uint8_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD v83[4];
  NSObject *v84;
  MOPerformanceMeasurement *v85;
  _QWORD *v86;
  uint8_t *v87;
  _QWORD v88[5];
  id v89;
  uint8_t buf[8];
  uint8_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  _QWORD v96[2];

  v10 = a3;
  v48 = a4;
  v44 = a5;
  v41 = a6;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 4));
  v96[0] = v46;
  v96[1] = v45;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 2));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "filteredArrayUsingPredicate:", v43));
  v12 = dispatch_group_create();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchVisit", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("fetchVisit"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  dispatch_group_enter(v12);
  *(_QWORD *)buf = 0;
  v91 = buf;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__24;
  v94 = __Block_byref_object_dispose__24;
  v95 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__24;
  v88[4] = __Block_byref_object_dispose__24;
  v89 = &__NSArray0__struct;
  v16 = v10;
  v17 = (uint64_t)v16;
  if (objc_msgSend(v47, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getDurationOfMOEventArray"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
    v20 = objc_msgSend(v19, "isBeforeDate:", v16);

    v17 = (uint64_t)v16;
    if (v20)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));

    }
  }
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v83[3] = &unk_1002B20E0;
  v86 = v88;
  v87 = buf;
  v21 = v12;
  v84 = v21;
  v39 = v15;
  v85 = v39;
  -[MORoutineServiceManager _fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchStitchedVisitsBetweenStartDate:EndDate:CompletionHandler:", v17, v48, v83);
  v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)v77 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchRealTimeVisit", ", v77, 2u);
  }

  v24 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("fetchRealTimeVisit"), 0);
  -[MOPerformanceMeasurement startSession](v24, "startSession");
  dispatch_group_enter(v21);
  *(_QWORD *)v77 = 0;
  v78 = v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__24;
  v81 = __Block_byref_object_dispose__24;
  v82 = &__NSArray0__struct;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_174;
  v72[3] = &unk_1002B20E0;
  v75 = v77;
  v76 = buf;
  v25 = v21;
  v73 = v25;
  v40 = v24;
  v74 = v40;
  -[MORoutineServiceManager _fetchRealTimeVisitsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchRealTimeVisitsBetweenStartDate:EndDate:CompletionHandler:", v16, v48, v72);
  v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)v66 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "RoutineManagerFetchEventsfetchFamilarity", ", v66, 2u);
  }

  v28 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("fetchFamiliarity"), 0);
  -[MOPerformanceMeasurement startSession](v28, "startSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dateByAddingTimeInterval:", -2419200.0));

  v30 = (void *)v17;
  v31 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v42, v48);
  dispatch_group_enter(v25);
  *(_QWORD *)v66 = 0;
  v67 = v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__24;
  v70 = __Block_byref_object_dispose__24;
  v71 = &__NSArray0__struct;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_177;
  v61[3] = &unk_1002B20E0;
  v64 = v66;
  v65 = buf;
  v32 = v25;
  v62 = v32;
  v33 = v28;
  v63 = v33;
  -[MORoutineServiceManager _fetchFamiliarityIndexesLOIForDateInterval:CompletionHandler:](self, "_fetchFamiliarityIndexesLOIForDateInterval:CompletionHandler:", v31, v61);
  v34 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_178;
  block[3] = &unk_1002B3478;
  v57 = buf;
  v58 = v88;
  v51 = v47;
  v52 = self;
  v59 = v77;
  v60 = v66;
  v53 = v16;
  v54 = v30;
  v55 = v48;
  v56 = v41;
  v49 = v48;
  v35 = v30;
  v36 = v16;
  v37 = v41;
  v38 = v47;
  dispatch_group_notify(v32, v34, block);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(v88, 8);
  _Block_object_dispose(buf, 8);

}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchVisit", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchRealTimeVisit", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "RoutineManagerFetchEventsfetchVisit", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_178(uint64_t a1)
{
  uint64_t v2;
  id os_log;
  NSObject *v4;
  MORehydrationMetrics *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  NSMutableDictionary *v29;
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v2 = a1 + 80;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_178_cold_1();

    v5 = [MORehydrationMetrics alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "description"));
    v7 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v5, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 1, 4, 0, v6, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    v30 = 0;
    -[NSMutableArray submitMetricsWithError:](v7, "submitMetricsWithError:", &v30);
    v8 = v30;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "code") == (id)5
      || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "code") == (id)8)
    {
      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Provider database is unavailable");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1088, v9));

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    v7 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__24;
    v28 = __Block_byref_object_dispose__24;
    v29 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydrateStoreEvents:withVisits:familiarityIndex:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40)));
    if (objc_msgSend(v11, "count"))
      objc_msgSend((id)v25[5], "setObject:forKey:", v11, CFSTR("rehydratedEvents"));
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_180;
    v16[3] = &unk_1002B2BC8;
    v23 = &v24;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v15 = v11;
    v20 = v15;
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 72);
    objc_msgSend(v14, "_createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:", v7, v12, v13, v16);

    _Block_object_dispose(&v24, 8);
  }

}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_180(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKey:", v3, CFSTR("newEvents"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = objc_msgSend(*(id *)(a1 + 56), "count");
    v10 = objc_msgSend(v3, "count");
    v11 = objc_msgSend(*(id *)(a1 + 64), "count");
    v12 = 138413570;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "start date, %@, adjusted start date, %@, end date, %@, rehydrated visit events count, %lu, new visit events counts, %lu, stored visit events count, %lu", (uint8_t *)&v12, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)_createNewEventsFromVisits:(id)a3 familiarityIndex:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id os_log;
  NSObject *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager _createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:].cold.1();

  }
  v16 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v12, "count"))
  {
    v25 = v13;
    v26 = v11;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
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
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _findMatchingEventFor:inEvents:](self, "_findMatchingEventFor:inEvents:", v22, v12));
          if (!v23)
            -[NSMutableArray addObject:](v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    v13 = v25;
    v11 = v26;
  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v10);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __96__MORoutineServiceManager__createNewEventsFromVisits_familiarityIndex_withStoredEvents_handler___block_invoke;
  v27[3] = &unk_1002ADFD8;
  v28 = v13;
  v24 = v13;
  -[MORoutineServiceManager _createEventsFromVisits:familiarityIndex:handler:](self, "_createEventsFromVisits:familiarityIndex:handler:", v16, v11, v27);

}

void __96__MORoutineServiceManager__createNewEventsFromVisits_familiarityIndex_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "new visit events count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createEventsFromVisits:(id)a3 familiarityIndex:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MORoutineServiceManager *v21;
  NSMutableArray *v22;
  void *v23;
  id os_log;
  NSObject *v25;
  NSString *v26;
  void *v27;
  id v28;
  NSString *v29;
  id v30;
  void (**v31)(id, NSMutableArray *, _QWORD);
  id v33;
  id obj;
  unsigned int v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v8 = a3;
  v9 = a4;
  v31 = (void (**)(id, NSMutableArray *, _QWORD))a5;
  v10 = objc_opt_new(NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v36)
  {
    v11 = *(_QWORD *)v38;
    v33 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager _createEventFromVisit:](self, "_createEventFromVisit:", v13));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          if (v17)
          {
            v18 = (void *)v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
            v20 = v11;
            v21 = self;
            v22 = v10;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
            v35 = objc_msgSend(v19, "isOnOrAfter:", v23);

            v10 = v22;
            self = v21;
            v11 = v20;

            v9 = v33;
            if (v35)
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
              v25 = objc_claimAutoreleasedReturnValue(os_log);
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                goto LABEL_13;
              v26 = NSStringFromSelector(a2);
              v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              *(_DWORD *)buf = 138412546;
              v42 = v27;
              v43 = 2112;
              v44 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@, discard event for visit with wrong start/end date, event, %@ ", buf, 0x16u);
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        -[MORoutineServiceManager _setDynamicProperties:familiarityIndexResultsLOIs:visit:](self, "_setDynamicProperties:familiarityIndexResultsLOIs:visit:", v14, v9, v13);
        objc_msgSend(v14, "setMode:", 0);
        objc_msgSend(v14, "setIsHighConfidence:", objc_msgSend(v13, "source") == (id)3);
        -[NSMutableArray addObject:](v10, "addObject:", v14);
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
        v25 = objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        v29 = NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138412546;
        v42 = v27;
        v43 = 2112;
        v44 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@, event, %@ ", buf, 0x16u);
LABEL_16:

LABEL_13:
        v12 = (char *)v12 + 1;
      }
      while (v36 != v12);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      v36 = v30;
    }
    while (v30);
  }

  v31[2](v31, v10, 0);
}

- (RTLocation)homeLOI
{
  MORoutineServiceManager *v2;
  uint64_t v3;
  RTLocation *homeLOI;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_homeLOI)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager fetchHomeLOI](v2, "fetchHomeLOI"));
    homeLOI = v2->_homeLOI;
    v2->_homeLOI = (RTLocation *)v3;

  }
  objc_sync_exit(v2);

  return v2->_homeLOI;
}

- (void)_fetchEarliestVisitDateInRoutineWithHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__24;
  v21[4] = __Block_byref_object_dispose__24;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__24;
  v19[4] = __Block_byref_object_dispose__24;
  v20 = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D9758, 0);
  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  v10 = objc_alloc((Class)RTStoredVisitFetchOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh));
  v12 = objc_msgSend(v10, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 1, v11, v9, 0, 0, v5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager routineManager](self, "routineManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke;
  v15[3] = &unk_1002B34A0;
  v17 = v19;
  v18 = v21;
  v14 = v4;
  v16 = v14;
  objc_msgSend(v13, "fetchStoredVisitsWithOptions:handler:", v12, v15);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

void __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  NSObject *v30;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke_cold_1();
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("entry"), 1);
    v30 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v9));

    v11 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v5, "count");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entry"));
      v26 = 134218242;
      v27 = v13;
      v28 = 2112;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetch oldest visit count, %lu, with date, %@", (uint8_t *)&v26, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entry"));
    v18 = *(_QWORD *)(a1[6] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    goto LABEL_8;
  }
  v23 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v24 = *(_QWORD *)(a1[6] + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

LABEL_9:
  if (a1[4])
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      v26 = 138412290;
      v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "fetch oldest visit date, %@", (uint8_t *)&v26, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

- (void)fetchEarliestVisitDateInRoutineWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MORoutineServiceManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke;
  v7[3] = &unk_1002B0C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke_2;
  v2[3] = &unk_1002B34C8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_fetchEarliestVisitDateInRoutineWithHandler:", v2);

}

uint64_t __70__MORoutineServiceManager_fetchEarliestVisitDateInRoutineWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchConsolidatedEvents:(id)a3 withStored:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  char v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  id v58;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K = %lu")));
  v53 = v7;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category"), 1, CFSTR("placeUserType"), 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("isHighConfidence"), 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v58 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Number of hindsight home events, %lu", buf, 0xCu);
  }

  v15 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("isHighConfidence"), 0));
  v45 = (void *)v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v15));
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v58 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Number of real time home events, %lu", buf, 0xCu);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category == %lu"), 1));
  v54 = v48;
  v55 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isHighConfidence == NO")));
  v46 = (void *)v55;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider == %lu"), 4));
  v56 = v44;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 3));
  v21 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v20));

  v43 = (void *)v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v21));

  v23 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v58 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Number of real time home events that are stored, %lu", buf, 0xCu);
  }

  v50 = v10;
  if (objc_msgSend(v12, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKeyPath:", CFSTR("@max.endDate")));
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(endDate == %@)"), v26));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v27));

      v29 = 0;
      goto LABEL_13;
    }
    v28 = 0;
  }
  else
  {
    v28 = 0;
    v26 = 0;
  }
  v29 = 1;
LABEL_13:
  v30 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  v52 = v12;
  if (objc_msgSend(v16, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKeyPath:", CFSTR("@max.startDate")));
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(startDate == %@)"), v31));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v32));

      if (!v28 || !v33 || !objc_msgSend(v26, "isAfterDate:", v31))
        goto LABEL_21;

    }
  }
  else
  {
    v31 = 0;
  }
  v33 = 0;
LABEL_21:
  v49 = v16;
  v41 = (void *)v28;
  v42 = v22;
  if ((v29 & 1) != 0)
  {
    v34 = &__NSArray0__struct;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(startDate < %@)"), v26));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filteredArrayUsingPredicate:", v35));

  }
  v36 = objc_opt_new(NSMutableArray);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %lu"), CFSTR("placeUserType"), 1));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "filteredArrayUsingPredicate:", v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("isHighConfidence"), 1));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filteredArrayUsingPredicate:", v39));
  -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", v40);
  -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", v52);
  if (v33)
    -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", v33);
  if (v30)
    ((void (**)(_QWORD, NSMutableArray *, void *))v30)[2](v30, v36, v34);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (GEOMapService)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_universe, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (int)maxAllowedDaysForVisitLookback
{
  return self->_maxAllowedDaysForVisitLookback;
}

- (void)setMaxAllowedDaysForVisitLookback:(int)a3
{
  self->_maxAllowedDaysForVisitLookback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_homeLOI, 0);
}

- (void)initWithUniverse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventStore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __71__MORoutineServiceManager__detectHindsightVisitsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Database unavailable,  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchVisit failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111_cold_1(uint64_t a1, uint64_t a2)
{
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getVisitInfo:", a2));
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v7, v8, "%@, visit filtered due to visit length, visit, %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_0();
}

void __74__MORoutineServiceManager__fetchVisitsBetweenStartDate_CompletionHandler___block_invoke_111_cold_2(uint64_t a1, uint64_t a2)
{
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getVisitInfo:", a2));
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v7, v8, "%@, visit filtered for non hindsight visits, visit, %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_0();
}

void __78__MORoutineServiceManager__fetchRealTimeVisitsForStartDate_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchRealTimeVisit failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__MORoutineServiceManager__fetchGeoMapItemFromHandler_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error while call rehydrating map item from map service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setDynamicProperties:(const char *)a1 visit:.cold.1(const char *a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v3, v4, "%@, using finer granularity map item, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setDynamicProperties:(NSObject *)a3 visit:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;

  v5 = NSStringFromSelector(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "placeInference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "placeInference"));
  objc_msgSend(v10, "confidence");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "placeInference"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "finerGranularityMapItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "placeInference"));
  objc_msgSend(v16, "finerGranularityMapItemConfidence");
  v18 = 138413314;
  v19 = v6;
  v20 = 2112;
  v21 = v9;
  v22 = 2048;
  v23 = v12;
  v24 = 2112;
  v25 = v15;
  v26 = 2048;
  v27 = v17;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, choosing between regular granularity map item, %@, confidence, %f, and finer granularity map item, %@, finer granularity confidence, %f", (uint8_t *)&v18, 0x34u);

}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_13();
  v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Last visit is after the fetch window, last event, %@, end date, %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135_cold_1(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14(*a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "fetched hindsight Visits, %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_135_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchVisits failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__MORoutineServiceManager_fetchAndSaveVisitsBetweenStartDate_EndDate_handler___block_invoke_139_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving visit as event into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__MORoutineServiceManager__rehydrateVisits_handler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "visit fetching for rehydration hit error, %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydrateStoreEvents:(const char *)a1 withVisits:(NSObject *)a2 familiarityIndex:.cold.1(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v5, "%@:no input events for rehydrating", v6);

  OUTLINED_FUNCTION_5();
}

- (void)_rehydrateStoreEvents:(const char *)a1 withVisits:(NSObject *)a2 familiarityIndex:.cold.2(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v5, "%@:no visits fecthed for rehydrating", v6);

  OUTLINED_FUNCTION_5();
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14(*(_QWORD *)(a1 + 72));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "events to remove after rehydration failure, count, %lulu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_2_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, a3, (uint64_t)a3, "delete visit in database since no matching data is found in routine", a1);
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v0, v1, "delete visit event succeeded", v2);
  OUTLINED_FUNCTION_2_2();
}

void __64__MORoutineServiceManager__removeVisitsDeletedAtSource_handler___block_invoke_142_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete visit event failed, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchFamiliarityIndexResultsWithOptions failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__MORoutineServiceManager__fetchFamiliarityIndexesLOIForDateInterval_CompletionHandler___block_invoke_146_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_13();
  v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "familiarity index LOI level, %lu, %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchHomeLOI
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "fetching homeLOI error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MORoutineServiceManager__fetchVisitsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_178_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "visit fetching hit error, %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_createNewEventsFromVisits:familiarityIndex:withStoredEvents:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "No visit fetched to create new events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __71__MORoutineServiceManager__fetchEarliestVisitDateInRoutineWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch oldest visit failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
