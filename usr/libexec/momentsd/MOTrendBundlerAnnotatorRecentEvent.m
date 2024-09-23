@implementation MOTrendBundlerAnnotatorRecentEvent

- (MOTrendBundlerAnnotatorRecentEvent)init
{
  MOTrendBundlerAnnotatorRecentEvent *v2;
  MOTrendBundlerAnnotatorRecentEvent *v3;
  MOTrendBundlerAnnotatorRecentEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerAnnotatorRecentEvent;
  v2 = -[MOTrendBundlerAnnotatorRecentEvent init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_maximumFeatureCountForFrequencyTrend = -1.0;
    v4 = v2;
  }

  return v3;
}

- (id)createTrendBundlesFrom:(id)a3 withEvents:(id)a4
{
  id v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  id os_log;
  NSObject *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSMutableArray *v43;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[8];
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v5 = a3;
  v46 = a4;
  v43 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v45 = v5;
    while (1)
    {
      v7 = objc_opt_new(NSMutableArray);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
      v48 = (void *)v8;
      v49 = v6;
      if (v8)
      {
        -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v8);
      }
      else
      {
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v10 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "trendEventArray is nil", buf, 2u);
        }

      }
      v11 = objc_opt_new(NSMutableArray);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v12 = v7;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v13)
        break;
LABEL_20:

      v27 = objc_opt_new(NSMutableArray);
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v28 = v11;
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v31)
              objc_enumerationMutation(v28);
            v33 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID")), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i));
            -[NSMutableArray addObject:](v27, "addObject:", v33);

          }
          v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v30);
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventIdentifier IN %@"), v27));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "filteredArrayUsingPredicate:"));
      v35 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
      v59 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sortedArrayUsingDescriptors:", v36));

      if (objc_msgSend(v37, "count"))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
        -[NSMutableArray addObject:](v12, "addObject:", v38);

        v39 = objc_claimAutoreleasedReturnValue(-[MOTrendBundlerAnnotatorRecentEvent _annotateEvents:withSourceEventForSet:](self, "_annotateEvents:withSourceEventForSet:", v12, v37));
        v40 = v48;
        if (v39)
          -[NSMutableArray addObject:](v43, "addObject:", v39);
      }
      else
      {
        v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v39 = objc_claimAutoreleasedReturnValue(v41);
        v40 = v48;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "No source events for trend or routine found", buf, 2u);
        }
      }

      v6 = v49 + 1;
      v5 = v45;
      if ((unint64_t)objc_msgSend(v45, "count") <= v49 + 1)
        goto LABEL_33;
    }
    v14 = v13;
    v15 = *(_QWORD *)v55;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "patterns"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
      v20 = objc_msgSend(v19, "intValue");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "patterns"));
      v22 = v21;
      if (v20 == 1)
        break;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
      v25 = objc_msgSend(v24, "intValue");

      if (v25 == 2)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "patterns"));
        v22 = v21;
        v23 = CFSTR("kEventPatternRoutineEventIdentifierList");
        goto LABEL_17;
      }
LABEL_18:
      if (v14 == (id)++v16)
      {
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        if (!v14)
          goto LABEL_20;
        goto LABEL_10;
      }
    }
    v23 = CFSTR("kEventPatternTrendEventIdentifierList");
LABEL_17:
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v23));
    -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v26);

    goto LABEL_18;
  }
LABEL_33:

  return v43;
}

- (id)_annotateEvents:(id)a3 withSourceEventForSet:(id)a4
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  MOEventBundle *v9;
  id v10;
  MOEventBundle *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _UNKNOWN **v29;
  MOEventBundle *v30;
  void *v31;
  id v32;
  MOAction *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double maximumFeatureCountForFrequencyTrend;
  MOEventBundle *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *j;
  void *v73;
  void *v74;
  NSMutableDictionary *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  MOResource *v81;
  void *v82;
  unsigned int v83;
  void *v84;
  MOAction *v85;
  void *v86;
  MOAction *v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  id v92;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  MOEventBundle *v99;
  uint64_t v100;
  NSMutableArray *v101;
  id v102;
  id obj;
  NSMutableArray *v104;
  void *v105;
  void *v106;
  void *v107;
  NSMutableArray *v108;
  id v109;
  void *v110;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t buf[4];
  const char *v129;
  __int16 v130;
  MOEventBundle *v131;
  __int16 v132;
  id v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  id v137;
  _BYTE v138[128];

  v5 = a3;
  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v129 = "-[MOTrendBundlerAnnotatorRecentEvent _annotateEvents:withSourceEventForSet:]";
    v130 = 2048;
    v131 = (MOEventBundle *)objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, event count, %lu", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v9 = [MOEventBundle alloc];
    v10 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v5);
    v11 = -[MOEventBundle initWithEventSet:filtered:](v9, "initWithEventSet:filtered:", v10, 0);

    -[MOEventBundle setInterfaceType:](v11, "setInterfaceType:", 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v13 = objc_msgSend(v12, "category");

    v99 = v11;
    if (v13 == (id)2)
    {
      -[MOEventBundle setBundleSuperType:](v11, "setBundleSuperType:", 2);
      -[MOEventBundle setBundleSubType:](v11, "setBundleSubType:", 203);
      v96 = v5;
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:"));
      if (objc_msgSend(v14, "count"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendBundlerAnnotatorRecentEvent _actionFromEvent:](self, "_actionFromEvent:", v15));
        -[MOEventBundle setAction:](v11, "setAction:", v16);

      }
      v110 = v14;
      v104 = objc_opt_new(NSMutableArray);
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.workoutType")));
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v125;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v125 != v19)
              objc_enumerationMutation(obj);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("workoutType"), *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i)));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v21));
            v23 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
            v137 = v23;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v137, 1));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingDescriptors:", v24));

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
            -[NSMutableArray addObject:](v104, "addObject:", v26);

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
        }
        while (v18);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v99, "resources"));
      v94 = v6;
      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v99, "resources"));
        v108 = (NSMutableArray *)objc_msgSend(v28, "mutableCopy");

        v29 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      }
      else
      {
        v29 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        v108 = objc_opt_new(NSMutableArray);
      }

      v58 = (void *)objc_opt_new(v29[310]);
      v59 = (void *)objc_opt_new(v29[310]);
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v39 = v110;
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v120, v136, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v121;
        v106 = v59;
        v107 = v58;
        v100 = *(_QWORD *)v121;
        v101 = v39;
        do
        {
          v63 = 0;
          v102 = v61;
          do
          {
            if (*(_QWORD *)v121 != v62)
              objc_enumerationMutation(v39);
            v64 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v63);
            if (objc_msgSend(v64, "category") == (id)2)
            {
              v105 = v63;
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "patterns"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", CFSTR("kEventResourcePatternWorkoutInfoDictArray")));

              v63 = v105;
              if (v66)
              {
                v118 = 0u;
                v119 = 0u;
                v116 = 0u;
                v117 = 0u;
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "patterns"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutInfoDictArray")));

                v109 = v68;
                v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v116, v135, 16);
                if (v69)
                {
                  v70 = v69;
                  v71 = *(_QWORD *)v117;
                  do
                  {
                    for (j = 0; j != v70; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v117 != v71)
                        objc_enumerationMutation(v109);
                      v73 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j);
                      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider")));
                      if (-[MOTrendBundlerAnnotatorRecentEvent _isStringUnique:inThis:](self, "_isStringUnique:inThis:", v74, v58))
                      {
                        objc_msgSend(v58, "addObject:", v74);
                        v75 = objc_opt_new(NSMutableDictionary);
                        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutStartDate")));
                        -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v76, CFSTR("MOWorkoutMetaDataKeyStartDate"));

                        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutEndDate")));
                        -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v77, CFSTR("MOWorkoutMetaDataKeyEndDate"));

                        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutType")));
                        -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v78, CFSTR("MOWorkoutMetaDataKeyActivityType"));

                        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutIsIndoors")));
                        if (v79)
                        {
                          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutIsIndoors")));
                          -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v80, CFSTR("MOWorkoutMetaDataKeyIsIndoors"));

                        }
                        else
                        {
                          -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("MOWorkoutMetaDataKeyIsIndoors"));
                        }
                        -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v74, CFSTR("MOWorkoutMetaDataKeyWorkoutID"));
                        v81 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Workout"), 10, v75, 0.0);
                        v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v75, "allKeys"));
                        v83 = objc_msgSend(v82, "containsObject:", CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider"));

                        if (v83)
                        {
                          v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider")));
                          -[MOResource setSourceEventIdentifier:](v81, "setSourceEventIdentifier:", v84);

                        }
                        -[NSMutableArray addObject:](v108, "addObject:", v81);
                        v85 = [MOAction alloc];
                        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutType")));
                        v87 = -[MOAction initWithActionName:actionType:](v85, "initWithActionName:actionType:", v86, 4);

                        v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider")));
                        -[MOAction setSourceEventIdentifier:](v87, "setSourceEventIdentifier:", v88);

                        v59 = v106;
                        objc_msgSend(v106, "addObject:", v87);

                        v58 = v107;
                      }

                    }
                    v70 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v116, v135, 16);
                  }
                  while (v70);
                }

                v62 = v100;
                v39 = v101;
                v61 = v102;
                v63 = v105;
              }
            }
            v63 = (char *)v63 + 1;
          }
          while (v63 != v61);
          v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v120, v136, 16);
        }
        while (v61);
      }

      -[MOTrendBundlerAnnotatorRecentEvent _assignResourcePriorityScore:](self, "_assignResourcePriorityScore:", v108);
      v57 = v99;
      -[MOEventBundle setResources:](v99, "setResources:", v108);
      if (objc_msgSend(v59, "count"))
        -[MOEventBundle setActions:](v99, "setActions:", v59);

      v6 = v94;
      v5 = v96;
      v40 = v104;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v32 = objc_msgSend(v31, "category");

      if (v32 != (id)10)
      {
        v30 = 0;
        v57 = v11;
LABEL_68:

        goto LABEL_69;
      }
      -[MOEventBundle setBundleSuperType:](v11, "setBundleSuperType:", 3);
      -[MOEventBundle setBundleSubType:](v11, "setBundleSubType:", 303);
      v33 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Conversations"), 1, 4);
      -[MOEventBundle setAction:](v11, "setAction:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "eventIdentifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v11, "action"));
      objc_msgSend(v36, "setSourceEventIdentifier:", v35);

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendBundlerAnnotatorRecentEvent _personsFromEvent:](self, "_personsFromEvent:", v37));
      -[MOEventBundle setPersons:](v11, "setPersons:", v38);

      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
      v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:"));
      if (!-[NSMutableArray count](v39, "count"))
      {
        v57 = v11;
LABEL_65:

        v89 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v90 = objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
          v92 = objc_msgSend(v91, "category");
          *(_DWORD *)buf = 136315650;
          v129 = "-[MOTrendBundlerAnnotatorRecentEvent _annotateEvents:withSourceEventForSet:]";
          v130 = 2112;
          v131 = v99;
          v132 = 2048;
          v133 = v92;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, %lu", buf, 0x20u);

          v57 = v99;
        }

        v30 = v57;
        goto LABEL_68;
      }
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v40 = v39;
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v112, v134, 16);
      if (v41)
      {
        v42 = v41;
        v95 = v6;
        v97 = v5;
        v43 = *(_QWORD *)v113;
        do
        {
          for (k = 0; k != v42; k = (char *)k + 1)
          {
            if (*(_QWORD *)v113 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)k);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "patterns"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
            v48 = objc_msgSend(v47, "intValue");

            if (v48 == 1)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "patterns"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType")));
              v51 = objc_msgSend(v50, "intValue");

              if (v51 == 2)
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "patterns"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendNumFeatures")));
                objc_msgSend(v53, "doubleValue");
                v55 = v54;
                maximumFeatureCountForFrequencyTrend = self->_maximumFeatureCountForFrequencyTrend;

                if (v55 > maximumFeatureCountForFrequencyTrend)
                  -[MOEventBundle setIsAggregatedAndSuppressed:](v99, "setIsAggregatedAndSuppressed:", 1);
              }
            }
          }
          v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v112, v134, 16);
        }
        while (v42);
        v39 = v40;
        v6 = v95;
        v5 = v97;
      }
      else
      {
        v39 = v40;
      }
      v57 = v99;
    }

    goto LABEL_65;
  }
  v30 = 0;
LABEL_69:

  return v30;
}

- (void)_assignResourcePriorityScore:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id os_log;
  NSObject *v15;
  id v16;
  id obj;
  uint64_t v18;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  NSMutableArray *v28;
  _BYTE v29[128];

  v3 = a3;
  v20 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = v4;
    v18 = *(_QWORD *)v22;
    v6 = 100;
    v7 = 200;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getDictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOWorkoutMetaDataKeyActivityType")));
        if (-[MOTrendBundlerAnnotatorRecentEvent _isStringUnique:inThis:](self, "_isStringUnique:inThis:", v12, v20))
        {
          -[NSMutableArray addObject:](v20, "addObject:", v12);
          v13 = v6++;
        }
        else
        {
          v13 = v7++;
        }
        objc_msgSend(v9, "setPriorityScore:", (double)v13);

        objc_autoreleasePoolPop(v10);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v5);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = -[NSMutableArray count](v20, "count");
    *(_DWORD *)buf = 134218242;
    v26 = v16;
    v27 = 2112;
    v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Found %lu unique workout types and they are %@", buf, 0x16u);
  }

}

- (id)_actionFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  MOAction *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "patterns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));

  v6 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v5, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));

  -[MOAction setSourceEventIdentifier:](v6, "setSourceEventIdentifier:", v7);
  return v6;
}

- (id)_personsFromEvent:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MOPerson *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  MOPerson *v16;
  void *v17;
  NSMutableArray *v18;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactionScoredContact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v7));

  if (v8)
  {
    v9 = [MOPerson alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "givenName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:](MOContactUtilities, "cNContactIdentifierFromPPContactIdentifier:", v13));
    objc_msgSend(v5, "score");
    v16 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](v9, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", 0, v11, v14, 0, 100.0, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    -[MOPerson setSourceEventIdentifier:](v16, "setSourceEventIdentifier:", v17);

    -[MOPerson setSourceEventAccessType:](v16, "setSourceEventAccessType:", 3);
    -[NSMutableArray addObject:](v4, "addObject:", v16);
    v18 = v4;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)configure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("maximumFeatureCountForFrequencyTrend")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumFeatureCountForFrequencyTrend")));
    objc_msgSend(v6, "doubleValue");
    self->_maximumFeatureCountForFrequencyTrend = v7;

  }
  return 1;
}

- (BOOL)_isStringUnique:(id)a3 inThis:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13) & 1) != 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

@end
