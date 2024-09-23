@implementation MOEventBundler

- (MOEventBundler)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  MOEventBundler *v11;
  MOEventBundler *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *eventBundleDict;
  MOEventBundler *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  SEL v28;
  MOEventBundler *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOEventBundler initWithStartDate:endDate:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: startDate");
    v28 = a2;
    v29 = self;
    v30 = 67;
    goto LABEL_12;
  }
  if (!v9)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOEventBundler initWithStartDate:endDate:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: endDate");
    v28 = a2;
    v29 = self;
    v30 = 68;
LABEL_12:
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("MOEventBundler.m"), v30, v27);

    v15 = 0;
    goto LABEL_13;
  }
  v41.receiver = self;
  v41.super_class = (Class)MOEventBundler;
  v11 = -[MOEventBundler init](&v41, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    v13 = objc_opt_new(NSMutableDictionary);
    eventBundleDict = v12->_eventBundleDict;
    v12->_eventBundleDict = v13;

  }
  self = v12;
  v15 = self;
LABEL_13:

  return v15;
}

- (id)returnCurrentEventBundles
{
  return self->_eventBundleDict;
}

- (id)calculateEventBundlesFromEvents:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  NSMutableDictionary *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSMutableArray *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  MOGraph *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSMutableSet *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
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
  _QWORD v62[2];
  uint8_t buf[4];
  id v64;

  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v64 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetched events count, %lu", buf, 0xCu);
  }

  v8 = objc_opt_new(NSMutableDictionary);
  if (v5 && objc_msgSend(v5, "count"))
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundler predicateForBasicFilteringOfEvents](self, "predicateForBasicFilteringOfEvents"));
    objc_msgSend(v5, "filterUsingPredicate:");
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v64 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Basic pruning is done. Number of events post pruning, %lu", buf, 0xCu);
    }

    v12 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v5, "count"))
    {
      v13 = 0;
      v14 = 1;
      while (1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v13));
        if (objc_msgSend(v15, "category") != (id)7
          && objc_msgSend(v15, "category") != (id)6
          && objc_msgSend(v15, "category") != (id)12
          && objc_msgSend(v15, "provider") != (id)5
          && objc_msgSend(v15, "category") != (id)9
          && objc_msgSend(v15, "category") != (id)10
          && (objc_msgSend(v15, "isHomeWorkVisit") & 1) == 0
          && objc_msgSend(v15, "category") != (id)3
          && objc_msgSend(v15, "category") != (id)4
          && (unint64_t)objc_msgSend(v5, "count") > v13 + 1)
        {
          break;
        }
LABEL_39:

        ++v13;
        ++v14;
        if ((unint64_t)objc_msgSend(v5, "count") <= v13)
          goto LABEL_40;
      }
      v16 = v14;
      while (1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v16));
        if (objc_msgSend(v17, "category") == (id)7)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)6)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)12)
          goto LABEL_38;
        if (objc_msgSend(v17, "provider") == (id)5)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)9)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)10)
          goto LABEL_38;
        if ((objc_msgSend(v17, "isHomeWorkVisit") & 1) != 0)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)3)
          goto LABEL_38;
        if (objc_msgSend(v17, "category") == (id)4)
          goto LABEL_38;
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        if (!v18)
          goto LABEL_38;
        v60 = (void *)v18;
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        if (!v58)
          goto LABEL_37;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
        if (!v52)
          goto LABEL_36;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));

        if (v55)
          break;
LABEL_38:

        if ((unint64_t)objc_msgSend(v5, "count") <= ++v16)
          goto LABEL_39;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "dateByAddingTimeInterval:", -0.0));

      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dateByAddingTimeInterval:", 0.0));

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dateByAddingTimeInterval:", -0.0));

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dateByAddingTimeInterval:", 0.0));

      v51 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v60, v58);
      v46 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v57, v54);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "intersectionWithDateInterval:"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "endDate"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "startDate"));
      objc_msgSend(v47, "timeIntervalSinceDate:", v44);
      v20 = v19;

      if (v20 > 0.0)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
        v62[0] = v48;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
        v62[1] = v45;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2));
        -[NSMutableArray addObject:](v12, "addObject:", v43);

      }
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
LABEL_40:
    if (objc_msgSend(v5, "count"))
    {
      v21 = -[MOGraph initWithNumVertices:edges:]([MOGraph alloc], "initWithNumVertices:edges:", objc_msgSend(v5, "count"), v12);
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = -[NSMutableArray count](v12, "count");
        *(_DWORD *)buf = 134217984;
        v64 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Correlation graph is built with number of edges, %lu", buf, 0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOGraph calculateConnectedComponentWithGraphTraversal:](v21, "calculateConnectedComponentWithGraphTraversal:", 1));
      v26 = objc_msgSend(v25, "count");
      if (v26 != objc_msgSend(v5, "count"))
      {
        v27 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MOEventBundler calculateEventBundlesFromEvents:].cold.1(v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundler.m"), 136, CFSTR("The events and membership arrays have to be of the same size. (in %s:%d)"), "-[MOEventBundler calculateEventBundlesFromEvents:]", 136);

      }
      if (objc_msgSend(v5, "count"))
      {
        v30 = 0;
        do
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v30));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v31));

          if (!v32)
          {
            v33 = objc_opt_new(NSMutableSet);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v33, v31);

          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v31));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v30));
          objc_msgSend(v34, "addObject:", v35);

          ++v30;
        }
        while ((unint64_t)objc_msgSend(v5, "count") > v30);
      }
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = -[NSMutableDictionary count](v8, "count");
        *(_DWORD *)buf = 134217984;
        v64 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Graph partitioning is performed (before semantic pruning). Number of correlated bundles: %lu", buf, 0xCu);
      }

      v39 = v8;
    }
    else
    {
      v41 = v8;
    }

  }
  else
  {
    v40 = v8;
  }

  return v8;
}

- (id)pruneEventBundles:(id)a3
{
  id v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *j;
  void *v18;
  id os_log;
  NSObject *v20;
  void *v21;
  id v22;
  _UNKNOWN **v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  MOEventBundle *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  id v32;
  void *v33;
  MOEventBundle *v34;
  NSMutableDictionary *eventBundleDict;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  int v42;
  uint64_t v43;
  void *m;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSMutableDictionary *v53;
  id obj;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  MOEventBundle *v64;
  id v65;
  int v66;
  uint64_t v67;
  id v68;
  void *context;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
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
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  id v96;
  __int16 v97;
  int v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];

  v3 = a3;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundler predicatesOfDesiredExperiences](MOEventBundler, "predicatesOfDesiredExperiences"));
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v59)
  {
    v66 = 0;
    v58 = *(_QWORD *)v89;
    v56 = v3;
    do
    {
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v58)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
        v6 = objc_autoreleasePoolPush();
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v60 = v6;
          v61 = i;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
          v11 = objc_msgSend(v10, "mutableCopy");

          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
          v65 = v12;
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v85;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(_QWORD *)v85 != v16)
                  objc_enumerationMutation(v12);
                v18 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j);
                os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                v20 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventIdentifier"));
                  *(_DWORD *)buf = 138412802;
                  v96 = v5;
                  v97 = 1024;
                  v98 = v15 + (_DWORD)j + 1;
                  v12 = v65;
                  v99 = 2112;
                  v100 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "post graph partitioning bundle %@ with subevent %d:\n %@", buf, 0x1Cu);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
              v15 += (int)j;
            }
            while (v14);
          }

          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v22 = v57;
          v68 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
          if (v68)
          {
            v67 = *(_QWORD *)v81;
            v23 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            v62 = v22;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v81 != v67)
                  objc_enumerationMutation(v22);
                v70 = v24;
                v25 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v24);
                context = objc_autoreleasePoolPush();
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v25));
                v71 = (void *)objc_opt_new(v23[314]);
                v76 = 0u;
                v77 = 0u;
                v78 = 0u;
                v79 = 0u;
                v27 = v26;
                v28 = -[MOEventBundle countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
                if (v28)
                {
                  v29 = v28;
                  v30 = *(_QWORD *)v77;
                  while (2)
                  {
                    for (k = 0; k != v29; k = (char *)k + 1)
                    {
                      if (*(_QWORD *)v77 != v30)
                        objc_enumerationMutation(v27);
                      v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)k)));
                      if (!objc_msgSend(v32, "count"))
                      {
                        v33 = v71;
                        objc_msgSend(v71, "removeAllObjects");
                        v34 = v27;
                        goto LABEL_42;
                      }
                      objc_msgSend(v71, "addObjectsFromArray:", v32);

                    }
                    v29 = -[MOEventBundle countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
                    if (v29)
                      continue;
                    break;
                  }
                }

                v33 = v71;
                v34 = -[MOEventBundle initWithEventSet:filtered:]([MOEventBundle alloc], "initWithEventSet:filtered:", v71, 1);
                -[MOEventBundle setBundleType:](v34, "setBundleType:", v25);
                eventBundleDict = self->_eventBundleDict;
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ++v66));
                -[NSMutableDictionary setObject:forKeyedSubscript:](eventBundleDict, "setObject:forKeyedSubscript:", v34, v36);

                v37 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                v38 = objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleType](v34, "bundleType"));
                  *(_DWORD *)buf = 138412290;
                  v96 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Created post semantic pruning bundle of type: %@ including:", buf, 0xCu);

                }
                v74 = 0u;
                v75 = 0u;
                v72 = 0u;
                v73 = 0u;
                v32 = v71;
                v40 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                if (v40)
                {
                  v41 = v40;
                  v64 = v27;
                  v42 = 0;
                  v43 = *(_QWORD *)v73;
                  do
                  {
                    for (m = 0; m != v41; m = (char *)m + 1)
                    {
                      if (*(_QWORD *)v73 != v43)
                        objc_enumerationMutation(v32);
                      v45 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)m);
                      v46 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                      v47 = objc_claimAutoreleasedReturnValue(v46);
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                      {
                        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleType](v34, "bundleType"));
                        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "eventIdentifier"));
                        *(_DWORD *)buf = 138412802;
                        v96 = v48;
                        v97 = 1024;
                        v98 = v42 + (_DWORD)m + 1;
                        v99 = 2112;
                        v100 = v49;
                        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "post semantic pruning bundle %@, with subevent %d:\n %@", buf, 0x1Cu);

                      }
                    }
                    v41 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                    v42 += (int)m;
                  }
                  while (v41);
                  v23 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                  v27 = v64;
                  v12 = v65;
                  v22 = v62;
                  v33 = v71;
                }
LABEL_42:

                objc_autoreleasePoolPop(context);
                v24 = v70 + 1;
              }
              while ((id)(v70 + 1) != v68);
              v68 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
            }
            while (v68);
          }

          v3 = v56;
          v6 = v60;
          i = v61;
        }
        objc_autoreleasePoolPop(v6);
      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v59);
  }

  v50 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = -[NSMutableDictionary count](self->_eventBundleDict, "count");
    *(_DWORD *)buf = 134217984;
    v96 = v52;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Bundles created after semantic pruning. Number of correlated bundles: %lu", buf, 0xCu);
  }

  v53 = self->_eventBundleDict;
  return v53;
}

- (id)predicateForBasicFilteringOfEvents
{
  return +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_3);
}

BOOL __52__MOEventBundler_predicateForBasicFilteringOfEvents__block_invoke(id a1, MOEvent *a2, NSDictionary *a3)
{
  return -[MOEvent category](a2, "category", a3) != 0;
}

+ (id)propertyNameDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[15];
  _QWORD v20[15];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("provider")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("category")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("workoutType")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("placeName")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("startDate")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("endDate")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("creationDate")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("expirationDate")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("mediaRepetitions")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("interactionContactScore")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("extendedAttributes"), CFSTR("photoMomentInferences")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("extendedAttributes"), CFSTR("photoMomentHolidays")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("extendedAttributes"), CFSTR("photoMomentPublicEvents")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("extendedAttributes"), CFSTR("photoMomentPersons")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("suggestedEventCategory")));
  v19[0] = CFSTR("strProvider");
  v19[1] = CFSTR("strCategory");
  v20[0] = v18;
  v20[1] = v17;
  v19[2] = CFSTR("strWorkoutType");
  v19[3] = CFSTR("strPlaceName");
  v20[2] = v16;
  v20[3] = v15;
  v19[4] = CFSTR("strStartDate");
  v19[5] = CFSTR("strEndDate");
  v20[4] = v14;
  v20[5] = v2;
  v19[6] = CFSTR("strCreationDate");
  v19[7] = CFSTR("strExpirationDate");
  v20[6] = v3;
  v20[7] = v4;
  v19[8] = CFSTR("strMediaRepetitions");
  v19[9] = CFSTR("strInteractionContactScore");
  v20[8] = v5;
  v20[9] = v6;
  v19[10] = CFSTR("strPhotoMomentInferences");
  v19[11] = CFSTR("strPhotoMomentHolidays");
  v20[10] = v13;
  v20[11] = v12;
  v19[12] = CFSTR("strPhotoMomentPublicEvents");
  v19[13] = CFSTR("strPhotoMomentPersons");
  v20[12] = v11;
  v20[13] = v7;
  v19[14] = CFSTR("strSuggestedEventCategory");
  v20[14] = v8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 15));

  return v10;
}

+ (id)predicatesOfDesiredExperiences
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSMutableArray *v86;
  uint64_t i;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
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
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  NSMutableDictionary *v210;
  void *v211;
  _QWORD v212[3];
  void *v213;
  _QWORD v214[3];
  void *v215;
  _QWORD v216[3];
  void *v217;
  _QWORD v218[2];
  void *v219;
  _QWORD v220[3];
  void *v221;
  _QWORD v222[3];
  _QWORD v223[2];
  _QWORD v224[3];
  _QWORD v225[2];
  void *v226;
  _QWORD v227[3];
  _QWORD v228[2];
  _QWORD v229[3];
  _QWORD v230[2];
  void *v231;
  _QWORD v232[3];
  _QWORD v233[2];
  _QWORD v234[3];
  _QWORD v235[3];
  _QWORD v236[2];
  _QWORD v237[3];
  _QWORD v238[3];
  uint64_t v239;
  _QWORD v240[3];
  uint64_t v241;
  _QWORD v242[3];
  uint64_t v243;
  _QWORD v244[3];
  _QWORD v245[2];
  _QWORD v246[3];
  _QWORD v247[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundler propertyNameDictionary](MOEventBundler, "propertyNameDictionary"));
  v210 = objc_opt_new(NSMutableDictionary);
  v3 = _HKWorkoutActivityNameForActivityType(24);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v5, 1));
  v247[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v7, 2));
  v247[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strWorkoutType")));
  v203 = (void *)v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), v9, v4));
  v247[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v247, 3));
  v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  v12 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC4E8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v13, 2));
  v246[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v15, 5));
  v246[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v202 = (void *)v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v17, v12));
  v246[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v246, 3));
  v20 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v19));

  v245[0] = v209;
  v245[1] = v20;
  v201 = (void *)v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v245, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v21, CFSTR("HikingPlusPhotos"));

  v22 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC500));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v23, 2));
  v244[0] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v25, 5));
  v244[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v200 = (void *)v22;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v27, v22));
  v244[2] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v244, 3));
  v30 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v29));

  v199 = (void *)v30;
  v243 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v243, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v31, CFSTR("WeddingPhotos"));

  v32 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC518));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v33, 2));
  v242[0] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v35, 5));
  v242[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v198 = (void *)v32;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v37, v32));
  v242[2] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v242, 3));
  v40 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v39));

  v197 = (void *)v40;
  v241 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v241, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v41, CFSTR("AnniversaryPhotos"));

  v42 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC530));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v43, 2));
  v240[0] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v45, 5));
  v240[1] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v196 = (void *)v42;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v47, v42));
  v240[2] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v240, 3));
  v50 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v49));

  v195 = (void *)v50;
  v239 = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v239, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v51, CFSTR("BirthdayPhotos"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v52, 4));
  v238[0] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v54, 1));
  v238[1] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPlaceName")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.length > 0"), v56));
  v238[2] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v238, 3));
  v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v58));

  v59 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC548));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v60, 2));
  v237[0] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v62, 5));
  v237[1] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v194 = (void *)v59;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v64, v59));
  v237[2] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v237, 3));
  v67 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v66));

  v236[0] = v208;
  v193 = (void *)v67;
  v236[1] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v236, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v68, CFSTR("VisitPlusConcert"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v69, 4));
  v235[0] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v71, 1));
  v235[1] = v72;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPlaceName")));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.length > 0"), v73));
  v235[2] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v235, 3));
  v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v75));

  v76 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC560));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v77, 2));
  v234[0] = v78;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v79, 5));
  v234[1] = v80;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v192 = (void *)v76;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v81, v76));
  v234[2] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v234, 3));
  v84 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v83));

  v233[0] = v207;
  v191 = (void *)v84;
  v233[1] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v233, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v85, CFSTR("VisitPlusAmusementPark"));

  v86 = objc_opt_new(NSMutableArray);
  for (i = 0; i != 31; ++i)
  {
    v88 = _HKWorkoutActivityNameForActivityType(predicatesOfDesiredExperiences_cardioActivityTypes[i]);
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
    -[NSMutableArray addObject:](v86, "addObject:", v89);

  }
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v90, 1));
  v232[0] = v91;
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v92, 2));
  v232[1] = v93;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strWorkoutType")));
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), v94, v86));
  v232[2] = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v232, 3));
  v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v96));

  v231 = v190;
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v231, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v97, CFSTR("CardioActivity"));

  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v98, 1));
  v230[0] = v99;
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v100, 2));
  v230[1] = v101;
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v230, 2));
  v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v102));

  v189 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC578));
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v204, 2));
  v229[0] = v103;
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v104, 5));
  v229[1] = v105;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v106, v189));
  v229[2] = v107;
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v229, 3));
  v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v108));

  v228[0] = v206;
  v228[1] = v188;
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v228, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v109, CFSTR("ActiveBabyParent"));

  v187 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC590));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v110, 2));
  v227[0] = v111;
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v112, 5));
  v227[1] = v113;
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v114, v187));
  v227[2] = v115;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v227, 3));
  v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v116));

  v226 = v186;
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v226, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v117, CFSTR("BabyParent"));

  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v118, 1));
  v225[0] = v119;
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v120, 2));
  v225[1] = v121;
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v225, 2));
  v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v122));

  v185 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC5A8));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v184, 2));
  v224[0] = v123;
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v124, 5));
  v224[1] = v125;
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v126, v185));
  v224[2] = v127;
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v224, 3));
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v128));

  v223[0] = v205;
  v223[1] = v183;
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v223, 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v129, CFSTR("ActivePetParent"));

  v182 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", &off_1002DC5C0));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v130, 2));
  v222[0] = v131;
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v132, 5));
  v222[1] = v133;
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strPhotoMomentInferences")));
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY %K IN %@"), v134, v182));
  v222[2] = v135;
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v222, 3));
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v136));

  v221 = v181;
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v221, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v137, CFSTR("PetParent"));

  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v138, 3));
  v220[0] = v139;
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v140, 3));
  v220[1] = v141;
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strMediaRepetitions")));
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K > %@"), v142, &off_1002D8078));
  v220[2] = v143;
  v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v220, 3));
  v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v144));

  v219 = v180;
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v219, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v145, CFSTR("MediaOnRepeat"));

  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v146, 3));
  v218[0] = v147;
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v148, 8));
  v218[1] = v149;
  v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v218, 2));
  v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v150));

  v217 = v179;
  v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v217, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v151, CFSTR("TravelEvent"));

  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v152, 3));
  v216[0] = v153;
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v154, 11));
  v216[1] = v155;
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strSuggestedEventCategory")));
  v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v156, 9));
  v216[2] = v157;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v216, 3));
  v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v158));

  v215 = v178;
  v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v215, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v159, CFSTR("StructuredEventMovie"));

  v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i"), 1, 3, 4, 5));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v160, 3));
  v214[0] = v161;
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v162, 11));
  v214[1] = v163;
  v214[2] = v177;
  v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v214, 3));
  v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v164));

  v213 = v176;
  v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v213, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v165, CFSTR("StructuredEventTransportation"));

  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v166, 3));
  v212[0] = v167;
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v168, 10));
  v212[1] = v169;
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("strInteractionContactScore")));
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K > %@"), v170, &off_1002DCF18));
  v212[2] = v171;
  v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v212, 3));
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v172));

  v211 = v173;
  v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v211, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v210, "setObject:forKeyedSubscript:", v174, CFSTR("SignificantContactInteraction"));

  return v210;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSMutableDictionary)eventBundleDict
{
  return self->_eventBundleDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleDict, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: startDate", a5, a6, a7, a8, 0);
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: endDate", a5, a6, a7, a8, 0);
}

- (void)calculateEventBundlesFromEvents:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOEventBundler calculateEventBundlesFromEvents:]";
  v3 = 1024;
  v4 = 136;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The events and membership arrays have to be of the same size. (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
