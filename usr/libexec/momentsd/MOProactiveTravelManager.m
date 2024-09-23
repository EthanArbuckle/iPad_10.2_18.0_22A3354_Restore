@implementation MOProactiveTravelManager

- (MOProactiveTravelManager)initWithUniverse:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MOProactiveTravelManager *v16;

  v4 = a3;
  v5 = objc_alloc_init((Class)PPEventStore);
  v7 = (objc_class *)objc_opt_class(MOEventStore, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v9));
  v12 = (objc_class *)objc_opt_class(MOConfigurationManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v14));

  v16 = -[MOProactiveTravelManager initWithPortraitStore:momentStore:configurationManager:](self, "initWithPortraitStore:momentStore:configurationManager:", v5, v10, v15);
  return v16;
}

- (MOProactiveTravelManager)initWithPortraitStore:(id)a3 momentStore:(id)a4 configurationManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  MOProactiveTravelManager *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  MOProactiveTravelManager *v18;
  id os_log;
  NSObject *v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:].cold.1();

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOProactiveTravelManager.m"), 55, CFSTR("Invalid parameter not satisfying: momentStore"));

    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  v23.receiver = self;
  v23.super_class = (Class)MOProactiveTravelManager;
  v13 = -[MOProactiveTravelManager init](&v23, "init");
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("MOProactiveTravelManager", v15);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v13->_portraitStore, a3);
    objc_storeStrong((id *)&v13->_momentStore, a4);
    objc_storeStrong((id *)&v13->_configurationManager, a5);
  }
  self = v13;
  v18 = self;
LABEL_10:

  return v18;
}

- (void)fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
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
  MOProactiveTravelManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke(_QWORD *a1)
{
  id os_log;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[6];
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  NSMutableArray *v27;
  uint8_t v28[4];
  id v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    v5 = a1[5];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "fetching trips between %@ and %@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new(PPTripEventQuery);
  objc_msgSend(v6, "setFromDate:", a1[4]);
  objc_msgSend(v6, "setToDate:", a1[5]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__29;
  v32 = __Block_byref_object_dispose__29;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__29;
  v26 = __Block_byref_object_dispose__29;
  v27 = objc_opt_new(NSMutableArray);
  v7 = *(void **)(a1[6] + 16);
  v8 = *(_QWORD *)&buf[8];
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_71;
  v20[3] = &unk_1002AEFA8;
  v20[4] = buf;
  v20[5] = &v22;
  objc_msgSend(v7, "iterScoredEventsWithQuery:error:block:", v6, &obj, v20);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)&buf[8], v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend((id)v23[5], "removeAllObjects");
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend((id)v23[5], "count");
      *(_DWORD *)v28 = 134217984;
      v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "found %lu trips", v28, 0xCu);
    }

  }
  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
}

_QWORD *__81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_71(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result[5] + 8) + 40), "addObject:", a2);
  *a3 = 1;
  return result;
}

- (id)createEventFromTrip:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MOEvent *v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  id os_log;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 3, 8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager _providerIdOfTrip:](self, "_providerIdOfTrip:", v4));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v16);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  v18 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent identifierFromProvider](v10, "identifierFromProvider"));
    v21 = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "has identifierFromProvider, %@", (uint8_t *)&v21, 0xCu);

  }
  return v10;
}

- (id)_providerIdOfTrip:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  const char *CStringPtr;
  id v7;
  id v8;
  const __CFData *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tripParts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_37));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_componentsJoinedByString:", CFSTR("|")));

  CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v7 = -[__CFString length](v5, "length");
  if (CStringPtr)
  {
    v8 = v7;
  }
  else
  {
    v9 = objc_retainAutorelease(CFStringCreateExternalRepresentation(kCFAllocatorMalloc, v5, 0x8000100u, 0));
    CStringPtr = (const char *)-[__CFData bytes](v9, "bytes");
    v8 = -[__CFData length](v9, "length");

  }
  v14[0] = _PASMurmur3_x86_128(CStringPtr, v8, 1765656435);
  v14[1] = v10;
  v11 = _PASBytesToHex(v14, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

id __46__MOProactiveTravelManager__providerIdOfTrip___block_invoke(id a1, PPTripPart *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PPTripPart eventIdentifiers](a2, "eventIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_pas_componentsJoinedByString:", CFSTR(":")));

  return v3;
}

- (void)saveTrips:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(id, _QWORD, void *);
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v15 = objc_msgSend(v8, "isAfterDate:", v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));

          v8 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v10);
  }

  v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = __Block_byref_object_copy__29;
  v39[3] = __Block_byref_object_dispose__29;
  v40 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__29;
  v36[4] = __Block_byref_object_dispose__29;
  v37 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager momentStore](self, "momentStore"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke;
  v35[3] = &unk_1002AEB08;
  v35[4] = &v38;
  v35[5] = v36;
  objc_msgSend(v17, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v8, 8, v35);

  if (*(_QWORD *)(v39[0] + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOProactiveTravelManager saveTrips:handler:].cold.2((uint64_t)v39, v19, v20, v21, v22, v23, v24, v25);

    v26 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MOProactiveTravelManager saveTrips:handler:].cold.1();

    if (v7)
      v7[2](v7, *(_QWORD *)(v39[0] + 40), &__NSDictionary0__struct);
  }
  else
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_88;
    v34[3] = &unk_1002B4130;
    v34[4] = self;
    v34[5] = v36;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v34));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager momentStore](self, "momentStore"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_90;
    v31[3] = &unk_1002AEB58;
    v30 = v28;
    v32 = v30;
    v33 = v7;
    objc_msgSend(v29, "storeEvents:CompletionHandler:", v30, v31);

  }
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  v8 = objc_alloc((Class)NSSet);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_86));

  v9 = objc_msgSend(v8, "initWithArray:", v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

id __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return -[MOEvent identifierFromProvider](a2, "identifierFromProvider");
}

id __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_providerIdOfTrip:", v3));
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createEventFromTrip:", v3));

  return v6;
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  id v19;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_90_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v18 = 134217984;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved trip events, %lu", (uint8_t *)&v18, 0xCu);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

- (void)fetchAndSaveTripsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOProactiveTravelManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002AEB80;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOProactiveTravelManager fetchTripsBetweenStartDate:EndDate:CompletionHandler:](v9, "fetchTripsBetweenStartDate:EndDate:CompletionHandler:", a3, a4, v8);

}

void __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v6, 0);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Saving trip contents.", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke_92;
    v11[3] = &unk_1002ADA40;
    v10 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v10, "saveTrips:handler:", v5, v11);

  }
}

uint64_t __78__MOProactiveTravelManager_fetchAndSaveTripsBetweenStartDate_EndDate_handler___block_invoke_92(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)rehydratedTripEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  _QWORD v12[5];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getDurationOfMOEventArray"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  v19 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke;
  v13[3] = &unk_1002ADC00;
  v13[4] = self;
  v13[5] = &v14;
  -[MOProactiveTravelManager fetchTripsBetweenStartDate:EndDate:CompletionHandler:](self, "fetchTripsBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v13);

  -[MOProactiveTravelManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v15[5])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke_94;
    v12[3] = &unk_1002AF0D8;
    v12[4] = &v14;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v12));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOProactiveTravelManager rehydratedTripEvents:].cold.1();

    v8 = &__NSArray0__struct;
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_providerIdOfTrip:", v12, (_QWORD)v15));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

id __49__MOProactiveTravelManager_rehydratedTripEvents___block_invoke_94(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    v7 = objc_msgSend(v3, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      objc_msgSend(v7, "setTripTitle:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tripParts"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tripParts"));
      objc_msgSend(v7, "setTripParts:", v11);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __68__MOProactiveTravelManager_removeTripEventsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002ADA40;
  v8 = a4;
  v6 = v8;
  -[MOProactiveTravelManager _removeTripEventsDeletedAtSource:handler:](self, "_removeTripEventsDeletedAtSource:handler:", a3, v7);
  -[MOProactiveTravelManager waitForQueueEmpty](self, "waitForQueueEmpty");

}

uint64_t __68__MOProactiveTravelManager_removeTripEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeTripEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  const __CFString *v32;
  _UNKNOWN **v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__29;
  v28 = __Block_byref_object_dispose__29;
  v29 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke;
  v23[3] = &unk_1002ADC00;
  v23[4] = self;
  v23[5] = &v24;
  -[MOProactiveTravelManager fetchTripsBetweenStartDate:EndDate:CompletionHandler:](self, "fetchTripsBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v23);

  -[MOProactiveTravelManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v25[5])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_97;
    v22[3] = &unk_1002AF0D8;
    v22[4] = &v24;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v22));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%ld previously saved trip event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOProactiveTravelManager momentStore](self, "momentStore"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_98;
    v19[3] = &unk_1002AEB58;
    v16 = v11;
    v20 = v16;
    v21 = v7;
    objc_msgSend(v15, "removeEvents:CompletionHandler:", v16, v19);

    goto LABEL_9;
  }
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[MOProactiveTravelManager _removeTripEventsDeletedAtSource:handler:].cold.1();

  if (v7)
  {
    v32 = CFSTR("resultNumberOfEvents");
    v33 = &off_1002DA7A8;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v16);
LABEL_9:

  }
  _Block_object_dispose(&v24, 8);

}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_providerIdOfTrip:", v12, (_QWORD)v15));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

id __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = 0;
  else
    v7 = v3;

  return v7;
}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_98_cold_1(a1, (uint64_t)v5, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting %ld travel event(s) in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_99);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PPEventStore)portraitStore
{
  return self->_portraitStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_portraitStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __81__MOProactiveTravelManager_fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "trip query hit error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveTrips:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "No trips will be saved this round", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)saveTrips:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Fetching previous saved trips for deduplication failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __46__MOProactiveTravelManager_saveTrips_handler___block_invoke_2_90_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "saving trip event into database failed with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)rehydratedTripEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "nil query result from trips fetching, no events rehydrated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_removeTripEventsDeletedAtSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "nil query result from trips fetching, no events removed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __69__MOProactiveTravelManager__removeTripEventsDeletedAtSource_handler___block_invoke_98_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = 134218242;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Deleting %ld travel event(s) in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end
