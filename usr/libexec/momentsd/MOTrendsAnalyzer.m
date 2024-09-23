@implementation MOTrendsAnalyzer

- (MOTrendsAnalyzer)init
{
  MOHealthKitManager *healthKitManager;

  if (self)
  {
    healthKitManager = self->_healthKitManager;
    self->_healthKitManager = 0;

  }
  return self;
}

- (MOTrendsAnalyzer)initWithHealthKitManager:(id)a3
{
  id v5;
  MOTrendsAnalyzer *v6;
  MOTrendsAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOTrendsAnalyzer;
  v6 = -[MOTrendsAnalyzer init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_healthKitManager, a3);

  return v7;
}

- (id)indexDate:(id)a3 aggregationDuration:(unint64_t)a4 referenceDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  if (a4 == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 512, v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 512, v8));
    v13 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v13, "setDay:", (_BYTE *)objc_msgSend(v12, "weekday") - (_BYTE *)objc_msgSend(v11, "weekday"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v13, v7, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 28, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateFromComponents:", v15));

  }
  else
  {
    if (a4 == 1)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startOfDayWithBoundaryOfADay:", 10800.0));
    }
    else
    {
      if (a4)
      {
        v16 = 0;
        goto LABEL_9;
      }
      v9 = v7;
    }
    v16 = v9;
  }
LABEL_9:

  return v16;
}

- (id)prepareData:(id)a3 aggregationDuration:(unint64_t)a4 aggregationMethod:(unint64_t)a5 valueFunction:(id)a6
{
  id v9;
  double (**v10)(id, void *);
  NSMutableDictionary *v11;
  id v12;
  __int128 v13;
  id v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  MOTimeSeries *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  double v23;
  id v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  __int128 v37;
  unint64_t v38;
  unint64_t v39;
  id obj;
  uint64_t v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  double v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  MOTimeSeries *v58;
  _BYTE v59[128];

  v9 = a3;
  v10 = (double (**)(id, void *))a6;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = objc_opt_new(NSMutableDictionary);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v12)
  {
    v14 = v12;
    v42 = *(_QWORD *)v46;
    *(_QWORD *)&v13 = 138412546;
    v37 = v13;
    v38 = a5;
    v39 = a4;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate", v37));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer indexDate:aggregationDuration:referenceDate:](self, "indexDate:aggregationDuration:referenceDate:", v17, a4, v44));

        v19 = (MOTimeSeries *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v18));
        if (!v19)
        {
          v19 = objc_opt_new(MOTimeSeries);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
          -[MOTimeSeries setDate:](v19, "setDate:", v20);

        }
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
        v22 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v30 = NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
          *(_DWORD *)buf = 138413314;
          v50 = v31;
          v51 = 2112;
          v52 = *(double *)&v32;
          v53 = 2112;
          v54 = v18;
          v55 = 2112;
          v56 = v16;
          v57 = 2112;
          v58 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ event.startDate, %@, index, %@, event, %@, data, %@", buf, 0x34u);

          a5 = v38;
          a4 = v39;
        }

        v23 = v10[2](v10, v16);
        if (v23 > -1.79769313e308 && v23 < 1.79769313e308)
        {
          switch(a5)
          {
            case 2uLL:
              goto LABEL_22;
            case 1uLL:
              -[MOTimeSeries value](v19, "value");
              v29 = v23 + v28 * (double)-[MOTimeSeries count](v19, "count");
              v23 = v29 / (double)(-[MOTimeSeries count](v19, "count") + 1);
LABEL_22:
              -[MOTimeSeries setValue:](v19, "setValue:", v23);
              break;
            case 0uLL:
              -[MOTimeSeries value](v19, "value");
              v23 = v23 + v27;
              goto LABEL_22;
          }
          -[MOTimeSeries setCount:](v19, "setCount:", (char *)-[MOTimeSeries count](v19, "count") + 1);
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v19, v18);
          goto LABEL_24;
        }
        v25 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v33 = NSStringFromSelector(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = v37;
          v50 = v34;
          v51 = 2048;
          v52 = v23;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@ Invalid ranged value, %f", buf, 0x16u);

          a4 = v39;
        }

LABEL_24:
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v14);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v11, "allValues"));
  return v35;
}

- (void)analyzeEvents:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  NSPredicate *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *i;
  void *v67;
  id v68;
  NSObject *v69;
  NSString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *j;
  void *v81;
  id v82;
  NSObject *v83;
  NSString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  MOTimeSeries *v90;
  uint64_t v91;
  MOTukeyOutlierDetector *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  double v96;
  NSString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  NSString *v106;
  void *v107;
  void *v108;
  NSString *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void (**v123)(id, _QWORD, uint64_t);
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  MOTrendsAnalyzer *v130;
  void *v131;
  SEL aSelectora;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  MOTimeSeries *v142;
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  id v150;
  __int16 v151;
  NSObject *v152;
  __int16 v153;
  double v154;
  __int16 v155;
  id v156;
  __int16 v157;
  id v158;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider == %lu AND category == %lu"), 5, objc_msgSend(v9, "category")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer lookupTrendsDataWithOptions:events:](self, "lookupTrendsDataWithOptions:events:", v9, v12));
    v130 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer eventWithOptions:originalTrendsData:](self, "eventWithOptions:originalTrendsData:", v9, v13));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v97 = NSStringFromSelector(a2);
      v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
      v127 = v12;
      v99 = v14;
      v100 = v13;
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyword"));
      *(_DWORD *)buf = 138413570;
      v146 = v98;
      v147 = 2112;
      v148 = v101;
      v149 = 2112;
      v150 = v9;
      v151 = 2048;
      v152 = objc_msgSend(v127, "count");
      v153 = 2112;
      v154 = *(double *)&v100;
      v155 = 2112;
      v156 = v99;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, options, %@, data, trends array, %lu, original trends, %@, new trends, %@", buf, 0x3Eu);

      v13 = v100;
      v14 = v99;
      v12 = v127;

    }
    if (objc_msgSend(v9, "category"))
      v17 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider != %lu AND category == %lu"), 5, objc_msgSend(v9, "category"));
    else
      v17 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider != %lu"), 5, v116);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v19));

    if (objc_msgSend(v18, "count"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));

      v128 = v21;
      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        v25 = 1.79769313e308;
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", (char *)objc_msgSend(v18, "count") - 2));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
        -[NSObject timeIntervalSinceDate:](v128, "timeIntervalSinceDate:", v23);
        v25 = v24;

        v21 = (uint64_t)v128;
      }
      v129 = v18;
      v121 = v13;
      v122 = v11;
      v126 = v12;
      v123 = v10;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trends"));
      -[MOTrendsAnalyzer updateTrendsData:lastEventDate:lastEventInterval:](v130, "updateTrendsData:lastEventDate:lastEventInterval:", v28, v21, v25);

      v29 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v106 = NSStringFromSelector(a2);
        v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyword"));
        *(_DWORD *)buf = 138413314;
        v146 = v107;
        v147 = 2112;
        v148 = v108;
        v149 = 2112;
        v150 = v14;
        v151 = 2112;
        v152 = v128;
        v153 = 2048;
        v154 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, trendsData, %@, update last event date and interval, last event date, %@, last event interval, %f", buf, 0x34u);

      }
      v125 = v14;

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trainDateInterval"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trainDateInterval"));
      v131 = v9;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "endDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "trainDateInterval"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startDate"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "trainDateInterval"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
      v39 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(startDate >= %@ AND startDate <= %@)"), v32, v34, v36, v38));

      v120 = (void *)v39;
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "filteredArrayUsingPredicate:", v39));
      v41 = objc_msgSend(v131, "aggregationDuration");
      v42 = objc_msgSend(v131, "aggregationMethod");
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "valueFunction"));
      v124 = (void *)v40;
      v44 = objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer prepareData:aggregationDuration:aggregationMethod:valueFunction:](v130, "prepareData:aggregationDuration:aggregationMethod:valueFunction:", v40, v41, v42, v43));

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "testDateInterval"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "startDate"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "testDateInterval"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "endDate"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "testDateInterval"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "startDate"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "testDateInterval"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "endDate"));
      v53 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(startDate >= %@ AND startDate <= %@)"), v46, v48, v50, v52));

      v54 = (void *)v44;
      v119 = (void *)v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "filteredArrayUsingPredicate:", v53));
      v56 = objc_msgSend(v131, "aggregationDuration");
      v57 = objc_msgSend(v131, "aggregationMethod");
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "valueFunction"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer prepareData:aggregationDuration:aggregationMethod:valueFunction:](v130, "prepareData:aggregationDuration:aggregationMethod:valueFunction:", v55, v56, v57, v58));

      v60 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v109 = NSStringFromSelector(a2);
        v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "keyword"));
        v112 = objc_msgSend(v124, "count");
        v113 = objc_msgSend(v55, "count");
        v114 = objc_msgSend(v54, "count");
        v115 = objc_msgSend(v59, "count");
        *(_DWORD *)buf = 138413826;
        v146 = v110;
        v147 = 2112;
        v148 = v111;
        v149 = 2112;
        v150 = v131;
        v151 = 2048;
        v152 = v112;
        v153 = 2048;
        v154 = *(double *)&v113;
        v155 = 2048;
        v156 = v114;
        v157 = 2048;
        v158 = v115;
        _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, options, %@, data, train, %lu, test, %lu, train.data, %lu, test.data, %lu", buf, 0x48u);

      }
      v117 = v59;
      v118 = v55;

      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v62 = v54;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v138, v144, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v139;
        do
        {
          for (i = 0; i != v64; i = (char *)i + 1)
          {
            if (*(_QWORD *)v139 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i);
            v68 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
            v69 = objc_claimAutoreleasedReturnValue(v68);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              v70 = NSStringFromSelector(a2);
              v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "date"));
              objc_msgSend(v67, "value");
              v74 = v73;
              v75 = objc_msgSend(v67, "count");
              *(_DWORD *)buf = 138413058;
              v146 = v71;
              v147 = 2112;
              v148 = v72;
              v149 = 2048;
              v150 = v74;
              v151 = 2048;
              v152 = v75;
              _os_log_debug_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "%@ train data, date, %@, value, %f, count, %lu", buf, 0x2Au);

            }
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v138, v144, 16);
        }
        while (v64);
      }

      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v76 = v117;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v135;
        do
        {
          for (j = 0; j != v78; j = (char *)j + 1)
          {
            if (*(_QWORD *)v135 != v79)
              objc_enumerationMutation(v76);
            v81 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)j);
            v82 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
            v83 = objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              v84 = NSStringFromSelector(a2);
              v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "date"));
              objc_msgSend(v81, "value");
              v88 = v87;
              v89 = objc_msgSend(v81, "count");
              *(_DWORD *)buf = 138413058;
              v146 = v85;
              v147 = 2112;
              v148 = v86;
              v149 = 2048;
              v150 = v88;
              v151 = 2048;
              v152 = v89;
              _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "%@ test data, date, %@, value, %f, count, %lu", buf, 0x2Au);

            }
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
        }
        while (v78);
      }

      if ((unint64_t)objc_msgSend(v62, "count") > 5)
      {
        v9 = v131;
        v11 = v122;
        v10 = v123;
        v14 = v125;
        if (!objc_msgSend(v76, "count"))
        {
          v90 = objc_alloc_init(MOTimeSeries);
          v142 = v90;
          v91 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v142, 1));

          v76 = (id)v91;
        }
        v92 = objc_opt_new(MOTukeyOutlierDetector);
        if (-[MOTukeyOutlierDetector fitData:](v92, "fitData:", v62))
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[MOTukeyOutlierDetector testData:](v92, "testData:", v76));
          v94 = v93;
          if (v93)
          {
            if (objc_msgSend(v93, "outlier"))
            {
              objc_msgSend(v94, "score");
              v95 = 4;
              if (v96 > 0.0)
                v95 = 6;
            }
            else
            {
              v95 = 5;
            }
            aSelectora = (SEL)v95;
            v103 = v125;
            v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "trends"));
            -[MOTrendsAnalyzer updateTrendsData:model:](v130, "updateTrendsData:model:", v104, v92);

            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "trends"));
            v102 = (uint64_t)aSelectora;
            -[MOTrendsAnalyzer updateTrendsData:result:](v130, "updateTrendsData:result:", v105, aSelectora);

          }
          else
          {
            v102 = 3;
            v103 = v125;
          }
          ((void (**)(id, void *, uint64_t))v123)[2](v123, v103, v102);

          v14 = v103;
        }
        else
        {
          ((void (**)(id, void *, uint64_t))v123)[2](v123, v125, 3);
        }

      }
      else
      {
        v10 = v123;
        v14 = v125;
        ((void (**)(id, void *, uint64_t))v123)[2](v123, v125, 1);
        v9 = v131;
        v11 = v122;
      }
      v18 = v129;

      v12 = v126;
      v27 = v128;
      v13 = v121;
    }
    else
    {
      v10[2](v10, 0, 1);
      v26 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[MOTrendsAnalyzer analyzeEvents:options:resultHandler:].cold.1(a2, v9, v27);
    }

  }
  else
  {
    v10[2](v10, 0, 1);
    v18 = v8;
  }

}

- (id)eventWithOptions:(id)a3 originalTrendsData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MOEvent *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id os_log;
  NSObject *v41;
  NSString *v42;
  void *v43;
  const char *v44;
  id v45;
  NSString *v47;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  MOEvent *v54;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventIdentifier"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)v9;
  v11 = [MOEvent alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDateInterval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDateInterval"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v17 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v11, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v10, v13, v15, v16, 5, objc_msgSend(v6, "category"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDateInterval"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEvent setExpirationDate:](v17, "setExpirationDate:", v20);

  v21 = objc_opt_new(NSMutableDictionary);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyword"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, CFSTR("keyword"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trainDateInterval"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v25, CFSTR("trainStartDate"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trainDateInterval"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
  objc_msgSend(v27, "timeIntervalSinceReferenceDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v28, CFSTR("trainEndDate"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDateInterval"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v31, CFSTR("testStartDate"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testDateInterval"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v34, CFSTR("testEndDate"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "aggregationDuration")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v35, CFSTR("aggregationDuration"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "aggregationMethod")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v36, CFSTR("aggregationMethod"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "valueFunctionType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v37, CFSTR("valueFunctionType"));

  -[MOEvent setTrends:](v17, "setTrends:", v21);
  if (v8)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent trends](v17, "trends"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trends"));
    -[MOTrendsAnalyzer updateTrendsData:prevTrendsData:](self, "updateTrendsData:prevTrendsData:", v38, v39);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    v41 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138412802;
      v50 = v43;
      v51 = 2112;
      v52 = v6;
      v53 = 2112;
      v54 = v17;
      v44 = "%@ options, %@, trends data from origin, event, %@";
LABEL_10:
      _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, v44, buf, 0x20u);

    }
  }
  else
  {
    v45 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    v41 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v47 = NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v47);
      *(_DWORD *)buf = 138412802;
      v50 = v43;
      v51 = 2112;
      v52 = v6;
      v53 = 2112;
      v54 = v17;
      v44 = "%@ options, %@, new trends data, event, %@";
      goto LABEL_10;
    }
  }

  return v17;
}

- (void)updateTrendsData:(id)a3 prevTrendsData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v5 = a3;
  v6 = a4;
  v19[0] = CFSTR("lastEventDate");
  v19[1] = CFSTR("lastEventInterval");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12, (_QWORD)v14));
        if (v13)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)updateTrendsData:(id)a3 lastEventDate:(id)a4 lastEventInterval:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  _BYTE v30[24];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("lastEventDate")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v30 = 138412290;
    *(_QWORD *)&v30[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "updateTrendsData, %@", v30, 0xCu);
  }

  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("lastEventDate"));

  v14 = 0.0;
  if (v10)
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v16 = v15;
    objc_msgSend(v10, "doubleValue");
    v18 = v16 - v17;
    if (v18 >= 0.0)
      v19 = v18;
    else
      v19 = -v18;
    if (v19 > 1.0)
    {
      if (v19 < a5)
        a5 = v19;
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)v30 = 134218240;
      *(double *)&v30[4] = a5;
      *(_WORD *)&v30[12] = 2048;
      *(double *)&v30[14] = v19;
      v22 = "updateTrendsData, min, %f, interval , %f";
      v23 = v21;
      v24 = 22;
      goto LABEL_15;
    }
    if (a5 < 1.79769313e308)
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      v21 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_16:

        v14 = a5;
        goto LABEL_17;
      }
      *(_DWORD *)v30 = 134217984;
      *(double *)&v30[4] = a5;
      v22 = "updateTrendsData, min, %f";
      v23 = v21;
      v24 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v22, v30, v24);
      goto LABEL_16;
    }
  }
LABEL_17:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14, *(_OWORD *)v30, *(_QWORD *)&v30[16]));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("lastEventInterval"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v27, "timeIntervalSinceDate:", v9);
  v29 = v28;

  if (v14 > 1814400.0 || v29 > 1814400.0)
    -[MOTrendsAnalyzer updateTrendsData:result:](self, "updateTrendsData:result:", v8, 8);

}

- (void)updateTrendsData:(id)a3 model:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a4;
  v6 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getTrainDataStats"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getTestDataStats"));

  objc_msgSend(v18, "mean");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("trainMean"));

  objc_msgSend(v18, "std");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("trainStd"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("trainCount"));

  objc_msgSend(v18, "min");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("trainMin"));

  objc_msgSend(v18, "max");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("trainMax"));

  objc_msgSend(v7, "mean");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("testMean"));

  objc_msgSend(v7, "std");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("testStd"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("testCount"));

  objc_msgSend(v7, "min");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("testMin"));

  objc_msgSend(v7, "max");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("testMax"));

}

- (void)updateTrendsData:(id)a3 result:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("trends"));

}

- (int64_t)trendsfromAnalyticsResult:(unint64_t)a3
{
  if (a3 - 4 > 2)
    return 0;
  else
    return qword_10029F160[a3 - 4];
}

- (id)lookupTrendsDataWithOptions:(id)a3 events:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v24 = 0;
    goto LABEL_24;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v8)
  {
    v24 = 0;
    goto LABEL_23;
  }
  v9 = v8;
  v26 = v6;
  v10 = *(_QWORD *)v32;
  v29 = v7;
  do
  {
    v11 = 0;
    v30 = v9;
    do
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trends"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trends"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("keyword")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyword"));
        if (objc_msgSend(v15, "isEqualToString:", v16))
        {
          v17 = v10;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("aggregationDuration")));
          v19 = objc_msgSend(v18, "unsignedLongValue");
          if (v19 == objc_msgSend(v5, "aggregationDuration"))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("aggregationMethod")));
            v21 = v5;
            v22 = objc_msgSend(v20, "unsignedLongValue");
            if (v22 == objc_msgSend(v21, "aggregationMethod"))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("valueFunctionType")));
              v28 = objc_msgSend(v23, "unsignedLongValue");
              v27 = objc_msgSend(v21, "valueFunctionType");

              v5 = v21;
              v10 = v17;
              v7 = v29;
              v9 = v30;
              if (v28 == v27)
              {
                v24 = v12;

                goto LABEL_21;
              }
              goto LABEL_16;
            }

            v5 = v21;
            v7 = v29;
          }

          v10 = v17;
          v9 = v30;
        }

LABEL_16:
      }
      v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v9);
  v24 = 0;
LABEL_21:
  v6 = v26;
LABEL_23:

LABEL_24:
  return v24;
}

- (id)buildAnalyticsPlans
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  NSMutableArray *v15;
  MOTrendsAnalyzerOptions *v16;
  MOTrendsAnalyzerOptions *v17;
  _QWORD *v18;
  MOTrendsAnalyzerOptions *v19;
  MOTrendsAnalyzerOptions *v20;
  MOTrendsAnalyzerOptions *v21;
  NSString *v23;
  void *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startOfDayWithBoundaryOfADay:", 10800.0));

  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", -2419200.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0));
  v9 = objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  v10 = objc_alloc((Class)NSDateInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0));
  v12 = objc_msgSend(v10, "initWithStartDate:endDate:", v11, v5);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138412802;
    v27 = v24;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ trainDateInterval, %@, testDateInterval, %@", buf, 0x20u);

  }
  v15 = objc_opt_new(NSMutableArray);
  v16 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:]([MOTrendsAnalyzerOptions alloc], "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueType:", CFSTR("workout.duration"), 2, v9, v12, 1, 0, 2);
  -[NSMutableArray addObject:](v15, "addObject:", v16);

  v17 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]([MOTrendsAnalyzerOptions alloc], "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:", CFSTR("work.duration"), 1, v9, v12, 1, 0, &__block_literal_global_31);
  -[NSMutableArray addObject:](v15, "addObject:", v17);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_2;
  v25[3] = &unk_1002B3698;
  v25[4] = self;
  v18 = objc_retainBlock(v25);
  v19 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]([MOTrendsAnalyzerOptions alloc], "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:", CFSTR("work.exit"), 1, v9, v12, 1, 2, v18);
  -[NSMutableArray addObject:](v15, "addObject:", v19);

  v20 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]([MOTrendsAnalyzerOptions alloc], "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:", CFSTR("media.playTime"), 4, v9, v12, 1, 0, &__block_literal_global_315);
  -[NSMutableArray addObject:](v15, "addObject:", v20);

  v21 = -[MOTrendsAnalyzerOptions initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:]([MOTrendsAnalyzerOptions alloc], "initWithKeyword:category:trainDateInterval:testDateInterval:aggregationDuration:aggregationMethod:valueFunction:", CFSTR("contact.interactions"), 10, v9, v12, 1, 0, &__block_literal_global_318);
  -[NSMutableArray addObject:](v15, "addObject:", v21);

  return v15;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke(id a1, MOEvent *a2)
{
  MOEvent *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = a2;
  if ((id)-[MOEvent placeUserType](v2, "placeUserType") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](v2, "endDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](v2, "startDate"));
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;

  }
  else
  {
    v6 = -1.79769313e308;
  }

  return v6;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a2;
  if (objc_msgSend(v3, "placeUserType") != (id)2
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate")), v4, !v4)
    || (v5 = *(void **)(a1 + 32),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate")),
        objc_msgSend(v5, "timeOfDay:", v6),
        v8 = v7,
        v6,
        v8 < 0.0))
  {
    v8 = -1.79769313e308;
  }

  return v8;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_3(id a1, MOEvent *a2)
{
  MOEvent *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(-[MOEvent mediaSumTimePlayed](v2, "mediaSumTimePlayed"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaSumTimePlayed](v2, "mediaSumTimePlayed")),
        objc_msgSend(v5, "doubleValue"),
        v7 = v6,
        v5,
        v4,
        v7 > 0.0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaSumTimePlayed](v2, "mediaSumTimePlayed"));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

  }
  else
  {
    v10 = -1.79769313e308;
  }

  return v10;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_4(id a1, MOEvent *a2)
{
  MOEvent *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent interactions](v2, "interactions"));

  if (!v3)
    goto LABEL_12;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent interactions](v2, "interactions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
  {

LABEL_12:
    v12 = -1.79769313e308;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "mechanism")));
      v11 = objc_msgSend(&off_1002DC7B8, "containsObject:", v10);

      v7 += v11;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);

  if (!v7)
    goto LABEL_12;
  v12 = (double)v7;
LABEL_13:

  return v12;
}

- (void)analyzeEvents:(id)a3 analyticsPlans:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSMutableArray *v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void (**v18)(id, NSMutableArray *, NSMutableDictionary *);
  id obj;
  _QWORD v20[4];
  NSMutableDictionary *v21;
  uint64_t v22;
  NSMutableArray *v23;
  SEL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v9 = a3;
  v10 = a4;
  v18 = (void (**)(id, NSMutableArray *, NSMutableDictionary *))a5;
  v11 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_new(NSMutableDictionary);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = __57__MOTrendsAnalyzer_analyzeEvents_analyticsPlans_handler___block_invoke;
        v20[3] = &unk_1002B3700;
        v21 = v12;
        v22 = v17;
        v23 = v11;
        v24 = a2;
        -[MOTrendsAnalyzer analyzeEvents:options:resultHandler:](self, "analyzeEvents:options:resultHandler:", v9, v17, v20);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v18[2](v18, v11, v12);
}

void __57__MOTrendsAnalyzer_analyzeEvents_analyticsPlans_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "keyword"));
  objc_msgSend(v6, "setValue:forKey:", v7, v8);

  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "keyword"));
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138413314;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2048;
    v22 = a3;
    v23 = 2112;
    v24 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ model, %@, options, %@, result, %lu, event, %@", (uint8_t *)&v15, 0x34u);

  }
}

- (double)timeOfDay:(id)a3
{
  id v3;
  id v4;
  id v5;

  if (!a3)
    return -1.0;
  v3 = a3;
  v4 = objc_msgSend(v3, "hours");
  v5 = objc_msgSend(v3, "minutes");

  return (double)((unint64_t)v5 + 60 * (_QWORD)v4);
}

- (MOHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthKitManager, 0);
}

- (void)sendMetricsForTrendsEvents:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  __int128 v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id os_log;
  __int128 v55;
  void *v56;
  id obj;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];

  v4 = a3;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D99B0, &off_1002DD0D8, &off_1002DD0E8));
  v5 = objc_opt_new(NSMutableDictionary);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v6)
  {
    v8 = v6;
    v58 = *(_QWORD *)v60;
    *(_QWORD *)&v7 = 138412290;
    v55 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v58)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trends", v55));

        if (v11)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trends"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "creationDate"));
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, CFSTR("creationDate"));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "creationDate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startOfDay"));
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("creationDateStartOfDay"));

          v18 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainEndDate")));
          if (v18)
          {
            v19 = (void *)v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainStartDate")));

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainEndDate")));
              objc_msgSend(v21, "doubleValue");
              v23 = v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainStartDate")));
              objc_msgSend(v24, "doubleValue");
              v26 = v23 - v25;

              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
              -[MOTrendsAnalyzer setValue:forKey:dictionary:bins:](self, "setValue:forKey:dictionary:bins:", v27, CFSTR("trainDuration"), v5, v56);

            }
          }
          v28 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testEndDate")));
          if (v28)
          {
            v29 = (void *)v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testStartDate")));

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testEndDate")));
              objc_msgSend(v31, "doubleValue");
              v33 = v32;
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testStartDate")));
              objc_msgSend(v34, "doubleValue");
              v36 = v33 - v35;

              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
              -[MOTrendsAnalyzer setValue:forKey:dictionary:bins:](self, "setValue:forKey:dictionary:bins:", v37, CFSTR("testDuration"), v5, v56);

            }
          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "category")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v38, CFSTR("category"), v5);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("keyword")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v39, CFSTR("keyword"), v5);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("aggregationDuration")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v40, CFSTR("aggregationDuration"), v5);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("aggregationMethod")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v41, CFSTR("aggregationMethod"), v5);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("valueFunctionType")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v42, CFSTR("valueFunctionType"), v5);

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainMean")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v43, CFSTR("trainMean"), v5);

          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainStd")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v44, CFSTR("trainStd"), v5);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainCount")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v45, CFSTR("trainCount"), v5);

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainMin")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v46, CFSTR("trainMin"), v5);

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trainMax")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v47, CFSTR("trainMax"), v5);

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testMean")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v48, CFSTR("testMean"), v5);

          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testStd")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v49, CFSTR("testStd"), v5);

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testCount")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v50, CFSTR("testCount"), v5);

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testMin")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v51, CFSTR("testMin"), v5);

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("testMax")));
          -[MOTrendsAnalyzer setDecimatedValue:forKey:dictionary:](self, "setDecimatedValue:forKey:dictionary:", v52, CFSTR("testMax"), v5);

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("trends")));
          -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v53, CFSTR("trends"), v5);

          -[MOTrendsAnalyzer setCommonFields:](self, "setCommonFields:", v5);
          log_analytics_submission(CFSTR("com.apple.Moments.trends"), v5);
          AnalyticsSendEvent(CFSTR("com.apple.Moments.trends"), v5);
        }
        else
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          v12 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v55;
            v64 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trends information is not available. %@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v8);
  }

}

- (void)setCommonFields:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id os_log;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  _QWORD *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t *v54;
  uint8_t *v55;
  uint8_t buf[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer healthKitManager](self, "healthKitManager"));

  if (v5)
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__25;
    v72 = __Block_byref_object_dispose__25;
    v73 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__25;
    v66 = __Block_byref_object_dispose__25;
    v67 = 0;
    if (objc_opt_class(MCProfileConnection, v6)
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection")),
          v8 = objc_msgSend(v7, "isHealthDataSubmissionAllowed"),
          v7,
          v8))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v57 = buf;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__25;
      v60 = __Block_byref_object_dispose__25;
      v61 = 0;
      v11 = dispatch_semaphore_create(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer healthKitManager](self, "healthKitManager"));
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke;
      v52[3] = &unk_1002B0C40;
      v13 = v11;
      v53 = v13;
      v54 = &v68;
      v55 = buf;
      objc_msgSend(v12, "fetchUserBiologicalSexWithHandler:", v52);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Trends/MOTrendsAnalyzer.m", 719, "-[MOTrendsAnalyzer(Metrics) setCommonFields:]"));
      v51 = 0;
      v15 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v13, &v51, v14);
      v43 = v51;
      if (!v15)
      {
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[MOTrendsAnalyzer(Metrics) setCommonFields:].cold.1((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);

      }
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = __Block_byref_object_copy__25;
      v49[4] = __Block_byref_object_dispose__25;
      v50 = 0;
      v24 = dispatch_semaphore_create(0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendsAnalyzer healthKitManager](self, "healthKitManager"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke_399;
      v45[3] = &unk_1002B0C68;
      v26 = v24;
      v46 = v26;
      v47 = &v62;
      v48 = v49;
      objc_msgSend(v25, "fetchUserAgeWithHandler:", v45);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Trends/MOTrendsAnalyzer.m", 736, "-[MOTrendsAnalyzer(Metrics) setCommonFields:]"));
      v44 = 0;
      v28 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v26, &v44, v27);
      v29 = v44;
      if (!v28)
      {
        v30 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[MOTrendsAnalyzer(Metrics) setCommonFields:].cold.1((uint64_t)v27, v31, v32, v33, v34, v35, v36, v37);

      }
      _Block_object_dispose(v49, 8);

      _Block_object_dispose(buf, 8);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v38, CFSTR("IHA_State"), v4);

      v39 = v63[5];
      if (v39)
        -[MOTrendsAnalyzer setValue:forKey:dictionary:bins:](self, "setValue:forKey:dictionary:bins:", v39, CFSTR("Age"), v4, &off_1002DC7D0);
      v40 = v69[5];
      if (v40)
        -[MOTrendsAnalyzer setValue:forKey:dictionary:](self, "setValue:forKey:dictionary:", v40, CFSTR("BiologicalSex"), v4);
    }
    else
    {
      v41 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Not sending age/biologicalSex to CoreAnalytics, no IHA permission", buf, 2u);
      }

    }
    _Block_object_dispose(&v62, 8);

    _Block_object_dispose(&v68, 8);
  }

}

void __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (!v5)
  {
    if (v11)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "biologicalSex")));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke_399(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5
{
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = objc_msgSend(a3, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5 bins:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  if (a3)
  {
    v9 = a6;
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = objc_msgSend(v12, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v11);

    v15 = (id)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v12, v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("_Bucketed")));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v14);
  }
}

- (void)setDecimatedValue:(id)a3 forKey:(id)a4 dictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  unint64_t v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    v12 = -v10;
    if (v11 >= 0.0)
      v13 = v11;
    else
      v13 = v12;
    v14 = vcvtmd_s64_f64(log10(v13));
    v15 = round(__exp10((double)(uint64_t)(1 - v14)) * v13);
    if (v11 >= 0.0)
      v16 = v15;
    else
      v16 = -v15;
    v17 = objc_msgSend(v9, "copy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("_Scale")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("_SignificantValue")));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v20);
  }
}

- (void)analyzeEvents:(const char *)a1 options:(void *)a2 resultHandler:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = NSStringFromSelector(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "keyword"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, MOTrendsAnalyzerResultInsufficientData", (uint8_t *)&v8, 0x16u);

}

@end
