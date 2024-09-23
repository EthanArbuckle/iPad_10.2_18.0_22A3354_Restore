@implementation MOSummarizationManager

- (MOSummarizationManager)init
{
  MOSummarizationManager *v2;
  uint64_t v3;
  MOSummarizationManager *v4;
  objc_class *v5;
  NSString *v6;
  id v7;
  const char *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MOSummarizationManager;
  v2 = -[MOSummarizationManager init](&v14, "init");
  v4 = v2;
  if (v2)
  {
    v5 = (objc_class *)objc_opt_class(v2, v3);
    v6 = NSStringFromClass(v5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create(v8, v10);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v11;

  }
  return v4;
}

- (MOSummarizationManager)initWithUniverse:(id)a3
{
  id v5;
  MOSummarizationManager *v6;
  MOSummarizationManager *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  MODaemonUniverse *fUniverse;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  MOConfigurationManager *configurationManager;
  MOSummarizationParameters *v24;
  MOSummarizationParameters *parameters;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  MOEventBundleRanking *eventBundleRanking;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MOSummarizationManager;
  v6 = -[MOSummarizationManager init](&v33, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    v9 = (objc_class *)objc_opt_class(v7, v8);
    v10 = NSStringFromClass(v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v15;

    fUniverse = v7->_fUniverse;
    v19 = (objc_class *)objc_opt_class(MOConfigurationManager, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v21));
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v22;

    v24 = -[MOSummarizationParameters initWithConfigurationManager:]([MOSummarizationParameters alloc], "initWithConfigurationManager:", v7->_configurationManager);
    parameters = v7->_parameters;
    v7->_parameters = v24;

    v27 = (objc_class *)objc_opt_class(MOEventBundleRanking, v26);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v29));
    eventBundleRanking = v7->_eventBundleRanking;
    v7->_eventBundleRanking = (MOEventBundleRanking *)v30;

  }
  return v7;
}

- (void)aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "aggregate eventBundles count, %lu", buf, 0xCu);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[MOSummarizationManager queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke;
  v17[3] = &unk_1002ADA68;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

void __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2;
  v4[3] = &unk_1002ADFD8;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_aggregateEventBundles:withAggregtaionDateInterval:handler:", v2, v3, v4);

}

uint64_t __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5
{
  id v8;
  void *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  MODominantBundleCreationManager *v24;
  void *v25;
  MODominantBundleCreationManager *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  MOSummarizationManager *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _BYTE *v49;
  uint8_t v50[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v8 = a3;
  v41 = a4;
  v40 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager parameters](self, "parameters"));
    objc_msgSend(v9, "setAggregationDateInterval:", v41);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "startDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "endDate"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "aggregation date interval, start date: %@, end date: %@", buf, 0x16u);

    }
    v38 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", &off_1002D9200, &off_1002D9218, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType in %@"), v38));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v37));
    v14 = objc_msgSend(v8, "mutableCopy");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v57 = __Block_byref_object_copy__22;
    v58 = __Block_byref_object_dispose__22;
    v59 = objc_msgSend(v39, "mutableCopy");
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v14, "removeObjectsInArray:", v39);
    v16 = objc_autoreleasePoolPush();
    -[MOEventBundleRanking generateBundleRanking:withMinRecommendedBundleCountRequirement:](self->_eventBundleRanking, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", v14, 0);
    objc_autoreleasePoolPop(v16);
    v17 = objc_msgSend(v14, "count");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu"), CFSTR("interfaceType"), 13));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObjectsFromArray:", v18);
    objc_msgSend(v14, "removeObjectsInArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.%K <= %lu"), CFSTR("place"), CFSTR("placeType"), 100));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v19));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v21));

    v23 = v20;
    v24 = [MODominantBundleCreationManager alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager fUniverse](self, "fUniverse"));
    v26 = -[MODominantBundleCreationManager initWithUniverse:](v24, "initWithUniverse:", v25);

    v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v50 = 134218496;
      v51 = v15;
      v52 = 2048;
      v53 = v17;
      v54 = 2048;
      v55 = objc_msgSend(v39, "count");
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Summarization: eventBundles, %lu, dominantBundling inputs, %lu, not summarize, %lu", v50, 0x20u);
    }

    v29 = objc_msgSend(v14, "copy");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager parameters](self, "parameters"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke;
    v42[3] = &unk_1002B2BC8;
    v49 = buf;
    v31 = v14;
    v43 = v31;
    v44 = self;
    v45 = v23;
    v32 = v22;
    v46 = v32;
    v33 = v45;
    v47 = v33;
    v48 = v40;
    -[MODominantBundleCreationManager processBundlesForCreatingDominantBundles:withParameters:handler:](v26, "processBundlesForCreatingDominantBundles:withParameters:handler:", v29, v30, v42);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "No eventBundle to be aggregated", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v40 + 2))(v40, 0, 0);
  }

}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _BYTE *v13;
  _BYTE *v14;
  MOFineGranularityAggregationManager *v15;
  void *v16;
  MOFineGranularityAggregationManager *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int64_t v37;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObjectsFromArray:", v3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
    *(_DWORD *)buf = 134217984;
    v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Summarization:dominant bundle result count, %lu", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("isAggregatedAndSuppressed")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v7));
  v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = objc_msgSend(v8, "count");
    v13 = objc_msgSend(v3, "count");
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134218496;
    v33 = v11;
    v34 = 2048;
    v35 = v12;
    v36 = 2048;
    v37 = v13 - v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Summarization: Dominant bundle process, input, %lu, output, %lu, supressed, %lu", buf, 0x20u);
  }

  v15 = [MOFineGranularityAggregationManager alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fUniverse"));
  v17 = -[MOFineGranularityAggregationManager initWithUniverse:](v15, "initWithUniverse:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "parameters"));
  v23[0] = _NSConcreteStackBlock;
  v23[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_272;
  v23[3] = &unk_1002B2BA0;
  v31 = *(_QWORD *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(void **)(a1 + 48);
  v24 = v8;
  v25 = v19;
  v23[1] = 3221225472;
  v26 = v20;
  v27 = v3;
  v28 = *(id *)(a1 + 56);
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 72);
  v21 = v3;
  v22 = v8;
  -[MOFineGranularityAggregationManager aggregateBundles:withParameters:handler:](v17, "aggregateBundles:withParameters:handler:", v22, v18, v23);

}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_272(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  MOCoarseGranularityAggregationManager *v10;
  void *v11;
  MOCoarseGranularityAggregationManager *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObjectsFromArray:", v3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218240;
    v27 = v6;
    v28 = 2048;
    v29 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Summarization: Fine granularity aggregation process, input, %lu, output, %lu", buf, 0x16u);
  }

  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    *(_DWORD *)buf = 134217984;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Summarization:fine granularity result count, %lu", buf, 0xCu);
  }

  v10 = [MOCoarseGranularityAggregationManager alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fUniverse"));
  v12 = -[MOCoarseGranularityAggregationManager initWithUniverse:](v10, "initWithUniverse:", v11);

  v13 = *(_QWORD *)(a1 + 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "parameters"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_274;
  v17[3] = &unk_1002B2BA0;
  v25 = *(_QWORD *)(a1 + 88);
  v18 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 40);
  v19 = v15;
  v20 = v16;
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 64);
  v23 = *(id *)(a1 + 72);
  v24 = *(id *)(a1 + 80);
  -[MOCoarseGranularityAggregationManager aggregateBundles:withParameters:handler:](v12, "aggregateBundles:withParameters:handler:", v13, v14, v17);

}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *k;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  id v66;
  id v67;
  NSObject *v68;
  void *m;
  void *v70;
  NSMutableArray *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  void *v80;
  void *v81;
  void *v82;
  NSMutableArray *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned int v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  id v99;
  id v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _BYTE *v111;
  _BYTE *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id obj;
  id v141;
  _QWORD v142[5];
  _QWORD v143[5];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t buf[4];
  id v165;
  __int16 v166;
  id v167;
  __int16 v168;
  id v169;
  __int16 v170;
  id v171;
  __int16 v172;
  id v173;
  __int16 v174;
  id v175;
  __int16 v176;
  id v177;
  __int16 v178;
  id v179;
  __int16 v180;
  id v181;
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];

  v5 = a2;
  v126 = a3;
  v127 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObjectsFromArray:", v5);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134218496;
    v165 = v8;
    v166 = 2048;
    v167 = v9;
    v168 = 2048;
    v169 = objc_msgSend(v127, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Summarization: Coarse granularity aggregation process, input, %lu, (container bundles, %lu) output, %lu", buf, 0x20u);
  }

  v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    *(_DWORD *)buf = 134217984;
    v165 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Summarization:coarse granularity result count, %lu", buf, 0xCu);
  }

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "parameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities summarizeMotionActivityBundlesWithSamePlaceName:withParameters:](MOSummarizationUtilities, "summarizeMotionActivityBundlesWithSamePlaceName:withParameters:", v13, v14));

  if (objc_msgSend(v15, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObjectsFromArray:", v15);
  v125 = v15;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v128 = a1;
  v141 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v160, v186, 16);
  if (v141)
  {
    v17 = *(_QWORD *)v161;
    v134 = v16;
    v136 = *(_QWORD *)v161;
    do
    {
      for (i = 0; i != v141; i = (char *)i + 1)
      {
        if (*(_QWORD *)v161 != v17)
          objc_enumerationMutation(v16);
        v19 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)i);
        v20 = objc_autoreleasePoolPush();
        if (objc_msgSend(v19, "bundleSubType") == (id)204)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metaDataForRank"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
          objc_msgSend(v22, "doubleValue");
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "parameters"));
          objc_msgSend(v25, "motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel");
          v27 = v26;

          if (v24 < v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 2));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resources"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "filteredArrayUsingPredicate:", v28));

            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "place"));
            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "place"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
              v34 = v33 != 0;

            }
            else
            {
              v34 = 0;
            }
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "places"));

            if (v35)
            {
              v138 = v28;
              v158 = 0u;
              v159 = 0u;
              v156 = 0u;
              v157 = 0u;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "places"));
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v156, v185, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v157;
                do
                {
                  for (j = 0; j != v38; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v157 != v39)
                      objc_enumerationMutation(v36);
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1)
                                                                                       + 8 * (_QWORD)j), "placeName"));
                    v42 = v41 != 0;

                    v34 |= v42;
                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v156, v185, 16);
                }
                while (v38);
              }

              a1 = v128;
              v16 = v134;
              v28 = v138;
            }
            if (!objc_msgSend(v30, "count") && (v34 & 1) == 0)
              objc_msgSend(v19, "setIsAggregatedAndSuppressed:", 1);

            v17 = v136;
          }
        }
        objc_autoreleasePoolPop(v20);
      }
      v141 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v160, v186, 16);
    }
    while (v141);
  }

  v43 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_26));
  v44 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_280));
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "filteredArrayUsingPredicate:", v43));
  v124 = (void *)v43;
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "filteredArrayUsingPredicate:", v43));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "filteredArrayUsingPredicate:", v44));
  v123 = (void *)v44;
  v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "filteredArrayUsingPredicate:", v44));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v121 = (void *)v46;
  v119 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v46, *(_QWORD *)(a1 + 40), v49);
  v122 = (void *)v45;
  v118 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v45, *(_QWORD *)(a1 + 40), v49);
  v117 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v47, *(_QWORD *)(a1 + 40), v49);
  v116 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v48, *(_QWORD *)(a1 + 40), v49);
  v115 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v47, *(_QWORD *)(a1 + 64), v49);
  v120 = (void *)v48;
  v114 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", v48, *(_QWORD *)(a1 + 64), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

  v113 = objc_msgSend(*(id *)(a1 + 48), "supressCoarseGranularityPropertyOfEventBundles:primaryBundles:bundleMapping:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), v50);
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allKeys"));
  v132 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v152, v184, 16);
  if (v132)
  {
    v131 = *(_QWORD *)v153;
    v129 = v51;
    v130 = v50;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v153 != v131)
          objc_enumerationMutation(v51);
        v133 = v52;
        v53 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", v53));
        v55 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v165 = v53;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "summary trip Bundle : %@ maps to :", buf, 0xCu);
        }

        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v57 = v54;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v148, v183, 16);
        obj = v57;
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v149;
          do
          {
            for (k = 0; k != v59; k = (char *)k + 1)
            {
              if (*(_QWORD *)v149 != v60)
                objc_enumerationMutation(obj);
              v62 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)k);
              v63 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v64 = objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v165 = v62;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "daily trip bundles : %@", buf, 0xCu);
              }

            }
            v57 = obj;
            v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v183, 16);
          }
          while (v59);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "place"));
        v66 = objc_msgSend(v65, "placeType");

        if ((unint64_t)v66 <= 0x65 && objc_msgSend(v57, "count") == (id)1)
        {
          v67 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Maps to one daily trip bundle.", buf, 2u);
          }

          v146 = 0u;
          v147 = 0u;
          v144 = 0u;
          v145 = 0u;
          v135 = v57;
          v139 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v144, v182, 16);
          if (v139)
          {
            v137 = *(_QWORD *)v145;
            do
            {
              for (m = 0; m != v139; m = (char *)m + 1)
              {
                if (*(_QWORD *)v145 != v137)
                  objc_enumerationMutation(v135);
                v70 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)m);
                objc_msgSend(v70, "setIsAggregatedAndSuppressed:", 0);
                objc_msgSend(v53, "setIsAggregatedAndSuppressed:", 1);
                v71 = objc_opt_new(NSMutableArray);
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "subBundleIDs"));
                -[NSMutableArray addObjectsFromArray:](v71, "addObjectsFromArray:", v72);

                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bundleIdentifier"));
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "UUIDString"));
                -[NSMutableArray addObject:](v71, "addObject:", v74);

                v75 = -[NSMutableArray copy](v71, "copy");
                objc_msgSend(v70, "setSubBundleIDs:", v75);

                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subBundleIDs"));
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bundleIdentifier"));
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "UUIDString"));
                v79 = objc_msgSend(v76, "containsObject:", v78);

                if (v79)
                {
                  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subBundleIDs"));
                  v143[0] = _NSConcreteStackBlock;
                  v143[1] = 3221225472;
                  v143[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_283;
                  v143[3] = &unk_1002B2B78;
                  v143[4] = v70;
                  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v143));
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "filteredArrayUsingPredicate:", v81));
                  objc_msgSend(v53, "setSubBundleIDs:", v82);

                }
                v83 = objc_opt_new(NSMutableArray);
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "subSuggestionIDs"));
                -[NSMutableArray addObjectsFromArray:](v83, "addObjectsFromArray:", v84);

                v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "suggestionID"));
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "UUIDString"));
                -[NSMutableArray addObject:](v83, "addObject:", v86);

                v87 = -[NSMutableArray copy](v83, "copy");
                objc_msgSend(v70, "setSubSuggestionIDs:", v87);

                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subSuggestionIDs"));
                v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "suggestionID"));
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "UUIDString"));
                v91 = objc_msgSend(v88, "containsObject:", v90);

                if (v91)
                {
                  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subSuggestionIDs"));
                  v142[0] = _NSConcreteStackBlock;
                  v142[1] = 3221225472;
                  v142[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2_285;
                  v142[3] = &unk_1002B2B78;
                  v142[4] = v70;
                  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v142));
                  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "filteredArrayUsingPredicate:", v93));
                  objc_msgSend(v53, "setSubSuggestionIDs:", v94);

                }
                v95 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v96 = objc_claimAutoreleasedReturnValue(v95);
                if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v165 = v53;
                  _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "suppressed summary trip bundle : %@ ", buf, 0xCu);
                }

                v97 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v98 = objc_claimAutoreleasedReturnValue(v97);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v165 = v70;
                  _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "for daily trip bundle : %@", buf, 0xCu);
                }

              }
              v139 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v144, v182, 16);
            }
            while (v139);
          }

          v51 = v129;
          v50 = v130;
          v57 = obj;
        }

        v52 = v133 + 1;
      }
      while ((id)(v133 + 1) != v132);
      v132 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v152, v184, 16);
    }
    while (v132);
  }

  v99 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v128 + 88) + 8) + 40), "count");
  v100 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v101 = objc_claimAutoreleasedReturnValue(v100);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    v111 = objc_msgSend(*(id *)(v128 + 56), "count");
    v112 = objc_msgSend(*(id *)(v128 + 32), "count");
    *(_DWORD *)buf = 134220032;
    v165 = (id)(v111 - v112);
    v166 = 2048;
    v167 = v117;
    v168 = 2048;
    v169 = v116;
    v170 = 2048;
    v171 = v119;
    v172 = 2048;
    v173 = v118;
    v174 = 2048;
    v175 = v113;
    v176 = 2048;
    v177 = v115;
    v178 = 2048;
    v179 = v114;
    v180 = 2048;
    v181 = v99;
    _os_log_debug_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "Summarization: suppresed by dedupe, %lu, supressed by trip bundles, %lu, supressedOnCoarse by trip bundles, %lu, suppressedWorkout by trip bundles, %lu, suppressedWorkoutOnCoarse by trip bundle, %lu, suppressedTrips, %lu, suppressedOutingsBySummaryTrip, %lu, suppressedSeedBySummaryTrip, %lu, result, %lu", buf, 0x5Cu);
  }

  v102 = objc_autoreleasePoolPush();
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v128 + 48), "eventBundleRanking"));
  objc_msgSend(v103, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v128 + 88) + 8) + 40), 0);

  objc_autoreleasePoolPop(v102);
  v104 = objc_autoreleasePoolPush();
  v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v128 + 48), "removeDuplicateAssetsAccrossMultipleBundleTypes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v128 + 88) + 8) + 40)));
  v106 = *(_QWORD *)(*(_QWORD *)(v128 + 88) + 8);
  v107 = *(void **)(v106 + 40);
  *(_QWORD *)(v106 + 40) = v105;

  objc_autoreleasePoolPop(v104);
  v108 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(v128 + 48), "removeDuplicateAssetsFromMediaBundle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v128 + 88) + 8) + 40));
  objc_autoreleasePoolPop(v108);
  v109 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(v128 + 48), "compressAssetsForThirdPartyBundles:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v128 + 88) + 8) + 40));
  objc_autoreleasePoolPop(v109);
  v110 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(v128 + 80) + 16))();
  objc_autoreleasePoolPop(v110);

}

BOOL __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_278(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  return (id)-[MOEventBundle bundleSuperType](a2, "bundleSuperType", a3) == (id)2;
}

BOOL __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  return (id)-[MOEventBundle bundleSuperType](a2, "bundleSuperType", a3) == (id)1;
}

uint64_t __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_283(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6 ^ 1;
}

uint64_t __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2_285(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6 ^ 1;
}

- (id)removeDuplicateAssetsAccrossMultipleBundleTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  uint64_t j;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities sortedBundleBasedOnGoodnessScore:](MOSummarizationUtilities, "sortedBundleBasedOnGoodnessScore:", v4));
    v6 = objc_alloc_init((Class)NSMutableSet);
    v7 = objc_alloc_init((Class)NSMutableSet);
    v8 = objc_alloc_init((Class)NSMutableSet);
    for (i = 0; i != 4; ++i)
    {
      v10 = objc_autoreleasePoolPush();
      -[MOSummarizationManager _removeDuplicateAssetsForBundleType:bundleSuperType:musicAlbumSet:podcastEpisodeSet:isRecommendTab:](self, "_removeDuplicateAssetsForBundleType:bundleSuperType:musicAlbumSet:podcastEpisodeSet:isRecommendTab:", v5, qword_10029F068[i], v6, v7, 1);
      objc_autoreleasePoolPop(v10);
    }
    objc_msgSend(v6, "removeAllObjects");
    objc_msgSend(v7, "removeAllObjects");
    for (j = 0; j != 4; ++j)
    {
      v12 = objc_autoreleasePoolPush();
      -[MOSummarizationManager _removeDuplicateAssetsForBundleType:bundleSuperType:musicAlbumSet:podcastEpisodeSet:isRecommendTab:](self, "_removeDuplicateAssetsForBundleType:bundleSuperType:musicAlbumSet:podcastEpisodeSet:isRecommendTab:", v5, qword_10029F068[j], v6, v7, 0);
      objc_autoreleasePoolPop(v12);
    }
    -[MOSummarizationManager removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:](self, "removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:", v5, 4, v8, 1, 1);
    v13 = &dword_100000008;
    do
    {
      v14 = objc_autoreleasePoolPush();
      -[MOSummarizationManager removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:](self, "removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:", v5, *(uint64_t *)((char *)qword_10029F068 + v13), v8, 1, 0);
      objc_autoreleasePoolPop(v14);
      v13 += 8;
    }
    while (v13 != 32);
    objc_msgSend(v8, "removeAllObjects");
    -[MOSummarizationManager removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:](self, "removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:", v5, 4, v8, 0, 1);
    v15 = &dword_100000008;
    do
    {
      -[MOSummarizationManager removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:](self, "removeDuplicateAssetsPerBundleTypeForThirdParty:bundleSuperType:titleSet:isRecommendTab:isMediaOnRepeat:", v5, *(uint64_t *)((char *)qword_10029F068 + v15), v8, 0, 0);
      v15 += 8;
    }
    while (v15 != 32);
    v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v5);

  }
  else
  {
    v16 = v4;
  }

  return v16;
}

- (void)_removeDuplicateAssetsForBundleType:(id)a3 bundleSuperType:(unint64_t)a4 musicAlbumSet:(id)a5 podcastEpisodeSet:(id)a6 isRecommendTab:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  uint64_t v44;
  id os_log;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v51;
  id obj;
  void *v53;
  void *context;
  unint64_t v55;
  void *v56;
  int v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  BOOL v74;
  uint8_t buf[4];
  uint64_t v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v56 = v13;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __125__MOSummarizationManager__removeDuplicateAssetsForBundleType_bundleSuperType_musicAlbumSet_podcastEpisodeSet_isRecommendTab___block_invoke;
    v73[3] = &__block_descriptor_41_e40_B24__0__MOEventBundle_8__NSDictionary_16l;
    v73[4] = a4;
    v74 = a7;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v73));
    v48 = v11;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:"));
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (!v14)
      goto LABEL_58;
    v15 = v14;
    v16 = *(_QWORD *)v70;
    v58 = v12;
    v55 = a4;
    v49 = *(_QWORD *)v70;
    while (1)
    {
      v17 = 0;
      v51 = v15;
      do
      {
        if (*(_QWORD *)v70 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v17);
        context = objc_autoreleasePoolPush();
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resources"));
        if (v19)
        {
          v20 = (void *)v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resources"));
          v22 = objc_msgSend(v21, "count");

          if (v22)
          {
            v53 = v17;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resources"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _sortResourcesByPriorityScore:](self, "_sortResourcesByPriorityScore:", v23));

            v60 = objc_alloc_init((Class)NSMutableArray);
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v25 = v24;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
            v59 = v25;
            if (!v26)
            {
              v57 = 0;
              goto LABEL_39;
            }
            v27 = v26;
            v57 = 0;
            v28 = *(_QWORD *)v66;
            while (1)
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(_QWORD *)v66 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
                v31 = objc_autoreleasePoolPush();
                v32 = objc_msgSend(v30, "type");
                if (objc_msgSend(v18, "bundleSuperType") == (id)a4 && v32 == (id)3)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

                  if ((objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]) & 1) != 0|| objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]))
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName")));

                    if (v36)
                    {
                      v12 = v58;
                      if ((objc_msgSend(v58, "containsObject:", v36) & 1) != 0)
                      {
                        if (objc_msgSend(v58, "containsObject:", v36)
                          && objc_msgSend(v18, "bundleSuperType") != (id)4)
                        {
                          objc_msgSend(v60, "addObject:", v30);
                        }
                      }
                      else
                      {
                        objc_msgSend(v58, "addObject:", v36);
                        ++v57;
                      }
                      goto LABEL_33;
                    }
LABEL_29:
                    v12 = v58;
                    goto LABEL_33;
                  }
                  if ((objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]) & 1) != 0|| objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]))
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerArtist")));

                    if (!v36)
                      goto LABEL_29;
                    if ((objc_msgSend(v56, "containsObject:", v36) & 1) != 0)
                    {
                      if (objc_msgSend(v56, "containsObject:", v36))
                        objc_msgSend(v60, "addObject:", v30);
                    }
                    else
                    {
                      objc_msgSend(v56, "addObject:", v36);
                      ++v57;
                    }
                    v12 = v58;
                    a4 = v55;
LABEL_33:

                  }
                  v25 = v59;
                }
                objc_autoreleasePoolPop(v31);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
              if (!v27)
              {
LABEL_39:

                if (objc_msgSend(v60, "count"))
                {
                  v38 = objc_alloc_init((Class)NSMutableArray);
                  v61 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v64 = 0u;
                  v39 = v25;
                  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                  if (v40)
                  {
                    v41 = v40;
                    v42 = *(_QWORD *)v62;
                    do
                    {
                      for (j = 0; j != v41; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v62 != v42)
                          objc_enumerationMutation(v39);
                        v44 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
                        if ((objc_msgSend(v60, "containsObject:", v44) & 1) != 0)
                        {
                          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          v46 = objc_claimAutoreleasedReturnValue(os_log);
                          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v76 = v44;
                            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Media resource is removed, %@", buf, 0xCu);
                          }

                        }
                        else
                        {
                          objc_msgSend(v38, "addObject:", v44);
                        }
                      }
                      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                    }
                    while (v41);
                  }

                  if (!v57)
                    objc_msgSend(v18, "setConcurrentMediaAction:", 0);
                  objc_msgSend(v18, "setResources:", v38);

                  v25 = v59;
                }

                v16 = v49;
                v15 = v51;
                v17 = v53;
                break;
              }
            }
          }
        }
        objc_autoreleasePoolPop(context);
        v17 = (char *)v17 + 1;
      }
      while (v17 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      if (!v15)
      {
LABEL_58:

        v11 = v48;
        v13 = v56;
        break;
      }
    }
  }

}

uint64_t __125__MOSummarizationManager__removeDuplicateAssetsForBundleType_bundleSuperType_musicAlbumSet_podcastEpisodeSet_isRecommendTab___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a2;
  if (objc_msgSend(v3, "bundleSuperType") == *(id *)(a1 + 32) && objc_msgSend(v3, "bundleSuperType") != (id)4)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        v10 = objc_msgSend(v9, "unsignedIntValue");

        if ((!*(_BYTE *)(a1 + 40) || v10 - 1 >= 2) && (*(_BYTE *)(a1 + 40) || (v10 & 0xFFFFFFFD) != 1))
          goto LABEL_18;
        goto LABEL_19;
      }
    }
  }
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_17;
  if (objc_msgSend(v3, "bundleSuperType") == (id)4
    && objc_msgSend(v3, "bundleSubType") == (id)404
    && !objc_msgSend(v3, "isAggregatedAndSuppressed"))
  {
    goto LABEL_19;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
LABEL_17:
    if (objc_msgSend(v3, "bundleSuperType") == (id)4
      && objc_msgSend(v3, "bundleSubType") == (id)401
      && !objc_msgSend(v3, "isAggregatedAndSuppressed"))
    {
LABEL_19:
      v11 = 1;
      goto LABEL_20;
    }
  }
LABEL_18:
  v11 = 0;
LABEL_20:

  return v11;
}

- (void)compressAssetsForThirdPartyBundles:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[MOSummarizationManager _compressAssetsForThirdPartyBundle:](self, "_compressAssetsForThirdPartyBundle:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_compressAssetsForThirdPartyBundle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  id os_log;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *k;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  MOResource *v53;
  void *v54;
  MOResource *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  NSMutableArray *v62;
  id v64;
  id obj;
  NSMutableArray *obja;
  NSMutableDictionary *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];

  v3 = a3;
  v4 = v3;
  if (!v3
    || objc_msgSend(v3, "bundleSuperType") != (id)4
    && objc_msgSend(v4, "bundleSuperType") != (id)2
    && objc_msgSend(v4, "bundleSuperType") != (id)1
    && objc_msgSend(v4, "bundleSuperType") != (id)5)
  {
    goto LABEL_66;
  }
  if ((objc_msgSend(v4, "isAggregatedAndSuppressed") & 1) != 0)
    goto LABEL_66;
  if (objc_msgSend(v4, "bundleSuperType") != (id)4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        v11 = objc_msgSend(v10, "unsignedIntValue");

        if (v11 == 4)
          goto LABEL_66;
      }
    }
  }
  v67 = objc_opt_new(NSMutableDictionary);
  v61 = v4;
  v62 = objc_opt_new(NSMutableArray);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_35;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v77;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v77 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
      v18 = objc_autoreleasePoolPush();
      if (objc_msgSend(v17, "type") == (id)3)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getDictionary"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

        if ((objc_msgSend(v20, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]) & 1) != 0|| (objc_msgSend(v20, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) != 0|| objc_msgSend(v20, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getDictionary"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName")));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getDictionary"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyKeyByAlbumArtist:albumOrArtist:](self, "_getThirdPartyKeyByAlbumArtist:albumOrArtist:", v23, v22));

          if (!v22)
            goto LABEL_26;
          if ((objc_msgSend(v22, "isEqualToString:", &stru_1002B68D0) & 1) == 0)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", v24));

            if (v25)
            {
              v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", v24));
              -[NSMutableArray addObject:](v26, "addObject:", v17);
              goto LABEL_28;
            }
          }
          if ((objc_msgSend(v22, "isEqualToString:", &stru_1002B68D0) & 1) != 0
            || (v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", v24)),
                v27,
                v27))
          {
LABEL_26:
            -[NSMutableArray addObject:](v62, "addObject:", v17);
          }
          else
          {
            v26 = objc_opt_new(NSMutableArray);
            -[NSMutableArray addObject:](v26, "addObject:", v17);
            -[NSMutableDictionary setValue:forKey:](v67, "setValue:forKey:", v26, v24);
LABEL_28:

          }
          ++v14;

        }
      }
      objc_autoreleasePoolPop(v18);
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  }
  while (v13);
LABEL_35:

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v29 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[MOSummarizationManager _compressAssetsForThirdPartyBundle:].cold.1(v67, v62, v29);

  v30 = -[NSMutableDictionary count](v67, "count");
  v4 = v61;
  if (v30 != (id)(v14 - (_QWORD)-[NSMutableArray count](v62, "count")))
  {
    obja = objc_opt_new(NSMutableArray);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "resources"));
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(_QWORD *)v73 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
          v37 = objc_autoreleasePoolPush();
          if (objc_msgSend(v36, "type") == (id)3)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getDictionary"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

            if ((objc_msgSend(v39, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]) & 1) == 0&& (objc_msgSend(v39, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) == 0&& (objc_msgSend(v39, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist) & 1) == 0)
            {
              -[NSMutableArray addObject:](obja, "addObject:", v36);
            }

          }
          else
          {
            -[NSMutableArray addObject:](obja, "addObject:", v36);
          }
          objc_autoreleasePoolPop(v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v33);
    }

    -[NSMutableArray addObjectsFromArray:](obja, "addObjectsFromArray:", v62);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v64 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v67, "allKeys"));
    v40 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(_QWORD *)v69 != v42)
            objc_enumerationMutation(v64);
          v44 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)k);
          v45 = objc_autoreleasePoolPush();
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", v44));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", 0));

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v67, "objectForKeyedSubscript:", v44));
          v49 = objc_msgSend(v48, "count");

          if (v49 == (id)1)
          {
            -[NSMutableArray addObject:](obja, "addObject:", v47);
          }
          else
          {
            v50 = objc_alloc((Class)NSMutableDictionary);
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getDictionary"));
            v52 = objc_msgSend(v50, "initWithDictionary:", v51);

            objc_msgSend(v52, "setValue:forKey:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0], CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey"));
            v53 = [MOResource alloc];
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
            v55 = -[MOResource initWithName:type:dict:value:](v53, "initWithName:type:dict:value:", v54, objc_msgSend(v47, "type"), v52, 0.0);

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sourceEventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v55, "setSourceEventIdentifier:", v56);

            -[MOResource setSourceEventAccessType:](v55, "setSourceEventAccessType:", objc_msgSend(v47, "sourceEventAccessType"));
            objc_msgSend(v47, "priorityScore");
            -[MOResource setPriorityScore:](v55, "setPriorityScore:");
            -[NSMutableArray addObject:](obja, "addObject:", v55);
            v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
              v60 = objc_msgSend(v47, "type");
              *(_DWORD *)buf = 138412802;
              v81 = v44;
              v82 = 2112;
              v83 = v59;
              v84 = 2048;
              v85 = v60;
              _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Compress assets by album, %@, name , %@, type, %lu", buf, 0x20u);

            }
          }

          objc_autoreleasePoolPop(v45);
        }
        v41 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v41);
    }

    v4 = v61;
    objc_msgSend(v61, "setResources:", obja);

  }
LABEL_66:

}

- (void)removeDuplicateAssetsPerBundleTypeForThirdParty:(id)a3 bundleSuperType:(unint64_t)a4 titleSet:(id)a5 isRecommendTab:(BOOL)a6 isMediaOnRepeat:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  uint64_t v45;
  id os_log;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  id obj;
  void *v55;
  int v56;
  void *v57;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  BOOL v75;
  BOOL v76;
  uint8_t buf[4];
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];

  v7 = a7;
  v11 = a3;
  v12 = a5;
  if (objc_msgSend(v11, "count"))
  {
    v57 = v12;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __130__MOSummarizationManager_removeDuplicateAssetsPerBundleTypeForThirdParty_bundleSuperType_titleSet_isRecommendTab_isMediaOnRepeat___block_invoke;
    v74[3] = &__block_descriptor_42_e40_B24__0__MOEventBundle_8__NSDictionary_16l;
    v74[4] = a4;
    v75 = a6;
    v76 = v7;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v74));
    v51 = v11;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:"));
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (!v13)
      goto LABEL_55;
    v14 = v13;
    v15 = *(_QWORD *)v71;
    v52 = *(_QWORD *)v71;
    while (1)
    {
      v16 = 0;
      v53 = v14;
      do
      {
        if (*(_QWORD *)v71 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v16);
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resources"));
        if (v18)
        {
          v19 = (void *)v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resources"));
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            v55 = v16;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resources"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _sortResourcesByPriorityScore:](self, "_sortResourcesByPriorityScore:", v22));

            v61 = objc_alloc_init((Class)NSMutableArray);
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
            v59 = v24;
            if (!v25)
            {
              v56 = 0;
              goto LABEL_33;
            }
            v26 = v25;
            v56 = 0;
            v27 = *(_QWORD *)v67;
            while (1)
            {
              v28 = 0;
              v60 = v26;
              do
              {
                if (*(_QWORD *)v67 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v28);
                v30 = objc_autoreleasePoolPush();
                v31 = objc_msgSend(v29, "type");
                if (objc_msgSend(v17, "bundleSuperType") == (id)a4 && v31 == (id)3)
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

                  if ((objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]) & 1) == 0&& !objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]))
                  {
                    goto LABEL_28;
                  }
                  v34 = v17;
                  v35 = a4;
                  v36 = v7;
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:](self, "_getThirdPartyTitleKey:", v37));

                  v7 = v36;
                  if (v36)
                  {
                    if (v38)
                    {
                      a4 = v35;
                      if ((objc_msgSend(v57, "containsObject:", v38) & 1) == 0)
                      {
                        objc_msgSend(v57, "addObject:", v38);
                        ++v56;
                      }
LABEL_27:
                      v17 = v34;

                      v24 = v59;
LABEL_28:
                      v26 = v60;

                      goto LABEL_29;
                    }
                  }
                  else if (v38 && (objc_msgSend(v57, "containsObject:", v38) & 1) == 0)
                  {
                    objc_msgSend(v57, "addObject:", v38);
                    ++v56;
                  }
                  else
                  {
                    objc_msgSend(v61, "addObject:", v29);
                  }
                  a4 = v35;
                  goto LABEL_27;
                }
LABEL_29:
                objc_autoreleasePoolPop(v30);
                v28 = (char *)v28 + 1;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
              if (!v26)
              {
LABEL_33:

                if (objc_msgSend(v61, "count"))
                {
                  v39 = objc_alloc_init((Class)NSMutableArray);
                  v62 = 0u;
                  v63 = 0u;
                  v64 = 0u;
                  v65 = 0u;
                  v40 = v24;
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
                  if (v41)
                  {
                    v42 = v41;
                    v43 = *(_QWORD *)v63;
                    do
                    {
                      for (i = 0; i != v42; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v63 != v43)
                          objc_enumerationMutation(v40);
                        v45 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
                        if ((objc_msgSend(v61, "containsObject:", v45) & 1) != 0)
                        {
                          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          v47 = objc_claimAutoreleasedReturnValue(os_log);
                          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v78 = v45;
                            _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Media resource is removed, %@", buf, 0xCu);
                          }

                        }
                        else
                        {
                          objc_msgSend(v39, "addObject:", v45);
                        }
                      }
                      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
                    }
                    while (v42);
                  }

                  if (!v56)
                    objc_msgSend(v17, "setConcurrentMediaAction:", 0);
                  objc_msgSend(v17, "setResources:", v39);
                  if (objc_msgSend(v17, "bundleSuperType") == (id)4)
                  {
                    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resources"));
                    v49 = objc_msgSend(v48, "count");

                    if (!v49)
                      objc_msgSend(v17, "setIsAggregatedAndSuppressed:", 1);
                  }

                  v24 = v59;
                }

                v15 = v52;
                v14 = v53;
                v16 = v55;
                break;
              }
            }
          }
        }
        v16 = (char *)v16 + 1;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      if (!v14)
      {
LABEL_55:

        v11 = v51;
        v12 = v57;
        break;
      }
    }
  }

}

uint64_t __130__MOSummarizationManager_removeDuplicateAssetsPerBundleTypeForThirdParty_bundleSuperType_titleSet_isRecommendTab_isMediaOnRepeat___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a2;
  if (objc_msgSend(v3, "bundleSuperType") == *(id *)(a1 + 32) && objc_msgSend(v3, "bundleSuperType") != (id)4)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        v10 = objc_msgSend(v9, "unsignedIntValue");

        if ((!*(_BYTE *)(a1 + 40) || v10 - 1 >= 2) && (*(_BYTE *)(a1 + 40) || (v10 & 0xFFFFFFFD) != 1))
          goto LABEL_16;
LABEL_26:
        v11 = 1;
        goto LABEL_27;
      }
    }
  }
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_30;
  if (objc_msgSend(v3, "bundleSuperType") == (id)4
    && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 41))
      goto LABEL_20;
    if (objc_msgSend(v3, "bundleSubType") == (id)409)
      goto LABEL_26;
    if (!*(_BYTE *)(a1 + 41))
    {
LABEL_20:
      if (objc_msgSend(v3, "bundleSubType") == (id)410)
        goto LABEL_26;
    }
  }
  if (!*(_BYTE *)(a1 + 40))
  {
LABEL_30:
    if (objc_msgSend(v3, "bundleSuperType") == (id)4
      && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
    {
      if (!*(_BYTE *)(a1 + 41))
        goto LABEL_25;
      if (objc_msgSend(v3, "bundleSubType") == (id)407)
        goto LABEL_26;
      if (!*(_BYTE *)(a1 + 41))
      {
LABEL_25:
        if (objc_msgSend(v3, "bundleSubType") == (id)408)
          goto LABEL_26;
      }
    }
  }
LABEL_16:
  v11 = 0;
LABEL_27:

  return v11;
}

- (void)removeDuplicateAssetsFromMediaBundle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_291));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v4));
    -[MOSummarizationManager _dedupAssetForMediaBundle:nonPlayedMediaBudnles:isRecommendTab:](self, "_dedupAssetForMediaBundle:nonPlayedMediaBudnles:isRecommendTab:", v12, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_292));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v6));
    -[MOSummarizationManager _dedupAssetForMediaBundle:nonPlayedMediaBudnles:isRecommendTab:](self, "_dedupAssetForMediaBundle:nonPlayedMediaBudnles:isRecommendTab:", v12, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_293));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v8));
    -[MOSummarizationManager dedupAssetForMediaBundleThirdParty:nonPlayedMediaBudnles:isRecommendTab:](self, "dedupAssetForMediaBundleThirdParty:nonPlayedMediaBudnles:isRecommendTab:", v12, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_294_0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v10));
    -[MOSummarizationManager dedupAssetForMediaBundleThirdParty:nonPlayedMediaBudnles:isRecommendTab:](self, "dedupAssetForMediaBundleThirdParty:nonPlayedMediaBudnles:isRecommendTab:", v12, v11, 0);

  }
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  MOEventBundle *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = a2;
  if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") != (id)4
    && (v4 = objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"))) != 0
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI"))),
        v7,
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if (v10 - 4 >= 0xFFFFFFFD)
    {
LABEL_10:
      v11 = 1;
      goto LABEL_11;
    }
  }
  else if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") == (id)4
         && (id)-[MOEventBundle bundleSubType](v3, "bundleSubType") == (id)404
         && !-[MOEventBundle isAggregatedAndSuppressed](v3, "isAggregatedAndSuppressed"))
  {
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_2(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  MOEventBundle *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = a2;
  if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") != (id)4
    && (v4 = objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"))) != 0
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI"))),
        v7,
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if ((v10 & 0xFFFFFFFD) == 1)
    {
LABEL_10:
      v11 = 1;
      goto LABEL_11;
    }
  }
  else if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") == (id)4
         && (id)-[MOEventBundle bundleSubType](v3, "bundleSubType") == (id)401
         && !-[MOEventBundle isAggregatedAndSuppressed](v3, "isAggregatedAndSuppressed"))
  {
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_3(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  MOEventBundle *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = a2;
  if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") != (id)4
    && (v4 = objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"))) != 0
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI"))),
        v7,
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if (v10 - 4 >= 0xFFFFFFFD)
    {
LABEL_10:
      v11 = 1;
      goto LABEL_11;
    }
  }
  else if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") == (id)4
         && (id)-[MOEventBundle bundleSubType](v3, "bundleSubType") == (id)409
         && !-[MOEventBundle isAggregatedAndSuppressed](v3, "isAggregatedAndSuppressed"))
  {
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_4(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  MOEventBundle *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = a2;
  if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") != (id)4
    && (v4 = objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"))) != 0
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI"))),
        v7,
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v3, "rankingDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if ((v10 & 0xFFFFFFFD) == 1)
    {
LABEL_10:
      v11 = 1;
      goto LABEL_11;
    }
  }
  else if ((id)-[MOEventBundle bundleSuperType](v3, "bundleSuperType") == (id)4
         && (id)-[MOEventBundle bundleSubType](v3, "bundleSubType") == (id)407
         && !-[MOEventBundle isAggregatedAndSuppressed](v3, "isAggregatedAndSuppressed"))
  {
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_dedupAssetForMediaBundle:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _BOOL4 v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  MOSummarizationManager *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  id v65;
  id obj;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v63 = v5;
    v62 = v7;
    v9 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v10 = objc_alloc_init((Class)NSDateFormatter);
    v60 = (void *)v9;
    objc_msgSend(v10, "setCalendar:", v9);
    v72 = v10;
    objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v73 = objc_alloc_init((Class)NSMutableSet);
    v70 = objc_alloc_init((Class)NSMutableSet);
    v71 = objc_alloc_init((Class)NSMutableDictionary);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v61 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (!v11)
      goto LABEL_41;
    v12 = v11;
    v13 = *(_QWORD *)v83;
    v64 = *(_QWORD *)v83;
    do
    {
      v14 = 0;
      v65 = v12;
      do
      {
        if (*(_QWORD *)v83 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v14);
        v16 = objc_autoreleasePoolPush();
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
        if (v17)
        {
          v18 = (void *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            v68 = v16;
            v69 = v14;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _sortResourcesByPriorityScore:](self, "_sortResourcesByPriorityScore:", v21));

            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v23 = v22;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
            if (!v24)
              goto LABEL_38;
            v25 = v24;
            v26 = *(_QWORD *)v79;
            while (1)
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(_QWORD *)v79 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
                v29 = objc_autoreleasePoolPush();
                v30 = objc_msgSend(v28, "type");
                if (objc_msgSend(v15, "bundleSuperType") != (id)4 && v30 == (id)3)
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "getDictionary"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

                  if ((objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]) & 1) != 0|| objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]))
                  {
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "getDictionary"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName")));

                    if (!v34)
                      goto LABEL_34;
                    v35 = v73;
                  }
                  else
                  {
                    if ((objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]) & 1) == 0&& !objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]))
                    {
                      goto LABEL_35;
                    }
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "getDictionary"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerArtist")));

                    if (!v34)
                      goto LABEL_34;
                    v35 = v70;
                  }
                  if ((objc_msgSend(v35, "containsObject:", v34) & 1) == 0)
                    objc_msgSend(v35, "addObject:", v34);
LABEL_34:

LABEL_35:
                  goto LABEL_36;
                }
                if (objc_msgSend(v15, "bundleSuperType") == (id)4
                  && (objc_msgSend(v15, "bundleSubType") == (id)401 || objc_msgSend(v15, "bundleSubType") == (id)404))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "getDictionary"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName")));

                  if (v32)
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stringFromDate:", v37));

                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", v34));
                    if (v38)
                      v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", v34));
                    else
                      v39 = objc_alloc_init((Class)NSMutableSet);
                    v41 = v39;
                    objc_msgSend(v39, "addObject:", v32);
                    objc_msgSend(v71, "setObject:forKey:", v41, v34);

                    goto LABEL_34;
                  }
                  goto LABEL_35;
                }
LABEL_36:
                objc_autoreleasePoolPop(v29);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
              if (!v25)
              {
LABEL_38:

                v13 = v64;
                v12 = v65;
                v16 = v68;
                v14 = v69;
                break;
              }
            }
          }
        }
        objc_autoreleasePoolPop(v16);
        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v12);
LABEL_41:

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v42 = v62;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    v44 = v63;
    if (!v43)
      goto LABEL_67;
    v45 = v43;
    v46 = *(_QWORD *)v75;
LABEL_43:
    v47 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v46)
        objc_enumerationMutation(v42);
      v48 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v47);
      v49 = objc_msgSend(v48, "bundleSuperType");
      if (v44)
      {
        if (v49 != (id)4 || objc_msgSend(v48, "summarizationGranularity") != (id)2)
          goto LABEL_65;
      }
      else if (v49 != (id)4 || objc_msgSend(v48, "summarizationGranularity") != (id)1)
      {
        goto LABEL_65;
      }
      if ((objc_msgSend(v48, "isAggregatedAndSuppressed") & 1) == 0)
        break;
LABEL_65:
      if (v45 == (id)++v47)
      {
        v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        if (!v45)
        {
LABEL_67:

          v8 = v61;
          v7 = v62;
          goto LABEL_68;
        }
        goto LABEL_43;
      }
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stringFromDate:", v50));

    if (objc_msgSend(v48, "bundleSubType") == (id)402)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "resources"));
      v53 = self;
      v54 = v52;
      v55 = v73;
      v56 = v71;
      v57 = v51;
      v58 = CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName");
    }
    else
    {
      if (objc_msgSend(v48, "bundleSubType") == (id)403)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "resources"));
        v53 = self;
        v54 = v52;
        v55 = v70;
        v56 = 0;
      }
      else
      {
        if (objc_msgSend(v48, "bundleSubType") != (id)405)
        {
LABEL_64:

          v44 = v63;
          goto LABEL_65;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "resources"));
        v53 = self;
        v54 = v52;
        v55 = v70;
        v56 = v71;
      }
      v57 = v51;
      v58 = CFSTR("MOMediaPlayMetaDataKeyPlayerArtist");
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _removeDuplicateFromResource:nonMediaKeySet:mediaOnRepeatDict:eventBundleDayKey:keyName:](v53, "_removeDuplicateFromResource:nonMediaKeySet:mediaOnRepeatDict:eventBundleDayKey:keyName:", v54, v55, v56, v57, v58));

    objc_msgSend(v48, "setResources:", v59);
    if (!v59 || !objc_msgSend(v59, "count"))
      objc_msgSend(v48, "setIsAggregatedAndSuppressed:", 1);

    goto LABEL_64;
  }
LABEL_68:

}

- (void)dedupAssetForMediaBundleThirdParty:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  id obj;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v60 = a5;
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v53 = v6;
    v8 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v9 = objc_alloc_init((Class)NSDateFormatter);
    v51 = (void *)v8;
    objc_msgSend(v9, "setCalendar:", v8);
    v59 = v9;
    objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v10 = objc_alloc_init((Class)NSMutableSet);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v52 = v7;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (!v11)
      goto LABEL_38;
    v12 = v11;
    v13 = *(_QWORD *)v71;
    v54 = *(_QWORD *)v71;
    do
    {
      v14 = 0;
      v55 = v12;
      do
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v14);
        v16 = objc_autoreleasePoolPush();
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
        if (v17)
        {
          v18 = (void *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            v57 = v16;
            v58 = v14;
            v21 = v10;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _sortResourcesByPriorityScore:](self, "_sortResourcesByPriorityScore:", v22));

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            if (!v25)
              goto LABEL_35;
            v26 = v25;
            v27 = *(_QWORD *)v67;
            while (1)
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(_QWORD *)v67 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
                v30 = objc_autoreleasePoolPush();
                v31 = objc_msgSend(v29, "type");
                if (objc_msgSend(v15, "bundleSuperType") != (id)4 && v31 == (id)3)
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

                  if ((objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]) & 1) != 0|| (objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) != 0|| objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist))
                  {
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:](self, "_getThirdPartyTitleKey:", v34));

                    if (v35 && (objc_msgSend(v21, "containsObject:", v35) & 1) == 0)
                      objc_msgSend(v21, "addObject:", v35);

                  }
LABEL_23:

                  goto LABEL_33;
                }
                if (objc_msgSend(v15, "bundleSuperType") == (id)4)
                {
                  v36 = objc_msgSend(v15, "bundleSubType");
                  if (v60)
                  {
                    if (v36 == (id)409)
                    {
                      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:](self, "_getThirdPartyTitleKey:", v37));
LABEL_30:

                      if (v33 && (objc_msgSend(v21, "containsObject:", v33) & 1) == 0)
                        objc_msgSend(v21, "addObject:", v33);
                      goto LABEL_23;
                    }
                  }
                  else if (v36 == (id)407)
                  {
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringFromDate:", v38));

                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:dayKey:isRecommendTab:](self, "_getThirdPartyTitleKey:dayKey:isRecommendTab:", v39, v37, 0));

                    goto LABEL_30;
                  }
                }
LABEL_33:
                objc_autoreleasePoolPop(v30);
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
              if (!v26)
              {
LABEL_35:

                v10 = v21;
                v13 = v54;
                v12 = v55;
                v16 = v57;
                v14 = v58;
                break;
              }
            }
          }
        }
        objc_autoreleasePoolPop(v16);
        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v12);
LABEL_38:

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v6 = v53;
    v40 = v53;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (!v41)
      goto LABEL_62;
    v42 = v41;
    v43 = *(_QWORD *)v63;
LABEL_40:
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v43)
        objc_enumerationMutation(v40);
      v45 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v44);
      v46 = objc_msgSend(v45, "bundleSuperType");
      if (v60)
      {
        if (v46 == (id)4
          && objc_msgSend(v45, "summarizationGranularity") == (id)2
          && (objc_msgSend(v45, "isAggregatedAndSuppressed") & 1) == 0
          && objc_msgSend(v45, "bundleSubType") == (id)410)
        {
          goto LABEL_53;
        }
      }
      else if (v46 == (id)4
             && objc_msgSend(v45, "summarizationGranularity") == (id)1
             && (objc_msgSend(v45, "isAggregatedAndSuppressed") & 1) == 0
             && objc_msgSend(v45, "bundleSubType") == (id)408)
      {
LABEL_53:
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "startDate"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringFromDate:", v47));

        if (objc_msgSend(v45, "bundleSubType") == (id)408 || objc_msgSend(v45, "bundleSubType") == (id)410)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "resources"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _removeDuplicateFromResourceThridParty:mediaKeySet:dayKey:isRecommendTab:](self, "_removeDuplicateFromResourceThridParty:mediaKeySet:dayKey:isRecommendTab:", v49, v10, v48, v60));

          objc_msgSend(v45, "setResources:", v50);
          if (!v50 || !objc_msgSend(v50, "count"))
            objc_msgSend(v45, "setIsAggregatedAndSuppressed:", 1);

        }
      }
      if (v42 == (id)++v44)
      {
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        if (!v42)
        {
LABEL_62:

          v7 = v52;
          break;
        }
        goto LABEL_40;
      }
    }
  }

}

- (id)_sortResourcesByPriorityScore:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_300);
}

int64_t __56__MOSummarizationManager__sortResourcesByPriorityScore___block_invoke(id a1, MOResource *a2, MOResource *a3)
{
  MOResource *v4;
  MOResource *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  -[MOResource priorityScore](v4, "priorityScore");
  v7 = v6;
  -[MOResource priorityScore](v5, "priorityScore");
  if (v7 >= v8)
  {
    -[MOResource priorityScore](v4, "priorityScore");
    v11 = v10;
    -[MOResource priorityScore](v5, "priorityScore");
    if (v11 <= v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v4, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v5, "identifier"));
      v9 = (int64_t)objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)_getThirdPartyKeyByAlbumArtist:(id)a3 albumOrArtist:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v5, v6));

  return v8;
}

- (id)_getThirdPartyTitleKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, v5));

  return v7;
}

- (id)_getThirdPartyTitleKey:(id)a3 dayKey:(id)a4 isRecommendTab:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSString *v13;
  uint64_t v15;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    if (v5)
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v9, v10, v15);
    else
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v7, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (id)_removeDuplicateFromResource:(id)a3 nonMediaKeySet:(id)a4 mediaOnRepeatDict:(id)a5 eventBundleDayKey:(id)a6 keyName:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  id os_log;
  NSObject *v27;
  NSMutableArray *v29;
  id v30;
  id obj;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v11 = a3;
  v32 = a4;
  v34 = a5;
  v30 = a6;
  v33 = a7;
  v29 = objc_opt_new(NSMutableArray);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v15);
        v17 = objc_autoreleasePoolPush();
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getDictionary"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v33));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getDictionary"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

        if (!v19)
          goto LABEL_12;
        v22 = objc_msgSend(v32, "containsObject:", v19);
        v23 = v22;
        if (v34)
        {
          if ((v22 & 1) == 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v30));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v30));
              v23 = objc_msgSend(v25, "containsObject:", v19);

            }
          }
        }
        if ((v23 & 1) == 0)
        {
          -[NSMutableArray addObject:](v29, "addObject:", v16);
        }
        else
        {
LABEL_12:
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v27 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v40 = v33;
            v41 = 2112;
            v42 = v19;
            v43 = 2112;
            v44 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Summarization: Media bundle remove duplicate asset with key, %@, value, %@, title, %@", buf, 0x20u);
          }

        }
        objc_autoreleasePoolPop(v17);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v13);
  }

  return v29;
}

- (id)_removeDuplicateFromResourceThridParty:(id)a3 mediaKeySet:(id)a4 dayKey:(id)a5 isRecommendTab:(BOOL)a6
{
  id v9;
  id v10;
  __int128 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id os_log;
  NSObject *v24;
  __int128 v26;
  NSMutableArray *v27;
  id obj;
  id v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v31 = a6;
  v9 = a3;
  v32 = a4;
  v29 = a5;
  v27 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v12 = v10;
    v30 = *(_QWORD *)v34;
    *(_QWORD *)&v11 = 138412802;
    v26 = v11;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v13);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDictionary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:](self, "_getThirdPartyTitleKey:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDictionary"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

        if (v31)
        {
          v20 = v17;
        }
        else
        {
          v21 = v12;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDictionary"));
          v20 = (id)objc_claimAutoreleasedReturnValue(-[MOSummarizationManager _getThirdPartyTitleKey:dayKey:isRecommendTab:](self, "_getThirdPartyTitleKey:dayKey:isRecommendTab:", v22, v29, 0));

          v12 = v21;
        }
        if ((objc_msgSend(v32, "containsObject:", v17, v26) & 1) != 0
          || (objc_msgSend(v32, "containsObject:", v20) & 1) != 0)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v24 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            v38 = v29;
            v39 = 2112;
            v40 = v17;
            v41 = 2112;
            v42 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Summarization: Media bundle remove duplicate asset with day, %@, key for , %@, title, %@", buf, 0x20u);
          }

        }
        else
        {
          -[NSMutableArray addObject:](v27, "addObject:", v14);
        }

        objc_autoreleasePoolPop(v15);
        v13 = (char *)v13 + 1;
      }
      while (v12 != v13);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  return v27;
}

- (unint64_t)supressCoarseGranularityPropertyOfEventBundles:(id)a3 primaryBundles:(id)a4 bundleMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  MOObjectZipper *v11;
  unsigned __int8 v12;
  unint64_t v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v11 = -[MOObjectZipper initWithObjects:others:comparator:]([MOObjectZipper alloc], "initWithObjects:others:comparator:", v8, v9, &__block_literal_global_308);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    do
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2;
      v15[3] = &unk_1002B2D10;
      v15[4] = self;
      v16 = v10;
      v17 = &v18;
      v12 = -[MOObjectZipper nextObjectPairWithHandler:](v11, "nextObjectPairWithHandler:", v15);

    }
    while ((v12 & 1) != 0);
    v13 = v19[3];
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

int64_t __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](a2, "endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));

  LODWORD(v4) = objc_msgSend(v5, "isBeforeDate:", v6);
  if ((_DWORD)v4)
    return -1;
  else
    return 1;
}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  double v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_2((uint64_t)v5, (uint64_t)v6, v8);

  v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_1(v5, v6, v10);

  +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v5, v6);
  if (v11 > 0.0)
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateInterval"));
    objc_msgSend(v13, "duration");
    if (v14 > 0.0)
    {
      objc_msgSend(v13, "duration");
      v16 = v12 / v15;
      if (v16 > 0.2)
      {
        v17 = objc_msgSend(*(id *)(a1 + 32), "supressCoarseGranularityPropertyOfEventBundle:dominantBundle:", v5, v6);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6));
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v18, "addObject:", v5);
          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v5));
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v19, v6);
          }
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

        }
        v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v29 = v17;
          v28 = objc_msgSend(v5, "interfaceType");
          v22 = objc_msgSend(v6, "interfaceType");
          v23 = objc_msgSend(v5, "summarizationGranularity");
          v24 = objc_msgSend(v5, "isAggregatedAndSuppressed");
          v25 = objc_msgSend(v5, "summarizationGranularity");
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionID"));
          *(_DWORD *)buf = 134220034;
          v31 = v29;
          v32 = 2048;
          v33 = v28;
          v34 = 2048;
          v35 = v22;
          v36 = 2048;
          v37 = v23;
          v38 = 2048;
          v39 = v24;
          v40 = 2048;
          v41 = v25;
          v42 = 2048;
          v43 = v16;
          v44 = 2112;
          v45 = v26;
          v46 = 2112;
          v47 = v27;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: merge, suppressed, %lu, bundle.interfacetype, %lu, megaBundle.interfacetype, %lu, bundle.summary, %lu, bundle.aggregated, %lu, bundle.granularity, %lu, ratio, %f, bundle suggestionID, %@, mega bundle suggestionID, %@", buf, 0x5Cu);

        }
      }
    }

  }
}

- (BOOL)supressCoarseGranularityPropertyOfEventBundle:(id)a3 dominantBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if ((objc_msgSend(v6, "isAggregatedAndSuppressed") & 1) != 0
      || (objc_msgSend(v5, "isAggregatedAndSuppressed") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      if (objc_msgSend(v5, "summarizationGranularity") == (id)2)
        objc_msgSend(v5, "setIsAggregatedAndSuppressed:", 1);
      else
        objc_msgSend(v5, "setSummarizationGranularity:", 1);
      v9 = objc_opt_new(NSMutableArray);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subBundleIDs"));
      -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
      -[NSMutableArray addObject:](v9, "addObject:", v12);

      v13 = -[NSMutableArray copy](v9, "copy");
      objc_msgSend(v7, "setSubBundleIDs:", v13);

      v14 = objc_opt_new(NSMutableArray);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subSuggestionIDs"));
      -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      -[NSMutableArray addObject:](v14, "addObject:", v17);

      v18 = -[NSMutableArray copy](v14, "copy");
      objc_msgSend(v7, "setSubSuggestionIDs:", v18);

      v8 = 1;
    }
  }

  return v8;
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (MOEventBundleRanking)eventBundleRanking
{
  return self->_eventBundleRanking;
}

- (void)setEventBundleRanking:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleRanking, a3);
}

- (MOSummarizationParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_eventBundleRanking, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)_compressAssetsForThirdPartyBundle:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;

  v6 = 134218240;
  v7 = objc_msgSend(a1, "count");
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a3, v5, "Compress assets calcualted with album, %lu, empty album, %lu", (uint8_t *)&v6);
}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "endDate"));
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation: bundle, start, %@, end, %@, maga bundles, start, %@, end, %@", (uint8_t *)&v10, 0x2Au);

}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a3, (uint64_t)a3, "CoarseGranularityAggregation: bundle, %@, maga bundles, %@", (uint8_t *)&v3);
}

@end
