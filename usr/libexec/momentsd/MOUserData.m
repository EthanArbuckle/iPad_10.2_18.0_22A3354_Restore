@implementation MOUserData

- (MOUserData)initWithEventManager:(id)a3
{
  id v5;
  MOUserData *v6;
  MOUserData *v7;
  NSNumber *stateIHA;
  NSNumber *age;
  NSNumber *gender;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;

  v5 = a3;
  v6 = -[MOUserData initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventManager, a3);
    stateIHA = v7->_stateIHA;
    v7->_stateIHA = (NSNumber *)&__kCFBooleanFalse;

    age = v7->_age;
    v7->_age = (NSNumber *)&off_1002D8E70;

    gender = v7->_gender;
    v7->_gender = (NSNumber *)&off_1002D8E70;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.momentsd.MOUserData", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (MOUserData)initWithLoggingEnabled:(BOOL)a3
{
  MOUserData *v3;
  uint64_t v4;
  MOUserData *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v45.receiver = self;
  v45.super_class = (Class)MOUserData;
  v3 = -[MOMetric initWithLoggingEnabled:](&v45, "initWithLoggingEnabled:", a3);
  v5 = v3;
  if (v3)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(v3, v4), "BOOLeanKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v9);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = objc_msgSend((id)objc_opt_class(v5, v14), "integerKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_1002D8E70, v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v18);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = objc_msgSend((id)objc_opt_class(v5, v23), "bucketedKeys", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", &off_1002D8E70, v30);

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v27);
    }

  }
  return v5;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("IHA_state"), 0);
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("age"), 0);
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("ageBucketed"), CFSTR("gender"), 0);
}

+ (id)supportedMetricKeys
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "integerKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));

  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "BOOLeanKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v11 = objc_msgSend((id)objc_opt_class(a1, v10), "bucketedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)MOAnalyticsEventDemographics;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[MOUserData setValues](self, "setValues");
  v6.receiver = self;
  v6.super_class = (Class)MOUserData;
  return -[MOMetric submitMetricsWithError:](&v6, "submitMetricsWithError:", a3);
}

- (void)submitUserDataWithCompletionHandler:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOUserData submitUserDataWithCompletionHandler:].cold.1();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOUserData.m"), 92, CFSTR("Invalid parameter not satisfying: completion (in %s:%d)"), "-[MOUserData submitUserDataWithCompletionHandler:]", 92);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[MOUserData queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke;
  block[3] = &unk_1002B0C18;
  block[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(v9, block);

}

void __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1002B0BF0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_fetchUserDataWithCompletionHandler:", v2);

}

void __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  objc_super v11;
  id v12;
  uint8_t buf[16];

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setValues");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Submitting age/biologicalSex to CoreAnalytics gated by IHA.", buf, 2u);
  }

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)MOUserData;
  v12 = 0;
  objc_msgSendSuper2(&v11, "submitMetricsWithError:", &v12);
  v10 = v12;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchUserDataWithCompletionHandler:(id)a3
{
  uint64_t v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[16];
  _QWORD block[5];
  id v17;

  v6 = a3;
  if (!v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOUserData _fetchUserDataWithCompletionHandler:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOUserData.m"), 107, CFSTR("Invalid parameter not satisfying: completion (in %s:%d)"), "-[MOUserData _fetchUserDataWithCompletionHandler:]", 107);

  }
  if (self->_eventManager
    && objc_opt_class(MCProfileConnection, v5)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection")),
        v11 = objc_msgSend(v10, "isHealthDataSubmissionAllowed"),
        v10,
        v11))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MOUserData queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke;
    block[3] = &unk_1002B0C18;
    block[4] = self;
    v17 = v6;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "no IHA permission", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  id v59;
  _QWORD v60[4];
  NSObject *v61;
  uint8_t *v62;
  uint64_t *v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  uint8_t buf[8];
  uint8_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  objc_msgSend(*(id *)(a1 + 32), "setStateIHA:", &__kCFBooleanTrue);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v68 = buf;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__16;
  v71 = __Block_byref_object_dispose__16;
  v72 = 0;
  v64 = 0;
  v65[0] = &v64;
  v65[1] = 0x3032000000;
  v65[2] = __Block_byref_object_copy__16;
  v65[3] = __Block_byref_object_dispose__16;
  v66 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getHealthKitManager"));

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_80;
  v60[3] = &unk_1002B0C40;
  v7 = v4;
  v61 = v7;
  v62 = buf;
  v63 = &v64;
  objc_msgSend(v6, "fetchUserBiologicalSexWithHandler:", v60);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOUserData.m", 128, "-[MOUserData _fetchUserDataWithCompletionHandler:]_block_invoke_2"));
  v59 = 0;
  v9 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v7, &v59, v8);
  v10 = v59;
  v11 = v59;
  if (!v9)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  if (*(_QWORD *)(v65[0] + 40))
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5((uint64_t)v65, v15, v16, v17, v18, v19, v20, v21);

  }
  if (v11)
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_4();

    objc_storeStrong((id *)(v65[0] + 40), v10);
  }
  v24 = (void *)*((_QWORD *)v68 + 5);
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v24, "biologicalSex")));
    objc_msgSend(*(id *)(a1 + 32), "setGender:", v25);

  }
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__16;
  v57 = __Block_byref_object_dispose__16;
  v58 = 0;
  v50 = 0;
  v51[0] = &v50;
  v51[1] = 0x3032000000;
  v51[2] = __Block_byref_object_copy__16;
  v51[3] = __Block_byref_object_dispose__16;
  v52 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_89;
  v46[3] = &unk_1002B0C68;
  v26 = dispatch_semaphore_create(0);
  v47 = v26;
  v48 = &v53;
  v49 = &v50;
  objc_msgSend(v6, "fetchUserAgeWithHandler:", v46);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOUserData.m", 157, "-[MOUserData _fetchUserDataWithCompletionHandler:]_block_invoke_2"));
  v45 = 0;
  v28 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v26, &v45, v27);
  v29 = v45;
  v30 = v45;
  if (!v28)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  if (*(_QWORD *)(v51[0] + 40))
  {
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2((uint64_t)v51, v34, v35, v36, v37, v38, v39, v40);

  }
  if (v30)
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_1();

    objc_storeStrong((id *)(v51[0] + 40), v29);
  }
  v43 = (void *)v54[5];
  if (v43)
  {
    v44 = objc_msgSend(v43, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setAge:", v44);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(buf, 8);

}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_80(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_89(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setValues
{
  NSNumber *stateIHA;
  void *v4;
  NSNumber *age;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSNumber *gender;
  id v12;

  stateIHA = self->_stateIHA;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", stateIHA, CFSTR("IHA_state"));

  age = self->_age;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", age, CFSTR("age"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("age")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v8, &off_1002DC6E0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("ageBucketed"));

  gender = self->_gender;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", gender, CFSTR("gender"));

}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSNumber)gender
{
  return self->_gender;
}

- (void)setGender:(id)a3
{
  objc_storeStrong((id *)&self->_gender, a3);
}

- (NSNumber)stateIHA
{
  return self->_stateIHA;
}

- (void)setStateIHA:(id)a3
{
  objc_storeStrong((id *)&self->_stateIHA, a3);
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_stateIHA, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_age, 0);
}

- (void)submitUserDataWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: completion (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchUserDataWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: completion (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching age from health kit, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "fetch error occurred during fetching age from health kit, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Semaphore wait failed with context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching gender from health kit, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "fetch error occurred during fetching gender from health kit, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
