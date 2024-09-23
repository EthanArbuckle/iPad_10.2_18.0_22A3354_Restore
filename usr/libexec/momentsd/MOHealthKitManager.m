@implementation MOHealthKitManager

- (MOHealthKitManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  MOHealthKitManager *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  MOHealthKitManager *v22;
  id v23;
  NSObject *v24;
  id os_log;
  NSObject *v26;
  void *v27;
  objc_super v29;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOConfigurationManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  if (v10)
  {
    v11 = objc_alloc_init((Class)HKHealthStore);
    v13 = (objc_class *)objc_opt_class(MOEventStore, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v15));

    if (v16)
    {
      if (v11)
      {
        v29.receiver = self;
        v29.super_class = (Class)MOHealthKitManager;
        v17 = -[MOHealthKitManager init](&v29, "init");
        if (v17)
        {
          v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = dispatch_queue_create("MOHealthKitManager", v19);
          queue = v17->_queue;
          v17->_queue = (OS_dispatch_queue *)v20;

          objc_storeStrong((id *)&v17->_healthStore, v11);
          objc_storeStrong((id *)&v17->_eventStore, v16);
          objc_storeStrong((id *)&v17->_configurationManager, v10);
        }
        self = v17;
        v22 = self;
        goto LABEL_14;
      }
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MORoutineServiceManager initWithUniverse:].cold.2();

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOHealthKitManager.m"), 54, CFSTR("Invalid parameter not satisfying: eventStore"));

    }
    v22 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOHealthKitManager.m"), 47, CFSTR("Invalid parameter not satisfying: configurationManager"));
  v22 = 0;
LABEL_15:

  return v22;
}

- (void)_fetchWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MOHealthKitManager *v19;
  id v20;
  id v21;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 2));
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", HKSampleSortIdentifierEndDate, 0);
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));

  v12 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002B5B68;
  v17 = v9;
  v18 = v11;
  v19 = self;
  v20 = v8;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc((Class)HKSampleQuery);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType workoutType](HKObjectType, "workoutType"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002AF4A0;
  v9 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v2, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, v4, 0, v5, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "healthStore"));
  objc_msgSend(v7, "executeQuery:", v6);

}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  void *v13;
  void (*v14)(void);
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
    v14();
    goto LABEL_9;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();

  if (objc_msgSend(v9, "code") != (id)6)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  v15 = NSLocalizedDescriptionKey;
  v16 = CFSTR("Provider database is unavailable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1536, v12));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

- (void)_fetchStateOfMindBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MOHealthKitManager *v19;
  id v20;
  id v21;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 2));
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", HKSampleSortIdentifierEndDate, 0);
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));

  v12 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002B5B68;
  v17 = v9;
  v18 = v11;
  v19 = self;
  v20 = v8;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc((Class)HKSampleQuery);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HKStateOfMindType stateOfMindType](HKStateOfMindType, "stateOfMindType"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002AF4A0;
  v9 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v2, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, v4, 0, v5, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "healthStore"));
  objc_msgSend(v7, "executeQuery:", v6);

}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  void *v13;
  void (*v14)(void);
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
    v14();
    goto LABEL_9;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();

  if (objc_msgSend(v9, "code") != (id)6)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  v15 = NSLocalizedDescriptionKey;
  v16 = CFSTR("Provider database is unavailable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 1536, v12));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

- (id)_createEventFromWorkout:(id)a3
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
  void *v17;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 1, 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v17);

  return v10;
}

- (id)_createEventFromStateOfMind:(id)a3
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
  void *v17;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 1, 24);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v17);

  return v10;
}

- (void)_setDynamicProperties:(id)a3 stateOfMind:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MOEventStateOfMind *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  objc_msgSend(v27, "setAppBundle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "source"));
  objc_msgSend(v27, "setFromFirstParty:", objc_msgSend(v10, "_hasFirstPartyBundleID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  if (!v11)
  {
    v12 = objc_alloc_init(MOEventStateOfMind);
    objc_msgSend(v27, "setStateOfMindEvent:", v12);

  }
  v13 = (double)(uint64_t)objc_msgSend(v5, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  objc_msgSend(v14, "setReflectiveInterval:", v13);

  objc_msgSend(v5, "valence");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  objc_msgSend(v17, "setValence:", v16);

  v18 = HKStateOfMindValenceClassificationForValence(objc_msgSend(v5, "valence"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  objc_msgSend(v22, "setValenceClassification:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  objc_msgSend(v24, "setLabels:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associations"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateOfMindEvent"));
  objc_msgSend(v26, "setDomains:", v25);

}

- (void)_setDynamicProperties:(id)a3 workout:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
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
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  id v36;
  id v37;

  v37 = a3;
  v5 = a4;
  v6 = _HKWorkoutActivityNameForActivityType(objc_msgSend(v5, "workoutActivityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v37, "setWorkoutType:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  objc_msgSend(v37, "setAppBundle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "source"));
  objc_msgSend(v37, "setFromFirstParty:", objc_msgSend(v13, "_hasFirstPartyBundleID"));

  objc_msgSend(v5, "duration");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v37, "setWorkoutDuration:", v14);

  objc_msgSend(v5, "_totalDistanceInCanonicalUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v37, "setWorkoutTotalDistance:", v15);

  objc_msgSend(v5, "_totalEnergyBurnedInCanonicalUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v37, "setWorkoutTotalEnergyBurned:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", HKMetadataKeyAppleFitnessPlusSession));
  objc_msgSend(v37, "setIsFitnessPlusSession:", objc_msgSend(v18, "BOOLValue"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", HKMetadataKeyIndoorWorkout));
  v21 = objc_msgSend(v20, "BOOLValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "workoutEvent"));
  objc_msgSend(v22, "setIsIndoors:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
  v24 = _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude));
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  if (v27 != 0.0)
  {
    v28 = objc_alloc((Class)CLLocation);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v24));
    objc_msgSend(v30, "doubleValue");
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLongitude));
    objc_msgSend(v34, "doubleValue");
    v36 = objc_msgSend(v28, "initWithLatitude:longitude:", v32, v35);
    objc_msgSend(v37, "setWorkoutLocationStart:", v36);

  }
}

- (void)_fetchWorkoutRoutes:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", a3));
  v8 = objc_alloc((Class)HKAnchoredObjectQuery);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke;
  v13[3] = &unk_1002B6300;
  v14 = v6;
  v10 = v6;
  v11 = objc_msgSend(v8, "initWithType:predicate:anchor:limit:resultsHandler:", v9, v7, 0, 0, v13);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore"));
  objc_msgSend(v12, "executeQuery:", v11);

}

void __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7;
  id os_log;
  NSObject *v9;
  void (*v10)(void);

  v7 = a6;
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke_cold_1();

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

- (void)_fetchWorkoutRouteLocations:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  NSMutableArray *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  v9 = objc_alloc((Class)HKWorkoutRouteQuery);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke;
  v15[3] = &unk_1002B6328;
  v17 = v8;
  v18 = v7;
  v16 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  v13 = objc_msgSend(v9, "initWithRoute:dataHandler:", v11, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore"));
  objc_msgSend(v14, "executeQuery:", v13);

}

void __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  _BYTE v33[14];
  __int16 v34;
  id v35;
  __int16 v36;
  _BYTE v37[18];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = (unint64_t)objc_msgSend(v8, "count");
    if (objc_msgSend(v8, "count"))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      v14 = (unint64_t)objc_msgSend(v8, "count") + (_QWORD)v13 - 1;
      v15 = v14 / (unint64_t)objc_msgSend(v8, "count");
      v12 = (v15 + 255) / v15;
      if (v12 > 1)
      {
        if (v12 >= (unint64_t)objc_msgSend(v8, "count"))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v8);
        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[RTLocationDownsampler downsampleLocations:outputSize:](RTLocationDownsampler, "downsampleLocations:outputSize:", v8, v12));
          objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v20);

        }
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 40), "count"))
        {
          v16 = *(void **)(a1 + 40);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          objc_msgSend(v16, "addObject:", v17);

        }
        v18 = *(void **)(a1 + 40);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
        objc_msgSend(v18, "addObject:", v19);

      }
    }
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_msgSend(v8, "count");
      v30 = objc_msgSend(*(id *)(a1 + 40), "count");
      v31 = objc_msgSend(*(id *)(a1 + 32), "count");
      v32 = 134219008;
      *(_QWORD *)v33 = v29;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = a4;
      v34 = 2048;
      v35 = v30;
      v36 = 2048;
      *(_QWORD *)v37 = v31;
      *(_WORD *)&v37[8] = 2048;
      *(_QWORD *)&v37[10] = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "_fetchWorkoutRouteLocations,itemCount,%lu,done,%d,accu,%lu,workoutCount,%lu,target,%lu", (uint8_t *)&v32, 0x30u);
    }

    if (a4)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[RTLocationDownsampler downsampleLocations:outputSize:](RTLocationDownsampler, "downsampleLocations:outputSize:", *(_QWORD *)(a1 + 40), 64));
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(*(id *)(a1 + 40), "count");
        v27 = objc_msgSend(v23, "count");
        v28 = objc_msgSend(*(id *)(a1 + 32), "count");
        v32 = 67110144;
        *(_DWORD *)v33 = 4;
        *(_WORD *)&v33[4] = 2048;
        *(_QWORD *)&v33[6] = v26;
        v34 = 2048;
        v35 = v27;
        v36 = 1024;
        *(_DWORD *)v37 = 64;
        *(_WORD *)&v37[4] = 2048;
        *(_QWORD *)&v37[6] = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "RTLocationDownsampler 2%d: in %lu, out %lu, target %d, raw %lu", (uint8_t *)&v32, 0x2Cu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

- (void)_saveWorkouts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MOEventStore *eventStore;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  MOEventStore *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__41;
  v34 = __Block_byref_object_dispose__41;
  v35 = 0;
  eventStore = self->_eventStore;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __44__MOHealthKitManager__saveWorkouts_handler___block_invoke;
  v29[3] = &unk_1002AEC68;
  v29[4] = &v30;
  -[MOEventStore fetchLastEventOfCategory:CompletionHandler:](eventStore, "fetchLastEventOfCategory:CompletionHandler:", 2, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "duration");
        if (v14 >= 60.0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createEventFromWorkout:](self, "_createEventFromWorkout:", v13));
          v16 = v15;
          if (!v31[5]
            || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate")),
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "startDate")),
                v19 = objc_msgSend(v17, "isAfterDate:", v18),
                v18,
                v17,
                v19))
          {
            objc_msgSend(v22, "addObject:", v16);
          }

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v10);
  }

  v20 = self->_eventStore;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2;
  v23[3] = &unk_1002ADA40;
  v21 = v7;
  v24 = v21;
  -[MOEventStore storeEvents:CompletionHandler:](v20, "storeEvents:CompletionHandler:", v22, v23);

  _Block_object_dispose(&v30, 8);
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (id)_createQueryBasedonEvents:(id)a3 withPredicate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id os_log;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v9 = objc_msgSend(v8, "category");

  if (v9 == (id)2)
  {
    v10 = objc_alloc((Class)HKQueryDescriptor);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType workoutType](HKObjectType, "workoutType"));
    v12 = objc_msgSend(v10, "initWithSampleType:predicate:", v11, v6);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v31 = 0;
      v15 = "start rehydrating workout";
      v16 = (uint8_t *)&v31;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v18 = objc_msgSend(v17, "category");

  if (v18 == (id)13)
  {
    v19 = objc_alloc((Class)HKQueryDescriptor);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType categoryTypeForIdentifier:](HKSampleType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierMindfulSession));
    v12 = objc_msgSend(v19, "initWithSampleType:predicate:", v20, v6);

    v21 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v14 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v30 = 0;
      v15 = "start rehydrating mindful session";
      v16 = (uint8_t *)&v30;
      goto LABEL_10;
    }
LABEL_11:

    objc_msgSend(v7, "addObject:", v12);
    goto LABEL_12;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v23 = objc_msgSend(v22, "category");

  if (v23 == (id)24)
  {
    v24 = objc_alloc((Class)HKQueryDescriptor);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType stateOfMindType](HKObjectType, "stateOfMindType"));
    v12 = objc_msgSend(v24, "initWithSampleType:predicate:", v25, v6);

    v26 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v29 = 0;
      v15 = "start rehydrating state of mind";
      v16 = (uint8_t *)&v29;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v12 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[MOHealthKitManager _createQueryBasedonEvents:withPredicate:].cold.1();
LABEL_12:

  return v7;
}

- (void)rehydrateWorkouts:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOHealthKitManager_rehydrateWorkouts_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __48__MOHealthKitManager_rehydrateWorkouts_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateWorkouts:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateWorkouts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id os_log;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *, void *);
  void *v21;
  id v22;
  MOHealthKitManager *v23;
  id v24;
  _QWORD v25[4];
  NSMutableArray *v26;
  uint8_t buf[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke;
  v25[3] = &unk_1002AF940;
  v8 = objc_opt_new(NSMutableArray);
  v26 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[NSMutableArray count](v8, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "start rehydrating health data, identifier count, %lu", buf, 0xCu);
  }

  if (-[NSMutableArray count](v8, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsWithUUIDs:](HKQuery, "predicateForObjectsWithUUIDs:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createQueryBasedonEvents:withPredicate:](self, "_createQueryBasedonEvents:withPredicate:", v6, v13));
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_alloc((Class)HKSampleQuery);
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288;
      v21 = &unk_1002B6350;
      v24 = v7;
      v22 = v6;
      v23 = self;
      v16 = objc_msgSend(v15, "initWithQueryDescriptors:limit:resultsHandler:", v14, 0, &v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore", v18, v19, v20, v21));
      objc_msgSend(v17, "executeQuery:", v16);

    }
    else if (v7)
    {
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
  }

}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierFromProvider"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_alloc((Class)NSUUID);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierFromProvider"));
    v7 = objc_msgSend(v5, "initWithUUIDString:", v6);
    objc_msgSend(v4, "addObject:", v7);

  }
}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v11 = objc_msgSend(v10, "category");

    if (v11 == (id)2)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_289;
      v20[3] = &unk_1002ADFD8;
      v21 = *(id *)(a1 + 48);
      objc_msgSend(v12, "_rehydrateStoredEvents:fromWorkouts:handler:", v13, v6, v20);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v15 = objc_msgSend(v14, "category");

    if (v15 == (id)13)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_2;
      v18[3] = &unk_1002ADFD8;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v16, "_rehydrateStoredEvents:fromMindfulSession:handler:", v17, v6, v18);

    }
  }

}

uint64_t __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rehydrateStateOfMind:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__MOHealthKitManager_rehydrateStateOfMind_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __51__MOHealthKitManager_rehydrateStateOfMind_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateStateOfMind:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateStateOfMind:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id os_log;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *, void *);
  void *v21;
  id v22;
  MOHealthKitManager *v23;
  id v24;
  _QWORD v25[4];
  NSMutableArray *v26;
  uint8_t buf[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke;
  v25[3] = &unk_1002AF940;
  v8 = objc_opt_new(NSMutableArray);
  v26 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[NSMutableArray count](v8, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "start rehydrating state of mind data, identifier count, %lu", buf, 0xCu);
  }

  if (-[NSMutableArray count](v8, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsWithUUIDs:](HKQuery, "predicateForObjectsWithUUIDs:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createQueryBasedonEvents:withPredicate:](self, "_createQueryBasedonEvents:withPredicate:", v6, v13));
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_alloc((Class)HKSampleQuery);
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_291;
      v21 = &unk_1002B6350;
      v24 = v7;
      v22 = v6;
      v23 = self;
      v16 = objc_msgSend(v15, "initWithQueryDescriptors:limit:resultsHandler:", v14, 0, &v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore", v18, v19, v20, v21));
      objc_msgSend(v17, "executeQuery:", v16);

    }
    else if (v7)
    {
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
  }

}

void __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierFromProvider"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_alloc((Class)NSUUID);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierFromProvider"));
    v7 = objc_msgSend(v5, "initWithUUIDString:", v6);
    objc_msgSend(v4, "addObject:", v7);

  }
}

void __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_291(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v11 = objc_msgSend(v10, "category");

    if (v11 == (id)24)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_292;
      v14[3] = &unk_1002ADFD8;
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v12, "_rehydrateStoredEvents:fromStateOfMind:handler:", v13, v6, v14);

    }
  }

}

uint64_t __52__MOHealthKitManager__rehydrateStateOfMind_handler___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_rehydrateStoredEvents:(id)a3 fromWorkouts:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  MORehydrationThresholdMetrics *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  MORehydrationMetrics *v30;
  void *v31;
  id v32;
  void *v33;
  MORehydrationMetrics *v34;
  id os_log;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  id obj;
  dispatch_queue_t v41;
  NSMutableDictionary *v42;
  _QWORD block[4];
  id v45;
  id v46;
  uint8_t *v47;
  uint64_t *v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  NSObject *v52;
  uint8_t *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[4];
  NSMutableDictionary *v72;
  uint64_t v73;
  _BYTE v74[128];

  v7 = a3;
  v8 = a4;
  v38 = a5;
  v39 = v7;
  v37 = v8;
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v8, "count"))
    {
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke;
      v71[3] = &unk_1002AF940;
      v42 = objc_opt_new(NSMutableDictionary);
      v72 = v42;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v71);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v42, "allKeys"));
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        *(_QWORD *)buf = 0;
        v66 = buf;
        v67 = 0x3032000000;
        v68 = __Block_byref_object_copy__41;
        v69 = __Block_byref_object_dispose__41;
        v70 = objc_alloc_init((Class)NSMutableArray);
        v59 = 0;
        v60 = &v59;
        v61 = 0x3032000000;
        v62 = __Block_byref_object_copy__41;
        v63 = __Block_byref_object_dispose__41;
        v64 = objc_alloc_init((Class)NSMutableArray);
        v11 = dispatch_group_create();
        v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        v41 = dispatch_queue_create("com.apple.health.workout.rehydrate", v13);

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        obj = v37;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID", v37));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v19));

              if (v20)
              {
                dispatch_group_enter(v11);
                v21 = objc_msgSend(v20, "copy");
                if (objc_msgSend(v20, "rehydrationFailCount"))
                {
                  v22 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v20, "category"), objc_msgSend(v20, "provider"), objc_msgSend(v20, "rehydrationFailCount"));
                  v54 = 0;
                  -[MORehydrationThresholdMetrics submitMetricsWithError:](v22, "submitMetricsWithError:", &v54);
                  v23 = v54;
                  objc_msgSend(v21, "setRehydrationFailCount:", 0);
                  objc_msgSend((id)v60[5], "addObject:", v20);

                }
                -[MOHealthKitManager _setDynamicProperties:workout:](self, "_setDynamicProperties:workout:", v21, v17);
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472;
                v49[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_297;
                v49[3] = &unk_1002B6378;
                v24 = v21;
                v50 = v24;
                v51 = v41;
                v53 = buf;
                v52 = v11;
                -[MOHealthKitManager _fetchLocationsFrom:handler:](self, "_fetchLocationsFrom:handler:", v17, v49);

              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
          }
          while (v14);
        }

        v25 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_3;
        block[3] = &unk_1002B63A0;
        v47 = buf;
        v45 = v39;
        v46 = v38;
        v48 = &v59;
        dispatch_group_notify(v11, v25, block);

        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
        v36 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[MOHealthKitManager _rehydrateStoredEvents:fromWorkouts:handler:].cold.1();

        (*((void (**)(id, void *, _QWORD))v38 + 2))(v38, &__NSArray0__struct, 0);
      }

    }
    else
    {
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "no workouts for rehydrating workout events", buf, 2u);
      }

      (*((void (**)(id, void *, _QWORD))v38 + 2))(v38, &__NSArray0__struct, 0);
      v30 = [MORehydrationMetrics alloc];
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject", v8));
      v32 = objc_msgSend(v31, "category");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
      v34 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v30, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v32, objc_msgSend(v33, "provider"), 1, 0, objc_msgSend(v39, "count"), 3, (double)(int)objc_msgSend(v39, "count"), 0.0);

      v73 = 0;
      -[MORehydrationMetrics submitMetricsWithError:](v34, "submitMetricsWithError:", &v73);

    }
  }
  else
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "no input events for rehydrating workout events", buf, 2u);
    }

    (*((void (**)(id, void *, _QWORD))v38 + 2))(v38, &__NSArray0__struct, 0);
  }

}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_297(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setWorkoutLocationRoute:", a2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_2;
  v4[3] = &unk_1002B2A98;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

id __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void __66__MOHealthKitManager__rehydrateStoredEvents_fromWorkouts_handler___block_invoke_3(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  id v5;
  MORehydrationMetrics *v6;
  void *v7;
  id v8;
  void *v9;
  MORehydrationMetrics *v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218240;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "rehydrated workout count, %lu, stored workout count, %lu", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = [MORehydrationMetrics alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v8 = objc_msgSend(v7, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v10 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v6, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v8, objc_msgSend(v9, "provider"), 1, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)(objc_msgSend(*(id *)(a1 + 32), "count")- objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")), (double)(int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));

  v11 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v10, "submitMetricsWithError:", &v11);

}

- (void)_rehydrateStoredEvents:(id)a3 fromStateOfMind:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSMutableDictionary *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id os_log;
  NSObject *v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  NSMutableDictionary *v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (!objc_msgSend(v7, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOHealthKitManager _rehydrateStoredEvents:fromStateOfMind:handler:].cold.1();
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOHealthKitManager _rehydrateStoredEvents:fromStateOfMind:handler:].cold.2();
LABEL_19:

    v9[2](v9, &__NSArray0__struct, 0);
    goto LABEL_20;
  }
  v28 = v9;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __69__MOHealthKitManager__rehydrateStoredEvents_fromStateOfMind_handler___block_invoke;
  v36[3] = &unk_1002AF940;
  v10 = objc_opt_new(NSMutableDictionary);
  v37 = v10;
  v30 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v36);
  v11 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID", v28));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v19));

        if (v20)
        {
          v21 = objc_msgSend(v20, "copy");
          -[MOHealthKitManager _setDynamicProperties:stateOfMind:](self, "_setDynamicProperties:stateOfMind:", v21, v17);
          objc_msgSend(v11, "addObject:", v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);
  }

  v22 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "health data rehydrated state of mind count, %lu", buf, 0xCu);
  }

  v9 = v28;
  v28[2](v28, v11, 0);

  v8 = v29;
  v7 = v30;
LABEL_20:

}

void __69__MOHealthKitManager__rehydrateStoredEvents_fromStateOfMind_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
}

- (void)_rehydrateStoredEvents:(id)a3 fromMindfulSession:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSMutableDictionary *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id os_log;
  NSObject *v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  NSMutableDictionary *v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (!objc_msgSend(v7, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOHealthKitManager _rehydrateStoredEvents:fromMindfulSession:handler:].cold.1();
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOHealthKitManager _rehydrateStoredEvents:fromMindfulSession:handler:].cold.2();
LABEL_19:

    v9[2](v9, &__NSArray0__struct, 0);
    goto LABEL_20;
  }
  v28 = v9;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __72__MOHealthKitManager__rehydrateStoredEvents_fromMindfulSession_handler___block_invoke;
  v36[3] = &unk_1002AF940;
  v10 = objc_opt_new(NSMutableDictionary);
  v37 = v10;
  v30 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v36);
  v11 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID", v28));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v19));

        if (v20)
        {
          v21 = objc_msgSend(v20, "copy");
          -[MOHealthKitManager _setDynamicProperties:mindfulSession:](self, "_setDynamicProperties:mindfulSession:", v21, v17);
          objc_msgSend(v11, "addObject:", v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);
  }

  v22 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "health data rehydrated mindful sessions count, %lu", buf, 0xCu);
  }

  v9 = v28;
  v28[2](v28, v11, 0);

  v8 = v29;
  v7 = v30;
LABEL_20:

}

void __72__MOHealthKitManager__rehydrateStoredEvents_fromMindfulSession_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromProvider"));
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
}

- (void)_fetchLocationsFrom:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MOHealthKitManager *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  NSMutableArray *v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__41;
  v15[4] = __Block_byref_object_dispose__41;
  v16 = objc_opt_new(NSMutableArray);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke;
  v10[3] = &unk_1002B3410;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v14 = v15;
  v9 = v7;
  v13 = v9;
  -[MOHealthKitManager _fetchWorkoutRoutes:CompletionHandler:](self, "_fetchWorkoutRoutes:CompletionHandler:", v8, v10);

  _Block_object_dispose(v15, 8);
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id obj;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_cold_1(v3, a1, v5);

    v6 = dispatch_group_create();
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.health.workout.route.fetch", v8);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v3;
    obj = v3;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v13);
          dispatch_group_enter(v6);
          v15 = *(void **)(a1 + 40);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_299;
          v26[3] = &unk_1002B63F0;
          v27 = v9;
          v28 = v14;
          v16 = *(id *)(a1 + 32);
          v17 = *(_QWORD *)(a1 + 56);
          v29 = v16;
          v31 = v17;
          v30 = v6;
          objc_msgSend(v15, "_fetchWorkoutRouteLocations:CompletionHandler:", v14, v26);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_300;
    block[3] = &unk_1002B6418;
    v25 = *(_QWORD *)(a1 + 56);
    v22 = obj;
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 48);
    dispatch_group_notify(v6, v18, block);

    v3 = v19;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_299(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2;
  block[3] = &unk_1002B63C8;
  v5 = *(NSObject **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v8 = v3;
  dispatch_sync(v5, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  id os_log;
  NSObject *v5;
  _BOOL4 v6;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_2(v2, a1);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
      __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_1(a1, v5);

  }
}

uint64_t __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_300(uint64_t a1)
{
  uint64_t v2;
  id os_log;
  NSObject *v4;

  v2 = a1 + 56;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_300_cold_1(v2, a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke_2;
  v3[3] = &unk_1002ADA40;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_updateWorkoutsDeletedAtSource:handler:", v2, v3);

}

uint64_t __60__MOHealthKitManager_updateWorkoutsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateWorkoutsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id os_log;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *, void *);
  void *v21;
  id v22;
  MOHealthKitManager *v23;
  id v24;
  _QWORD v25[4];
  NSMutableArray *v26;
  uint8_t buf[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke;
  v25[3] = &unk_1002AF940;
  v8 = objc_opt_new(NSMutableArray);
  v26 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[NSMutableArray count](v8, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "start updating health data deleted at source, identifier count, %lu", buf, 0xCu);
  }

  if (-[NSMutableArray count](v8, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsWithUUIDs:](HKQuery, "predicateForObjectsWithUUIDs:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createQueryBasedonEvents:withPredicate:](self, "_createQueryBasedonEvents:withPredicate:", v6, v13));
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_alloc((Class)HKSampleQuery);
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_301;
      v21 = &unk_1002B6350;
      v24 = v7;
      v22 = v6;
      v23 = self;
      v16 = objc_msgSend(v15, "initWithQueryDescriptors:limit:resultsHandler:", v14, 0, &v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore", v18, v19, v20, v21));
      objc_msgSend(v17, "executeQuery:", v16);

    }
    else if (v7)
    {
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }

}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  void *v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));

  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "adding identifier to the list: %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = *(void **)(a1 + 32);
    v9 = objc_alloc((Class)NSUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    v11 = objc_msgSend(v9, "initWithUUIDString:", v10);
    objc_msgSend(v8, "addObject:", v11);

  }
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_301(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MORehydrationMetrics *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableSet *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  char *v34;
  MORehydrationThresholdMetrics *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  MORehydrationMetrics *v47;
  void *v48;
  id v49;
  void *v50;
  MORehydrationMetrics *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v10 = [MORehydrationMetrics alloc];
    v11 = a1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v13 = objc_msgSend(v12, "category");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v11 + 32), "firstObject"));
    v15 = objc_msgSend(v14, "provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v17 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v10, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v13, v15, 0, v16, objc_msgSend(*(id *)(v11 + 32), "count"), 1, (double)(int)objc_msgSend(*(id *)(v11 + 32), "count"), 0.0);

    v74 = 0;
    -[NSMutableSet submitMetricsWithError:](v17, "submitMetricsWithError:", &v74);
  }
  else
  {
    v17 = objc_opt_new(NSMutableSet);
    v18 = objc_alloc_init((Class)NSMutableArray);
    v59 = objc_alloc_init((Class)NSMutableArray);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i), "UUID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
          -[NSMutableSet addObject:](v17, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v21);
    }
    v58 = v6;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v57 = a1;
    v26 = *(id *)(a1 + 32);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(_QWORD *)v67 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifierFromProvider"));
          v33 = -[NSMutableSet containsObject:](v17, "containsObject:", v32);

          v34 = (char *)objc_msgSend(v31, "rehydrationFailCount");
          if ((v33 & 1) != 0)
          {
            if (v34)
            {
              v35 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v31, "category"), objc_msgSend(v31, "provider"), objc_msgSend(v31, "rehydrationFailCount"));
              v65 = 0;
              -[MORehydrationThresholdMetrics submitMetricsWithError:](v35, "submitMetricsWithError:", &v65);
              v36 = v65;
              objc_msgSend(v31, "setRehydrationFailCount:", 0);
              objc_msgSend(v59, "addObject:", v31);

            }
          }
          else
          {
            objc_msgSend(v31, "setRehydrationFailCount:", v34 + 1);
            objc_msgSend(v18, "addObject:", v31);
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v28);
    }

    v37 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = objc_msgSend(v18, "count");
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "describeCategory"));
      *(_DWORD *)buf = 134218242;
      v76 = v39;
      v77 = 2112;
      v78 = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "health events failed to rehydrate,  count, %lu, with category, %@", buf, 0x16u);

    }
    v42 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = objc_msgSend(v59, "count");
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "describeCategory"));
      *(_DWORD *)buf = 134218242;
      v76 = v44;
      v77 = 2112;
      v78 = v46;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "previously rehdyration failed health events now are found,  count, %lu, with category, %@", buf, 0x16u);

    }
    v47 = [MORehydrationMetrics alloc];
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v57 + 32), "firstObject"));
    v49 = objc_msgSend(v48, "category");
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v57 + 32), "firstObject"));
    v51 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v47, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v49, objc_msgSend(v50, "provider"), 1, 0, objc_msgSend(*(id *)(v57 + 32), "count"), 1, (double)(int)objc_msgSend(v18, "count"), (double)(int)objc_msgSend(v59, "count"));

    v64 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v51, "submitMetricsWithError:", &v64);
    v52 = v64;
    objc_msgSend(v59, "addObjectsFromArray:", v18);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v57 + 40), "eventStore"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_303;
    v60[3] = &unk_1002B2068;
    v54 = *(_QWORD *)(v57 + 40);
    v55 = *(void **)(v57 + 48);
    v61 = v59;
    v62 = v54;
    v63 = v55;
    v56 = v59;
    objc_msgSend(v53, "storeEvents:CompletionHandler:", v56, v60);

    v7 = 0;
    v6 = v58;
  }

}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_303(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_303_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "update invalid health data events succeeded, count, %lu", buf, 0xCu);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_304;
  block[3] = &unk_1002B52D8;
  v12 = a1[6];
  v17 = v6;
  v18 = v12;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v11, block);

}

uint64_t __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_304(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)fetchAndSaveWorkoutsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOHealthKitManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002B2348;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOHealthKitManager _fetchWorkoutsBetweenStartDate:EndDate:CompletionHandler:](v9, "_fetchWorkoutsBetweenStartDate:EndDate:CompletionHandler:", a3, a4, v8);

}

void __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "save %lu workouts as event into database", buf, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke_305;
    v13[3] = &unk_1002ADA40;
    v11 = *(void **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_saveWorkouts:handler:", v5, v13);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no workouts fetched for saving", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v6, &__NSDictionary0__struct);
  }

}

uint64_t __75__MOHealthKitManager_fetchAndSaveWorkoutsBetweenStartDate_EndDate_handler___block_invoke_305(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_fetchMindfulSessionBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MOHealthKitManager *v19;
  id v20;
  id v21;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 2));
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", HKSampleSortIdentifierEndDate, 0);
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));

  v12 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v16[3] = &unk_1002B5B68;
  v17 = v9;
  v18 = v11;
  v19 = self;
  v20 = v8;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc((Class)HKSampleQuery);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType categoryTypeForIdentifier:](HKSampleType, "categoryTypeForIdentifier:", HKCategoryTypeIdentifierMindfulSession));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v8[3] = &unk_1002AF4A0;
  v9 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v2, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, v4, 0, v5, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "healthStore"));
  objc_msgSend(v7, "executeQuery:", v6);

}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(void);
  int v12;
  id v13;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1();

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetched %lu mindful sessions ", (uint8_t *)&v12, 0xCu);
    }

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v11();

}

- (id)_createEventFromMindfulSession:(id)a3
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
  void *v17;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 1, 13);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v17);

  return v10;
}

- (void)_saveMindfulSessions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MOEventStore *eventStore;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  MOEventStore *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__41;
  v33 = __Block_byref_object_dispose__41;
  v34 = 0;
  eventStore = self->_eventStore;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke;
  v28[3] = &unk_1002AEC68;
  v28[4] = &v29;
  -[MOEventStore fetchLastEventOfCategory:CompletionHandler:](eventStore, "fetchLastEventOfCategory:CompletionHandler:", 13, v28);
  v21 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createEventFromMindfulSession:](self, "_createEventFromMindfulSession:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13)));
        v15 = v14;
        if (!v30[5]
          || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate")),
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "startDate")),
              v18 = objc_msgSend(v16, "isAfterDate:", v17),
              v17,
              v16,
              v18))
        {
          objc_msgSend(v9, "addObject:", v15);
        }

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v11);
  }

  v19 = self->_eventStore;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2;
  v22[3] = &unk_1002ADA40;
  v20 = v21;
  v23 = v20;
  -[MOEventStore storeEvents:CompletionHandler:](v19, "storeEvents:CompletionHandler:", v9, v22);

  _Block_object_dispose(&v29, 8);
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)_setDynamicProperties:(id)a3 mindfulSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v6, "setAppBundle:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceRevision"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  objc_msgSend(v6, "setFromFirstParty:", objc_msgSend(v10, "_hasFirstPartyBundleID"));

}

- (void)fetchAndSaveMindfulSessionsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOHealthKitManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002B2348;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOHealthKitManager _fetchMindfulSessionBetweenStartDate:EndDate:CompletionHandler:](v9, "_fetchMindfulSessionBetweenStartDate:EndDate:CompletionHandler:", a3, a4, v8);

}

void __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no mindful sessions fetched for saving", buf, 2u);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v6, &__NSDictionary0__struct);
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "save %lu mindful sessions as event into database", buf, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke_306;
    v13[3] = &unk_1002ADA40;
    v12 = *(void **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v12, "_saveMindfulSessions:handler:", v5, v13);

  }
}

uint64_t __82__MOHealthKitManager_fetchAndSaveMindfulSessionsBetweenStartDate_EndDate_handler___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchUserBiologicalSexWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __56__MOHealthKitManager_fetchUserBiologicalSexWithHandler___block_invoke;
  v7[3] = &unk_1002B0C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

id __56__MOHealthKitManager_fetchUserBiologicalSexWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchUserBiologicalSexWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchUserBiologicalSexWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore"));
    v13 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "biologicalSexWithError:", &v13));
    v7 = v13;

    if (v7)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_opt_class(self, v10);
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        v16 = 2112;
        v17 = v7;
        v12 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, Unable to access biological sex due to error: %@", buf, 0x16u);

      }
      v4[2](v4, 0, v7);
    }
    else
    {
      ((void (**)(id, void *, id))v4)[2](v4, v6, 0);
    }

  }
}

- (void)fetchUserAgeWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __46__MOHealthKitManager_fetchUserAgeWithHandler___block_invoke;
  v7[3] = &unk_1002B0C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

id __46__MOHealthKitManager_fetchUserAgeWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchUserAgeWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchUserAgeWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager healthStore](self, "healthStore"));
    v23 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateOfBirthComponentsWithError:", &v23));
    v7 = v23;

    if (v7)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_opt_class(self, v10);
        *(_DWORD *)buf = 138412546;
        v25 = v11;
        v26 = 2112;
        v27 = v7;
        v12 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, Unable to access age due to error: %@", buf, 0x16u);

      }
      v4[2](v4, 0, v7);
    }
    else if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateFromComponents:", v6));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:toDate:options:", 4, v14, v15, 0));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "year")));
      ((void (**)(id, void *, id))v4)[2](v4, v17, 0);

    }
    else
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = (void *)objc_opt_class(self, v20);
        *(_DWORD *)buf = 138412290;
        v25 = v21;
        v22 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@, dateOfBirthComponents is nil.", buf, 0xCu);

      }
      v4[2](v4, 0, 0);
    }

  }
}

+ (id)convertBiologicalSexObjToString:(id)a3
{
  id v3;

  if (!a3)
    return 0;
  v3 = objc_msgSend(a3, "biologicalSex");
  if ((unint64_t)v3 > 3)
    return 0;
  else
    return *(&off_1002B6488 + (_QWORD)v3);
}

- (void)fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__MOHealthKitManager_fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __90__MOHealthKitManager_fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchWorkoutEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MOHealthKitManager *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
  v29[0] = v14;
  v29[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v17));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002B6268;
  v27 = v11;
  v28 = v12;
  v24 = v18;
  v25 = self;
  v26 = v10;
  v19 = v11;
  v20 = v10;
  v21 = v18;
  v22 = v12;
  -[MOHealthKitManager _fetchWorkoutsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchWorkoutsBetweenStartDate:EndDate:CompletionHandler:", v20, v19, v23);

}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id os_log;
  NSObject *v9;
  MORehydrationMetrics *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  int8x16_t v21;
  _QWORD block[4];
  int8x16_t v23;
  id v24;
  id v25;
  id v26;
  NSMutableDictionary *v27;
  id v28;
  uint8_t *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetching workouts from source hit error", buf, 2u);
    }

    (*((void (**)(void))a1[8] + 2))();
    v10 = [MORehydrationMetrics alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v12 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v10, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 2, 1, 0, v11, objc_msgSend(a1[4], "count"), 3, (double)(int)objc_msgSend(a1[4], "count"), 0.0);

    v45 = 0;
    -[NSObject submitMetricsWithError:](v12, "submitMetricsWithError:", &v45);
  }
  else
  {
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__41;
    v43 = __Block_byref_object_dispose__41;
    v44 = 0;
    v15 = a1[4];
    v14 = a1[5];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_324;
    v36[3] = &unk_1002ADC00;
    v38 = buf;
    v16 = v13;
    v37 = v16;
    objc_msgSend(v14, "_rehydrateStoredEvents:fromWorkouts:handler:", v15, v5, v36);
    dispatch_group_enter(v16);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__41;
    v34[4] = __Block_byref_object_dispose__41;
    v35 = 0;
    v18 = a1[4];
    v17 = a1[5];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v31[3] = &unk_1002ADC00;
    v33 = v34;
    v12 = v16;
    v32 = v12;
    objc_msgSend(v17, "_createNewEventsFromWorkouts:storedEvents:handler:", v5, v18, v31);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002B6440;
    v21 = *((int8x16_t *)a1 + 2);
    v20 = (id)v21.i64[0];
    v23 = vextq_s8(v21, v21, 8uLL);
    v24 = v5;
    v25 = a1[6];
    v26 = a1[7];
    v29 = buf;
    v30 = v34;
    v27 = v7;
    v28 = a1[8];
    dispatch_group_notify(v12, v19, block);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_324(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__MOHealthKitManager__fetchWorkoutEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id os_log;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_findUnrehydratedEventsWithStoredEvents:workouts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count");
    v9 = objc_msgSend(v2, "count");
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v13 = 138413570;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated workout events count, %lu, new workout events counts, %lu, unrehydrated workout events count, %lu, stored workout events count, %lu", (uint8_t *)&v13, 0x3Eu);
  }

  if (v2)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v2, CFSTR("unrehydratedEvents"));
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v11)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v11, CFSTR("newEvents"));
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v12)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v12, CFSTR("rehydratedEvents"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

- (void)fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOHealthKitManager_fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __94__MOHealthKitManager_fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStateOfMindEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchStateOfMindEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MOHealthKitManager *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
  v29[0] = v14;
  v29[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v17));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002B6268;
  v27 = v11;
  v28 = v12;
  v24 = v18;
  v25 = self;
  v26 = v10;
  v19 = v11;
  v20 = v10;
  v21 = v18;
  v22 = v12;
  -[MOHealthKitManager _fetchStateOfMindBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchStateOfMindBetweenStartDate:EndDate:CompletionHandler:", v20, v19, v23);

}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id os_log;
  NSObject *v9;
  MORehydrationMetrics *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  int8x16_t v21;
  _QWORD block[4];
  int8x16_t v23;
  id v24;
  id v25;
  id v26;
  NSMutableDictionary *v27;
  id v28;
  uint8_t *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetching state of mind from source hit error", buf, 2u);
    }

    (*((void (**)(void))a1[8] + 2))();
    v10 = [MORehydrationMetrics alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v12 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v10, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 24, 1, 0, v11, objc_msgSend(a1[4], "count"), 3, (double)(int)objc_msgSend(a1[4], "count"), 0.0);

    v45 = 0;
    -[NSObject submitMetricsWithError:](v12, "submitMetricsWithError:", &v45);
  }
  else
  {
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__41;
    v43 = __Block_byref_object_dispose__41;
    v44 = 0;
    v15 = a1[4];
    v14 = a1[5];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_325;
    v36[3] = &unk_1002ADC00;
    v38 = buf;
    v16 = v13;
    v37 = v16;
    objc_msgSend(v14, "_rehydrateStoredEvents:fromStateOfMind:handler:", v15, v5, v36);
    dispatch_group_enter(v16);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__41;
    v34[4] = __Block_byref_object_dispose__41;
    v35 = 0;
    v18 = a1[4];
    v17 = a1[5];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v31[3] = &unk_1002ADC00;
    v33 = v34;
    v12 = v16;
    v32 = v12;
    objc_msgSend(v17, "_createNewEventsFromStateOfMind:storedEvents:handler:", v5, v18, v31);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002B6440;
    v21 = *((int8x16_t *)a1 + 2);
    v20 = (id)v21.i64[0];
    v23 = vextq_s8(v21, v21, 8uLL);
    v24 = v5;
    v25 = a1[6];
    v26 = a1[7];
    v29 = buf;
    v30 = v34;
    v27 = v7;
    v28 = a1[8];
    dispatch_group_notify(v12, v19, block);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_325(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __95__MOHealthKitManager__fetchStateOfMindEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id os_log;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_findUnrehydratedEventsWithStoredEvents:stateOfMind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count");
    v9 = objc_msgSend(v2, "count");
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v13 = 138413570;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated state of mind events count, %lu, new state of mind events counts, %lu, unrehydrated state of mind events count, %lu, stored state of mind events count, %lu", (uint8_t *)&v13, 0x3Eu);
  }

  if (v2)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v2, CFSTR("unrehydratedEvents"));
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v11)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v11, CFSTR("newEvents"));
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v12)
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v12, CFSTR("rehydratedEvents"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

- (void)_createEventsFromWorkout:(id)a3 handler:(id)a4
{
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id os_log;
  NSObject *v18;
  id v19;
  id v20;
  id obj;
  _QWORD block[4];
  id v23;
  uint8_t *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  NSObject *v28;
  uint8_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  NSMutableArray *v39;
  _BYTE v40[128];

  v19 = a3;
  v20 = a4;
  if (objc_msgSend(v19, "count"))
  {
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__41;
    v38 = __Block_byref_object_dispose__41;
    v39 = objc_opt_new(NSMutableArray);
    v6 = dispatch_group_create();
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.health.workout.event.create", v8);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v19;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v12);
          dispatch_group_enter(v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createEventFromWorkout:](self, "_createEventFromWorkout:", v13));
          -[MOHealthKitManager _setDynamicProperties:workout:](self, "_setDynamicProperties:workout:", v14, v13);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke;
          v25[3] = &unk_1002B6378;
          v15 = v14;
          v26 = v15;
          v27 = v9;
          v29 = buf;
          v28 = v6;
          -[MOHealthKitManager _fetchLocationsFrom:handler:](self, "_fetchLocationsFrom:handler:", v13, v25);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v10);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[MOHealthKitManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_3;
    block[3] = &unk_1002B6468;
    v24 = buf;
    v23 = v20;
    dispatch_group_notify(v6, v16, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v18 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "no workouts for creating events", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

void __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setWorkoutLocationRoute:", a2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_2;
  v4[3] = &unk_1002B2A98;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

id __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__MOHealthKitManager__createEventsFromWorkout_handler___block_invoke_3(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  int v6;
  id v7;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "health: new workout count, %lu", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createEventsFromStateOfMind:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, NSMutableArray *, _QWORD);
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id os_log;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (void (**)(id, NSMutableArray *, _QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_new(NSMutableArray);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOHealthKitManager _createEventFromStateOfMind:](self, "_createEventFromStateOfMind:", v14, (_QWORD)v21));
          -[MOHealthKitManager _setDynamicProperties:stateOfMind:](self, "_setDynamicProperties:stateOfMind:", v15, v14);
          -[NSMutableArray addObject:](v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v11);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = -[NSMutableArray count](v8, "count");
      *(_DWORD *)buf = 134217984;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "health: new state of mind count, %lu", buf, 0xCu);
    }

    v7[2](v7, v8, 0);
  }
  else
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "no state of mind data for creating events", buf, 2u);
    }

    v7[2](v7, 0, 0);
  }

}

- (void)_createNewEventsFromWorkouts:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  NSObject *v31;
  id os_log;
  NSObject *v33;
  MOHealthKitManager *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[8];
  _BYTE v51[128];
  _BYTE v52[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v34 = self;
      v35 = v10;
      v37 = v8;
      v11 = objc_opt_new(NSMutableSet);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v36 = v9;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierFromProvider"));

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierFromProvider"));
              -[NSMutableSet addObject:](v11, "addObject:", v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v14);
      }

      v20 = objc_opt_new(NSMutableArray);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v21 = v37;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
            v29 = -[NSMutableSet containsObject:](v11, "containsObject:", v28);

            if ((v29 & 1) == 0)
              -[NSMutableArray addObject:](v20, "addObject:", v26);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v23);
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke_2;
      v38[3] = &unk_1002ADFD8;
      v10 = v35;
      v39 = v35;
      -[MOHealthKitManager _createEventsFromWorkout:handler:](v34, "_createEventsFromWorkout:handler:", v20, v38);

      v9 = v36;
      v8 = v37;
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v33 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "no stored events to check for creating new workout events", buf, 2u);
      }

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke;
      v48[3] = &unk_1002ADFD8;
      v49 = v10;
      -[MOHealthKitManager _createEventsFromWorkout:handler:](self, "_createEventsFromWorkout:handler:", v8, v48);

    }
  }
  else
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "no workouts for creating new workout events", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

uint64_t __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__MOHealthKitManager__createNewEventsFromWorkouts_storedEvents_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createNewEventsFromStateOfMind:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  NSObject *v31;
  id os_log;
  NSObject *v33;
  MOHealthKitManager *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[8];
  _BYTE v51[128];
  _BYTE v52[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v34 = self;
      v35 = v10;
      v37 = v8;
      v11 = objc_opt_new(NSMutableSet);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v36 = v9;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierFromProvider"));

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierFromProvider"));
              -[NSMutableSet addObject:](v11, "addObject:", v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v14);
      }

      v20 = objc_opt_new(NSMutableArray);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v21 = v37;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
            v29 = -[NSMutableSet containsObject:](v11, "containsObject:", v28);

            if ((v29 & 1) == 0)
              -[NSMutableArray addObject:](v20, "addObject:", v26);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v23);
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke_2;
      v38[3] = &unk_1002ADFD8;
      v10 = v35;
      v39 = v35;
      -[MOHealthKitManager _createEventsFromStateOfMind:handler:](v34, "_createEventsFromStateOfMind:handler:", v20, v38);

      v9 = v36;
      v8 = v37;
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v33 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "no stored events to check for creating new state of mind events", buf, 2u);
      }

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke;
      v48[3] = &unk_1002ADFD8;
      v49 = v10;
      -[MOHealthKitManager _createEventsFromStateOfMind:handler:](self, "_createEventsFromStateOfMind:handler:", v8, v48);

    }
  }
  else
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "no state of mind data for creating new state of mind events", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

uint64_t __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__MOHealthKitManager__createNewEventsFromStateOfMind_storedEvents_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 workouts:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id os_log;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  id v34;
  NSObject *v35;
  id v36;
  id v38;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_opt_new(NSMutableSet);
      v8 = objc_alloc_init((Class)NSMutableArray);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v38 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "UUID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
            -[NSMutableSet addObject:](v7, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v11);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v5;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifierFromProvider"));
            v23 = -[NSMutableSet containsObject:](v7, "containsObject:", v22);

            if ((v23 & 1) == 0)
            {
              objc_msgSend(v21, "setRehydrationFailCount:", (char *)objc_msgSend(v21, "rehydrationFailCount") + 1);
              objc_msgSend(v8, "addObject:", v21);
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        }
        while (v18);
      }

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v25 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134217984;
        v54 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "health: unrehydrated workout count, %lu", buf, 0xCu);
      }

      v6 = v38;
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v29 = v5;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v31; k = (char *)k + 1)
          {
            if (*(_QWORD *)v48 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k), "setRehydrationFailCount:", (char *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k), "rehydrationFailCount") + 1);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v31);
      }

      v34 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(v29, "count");
        *(_DWORD *)buf = 134217984;
        v54 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "no workouts fetched, so all stored workout events are unrehydrated count, %lu", buf, 0xCu);
      }

      v8 = v29;
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no stored workout events for finding unrehydrated events", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 stateOfMind:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id os_log;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  id v34;
  NSObject *v35;
  id v36;
  id v38;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_opt_new(NSMutableSet);
      v8 = objc_alloc_init((Class)NSMutableArray);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v38 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "UUID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
            -[NSMutableSet addObject:](v7, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v11);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v5;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifierFromProvider"));
            v23 = -[NSMutableSet containsObject:](v7, "containsObject:", v22);

            if ((v23 & 1) == 0)
            {
              objc_msgSend(v21, "setRehydrationFailCount:", (char *)objc_msgSend(v21, "rehydrationFailCount") + 1);
              objc_msgSend(v8, "addObject:", v21);
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        }
        while (v18);
      }

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v25 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134217984;
        v54 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "health: unrehydrated state of mind count, %lu", buf, 0xCu);
      }

      v6 = v38;
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v29 = v5;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v31; k = (char *)k + 1)
          {
            if (*(_QWORD *)v48 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k), "setRehydrationFailCount:", (char *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k), "rehydrationFailCount") + 1);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v31);
      }

      v34 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(v29, "count");
        *(_DWORD *)buf = 134217984;
        v54 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "no state of mind data fetched, so all stored state of mind events are unrehydrated count, %lu", buf, 0xCu);
      }

      v8 = v29;
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no stored state of mind events for finding unrehydrated events", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
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
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __79__MOHealthKitManager__fetchWorkoutsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchworkouts hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__MOHealthKitManager__fetchStateOfMindBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchStateofMind hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__MOHealthKitManager__fetchWorkoutRoutes_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch workout routes hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__MOHealthKitManager__fetchWorkoutRouteLocations_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch workout route locations hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__MOHealthKitManager__saveWorkouts_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving workout as event into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createQueryBasedonEvents:withPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "event category does not match with health data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __49__MOHealthKitManager__rehydrateWorkouts_handler___block_invoke_288_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch health data hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydrateStoredEvents:fromWorkouts:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no inputEvents with non-nil identifierFromProvider for rehydrating workout events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydrateStoredEvents:fromStateOfMind:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no input events for rehydrating state of mind events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydrateStoredEvents:fromStateOfMind:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no mindful sessions for rehydrating state of mind events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydrateStoredEvents:fromMindfulSession:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no input events for rehydrating mindful session events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydrateStoredEvents:fromMindfulSession:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no mindful sessions for rehydrating mindful session events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(*(id *)(a2 + 32), "workoutActivityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "startDate"));
  objc_msgSend(*(id *)(a2 + 32), "duration");
  v9 = 134218754;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2048;
  v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%lu workout routes were fetched for event type %d starting %@ duration %.1f", (uint8_t *)&v9, 0x26u);

}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v4 = objc_msgSend(*(id *)(a1 + 48), "workoutActivityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "startDate"));
  objc_msgSend(*(id *)(a1 + 48), "duration");
  v7[0] = 67109634;
  v7[1] = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "no workout route locations were fetched for event type %d starting %@ duration %.1f", (uint8_t *)v7, 0x1Cu);

}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_2_cold_2(id *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "count");
  objc_msgSend(*(id *)(a2 + 40), "count");
  objc_msgSend(*(id *)(a2 + 48), "workoutActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 48), "startDate"));
  objc_msgSend(*(id *)(a2 + 48), "duration");
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_7_3((void *)&_mh_execute_header, v4, v5, "%lu downsampled route locations were fetched, original size %lu for event type %d starting %@ duration %.1f", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8_2();
}

void __50__MOHealthKitManager__fetchLocationsFrom_handler___block_invoke_300_cold_1(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "count");
  objc_msgSend(*(id *)(a2 + 32), "count");
  objc_msgSend(*(id *)(a2 + 40), "workoutActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 40), "startDate"));
  objc_msgSend(*(id *)(a2 + 40), "duration");
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_7_3((void *)&_mh_execute_header, v4, v5, "Totally %lu downsampled locations were fetched in %lu routes for event type %d starting %@ duration %.1f", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8_2();
}

void __61__MOHealthKitManager__updateWorkoutsDeletedAtSource_handler___block_invoke_303_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to update invalid health data events, error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__MOHealthKitManager__fetchMindfulSessionBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch mindful session hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__MOHealthKitManager__saveMindfulSessions_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving mindful session as event into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
