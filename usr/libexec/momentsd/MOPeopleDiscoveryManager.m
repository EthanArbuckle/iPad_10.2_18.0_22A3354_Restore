@implementation MOPeopleDiscoveryManager

- (MOPeopleDiscoveryManager)initWithUniverse:(id)a3
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
  MOPeopleDiscoveryManager *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  MOPeopleDiscoveryManager *v22;
  id os_log;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  objc_super v29;

  v6 = a3;
  v8 = (objc_class *)objc_opt_class(MOConfigurationManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  if (!v11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPeopleDiscoveryManager.m"), 57, CFSTR("Invalid parameter not satisfying: configurationManager"));
    goto LABEL_12;
  }
  v13 = (objc_class *)objc_opt_class(MOEventStore, v12);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v15));

  if (!v16)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.2();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPeopleDiscoveryManager.m"), 63, CFSTR("Invalid parameter not satisfying: eventStore"));

LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  v29.receiver = self;
  v29.super_class = (Class)MOPeopleDiscoveryManager;
  v17 = -[MOPeopleDiscoveryManager init](&v29, "init");
  if (v17)
  {
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create("MOPeopleDiscoveryManager", v19);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v17->_eventStore, v16);
    objc_storeStrong((id *)&v17->_configurationManager, v11);
    objc_storeStrong((id *)&v17->_universe, a3);
  }
  self = v17;
  v22 = self;
LABEL_13:

  return v22;
}

- (id)routineManager
{
  MORoutineServiceManager *routineServiceManager;
  MODaemonUniverse *universe;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MORoutineServiceManager *v8;
  MORoutineServiceManager *v9;

  routineServiceManager = self->_routineServiceManager;
  if (!routineServiceManager)
  {
    universe = self->_universe;
    v5 = (objc_class *)objc_opt_class(MORoutineServiceManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MORoutineServiceManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](universe, "getService:", v7));
    v9 = self->_routineServiceManager;
    self->_routineServiceManager = v8;

    routineServiceManager = self->_routineServiceManager;
  }
  return -[MORoutineServiceManager routineManager](routineServiceManager, "routineManager");
}

- (void)fetchAndSaveProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOPeopleDiscoveryManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002AEB80;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOPeopleDiscoveryManager _fetchProxBetweenStartDate:EndDate:handler:](v9, "_fetchProxBetweenStartDate:EndDate:handler:", a3, a4, v8);

}

void __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  id os_log;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v18 = objc_msgSend(v5, "count");
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "saving %lu proximity events", buf, 0xCu);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke_71;
      v15[3] = &unk_1002ADA40;
      v13 = *(void **)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v13, "_saveEvents:handler:", v5, v15);

    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no proximity event are fetched", buf, 2u);
      }

      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        v8 = *(void (**)(void))(v14 + 16);
        goto LABEL_4;
      }
    }
  }

}

uint64_t __77__MOPeopleDiscoveryManager_fetchAndSaveProxBetweenStartDate_EndDate_handler___block_invoke_71(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchAndSavePeopleDensityEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOPeopleDiscoveryManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002AEB80;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOPeopleDiscoveryManager _fetchPeopleDensityBetweenStartDate:EndDate:handler:](v9, "_fetchPeopleDensityBetweenStartDate:EndDate:handler:", a3, a4, v8);

}

void __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  id os_log;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v18 = objc_msgSend(v5, "count");
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "saving %lu people density events", buf, 0xCu);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke_74;
      v15[3] = &unk_1002ADA40;
      v13 = *(void **)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v13, "_savePeopleDensityEvents:handler:", v5, v15);

    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no people density events are fetched", buf, 2u);
      }

      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        v8 = *(void (**)(void))(v14 + 16);
        goto LABEL_4;
      }
    }
  }

}

uint64_t __92__MOPeopleDiscoveryManager_fetchAndSavePeopleDensityEventsBetweenStartDate_EndDate_handler___block_invoke_74(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_fetchProxBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOPeopleDiscoveryManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002AEC40;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v14, v13, v15);

}

void __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void (*v9)(void);
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_5:
    v9();
    goto LABEL_21;
  }
  v10 = objc_msgSend(v5, "count");
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v13)
    {
      v28 = *(void **)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "proximity event fetch result is nil, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v13)
  {
    v14 = objc_msgSend(v5, "count");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetch %lu proximity events, start date, %@, end date, %@", buf, 0x20u);
  }

  v17 = objc_opt_new(NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v5;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "proximity event: %@", buf, 0xCu);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_createEventFromProx:", v23));
          -[NSMutableArray addObject:](v17, "addObject:", v27);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = 0;
  v5 = v30;
LABEL_21:

}

- (void)_fetchPeopleDensityBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOPeopleDiscoveryManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002AEC40;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v14, v13, v15);

}

void __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void (*v9)(void);
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_5:
    v9();
    goto LABEL_21;
  }
  v10 = objc_msgSend(v5, "count");
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v13)
    {
      v28 = *(void **)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "people density fetch result is empty, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v13)
  {
    v14 = objc_msgSend(v5, "count");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetch %lu people density events, start date, %@, end date, %@", buf, 0x20u);
  }

  v17 = objc_opt_new(NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v5;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "people density event: %@", buf, 0xCu);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_createEventFromPeopleDensityEvent:", v23));
          -[NSMutableArray addObject:](v17, "addObject:", v27);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = 0;
  v5 = v30;
LABEL_21:

}

- (id)_createEventFromProx:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MOEvent *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  if (v8)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v12 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v10, v11, 6, 15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  if (v13)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager configurationManager](self, "configurationManager"));
  LODWORD(v17) = 1242802176;
  objc_msgSend(v16, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", v18));
  -[MOEvent setExpirationDate:](v12, "setExpirationDate:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  if (v20)
  {
    -[MOEvent setSourceCreationDate:](v12, "setSourceCreationDate:", v20);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[MOEvent setSourceCreationDate:](v12, "setSourceCreationDate:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));

  if (!v22)
    -[MOEvent setIsGComplete:](v12, "setIsGComplete:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));
  -[MOEvent setIdentifierFromProvider:](v12, "setIdentifierFromProvider:", v24);

  return v12;
}

- (id)_createEventFromPeopleDensityEvent:(id)a3
{
  id v3;
  MOEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = [MOEvent alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  if (v7)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v11 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v4, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v5, v6, v9, v10, 6, 23);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  if (v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEvent setExpirationDate:](v11, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  if (v16)
  {
    -[MOEvent setSourceCreationDate:](v11, "setSourceCreationDate:", v16);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[MOEvent setSourceCreationDate:](v11, "setSourceCreationDate:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
  -[MOEvent setIdentifierFromProvider:](v11, "setIdentifierFromProvider:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  if (!v20)
    -[MOEvent setIsGComplete:](v11, "setIsGComplete:", 0);

  return v11;
}

- (id)_updateMOEventWithEndDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  MOEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = [MOEvent alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationDate"));
  v11 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v7, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v8, v9, v5, v10, objc_msgSend(v6, "provider"), objc_msgSend(v6, "category"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expirationDate"));
  -[MOEvent setExpirationDate:](v11, "setExpirationDate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceCreationDate"));
  -[MOEvent setSourceCreationDate:](v11, "setSourceCreationDate:", v13);

  -[MOEvent setIsGComplete:](v11, "setIsGComplete:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));

  -[MOEvent setIdentifierFromProvider:](v11, "setIdentifierFromProvider:", v14);
  return v11;
}

- (void)_saveEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MOEventStore *eventStore;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id os_log;
  NSObject *v19;
  id v20;
  MOEventStore *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  eventStore = self->_eventStore;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke;
  v30[3] = &unk_1002AEC68;
  v30[4] = &v31;
  -[MOEventStore fetchLastEventOfCategory:CompletionHandler:](eventStore, "fetchLastEventOfCategory:CompletionHandler:", 15, v30);
  v23 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
        if (!v32[5]
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1)
                                                                                 + 8 * (_QWORD)v13), "startDate")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32[5], "startDate")),
              v17 = objc_msgSend(v15, "isAfterDate:", v16),
              v16,
              v15,
              v17))
        {
          objc_msgSend(v9, "addObject:", v14);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v11);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "trying to save %lu proximity events", buf, 0xCu);
  }

  v21 = self->_eventStore;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_82;
  v24[3] = &unk_1002ADA40;
  v22 = v23;
  v25 = v22;
  -[MOEventStore storeEvents:CompletionHandler:](v21, "storeEvents:CompletionHandler:", v9, v24);

  _Block_object_dispose(&v31, 8);
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_82(uint64_t a1, void *a2, void *a3)
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_82_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)_savePeopleDensityEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MOEventStore *eventStore;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id os_log;
  NSObject *v19;
  id v20;
  MOEventStore *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  eventStore = self->_eventStore;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke;
  v30[3] = &unk_1002AEC68;
  v30[4] = &v31;
  -[MOEventStore fetchLastEventOfCategory:CompletionHandler:](eventStore, "fetchLastEventOfCategory:CompletionHandler:", 23, v30);
  v23 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
        if (!v32[5]
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1)
                                                                                 + 8 * (_QWORD)v13), "startDate")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32[5], "startDate")),
              v17 = objc_msgSend(v15, "isAfterDate:", v16),
              v16,
              v15,
              v17))
        {
          objc_msgSend(v9, "addObject:", v14);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v11);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "trying to save %lu people density events", buf, 0xCu);
  }

  v21 = self->_eventStore;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_83;
  v24[3] = &unk_1002ADA40;
  v22 = v23;
  v25 = v22;
  -[MOEventStore storeEvents:CompletionHandler:](v21, "storeEvents:CompletionHandler:", v9, v24);

  _Block_object_dispose(&v31, 8);
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_83(uint64_t a1, void *a2, void *a3)
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_83_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)rehydrateProx:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOPeopleDiscoveryManager_rehydrateProx_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __50__MOPeopleDiscoveryManager_rehydrateProx_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateProx:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateProx:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke;
  v15[3] = &unk_1002AEC40;
  v15[4] = self;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v9, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v10, v11, v15);

}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2;
  v11[3] = &unk_1002AEC90;
  v12 = v6;
  v13 = a1[5];
  v17 = a1[7];
  v8 = a1[4];
  v14 = v5;
  v15 = v8;
  v16 = a1[6];
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id os_log;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 32);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "startDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "endDate"));
      v10 = 134218498;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetch %lu proximity event, start date, %@, end date, %@", (uint8_t *)&v10, 0x20u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_rehydrateStoredEvents:fromProxEvents:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48)));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

- (id)_rehydrateStoredEvents:(id)a3 fromProxEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  id os_log;
  id v33;
  NSObject *v34;
  MORehydrationMetrics *v35;
  void *v36;
  id v37;
  void *v38;
  NSMutableArray *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  MORehydrationMetrics *v44;
  void *v45;
  id v46;
  void *v47;
  MORehydrationMetrics *v48;
  id v50;
  id v51;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "No storedEvents for rehydrating prox event", buf, 2u);
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "prox event fetch result is nil for rehydrate stored events", buf, 2u);
    }

    v35 = [MORehydrationMetrics alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v37 = objc_msgSend(v36, "category");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v35, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v37, objc_msgSend(v38, "provider"), 1, 0, objc_msgSend(v5, "count"), 3, (double)(int)objc_msgSend(v5, "count"), 0.0);

    v62 = 0;
    -[NSMutableDictionary submitMetricsWithError:](v7, "submitMetricsWithError:", &v62);
LABEL_31:
    v39 = 0;
    goto LABEL_36;
  }
  v7 = objc_opt_new(NSMutableDictionary);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventID", v50));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v10);
  }

  v16 = objc_opt_new(NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v51 = v5;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifierFromProvider", v50));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v24));

        if (v25)
        {
          if ((objc_msgSend(v23, "isGComplete") & 1) != 0
            || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate")), v26, !v26))
          {
            v28 = objc_msgSend(v23, "copy");
          }
          else
          {
            v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
            v28 = (id)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _updateMOEventWithEndDate:endDate:](self, "_updateMOEventWithEndDate:endDate:", v23, v27));

            v20 = (void *)v27;
          }

          objc_msgSend(v28, "setGaPR:", objc_msgSend(v25, "relationship"));
          objc_msgSend(v25, "socialScore");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v28, "setPCount:", v29);

          v30 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "_rehydrateProx, rehydrated event, %@", buf, 0xCu);
          }

          -[NSMutableArray addObject:](v16, "addObject:", v28);
          v20 = v28;
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  v40 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = -[NSMutableArray count](v16, "count");
    v43 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218240;
    v64 = v42;
    v65 = 2048;
    v66 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "rehydrated prox events count, %lu, stored prox event count, %lu", buf, 0x16u);
  }

  v44 = [MORehydrationMetrics alloc];
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
  v46 = objc_msgSend(v45, "category");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
  v48 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v44, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v46, objc_msgSend(v47, "provider"), 1, 0, objc_msgSend(v17, "count"), 3, (double)(int)(objc_msgSend(v17, "count") - -[NSMutableArray count](v16, "count")), 0.0);

  v53 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v48, "submitMetricsWithError:", &v53);
  v39 = v16;

  v6 = v50;
  v5 = v51;
LABEL_36:

  return v39;
}

- (void)rehydratePeopleDensityEvents:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOPeopleDiscoveryManager_rehydratePeopleDensityEvents_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __65__MOPeopleDiscoveryManager_rehydratePeopleDensityEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydratePeopleDensityEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydratePeopleDensityEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MOPeopleDiscoveryManager *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke;
  v15[3] = &unk_1002AECB8;
  v16 = v8;
  v17 = self;
  v18 = v6;
  v19 = v7;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v9, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v10, v11, v15);

}

void __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void (*v9)(void);
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_5:
    v9();
    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "count");
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v13)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "endDate"));
      v20 = 138412802;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "People density event fetch result is nil, start date, %@, end date, %@, error, %@", (uint8_t *)&v20, 0x20u);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  if (v13)
  {
    v14 = objc_msgSend(v5, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "endDate"));
    v20 = 134218498;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetch %lu people density events, start date, %@, end date, %@", (uint8_t *)&v20, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydrateStoredEvents:fromPeopleDensityEvents:", *(_QWORD *)(a1 + 48), v5));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_10:
}

- (id)_rehydrateStoredEvents:(id)a3 fromPeopleDensityEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  MORehydrationMetrics *v37;
  void *v38;
  id v39;
  void *v40;
  MORehydrationMetrics *v41;
  id os_log;
  id v43;
  NSObject *v44;
  MORehydrationMetrics *v45;
  void *v46;
  id v47;
  void *v48;
  id v50;
  id v51;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "No storedEvents for rehydrating density events event", buf, 2u);
    }
    goto LABEL_35;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v43 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "density events fetch result is nil for rehydrate stored events", buf, 2u);
    }

    v45 = [MORehydrationMetrics alloc];
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v47 = objc_msgSend(v46, "category");
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v45, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v47, objc_msgSend(v48, "provider"), 1, 0, objc_msgSend(v5, "count"), 3, (double)(int)objc_msgSend(v5, "count"), 0.0);

    v62 = 0;
    -[NSMutableDictionary submitMetricsWithError:](v7, "submitMetricsWithError:", &v62);
LABEL_35:
    v17 = 0;
    goto LABEL_36;
  }
  v7 = objc_opt_new(NSMutableDictionary);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid", v50));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
          -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v13, v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v10);
  }

  v17 = objc_opt_new(NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v51 = v5;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifierFromProvider", v50));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v24));

        if (v25)
        {
          if ((objc_msgSend(v23, "isGComplete") & 1) != 0
            || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate")), v26, !v26))
          {
            v28 = objc_msgSend(v23, "copy");
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
            v28 = (id)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _updateMOEventWithEndDate:endDate:](self, "_updateMOEventWithEndDate:endDate:", v23, v27));

          }
          objc_msgSend(v25, "densityScore");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v28, "setDensityScore:", v29);

          objc_msgSend(v25, "scanDuration");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v28, "setDensityScanDuration:", v30);

          v31 = _mo_log_facility_get_os_log(&MOLogFacilityRoutine);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "_rehydratePeopleDensityEvents, rehydrated event, %@", buf, 0xCu);
          }

          -[NSMutableArray addObject:](v17, "addObject:", v28);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v20);
  }

  v33 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(v18, "count");
    v36 = -[NSMutableArray count](v17, "count");
    *(_DWORD *)buf = 134218240;
    v64 = v35;
    v65 = 2048;
    v66 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "stored density event count, %lu, rehydrated density event count, %lu", buf, 0x16u);
  }

  v37 = [MORehydrationMetrics alloc];
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
  v39 = objc_msgSend(v38, "category");
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
  v41 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v37, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v39, objc_msgSend(v40, "provider"), 1, 0, objc_msgSend(v18, "count"), 3, (double)(int)(objc_msgSend(v18, "count") - -[NSMutableArray count](v17, "count")), 0.0);

  v53 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v41, "submitMetricsWithError:", &v53);

  v6 = v50;
  v5 = v51;
LABEL_36:

  return v17;
}

- (void)removeProxDeletedAtSource:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002ADA40;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_removeProxDeletedAtSource:handler:", v2, v3);

}

uint64_t __62__MOPeopleDiscoveryManager_removeProxDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002ADA40;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_removePeopleDensityEventsDeletedAtSource:handler:", v2, v3);

}

uint64_t __77__MOPeopleDiscoveryManager_removePeopleDensityEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeProxDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke;
  v15[3] = &unk_1002AEC40;
  v15[4] = self;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v9, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v10, v11, v15);

}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_2;
  v12[3] = &unk_1002AEC90;
  v13 = v6;
  v14 = a1[5];
  v18 = a1[7];
  v15 = v5;
  v8 = a1[6];
  v9 = a1[4];
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  if (*(_QWORD *)(a1 + 32))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v3 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
          -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v10, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }

    v13 = objc_opt_new(NSMutableArray);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = *(id *)(a1 + 56);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifierFromProvider"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v20));

          if (!v21)
            -[NSMutableArray addObject:](v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v16);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "eventStore"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88;
    v23[3] = &unk_1002ADA40;
    v24 = *(id *)(a1 + 72);
    objc_msgSend(v22, "removeEvents:CompletionHandler:", v13, v23);

  }
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88_cold_2();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88_cold_1();
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_removePeopleDensityEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOPeopleDiscoveryManager *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke;
  v15[3] = &unk_1002AECB8;
  v16 = v8;
  v17 = v6;
  v18 = self;
  v19 = v7;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v9, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v10, v11, v15);

}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1();

    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v9 = objc_opt_new(NSMutableDictionary);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v29 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
            -[NSMutableDictionary setValue:forKey:](v9, "setValue:forKey:", v15, v18);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v12);
    }

    v19 = objc_opt_new(NSMutableArray);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = a1[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifierFromProvider"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v26));

          if (!v27)
            -[NSMutableArray addObject:](v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "eventStore"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89;
    v30[3] = &unk_1002ADA40;
    v31 = a1[7];
    objc_msgSend(v28, "removeEvents:CompletionHandler:", v19, v30);

    v6 = 0;
    v5 = v29;
  }

}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89_cold_2();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89_cold_1();
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __93__MOPeopleDiscoveryManager_fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __93__MOPeopleDiscoveryManager_fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchProxEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchProxEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 15));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 6));
  v29[0] = v14;
  v29[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v24[3] = &unk_1002AED08;
  v24[4] = self;
  v25 = v10;
  v27 = v18;
  v28 = v12;
  v26 = v11;
  v20 = v18;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  objc_msgSend(v19, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v23, v22, v24);

}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
  block[3] = &unk_1002AECE0;
  v11 = v6;
  v12 = a1[5];
  v13 = a1[6];
  v17 = a1[8];
  v14 = a1[7];
  v15 = v5;
  v16 = a1[4];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  MORehydrationMetrics *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  MORehydrationMetrics *v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v2 = (uint64_t *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2_cold_1(a1, v2, v6);

    if (objc_msgSend((id)*v2, "code") == (id)5)
    {
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("Provider database is unavailable");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1152, v7));

      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    v22 = [MORehydrationMetrics alloc];
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
    v12 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v22, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 15, 6, 0, v23, objc_msgSend(*(id *)(a1 + 56), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 56), "count"), 0.0);

    v24 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v12, "submitMetricsWithError:", &v24);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(*(id *)(a1 + 64), "count");
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetch %lu proximity event, start date, %@, end date, %@", buf, 0x20u);
    }

    v12 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "_rehydrateStoredEvents:fromProxEvents:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "_createNewEventsWithStoredEvents:proxEvents:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)));
    v14 = objc_opt_new(NSMutableDictionary);
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = -[MORehydrationMetrics count](v12, "count");
      v20 = objc_msgSend(v13, "count");
      v21 = objc_msgSend(*(id *)(a1 + 56), "count");
      *(_DWORD *)buf = 138413314;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      v29 = 2048;
      v30 = v19;
      v31 = 2048;
      v32 = v20;
      v33 = 2048;
      v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated prox events count, %lu, new prox events counts, %lu, stored prox events count, %lu", buf, 0x34u);
    }

    if (v13)
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, CFSTR("newEvents"));
    if (v12)
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, CFSTR("rehydratedEvents"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

- (id)_createNewEventsWithStoredEvents:(id)a3 proxEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id os_log;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  NSMutableArray *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v46 = objc_opt_new(NSMutableArray);
      v7 = objc_opt_new(NSMutableDictionary);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v53 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider"));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider"));
              -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v13, v15);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v10);
      }
      v45 = v5;

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v44 = v6;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v49 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventID", v44));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v23));

            if (!v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));

              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _createEventFromProx:](self, "_createEventFromProx:", v21));
                objc_msgSend(v26, "setGaPR:", objc_msgSend(v21, "relationship"));
                objc_msgSend(v21, "socialScore");
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                objc_msgSend(v26, "setPCount:", v27);

                if (v26)
                  -[NSMutableArray addObject:](v46, "addObject:", v26);

              }
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
        }
        while (v18);
      }

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      v29 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = -[NSMutableArray count](v46, "count");
        v31 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134218240;
        v61 = v30;
        v62 = 2048;
        v63 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "new prox events count, %lu, stored prox event count, %lu", buf, 0x16u);
      }

      v6 = v44;
      v5 = v45;
    }
    else
    {
      v33 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "No storedEvents for checking before create new prox events", buf, 2u);
      }

      v46 = objc_opt_new(NSMutableArray);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v7 = (NSMutableDictionary *)v6;
      v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(_QWORD *)v57 != v37)
              objc_enumerationMutation(v7);
            v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _createEventFromProx:](self, "_createEventFromProx:", v39));
              objc_msgSend(v41, "setGaPR:", objc_msgSend(v39, "relationship"));
              objc_msgSend(v39, "socialScore");
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              objc_msgSend(v41, "setPCount:", v42);

              if (v41)
                -[NSMutableArray addObject:](v46, "addObject:", v41);

            }
          }
          v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v36);
      }
    }
  }
  else
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "prox event fetch result is nil for creating new events", buf, 2u);
    }
    v46 = 0;
  }

  return v46;
}

- (void)fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __102__MOPeopleDiscoveryManager_fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __102__MOPeopleDiscoveryManager_fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPeopleDensityEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchPeopleDensityEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  MOPeopleDiscoveryManager *v28;
  id v29;
  _QWORD v30[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 23));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 6));
  v30[0] = v14;
  v30[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager routineManager](self, "routineManager"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v24[3] = &unk_1002AED30;
  v25 = v10;
  v26 = v11;
  v28 = self;
  v29 = v12;
  v27 = v18;
  v20 = v18;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  objc_msgSend(v19, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v23, v22, v24);

}

void __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  MORehydrationMetrics *v15;
  void *v16;
  NSMutableDictionary *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  MORehydrationMetrics *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1();

    if (objc_msgSend(v6, "code") == (id)5)
    {
      v39 = NSLocalizedDescriptionKey;
      v40 = CFSTR("Provider database is unavailable");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1152, v10));

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    v25 = [MORehydrationMetrics alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v15 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v25, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 23, 6, 0, v26, objc_msgSend(*(id *)(a1 + 48), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 48), "count"), 0.0);

    v28 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v15, "submitMetricsWithError:", &v28);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v5, "count");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetch %lu density events, start date, %@, end date, %@", buf, 0x20u);
    }

    v15 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_rehydrateStoredEvents:fromPeopleDensityEvents:", *(_QWORD *)(a1 + 48), v5));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_createNewEventsWithStoredEvents:peopleDensityEvents:", *(_QWORD *)(a1 + 48), v5));
    v17 = objc_opt_new(NSMutableDictionary);
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = v5;
      v21 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v22 = -[MORehydrationMetrics count](v15, "count");
      v23 = objc_msgSend(v16, "count");
      v24 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138413314;
      v30 = v21;
      v31 = 2112;
      v32 = v20;
      v5 = v27;
      v33 = 2048;
      v34 = v22;
      v35 = 2048;
      v36 = v23;
      v37 = 2048;
      v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated density events count, %lu, new density events counts, %lu, stored density events count, %lu", buf, 0x34u);
    }

    if (v16)
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v16, CFSTR("newEvents"));
    if (v15)
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, CFSTR("rehydratedEvents"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

- (id)_createNewEventsWithStoredEvents:(id)a3 peopleDensityEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id os_log;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  id v47;
  NSMutableArray *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v48 = objc_opt_new(NSMutableArray);
      v7 = objc_opt_new(NSMutableDictionary);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v55 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider"));
            -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        }
        while (v10);
      }
      v47 = v5;
      v45 = v8;

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v46 = v6;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v51 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v22));

            if (!v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endDate"));

              if (v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _createEventFromPeopleDensityEvent:](self, "_createEventFromPeopleDensityEvent:", v20));
                objc_msgSend(v20, "densityScore");
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                objc_msgSend(v25, "setDensityScore:", v26);

                objc_msgSend(v20, "scanDuration");
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                objc_msgSend(v25, "setDensityScanDuration:", v27);

                if (v25)
                  -[NSMutableArray addObject:](v48, "addObject:", v25);

              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        }
        while (v17);
      }

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      v29 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = -[NSMutableArray count](v48, "count");
        v31 = objc_msgSend(v45, "count");
        *(_DWORD *)buf = 134218240;
        v63 = v30;
        v64 = 2048;
        v65 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "new density events count, %lu, stored density event count, %lu", buf, 0x16u);
      }

      v6 = v46;
      v5 = v47;
    }
    else
    {
      v33 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "No storedEvents for checking before create new density events", buf, 2u);
      }

      v48 = objc_opt_new(NSMutableArray);
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v7 = (NSMutableDictionary *)v6;
      v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(_QWORD *)v59 != v37)
              objc_enumerationMutation(v7);
            v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOPeopleDiscoveryManager _createEventFromPeopleDensityEvent:](self, "_createEventFromPeopleDensityEvent:", v39));
              objc_msgSend(v39, "densityScore");
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              objc_msgSend(v41, "setDensityScore:", v42);

              objc_msgSend(v39, "scanDuration");
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              objc_msgSend(v41, "setDensityScanDuration:", v43);

              if (v41)
                -[NSMutableArray addObject:](v48, "addObject:", v41);

            }
          }
          v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        }
        while (v36);
      }
    }
  }
  else
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "density event fetch result is nil for creating new events", buf, 2u);
    }
    v48 = 0;
  }

  return v48;
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
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

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineServiceManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: configurationManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
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

void __71__MOPeopleDiscoveryManager__fetchProxBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, v0, (uint64_t)v0, "proximity event fetch hit error, start date, %@, end date, %@, error, %@", v1);
  OUTLINED_FUNCTION_11();
}

void __80__MOPeopleDiscoveryManager__fetchPeopleDensityBetweenStartDate_EndDate_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, v0, (uint64_t)v0, "people density fetch hit error, start date, %@, end date, %@, error, %@", v1);
  OUTLINED_FUNCTION_11();
}

void __48__MOPeopleDiscoveryManager__saveEvents_handler___block_invoke_82_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving proximity event into database failed, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__MOPeopleDiscoveryManager__savePeopleDensityEvents_handler___block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving people density events into database failed, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__MOPeopleDiscoveryManager__rehydrateProx_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  OUTLINED_FUNCTION_6();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 40), "startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 40), "endDate"));
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, v0, v5, "proximity event fetch hit error, start date, %@, end date, %@, error, %@", v6);

  OUTLINED_FUNCTION_3_1();
}

void __66__MOPeopleDiscoveryManager__rehydratePeopleDensityEvents_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  OUTLINED_FUNCTION_6();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 32), "startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "endDate"));
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, v0, v5, "People density event fetch hit error, start date, %@, end date, %@, error, %@", v6);

  OUTLINED_FUNCTION_3_1();
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "delete proximity event succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __63__MOPeopleDiscoveryManager__removeProxDeletedAtSource_handler___block_invoke_88_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete proximity event failed, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "delete people density events succeded, event count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __78__MOPeopleDiscoveryManager__removePeopleDensityEventsDeletedAtSource_handler___block_invoke_89_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "delete people density events failed, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __94__MOPeopleDiscoveryManager__fetchProxEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *a2;
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, a3, (uint64_t)a3, "proximity event fetch hit error, start date, %@, end date, %@, error, %@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_11();
}

void __103__MOPeopleDiscoveryManager__fetchPeopleDensityEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_8((void *)&_mh_execute_header, v0, (uint64_t)v0, "density event fetch hit error, start date, %@, end date, %@, error, %@", v1);
  OUTLINED_FUNCTION_11();
}

@end
