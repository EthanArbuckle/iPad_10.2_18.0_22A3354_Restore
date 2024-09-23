@implementation MOEventPatternDetectorPredicateFilterByADPDCounts

- (MOEventPatternDetectorPredicateFilterByADPDCounts)init
{
  MOEventPatternDetectorPredicateFilterByADPDCounts *v2;
  MOEventPatternDetectorPredicateFilterByADPDCounts *v3;
  MOEventPatternDetectorPredicateFilterByADPDCounts *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterByADPDCounts;
  v2 = -[MOEventPatternDetectorPredicateFilterByADPDCounts init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _QWORD v57[2];
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  id v63;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu"), CFSTR("category"), 1, CFSTR("placeUserType"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v5));
  v7 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v63 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
  v47 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventPatternDetectorUtilities getHomeVisitChunksForStandardDay:](MOEventPatternDetectorUtilities, "getHomeVisitChunksForStandardDay:", v9));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v60 = objc_msgSend(v9, "count");
    v61 = 2048;
    v62 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Found %lu home visits and processed into %lu home visit chunks", buf, 0x16u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v45 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 15));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v13));
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v46, "count");
      *(_DWORD *)buf = 134217984;
      v60 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "H@H: Found %lu proximity events", buf, 0xCu);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 23));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:"));
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v60 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "H@H: Found %lu people density events", buf, 0xCu);
    }

    v21 = objc_msgSend(v17, "count");
    v22 = v46;
    if ((char *)objc_msgSend(v46, "count") + (_QWORD)v21)
    {
      v40 = v13;
      v42 = v5;
      v43 = v3;
      v24 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
      v25 = objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorPredicateFilterByADPDCounts splitIntoWeekdays:withADPDEvents:withCalendar:](self, "splitIntoWeekdays:withADPDEvents:withCalendar:", v10, v46, v24));
      v41 = v10;
      v39 = v24;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorPredicateFilterByADPDCounts splitIntoWeekdays:withADPDEvents:withCalendar:](self, "splitIntoWeekdays:withADPDEvents:withCalendar:", v10, v17, v24));
      v38 = (void *)v25;
      v57[0] = v25;
      v57[1] = v37;
      obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v51)
      {
        v49 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v51; i = (char *)i + 1)
          {
            if (*(_QWORD *)v53 != v49)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
            v28 = 1;
            do
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v29));

              if (v30)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28));
                v32 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v31));

                v56 = v7;
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
                v34 = v17;
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](v32, "sortedArrayUsingDescriptors:", v33));
                -[NSMutableArray addObject:](v4, "addObject:", v35);

                v17 = v34;
              }
              else
              {
                v32 = objc_opt_new(NSArray);
                -[NSMutableArray addObject:](v4, "addObject:", v32);
              }

              v28 = (v28 + 1);
            }
            while ((_DWORD)v28 != 8);
          }
          v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v51);
      }

      v23 = v4;
      v5 = v42;
      v3 = v43;
      v13 = v40;
      v10 = v41;
      v22 = v46;
    }
    else
    {
      v23 = 0;
    }

    v9 = v45;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)splitIntoWeekdays:(id)a3 withADPDEvents:(id)a4 withCalendar:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  id obj;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v7 = a3;
  v8 = a4;
  v31 = a5;
  v9 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v11 = objc_msgSend(v10, "category");

  if (v11 == (id)15)
    v12 = 0;
  else
    v12 = -1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v14 = objc_msgSend(v13, "category");

  if (v14 == (id)23)
    v15 = 1;
  else
    v15 = v12;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(obj);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorPredicateFilterByADPDCounts crossReference:withEvents:withGroupingStrategy:](self, "crossReference:withEvents:withGroupingStrategy:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v19), v8, v15));
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateByAddingTimeInterval:", -10800.0));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "components:fromDate:", 512, v23));

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v24, "weekday")));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v25));

          if (!v26)
          {
            v27 = objc_opt_new(NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v27, v25);

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v25));
          objc_msgSend(v28, "addObject:", v21);

        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  return v9;
}

- (id)crossReference:(id)a3 withEvents:(id)a4 withGroupingStrategy:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  MOEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MOEvent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  id v33;
  id v34;
  NSMutableArray *v35;
  signed int v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  signed int v41;
  NSMutableArray *v42;
  void *v43;
  MOEvent *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  float v58;
  float v59;
  void *j;
  void *v61;
  void *v62;
  float v63;
  float v64;
  void *v65;
  float v66;
  float v67;
  id v68;
  void *v69;
  float v70;
  float v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  MOEvent *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  NSMutableArray *obja;
  NSMutableArray *objb;
  id objc;
  NSMutableArray *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  v96 = objc_opt_new(NSMutableArray);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v106 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        if (objc_msgSend(v16, "compare:", v8) != (id)-1 && objc_msgSend(v17, "compare:", v9) != (id)1)
          -[NSMutableArray addObject:](v96, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
    }
    while (v12);
  }

  v18 = v96;
  if (!-[NSMutableArray count](v96, "count"))
    goto LABEL_29;
  if (-[NSMutableArray count](v96, "count") != (id)1)
  {
    if (a5 == 1)
    {
      v91 = v6;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      objb = v96;
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
      if (v54)
      {
        v55 = v54;
        v56 = 0;
        v57 = *(_QWORD *)v98;
        v58 = 0.0;
        v59 = 0.0;
        do
        {
          for (j = 0; j != v55; j = (char *)j + 1)
          {
            if (*(_QWORD *)v98 != v57)
              objc_enumerationMutation(objb);
            v61 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)j);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "densityScore"));
            objc_msgSend(v62, "floatValue");
            v64 = v63;

            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "densityScore"));
            objc_msgSend(v65, "floatValue");
            v67 = v66;

            if (v67 > v59)
            {
              v68 = v61;

              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "densityScore"));
              objc_msgSend(v69, "floatValue");
              v59 = v70;

              v56 = v68;
            }
            v58 = v58 + v64;
          }
          v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
        }
        while (v55);
      }
      else
      {
        v56 = 0;
        v58 = 0.0;
      }

      v71 = v58 / (float)(unint64_t)-[NSMutableArray count](objb, "count");
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortMOEventArrayByStartDate](objb, "sortMOEventArrayByStartDate"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "firstObject"));

      v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortMOEventArrayByEndDate](objb, "sortMOEventArrayByEndDate"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lastObject"));

      if (v56)
        v76 = v56;
      else
        v76 = v73;
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "eventIdentifier"));
      v77 = [MOEvent alloc];
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "startDate"));
      objc = v73;
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "endDate"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v26 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v77, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v88, v78, v79, v80, 5, 1);

      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "endDate"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "dateByAddingTimeInterval:", 2419200.0));
      -[MOEvent setExpirationDate:](v26, "setExpirationDate:", v82);

      -[MOEvent setPCount:](v26, "setPCount:", &off_1002D80C0);
      *(float *)&v83 = v71;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v83));
      -[MOEvent setDensityScore:](v26, "setDensityScore:", v84);

      -[MOEvent setTimeAtHomeSubType:](v26, "setTimeAtHomeSubType:", 3);
      v6 = v91;
      goto LABEL_49;
    }
    if (!a5)
    {
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v32 = v96;
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
      if (!v33)
      {
        v26 = 0;
        goto LABEL_43;
      }
      v34 = v33;
      v90 = v6;
      obja = v32;
      v87 = v10;
      v35 = 0;
      v36 = 0;
      v37 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(_QWORD *)v102 != v37)
            objc_enumerationMutation(obja);
          v39 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "pCount", v87));
          v41 = objc_msgSend(v40, "intValue");

          if (v41 > v36)
          {
            v42 = v39;

            v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray pCount](v42, "pCount"));
            v36 = objc_msgSend(v43, "intValue");

            v35 = v42;
          }
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
      }
      while (v34);

      if (v35)
      {
        v44 = [MOEvent alloc];
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray eventIdentifier](v35, "eventIdentifier"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray startDate](v35, "startDate"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray endDate](v35, "endDate"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v26 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v44, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v45, v46, v47, v48, 5, 1);

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray endDate](v35, "endDate"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "dateByAddingTimeInterval:", 2419200.0));
        -[MOEvent setExpirationDate:](v26, "setExpirationDate:", v50);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray pCount](v35, "pCount"));
        -[MOEvent setPCount:](v26, "setPCount:", v51);

        -[MOEvent setDensityScore:](v26, "setDensityScore:", &off_1002DCF28);
        -[MOEvent setTimeAtHomeSubType:](v26, "setTimeAtHomeSubType:", 3);
        v32 = v35;
        v10 = v87;
        v6 = v90;
        v18 = v96;
LABEL_43:

        goto LABEL_50;
      }
      v26 = 0;
      v10 = v87;
      v6 = v90;
LABEL_49:
      v18 = v96;
      goto LABEL_50;
    }
LABEL_29:
    v26 = 0;
    goto LABEL_50;
  }
  v89 = v6;
  v19 = [MOEvent alloc];
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "eventIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v26 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v19, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v20, v22, v24, v25, 5, 1);

  v18 = v96;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEvent setExpirationDate:](v26, "setExpirationDate:", v29);

  if (a5 == 1)
  {
    -[MOEvent setPCount:](v26, "setPCount:", &off_1002D80C0);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "densityScore"));
    -[MOEvent setDensityScore:](v26, "setDensityScore:", v53);

    v6 = v89;
  }
  else
  {
    v6 = v89;
    if (!a5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v96, "firstObject"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pCount"));
      -[MOEvent setPCount:](v26, "setPCount:", v31);

      -[MOEvent setDensityScore:](v26, "setDensityScore:", &off_1002DCF28);
    }
  }
  -[MOEvent setTimeAtHomeSubType:](v26, "setTimeAtHomeSubType:", 3);
LABEL_50:

  return v26;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
