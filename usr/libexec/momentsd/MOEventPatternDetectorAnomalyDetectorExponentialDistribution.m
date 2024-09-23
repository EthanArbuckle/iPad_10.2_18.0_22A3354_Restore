@implementation MOEventPatternDetectorAnomalyDetectorExponentialDistribution

- (MOEventPatternDetectorAnomalyDetectorExponentialDistribution)init
{
  char *v2;
  MOEventPatternDetectorAnomalyDetectorExponentialDistribution *v3;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MOEventPatternDetectorAnomalyDetectorExponentialDistribution;
  v2 = -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution init](&v11, "init");
  v3 = (MOEventPatternDetectorAnomalyDetectorExponentialDistribution *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((_DWORD *)v2 + 6) = -1;
    *((_OWORD *)v2 + 2) = _Q0;
    v9 = v2;
  }

  return v3;
}

- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSMutableArray *v10;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double maximumThreshold;
  int v31;
  double v32;
  unint64_t v33;
  int v34;
  void *v35;
  void *v36;
  MOEvent *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  MOEvent *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableDictionary *v49;
  void *v50;
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
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  MOEventPatternDetectorAnomalyDetectorExponentialDistribution *v86;
  NSMutableArray *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;

  v6 = a3;
  v7 = a4;
  if (self->_tukeyFactorForExponentialDistributionOutlier == -1.0
    || self->_minimumFeatureSizeForPersonalizedThreshold == -1.0
    || self->_minimumFeatureNumberForPersonalizedThreshold == -1
    || self->_maximumThreshold == -1.0
    || self->_minimumThreshold == -1.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution extractAnomalyEventsFrom:withFeatures:].cold.1(v9);

    v10 = 0;
  }
  else
  {
    v87 = objc_opt_new(NSMutableArray);
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    v82 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:", 28, v12));
    objc_msgSend(v14, "setHour:", 3);
    v80 = v14;
    v81 = v13;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateFromComponents:", v14));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "dateByAddingTimeInterval:", -86400.0));
    if (objc_msgSend(v6, "count"))
    {
      v15 = 0;
      v84 = v6;
      v83 = v7;
      v86 = self;
      while (1)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15));
        v85 = v15;
        if (objc_msgSend(v17, "count"))
        {
          v18 = 0;
          v92 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0.0;
          do
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v18));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v18));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
            v25 = objc_msgSend(v24, "compare:", v94);

            if (v25 == (id)-1)
            {
              ++HIDWORD(v92);
              objc_msgSend(v23, "doubleValue");
              if (v26 >= self->_minimumFeatureSizeForPersonalizedThreshold)
              {
                if (!(_DWORD)v92)
                {
                  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));

                  v19 = (void *)v27;
                }
                objc_msgSend(v23, "doubleValue");
                v21 = v21 + v28;
                LODWORD(v92) = v92 + 1;
                v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));

                v20 = (void *)v29;
              }
            }

            ++v18;
          }
          while ((unint64_t)objc_msgSend(v17, "count") > v18);
        }
        else
        {
          v20 = 0;
          v19 = 0;
          v92 = 0;
          v21 = 0.0;
        }
        maximumThreshold = self->_maximumThreshold;
        v31 = v92;
        v89 = v19;
        v88 = v20;
        if ((int)v92 >= self->_minimumFeatureNumberForPersonalizedThreshold)
        {
          if (self->_anomalyFeatureType == 6)
            v31 = 3;
          LODWORD(v92) = v31;
          v32 = self->_tukeyFactorForExponentialDistributionOutlier * (v21 / (double)v31);
          if (maximumThreshold < v32)
            v32 = self->_maximumThreshold;
          if (self->_minimumThreshold >= v32)
            maximumThreshold = self->_minimumThreshold;
          else
            maximumThreshold = v32;
        }
        if (objc_msgSend(v16, "count"))
          break;
LABEL_67:

        v15 = v85 + 1;
        v6 = v84;
        v7 = v83;
        if ((unint64_t)objc_msgSend(v84, "count") <= v85 + 1)
          goto LABEL_68;
      }
      v33 = 0;
      v34 = 0;
      v93 = v16;
      while (1)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v33));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v33));
        v37 = (MOEvent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startDate"));
        if (-[MOEvent compare:](v37, "compare:", v94) != (id)1)
          goto LABEL_62;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startDate"));
        v39 = objc_msgSend(v38, "compare:", v91);

        if (v39 == (id)-1)
        {
          if (self->_anomalyFeatureType)
            goto LABEL_35;
          if (!(HIDWORD(v92) | v34) || (objc_msgSend(v36, "doubleValue"), v41 > maximumThreshold))
          {
LABEL_39:
            v90 = v34 + 1;
            v42 = [MOEvent alloc];
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startDate"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "endDate"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v37 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v42, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v43, v44, v45, v46, 5, objc_msgSend(v35, "category"));

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "endDate"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dateByAddingTimeInterval:", 2419200.0));
            -[MOEvent setExpirationDate:](v37, "setExpirationDate:", v48);

            if (objc_msgSend(v35, "timeAtHomeSubType"))
              -[MOEvent setTimeAtHomeSubType:](v37, "setTimeAtHomeSubType:", objc_msgSend(v35, "timeAtHomeSubType"));
            v49 = objc_opt_new(NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &off_1002D7B20, CFSTR("kEventPatternType"));
            self = v86;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v86->_anomalyFeatureType));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v50, CFSTR("kEventPatternAnomalyFeatureType"));

            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventIdentifier"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "UUIDString"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v52, CFSTR("kEventPatternAnomalousEventIdentifier"));

            objc_msgSend(v36, "doubleValue");
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v53, CFSTR("kEventPatternFeatureValue"));

            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", maximumThreshold));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v54, CFSTR("kEventPatternThresholdValue"));

            objc_msgSend(v89, "timeIntervalSinceReferenceDate");
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v55, CFSTR("kEventPatternThresholdRangeStartDate"));

            objc_msgSend(v88, "timeIntervalSinceReferenceDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v56, CFSTR("kEventPatternThresholdRangeEndDate"));

            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v92));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v57, CFSTR("kEventPatternThresholdNumFeatures"));

            if (objc_msgSend(v35, "category") == (id)2)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "workoutType"));
              if (v58)
                v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "workoutType"));
              else
                v59 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              v60 = (void *)v59;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v59, CFSTR("kEventPatternAnomalyWorkoutType"));

            }
            if (objc_msgSend(v35, "category") == (id)16)
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "workoutType"));
              if (v61)
                v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "workoutType"));
              else
                v62 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              v63 = (void *)v62;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v62, CFSTR("kEventPatternAnomalyWorkoutType"));

              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "motionType")));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v64, CFSTR("kEventPatternAnomalyMotionType"));

            }
            v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pCount"));
            if (v65)
            {
              v66 = (void *)v65;
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pCount"));
              v68 = objc_msgSend(v67, "intValue");

              if ((v68 & 0x80000000) == 0)
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pCount"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v69, CFSTR("kEventPatternAnomalyPcount"));

              }
            }
            v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "densityScore"));
            if (v70)
            {
              v71 = (void *)v70;
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "densityScore"));
              v73 = objc_msgSend(v72, "intValue");

              if ((v73 & 0x80000000) == 0)
              {
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "densityScore"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v74, CFSTR("kEventPatternAnomalyDensityScore"));

              }
            }
            if (objc_msgSend(v35, "category") == (id)10)
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "interactionScoredContact"));
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contact"));
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "identifier"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v77, CFSTR("kEventPatternInteractionScoredContactIdentifier"));

            }
            if (objc_msgSend(v35, "category") == (id)24)
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stateOfMindEvent"));
              objc_msgSend(v78, "valenceClassification");
              v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v79, CFSTR("kEventPatternAnomalyStateOfMind"));

            }
            -[MOEvent setPatterns:](v37, "setPatterns:", v49);
            -[NSMutableArray addObject:](v87, "addObject:", v37);

            v34 = v90;
LABEL_62:

            goto LABEL_63;
          }
          if (self->_anomalyFeatureType)
          {
LABEL_35:
            objc_msgSend(v36, "doubleValue");
            if (v40 > maximumThreshold)
              goto LABEL_39;
          }
          ++v34;
        }
LABEL_63:

        ++v33;
        v16 = v93;
        if ((unint64_t)objc_msgSend(v93, "count") <= v33)
          goto LABEL_67;
      }
    }
LABEL_68:

    v10 = v87;
  }

  return v10;
}

- (BOOL)configure:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id os_log;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  double v13;
  id v14;
  void *v15;
  NSObject *v16;
  double v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  double v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("TukeyFactorForExponentialDistributionOutlier")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TukeyFactorForExponentialDistributionOutlier")));
      objc_msgSend(v7, "doubleValue");
      self->_tukeyFactorForExponentialDistributionOutlier = v8;

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MaximumThreshold")));

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaximumThreshold")));
      -[NSObject doubleValue](v12, "doubleValue");
      self->_maximumThreshold = v13;
    }
    else
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v12 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumThreshold")));
    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumThreshold")));
      -[NSObject doubleValue](v16, "doubleValue");
      self->_minimumThreshold = v17;
    }
    else
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v16 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumFeatureNumberForPersonalizedThreshold")));
    if (v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumFeatureNumberForPersonalizedThreshold")));
      self->_minimumFeatureNumberForPersonalizedThreshold = -[NSObject intValue](v20, "intValue");
    }
    else
    {
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v20 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MinimumFeatureSizeForPersonalizedThreshold")));
    if (v22)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumFeatureSizeForPersonalizedThreshold")));
      -[NSObject doubleValue](v23, "doubleValue");
      self->_minimumFeatureSizeForPersonalizedThreshold = v24;
    }
    else
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AnomalyFeatureType")));
    if (v26)
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnomalyFeatureType")));
      self->_anomalyFeatureType = (int)-[NSObject intValue](v27, "intValue");
    }
    else
    {
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v27 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:].cold.1();
    }

  }
  return v5 != 0;
}

- (void)extractAnomalyEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Exponential distribution configuration not set", v1, 2u);
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
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for exponential distribution: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
