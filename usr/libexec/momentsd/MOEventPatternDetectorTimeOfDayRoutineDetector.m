@implementation MOEventPatternDetectorTimeOfDayRoutineDetector

- (MOEventPatternDetectorTimeOfDayRoutineDetector)init
{
  MOEventPatternDetectorTimeOfDayRoutineDetector *v2;
  MOEventPatternDetectorTimeOfDayRoutineDetector *v3;
  MOEventPatternDetectorTimeOfDayRoutineDetector *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MOEventPatternDetectorTimeOfDayRoutineDetector;
  v2 = -[MOEventPatternDetectorTimeOfDayRoutineDetector init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_routineConsistencyThreshold = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v2->_routineStdThreshold = _Q0;
    *(_OWORD *)&v2->_routineEnvelope = _Q0;
    v2->_routineDetectionSlidingWinStepSize = -1.0;
    v2->_maxNumDailyDetections = -1;
    *(_OWORD *)&v2->_lastWindowEnd = _Q0;
    v9 = v2;
  }

  return v3;
}

- (id)extractRoutineEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MOEvent *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MOEvent *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSMutableDictionary *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSMutableArray *v83;
  void *v84;
  void *v85;
  NSMutableDictionary *v86;
  MOEvent *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  MOEventPatternDetectorTimeOfDayRoutineDetector *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSMutableArray *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  id v107;
  _BYTE v108[128];
  _BYTE v109[128];

  v6 = a3;
  v7 = a4;
  if (self->_routineConsistencyThreshold == -1
    || self->_intraWeekFreqThreshold == -1
    || self->_routineDetectionSlidingWinSize == -1.0
    || self->_lastWindowEnd == -1.0
    || self->_lastWindowStartThreshold == -1.0
    || self->_maxNumDailyDetections == -1)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetectorTimeOfDayRoutineDetector extractRoutineEventsFrom:withFeatures:].cold.1(v9);

    v83 = 0;
  }
  else
  {
    v83 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v7, "count"))
    {
      v11 = 0;
      v12 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v92 = self;
      v76 = v7;
      v77 = v6;
      while (1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v11));
        v14 = objc_msgSend(v13, "mutableCopy");

        v78 = v11;
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v11));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "firstObject"));
        v82 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorTimeOfDayRoutineDetector _detectDailyRoutine:](self, "_detectDailyRoutine:", v14));
        if (objc_msgSend(v15, "count"))
          break;
LABEL_45:

        v11 = v78 + 1;
        v7 = v76;
        v6 = v77;
        if ((unint64_t)objc_msgSend(v76, "count") <= v78 + 1)
          goto LABEL_9;
      }
      v16 = 0;
      v79 = v15;
      while (1)
      {
        v91 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("habitualTime")));
        v90 = v17;
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("numHits")));
        v95 = v18;
        objc_msgSend(v18, "floatValue");
        v20 = self->_routineEnvelope + v19;
        objc_msgSend(v18, "floatValue");
        v22 = v21 - self->_routineEnvelope;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(hrFromMidnight >= %f) AND (hrFromMidnight < %f)"), v22, v20));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "filteredArrayUsingPredicate:", v23));

        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", CFSTR("eventIdentifier")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", CFSTR("weekOfYear")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self")));
        v88 = v25;
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKeyPath:", v26));

        v27 = [MOEvent alloc];
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[334], "UUID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", CFSTR("startDate")));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueForKey:", CFSTR("endDate")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v34 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v27, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v28, v30, v32, v33, 5, objc_msgSend(v80, "category"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2419200.0));
        v87 = v34;
        -[MOEvent setExpirationDate:](v34, "setExpirationDate:", v35);

        v36 = objc_opt_new(NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", &off_1002D82B8, CFSTR("kEventPatternType"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v92->_routineFeatureType));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, CFSTR("kEventPatternRoutineFeatureType"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v96, CFSTR("kEventPatternRoutineEventIdentifierList"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v95, CFSTR("kEventPatternRoutineTimeOfDay"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v94, CFSTR("kEventPatternRoutineNumHits"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", 0, CFSTR("kEventPatternRoutineDayOfWeek"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v93, CFSTR("kEventPatternRoutineDetectedWeeks"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventPatternDetectorTimeOfDayRoutineDetector _routineStartCheck:](v92, "_routineStartCheck:", v93)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v38, CFSTR("kEventPatternRoutineStartingRoutine"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", CFSTR("workoutType")));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v39));

        v89 = v24;
        v85 = v40;
        if (objc_msgSend(v40, "count") == (id)1)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "valueForKey:", CFSTR("workoutType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v42, CFSTR("kEventPatternOverallWorkoutType"));

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", CFSTR("multipleWorkoutType"), CFSTR("kEventPatternOverallWorkoutType"));
        }
        v43 = objc_opt_new(NSMutableArray);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v44 = v96;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v103;
          do
          {
            for (i = 0; i != v46; i = (char *)i + 1)
            {
              if (*(_QWORD *)v103 != v47)
                objc_enumerationMutation(v44);
              v49 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID")), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i));
              -[NSMutableArray addObject:](v43, "addObject:", v49);

            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
          }
          while (v46);
        }
        v86 = v36;
        v84 = v44;

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventIdentifier IN %@"), v43));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "filteredArrayUsingPredicate:", v50));

        v97 = objc_opt_new(NSMutableArray);
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v52 = v51;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
        if (v53)
          break;
LABEL_40:

        v15 = v79;
        if (-[NSMutableArray count](v97, "count"))
        {
          v73 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            v75 = -[NSMutableArray count](v97, "count");
            *(_DWORD *)buf = 134217984;
            v107 = v75;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Routine identified %lu workouts", buf, 0xCu);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v86, "setObject:forKeyedSubscript:", v97, CFSTR("kEventResourcePatternWorkoutInfoDictArray"));
        }
        -[MOEvent setPatterns:](v87, "setPatterns:", v86);
        -[NSMutableArray addObject:](v83, "addObject:", v87);

        v16 = v91 + 1;
        self = v92;
        v12 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        if ((unint64_t)objc_msgSend(v79, "count") <= v91 + 1)
          goto LABEL_45;
      }
      v54 = v53;
      v55 = *(_QWORD *)v99;
LABEL_27:
      v56 = 0;
      while (1)
      {
        if (*(_QWORD *)v99 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v56);
        if (objc_msgSend(v57, "category") != (id)2)
          goto LABEL_38;
        v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "startDate"));
        if (!v58)
          goto LABEL_38;
        v59 = (NSMutableDictionary *)v58;
        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "endDate"));
        if (!v60)
          goto LABEL_37;
        v61 = (void *)v60;
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "workoutType"));
        if (!v62)
          break;
        v63 = (void *)v62;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifierFromProvider"));

        if (v64)
        {
          v59 = objc_opt_new(NSMutableDictionary);
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifierFromProvider"));
          -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v65, CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider"));

          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "startDate"));
          objc_msgSend(v66, "timeIntervalSince1970");
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v67, CFSTR("kEventResourcePatternWorkoutStartDate"));

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "endDate"));
          objc_msgSend(v68, "timeIntervalSince1970");
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v69, CFSTR("kEventResourcePatternWorkoutEndDate"));

          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "workoutEvent"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v70, "isIndoors")));
          -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v71, CFSTR("kEventResourcePatternWorkoutIsIndoors"));

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "workoutType"));
          -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v72, CFSTR("kEventResourcePatternWorkoutType"));

          -[NSMutableArray addObject:](v97, "addObject:", v59);
LABEL_37:

        }
LABEL_38:
        if (v54 == (id)++v56)
        {
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
          if (!v54)
            goto LABEL_40;
          goto LABEL_27;
        }
      }

      goto LABEL_37;
    }
  }
LABEL_9:

  return v83;
}

- (BOOL)_routineStartCheck:(id)a3
{
  id v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  *(float *)&v6 = (float)(uint64_t)objc_msgSend(v4, "component:fromDate:", 0x2000, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));

  v8 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v8, "addObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") - 1));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  LOBYTE(v3) = objc_msgSend(v10, "isEqualToSet:", v11);
  return (char)v3;
}

- (id)_findHabitualTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("hrFromMidnight")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v5));
  v31 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("average:"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expressionValueWithObject:context:", 0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v5));
  v30 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("stddev:"), v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "expressionValueWithObject:context:", 0, 0));
  objc_msgSend(v13, "floatValue");
  if (self->_routineStdThreshold >= v14)
  {
    v24 = v9;
  }
  else
  {
    objc_msgSend(v13, "floatValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_routineStdFilterMultiplier * v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(abs(hrFromMidnight-%@) < %@)"), v9, v27));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v16));

    v28 = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("hrFromMidnight")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v17));
    v29 = v18;
    v19 = v5;
    v20 = v9;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForFunction:arguments:](NSExpression, "expressionForFunction:arguments:", CFSTR("average:"), v22));

    v8 = v21;
    v9 = v20;
    v5 = v19;

    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "expressionValueWithObject:context:", 0, 0));
    v4 = v28;

  }
  return v24;
}

- (id)_dailyRoutineCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("weekOfYear")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self")));
  v20 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", v6));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(weekOfYear == %@)"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i)));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("weekday")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKeyPath:", v16));

        if ((unint64_t)objc_msgSend(v17, "count") >= self->_intraWeekFreqThreshold)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue") + 1));

          v10 = (void *)v18;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_detectDailyRoutine:(id)a3
{
  _UNKNOWN **v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  double v11;
  double lastWindowStartThreshold;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  float v24;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  uint64_t v34;
  void *v35;
  float v36;
  void *v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  void *v47;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];

  v51 = a3;
  v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_routineDetectionSlidingWinSize));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v5, "floatValue");
  if (self->_lastWindowEnd > v6)
  {
    do
    {
      v7 = v4[317];
      objc_msgSend(v5, "floatValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "numberWithDouble:", v8 - self->_routineDetectionSlidingWinSize));
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      lastWindowStartThreshold = self->_lastWindowStartThreshold;
      if (lastWindowStartThreshold <= v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("habitualTime < %f"), *(_QWORD *)&self->_routineEnvelope));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "filteredArrayUsingPredicate:", v13));

        if (objc_msgSend(v14, "count"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("habitualTime")));
          objc_msgSend(v16, "floatValue");
          v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17 - self->_routineEnvelope + 24.0));

          v5 = v15;
          v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        }
        else
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4[317], "numberWithDouble:", self->_lastWindowEnd));
        }

        v5 = (void *)v18;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(hrFromMidnight >= %@) AND (hrFromMidnight < %@)"), v9, v5));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "filteredArrayUsingPredicate:", v19));

      if (objc_msgSend(v20, "count"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorTimeOfDayRoutineDetector _findHabitualTime:](self, "_findHabitualTime:", v20));
        objc_msgSend(v21, "floatValue");
        v23 = v22;
        objc_msgSend(v5, "floatValue");
        if (v24 - self->_routineDetectionSlidingWinStepSize < v23 && lastWindowStartThreshold > v11)
        {
          v37 = v4[317];
          objc_msgSend(v21, "floatValue");
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "numberWithDouble:", self->_routineDetectionSlidingWinSize
                                                                                       * 0.5 + v38));
          v31 = v5;
        }
        else
        {
          objc_msgSend(v21, "floatValue");
          v27 = self->_routineEnvelope + v26;
          objc_msgSend(v21, "floatValue");
          v29 = v28 - self->_routineEnvelope;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(hrFromMidnight >= %f) AND (hrFromMidnight < %f)"), v29, v27));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "filteredArrayUsingPredicate:", v30));

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorTimeOfDayRoutineDetector _dailyRoutineCheck:](self, "_dailyRoutineCheck:", v31));
          if ((int)objc_msgSend(v32, "intValue") >= self->_routineConsistencyThreshold)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueForKey:", CFSTR("weekday")));
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self")));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "valueForKeyPath:", v39));

            objc_msgSend(v21, "floatValue");
            v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_routineDetectionSlidingWinSize + v41 + self->_routineEnvelope * 2.0));

            v52[0] = CFSTR("habitualTime");
            v52[1] = CFSTR("numHits");
            v53[0] = v21;
            v42 = v40;
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "count")));
            v53[1] = v43;
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
            objc_msgSend(v50, "addObject:", v44);

            v5 = v49;
          }
          else
          {
            objc_msgSend(v5, "floatValue");
            v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_routineDetectionSlidingWinStepSize + v33));
          }

          v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        }

        v5 = (void *)v34;
      }
      else
      {
        v35 = v4[317];
        objc_msgSend(v5, "floatValue");
        v21 = v5;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "numberWithDouble:", self->_routineDetectionSlidingWinStepSize + v36));
      }

      objc_msgSend(v5, "floatValue");
    }
    while (self->_lastWindowEnd > v45 && lastWindowStartThreshold > v11);
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorTimeOfDayRoutineDetector _findTopNRoutines:withN:](self, "_findTopNRoutines:withN:", v50, self->_maxNumDailyDetections));

  return v47;
}

- (id)_findTopNRoutines:(id)a3 withN:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  void *v27;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("numHits"), 0));
  v27 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v5, "sortUsingDescriptors:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("numHits")));
  v24 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("habitualTime")));
  v10 = objc_msgSend(v8, "count");
  if ((unint64_t)v10 >= a4)
    v11 = a4;
  else
    v11 = (int64_t)v10;
  v23 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v11));
  v13 = objc_msgSend(v9, "count");
  if ((unint64_t)v13 >= a4)
    v14 = a4;
  else
    v14 = (int64_t)v13;
  v22 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 0, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v15, "count"))
  {
    v17 = 0;
    do
    {
      v25[0] = CFSTR("habitualTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v17));
      v25[1] = CFSTR("numHits");
      v26[0] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v17));
      v26[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
      objc_msgSend(v16, "addObject:", v20);

      ++v17;
    }
    while (v17 < (unint64_t)objc_msgSend(v15, "count"));
  }

  return v16;
}

- (BOOL)configure:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  double v15;
  id v16;
  void *v17;
  NSObject *v18;
  double v19;
  id v20;
  void *v21;
  NSObject *v22;
  double v23;
  id v24;
  void *v25;
  NSObject *v26;
  double v27;
  id v28;
  void *v29;
  NSObject *v30;
  double v31;
  id v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  double v38;
  id v39;
  void *v40;
  NSObject *v41;
  double v42;
  id v43;
  void *v44;
  NSObject *v45;
  id v46;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineConsistencyThreshold")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineConsistencyThreshold")));
      self->_routineConsistencyThreshold = objc_msgSend(v7, "intValue");

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("IntraWeekFreqThreshold")));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntraWeekFreqThreshold")));
      self->_intraWeekFreqThreshold = -[NSObject intValue](v11, "intValue");
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineStdThreshold")));
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineStdThreshold")));
      -[NSObject doubleValue](v14, "doubleValue");
      self->_routineStdThreshold = v15;
    }
    else
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineStdFilterMultiplier")));
    if (v17)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineStdFilterMultiplier")));
      -[NSObject doubleValue](v18, "doubleValue");
      self->_routineStdFilterMultiplier = v19;
    }
    else
    {
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineEnvelope")));
    if (v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineEnvelope")));
      -[NSObject doubleValue](v22, "doubleValue");
      self->_routineEnvelope = v23;
    }
    else
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v22 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineDetectionSlidingWinSize")));
    if (v25)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineDetectionSlidingWinSize")));
      -[NSObject doubleValue](v26, "doubleValue");
      self->_routineDetectionSlidingWinSize = v27;
    }
    else
    {
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v26 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineDetectionSlidingWinStepSize")));
    if (v29)
    {
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineDetectionSlidingWinStepSize")));
      -[NSObject doubleValue](v30, "doubleValue");
      self->_routineDetectionSlidingWinStepSize = v31;
    }
    else
    {
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v30 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MaxNumDailyDetections")));
    if (v33)
    {
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxNumDailyDetections")));
      self->_maxNumDailyDetections = -[NSObject intValue](v34, "intValue");
    }
    else
    {
      v35 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v34 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LastWindowEnd")));
    if (v36)
    {
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastWindowEnd")));
      -[NSObject doubleValue](v37, "doubleValue");
      self->_lastWindowEnd = v38;
    }
    else
    {
      v39 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v37 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LastWindowStartThreshold")));
    if (v40)
    {
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastWindowStartThreshold")));
      -[NSObject doubleValue](v41, "doubleValue");
      self->_lastWindowStartThreshold = v42;
    }
    else
    {
      v43 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v41 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RoutineFeatureType")));
    if (v44)
    {
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoutineFeatureType")));
      self->_routineFeatureType = (int)-[NSObject intValue](v45, "intValue");
    }
    else
    {
      v46 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v45 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:].cold.1();
    }

  }
  return v5 != 0;
}

- (void)extractRoutineEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Routine configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for routine detection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
