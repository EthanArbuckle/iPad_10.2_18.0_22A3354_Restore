@implementation MOAggregationManager

- (MOAggregationManager)initWithUniverse:(id)a3
{
  id v5;
  MOAggregationManager *v6;
  MOAggregationManager *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  MOEventBundleRanking *eventBundleRanking;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOAggregationManager;
  v6 = -[MOAggregationManager init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    v9 = (objc_class *)objc_opt_class(MOEventBundleRanking, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v11));
    eventBundleRanking = v7->_eventBundleRanking;
    v7->_eventBundleRanking = (MOEventBundleRanking *)v12;

  }
  return v7;
}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id os_log;
  NSObject *v8;
  void *v9;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MOAggregationManager aggregateBundles:withParameters:handler:].cold.1();

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAggregationManager.m"), 36, CFSTR("Use the derived class (in %s:%d)"), "-[MOAggregationManager aggregateBundles:withParameters:handler:]", 36);

}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id os_log;
  NSObject *v9;
  void *v10;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MOAggregationManager aggregateBundles:withParameters:granularity:handler:].cold.1();

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAggregationManager.m"), 44, CFSTR("Use the derived class (in %s:%d)"), "-[MOAggregationManager aggregateBundles:withParameters:granularity:handler:]", 44);

}

- (id)filterEventBundlesEligibleForSummarization:(id)a3
{
  id v4;
  void *v5;
  id os_log;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v15;

  v4 = objc_msgSend(a3, "mutableCopy");
  -[MOEventBundleRanking generateBundleRanking:withMinRecommendedBundleCountRequirement:](self->_eventBundleRanking, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Raw input eventBundles count, %lu", buf, 0xCu);
  }

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("rankingDictionary.isEligibleForTimeContextSummarization == %@"), &__kCFBooleanTrue));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v8));

  v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Filtered Input eventBundles count by isEligibleForTimeContextSummarization: %lu.", buf, 0xCu);
  }

  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_72);
  return v9;
}

void __67__MOAggregationManager_filterEventBundlesEligibleForSummarization___block_invoke(id a1, MOEventBundle *a2, unint64_t a3, BOOL *a4)
{
  MOEventBundle *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v4, "action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v4, "rankingDictionary"));
    v14 = 138413314;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "startDate:%@, endDate:%@, action:%@, placee:%@, rankingDict:%@", (uint8_t *)&v14, 0x34u);

  }
}

void __67__MOAggregationManager_filterEventBundlesEligibleForSummarization___block_invoke_71(id a1, MOEventBundle *a2, unint64_t a3, BOOL *a4)
{
  MOEventBundle *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v4, "action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v4, "rankingDictionary"));
    v14 = 138413314;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "startDate:%@, endDate:%@, action:%@, place:%@, rankingDict:%@", (uint8_t *)&v14, 0x34u);

  }
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (MOEventBundleRanking)eventBundleRanking
{
  return self->_eventBundleRanking;
}

- (void)setEventBundleRanking:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleRanking, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleRanking, 0);
  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)aggregateBundles:withParameters:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)aggregateBundles:withParameters:granularity:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
