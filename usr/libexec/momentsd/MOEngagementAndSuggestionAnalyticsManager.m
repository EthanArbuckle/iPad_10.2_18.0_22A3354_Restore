@implementation MOEngagementAndSuggestionAnalyticsManager

- (MOEngagementAndSuggestionAnalyticsManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  MOEngagementAndSuggestionAnalyticsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  MODefaultsManager *defaultsManager;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  MOConfigurationManager *configurationManager;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  MOEngagementHistoryManager *engagementHistoryManager;
  uint64_t v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  MOEventBundleStore *eventBundleStore;
  void *v30;
  double v31;
  float v32;
  NSDate *lastAnalyticsSubmissionDate;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id os_log;
  NSObject *v39;
  NSDate *v40;
  double minimumTimeGapBetweenSubmissionsInDays;
  objc_super v43;
  uint8_t buf[4];
  NSDate *v45;
  __int16 v46;
  double v47;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)MOEngagementAndSuggestionAnalyticsManager;
  v6 = -[MOEngagementAndSuggestionAnalyticsManager init](&v43, "init");
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class(MODefaultsManager, v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v9));
    defaultsManager = v6->_defaultsManager;
    v6->_defaultsManager = (MODefaultsManager *)v10;

    v13 = (objc_class *)objc_opt_class(MOConfigurationManager, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v15));
    configurationManager = v6->_configurationManager;
    v6->_configurationManager = (MOConfigurationManager *)v16;

    v19 = (objc_class *)objc_opt_class(MOEngagementHistoryManager, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v21));
    engagementHistoryManager = v6->_engagementHistoryManager;
    v6->_engagementHistoryManager = (MOEngagementHistoryManager *)v22;

    v25 = (objc_class *)objc_opt_class(MOEventBundleStore, v24);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v27));
    eventBundleStore = v6->_eventBundleStore;
    v6->_eventBundleStore = (MOEventBundleStore *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager configurationManager](v6, "configurationManager"));
    LODWORD(v31) = 28.0;
    objc_msgSend(v30, "getFloatSettingForKey:withFallback:", CFSTR("minimumTimeGapBetweenAnalyticsSubmissionsInDays"), v31);
    v6->_minimumTimeGapBetweenSubmissionsInDays = v32;

    lastAnalyticsSubmissionDate = v6->_lastAnalyticsSubmissionDate;
    v6->_lastAnalyticsSubmissionDate = 0;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager defaultsManager](v6, "defaultsManager"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("LastAnalyticsSubmissionDate")));

    if (v35)
    {
      v37 = objc_opt_class(NSDate, v36);
      if ((objc_opt_isKindOfClass(v35, v37) & 1) != 0)
        objc_storeStrong((id *)&v6->_lastAnalyticsSubmissionDate, v35);
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v39 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = v6->_lastAnalyticsSubmissionDate;
      minimumTimeGapBetweenSubmissionsInDays = v6->_minimumTimeGapBetweenSubmissionsInDays;
      *(_DWORD *)buf = 138412546;
      v45 = v40;
      v46 = 2048;
      v47 = minimumTimeGapBetweenSubmissionsInDays;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "EngagementAndSuggestionAnalyticsManager is initialized: lastAnalyticsSubmissionDate=%@ minimumTimeGapBetweenSubmissionsInDays=%.1f", buf, 0x16u);
    }

  }
  return v6;
}

- (void)submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  id v11;
  id v12;
  MOPerformanceMeasurement *v13;
  _QWORD v14[4];
  MOPerformanceMeasurement *v15;
  MOEngagementAndSuggestionAnalyticsManager *v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitSuggestionPerformanceAnalytics", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("SubmitSuggestionPerformanceAnalytics"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v14[3] = &unk_1002B5050;
  v15 = v10;
  v16 = self;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  v13 = v10;
  -[MOEngagementAndSuggestionAnalyticsManager submitSuggestionPerformanceAnalyticsWithOnboardingStatus:AndCompletionHandler:](self, "submitSuggestionPerformanceAnalyticsWithOnboardingStatus:AndCompletionHandler:", v11, v14);

}

void __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  id v12;
  NSObject *v13;
  MOPerformanceMeasurement *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSMutableDictionary *v18;
  MOPerformanceMeasurement *v19;
  _QWORD v20[4];
  MOPerformanceMeasurement *v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitSuggestionPerformanceAnalytics", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[submitSuggestionPerformanceAnalytics] result:%@, error:%@", buf, 0x16u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v11 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v6);
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitEngagementAnalytics", ", buf, 2u);
    }

    v14 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("SubmitEngagementAnalytics"), 0);
    -[MOPerformanceMeasurement startSession](v14, "startSession");
    v15 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_79;
    v20[3] = &unk_1002B5028;
    v21 = v14;
    v22 = v11;
    v17 = *(id *)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = v17;
    v18 = v11;
    v19 = v14;
    objc_msgSend(v15, "submitEngagementAnalyticsWithOnboardingStatus:AndCompletionHandler:", v16, v20);

  }
}

void __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitEngagementAnalytics", ", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[submitEngagementAnalytics] result:%@, error:%@", (uint8_t *)&v16, 0x16u);
  }

  if (v6 && objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);
  if (v5)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "setLastAnalyticsSubmissionDate"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("lastAnalyticsSubmissionDate"));

    v13 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(void **)(a1 + 40);
      v16 = 138412290;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[submitEngagementAndSuggestionPerformanceAnalytics] completed analytics submission. Result:%@", (uint8_t *)&v16, 0xCu);
    }

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v11();

}

- (void)submitEngagementAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *context;
  id v35;
  NSMutableDictionary *v36;
  _QWORD v37[4];
  id v38;
  _UNKNOWN **v39;
  MOEngagementAndSuggestionAnalyticsManager *v40;
  id v41;
  id v42;
  _UNKNOWN **v43;
  _UNKNOWN **v44;
  _UNKNOWN **v45;
  id v46;
  _BYTE *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  _BYTE buf[24];
  uint64_t v57;

  v35 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  v36 = objc_opt_new(NSMutableDictionary);
  context = objc_autoreleasePoolPush();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Submitting engagement metric analytics", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager engagementHistoryManager](self, "engagementHistoryManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", -2419200.0));
  v55 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchSuggestionEngagementEventsWithTypes:fromStartDate:toEndDate:withError:", &off_1002DCB90, v11, v9, &v55));
  v13 = v55;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager engagementHistoryManager](self, "engagementHistoryManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", -2419200.0));
  v54 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchAppEntryEngagementEventsWithTypes:fromStartDate:toEndDate:withError:", &off_1002DCBA8, v15, v9, &v54));
  v17 = v54;

  if (v17)
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[submitEngagementAnalytics] Biome sink error:%@", buf, 0xCu);
    }

    v6[2](v6, v17, 0);
  }
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v12, "count");
    v23 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Total fetched suggestion engagement event count: %lu, journal entry engagement event count: %lu", buf, 0x16u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementAndSuggestionAnalyticsParams aggregationWindowMap](MOEngagementAndSuggestionAnalyticsParams, "aggregationWindowMap"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  objc_msgSend(v9, "timeIntervalSince1970");
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementAndSuggestionAnalyticsParams bundleSubTypeToAnalyticsSuggestionTypeMap](MOEngagementAndSuggestionAnalyticsParams, "bundleSubTypeToAnalyticsSuggestionTypeMap"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v37[3] = &unk_1002B50C8;
  v49 = v26;
  v28 = v16;
  v38 = v28;
  v39 = &off_1002DCBC0;
  v40 = self;
  v29 = v35;
  v41 = v29;
  v47 = buf;
  v30 = v12;
  v42 = v30;
  v43 = &off_1002DCBD8;
  v44 = &off_1002DCC08;
  v45 = &off_1002DCBF0;
  v31 = v27;
  v46 = v31;
  v48 = &v50;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v51[3]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v32, CFSTR("suggestionEngagementAnalyticsPayloadCount"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v33, CFSTR("journalEntryEngagementAnalyticsPayloadCount"));

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(context);
  ((void (**)(id, id, NSMutableDictionary *))v6)[2](v6, 0, v36);

}

void __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  signed int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  unint64_t v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  signed int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  unsigned __int8 v41;
  int v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  void *m;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  BOOL v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  float v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  id v109;
  id v110;
  NSObject *v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  void *context;
  void *v122;
  void *j;
  void *k;
  id v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  unsigned int v134;
  uint64_t v135;
  id v136;
  void *v137;
  uint64_t v138;
  NSMutableSet *v139;
  NSMutableSet *v140;
  NSMutableSet *v141;
  NSMutableSet *v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  unint64_t v149;
  unint64_t v150;
  id obj;
  char *obja;
  unsigned int v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  unsigned int v157;
  unsigned int v158;
  void *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  unsigned int v163;
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _QWORD v186[4];
  id v187;
  uint64_t v188;
  _QWORD v189[4];
  id v190;
  _QWORD v191[11];
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _QWORD v216[4];
  id v217;
  uint64_t v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  uint8_t v223[128];
  uint8_t v224[4];
  id v225;
  _BYTE buf[24];
  uint64_t v227;
  _BYTE v228[128];

  v144 = a2;
  v5 = a3;
  v216[0] = _NSConcreteStackBlock;
  v216[1] = 3221225472;
  v216[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2;
  v216[3] = &unk_1002B5078;
  v154 = a1;
  v218 = *(_QWORD *)(a1 + 120);
  v148 = v5;
  v217 = v148;
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v216));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v127));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v143, "count");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v148;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Journal entryengagement event count from the last %@days=%lu", buf, 0x16u);
  }

  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  obj = *(id *)(a1 + 40);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v228, 16);
  if (v9)
  {
    v162 = *(_QWORD *)v213;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v213 != v162)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)i);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_getDefaultAnalyticsResultWithOnboardingStatus:", *(_QWORD *)(a1 + 56)));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v144, CFSTR("aggregationWindow"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("journalEntryType"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002DB150, CFSTR("appType"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002DB150, CFSTR("suggestionType"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002DB150, CFSTR("suggestionUIPlacement"));
        v14 = objc_msgSend(v11, "intValue");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v227 = 0;
        v208 = 0;
        v209 = &v208;
        v210 = 0x2020000000;
        v211 = 0;
        v204 = 0;
        v205 = &v204;
        v206 = 0x2020000000;
        v207 = 0;
        v200 = 0;
        v201 = &v200;
        v202 = 0x2020000000;
        v203 = 0;
        v196 = 0;
        v197 = &v196;
        v198 = 0x2020000000;
        v199 = 0;
        v192 = 0;
        v193 = &v192;
        v194 = 0x2020000000;
        v195 = 0;
        v191[0] = _NSConcreteStackBlock;
        v191[1] = 3221225472;
        v191[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_124;
        v191[3] = &unk_1002B50A0;
        v191[10] = v14;
        v191[4] = buf;
        v191[5] = &v192;
        v191[6] = &v196;
        v191[7] = &v200;
        v191[8] = &v204;
        v191[9] = &v208;
        objc_msgSend(v143, "enumerateObjectsUsingBlock:", v191);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24)));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("journalEntryCreatedCount"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v209[3]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("journalEntryCancelledCount"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v205[3]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("journalEntryDeletedCount"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v201[3]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("journalEntryEditedCount"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v197[3]));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("journalEntryWithZeroCharacterCount"));

        v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        if (v21)
        {
          *(float *)&v20 = (float)(unint64_t)v193[3] / (float)v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOEngagementAndSuggestionAnalyticsParams getCharacterCountBin:](MOEngagementAndSuggestionAnalyticsParams, "getCharacterCountBin:", v20)));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("journalEntryAvgCharacterCountBinned"));

        }
        else
        {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002DB150, CFSTR("journalEntryAvgCharacterCountBinned"));
        }
        if (v13)
        {
          v189[0] = _NSConcreteStackBlock;
          v189[1] = 3221225472;
          v189[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2_135;
          v189[3] = &unk_1002B2238;
          v23 = v13;
          v190 = v23;
          AnalyticsSendEventLazy(CFSTR("com.apple.Moments.EngagementAggregatedMetrics"), v189);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
          v24 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v224 = 138412290;
            v225 = v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Journal entry engagement analytics result was submitted: %@", v224, 0xCu);
          }

        }
        _Block_object_dispose(&v192, 8);
        _Block_object_dispose(&v196, 8);
        _Block_object_dispose(&v200, 8);
        _Block_object_dispose(&v204, 8);
        _Block_object_dispose(&v208, 8);
        _Block_object_dispose(buf, 8);

        objc_autoreleasePoolPop(v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v228, 16);
    }
    while (v9);
  }

  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_137;
  v186[3] = &unk_1002B5078;
  v188 = *(_QWORD *)(a1 + 120);
  v115 = v148;
  v187 = v115;
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v186));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "filteredArrayUsingPredicate:", v122));
  v26 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = objc_msgSend(v129, "count");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v115;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Suggestion engagement event count from the last %@ days %lu", buf, 0x16u);
  }

  v184 = 0u;
  v185 = 0u;
  v182 = 0u;
  v183 = 0u;
  v116 = *(id *)(a1 + 72);
  v125 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v182, v223, 16);
  if (v125)
  {
    v113 = *(_QWORD *)v183;
    *(_QWORD *)&v29 = 138412290;
    v112 = v29;
    do
    {
      for (j = 0; j != v125; j = (char *)j + 1)
      {
        if (*(_QWORD *)v183 != v113)
          objc_enumerationMutation(v116);
        v130 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * (_QWORD)j);
        v178 = 0u;
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v117 = *(id *)(v154 + 80);
        v126 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v178, v222, 16);
        if (v126)
        {
          v114 = *(_QWORD *)v179;
          do
          {
            for (k = 0; k != v126; k = (char *)k + 1)
            {
              if (*(_QWORD *)v179 != v114)
                objc_enumerationMutation(v117);
              v131 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * (_QWORD)k);
              v174 = 0u;
              v175 = 0u;
              v176 = 0u;
              v177 = 0u;
              v119 = *(id *)(v154 + 88);
              v128 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v174, v221, 16);
              if (v128)
              {
                v118 = *(_QWORD *)v175;
                do
                {
                  v30 = 0;
                  do
                  {
                    if (*(_QWORD *)v175 != v118)
                    {
                      v31 = v30;
                      objc_enumerationMutation(v119);
                      v30 = v31;
                    }
                    v120 = v30;
                    v32 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v30);
                    context = objc_autoreleasePoolPush();
                    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v154 + 48), "_getDefaultAnalyticsResultWithOnboardingStatus:", *(_QWORD *)(v154 + 56)));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v144, CFSTR("aggregationWindow"));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v130, CFSTR("appType"));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v32, CFSTR("suggestionType"));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v131, CFSTR("suggestionUIPlacement"));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", &off_1002DB150, CFSTR("journalEntryType"));
                    v134 = objc_msgSend(v130, "intValue");
                    v33 = objc_msgSend(v32, "intValue");
                    v158 = objc_msgSend(v131, "intValue");
                    v142 = objc_opt_new(NSMutableSet);
                    v141 = objc_opt_new(NSMutableSet);
                    v140 = objc_opt_new(NSMutableSet);
                    v139 = objc_opt_new(NSMutableSet);
                    v172 = 0u;
                    v173 = 0u;
                    v170 = 0u;
                    v171 = 0u;
                    v133 = v129;
                    v136 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v170, v220, 16);
                    if (!v136)
                    {
                      obja = 0;
                      v146 = 0;
                      v147 = 0;
                      v149 = 0;
                      v150 = 0;
                      goto LABEL_121;
                    }
                    obja = 0;
                    v146 = 0;
                    v147 = 0;
                    v149 = 0;
                    v150 = 0;
                    v161 = v33;
                    v135 = *(_QWORD *)v171;
                    do
                    {
                      v34 = 0;
                      do
                      {
                        if (*(_QWORD *)v171 != v135)
                        {
                          v35 = v34;
                          objc_enumerationMutation(v133);
                          v34 = v35;
                        }
                        v138 = v34;
                        v36 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v34);
                        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("suggestionEvent"), v112));

                        if (!v37)
                          goto LABEL_117;
                        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("suggestionEvent")));
                        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("type")));
                        v153 = objc_msgSend(v38, "intValue");

                        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("clientIdentifier")));
                        v39 = v134;
                        switch(v134)
                        {
                          case 1u:
                            goto LABEL_46;
                          case 3u:
                            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                            if ((objc_msgSend(v137, "isEqual:", v40) & 1) == 0)
                            {
                              v157 = objc_msgSend(v137, "isEqualToString:", CFSTR("com.apple.journal")) ^ 1;
                              goto LABEL_51;
                            }
                            break;
                          case 2u:
                            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                            if ((objc_msgSend(v137, "isEqual:", v40) & 1) == 0)
                            {
                              v41 = objc_msgSend(v137, "isEqualToString:", CFSTR("com.apple.journal"));

                              if ((v41 & 1) != 0)
                              {
                                v39 = 1;
LABEL_46:
                                v157 = v39;
                                goto LABEL_52;
                              }
LABEL_47:
                              v157 = 0;
                              goto LABEL_52;
                            }
                            break;
                          default:
                            goto LABEL_47;
                        }
                        v157 = 0;
LABEL_51:

LABEL_52:
                        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("viewContainerName")));
                        v42 = v158;
                        if (v158 != 1)
                        {
                          if (v158 == 3)
                          {
                            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                            if ((objc_msgSend(v159, "isEqual:", v43) & 1) != 0)
LABEL_61:
                              v163 = 0;
                            else
                              v163 = objc_msgSend(v159, "isEqualToString:", CFSTR("Recent"));

                            goto LABEL_64;
                          }
                          if (v158 != 2)
                            goto LABEL_59;
                          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                          if ((objc_msgSend(v159, "isEqual:", v43) & 1) != 0)
                            goto LABEL_61;
                          v44 = objc_msgSend(v159, "isEqualToString:", CFSTR("Recommended"));

                          if ((v44 & 1) == 0)
                          {
LABEL_59:
                            v163 = 0;
                            goto LABEL_64;
                          }
                          v42 = 1;
                        }
                        v163 = v42;
LABEL_64:
                        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("fullBundleOrderedSet")));

                        if (!v45)
                          goto LABEL_116;
                        v155 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("fullBundleOrderedSet")));
                        v168 = 0u;
                        v169 = 0u;
                        v166 = 0u;
                        v167 = 0u;
                        v160 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v166, v219, 16);
                        if (!v160)
                          goto LABEL_115;
                        v156 = *(_QWORD *)v167;
                        do
                        {
                          for (m = 0; m != v160; m = (char *)m + 1)
                          {
                            if (*(_QWORD *)v167 != v156)
                              objc_enumerationMutation(v155);
                            v47 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * (_QWORD)m);
                            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
                            if ((_DWORD)v161 == 1)
                            {
                              v49 = 1;
                            }
                            else
                            {
                              v50 = *(void **)(v154 + 96);
                              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v161));
                              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v51));

                              v49 = objc_msgSend(v52, "containsObject:", v48);
                            }
                            if (v158 == 5)
                            {
                              v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                              if ((objc_msgSend(v159, "isEqual:", v57) & 1) != 0
                                || !objc_msgSend(v159, "isEqualToString:", CFSTR("Recommended")))
                              {
                                v60 = 0;
                              }
                              else
                              {
                                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
                                v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                                if ((objc_msgSend(v58, "isEqual:", v59) & 1) != 0)
                                {
                                  v60 = 0;
                                }
                                else
                                {
                                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
                                  if (v63)
                                  {
                                    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
                                    v60 = (int)objc_msgSend(v64, "intValue") < 11;

                                  }
                                  else
                                  {
                                    v60 = 0;
                                  }

                                }
                              }

                              goto LABEL_95;
                            }
                            if (v158 != 4)
                            {
                              v60 = 0;
LABEL_95:
                              v62 = v163;
                              goto LABEL_96;
                            }
                            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                            if ((objc_msgSend(v159, "isEqual:", v53) & 1) != 0
                              || !objc_msgSend(v159, "isEqualToString:", CFSTR("Recommended")))
                            {
                              v56 = 0;
                            }
                            else
                            {
                              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
                              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                              if ((objc_msgSend(v54, "isEqual:", v55) & 1) != 0)
                              {
                                v56 = 0;
                              }
                              else
                              {
                                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
                                v56 = (int)objc_msgSend(v61, "intValue") < 6;

                              }
                            }

                            v60 = 0;
                            v62 = v56 | v163;
LABEL_96:
                            v65 = v60 | v62;
                            v163 = v65;
                            if (v157 && v49 && (v65 & 1) != 0)
                            {
                              switch(v153)
                              {
                                case 1u:
                                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                  ++v150;
                                  if (v66)
                                  {
                                    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                    v69 = v68 == 0;

                                    if (!v69)
                                    {
                                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                      -[NSMutableSet addObject:](v140, "addObject:", v71);

                                    }
                                  }
                                  break;
                                case 6u:
                                  ++v147;
                                  break;
                                case 8u:
                                  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                  ++v149;
                                  if (v72)
                                  {
                                    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                    v75 = v74 == 0;

                                    if (!v75)
                                    {
                                      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                      -[NSMutableSet addObject:](v141, "addObject:", v77);

                                    }
                                  }
                                  break;
                                case 9u:
                                  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                  ++obja;
                                  if (v78)
                                  {
                                    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                    v81 = v80 == 0;

                                    if (!v81)
                                    {
                                      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                      -[NSMutableSet addObject:](v142, "addObject:", v83);

                                    }
                                  }
                                  break;
                                case 0xCu:
                                  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                  ++v146;
                                  if (v84)
                                  {
                                    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                    v87 = v86 == 0;

                                    if (!v87)
                                    {
                                      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
                                      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("suggestionId")));
                                      -[NSMutableSet addObject:](v139, "addObject:", v89);

                                    }
                                  }
                                  break;
                                default:
                                  break;
                              }
                            }

                          }
                          v160 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v166, v219, 16);
                        }
                        while (v160);
LABEL_115:

LABEL_116:
LABEL_117:
                        v34 = v138 + 1;
                      }
                      while ((id)(v138 + 1) != v136);
                      v136 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v170, v220, 16);
                    }
                    while (v136);
LABEL_121:

                    v90 = -[NSMutableSet count](v142, "count");
                    v91 = -[NSMutableSet count](v139, "count");
                    v92 = -[NSMutableSet count](v141, "count");
                    v93 = -[NSMutableSet count](v140, "count");
                    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v150));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v94, CFSTR("suggestionSelectedCount"));

                    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v147));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v95, CFSTR("suggestionDeletedCount"));

                    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v149));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v96, CFSTR("suggestionQuickAddCount"));

                    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v146));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v97, CFSTR("totalviewedInterstitialCount"));

                    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", obja));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v98, CFSTR("totalViewedSuggestionCount"));

                    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v90));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v99, CFSTR("uniqueViewedSuggestionCount"));

                    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v91));
                    objc_msgSend(v132, "setObject:forKeyedSubscript:", v100, CFSTR("uniqueViewedInterstitalCount"));

                    if (v90)
                    {
                      v102 = (float)(unint64_t)v90;
                      *(float *)&v101 = (float)((float)(unint64_t)v92 / (float)(unint64_t)v90) * 100.0;
                      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v101));
                      objc_msgSend(v132, "setObject:forKeyedSubscript:", v103, CFSTR("uniqueSuggestionViewToQuickAddConversionRate"));

                      *(float *)&v104 = (float)((float)(unint64_t)v93 / v102) * 100.0;
                      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v104));
                      objc_msgSend(v132, "setObject:forKeyedSubscript:", v105, CFSTR("uniqueSuggestionViewToSelectConversionRate"));

                    }
                    if (obja)
                    {
                      *(float *)&v101 = (float)((float)v149 / (float)(unint64_t)obja) * 100.0;
                      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v101));
                      objc_msgSend(v132, "setObject:forKeyedSubscript:", v106, CFSTR("totalSuggestionViewToQuickAddConversionRate"));

                      *(float *)&v107 = (float)((float)v150 / (float)(unint64_t)obja) * 100.0;
                      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v107));
                      objc_msgSend(v132, "setObject:forKeyedSubscript:", v108, CFSTR("totalSuggestionViewToSelectConversionRate"));

                    }
                    if (v132)
                    {
                      v164[0] = _NSConcreteStackBlock;
                      v164[1] = 3221225472;
                      v164[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_160;
                      v164[3] = &unk_1002B2238;
                      v109 = v132;
                      v165 = v109;
                      AnalyticsSendEventLazy(CFSTR("com.apple.Moments.EngagementAggregatedMetrics"), v164);
                      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v154 + 112) + 8) + 24);
                      v110 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
                      v111 = objc_claimAutoreleasedReturnValue(v110);
                      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v112;
                        *(_QWORD *)&buf[4] = v109;
                        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "Suggestion engagement analytics result was submitted: %@", buf, 0xCu);
                      }

                    }
                    objc_autoreleasePoolPop(context);
                    v30 = v120 + 1;
                  }
                  while ((id)(v120 + 1) != v128);
                  v128 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v174, v221, 16);
                }
                while (v128);
              }

            }
            v126 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v178, v222, 16);
          }
          while (v126);
        }

      }
      v125 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v182, v223, 16);
    }
    while (v125);
  }

}

BOOL __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  float v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  float v21;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryEvent")));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryEvent"))),
        v8 = objc_opt_class(NSDictionary, v7),
        isKindOfClass = objc_opt_isKindOfClass(v6, v8),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryEvent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestamp")));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryEvent")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp")));
      objc_msgSend(v13, "floatValue");
      v15 = v14;
      v16 = *(double *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "floatValue");
      if (v16 + (float)(v17 * -86400.0) <= v15)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryEvent")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("timestamp")));
        objc_msgSend(v20, "floatValue");
        v18 = *(double *)(a1 + 40) >= v21;

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_124(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("entryEvent")));

  v4 = v15;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("entryEvent")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type")));
    v7 = objc_msgSend(v6, "intValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleEvergreenTypes")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleInterfaceTypes")));
    v10 = a1[10];
    if (v10 == 1)
      goto LABEL_13;
    if (v10 == 2)
    {
      if (!objc_msgSend(v8, "count") && !objc_msgSend(v9, "count"))
        goto LABEL_13;
      v10 = a1[10];
    }
    if (v10 == 3)
    {
      if (objc_msgSend(v8, "count"))
        goto LABEL_13;
      v10 = a1[10];
    }
    if (v10 != 4 || objc_msgSend(v8, "count") || !objc_msgSend(v9, "count"))
    {
LABEL_21:

      v4 = v15;
      goto LABEL_22;
    }
LABEL_13:
    switch(v7)
    {
      case 1u:
        ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalCharacters")));
        v12 = objc_msgSend(v11, "intValue");

        if (v12 < 1)
        {
          v14 = a1[6];
          goto LABEL_20;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalCharacters")));
        *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += (int)objc_msgSend(v13, "intValue");

        goto LABEL_21;
      case 2u:
        v14 = a1[7];
        goto LABEL_20;
      case 3u:
        v14 = a1[8];
        goto LABEL_20;
      case 4u:
        v14 = a1[9];
LABEL_20:
        ++*(_QWORD *)(*(_QWORD *)(v14 + 8) + 24);
        break;
      default:
        goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_22:

}

id __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2_135(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  float v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  float v21;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionEvent")));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionEvent"))),
        v8 = objc_opt_class(NSDictionary, v7),
        isKindOfClass = objc_opt_isKindOfClass(v6, v8),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionEvent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestamp")));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionEvent")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp")));
      objc_msgSend(v13, "floatValue");
      v15 = v14;
      v16 = *(double *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "floatValue");
      if (v16 + (float)(v17 * -86400.0) <= v15)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionEvent")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("timestamp")));
        objc_msgSend(v20, "floatValue");
        v18 = *(double *)(a1 + 40) >= v21;

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_160(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  MOEventBundleFetchOptions *v12;
  void *v13;
  id v14;
  id v15;
  NSMutableDictionary *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  NSMutableDictionary *v21;
  id v22;
  uint8_t buf[4];
  NSMutableDictionary *v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = objc_autoreleasePoolPush();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric analytics", buf, 2u);
  }

  v12 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, 1, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager eventBundleStore](self, "eventBundleStore"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __123__MOEngagementAndSuggestionAnalyticsManager_submitSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v19[3] = &unk_1002B2678;
  v14 = v7;
  v22 = v14;
  v19[4] = self;
  v15 = v6;
  v20 = v15;
  v16 = v8;
  v21 = v16;
  objc_msgSend(v13, "fetchEventBundleWithOptions:CompletionHandler:", v12, v19);

  v17 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Suggestion perf analytics submission was completed. Result: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v9);
  (*((void (**)(id, _QWORD, NSMutableDictionary *))v14 + 2))(v14, 0, v16);

}

void __123__MOEngagementAndSuggestionAnalyticsManager_submitSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134218242;
    v10 = objc_msgSend(v5, "count");
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetched bundle count, %lu, error, %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_submitSuggestionPerformanceAnalyticsFromEventBundles:WithOnboardingStatus:andCompletionResult:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_submitSuggestionPerformanceAnalyticsFromEventBundles:(id)a3 WithOnboardingStatus:(id)a4 andCompletionResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _UNKNOWN **v24;
  id v25;
  MOEngagementAndSuggestionAnalyticsManager *v26;
  id v27;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric for %lu bundles.", (uint8_t *)&buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementAndSuggestionAnalyticsParams aggregationWindowMap](MOEngagementAndSuggestionAnalyticsParams, "aggregationWindowMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementAndSuggestionAnalyticsParams suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap](MOEngagementAndSuggestionAnalyticsParams, "suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x2020000000;
  v31 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke;
  v21[3] = &unk_1002B5118;
  v16 = v13;
  v22 = v16;
  v17 = v8;
  v23 = v17;
  v24 = &off_1002DCC20;
  v18 = v15;
  v25 = v18;
  v26 = self;
  v19 = v9;
  v27 = v19;
  p_buf = &buf;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24)));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("suggestionAnalyticsPayloadCount"));

  _Block_object_dispose(&buf, 8);
}

void __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  float v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSMutableSet *v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  void *i;
  void *v28;
  void *v29;
  NSMutableSet *v30;
  void *v31;
  void *v32;
  double v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *context;
  uint64_t v60;
  NSMutableSet *v61;
  NSMutableSet *v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];

  v52 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v49 = v5;
  objc_msgSend(v5, "floatValue");
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", (float)(v7 * -86400.0)));
  v63 = a1;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@ AND endDate <= %@"), v48, *(_QWORD *)(a1 + 32)));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "filteredArrayUsingPredicate:"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v79 = v49;
    v80 = 2048;
    v81 = objc_msgSend(v53, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric from the last %@days: bundleCount=%lu.", buf, 0x16u);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = *(id *)(a1 + 48);
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v54)
  {
    v51 = *(_QWORD *)v74;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v74 != v51)
          objc_enumerationMutation(obj);
        v60 = v10;
        v11 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v10);
        context = objc_autoreleasePoolPush();
        v12 = (int)objc_msgSend(v11, "intValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v63 + 56), "objectForKeyedSubscript:", v11));
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_172;
        v70[3] = &unk_1002B50F0;
        v58 = v13;
        v71 = v58;
        v72 = v12;
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v70));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "filteredArrayUsingPredicate:"));
        v15 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = objc_msgSend(v14, "count");
          *(_DWORD *)buf = 138412802;
          v79 = v11;
          v80 = 2112;
          v81 = v49;
          v82 = 2048;
          v83 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric for suggestionVisibilityCategory %@ from the last %@days : bundleCount=%lu.", buf, 0x20u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v63 + 64), "_getDefaultAnalyticsResultWithOnboardingStatus:", *(_QWORD *)(v63 + 72)));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v52, CFSTR("aggregationWindow"));
        v56 = v18;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionUIVisibilityCategory"));
        v55 = objc_msgSend(v14, "count");
        v62 = objc_opt_new(NSMutableSet);
        v61 = objc_opt_new(NSMutableSet);
        v19 = objc_opt_new(NSMutableSet);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v20 = v14;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        if (!v21)
        {
          v23 = 0;
          v25 = 0.0;
          v26 = -INFINITY;
          goto LABEL_31;
        }
        v22 = v21;
        v23 = 0;
        v24 = *(_QWORD *)v67;
        v25 = 0.0;
        v26 = -INFINITY;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v67 != v24)
              objc_enumerationMutation(v20);
            v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v28, "bundleSuperType") == (id)6 || objc_msgSend(v28, "bundleSuperType") == (id)7)
            {
              if (objc_msgSend(v28, "bundleSuperType") == (id)6 && objc_msgSend(v28, "bundleSubType"))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "bundleSubType")));
                v30 = v19;
LABEL_26:
                -[NSMutableSet addObject:](v30, "addObject:", v29);

                continue;
              }
            }
            else
            {
              v31 = *(void **)(v63 + 32);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
              objc_msgSend(v31, "timeIntervalSinceDate:", v32);
              v34 = v33 / 86400.0;

              if (v26 < v34)
                v26 = v34;
              if (objc_msgSend(v28, "bundleSuperType"))
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "bundleSuperType")));
                -[NSMutableSet addObject:](v61, "addObject:", v35);

              }
              ++v23;
              v25 = v25 + v34;
              if (objc_msgSend(v28, "bundleSubType"))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "bundleSubType")));
                v30 = v62;
                goto LABEL_26;
              }
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        }
        while (v22);
LABEL_31:

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v55));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v36, CFSTR("suggestionCount"));

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v19, "count")));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v37, CFSTR("uniquePhotoMemorySuggestionSubTypeCount"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v62, "count")));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v38, CFSTR("uniqueSensedSuggestionSubTypeCount"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v61, "count")));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v39, CFSTR("uniqueSensedSuggestionSuperTypeCount"));

        if (v23)
        {
          *(float *)&v40 = v25 / (float)v23;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v41, CFSTR("avgAgeofSensedSuggestionsInDays"));

          *(float *)&v42 = v26 * 100.0;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42));
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v43, CFSTR("maxAgeofSensedSuggestionsInDays"));

        }
        if (v56)
        {
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_174;
          v64[3] = &unk_1002B2238;
          v44 = v56;
          v65 = v44;
          AnalyticsSendEventLazy(CFSTR("com.apple.Moments.SuggestionPerformanceAggregatedMetrics"), v64);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v63 + 80) + 8) + 24);
          v45 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v44;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Suggestion perf analytics result was submitted: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(context);
        v10 = v60 + 1;
      }
      while ((id)(v60 + 1) != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v54);
  }

}

BOOL __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  _BOOL8 v14;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("visibilityCategoryForUI")));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ordinalRankInRecommendedTab")));

      if (v9 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9))
      {
        v12 = *(_QWORD *)(a1 + 40);
        if (v12 == 5)
        {
          if (v11)
          {
            v13 = 11;
            goto LABEL_12;
          }
        }
        else
        {
          if (v12 != 4)
          {
            v14 = 1;
            goto LABEL_14;
          }
          if (v11)
          {
            v13 = 6;
LABEL_12:
            v14 = (int)objc_msgSend(v11, "intValue") < v13;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      v14 = 0;
      goto LABEL_14;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

id __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_174(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_getDefaultAnalyticsResultWithOnboardingStatus:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  double v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  LODWORD(v5) = 1120403456;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("scalingFactorForAnalyticsKey"));

  if (v3)
    -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v3);

  return v4;
}

- (BOOL)isReadyToSubmitAnalytics
{
  NSDate *lastAnalyticsSubmissionDate;
  double v4;
  id os_log;
  NSObject *v7;

  lastAnalyticsSubmissionDate = self->_lastAnalyticsSubmissionDate;
  if (lastAnalyticsSubmissionDate)
  {
    -[NSDate timeIntervalSinceNow](lastAnalyticsSubmissionDate, "timeIntervalSinceNow");
    *(float *)&v4 = v4 / -86400.0;
    return self->_minimumTimeGapBetweenSubmissionsInDays < *(float *)&v4;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MOEngagementAndSuggestionAnalyticsManager isReadyToSubmitAnalytics].cold.1(v7);

    return 1;
  }
}

- (id)setLastAnalyticsSubmissionDate
{
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;
  NSDate *lastAnalyticsSubmissionDate;
  int v9;
  NSDate *v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementAndSuggestionAnalyticsManager defaultsManager](self, "defaultsManager"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("LastAnalyticsSubmissionDate"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    lastAnalyticsSubmissionDate = self->_lastAnalyticsSubmissionDate;
    v9 = 138412546;
    v10 = lastAnalyticsSubmissionDate;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Last analytics submission date was updated from %@ to %@", (uint8_t *)&v9, 0x16u);
  }

  return v3;
}

- (NSDate)lastAnalyticsSubmissionDate
{
  return self->_lastAnalyticsSubmissionDate;
}

- (float)minimumTimeGapBetweenSubmissionsInDays
{
  return self->_minimumTimeGapBetweenSubmissionsInDays;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementHistoryManager, a3);
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_lastAnalyticsSubmissionDate, 0);
}

- (void)isReadyToSubmitAnalytics
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Engagement and suggestion analytics were never submitted. Attempting to submit new analytics", v1, 2u);
}

@end
