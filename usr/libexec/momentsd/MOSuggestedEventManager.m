@implementation MOSuggestedEventManager

- (MOSuggestedEventManager)initWithUniverse:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  MOSuggestedEventManager *v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)PPEventStore);
  v7 = (objc_class *)objc_opt_class(MOEventStore, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v9));

  v11 = -[MOSuggestedEventManager initWithPortraitStore:momentStore:](self, "initWithPortraitStore:momentStore:", v5, v10);
  return v11;
}

- (MOSuggestedEventManager)initWithPortraitStore:(id)a3 momentStore:(id)a4
{
  id v8;
  id v9;
  MOSuggestedEventManager *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  MOSuggestedEventManager *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOSuggestedEventManager initWithPortraitStore:momentStore:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestedEventManager.m"), 55, CFSTR("Invalid parameter not satisfying: momentStore"));

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v27.receiver = self;
  v27.super_class = (Class)MOSuggestedEventManager;
  v10 = -[MOSuggestedEventManager init](&v27, "init");
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("MOSuggestedEventManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_portraitStore, a3);
    objc_storeStrong((id *)&v10->_momentStore, a4);
  }
  self = v10;
  v15 = self;
LABEL_10:

  return v15;
}

- (void)_fetchTripsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
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
  MOSuggestedEventManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
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

void __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke(_QWORD *a1)
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
  id v18;
  _QWORD v19[6];
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  NSMutableArray *v26;
  uint8_t v27[4];
  id v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
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
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  v26 = objc_opt_new(NSMutableArray);
  v7 = *(void **)(a1[6] + 16);
  v8 = *(_QWORD *)&buf[8];
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_72;
  v19[3] = &unk_1002AEFA8;
  v19[4] = buf;
  v19[5] = &v21;
  objc_msgSend(v7, "iterScoredEventsWithQuery:error:block:", v6, &obj, v19);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)&buf[8], v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityProactiveTravel);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend((id)v22[5], "count");
      *(_DWORD *)v27 = 134217984;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "found %lu trips", v27, 0xCu);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(buf, 8);
}

_QWORD *__81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_72(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result[5] + 8) + 40), "addObject:", a2);
  *a3 = 1;
  return result;
}

- (void)fetchSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
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
  MOSuggestedEventManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke;
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

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id *v4;
  id os_log;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[6];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  NSMutableArray *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;

  v2 = (void *)objc_opt_new(PPSuggestedEventQuery);
  objc_msgSend(v2, "setFromDate:", a1[4]);
  objc_msgSend(v2, "setToDate:", a1[5]);
  v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__8;
  v24[3] = __Block_byref_object_dispose__8;
  v25 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = objc_opt_new(NSMutableArray);
  v3 = *(void **)(a1[6] + 16);
  v4 = (id *)(v24[0] + 40);
  obj = *(id *)(v24[0] + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v15[3] = &unk_1002AEFA8;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v3, "iterScoredEventsWithQuery:error:block:", v2, &obj, v15);
  objc_storeStrong(v4, obj);
  if (*(_QWORD *)(v24[0] + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1((uint64_t)v24, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend((id)v18[5], "count");
      *(_DWORD *)buf = 134217984;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got %lu events", buf, 0xCu);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
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
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(v2, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  }
}

- (id)createEventFromSuggestedEvent:(id)a3
{
  id v3;
  uint64_t v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MOEvent *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;

  v3 = a3;
  if (objc_msgSend(v3, "category") == 12)
    v4 = 12;
  else
    v4 = 11;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 3, v4);

  v11 = (MOEvent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    -[MOEvent setSuggestedEventIdentifier:](v10, "setSuggestedEventIdentifier:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v13);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent suggestedEventIdentifier](v10, "suggestedEventIdentifier"));
      v20 = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "has eventIdentifier, %@", (uint8_t *)&v20, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", 2419200.0));
    -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v18);

    v11 = v10;
  }

  return v11;
}

- (void)saveSuggestedEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[6];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v15 = objc_msgSend(v8, "isAfterDate:", v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));

          v8 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__8;
  v29[4] = __Block_byref_object_dispose__8;
  v30 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager momentStore](self, "momentStore"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke;
  v28[3] = &unk_1002AEFF0;
  v28[4] = v29;
  objc_msgSend(v17, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v8, 11, v28);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager momentStore](self, "momentStore"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_3;
  v27[3] = &unk_1002AEFF0;
  v27[4] = v29;
  objc_msgSend(v18, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v8, 12, v27);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_5;
  v26[3] = &unk_1002AF038;
  v26[4] = self;
  v26[5] = v29;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v26));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager momentStore](self, "momentStore"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6;
  v23[3] = &unk_1002AEB58;
  v21 = v19;
  v24 = v21;
  v22 = v7;
  v25 = v22;
  objc_msgSend(v20, "storeEvents:CompletionHandler:", v21, v23);

  _Block_object_dispose(v29, 8);
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_alloc((Class)NSMutableSet);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_9));

  v5 = objc_msgSend(v4, "initWithArray:", v8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return -[MOEvent identifierFromProvider](a2, "identifierFromProvider");
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "_pas_mappedArrayWithTransform:", &__block_literal_global_82));
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_4(id a1, MOEvent *a2)
{
  return -[MOEvent identifierFromProvider](a2, "identifierFromProvider");
}

id __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createEventFromSuggestedEvent:", a2));
  v4 = v3;
  if (v3
    && (v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider")),
        LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6),
        v6,
        (v5 & 1) == 0))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    v19 = 134217984;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved suggested events, count, %lu", (uint8_t *)&v19, 0xCu);
  }

  if (v5)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6_cold_1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);

  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

- (void)fetchAndSaveSuggestedEventBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__8;
  v16[4] = __Block_byref_object_dispose__8;
  v17 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002AF060;
  v15[4] = v16;
  -[MOSuggestedEventManager _fetchTripsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchTripsBetweenStartDate:EndDate:CompletionHandler:", v8, v9, v15);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_2;
  v12[3] = &unk_1002AF0B0;
  v11 = v10;
  v12[4] = self;
  v13 = v11;
  v14 = v16;
  -[MOSuggestedEventManager fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:", v8, v9, v12);

  _Block_object_dispose(v16, 8);
}

void __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v3 = a2;
  v4 = objc_opt_new(NSMutableSet);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tripParts"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1)
                                                                                 + 8 * (_QWORD)v16), "eventIdentifiers"));
              objc_msgSend(v17, "addObjectsFromArray:", v18);

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

}

void __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

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
    v8 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_3;
    v12[3] = &unk_1002AF088;
    v12[4] = *(_QWORD *)(a1 + 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_pas_filteredArrayWithTest:", v12));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_4;
    v10[3] = &unk_1002ADA40;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "saveSuggestedEvents:handler:", v9, v10);

  }
}

uint64_t __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventIdentifier"));
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __86__MOSuggestedEventManager_fetchAndSaveSuggestedEventBetweenStartDate_EndDate_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_enrichSuggestedEventsWithEventKit:(id)a3
{
  id v4;
  EKEventStore *v5;
  EKEventStore *ekStore;
  PPCalendarInternPool *v7;
  PPCalendarInternPool *calendarInternPool;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  EKEventStore *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  if (!self->_ekStore)
  {
    v5 = (EKEventStore *)objc_msgSend(objc_alloc((Class)EKEventStore), "initWithEKOptions:", 128);
    ekStore = self->_ekStore;
    self->_ekStore = v5;

  }
  if (!self->_calendarInternPool)
  {
    v7 = objc_opt_new(PPCalendarInternPool);
    calendarInternPool = self->_calendarInternPool;
    self->_calendarInternPool = v7;

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = self->_ekStore;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestedEventIdentifier", (_QWORD)v19));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventStore eventWithIdentifier:](v15, "eventWithIdentifier:", v16));

        v18 = objc_msgSend(objc_alloc((Class)PPEvent), "initWithEKEvent:calendarInternPool:", v17, self->_calendarInternPool);
        objc_msgSend(v14, "setSuggestedEvent:", v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (id)rehydratedSuggestedEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getDurationOfMOEventArray"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  v26 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke;
  v20[3] = &unk_1002AEFF0;
  v20[4] = &v21;
  -[MOSuggestedEventManager fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v20);

  -[MOSuggestedEventManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v22[5])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke_91;
    v19[3] = &unk_1002AF0D8;
    v19[4] = &v21;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v19));
    -[MOSuggestedEventManager _enrichSuggestedEventsWithEventKit:](self, "_enrichSuggestedEventsWithEventKit:", v8);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOSuggestedEventManager rehydratedSuggestedEvents:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v8 = &__NSArray0__struct;
  }
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
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
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier", (_QWORD)v15));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

id __53__MOSuggestedEventManager_rehydratedSuggestedEvents___block_invoke_91(uint64_t a1, void *a2)
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    objc_msgSend(v7, "setIdentifierFromProvider:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedEventIdentifier"));
    objc_msgSend(v7, "setSuggestedEventIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      objc_msgSend(v7, "setSuggestedEventTitle:", v11);

    }
    objc_msgSend(v7, "setSuggestedEventCategory:", objc_msgSend(v6, "category"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __72__MOSuggestedEventManager_removeSuggestedEventsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002ADA40;
  v8 = a4;
  v6 = v8;
  -[MOSuggestedEventManager _removeSuggestedEventsDeletedAtSource:handler:](self, "_removeSuggestedEventsDeletedAtSource:handler:", a3, v7);
  -[MOSuggestedEventManager waitForQueueEmpty](self, "waitForQueueEmpty");

}

uint64_t __72__MOSuggestedEventManager_removeSuggestedEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeSuggestedEventsDeletedAtSource:(id)a3 handler:(id)a4
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__8;
  v35 = __Block_byref_object_dispose__8;
  v36 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke;
  v30[3] = &unk_1002AEFF0;
  v30[4] = &v31;
  -[MOSuggestedEventManager fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSuggestedEventBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v30);

  -[MOSuggestedEventManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v32[5])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_92;
    v29[3] = &unk_1002AF0D8;
    v29[4] = &v31;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v29));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%ld source suggested event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestedEventManager momentStore](self, "momentStore"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_93;
    v26[3] = &unk_1002AEB58;
    v16 = v11;
    v27 = v16;
    v28 = v7;
    objc_msgSend(v15, "removeEvents:CompletionHandler:", v16, v26);

  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MOSuggestedEventManager _removeSuggestedEventsDeletedAtSource:handler:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    if (v7)
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }
  _Block_object_dispose(&v31, 8);

}

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
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
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier", (_QWORD)v15));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

id __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_92(uint64_t a1, void *a2)
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

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_93(uint64_t a1, void *a2, void *a3)
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
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySuggestedEvent);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_93_cold_1(a1, (uint64_t)v5, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting %ld suggested event in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_94);
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

- (EKEventStore)ekStore
{
  return self->_ekStore;
}

- (PPCalendarInternPool)calendarInternPool
{
  return self->_calendarInternPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarInternPool, 0);
  objc_storeStrong((id *)&self->_ekStore, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_portraitStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithPortraitStore:(uint64_t)a3 momentStore:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: momentStore", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

void __81__MOSuggestedEventManager__fetchTripsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "completionHandler not called due to trip query error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "completionHandler not called due to suggested event query error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __89__MOSuggestedEventManager_fetchSuggestedEventBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "query error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__MOSuggestedEventManager_saveSuggestedEvents_handler___block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "saving suggested event into database failed  with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)rehydratedSuggestedEvents:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "nil query result from suggested events fetching, no events rehydrated.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)_removeSuggestedEventsDeletedAtSource:(uint64_t)a3 handler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "nil query result from suggested events fetching, no events removed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

void __73__MOSuggestedEventManager__removeSuggestedEventsDeletedAtSource_handler___block_invoke_93_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Deleting %ld suggested event in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end
