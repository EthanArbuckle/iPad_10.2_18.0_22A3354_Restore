@implementation MOEventPatternDetectorTrendDetectorMannKendall

- (MOEventPatternDetectorTrendDetectorMannKendall)init
{
  MOEventPatternDetectorTrendDetectorMannKendall *v2;
  MOEventPatternDetectorTrendDetectorMannKendall *v3;
  MOEventPatternDetectorTrendDetectorMannKendall *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorTrendDetectorMannKendall;
  v2 = -[MOEventPatternDetectorTrendDetectorMannKendall init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_minimumFeatureNumberForTrend = 0;
    v2->_minimumValueOfFeatureMaximum = 0.0;
    v2->_minimumFeatureSlopeForTrend = 0.0;
    v4 = v2;
  }

  return v3;
}

- (id)extractTrendEventsFrom:(id)a3 withFeatures:(id)a4
{
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double *v34;
  double *v35;
  double *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  double *v42;
  uint64_t v43;
  double v44;
  double v45;
  int v46;
  double v47;
  id v48;
  id v49;
  uint64_t v50;
  double v51;
  void *i;
  id v53;
  double v54;
  double v55;
  MOEvent *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *j;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *k;
  void *v79;
  NSMutableDictionary *v80;
  void *v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id os_log;
  NSObject *v94;
  id v95;
  id v96;
  NSObject *v97;
  __int128 v99;
  MOPerformanceMeasurement *v100;
  NSMutableArray *v101;
  MOEvent *v102;
  void *v103;
  NSMutableDictionary *v104;
  id v105;
  void *v106;
  id v107;
  MOEventPatternDetectorTrendDetectorMannKendall *v108;
  void *context;
  id v110;
  NSMutableArray *v111;
  unint64_t v112;
  id obj;
  NSMutableArray *v114;
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
  void *__p;
  double *v128;
  double *v129;
  uint8_t buf[4];
  id v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];

  v110 = a3;
  v107 = a4;
  v108 = self;
  if (self->_minimumFeatureNumberForTrend)
  {
    v101 = objc_opt_new(NSMutableArray);
    v100 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("MOEventPatternDetectorTrendDetectorMannKendall"), 0);
    -[MOPerformanceMeasurement startSession](v100, "startSession");
    v112 = 0;
    *(_QWORD *)&v6 = 134217984;
    v99 = v6;
    while (1)
    {
      if ((unint64_t)objc_msgSend(v110, "count", v99) <= v112)
      {
        -[MOPerformanceMeasurement endSession](v100, "endSession");
        goto LABEL_91;
      }
      context = objc_autoreleasePoolPush();
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndex:", v112));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectAtIndex:", v112));
      v9 = objc_msgSend(v8, "count");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKeyPath:", CFSTR("@max.doubleValue")));
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      v13 = (double)(unint64_t)v9;
      if ((double)(unint64_t)v9 >= (double)v108->_minimumFeatureNumberForTrend
        && v12 >= v108->_minimumValueOfFeatureMaximum)
      {
        break;
      }
LABEL_86:

      objc_autoreleasePoolPop(context);
      ++v112;
    }
    __p = 0;
    v128 = 0;
    v129 = 0;
    v14 = v13 + -1.0;
    if (v13 + -1.0 <= 0.0)
    {
      v16 = 0;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 1;
      do
      {
        v18 = (double)((int)v15 + 1);
        if (v18 < v13)
        {
          v19 = v17;
          do
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v15));
            objc_msgSend(v20, "doubleValue");
            v22 = v21;

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v19));
            objc_msgSend(v23, "doubleValue");
            v25 = v24;

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v19));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
            objc_msgSend(v28, "timeIntervalSinceDate:", v29);
            v31 = v30;

            if (v25 - v22 > 0.0)
              ++v16;
            v32 = v25 - v22 < 0.0;
            v33 = (v25 - v22) / (v31 / 60.0 / 60.0 / 24.0);
            v34 = v128;
            if (v128 >= v129)
            {
              v36 = (double *)__p;
              v37 = ((char *)v128 - (_BYTE *)__p) >> 3;
              v38 = v37 + 1;
              if ((unint64_t)(v37 + 1) >> 61)
                std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
              v39 = (char *)v129 - (_BYTE *)__p;
              if (((char *)v129 - (_BYTE *)__p) >> 2 > v38)
                v38 = v39 >> 2;
              if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
                v40 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v40 = v38;
              if (v40)
              {
                v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v129, v40);
                v36 = (double *)__p;
                v34 = v128;
              }
              else
              {
                v41 = 0;
              }
              v42 = (double *)&v41[8 * v37];
              *v42 = v33;
              v35 = v42 + 1;
              while (v34 != v36)
              {
                v43 = *((_QWORD *)v34-- - 1);
                *((_QWORD *)v42-- - 1) = v43;
              }
              __p = v42;
              v128 = v35;
              v129 = (double *)&v41[8 * v40];
              if (v36)
                operator delete(v36);
            }
            else
            {
              *v128 = v33;
              v35 = v34 + 1;
            }
            v128 = v35;

            v16 -= v32;
            ++v19;
          }
          while ((double)(int)v19 < v13);
        }
        ++v17;
        ++v15;
      }
      while (v14 > v18);
    }
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventPatternDetectorTrendDetectorMannKendall medianOf:](MOEventPatternDetectorTrendDetectorMannKendall, "medianOf:", &__p));
    v105 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithArray:", v8);
    if ((double)(unint64_t)objc_msgSend(v105, "count") == v13)
    {
      v44 = (v13 * 2.0 + 5.0) * (v14 * v13);
      if (v16)
      {
LABEL_34:
        v45 = sqrt(v44 / 18.0);
        v46 = v16 - 1;
        if (v16 < 1)
          v46 = v16 + 1;
        v47 = (double)v46 / v45;
        goto LABEL_50;
      }
    }
    else
    {
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v48 = v105;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
      if (v49)
      {
        v50 = *(_QWORD *)v124;
        v51 = 0.0;
        do
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(_QWORD *)v124 != v50)
              objc_enumerationMutation(v48);
            v53 = objc_msgSend(v48, "countForObject:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i));
            if ((unint64_t)v53 >= 2)
              v51 = v51
                  + ((double)(unint64_t)v53 + -1.0)
                  * (double)(unint64_t)v53
                  * ((double)(unint64_t)v53 * 2.0 + 5.0);
          }
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
        }
        while (v49);
      }
      else
      {
        v51 = 0.0;
      }

      v44 = -(v51 - v14 * v13 * (v13 * 2.0 + 5.0));
      if (v16)
        goto LABEL_34;
    }
    v47 = 0.0;
LABEL_50:
    v54 = erfc(fabs(v47) * -0.707106781);
    if (v47 != 0.0 && v54 * -0.5 + 1.0 + v54 * -0.5 + 1.0 < 0.025)
    {
      objc_msgSend(v106, "doubleValue");
      if (fabs(v55) >= v108->_minimumFeatureSlopeForTrend)
      {
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", (char *)objc_msgSend(v7, "count") - 1));
        v56 = [MOEvent alloc];
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "startDate"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "endDate"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v102 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v56, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v57, v58, v59, v60, 5, objc_msgSend(v103, "category"));

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "endDate"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "dateByAddingTimeInterval:", 2419200.0));
        -[MOEvent setExpirationDate:](v102, "setExpirationDate:", v62);

        v114 = objc_opt_new(NSMutableArray);
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v63 = v7;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v119, v133, 16);
        if (v64)
        {
          v65 = *(_QWORD *)v120;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(_QWORD *)v120 != v65)
                objc_enumerationMutation(v63);
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1)
                                                                                 + 8 * (_QWORD)j), "eventIdentifier"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "UUIDString"));
              -[NSMutableArray addObject:](v114, "addObject:", v68);

            }
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v119, v133, 16);
          }
          while (v64);
        }

        v104 = objc_opt_new(NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", &off_1002DADD8, CFSTR("kEventPatternType"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v108->_trendFeatureType));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v69, CFSTR("kEventPatternTrendFeatureType"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v114, CFSTR("kEventPatternTrendEventIdentifierList"));
        objc_msgSend(v106, "doubleValue");
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v70, CFSTR("kEventPatternTrendSlope"));

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v71, CFSTR("kEventPatternTrendNumFeatures"));

        if (objc_msgSend(v103, "category") == (id)10)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "interactionScoredContact"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "contact"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v74, CFSTR("kEventPatternInteractionScoredContactIdentifier"));

        }
        if (objc_msgSend(v103, "category") == (id)2)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "workoutType"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v75, CFSTR("kEventPatternOverallWorkoutType"));

        }
        v111 = objc_opt_new(NSMutableArray);
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        obj = v63;
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
        if (v76)
        {
          v77 = *(_QWORD *)v116;
          do
          {
            for (k = 0; k != v76; k = (char *)k + 1)
            {
              if (*(_QWORD *)v116 != v77)
                objc_enumerationMutation(obj);
              v79 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)k);
              if (objc_msgSend(v79, "category") == (id)2)
              {
                v80 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "startDate"));
                if (v80)
                {
                  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "endDate"));
                  if (v81)
                  {
                    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "workoutType"));
                    if (v82)
                    {
                      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "identifierFromProvider"));
                      v84 = v83 == 0;

                      if (v84)
                        continue;
                      v80 = objc_opt_new(NSMutableDictionary);
                      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "identifierFromProvider"));
                      -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v85, CFSTR("kEventResourcePatternWorkoutIdentifierFromProvider"));

                      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "startDate"));
                      objc_msgSend(v86, "timeIntervalSince1970");
                      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                      -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v87, CFSTR("kEventResourcePatternWorkoutStartDate"));

                      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "endDate"));
                      objc_msgSend(v88, "timeIntervalSince1970");
                      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                      -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v89, CFSTR("kEventResourcePatternWorkoutEndDate"));

                      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "workoutEvent"));
                      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v90, "isIndoors")));
                      -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v91, CFSTR("kEventResourcePatternWorkoutIsIndoors"));

                      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "workoutType"));
                      -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v92, CFSTR("kEventResourcePatternWorkoutType"));

                      -[NSMutableArray addObject:](v111, "addObject:", v80);
                    }
                    else
                    {

                    }
                  }

                }
              }
            }
            v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
          }
          while (v76);
        }

        if (-[NSMutableArray count](v111, "count"))
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v111, CFSTR("kEventResourcePatternWorkoutInfoDictArray"));
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
          v94 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            v95 = -[NSMutableArray count](v111, "count");
            *(_DWORD *)buf = v99;
            v131 = v95;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "Mann Kendall identified %lu workouts", buf, 0xCu);
          }

        }
        -[MOEvent setPatterns:](v102, "setPatterns:", v104);
        -[NSMutableArray addObject:](v101, "addObject:", v102);

      }
    }

    if (__p)
    {
      v128 = (double *)__p;
      operator delete(__p);
    }
    goto LABEL_86;
  }
  v96 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v97 = objc_claimAutoreleasedReturnValue(v96);
  v100 = (MOPerformanceMeasurement *)v97;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    -[MOEventPatternDetectorTrendDetectorMannKendall extractTrendEventsFrom:withFeatures:].cold.1(v97);
  v101 = 0;
LABEL_91:

  return v101;
}

+ (id)medianOf:(void *)a3
{
  double v3;
  double *v5;
  double *v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  unint64_t v11;
  double *v12;
  char *v13;
  double *v15;
  double v16;
  uint64_t v17;
  double *v18;
  double v19;
  double v20;

  v5 = (double *)*((_QWORD *)a3 + 1);
  v6 = *(double **)a3;
  v7 = (uint64_t)v5 - *(_QWORD *)a3;
  v8 = v7 >> 3;
  if (!(v7 >> 3))
    return &off_1002DD148;
  if (v8 == 1)
  {
    v9 = *v6;
  }
  else
  {
    v11 = v8 >> 1;
    v12 = &v6[v8 >> 1];
    if (v12 == v5)
    {
      v13 = (char *)v5 - *(_QWORD *)a3;
    }
    else
    {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v6, v12, v5, v3);
      v6 = *(double **)a3;
      v13 = (char *)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3);
    }
    v9 = v6[v11];
    if ((v13 & 8) == 0)
    {
      if ((unint64_t)v7 >= 0x10 && v11 != 1)
      {
        v15 = v6 + 1;
        v16 = *v6;
        v17 = 8 * v11 - 8;
        v18 = v6 + 1;
        do
        {
          v19 = *v18++;
          v20 = v19;
          if (v16 < v19)
          {
            v16 = v20;
            v6 = v15;
          }
          v15 = v18;
          v17 -= 8;
        }
        while (v17);
      }
      v9 = (v9 + *v6) * 0.5;
    }
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
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
  double v12;
  id v13;
  void *v14;
  NSObject *v15;
  double v16;
  id v17;
  void *v18;
  NSObject *v19;
  double v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumFeatureNumberForTrend")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumFeatureNumberForTrend")));
      self->_minimumFeatureNumberForTrend = objc_msgSend(v7, "intValue");

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:].cold.1();

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumValueOfFeatureMaximum")));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumValueOfFeatureMaximum")));
      -[NSObject doubleValue](v11, "doubleValue");
      self->_minimumValueOfFeatureMaximum = v12;
    }
    else
    {
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:].cold.1();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumFeatureSlopeForTrend")));
    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumFeatureSlopeForTrend")));
      -[NSObject doubleValue](v15, "doubleValue");
      self->_minimumFeatureSlopeForTrend = v16;
    }
    else
    {
      v17 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v15 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:].cold.1();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumFeatureSlopeForTrend")));
    if (v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumFeatureSlopeForTrend")));
      -[NSObject doubleValue](v19, "doubleValue");
      self->_minimumFeatureSlopeForTrend = v20;
    }
    else
    {
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v19 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:].cold.1();
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("TrendFeatureType")));
    if (v22)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrendFeatureType")));
      self->_trendFeatureType = (int)-[NSObject intValue](v23, "intValue");
    }
    else
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v23 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:].cold.1();
    }

  }
  return v5 != 0;
}

- (void)extractTrendEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Mann Kendall configuration not set", v1, 2u);
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
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for Mann Kendall Trend: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
