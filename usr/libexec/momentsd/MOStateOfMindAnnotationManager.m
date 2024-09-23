@implementation MOStateOfMindAnnotationManager

- (MOStateOfMindAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  MOStateOfMindAnnotationManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  MOConfigurationManager *configurationManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOStateOfMindAnnotationManager;
  v6 = -[MOTimeContextAnnotationManager initWithUniverse:](&v13, "initWithUniverse:", v4);
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

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)groupBaseEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  id v46;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v37 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v46 = v37;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v38 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 2));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v36 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOStateOfMindAnnotationManager _getTimeSpanOfMOEventArray:](self, "_getTimeSpanOfMOEventArray:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:", 28, v11));

    v32 = (void *)v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v12));
    v40 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0));
    v39 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
    v16 = objc_msgSend(v13, "compare:", v15);

    if (v16 == (id)-1)
    {
      do
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOStateOfMindAnnotationManager _getEventsOnDay:startTime:endTime:](self, "_getEventsOnDay:startTime:endTime:", v8, v13, v14));
        if (objc_msgSend(v19, "count"))
        {
          v20 = objc_msgSend(v19, "copy");
          -[NSMutableArray addObject:](v5, "addObject:", v20);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateByAddingUnit:value:toDate:options:", 16, 1, v14, 0));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));
        v22 = objc_msgSend(v17, "compare:", v21);

        v14 = v18;
        v13 = v17;
      }
      while (v22 == (id)-1);
    }
    else
    {
      v17 = v13;
      v18 = v14;
    }
    v34 = (void *)v8;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = v31;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v27), 0));
          v29 = objc_msgSend(v28, "copy");
          -[NSMutableArray addObject:](v5, "addObject:", v29);

          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v25);
    }

    v4 = v38;
  }
  else
  {
    v5 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v5;
}

- (id)_getTimeSpanOfMOEventArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  v8 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v5, v7);

  return v8;
}

- (id)_getEventsOnDay:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        if ((objc_msgSend(v16, "isAfterDate:", v8) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v18 = objc_msgSend(v17, "isBeforeDate:", v9);

          if (v18)
            -[NSMutableArray addObject:](v20, "addObject:", v15);
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v20;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id os_log;
  NSObject *v31;
  uint64_t v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  MOStateOfMindAnnotationManager *v43;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];

  v43 = self;
  v7 = a3;
  v44 = a4;
  v8 = a5;
  v50 = objc_opt_new(NSMutableArray);
  v47 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v42 = v7;
    obj = v7;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v48)
    {
      v46 = *(_QWORD *)v60;
      v9 = CFSTR("kEventPatternType");
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(obj);
          v49 = v10;
          v52 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v10);
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v54 = v47;
          v11 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v56;
            v51 = *(_QWORD *)v56;
            do
            {
              v14 = 0;
              v53 = v12;
              do
              {
                if (*(_QWORD *)v56 != v13)
                  objc_enumerationMutation(v54);
                v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "patterns", v42, v43));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v9));
                if (objc_msgSend(v17, "intValue"))
                {

                }
                else
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "eventIdentifier"));
                  v19 = v9;
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "patterns"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier")));
                  v23 = objc_msgSend(v20, "isEqualToString:", v22);

                  v9 = v19;
                  v13 = v51;

                  v12 = v53;
                  if (v23)
                    -[NSMutableArray addObject:](v50, "addObject:", v15);
                }
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v12);
          }

          v10 = v49 + 1;
        }
        while ((id)(v49 + 1) != v48);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v48);
    }

    v7 = v42;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject", v42));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfSocialContextEventWithStartDate:endData:", v25, v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "filteredArrayUsingPredicate:", v28));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v31 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v33 = (objc_class *)objc_opt_class(v43, v32);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = objc_msgSend(v29, "count");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));
    *(_DWORD *)buf = 138413058;
    v64 = v35;
    v65 = 2048;
    v66 = v36;
    v67 = 2112;
    v68 = v38;
    v69 = 2112;
    v70 = v40;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: filtered social context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

  }
  if (objc_msgSend(v29, "count"))
    -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v29);

  return v50;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6;
  id v7;
  MOEventBundle *v8;
  void *v9;
  void *v10;
  MOEventBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  MOAction *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSMutableArray *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  NSMutableDictionary *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  MOResource *v90;
  void *v91;
  id os_log;
  NSObject *v93;
  NSMutableArray *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSMutableArray *v100;
  void *v101;
  void *v102;
  id v103;
  NSMutableDictionary *v104;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = [MOEventBundle alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v8, "initWithBundleIdentifier:creationDate:", v9, v10);

    -[MOEventBundle setInterfaceType:](v11, "setInterfaceType:", 14);
    -[MOEventBundle setBundleSuperType:](v11, "setBundleSuperType:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
    objc_msgSend(v14, "reflectiveInterval");
    v16 = v15;

    if (v16 == 2.0)
    {
      -[MOEventBundle setBundleSubType:](v11, "setBundleSubType:", 801);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:", 28, v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateFromComponents:", v19));
      -[MOEventBundle setStartDate:](v11, "setStartDate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 16, 1, v20, 0));
      -[MOEventBundle setEndDate:](v11, "setEndDate:", v21);

    }
    else
    {
      -[MOEventBundle setBundleSubType:](v11, "setBundleSubType:", 802);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
      -[MOEventBundle setStartDate:](v11, "setStartDate:", v23);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v11, "startDate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 64, 1, v19, 0));
      -[MOEventBundle setEndDate:](v11, "setEndDate:", v20);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
    objc_msgSend(v24, "valenceClassification");
    v26 = v25;

    v102 = v13;
    if (v26 == 4.0)
    {
      v27 = 1;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
      objc_msgSend(v28, "valenceClassification");
      v30 = v29;

      if (v30 == 7.0)
      {
        v27 = 4;
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
        objc_msgSend(v31, "valenceClassification");
        v33 = v32;

        if (v33 == 6.0)
        {
          v27 = 3;
        }
        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
          objc_msgSend(v34, "valenceClassification");
          v36 = v35;

          if (v36 == 5.0)
          {
            v27 = 2;
          }
          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
            objc_msgSend(v37, "valenceClassification");
            v39 = v38;

            if (v39 == 1.0)
            {
              v27 = 7;
            }
            else
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
              objc_msgSend(v40, "valenceClassification");
              v42 = v41;

              if (v42 == 2.0)
              {
                v27 = 6;
              }
              else
              {
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateOfMindEvent"));
                objc_msgSend(v43, "valenceClassification");
                v45 = v44;

                if (v45 == 3.0)
                  v27 = 5;
                else
                  v27 = 0;
              }
            }
          }
        }
      }
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "appBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities bundleNameFromBundleId:](MOContextAnnotationUtilities, "bundleNameFromBundleId:", v47));

    v104 = objc_opt_new(NSMutableDictionary);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    LODWORD(v46) = objc_msgSend(v49, "fromFirstParty");

    if (!(_DWORD)v46 && v48)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v48, CFSTR("MediaActionMetaDataAppName"));
    v50 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:actionMetaData:", CFSTR("stateOfMind"), 12, v27, v104);
    -[MOEventBundle setAction:](v11, "setAction:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v11, "action"));
    objc_msgSend(v52, "setSourceEventIdentifier:", v51);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v54, v55));
    -[MOEventBundle setTime:](v11, "setTime:", v56);

    v57 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v6);
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:"));
    if (objc_msgSend(v58, "count"))
      -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v58);
    v100 = v57;
    v59 = -[NSMutableArray copy](v57, "copy");
    -[MOEventBundle setEvents:](v11, "setEvents:", v59);

    -[MOEventBundle setPropertiesBasedOnEvents](v11, "setPropertiesBasedOnEvents");
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v11, "resources"));
    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v11, "resources"));
      v95 = (NSMutableArray *)objc_msgSend(v61, "mutableCopy");

    }
    else
    {
      v95 = objc_opt_new(NSMutableArray);
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v63 = objc_msgSend(v62, "fromFirstParty");

    if (!v63 && v48)
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLoggedIn3pApp"), &__kCFBooleanTrue);
    v98 = v58;
    if (objc_msgSend(v48, "isEqual:", CFSTR("Journal")))
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLoggedInJournalApp"), &__kCFBooleanTrue);
    v64 = objc_opt_new(NSMutableDictionary);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v11, "startDate"));
    objc_msgSend(v65, "timeIntervalSince1970");
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v66, CFSTR("MOStateOfMindMetaDataKeyStartDate"));

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v11, "endDate"));
    objc_msgSend(v67, "timeIntervalSince1970");
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v68, CFSTR("MOStateOfMindMetaDataKeyEndDate"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "stateOfMindEvent"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "labels"));

    if (objc_msgSend(v71, "count"))
    {
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v71, CFSTR("MOStateOfMindMetaDataKeyLabel"));
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLabels"), v71);
    }
    v97 = v71;
    v101 = v48;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stateOfMindEvent"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "domains"));

    if (objc_msgSend(v74, "count"))
    {
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v74, CFSTR("MOStateOfMindMetaDataKeyDomain"));
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindDomains"), v74);
    }
    v96 = v74;
    v103 = v7;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stateOfMindEvent"));
    objc_msgSend(v76, "reflectiveInterval");
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    if (v77)
    {
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v77, CFSTR("MOStateOfMindMetaDataKeyReflectiveInterval"));
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindReflectiveInterval"), v77);
    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "stateOfMindEvent"));
    objc_msgSend(v79, "valence");
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    if (v80)
    {
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v80, CFSTR("MOStateOfMindMetaDataKeyValence"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v80, 0));
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValence"), v81);

    }
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "stateOfMindEvent"));
    objc_msgSend(v83, "valenceClassification");
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    if (v84)
    {
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v84, CFSTR("MOStateOfMindMetaDataKeyValenceClassification"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v80, 0));
      -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValenceClassification"), v85);

    }
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "identifierFromProvider"));

    if (v87)
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "identifierFromProvider"));
      -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v89, CFSTR("MOStateOfMindMetaDataKeyStateOfMindID"));

    }
    v90 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("StateOfMind"), 16, v64, 0.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
    -[MOResource setSourceEventIdentifier:](v90, "setSourceEventIdentifier:", v91);

    -[MOResource setSourceEventAccessType:](v90, "setSourceEventAccessType:", 8);
    -[MOResource setPriorityScore:](v90, "setPriorityScore:", 100.0);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v93 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "StateOfMind: Primary MOResource created for state of mind bundle", buf, 2u);
    }

    -[NSMutableArray addObject:](v95, "addObject:", v90);
    -[MOEventBundle setResources:](v11, "setResources:", v95);

    v7 = v103;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  return 0;
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

@end
