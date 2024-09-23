@implementation MOLifeEventManager

+ (id)_createLifeEventContextWithError:(id *)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  id os_log;
  NSObject *v9;
  id v10;
  id v12;

  v12 = 0;
  v4 = objc_msgSend(objc_alloc((Class)GDLifeEventContext), "initAndReturnError:", &v12);
  v5 = v12;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v10 = v4;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MOLifeEventManager _createLifeEventContextWithError:].cold.1();

    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v10;
}

- (MOLifeEventManager)initWithUniverse:(id)a3
{
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
  id v16;
  NSObject *v17;
  GDLifeEventContext *v18;
  GDLifeEventContext *lifeEventContext;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *queue;
  MOLifeEventManager *v24;
  id os_log;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  SEL v30;
  MOLifeEventManager *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  objc_super v36;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOConfigurationManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v28 = v27;
    v29 = CFSTR("Invalid parameter not satisfying: configurationManager");
    v30 = a2;
    v31 = self;
    v32 = 52;
    goto LABEL_14;
  }
  v36.receiver = self;
  v36.super_class = (Class)MOLifeEventManager;
  self = -[MOLifeEventManager init](&v36, "init");
  if (self)
  {
    v12 = (objc_class *)objc_opt_class(MOEventStore, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));

    if (v15)
    {
      objc_storeStrong((id *)&self->_momentStore, v15);
      objc_storeStrong((id *)&self->_configurationManager, v10);
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[MOLifeEventManager initWithUniverse:].cold.3();

      v18 = (GDLifeEventContext *)objc_claimAutoreleasedReturnValue(+[MOLifeEventManager _createLifeEventContextWithError:](MOLifeEventManager, "_createLifeEventContextWithError:", 0));
      lifeEventContext = self->_lifeEventContext;
      self->_lifeEventContext = v18;

      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (OS_dispatch_queue *)dispatch_queue_create("MOLifeEventManager", v21);
      queue = self->_queue;
      self->_queue = v22;

      goto LABEL_7;
    }
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:].cold.1();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v28 = v27;
    v29 = CFSTR("Invalid parameter not satisfying: momentStore");
    v30 = a2;
    v31 = self;
    v32 = 60;
LABEL_14:
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("MOLifeEventManager.m"), v32, v29);

    v24 = 0;
    goto LABEL_15;
  }
LABEL_7:
  self = self;
  v24 = self;
LABEL_15:

  return v24;
}

- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 category:(unint64_t)a5 date:(id)a6 confidenceScore:(id)a7 locations:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MOEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  float v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  MOEvent *v33;
  void *v34;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v16)
    goto LABEL_10;
  if (!v15)
  {
    v19 = (MOEvent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
    if (!v19)
      goto LABEL_11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));

    if (v27)
    {
      v33 = [MOEvent alloc];
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v30 = (void *)v28;
      v19 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v33, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v34, v32, v28, v29, 10, 22);

      if (!v19)
        goto LABEL_11;
      goto LABEL_4;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v19 = (MOEvent *)v15;
LABEL_4:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    -[MOEvent setIdentifierFromProvider:](v19, "setIdentifierFromProvider:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager configurationManager](self, "configurationManager"));
    LODWORD(v24) = 1242802176;
    objc_msgSend(v23, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateByAddingTimeInterval:", v25));
    -[MOEvent setExpirationDate:](v19, "setExpirationDate:", v26);

    -[MOEvent setLifeEventCategory:](v19, "setLifeEventCategory:", a5);
    objc_msgSend(v17, "doubleValue");
    -[MOEvent setConfidenceScore:](v19, "setConfidenceScore:");
  }
LABEL_11:

  return v19;
}

- (id)_createMOEventFromShoppingEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entityIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locations"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:](self, "_createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:", v8, v6, 1, v9, v10, v11));
  return v12;
}

- (id)_createMOEventFromDiningEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entityIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locations"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:](self, "_createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:", v8, v6, 2, v9, v10, v11));
  return v12;
}

- (id)_createMOEventFromGamingEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id os_log;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:](self, "_createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:", v8, v7, 3, v9, v10, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "software"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "softwareId"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
    v22 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "graphSoftwareFromContext:error:", v15, &v22));
    v17 = v22;

    if (!v16 || v17)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      v18 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MOLifeEventManager _createMOEventFromGamingEvent:existingMOEvent:].cold.2(v14, (uint64_t)v17, v18);
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleId"));
      objc_msgSend(v12, "setAppBundle:", v18);
    }

  }
  else
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOLifeEventManager _createMOEventFromGamingEvent:existingMOEvent:].cold.1(v6, v17);
  }

  return v12;
}

- (id)_createMOEventFromTransportationEvent:(id)a3 existingMOEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id os_log;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transportationType"));
  v9 = objc_msgSend(v8, "integerValue");

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MOLifeEventManager _createMOEventFromTransportationEvent:existingMOEvent:].cold.1(v6, (uint64_t)v9, v11);

  if (v9 == (id)68)
  {
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entityIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "confidence"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "locations"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:](self, "_createMOEventFromEntityIdentifier:existingMOEvent:category:date:confidenceScore:locations:", v13, v7, 4, v14, v15, v16));
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_createMOEventFromEntityIdentifier:(id)a3 existingMOEvent:(id)a4 logErrorWhenEventHasError:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)GDGraphShoppingActivityEventEntityIdentifier), "initByCastingFrom:", v9);
  v11 = objc_msgSend(objc_alloc((Class)GDGraphDiningActivityEventEntityIdentifier), "initByCastingFrom:", v9);
  v12 = objc_msgSend(objc_alloc((Class)GDGraphTransportationActivityEventEntityIdentifier), "initByCastingFrom:", v9);

  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
    v31 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "graphShoppingActivityEventFromContext:error:", v13, &v31));
    v15 = v31;

    if (v14)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromShoppingEvent:existingMOEvent:](self, "_createMOEventFromShoppingEvent:existingMOEvent:", v14, v8));
LABEL_13:
      v22 = (void *)v16;
LABEL_29:

      goto LABEL_30;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    v20 = v19;
    if (v5)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:].cold.3();
      goto LABEL_28;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v15;
      v23 = "failed to create GDGraphShoppingActivityEvent. error: %@";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (v11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
    v30 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "graphDiningActivityEventFromContext:error:", v17, &v30));
    v15 = v30;

    if (v14)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromDiningEvent:existingMOEvent:](self, "_createMOEventFromDiningEvent:existingMOEvent:", v14, v8));
      goto LABEL_13;
    }
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v20 = v25;
    if (v5)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:].cold.2();
      goto LABEL_28;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v15;
      v23 = "failed to create GDGraphDiningActivityEvent. error: %@";
      goto LABEL_27;
    }
LABEL_28:

    v22 = 0;
    goto LABEL_29;
  }
  if (v12)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
    v29 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "graphTransportationActivityEventFromContext:error:", v21, &v29));
    v15 = v29;

    if (v14)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromTransportationEvent:existingMOEvent:](self, "_createMOEventFromTransportationEvent:existingMOEvent:", v14, v8));
      goto LABEL_13;
    }
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v20 = v27;
    if (v5)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:].cold.1();
      goto LABEL_28;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v15;
      v23 = "failed to create GDGraphTransportationActivityEvent. error: %@";
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (id)_createMOEventsBetweenStartDate:(id)a3 endDate:(id)a4 excludingEntityIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  id v21;
  _QWORD v23[4];
  id v24;
  MOLifeEventManager *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MOLifeEventManager _createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:].cold.1();

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
  v17 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v10, v11);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke;
  v23[3] = &unk_1002AF6B8;
  v24 = v12;
  v25 = self;
  v18 = v15;
  v26 = v18;
  v19 = v12;
  v20 = objc_msgSend(v16, "enumerateEntriesForActivityEventsThatOverlapWithDateInterval:ascending:error:usingBlock:", v17, 1, a6, v23);

  if (v20)
    v21 = v18;
  else
    v21 = 0;

  return v21;
}

void __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(v3);

  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entityIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:", v10, 0, 1));

    if (v11)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

  }
}

- (void)fetchAndSaveLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
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
  v11 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1002AF708;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id os_log;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[6];
  id v36;
  uint8_t v37[4];
  id v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lifeEventContext"));

  if (!v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
    }

    v36 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOLifeEventManager _createLifeEventContextWithError:](MOLifeEventManager, "_createLifeEventContextWithError:", &v36));
    v6 = v36;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    v9 = !v8;
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "setLifeEventContext:", v5);
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "fetchAndSaveLifeEventsBetweenStartDate, %@, endDate, %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__13;
  v41 = __Block_byref_object_dispose__13;
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "momentStore"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_84;
  v35[3] = &unk_1002AF6E0;
  v18 = *(_QWORD *)(a1 + 40);
  v35[4] = *(_QWORD *)(a1 + 32);
  v35[5] = buf;
  objc_msgSend(v17, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v18, 22, v35);

  v19 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    *(_DWORD *)v37 = 134217984;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%lu existingEntityIdentifiers", v37, 0xCu);
  }

  v22 = *(void **)(a1 + 32);
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v25 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v34 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:", v23, v24, v25, &v34));
  v27 = v34;
  v28 = v27;
  if (!v26 || v27)
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "momentStore"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_86;
    v32[3] = &unk_1002ADA40;
    v33 = *(id *)(a1 + 56);
    objc_msgSend(v29, "storeEvents:CompletionHandler:", v26, v32);

  }
  _Block_object_dispose(buf, 8);

}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_entityIdentifierFromMomentEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7)));
        v9 = v8;
        if (v8)
        {
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
          objc_msgSend(v10, "addObject:", v11);

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

uint64_t __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_entityIdentifierFromMomentEvent:(id)a3
{
  void *v3;
  id v4;
  id os_log;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifierFromProvider"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)GDEntityIdentifier), "initWithString:", v3);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOLifeEventManager _entityIdentifierFromMomentEvent:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (void)rehydrateLifeEvents:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOLifeEventManager_rehydrateLifeEvents_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __50__MOLifeEventManager_rehydrateLifeEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateLifeEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateLifeEvents:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id os_log;
  NSObject *v17;
  id v18;
  id v19;
  MORehydrationMetrics *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  MORehydrationMetrics *v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));

  if (v8)
  {
LABEL_9:
    v12 = (id)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _rehydrateStoredLifeEvents:](self, "_rehydrateStoredLifeEvents:", v6));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v6, "count");
      v19 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v30 = v18;
      v31 = 2048;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "rehydrateLifeEvents: %lu momentEvents , %lu rehydrated events", buf, 0x16u);
    }

    v7[2](v7, v12, 0);
    goto LABEL_12;
  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  v28 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOLifeEventManager _createLifeEventContextWithError:](MOLifeEventManager, "_createLifeEventContextWithError:", &v28));
  v12 = v28;
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v11 && !v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();

    -[MOLifeEventManager setLifeEventContext:](self, "setLifeEventContext:", v11);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();

  ((void (**)(id, id, id))v7)[2](v7, 0, v12);
  v20 = [MORehydrationMetrics alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v22 = objc_msgSend(v21, "category");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v24 = objc_msgSend(v23, "provider");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  v26 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v20, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v22, v24, 0, v25, objc_msgSend(v6, "count"), 3, (double)(int)objc_msgSend(v6, "count"), 0.0);

  v27 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v26, "submitMetricsWithError:", &v27);

LABEL_12:
}

- (id)_rehydrateStoredLifeEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  id v16;
  id v17;
  MORehydrationMetrics *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _entityIdentifierFromMomentEvent:](self, "_entityIdentifierFromMomentEvent:", v11));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:](self, "_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:", v12, v11, 0));
            if (v13)
              -[NSMutableArray addObject:](v5, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v8);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = -[NSMutableArray count](v5, "count");
      v17 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218240;
      v31 = v16;
      v32 = 2048;
      v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "rehydrated life events count, %lu, stored life events count, %lu", buf, 0x16u);
    }

    v18 = [MORehydrationMetrics alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v20 = objc_msgSend(v19, "category");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v22 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v18, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v20, objc_msgSend(v21, "provider"), 1, 0, objc_msgSend(v6, "count"), 3, (double)(int)(objc_msgSend(v6, "count") - -[NSMutableArray count](v5, "count")), 0.0);

    v25 = 0;
    -[NSObject submitMetricsWithError:](v22, "submitMetricsWithError:", &v25);
  }
  else
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "No stored life events for rehydration", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)removeLifeEventsDeletedAtSource:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AF730;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id os_log;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "lifeEventContext"));

  if (v2)
  {
LABEL_9:
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(a1[5], "count");
      *(_DWORD *)buf = 134217984;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "removeLifeEventsDeletedAtSource: %lu momentEvents", buf, 0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_91;
    v21[3] = &unk_1002ADAF8;
    v13 = a1[5];
    v21[4] = a1[4];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_pas_mappedArrayWithTransform:", v21));
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%ld life event(s) not found, therefore deleting them.", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "momentStore"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_93;
    v19[3] = &unk_1002ADA40;
    v20 = a1[6];
    objc_msgSend(v18, "removeEvents:CompletionHandler:", v14, v19);

    return;
  }
  v3 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOLifeEventManager _createLifeEventContextWithError:](MOLifeEventManager, "_createLifeEventContextWithError:", &v22));
  v6 = v22;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5 && !v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();

    objc_msgSend(a1[4], "setLifeEventContext:", v5);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();

  (*((void (**)(void))a1[6] + 2))();
}

id __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_entityIdentifierFromMomentEvent:", v3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lifeEventContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "graphObjectFromEntityIdentifier:error:", v4, 0));

    v7 = 0;
    if (!v6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_91_cold_1(v4);

      v7 = v3;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_93(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_createNewEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSMutableSet *v23;
  id v24;
  unsigned int v25;
  id v26;
  id os_log;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  id v31;
  void **v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  NSMutableSet *v37;
  MOLifeEventManager *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(NSMutableSet);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _entityIdentifierFromMomentEvent:](self, "_entityIdentifierFromMomentEvent:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v16)));
        v18 = v17;
        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
          -[NSMutableSet addObject:](v11, "addObject:", v19);

        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v14);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));
  v22 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v8, v9);
  v40 = 0;
  v33 = _NSConcreteStackBlock;
  v34 = 3221225472;
  v35 = __80__MOLifeEventManager__createNewEventsBetweenStartDate_endDate_withStoredEvents___block_invoke;
  v36 = &unk_1002AF6B8;
  v23 = v11;
  v37 = v23;
  v38 = self;
  v24 = v20;
  v39 = v24;
  v25 = objc_msgSend(v21, "enumerateEntriesForActivityEventsThatOverlapWithDateInterval:ascending:error:usingBlock:", v22, 1, &v40, &v33);
  v26 = v40;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v28 = objc_claimAutoreleasedReturnValue(os_log);
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v25)
  {
    if (v29)
    {
      v30 = objc_msgSend(v24, "count", v33, v34, v35, v36, v37, v38);
      *(_DWORD *)buf = 134217984;
      v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "create new life events count, %lu", buf, 0xCu);
    }

    v31 = v24;
  }
  else
  {
    if (v29)
    {
      *(_DWORD *)buf = 138412290;
      v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "create new life hit error, %@", buf, 0xCu);
    }

    v31 = 0;
  }

  return v31;
}

void __80__MOLifeEventManager__createNewEventsBetweenStartDate_endDate_withStoredEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(v3);

  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entityIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:", v10, 0, 1));

    if (v11)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

  }
}

- (void)fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOLifeEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__MOLifeEventManager_fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __87__MOLifeEventManager_fetchLifeEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLifeEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchLifeEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id os_log;
  NSObject *v22;
  void *v23;
  MORehydrationMetrics *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void (**v32)(id, _QWORD, void *);
  id v33;
  id v34;
  id v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  MORehydrationMetrics *v38;
  void *v39;
  id v40;
  MORehydrationMetrics *v41;
  id v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  _QWORD v55[2];

  v42 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager lifeEventContext](self, "lifeEventContext"));

  if (v13)
  {
LABEL_9:
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v42;
      v47 = 2112;
      v48 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetchLifeEventsBetweenStartDate, %@, endDate, %@", buf, 0x16u);
    }

    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 22));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 10));
    v55[0] = v17;
    v55[1] = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
    v24 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v24));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _rehydrateStoredLifeEvents:](self, "_rehydrateStoredLifeEvents:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOLifeEventManager _createNewEventsBetweenStartDate:endDate:withStoredEvents:](self, "_createNewEventsBetweenStartDate:endDate:withStoredEvents:", v42, v10, v25));
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v40 = objc_msgSend(v26, "count");
      v41 = v24;
      v30 = v17;
      v31 = v16;
      v32 = v12;
      v33 = v11;
      v34 = objc_msgSend(v27, "count");
      v35 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 138413314;
      v46 = v42;
      v47 = 2112;
      v48 = v10;
      v49 = 2048;
      v50 = v40;
      v51 = 2048;
      v52 = v34;
      v11 = v33;
      v12 = v32;
      v16 = v31;
      v17 = v30;
      v24 = v41;
      v53 = 2048;
      v54 = v35;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated life events count, %lu, new life events counts, %lu, stored life events count, %lu", buf, 0x34u);
    }

    v36 = objc_opt_new(NSMutableDictionary);
    v37 = v36;
    if (v27)
      -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v27, CFSTR("newEvents"));
    if (v26)
      -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v26, CFSTR("rehydratedEvents"));
    v12[2](v12, 0, v37);

    goto LABEL_18;
  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "lifeEventContext does not exist (due to error in init). Try to create it again.", buf, 2u);
  }

  v44 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOLifeEventManager _createLifeEventContextWithError:](MOLifeEventManager, "_createLifeEventContextWithError:", &v44));
  v17 = v44;
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityLifeEventManager);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v16 && !v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3();

    -[MOLifeEventManager setLifeEventContext:](self, "setLifeEventContext:", v16);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1();

  ((void (**)(id, id, void *))v12)[2](v12, v17, 0);
  v38 = [MORehydrationMetrics alloc];
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
  v24 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v38, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 22, 10, 0, v39, objc_msgSend(v11, "count"), 3, (double)(int)objc_msgSend(v11, "count"), 0.0);

  v43 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v24, "submitMetricsWithError:", &v43);
LABEL_18:

}

- (GDLifeEventContext)lifeEventContext
{
  return self->_lifeEventContext;
}

- (void)setLifeEventContext:(id)a3
{
  objc_storeStrong((id *)&self->_lifeEventContext, a3);
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_lifeEventContext, 0);
}

+ (void)_createLifeEventContextWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create lifeEventContext. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithUniverse:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "trying to create lifeEventContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_createMOEventFromGamingEvent:(void *)a1 existingMOEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "softwardId for the gaming event %@ is nil", v5, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createMOEventFromGamingEvent:(NSObject *)a3 existingMOEvent:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringValue"));
  OUTLINED_FUNCTION_10();
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to create GDGraphSoftware for %@. error: %@", v6, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createMOEventFromTransportationEvent:(NSObject *)a3 existingMOEvent:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  OUTLINED_FUNCTION_2();
  v9 = 2048;
  v10 = a2;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a3, v7, "GDTransportationActivityEventType of %@ is %ld", v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphTransportationActivityEvent. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphDiningActivityEvent. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createMOEventFromEntityIdentifier:existingMOEvent:logErrorWhenEventHasError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to create GDGraphShoppingActivityEvent. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createMOEventsBetweenStartDate:endDate:excludingEntityIdentifiers:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_10();
  v3 = v0;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v1, (uint64_t)v1, "createMOEventsBetweenStartDate, %@, endDate, %@", v2);
  OUTLINED_FUNCTION_1();
}

void __95__MOLifeEventManager__createMOEventsBetweenStartDate_endDate_excludingEntityIdentifiers_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringValue"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v3, v4, "skipping %@ since it's already in the store", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "still failed to create life event context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to fetchLifeEventsBetweenStartDate. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__MOLifeEventManager_fetchAndSaveLifeEventsBetweenStartDate_endDate_handler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "successfully created new life event context.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_entityIdentifierFromMomentEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "entityIdentifierStringValue is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __62__MOLifeEventManager_removeLifeEventsDeletedAtSource_handler___block_invoke_91_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringValue"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "previous event with %@ can no longer be found", v4, v5, v6, v7, v8);

}

@end
