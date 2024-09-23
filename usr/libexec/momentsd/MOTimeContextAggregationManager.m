@implementation MOTimeContextAggregationManager

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id os_log;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_autoreleasePoolPush();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v24 = a5;
    v25 = 2048;
    v26 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TimeContextAggregation (granularity=%lu): Input eventBundles count, %lu", buf, 0x16u);
  }

  if ((unint64_t)objc_msgSend(v10, "count") <= 1)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "TimeContextAggregation (granularity=%lu): Insufficient event bundles (<2). Skip summarization", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (a5 == 2)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_246;
    v19[3] = &unk_1002ADFD8;
    v20 = v12;
    -[MOTimeContextAggregationManager _aggregateBundlesForCoarseGranularity:withParameters:handler:](self, "_aggregateBundlesForCoarseGranularity:withParameters:handler:", v10, v11, v19);
    v18 = v20;
    goto LABEL_12;
  }
  if (a5 == 1)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v21[3] = &unk_1002ADFD8;
    v22 = v12;
    -[MOTimeContextAggregationManager _aggregateBundlesForFineGranularity:withParameters:handler:](self, "_aggregateBundlesForFineGranularity:withParameters:handler:", v10, v11, v21);
    v18 = v22;
LABEL_12:

    goto LABEL_13;
  }
LABEL_10:
  (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
LABEL_13:
  objc_autoreleasePoolPop(v13);

}

void __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_246(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_msgSend(v8, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v15)
    {
      v16 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: input eventBundles count, %lu", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _megaBundlesFromOutingActivityTimeContextBundles:parameters:granularity:](self, "_megaBundlesFromOutingActivityTimeContextBundles:parameters:granularity:", v8, v9, 1));
    if (objc_msgSend(v17, "count"))
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "setSummarizationGranularity:", 1, (_QWORD)v27);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v20);
      }

    }
    v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: output eventBundles count, %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v11);
    v26 = objc_autoreleasePoolPush();
    v10[2](v10, v17, 0);
    objc_autoreleasePoolPop(v26);

  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: No eventBundle to be proccessed", buf, 2u);
    }

    v10[2](v10, 0, 0);
    objc_autoreleasePoolPop(v11);
  }

}

- (id)_megaBundlesFromOutingActivityTimeContextBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  void *j;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  id v81;
  id v82;
  unint64_t v83;
  int v84;
  unsigned int v85;
  unint64_t v86;
  void *v87;
  unsigned int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSMutableDictionary *v93;
  void *v94;
  unsigned __int8 v95;
  int v96;
  void *v97;
  void *v98;
  NSMutableDictionary *v99;
  void *v100;
  void *v101;
  NSMutableDictionary *v102;
  void *v103;
  unsigned __int8 v104;
  void *v105;
  void *v106;
  void *v107;
  unsigned __int8 v108;
  void *v109;
  void *v110;
  void *v111;
  unsigned __int8 v112;
  void *v113;
  void *v114;
  unsigned __int8 v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  id v122;
  NSObject *v123;
  void *v124;
  id v125;
  id v126;
  uint64_t v127;
  void *k;
  uint64_t v129;
  void *v130;
  id v131;
  id v132;
  uint64_t v133;
  void *m;
  void *v135;
  unint64_t v136;
  id v137;
  NSObject *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  NSObject *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  NSObject *v155;
  id v156;
  NSMutableArray *v157;
  void *v158;
  uint64_t v159;
  id v160;
  NSObject *v161;
  id v162;
  id v163;
  id v164;
  void *v165;
  NSMutableDictionary *v166;
  id v167;
  id v168;
  id v169;
  uint64_t v170;
  void *n;
  uint64_t v172;
  void *v173;
  void *v174;
  NSMutableArray *v175;
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  void *ii;
  uint64_t v181;
  void *v182;
  id v183;
  NSObject *v184;
  id v185;
  id v186;
  NSObject *v187;
  id v188;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  unint64_t v205;
  MOTimeContextAggregationManager *v206;
  void *v207;
  void *v208;
  void *v209;
  int v210;
  NSMutableArray *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  NSMutableDictionary *v216;
  NSMutableDictionary *v217;
  NSMutableDictionary *v218;
  NSMutableArray *v219;
  NSMutableArray *v220;
  void *v221;
  void *v222;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  _BYTE v248[128];
  uint8_t v249[128];
  uint8_t buf[4];
  _BYTE v251[18];
  __int16 v252;
  unint64_t v253;
  __int16 v254;
  unint64_t v255;
  _QWORD v256[2];
  _BYTE v257[128];
  _BYTE v258[128];
  _QWORD v259[2];
  _QWORD v260[2];
  _BYTE v261[128];
  _QWORD v262[2];
  _QWORD v263[3];
  _BYTE v264[128];
  _QWORD v265[2];

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v251 = objc_msgSend(v7, "count");
      *(_WORD *)&v251[8] = 2048;
      *(_QWORD *)&v251[10] = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: no needed to aggregate bundles since bundles  count is: %lu, granularity, %lu", buf, 0x16u);
    }
    v11 = 0;
    goto LABEL_154;
  }
  v219 = objc_opt_new(NSMutableArray);
  v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 1));
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
  v200 = v7;
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 12));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](self, "fUniverse"));
  v18 = (objc_class *)objc_opt_class(MOTimeZoneManager, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getService:", v20));

  v203 = v14;
  v212 = (void *)v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15));
  v207 = v13;
  v208 = v12;
  v265[0] = v12;
  v265[1] = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v265, 2));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sortedArrayUsingDescriptors:", v22));

  v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = objc_msgSend(v23, "count");
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing grouping process input bundle count, %lu, granularity, %lu", buf, 0x16u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager filterEventBundlesEligibleForSummarization:](self, "filterEventBundlesEligibleForSummarization:", v23));
  v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v29;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing grouping process input bundle count after filtering, %lu, granularity, %lu", buf, 0x16u);
  }

  v206 = self;
  v194 = v26;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _groupBundles:parameters:granularity:](self, "_groupBundles:parameters:granularity:", v26, v8, a5));
  v217 = objc_opt_new(NSMutableDictionary);
  v31 = objc_opt_new(NSMutableArray);
  v202 = v30;
  v215 = v8;
  v220 = v31;
  if (objc_msgSend(v30, "count"))
  {
    v246 = 0u;
    v247 = 0u;
    v244 = 0u;
    v245 = 0u;
    v32 = v30;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v244, v264, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v245;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v245 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * (_QWORD)i);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "getTimeSpanOfMOEventBundleArray"));
          v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "startDate"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "endDate"));
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v251 = v41;
            *(_WORD *)&v251[8] = 2112;
            *(_QWORD *)&v251[10] = v42;
            v252 = 2048;
            v253 = a5;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping date interval, start, %@, end, %@, granularity, %lu", buf, 0x20u);

          }
          if (v38)
            -[NSMutableDictionary setObject:forKey:](v217, "setObject:forKey:", v37, v38);

          v31 = v220;
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v244, v264, 16);
      }
      while (v34);
    }

    v8 = v215;
  }
  v43 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 204));
  v44 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 207));
  v45 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 208));
  v195 = (void *)v44;
  v196 = (void *)v43;
  v263[0] = v43;
  v263[1] = v44;
  v193 = (void *)v45;
  v263[2] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v263, 3));
  v47 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v46));

  v192 = (void *)v47;
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "filteredArrayUsingPredicate:", v47));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "arrayByAddingObjectsFromArray:", v212));
  v262[0] = v208;
  v262[1] = v207;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v262, 2));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "sortedArrayUsingDescriptors:", v49));

  v51 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v53 = objc_msgSend(v50, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v53;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: acitivity grouping process input bundle count, %lu, granularity, %lu", buf, 0x16u);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager filterEventBundlesEligibleForSummarization:](v206, "filterEventBundlesEligibleForSummarization:", v50));
  v55 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v56 = objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    v57 = objc_msgSend(v54, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v57;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping process input bundle count after filtering, %lu, granularity, %lu", buf, 0x16u);
  }

  v190 = v54;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _groupBundles:parameters:granularity:](v206, "_groupBundles:parameters:granularity:", v54, v8, 1));
  v218 = objc_opt_new(NSMutableDictionary);
  v201 = v58;
  if (objc_msgSend(v58, "count"))
  {
    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v240, v261, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v241;
      do
      {
        for (j = 0; j != v61; j = (char *)j + 1)
        {
          if (*(_QWORD *)v241 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * (_QWORD)j);
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "getTimeSpanOfMOEventBundleArray"));
          v66 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "startDate"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "endDate"));
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v251 = v68;
            *(_WORD *)&v251[8] = 2112;
            *(_QWORD *)&v251[10] = v69;
            v252 = 2048;
            v253 = a5;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping date interval, start, %@, end, %@, granularity, %lu", buf, 0x20u);

          }
          if (v65)
            -[NSMutableDictionary setObject:forKey:](v218, "setObject:forKey:", v64, v65);

          v31 = v220;
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v240, v261, 16);
      }
      while (v61);
    }

    v8 = v215;
  }
  v216 = objc_opt_new(NSMutableDictionary);
  if (!objc_msgSend(v212, "count"))
    goto LABEL_76;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v218, "allKeys"));
  if (!objc_msgSend(v70, "count"))
  {

    goto LABEL_76;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v217, "allKeys"));
  v72 = objc_msgSend(v71, "count");

  if (!v72)
  {
LABEL_76:
    v122 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: no chance of overlapping so create summary bundles for both outing groups and activity groups", buf, 2u);
    }

    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v217, "allValues"));
    v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v236, v258, 16);
    if (v125)
    {
      v126 = v125;
      v127 = *(_QWORD *)v237;
      do
      {
        for (k = 0; k != v126; k = (char *)k + 1)
        {
          if (*(_QWORD *)v237 != v127)
            objc_enumerationMutation(v124);
          v129 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * (_QWORD)k);
          v130 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:](MOSummarizationUtilities, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:", v129, v8, a5 == 2, v222));
          if (v130)
          {
            -[NSMutableArray addObject:](v219, "addObject:", v130);
            -[NSMutableArray addObjectsFromArray:](v31, "addObjectsFromArray:", v129);
          }

        }
        v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v236, v258, 16);
      }
      while (v126);
    }

    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v218, "allValues"));
    v131 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v232, v257, 16);
    if (v131)
    {
      v132 = v131;
      v133 = *(_QWORD *)v233;
      do
      {
        for (m = 0; m != v132; m = (char *)m + 1)
        {
          if (*(_QWORD *)v233 != v133)
            objc_enumerationMutation(v75);
          v135 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * (_QWORD)m), v8, a5 == 2, 0, v222));
          if (v135)
            -[NSMutableArray addObject:](v219, "addObject:", v135);

        }
        v132 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v232, v257, 16);
      }
      while (v132);
    }
    goto LABEL_123;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v217, "allKeys"));
  v260[0] = v208;
  v260[1] = v207;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v260, 2));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "sortedArrayUsingDescriptors:", v74));

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v218, "allKeys"));
  v259[0] = v208;
  v259[1] = v207;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v259, 2));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "sortedArrayUsingDescriptors:", v77));

  v79 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    v81 = objc_msgSend(v75, "count");
    v82 = objc_msgSend(v78, "count");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v251 = v81;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = v82;
    v252 = 2048;
    v253 = a5;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing mega intervals count: %lu, activity mega intervals count: %lu, granularity, %lu", buf, 0x20u);
  }

  v204 = v78;
  if (!objc_msgSend(v75, "count"))
  {
    v85 = 0;
    LODWORD(v86) = 0;
    v83 = 0;
    goto LABEL_99;
  }
  v83 = 0;
  v84 = 0;
  v85 = 0;
  while ((unint64_t)objc_msgSend(v78, "count") > v85)
  {
    v210 = v84;
    v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndexedSubscript:", v83));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", v85));
    v88 = objc_msgSend((id)v86, "intersectsDateInterval:", v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v217, "objectForKey:", v86));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v89));

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v218, "objectForKey:", v87));
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v91));

    v213 = v90;
    if (!v88)
    {
      v102 = v216;
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v216, "allKeys"));
      v104 = objc_msgSend(v103, "containsObject:", v92);

      v96 = v210;
      if ((v104 & 1) == 0)
      {
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "allObjects"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", v105, v215, a5 == 2, 0, v222));

        v102 = v216;
        if (v106)
        {
          -[NSMutableArray addObject:](v219, "addObject:", v106);
          -[NSMutableDictionary setObject:forKey:](v216, "setObject:forKey:", v106, v92);
        }

      }
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v102, "allKeys"));
      v108 = objc_msgSend(v107, "containsObject:", v213);

      if ((v108 & 1) != 0)
        goto LABEL_73;
      v205 = v86;
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "allObjects"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:](MOSummarizationUtilities, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:", v109, v215, a5 == 2, v222));

      if (!v98)
        goto LABEL_72;
      -[NSMutableArray addObject:](v219, "addObject:", v98);
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "allObjects"));
      -[NSMutableArray addObjectsFromArray:](v220, "addObjectsFromArray:", v110);

      v99 = v216;
      v100 = v98;
      v101 = v213;
LABEL_61:
      -[NSMutableDictionary setObject:forKey:](v99, "setObject:forKey:", v100, v101);
LABEL_72:

      v86 = v205;
      goto LABEL_73;
    }
    v205 = v86;
    v93 = v216;
    if (!v90 || !v92 || !objc_msgSend(v90, "intersectsSet:", v92))
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v216, "allKeys"));
      v112 = objc_msgSend(v111, "containsObject:", v92);

      v96 = v210;
      if ((v112 & 1) != 0)
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v216, "objectForKey:", v92));
      }
      else
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "allObjects"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", v113, v215, a5 == 2, 0, v222));

        if (v98)
        {
          -[NSMutableArray addObject:](v219, "addObject:", v98);
          v93 = v216;
          -[NSMutableDictionary setObject:forKey:](v216, "setObject:forKey:", v98, v92);
        }
        else
        {
          v93 = v216;
        }
      }
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v93, "allKeys"));
      v115 = objc_msgSend(v114, "containsObject:", v213);

      if ((v115 & 1) != 0)
      {
        v116 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v213));
      }
      else
      {
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "allObjects"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:](MOSummarizationUtilities, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:", v117, v215, a5 == 2, v222));

        if (v116)
        {
          -[NSMutableArray addObject:](v219, "addObject:", v116);
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "allObjects"));
          -[NSMutableArray addObjectsFromArray:](v220, "addObjectsFromArray:", v118);

          -[NSMutableDictionary setObject:forKey:](v216, "setObject:forKey:", v116, v213);
        }
      }
      +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:](MOSummarizationUtilities, "removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:", v98, v116);

      goto LABEL_72;
    }
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v216, "allKeys"));
    v95 = objc_msgSend(v94, "containsObject:", v92);

    v96 = v210;
    if ((v95 & 1) == 0)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "allObjects"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", v97, v215, a5 == 2, 0, v222));

      if (v98)
      {
        -[NSMutableArray addObject:](v219, "addObject:", v98);
        v99 = v216;
        v100 = v98;
        v101 = v92;
        goto LABEL_61;
      }
      goto LABEL_72;
    }
LABEL_73:
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v86, "endDate"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "endDate"));
    v121 = objc_msgSend(v119, "isOnOrAfter:", v120);

    v85 += v121;
    v83 = v96 + (v121 ^ 1);

    v84 = v96 + (v121 ^ 1);
    LODWORD(v86) = v84;
    v78 = v204;
    if ((unint64_t)objc_msgSend(v75, "count") <= v83)
      goto LABEL_99;
  }
  LODWORD(v86) = v84;
LABEL_99:
  v136 = v85;
  if ((unint64_t)objc_msgSend(v75, "count") <= v83)
  {
    v31 = v220;
  }
  else
  {
    v31 = v220;
    if (objc_msgSend(v78, "count") == (id)v85)
    {
      v137 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v138 = objc_claimAutoreleasedReturnValue(v137);
      if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v251 = v86;
        *(_WORD *)&v251[4] = 2048;
        *(_QWORD *)&v251[6] = a5;
        _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: not all outing mega intervals are looped through, stopping at %d, granularity, %lu", buf, 0x12u);
      }

      if ((unint64_t)objc_msgSend(v75, "count") > v86)
      {
        v86 = v86;
        do
        {
          v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndexedSubscript:", v86));
          v140 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v217, "objectForKey:", v139));
          v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v140));

          v142 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v216, "allKeys"));
          LOBYTE(v140) = objc_msgSend(v142, "containsObject:", v141);

          if ((v140 & 1) == 0)
          {
            v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "allObjects"));
            v144 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:](MOSummarizationUtilities, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:", v143, v215, a5 == 2, v222));

            if (v144)
            {
              -[NSMutableArray addObject:](v219, "addObject:", v144);
              v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "allObjects"));
              -[NSMutableArray addObjectsFromArray:](v220, "addObjectsFromArray:", v145);

              -[NSMutableDictionary setObject:forKey:](v216, "setObject:forKey:", v144, v141);
            }

          }
          ++v86;

        }
        while ((unint64_t)objc_msgSend(v75, "count") > v86);
        v31 = v220;
        v78 = v204;
      }
    }
  }
  if ((unint64_t)objc_msgSend(v78, "count") > v136 && objc_msgSend(v75, "count") == (id)(int)v86)
  {
    v146 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v147 = objc_claimAutoreleasedReturnValue(v146);
    if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v251 = v86;
      *(_WORD *)&v251[4] = 2048;
      *(_QWORD *)&v251[6] = a5;
      _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: not all activity mega intervals are looped through, stopping at %d, granularity, %lu", buf, 0x12u);
    }

    if ((unint64_t)objc_msgSend(v78, "count") > v136)
    {
      do
      {
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", v136));
        v149 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v218, "objectForKey:", v148));
        v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v149));

        v151 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v216, "allKeys"));
        LOBYTE(v149) = objc_msgSend(v151, "containsObject:", v150);

        if ((v149 & 1) == 0)
        {
          v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "allObjects"));
          v153 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", v152, v215, a5 == 2, 0, v222));

          if (v153)
          {
            -[NSMutableArray addObject:](v219, "addObject:", v153);
            -[NSMutableDictionary setObject:forKey:](v216, "setObject:forKey:", v153, v150);
          }

        }
        ++v136;

        v78 = v204;
      }
      while ((unint64_t)objc_msgSend(v204, "count") > v136);
    }
  }

  v8 = v215;
LABEL_123:

  v154 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v155 = objc_claimAutoreleasedReturnValue(v154);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
  {
    v156 = -[NSMutableArray count](v219, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v156;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: total mega bundles count after deduping: %lu,  granularity, %lu", buf, 0x16u);
  }

  v157 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v157, "addObjectsFromArray:", v203);
  -[NSMutableArray addObjectsFromArray:](v157, "addObjectsFromArray:", v209);
  -[NSMutableArray addObjectsFromArray:](v157, "addObjectsFromArray:", v212);
  v256[0] = v208;
  v256[1] = v207;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v256, 2));
  v159 = objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v157, "sortedArrayUsingDescriptors:", v158));

  v160 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v161 = objc_claimAutoreleasedReturnValue(v160);
  if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
  {
    v162 = objc_msgSend(v203, "count");
    v163 = objc_msgSend(v209, "count");
    v164 = objc_msgSend(v212, "count");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v251 = v162;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = v163;
    v252 = 2048;
    v253 = (unint64_t)v164;
    v254 = 2048;
    v255 = a5;
    _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: transit bundle grouping process input bundle counts, outing, %lu, activity, %lu, timecontext, %lu, granularity, %lu", buf, 0x2Au);
  }

  v214 = (void *)v159;
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _groupTransitBundles:parameters:granularity:](v206, "_groupTransitBundles:parameters:granularity:", v159, v8, 1));
  v166 = objc_opt_new(NSMutableDictionary);
  v221 = v165;
  if (objc_msgSend(v165, "count"))
  {
    v211 = v157;
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    v167 = v165;
    v168 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v228, v249, 16);
    if (v168)
    {
      v169 = v168;
      v170 = *(_QWORD *)v229;
      do
      {
        for (n = 0; n != v169; n = (char *)n + 1)
        {
          if (*(_QWORD *)v229 != v170)
            objc_enumerationMutation(v167);
          v172 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)n);
          v173 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createTransitMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:groupedOutingBundles:](MOSummarizationUtilities, "createTransitMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:groupedOutingBundles:", v172, v8, a5 == 2, v222, v31));
          if (v173)
            -[NSMutableDictionary setObject:forKey:](v166, "setObject:forKey:", v172, v173);
          -[NSMutableArray addObjectsFromArray:](v31, "addObjectsFromArray:", v172);

        }
        v169 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v228, v249, 16);
      }
      while (v169);
    }

    v174 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v166, "allKeys"));
    -[NSMutableArray addObjectsFromArray:](v219, "addObjectsFromArray:", v174);

    v157 = v211;
  }
  v175 = objc_opt_new(NSMutableArray);
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  v227 = 0u;
  v176 = v194;
  v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
  if (v177)
  {
    v178 = v177;
    v179 = *(_QWORD *)v225;
    do
    {
      for (ii = 0; ii != v178; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v225 != v179)
          objc_enumerationMutation(v176);
        v181 = *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * (_QWORD)ii);
        if ((-[NSMutableArray containsObject:](v31, "containsObject:", v181) & 1) == 0)
          -[NSMutableArray addObject:](v175, "addObject:", v181);
      }
      v178 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
    }
    while (v178);
  }

  v182 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities mergeOutingBundlesWithInDayWithGroupedBundles:remainingSingletonBundles:parameters:isCoarseGranularity:timeZoneManager:](MOSummarizationUtilities, "mergeOutingBundlesWithInDayWithGroupedBundles:remainingSingletonBundles:parameters:isCoarseGranularity:timeZoneManager:", v219, v175, v215, a5 == 2, v222));
  v183 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v184 = objc_claimAutoreleasedReturnValue(v183);
  if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
  {
    v185 = objc_msgSend(v182, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v185;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: total mega bundles count after merge visits to the same place in the same day %lu, granularity, %lu", buf, 0x16u);
  }

  if (objc_msgSend(v182, "count"))
    -[NSMutableArray addObjectsFromArray:](v219, "addObjectsFromArray:", v182);
  v186 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v187 = objc_claimAutoreleasedReturnValue(v186);
  if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
  {
    v188 = -[NSMutableArray count](v219, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v251 = v188;
    *(_WORD *)&v251[8] = 2048;
    *(_QWORD *)&v251[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_INFO, "Aggregation: final timecontext mega bundles count: %lu, granularity, %lu", buf, 0x16u);
  }

  v10 = v219;
  v11 = v10;
  v7 = v200;
  v8 = v215;
LABEL_154:

  return v11;
}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSMutableArray *, _QWORD);
  NSMutableArray *v11;
  id os_log;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSMutableArray *, _QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_opt_new(NSMutableArray);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for time context related bundles: input eventBundles count, %lu", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _megaBundlesFromOutingActivityTimeContextBundles:parameters:granularity:](self, "_megaBundlesFromOutingActivityTimeContextBundles:parameters:granularity:", v8, v9, 2));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeContextAggregationManager _megaBundleFromActivityTimeContextBundles:parameters:](self, "_megaBundleFromActivityTimeContextBundles:parameters:", v8, v9));
    if (objc_msgSend(v15, "count"))
    {
      -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v15);
      v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134217984;
        v36 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation outing megabundle count, %lu", buf, 0xCu);
      }

    }
    if (v16)
      -[NSMutableArray addObject:](v11, "addObject:", v16);
    if (-[NSMutableArray count](v11, "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = v11;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "setSummarizationGranularity:", 2, (_QWORD)v30);
          }
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v22);
      }

    }
    v25 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = -[NSMutableArray count](v11, "count");
      *(_DWORD *)buf = 134217984;
      v36 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for time context related bundles: output eventBundles count, %lu", buf, 0xCu);
    }

    v10[2](v10, v11, 0);
  }
  else
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: No eventBundle to be proccessed", buf, 2u);
    }

    v10[2](v10, 0, 0);
  }

}

- (id)_megaBundleFromActivityTimeContextBundles:(id)a3 parameters:(id)a4
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
  MOTimeContextAggregationManager *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  id os_log;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  _QWORD v37[3];

  v6 = a4;
  v7 = a3;
  v34 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", &off_1002DB198, &off_1002DB1B0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType in %@"), v34));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 204));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 207));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSubType != %lu"), 208));
  v37[0] = v9;
  v37[1] = v10;
  v37[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v13));
  if (!objc_msgSend(v14, "count"))
  {
    v19 = v6;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "CoarseGranularityAggregation: no needed to aggregate activity and time context bundles since bundles count is 0";
      goto LABEL_7;
    }
LABEL_8:
    v24 = 0;
    goto LABEL_12;
  }
  v15 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aggregationDateInterval"));
  objc_msgSend(v16, "duration");
  v18 = v17;

  v19 = v6;
  if (v18 < 604800.0)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "CoarseGranularityAggregation: no needed to aggregate activity and time context bundles since aggregation tim"
            "e interval is less than a week";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOAggregationManager fUniverse](v15, "fUniverse"));
  v27 = (objc_class *)objc_opt_class(MOTimeZoneManager, v26);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getService:", v29));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:](MOSummarizationUtilities, "createActivityMegaBundleFromBundles:withParameters:isCoarseGranularity:isWeeklySummary:timeZoneManager:", v14, v19, 1, 1, v21));
  v30 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v24;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation activity megabundle, %@", buf, 0xCu);
  }

LABEL_12:
  return v24;
}

- (id)_groupBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  void *v22;
  id v23;
  id v24;
  id os_log;
  NSObject *v26;
  id v28;
  NSObject *v29;
  void *v30;
  NSMutableArray *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  _QWORD v36[2];

  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v28 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
    v29 = v12;
    v36[0] = v12;
    v36[1] = v28;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    v30 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v13));

    v31 = objc_opt_new(NSMutableArray);
    v15 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v14, "count") != (id)1)
    {
      v16 = 0;
      do
      {
        v17 = v16;
        if (!-[NSMutableArray count](v15, "count"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v16));
          -[NSMutableArray addObject:](v15, "addObject:", v18);

        }
        v16 = v17 + 1;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v17 + 1));
        v20 = -[NSMutableArray copy](v15, "copy");
        v21 = -[MOTimeContextAggregationManager _shouldMergeBundle:toCluster:parameters:granularity:](self, "_shouldMergeBundle:toCluster:parameters:granularity:", v19, v20, v9, a5);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v17 + 1));
          -[NSMutableArray addObject:](v15, "addObject:", v22);

          if (v17 == (char *)objc_msgSend(v30, "count") - 2
            && (unint64_t)-[NSMutableArray count](v15, "count") >= 2)
          {
            v23 = -[NSMutableArray copy](v15, "copy");
            -[NSMutableArray addObject:](v31, "addObject:", v23);

          }
        }
        else
        {
          if ((unint64_t)-[NSMutableArray count](v15, "count") >= 2)
          {
            v24 = -[NSMutableArray copy](v15, "copy");
            -[NSMutableArray addObject:](v31, "addObject:", v24);

          }
          -[NSMutableArray removeAllObjects](v15, "removeAllObjects");
        }
      }
      while ((char *)objc_msgSend(v14, "count") - 1 > v16);
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v33 = -[NSMutableArray count](v31, "count");
      v34 = 2048;
      v35 = a5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: grouped bundle count: %lu, granularity: %lu", buf, 0x16u);
    }

    v11 = v29;
    v8 = v30;
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: aggregateBundles input bundle count is less than 2 so no bundle to be aggregated", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (BOOL)_shouldMergeBundle:(id)a3 toCluster:(id)a4 parameters:(id)a5 granularity:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == 2)
  {
    v13 = -[MOTimeContextAggregationManager _shouldMergeBundleForCoarseGranularity:toCluster:parameters:](self, "_shouldMergeBundleForCoarseGranularity:toCluster:parameters:", v10, v11, v12);
  }
  else
  {
    if (a6 != 1)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v13 = -[MOTimeContextAggregationManager _shouldMergeBundleForFineGranularity:toCluster:parameters:](self, "_shouldMergeBundleForFineGranularity:toCluster:parameters:", v10, v11, v12);
  }
  v14 = v13;
LABEL_7:

  return v14;
}

- (BOOL)_shouldMergeBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  double v8;
  id v9;
  id v10;
  double v11;
  id os_log;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  const char *v24;
  BOOL v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  id v30;
  NSObject *v31;
  float v32;
  id v33;
  id v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  id v50;
  NSObject *v51;
  float v52;
  double v53;
  id v54;
  NSObject *v55;
  float v56;
  id v57;
  NSObject *v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  id v73;
  NSObject *v74;
  float v75;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  double v84;
  double v85;
  uint8_t buf[4];
  double v87;
  __int16 v88;
  double v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;

  v8 = COERCE_DOUBLE(a3);
  v9 = a4;
  v10 = a5;
  v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "startDate")));
    v15 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "endDate")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "startDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "endDate"));
    *(_DWORD *)buf = 138413058;
    v87 = v14;
    v88 = 2112;
    v89 = v15;
    v90 = 2112;
    v91 = v16;
    v92 = 2112;
    v93 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);

  }
  v18 = objc_msgSend(*(id *)&v11, "interfaceType") == (id)2 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)2;
  if (objc_msgSend(*(id *)&v11, "interfaceType") == (id)2 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)12)
    v19 = 1;
  else
    v19 = objc_msgSend(*(id *)&v11, "interfaceType") == (id)12 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)2;
  v20 = objc_msgSend(*(id *)&v11, "interfaceType") == (id)1 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)1;
  if (objc_msgSend(*(id *)&v11, "interfaceType") == (id)1 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)12)
    v21 = 1;
  else
    v21 = objc_msgSend(*(id *)&v11, "interfaceType") == (id)12 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)1;
  if (v18 || v19)
  {
    if (+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", *(_QWORD *)&v11)|| +[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", *(_QWORD *)&v8))
    {
      v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
LABEL_27:
        v25 = 0;
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v24 = "FineGranularityAggregation for TimeContext:bundle is for home or work so exclude from group.";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
      goto LABEL_27;
    }
    if (!+[MOSummarizationUtilities isBundle:insideTheSameDayAsOtherBundle:](MOSummarizationUtilities, "isBundle:insideTheSameDayAsOtherBundle:", *(_QWORD *)&v11, *(_QWORD *)&v8))
    {
      v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v23 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "startDate")));
        v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "endDate")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "startDate"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "endDate"));
        *(_DWORD *)buf = 138413058;
        v87 = v35;
        v88 = 2112;
        v89 = v36;
        v90 = 2112;
        v91 = v37;
        v92 = 2112;
        v93 = v38;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should not merge since one of thme is covering more than one day, bundle1: start date, %@, end date, %@, bundle 2: start date, %@, end date, %@", buf, 0x2Au);

      }
      goto LABEL_27;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "rankingDictionary"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
    objc_msgSend(v27, "floatValue");
    v29 = v28;

    v30 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v87 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext:bundle goodness score, %f", buf, 0xCu);
    }

    objc_msgSend(v10, "fineGranularity_outingBundlesExclusionGoodnessScoreThreshold");
    if (v29 > v32)
    {
      v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v23 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v24 = "FineGranularityAggregation for TimeContext:bundle goodness is too high to include into group.";
      goto LABEL_26;
    }
    if (+[MOSummarizationUtilities isFlightBundle:](MOSummarizationUtilities, "isFlightBundle:", *(_QWORD *)&v8))
    {
      v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v23 = objc_claimAutoreleasedReturnValue(v39);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v24 = "CoarseGranularityAggregation for TimeContext:bundle action is flight so don't group with others.";
      goto LABEL_26;
    }
    v23 = objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities metricForVisitsFromBundle:andNextBundle:](MOSummarizationUtilities, "metricForVisitsFromBundle:andNextBundle:", *(_QWORD *)&v11, *(_QWORD *)&v8));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v23, "objectForKey:", CFSTR("distance")));
    objc_msgSend(v40, "doubleValue");
    v42 = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v23, "objectForKey:", CFSTR("timeInterval")));
    objc_msgSend(v43, "doubleValue");
    v45 = v44;

    +[MOSummarizationUtilities maximumDistanceFromBundle:toBundleCluster:](MOSummarizationUtilities, "maximumDistanceFromBundle:toBundleCluster:", *(_QWORD *)&v8, v9);
    v47 = v46;
    -[MOTimeContextAggregationManager _maximumGoodnessScoreDeltaFromBundle:toCluster:](self, "_maximumGoodnessScoreDeltaFromBundle:toCluster:", *(_QWORD *)&v8, v9);
    v49 = v48;
    v50 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "fineGranularity_outingBundlesAggregationDistanceThreshold");
      *(_DWORD *)buf = 134218240;
      v87 = v42;
      v88 = 2048;
      v89 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "FineGranularityAggregation: distance between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
    }
    v53 = fabs(v45);

    v54 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "fineGranularity_outingBundlesAggregationTimeIntervalThreshold");
      *(_DWORD *)buf = 134218240;
      v87 = v53;
      v88 = 2048;
      v89 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "FineGranularityAggregation: time interval between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
    }

    v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
      *(_DWORD *)buf = 134218240;
      v87 = v49;
      v88 = 2048;
      v89 = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "FineGranularityAggregation: max goodness score deta between bundle and members in existing cluster: %f (thres=%f)", buf, 0x16u);
    }

    objc_msgSend(v10, "fineGranularity_outingBundlesAggregationDistanceThreshold");
    if (v42 < v60)
    {
      objc_msgSend(v10, "fineGranularity_outingBundlesAggregationTimeIntervalThreshold");
      if (v53 < v61)
      {
        objc_msgSend(v10, "fineGranularity_outingBundlesAggregationDistanceToClusterThreshold");
        if (v47 < v62)
        {
          objc_msgSend(v10, "fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
          if (v49 < v63)
          {
            v64 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v65 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              v85 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "startDate")));
              v84 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "endDate")));
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "action"));
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "actionName"));
              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v11, "place"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "placeName"));
              v83 = v65;
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "startDate"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "endDate"));
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "action"));
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "actionName"));
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v8, "place"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "placeName"));
              *(_DWORD *)buf = 138414082;
              v87 = v85;
              v88 = 2112;
              v89 = v84;
              v90 = 2112;
              v91 = v82;
              v92 = 2112;
              v93 = v66;
              v94 = 2112;
              v95 = v67;
              v96 = 2112;
              v97 = v68;
              v98 = 2112;
              v99 = v69;
              v100 = 2112;
              v101 = v70;
              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should be merged for outing, bundle1: startDate:%@, endDate:%@, action:%@, place:%@, bundle 2: startDate:%@, endDate:%@, action:%@, place:%@", buf, 0x52u);

              v65 = v83;
            }

            v25 = 1;
            goto LABEL_28;
          }
        }
      }
    }

  }
  if (!v20 && !v21)
    goto LABEL_58;
  +[MOSummarizationUtilities workoutTimeIntervalBetweenBundle:andNextBundle:](MOSummarizationUtilities, "workoutTimeIntervalBetweenBundle:andNextBundle:", *(_QWORD *)&v11, *(_QWORD *)&v8);
  v72 = fabs(v71);
  v73 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v74 = objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v87 = v72;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: time interval between activities from two activity related bundles: %f", buf, 0xCu);
  }

  objc_msgSend(v10, "fineGranularity_activityBundlesAggregationTimeIntervalThreshold");
  if (v72 >= v75)
  {
LABEL_58:
    v25 = 0;
    goto LABEL_59;
  }
  v77 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v23 = objc_claimAutoreleasedReturnValue(v77);
  v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v87 = v11;
    v88 = 2112;
    v89 = v8;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should be merged for activity, bundle1: %@, bundle 2: %@", buf, 0x16u);
  }
LABEL_28:

LABEL_59:
  return v25;
}

- (BOOL)_shouldMergeBundleForCoarseGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id os_log;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  BOOL v22;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  id v32;
  NSObject *v33;
  float v34;
  id v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  float v51;
  id v52;
  NSObject *v53;
  float v54;
  id v55;
  NSObject *v56;
  float v57;
  id v58;
  NSObject *v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  id v74;
  NSObject *v75;
  float v76;
  float v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  os_log_t log;
  NSObject *loga;
  id v96;
  id v97;
  id v98;
  uint8_t buf[4];
  double v100;
  __int16 v101;
  double v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")));
    v15 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v17 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    *(_DWORD *)buf = 138413058;
    v100 = v14;
    v101 = 2112;
    v102 = v15;
    v103 = 2112;
    v104 = v16;
    v105 = 2112;
    v106 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);

    v10 = v17;
  }

  if (!+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", v11)&& !+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", v8))
  {
    v24 = objc_msgSend(v11, "interfaceType") == (id)2 && objc_msgSend(v8, "interfaceType") == (id)2;
    if (objc_msgSend(v11, "interfaceType") == (id)2 && objc_msgSend(v8, "interfaceType") == (id)12)
      v25 = 1;
    else
      v25 = objc_msgSend(v11, "interfaceType") == (id)12 && objc_msgSend(v8, "interfaceType") == (id)2;
    v26 = objc_msgSend(v11, "interfaceType") == (id)1 && objc_msgSend(v8, "interfaceType") == (id)1;
    if (objc_msgSend(v11, "interfaceType") == (id)1 && objc_msgSend(v8, "interfaceType") == (id)12)
      v27 = 1;
    else
      v27 = objc_msgSend(v11, "interfaceType") == (id)12 && objc_msgSend(v8, "interfaceType") == (id)1;
    if (v24 || v25)
    {
      if (!+[MOSummarizationUtilities isBundle:insideTheSameDayAsOtherBundle:](MOSummarizationUtilities, "isBundle:insideTheSameDayAsOtherBundle:", v11, v8))
      {
        v36 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v20 = objc_claimAutoreleasedReturnValue(v36);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")));
        v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
        *(_DWORD *)buf = 138413058;
        v100 = v37;
        v101 = 2112;
        v102 = v38;
        v103 = 2112;
        v104 = v39;
        v105 = 2112;
        v106 = v40;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two bundles should not merge since one of thme is covering more than one day, bundle1: start date, %@, end date, %@, bundle 2: start date, %@, end date, %@", buf, 0x2Au);
LABEL_59:

        goto LABEL_8;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rankingDictionary"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
      objc_msgSend(v29, "floatValue");
      v31 = v30;

      v32 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v100 = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext:bundle goodness score, %f", buf, 0xCu);
      }

      objc_msgSend(v10, "coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold");
      if (v31 > v34)
      {
        v35 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v20 = objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        *(_WORD *)buf = 0;
        v21 = "CoarseGranularityAggregation for TimeContext:bundle goodness is too high to include into group.";
        goto LABEL_7;
      }
      if (+[MOSummarizationUtilities isFlightBundle:](MOSummarizationUtilities, "isFlightBundle:", v8))
      {
        v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v20 = objc_claimAutoreleasedReturnValue(v41);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        *(_WORD *)buf = 0;
        v21 = "CoarseGranularityAggregation for TimeContext:bundle action is flight so don't group with others.";
        goto LABEL_7;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities metricForVisitsFromBundle:andNextBundle:](MOSummarizationUtilities, "metricForVisitsFromBundle:andNextBundle:", v11, v8));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v20, "objectForKey:", CFSTR("distance")));
      objc_msgSend(v42, "doubleValue");
      v44 = v43;

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v20, "objectForKey:", CFSTR("timeInterval")));
      objc_msgSend(v45, "doubleValue");
      v47 = v46;

      +[MOSummarizationUtilities maximumDistanceFromBundle:toBundleCluster:](MOSummarizationUtilities, "maximumDistanceFromBundle:toBundleCluster:", v8, v9);
      v49 = v48;
      -[MOTimeContextAggregationManager _maximumGoodnessScoreDeltaFromBundle:toCluster:](self, "_maximumGoodnessScoreDeltaFromBundle:toCluster:", v8, v9);
      v51 = v50;
      v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationDistanceThreshold");
        *(_DWORD *)buf = 134218240;
        v100 = v44;
        v101 = 2048;
        v102 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: distance between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
      }

      v55 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationTimeIntervalThreshold");
        *(_DWORD *)buf = 134218240;
        v100 = v47;
        v101 = 2048;
        v102 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: time interval between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
      }

      v58 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
        *(_DWORD *)buf = 134218240;
        v100 = v51;
        v101 = 2048;
        v102 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: max goodness score deta between bundle and members in existing cluster: %f (thres=%f)", buf, 0x16u);
      }

      objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationDistanceThreshold");
      if (v44 < v61)
      {
        objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationTimeIntervalThreshold");
        if (v47 < v62)
        {
          objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold");
          if (v49 < v63)
          {
            objc_msgSend(v10, "coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold");
            if (v51 < v64)
            {
              v65 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v66 = objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                *(double *)&log = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")));
                v93 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate")));
                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
                v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "actionName"));
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "place"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "placeName"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
                v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "actionName"));
                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
                v96 = v10;
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "placeName"));
                *(_DWORD *)buf = 138414082;
                v100 = *(double *)&log;
                v101 = 2112;
                v102 = v93;
                v103 = 2112;
                v104 = v92;
                v105 = 2112;
                v106 = v67;
                v107 = 2112;
                v108 = v68;
                v109 = 2112;
                v110 = v69;
                v111 = 2112;
                v112 = v70;
                v113 = 2112;
                v114 = v71;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two bundles should be merged for outing, bundle1: startDate:%@, endDate:%@, action:%@, place:%@, bundle 2: startDate:%@, endDate:%@, action:%@, place:%@", buf, 0x52u);

                v10 = v96;
              }
LABEL_62:

              v22 = 1;
              goto LABEL_9;
            }
          }
        }
      }
      if (v26 || v27)
      {
        +[MOSummarizationUtilities workoutTimeIntervalBetweenBundle:andNextBundle:](MOSummarizationUtilities, "workoutTimeIntervalBetweenBundle:andNextBundle:", v11, v8);
        v73 = v72;
        v74 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "fineGranularity_activityBundlesAggregationTimeIntervalThreshold");
          *(_DWORD *)buf = 134218240;
          v100 = v73;
          v101 = 2048;
          v102 = v76;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: time interval between activities from two activity related bundles: %f, threshold: %f", buf, 0x16u);
        }

        objc_msgSend(v10, "fineGranularity_activityBundlesAggregationTimeIntervalThreshold");
        if (v73 < v77)
        {
          v81 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v66 = objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v82 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier")));
            v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
            v98 = v10;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
            loga = v66;
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
            *(_DWORD *)buf = 138413570;
            v100 = v82;
            v101 = 2112;
            v102 = v83;
            v103 = 2112;
            v104 = v84;
            v105 = 2112;
            v106 = v85;
            v107 = 2112;
            v108 = v86;
            v109 = 2112;
            v110 = v87;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two activity bundles should be merged for activity, bundle1: bundle ID, %@, startDate, %@, endDate, %@; bundle 2: bundle ID, %@, startDate, %@, endDate, %@",
              buf,
              0x3Eu);

            v66 = loga;
            v10 = v98;

          }
          goto LABEL_62;
        }
      }

    }
    v78 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v20 = objc_claimAutoreleasedReturnValue(v78);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier")));
    v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v97 = v10;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    *(_DWORD *)buf = 138413570;
    v100 = v37;
    v101 = 2112;
    v102 = v38;
    v103 = 2112;
    v104 = v39;
    v105 = 2112;
    v106 = v40;
    v107 = 2112;
    v108 = v79;
    v109 = 2112;
    v110 = v80;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: bundle does not meet summarization criteria, bundle1: bundle ID, %@, startDate, %@, endDate, %@; bundle 2: bundle ID, %@, startDate, %@, endDate, %@",
      buf,
      0x3Eu);

    v10 = v97;
    goto LABEL_59;
  }
  v19 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v21 = "CoarseGranularityAggregation for TimeContext:bundle is for home or work so exclude from group.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
  }
LABEL_8:
  v22 = 0;
LABEL_9:

  return v22;
}

- (float)_maximumGoodnessScoreDeltaFromBundle:(id)a3 toCluster:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  float v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v10 = 1.1755e-38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rankingDictionary"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
        objc_msgSend(v14, "floatValue");
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rankingDictionary"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
        objc_msgSend(v18, "floatValue");
        v20 = vabds_f32(v16, v19);

        if (v20 > v10)
          v10 = v20;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1.1755e-38;
  }

  return v10;
}

- (id)_groupTransitBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  id os_log;
  NSObject *v22;
  NSMutableArray *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  unint64_t v28;

  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    v24 = objc_opt_new(NSMutableArray);
    v11 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v8, "count") != (id)1)
    {
      v12 = 0;
      do
      {
        v13 = v12;
        if (!-[NSMutableArray count](v11, "count"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v12));
          -[NSMutableArray addObject:](v11, "addObject:", v14);

        }
        v12 = v13 + 1;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v13 + 1));
        v16 = -[NSMutableArray copy](v11, "copy");
        v17 = -[MOTimeContextAggregationManager _shouldMergeTransitBundle:toCluster:parameters:granularity:](self, "_shouldMergeTransitBundle:toCluster:parameters:granularity:", v15, v16, v9, a5);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v13 + 1));
          -[NSMutableArray addObject:](v11, "addObject:", v18);

          if (v13 == (char *)objc_msgSend(v8, "count") - 2
            && (unint64_t)-[NSMutableArray count](v11, "count") >= 2)
          {
            v19 = -[NSMutableArray copy](v11, "copy");
            -[NSMutableArray addObject:](v24, "addObject:", v19);

          }
        }
        else
        {
          if ((unint64_t)-[NSMutableArray count](v11, "count") >= 2)
          {
            v20 = -[NSMutableArray copy](v11, "copy");
            -[NSMutableArray addObject:](v24, "addObject:", v20);

          }
          -[NSMutableArray removeAllObjects](v11, "removeAllObjects");
        }
      }
      while ((char *)objc_msgSend(v8, "count") - 1 > v12);
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v26 = -[NSMutableArray count](v24, "count");
      v27 = 2048;
      v28 = a5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: grouped bundle count: %lu, granularity: %lu", buf, 0x16u);
    }

  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v11->super.super, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: aggregateBundles input bundle count is less than 2 so no bundle to be aggregated", buf, 2u);
    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)_shouldMergeTransitBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  __objc2_class *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  float v39;
  double v40;
  int v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  int v45;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  id v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  float v67;
  double v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  unsigned __int8 v75;
  float v76;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastObject"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    *(_DWORD *)buf = 138413058;
    v88 = v12;
    v89 = 2112;
    v90 = v13;
    v91 = 2112;
    v92 = v14;
    v93 = 2112;
    v94 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Aggregation for transit bundle: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);

  }
  v78 = objc_msgSend(v9, "interfaceType");
  v16 = +[MOSummarizationUtilities bundleHasOneWayRoute:parameters:](MOSummarizationUtilities, "bundleHasOneWayRoute:parameters:", v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("HKWorkoutActivityTypeWalking"), CFSTR("HKWorkoutActivityTypeHiking"), CFSTR("HKWorkoutActivityTypeRunning"), CFSTR("HKWorkoutActivityTypeCycling"), CFSTR("walk"), CFSTR("run"), CFSTR("cycle"), 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));

  v80 = v17;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionName"));
    v21 = objc_msgSend(v17, "containsObject:", v20);

    v22 = v21 ^ 1;
  }
  else
  {
    v22 = 1;
  }
  v81 = v8;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "place"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "place"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "placeName"));

    v26 = v25 == 0;
  }
  else
  {
    v26 = 1;
  }
  v27 = MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "places"));

  if (v28)
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "places"));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i), "placeName"));

          v26 = (v34 == 0) & v26;
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
      }
      while (v31);
    }

    v27 = MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
  }
  if (objc_msgSend(v9, "bundleSubType") != (id)201)
    goto LABEL_21;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
  objc_msgSend(v36, "doubleValue");
  v38 = v37;
  objc_msgSend(v81, "fineGranularity_transitBundlesWorkoutMinimumDuration");
  v40 = v39;

  if (v38 < v40)
    v41 = 1;
  else
LABEL_21:
    v41 = 0;
  v42 = objc_msgSend(v7, "interfaceType") == (id)2 || objc_msgSend(v7, "interfaceType") == (id)12;
  v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(&v27[30], "getInterestingDestination:", v7));
  v44 = (void *)v43;
  v45 = v16 ^ 1;
  if (v78 != (id)1)
    v45 = 1;
  if ((v45 | v22 | v41 | v26 ^ 1) == 1 || !v42 || v43 == 0)
  {
    v48 = 0;
    v49 = v81;
    goto LABEL_45;
  }
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v27[30], "sortedActivityEventsFromBundle:", v9));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "lastObject"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "workoutLocationRoute"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lastObject"));

  v53 = objc_alloc((Class)CLLocation);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
  objc_msgSend(v54, "latitude");
  v56 = v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
  objc_msgSend(v57, "longitude");
  v59 = objc_msgSend(v53, "initWithLatitude:longitude:", v56, v58);

  objc_msgSend(v59, "distanceFromLocation:", v52);
  v61 = v60;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "actionName"));
  if (objc_msgSend(v63, "isEqualToString:", CFSTR("HKWorkoutActivityTypeCycling")))
  {

  }
  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "actionName"));
    v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("cycle"));

    if (!v66)
    {
      v49 = v81;
      objc_msgSend(v81, "fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian");
      goto LABEL_41;
    }
  }
  v49 = v81;
  objc_msgSend(v81, "fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle");
LABEL_41:
  v68 = v67;
  v69 = objc_alloc((Class)NSDateInterval);
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "timestamp"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "dateByAddingTimeInterval:", v68));
  v73 = objc_msgSend(v69, "initWithStartDate:endDate:", v70, v72);

  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
  v75 = objc_msgSend(v73, "containsDate:", v74);

  objc_msgSend(v49, "fineGranularity_transitBundlesDestinationMaximumDistanceThreshold");
  if (v61 <= v76)
    v48 = v75;
  else
    v48 = 0;

LABEL_45:
  return v48;
}

@end
