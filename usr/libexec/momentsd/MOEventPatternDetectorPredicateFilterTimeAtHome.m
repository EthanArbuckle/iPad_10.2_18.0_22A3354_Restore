@implementation MOEventPatternDetectorPredicateFilterTimeAtHome

- (MOEventPatternDetectorPredicateFilterTimeAtHome)init
{
  MOEventPatternDetectorPredicateFilterTimeAtHome *v2;
  uint64_t v3;
  NSCalendar *cal;
  MOEventPatternDetectorPredicateFilterTimeAtHome *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOEventPatternDetectorPredicateFilterTimeAtHome;
  v2 = -[MOEventPatternDetectorPredicateFilterTimeAtHome init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)filterEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSCalendar *cal;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _UNKNOWN **v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSMutableArray *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  id v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu"), CFSTR("category"), 1, CFSTR("placeUserType"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));
  v7 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v55 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventPatternDetectorUtilities getHomeVisitChunksForStandardDay:](MOEventPatternDetectorUtilities, "getHomeVisitChunksForStandardDay:", v9));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v52 = objc_msgSend(v9, "count");
    v53 = 2048;
    v54 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Found %lu home visits and processed into %lu home visit chunks", buf, 0x16u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v39 = v9;
    v40 = v7;
    v41 = v6;
    v42 = v5;
    v43 = v4;
    v44 = objc_opt_new(NSMutableArray);
    v13 = objc_opt_new(NSMutableDictionary);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v38 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v19, "setTimeAtHomeSubType:", 1);
          cal = self->_cal;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateByAddingTimeInterval:", -10800.0));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](cal, "components:fromDate:", 512, v22));

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v23, "weekday")));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v24));

          if (!v25)
          {
            v26 = objc_opt_new(NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v26, v24);

          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v24));
          objc_msgSend(v27, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v16);
    }

    v28 = 1;
    v29 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v5 = v42;
    v4 = v43;
    v6 = v41;
    v30 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    do
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[317], "numberWithInt:", v28));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v31));

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[317], "numberWithInt:", v28));
        v34 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v33));

        v49 = v29;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](v34, "sortedArrayUsingDescriptors:", v35));
        -[NSMutableArray addObject:](v44, "addObject:", v36);

        v30 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      }
      else
      {
        v34 = objc_opt_new(NSArray);
        -[NSMutableArray addObject:](v44, "addObject:", v34);
      }

      v28 = (v28 + 1);
    }
    while ((_DWORD)v28 != 8);

    v9 = v39;
    v7 = v40;
    v10 = v38;
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cal, 0);
}

@end
