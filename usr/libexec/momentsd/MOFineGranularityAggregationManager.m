@implementation MOFineGranularityAggregationManager

- (MOFineGranularityAggregationManager)initWithUniverse:(id)a3
{
  MOFineGranularityAggregationManager *v3;
  uint64_t v4;
  MOFineGranularityAggregationManager *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  const char *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MOFineGranularityAggregationManager;
  v3 = -[MOAggregationManager initWithUniverse:](&v15, "initWithUniverse:", a3);
  v5 = v3;
  if (v3)
  {
    v6 = (objc_class *)objc_opt_class(v3, v4);
    v7 = NSStringFromClass(v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create(v9, v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

  }
  return v5;
}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id os_log;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  MOTimeContextAggregationManager *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  MOMediaAggregationManager *v21;
  void *v22;
  MOMediaAggregationManager *v23;
  NSObject *v24;
  MOContactAggregationManager *v25;
  void *v26;
  MOContactAggregationManager *v27;
  NSObject *v28;
  NSObject *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  MOTimeContextAggregationManager *v32;
  _QWORD block[4];
  NSMutableArray *v34;
  id v35;
  __int128 *v36;
  __int128 *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  NSObject *v45;
  __int128 *v46;
  _QWORD v47[4];
  NSObject *v48;
  __int128 *p_buf;
  __int128 v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count") == 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation: No eventBundle to be proccessed", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    if (v14)
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation: input eventBundles count, %lu", (uint8_t *)&buf, 0xCu);
    }

    v31 = objc_opt_new(NSMutableArray);
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__15;
    v58 = __Block_byref_object_dispose__15;
    v59 = 0;
    v16 = [MOTimeContextAggregationManager alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](self, "fUniverse"));
    v32 = -[MOAggregationManager initWithUniverse:](v16, "initWithUniverse:", v17);

    v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(v50) = 134217984;
      *(_QWORD *)((char *)&v50 + 4) = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "FineGranularityAggregation: Time context input eventBundles count, %lu", (uint8_t *)&v50, 0xCu);
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke;
    v47[3] = &unk_1002ADC00;
    p_buf = &buf;
    v20 = v15;
    v48 = v20;
    -[MOTimeContextAggregationManager aggregateBundles:withParameters:granularity:handler:](v32, "aggregateBundles:withParameters:granularity:handler:", v8, v9, 1, v47);
    dispatch_group_enter(v20);
    *(_QWORD *)&v50 = 0;
    *((_QWORD *)&v50 + 1) = &v50;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__15;
    v53 = __Block_byref_object_dispose__15;
    v54 = 0;
    v21 = [MOMediaAggregationManager alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](self, "fUniverse"));
    v23 = -[MOAggregationManager initWithUniverse:](v21, "initWithUniverse:", v22);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_64;
    v44[3] = &unk_1002ADC00;
    v46 = &v50;
    v24 = v20;
    v45 = v24;
    -[MOMediaAggregationManager aggregateBundles:withParameters:granularity:handler:](v23, "aggregateBundles:withParameters:granularity:handler:", v8, v9, 1, v44);
    dispatch_group_enter(v24);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__15;
    v42[4] = __Block_byref_object_dispose__15;
    v43 = 0;
    v25 = [MOContactAggregationManager alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](self, "fUniverse"));
    v27 = -[MOContactAggregationManager initWithUniverse:](v25, "initWithUniverse:", v26);

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_66;
    v39[3] = &unk_1002ADC00;
    v41 = v42;
    v28 = v24;
    v40 = v28;
    -[MOContactAggregationManager aggregateBundles:withParameters:granularity:handler:](v27, "aggregateBundles:withParameters:granularity:handler:", v8, v9, 1, v39);
    v29 = objc_claimAutoreleasedReturnValue(-[MOFineGranularityAggregationManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_67;
    block[3] = &unk_1002ADC28;
    v36 = &buf;
    v34 = v31;
    v37 = &v50;
    v38 = v42;
    v35 = v10;
    v30 = v31;
    dispatch_group_notify(v28, v29, block);

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&buf, 8);
  }

}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FineGranularityAggregation for time context: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FineGranularityAggregation: output media eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_67(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
