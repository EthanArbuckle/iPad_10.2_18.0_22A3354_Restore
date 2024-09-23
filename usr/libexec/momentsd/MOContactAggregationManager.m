@implementation MOContactAggregationManager

- (MOContactAggregationManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  MOContactAggregationManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  MOConfigurationManager *configurationManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOContactAggregationManager;
  v6 = -[MOContactAggregationManager init](&v13, "init");
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class(MOConfigurationManager, v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v9));
    configurationManager = v6->_configurationManager;
    v6->_configurationManager = (MOConfigurationManager *)v10;

  }
  return v6;
}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (a5 == 2)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_64;
    v15[3] = &unk_1002ADFD8;
    v16 = v12;
    -[MOContactAggregationManager _aggregateBundlesForCoarseGranularity:withParameters:handler:](self, "_aggregateBundlesForCoarseGranularity:withParameters:handler:", v10, v11, v15);
    v14 = v16;
  }
  else
  {
    if (a5 != 1)
    {
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
      goto LABEL_7;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v17[3] = &unk_1002ADFD8;
    v18 = v12;
    -[MOContactAggregationManager _aggregateBundlesForFineGranularity:withParameters:handler:](self, "_aggregateBundlesForFineGranularity:withParameters:handler:", v10, v11, v17);
    v14 = v18;
  }

LABEL_7:
}

void __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id os_log;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  const __CFString *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *context;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE v42[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v11 = objc_msgSend(v7, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    context = v10;
    v31 = v9;
    v32 = v8;
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      v39 = objc_msgSend(v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: input eventBundles count, %lu", buf, 0xCu);
    }

    v33 = v7;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
            v24 = objc_msgSend(v20, "includedInSummaryBundleOnly");
            *(_DWORD *)buf = 138412546;
            v25 = CFSTR("NO");
            if (v24)
              v25 = CFSTR("YES");
            v39 = v23;
            v40 = 2112;
            v41 = v25;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: bundle id, %@, includedInSummaryBundleOnly, %@", buf, 0x16u);

          }
          if (objc_msgSend(v20, "includedInSummaryBundleOnly"))
            objc_msgSend(v20, "setIsAggregatedAndSuppressed:", 1);
          objc_msgSend(v20, "setSummarizationGranularity:", 1);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }
    v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v39 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: updated contact eventBundles count, %lu", buf, 0xCu);
    }

    v9 = v31;
    (*((void (**)(id, _QWORD, _QWORD))v31 + 2))(v31, 0, 0);

    v8 = v32;
    v7 = v33;
    v10 = context;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: No eventBundle to be proccessed", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  objc_autoreleasePoolPop(v10);

}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id os_log;
  NSObject *v21;
  const char *v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("kMOContactAggregationManagerShouldAggregateBundlesForCoarseGranularity"), 0))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "CoarseGranularityAggregation for contact: skip aggregation";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    }
LABEL_15:

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v21 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "CoarseGranularityAggregation for contact: No eventBundle to be proccessed";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v11 = objc_opt_new(NSMutableArray);
  v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact related bundles: input eventBundles count, %lu", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _megaBundleFromContactBundles:parameters:](self, "_megaBundleFromContactBundles:parameters:", v15, v9));
  if (v16)
    -[NSMutableArray addObject:](v11, "addObject:", v16);
  v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = -[NSMutableArray count](v11, "count");
    *(_DWORD *)buf = 134217984;
    v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact related bundles: output eventBundles count, %lu", buf, 0xCu);
  }

  (*((void (**)(id, NSMutableArray *, _QWORD))v10 + 2))(v10, v11, 0);
LABEL_16:

}

- (id)_megaBundleFromContactBundles:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id os_log;
  NSObject *v12;
  float v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  void *v18;
  int v20;
  double v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aggregationDateInterval"));
    objc_msgSend(v8, "duration");
    v10 = v9;

    if (v10 >= 604800.0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _createContactMegaBundleFromBundles:parameters:](self, "_createContactMegaBundleFromBundles:parameters:", v6, v7));
      objc_msgSend(v18, "setSummarizationGranularity:", 2);
      goto LABEL_10;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "coarseGranularity_contactMegaBundleLookBackDays");
      v20 = 134217984;
      v21 = v13;
      v14 = "CoarseGranularityAggregation for contact: no needed to contact bundles since aggregation time interval is less than %f days";
      v15 = v12;
      v16 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      v14 = "CoarseGranularityAggregation for contact: no needed to aggregate contact bundles since bundles count is 0";
      v15 = v12;
      v16 = 2;
      goto LABEL_7;
    }
  }

  v18 = 0;
LABEL_10:

  return v18;
}

- (id)_createContactMegaBundleFromBundles:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  float v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  id os_log;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  id v39;
  NSObject *p_super;
  MOEventBundle *v41;
  MOEventBundle *v42;
  void *v43;
  void *v44;
  MOEventBundle *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  signed int v50;
  void *v51;
  NSMutableArray *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  id v60;
  unint64_t v61;
  uint64_t v62;
  void *i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  MOPerson *v69;
  void *v70;
  void *v71;
  double v72;
  MOPerson *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  MOAction *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  MOEventBundle *v108;
  NSMutableArray *v109;
  MOContactAggregationManager *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  NSObject *obj;
  void *v115;
  NSMutableArray *v116;
  NSMutableSet *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[4];
  id v123;
  _BYTE v124[128];
  void *v125;
  _QWORD v126[2];
  uint8_t buf[4];
  id v128;

  v6 = a3;
  v7 = a4;
  v110 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](self, "fUniverse"));
  v10 = (objc_class *)objc_opt_class(MOTimeZoneManager, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v112 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getService:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v14 = objc_alloc((Class)NSDate);
  objc_msgSend(v7, "coarseGranularity_contactMegaBundleLookBackDays");
  v16 = v15 * -86400.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = objc_msgSend(v14, "initWithTimeInterval:sinceDate:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startOfDayForDate:", v18));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v21 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v128 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: the earliest date for contact bundle to be aggregated for coarse granularity: %@", buf, 0xCu);
  }

  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = __78__MOContactAggregationManager__createContactMegaBundleFromBundles_parameters___block_invoke;
  v122[3] = &unk_1002B1688;
  v22 = v19;
  v123 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v122));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v23));

  v25 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v26 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v126[0] = v25;
  v126[1] = v26;
  v111 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 2));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sortedArrayUsingDescriptors:", v27));

  v29 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 134217984;
    v128 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: bundle count after removing old bundles: %lu", buf, 0xCu);
  }

  v113 = v28;
  if (!objc_msgSend(v28, "count"))
  {
    v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v33 = objc_claimAutoreleasedReturnValue(v39);
    v34 = (void *)v112;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v36 = "CoarseGranularityAggregation for contact: no bundle available to create contact mega bundle";
      v37 = v33;
      v38 = 2;
      goto LABEL_11;
    }
LABEL_12:
    p_super = v33;
    v41 = 0;
    goto LABEL_38;
  }
  if ((unint64_t)objc_msgSend(v28, "count") <= 1)
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)v112;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v35 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 134217984;
      v128 = v35;
      v36 = "CoarseGranularityAggregation for contact: %lu bundle is not enough to create contact mega bundle for coarse granularity";
      v37 = v33;
      v38 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v36, buf, v38);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v106 = v25;
  v107 = v24;
  v42 = [MOEventBundle alloc];
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v45 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v42, "initWithBundleIdentifier:creationDate:", v43, v44);

  v108 = v45;
  -[MOEventBundle setInterfaceType:](v45, "setInterfaceType:", 4);
  v46 = objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _statsForContactFromEventBundles:](v110, "_statsForContactFromEventBundles:", v28));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _contactClassificationMapFromEventBundles:](v110, "_contactClassificationMapFromEventBundles:", v28));
  v105 = (void *)v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _contactCandidatesForMegaBundleFromStats:contactClassificationMap:parameters:](v110, "_contactCandidatesForMegaBundleFromStats:contactClassificationMap:parameters:", v46));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _eventsForContactFromEventBundles:](v110, "_eventsForContactFromEventBundles:", v28));
  v109 = objc_opt_new(NSMutableArray);
  v117 = objc_opt_new(NSMutableSet);
  v116 = objc_opt_new(NSMutableArray);
  v103 = v47;
  if ((unint64_t)objc_msgSend(v47, "count") > 1)
  {
    v101 = v6;
    v102 = v22;
    if ((unint64_t)objc_msgSend(v47, "count") < 3)
    {
      v52 = v109;
      -[NSMutableArray addObjectsFromArray:](v109, "addObjectsFromArray:", v47);
    }
    else
    {
      v50 = arc4random_uniform(objc_msgSend(v47, "count") - 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", v50));
      v52 = v109;
      -[NSMutableArray addObject:](v109, "addObject:", v51);

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", v50 + 1));
      -[NSMutableArray addObject:](v109, "addObject:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", v50 + 2));
      -[NSMutableArray addObject:](v109, "addObject:", v54);

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("score"), 0, v7));
    v125 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v125, 1));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v52, "sortedArrayUsingDescriptors:", v56));

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v58 = v57;
    v59 = -[NSObject countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
    obj = v58;
    if (v59)
    {
      v60 = v59;
      v61 = 0;
      v62 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v60; i = (char *)i + 1)
        {
          if (*(_QWORD *)v119 != v62)
            objc_enumerationMutation(obj);
          v64 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contact"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v66));

          if (v67)
          {
            if (v61 >= 3)
              v68 = 0.0;
            else
              v68 = (double)(v61 + 200);
            v69 = [MOPerson alloc];
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contact"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "localizedFullName"));
            objc_msgSend(v64, "score");
            v73 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](v69, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", 0, v71, v67, 0, v68, v72);

            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectForKey:", v64));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "allObjects"));

            -[MOPerson setSourceEventAccessType:](v73, "setSourceEventAccessType:", 3);
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "firstObject"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "eventIdentifier"));
            -[MOPerson setSourceEventIdentifier:](v73, "setSourceEventIdentifier:", v77);

            -[NSMutableArray addObject:](v116, "addObject:", v73);
            v78 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v79 = objc_claimAutoreleasedReturnValue(v78);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = objc_msgSend(v75, "count");
              *(_DWORD *)buf = 134217984;
              v128 = v80;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact, events count for each suggested contact: %lu", buf, 0xCu);
            }

            -[NSMutableSet addObjectsFromArray:](v117, "addObjectsFromArray:", v75);
            ++v61;

          }
        }
        v58 = obj;
        v60 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
      }
      while (v60);
    }

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[MOContactAggregationManager _bundlesForContact:fromInputBundles:](v110, "_bundlesForContact:fromInputBundles:", v109, v113));
    +[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:](MOSummarizationUtilities, "updateRankMetaDataFrom:forSummaryBundle:", v81, v108);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v117, "allObjects"));
    -[MOEventBundle setEvents:](v108, "setEvents:", v82);

    -[MOEventBundle setPropertiesBasedOnEvents](v108, "setPropertiesBasedOnEvents");
    -[MOEventBundle setStartDate:](v108, "setStartDate:", v102);
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MOEventBundle setEndDate:](v108, "setEndDate:", v83);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v108, "startDate"));
    v34 = (void *)v112;
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v84, v112));
    -[MOEventBundle setTime:](v108, "setTime:", v85);

    v86 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Communicate"), 5, 4);
    -[MOEventBundle setAction:](v108, "setAction:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v117, "allObjects"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "firstObject"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "eventIdentifier"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v108, "action"));
    objc_msgSend(v90, "setSourceEventIdentifier:", v89);

    -[MOEventBundle setPersons:](v108, "setPersons:", v116);
    -[MOEventBundle setBundleSuperType:](v108, "setBundleSuperType:", 3);
    -[MOEventBundle setBundleSubType:](v108, "setBundleSubType:", 302);
    v91 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
      -[MOContactAggregationManager _createContactMegaBundleFromBundles:parameters:].cold.1((uint64_t)v108, v92, v93, v94, v95, v96, v97, v98);

    v41 = v108;
    v7 = v100;
    v6 = v101;
    v22 = v102;
    v25 = v106;
    v24 = v107;
  }
  else
  {
    v48 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    v34 = (void *)v112;
    v25 = v106;
    v24 = v107;
    obj = v49;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: no enough contacts to create contact mega bundle for coarse granularity", buf, 2u);
    }
    v41 = 0;
  }

  p_super = &v108->super;
LABEL_38:

  return v41;
}

id __78__MOContactAggregationManager__createContactMegaBundleFromBundles_parameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v4 = objc_msgSend(v3, "isOnOrAfter:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_contactCandidatesForMegaBundleFromStats:(id)a3 contactClassificationMap:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  __int128 v45;
  void *v46;
  id v47;
  NSMutableArray *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v48 = objc_opt_new(NSMutableArray);
  v49 = v7;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v50 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v50)
  {
    v12 = *(_QWORD *)v52;
    *(_QWORD *)&v11 = 138412290;
    v45 = v11;
    v46 = v10;
    v47 = v8;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v14, v45));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v14));
          v17 = objc_msgSend(v16, "unsignedIntValue");

        }
        else
        {
          v17 = 0;
        }

        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v19 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contact"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
          *(_DWORD *)buf = 138412546;
          v56 = v39;
          v57 = 2048;
          v58 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contact identifier, %@, classification, %lu", buf, 0x16u);

        }
        if ((v17 & 0x200000) == 0 && (v17 & 0x100008) != 0)
        {
          v20 = v12;
          v21 = v9;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", v14));
          v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v45;
            v56 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contactCandidates stats check: %@", buf, 0xCu);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("callCount")));
          v26 = (float)(uint64_t)objc_msgSend(v25, "longValue");
          objc_msgSend(v21, "coarseGranularity_contactBundleAggregationCallCountThreshold");
          if (v27 > v26)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("aggregatedCallDuration")));
            v29 = (float)(uint64_t)objc_msgSend(v28, "longValue");
            objc_msgSend(v21, "coarseGranularity_contactBundleAggregationCallDurationThreshold");
            if (v30 > v29)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("messageCount")));
              v32 = (float)(uint64_t)objc_msgSend(v31, "longValue");
              objc_msgSend(v21, "coarseGranularity_contactBundleAggregationMessageCountThreshold");
              if (v33 > v32)
              {

                v10 = v46;
                v8 = v47;
LABEL_22:

                v9 = v21;
                v12 = v20;
                goto LABEL_23;
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("outgoingMessageCount")));
              v35 = (float)(uint64_t)objc_msgSend(v34, "longValue");
              objc_msgSend(v21, "coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold");
              v37 = v36;

              v10 = v46;
              v8 = v47;
              if (v37 > v35)
                goto LABEL_22;
LABEL_21:
              -[NSMutableArray addObject:](v48, "addObject:", v14);
              goto LABEL_22;
            }

            v10 = v46;
            v8 = v47;
          }

          goto LABEL_21;
        }
LABEL_23:
        v13 = (char *)v13 + 1;
      }
      while (v50 != v13);
      v40 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      v50 = v40;
    }
    while (v40);
  }

  v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = -[NSMutableArray count](v48, "count");
    *(_DWORD *)buf = 134217984;
    v56 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: contactCandidates count: %lu", buf, 0xCu);
  }

  return v48;
}

- (id)_contactClassificationMapFromEventBundles:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSMutableDictionary *v39;
  void *v40;
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
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v50;
    v39 = v4;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(obj);
        v34 = v5;
        v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v5);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        if (v37)
        {
          v36 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v36)
                objc_enumerationMutation(v35);
              v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactClassificationMap"));
              v10 = objc_msgSend(v9, "count");

              if (v10)
              {
                v38 = i;
                os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v12 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventIdentifier"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactClassificationMap"));
                  v29 = objc_msgSend(v28, "count");
                  *(_DWORD *)buf = 138412546;
                  v55 = v27;
                  v56 = 2048;
                  v57 = v29;
                  _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: event identifier, %@, contactClassificationMap count, %lu", buf, 0x16u);

                }
                v43 = 0u;
                v44 = 0u;
                v41 = 0u;
                v42 = 0u;
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactClassificationMap"));
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));

                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v42;
                  do
                  {
                    for (j = 0; j != v16; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v42 != v17)
                        objc_enumerationMutation(v14);
                      v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
                      v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v21 = objc_claimAutoreleasedReturnValue(v20);
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                      {
                        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contact"));
                        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
                        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactClassificationMap"));
                        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v19));
                        *(_DWORD *)buf = 138412546;
                        v55 = v24;
                        v56 = 2112;
                        v57 = v26;
                        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contact identifier, %@, classification, %@", buf, 0x16u);

                        v4 = v39;
                      }

                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactClassificationMap"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v19));
                      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v23, v19);

                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                  }
                  while (v16);
                }

                i = v38;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
          }
          while (v37);
        }

        v5 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v33);
  }

  return v4;
}

- (id)_statsForContactFromEventBundles:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _UNKNOWN **v26;
  uint64_t v27;
  double v28;
  void *i;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  unsigned int v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  NSMutableDictionary *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  NSMutableDictionary *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];

  v3 = a3;
  v76 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002DA7C0, &off_1002DA7D8, &off_1002DA7F0, &off_1002DA808, &off_1002DA820, &off_1002DA838, &off_1002DA850, &off_1002DA868, 0);
  v73 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002DA880, &off_1002DA898, &off_1002DA8B0, 0);
  v4 = objc_opt_new(NSMutableDictionary);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v3;
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v90;
    v72 = v4;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v90 != v65)
          objc_enumerationMutation(obj);
        v67 = v5;
        v6 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v5);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v70 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
        v7 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v86;
          v68 = *(_QWORD *)v86;
          do
          {
            v10 = 0;
            v69 = v8;
            do
            {
              if (*(_QWORD *)v86 != v9)
                objc_enumerationMutation(v70);
              v71 = v10;
              v11 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactions"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recipients"));
              v15 = objc_msgSend(v14, "count");

              if ((unint64_t)v15 <= 1)
              {
                v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                if (v16)
                {
                  v17 = (void *)v16;
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contact"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v20));

                  if (v21)
                  {
                    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactions"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
                    v94 = v23;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingDescriptors:", v24));

                    v83 = 0u;
                    v84 = 0u;
                    v81 = 0u;
                    v82 = 0u;
                    v74 = v25;
                    v26 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                    v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
                    if (v78)
                    {
                      v27 = 0;
                      v79 = 0;
                      v80 = 0;
                      v77 = *(_QWORD *)v82;
                      v28 = 0.0;
                      do
                      {
                        for (i = 0; i != v78; i = (char *)i + 1)
                        {
                          if (*(_QWORD *)v82 != v77)
                            objc_enumerationMutation(v74);
                          v30 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
                          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithInteger:", objc_msgSend(v30, "mechanism")));
                          v32 = objc_msgSend(v76, "containsObject:", v31);

                          if (v32)
                          {
                            v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
                            if (v33)
                            {
                              v34 = (void *)v33;
                              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));

                              if (v35)
                              {
                                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
                                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
                                objc_msgSend(v36, "timeIntervalSinceDate:", v37);
                                v39 = v38;

                                v28 = v28 + v39;
                                if (v39 > 300.0)
                                  ++v27;
                              }
                            }
                          }
                          else
                          {
                            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithInteger:", objc_msgSend(v30, "mechanism")));
                            v41 = objc_msgSend(v73, "containsObject:", v40);

                            if (v41)
                            {
                              ++v80;
                              v42 = objc_msgSend(v30, "direction");
                              v43 = v79;
                              if (v42 == (id)1)
                                v43 = v79 + 1;
                              v79 = v43;
                            }
                          }
                          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
                          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                          v46 = objc_msgSend(v44, "containsObject:", v45);

                          if (v46)
                          {
                            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v47));
                            v49 = (NSMutableDictionary *)objc_msgSend(v48, "mutableCopy");

                            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v49, "valueForKey:", CFSTR("callCount")));
                            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", (char *)objc_msgSend(v50, "longValue") + v27));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v51, CFSTR("callCount"));

                            v75 = v27;
                            v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v49, "valueForKey:", CFSTR("aggregatedCallDuration")));
                            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", (uint64_t)(v28 + (double)(uint64_t)objc_msgSend(v52, "longValue"))));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v53, CFSTR("aggregatedCallDuration"));

                            v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v49, "valueForKey:", CFSTR("messageCount")));
                            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", (char *)objc_msgSend(v54, "longValue") + v80));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v55, CFSTR("messageCount"));

                            v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v49, "valueForKey:", CFSTR("outgoingMessageCount")));
                            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)objc_msgSend(v56, "longValue") + v79));
                            v4 = v72;
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v57, CFSTR("callCount"));

                            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                            -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v49, v58);

                            v26 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                            v27 = v75;

                          }
                          else
                          {
                            v49 = objc_opt_new(NSMutableDictionary);
                            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", v27));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v59, CFSTR("callCount"));

                            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", (uint64_t)v28));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v60, CFSTR("aggregatedCallDuration"));

                            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", v80));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v61, CFSTR("messageCount"));

                            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[317], "numberWithLong:", v79));
                            -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v62, CFSTR("outgoingMessageCount"));

                            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionScoredContact"));
                            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v49, v50);
                          }

                        }
                        v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
                      }
                      while (v78);
                    }

                    v9 = v68;
                    v8 = v69;
                  }
                }
              }
              v10 = v71 + 1;
            }
            while ((id)(v71 + 1) != v8);
            v8 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
          }
          while (v8);
        }

        v5 = v67 + 1;
      }
      while ((id)(v67 + 1) != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
    }
    while (v66);
  }

  return v4;
}

- (id)_eventsForContactFromEventBundles:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  NSMutableSet *v28;
  id v29;
  void *v30;
  id os_log;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[16];
  _BYTE v58[16];
  _BYTE v59[128];
  _BYTE v60[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v5 = v3;
  v46 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v54;
    v45 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v5);
        v47 = v6;
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v6);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v50 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactions"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recipients"));
              v16 = objc_msgSend(v15, "count");

              if ((unint64_t)v16 <= 1)
              {
                v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                if (v17)
                {
                  v18 = (void *)v17;
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contact"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v21));

                  if (v22)
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                    v25 = objc_msgSend(v23, "containsObject:", v24);

                    if (v25)
                    {
                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v26));
                      v28 = (NSMutableSet *)objc_msgSend(v27, "mutableCopy");

                      -[NSMutableSet addObject:](v28, "addObject:", v12);
                      v29 = -[NSMutableSet copy](v28, "copy");
                      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v29, v30);

                      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v32 = objc_claimAutoreleasedReturnValue(os_log);
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                        -[MOContactAggregationManager _eventsForContactFromEventBundles:].cold.2((uint64_t)v58, v28);
                    }
                    else
                    {
                      v28 = objc_opt_new(NSMutableSet);
                      -[NSMutableSet addObject:](v28, "addObject:", v12);
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionScoredContact"));
                      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v28, v33);

                      v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v32 = objc_claimAutoreleasedReturnValue(v34);
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                        -[MOContactAggregationManager _eventsForContactFromEventBundles:].cold.3((uint64_t)v57, v28);
                    }

                  }
                }
              }
            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          }
          while (v9);
        }

        v6 = v47 + 1;
        v5 = v45;
      }
      while ((id)(v47 + 1) != v46);
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v46);
  }

  v35 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    -[MOContactAggregationManager _eventsForContactFromEventBundles:].cold.1((uint64_t)v4, v36, v37, v38, v39, v40, v41, v42);

  return v4;
}

- (id)_bundlesForContact:(id)a3 fromInputBundles:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id os_log;
  NSObject *v18;
  id v20;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = objc_opt_new(NSMutableArray);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "events"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactionScoredContact"));
          v16 = objc_msgSend(v5, "containsObject:", v15);

          if (v16)
          {
            -[NSMutableArray addObject:](v21, "addObject:", v12);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v18 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v12;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: subBundles: %@", buf, 0xCu);
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v9);
    }

    v6 = v20;
  }
  else
  {
    v21 = 0;
  }

  return v21;
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
}

- (void)_createContactMegaBundleFromBundles:(uint64_t)a3 parameters:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "CoarseGranularityAggregation for contact: megabundle: %@", a5, a6, a7, a8, 2u);
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "CoarseGranularityAggregation for contact: contact eventsDict: %@", a5, a6, a7, a8, 2u);
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_1_12(a1, a2);
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v5, v6, "CoarseGranularityAggregation for contact: contact events count after modified: %lu");
  OUTLINED_FUNCTION_7_1();
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_1_12(a1, a2);
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v5, v6, "CoarseGranularityAggregation for contact: contact events count after set: %lu");
  OUTLINED_FUNCTION_7_1();
}

@end
