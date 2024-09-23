@implementation MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA

- (MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA)init
{
  char *v2;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v3;
  uint64_t v9;
  NSCalendar *cal;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA;
  v2 = -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA init](&v13, "init");
  v3 = (MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((_DWORD *)v2 + 6) = -1;
    *((_OWORD *)v2 + 2) = _Q0;
    *((_QWORD *)v2 + 6) = 0xBFF0000000000000;
    v9 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    cal = v3->_cal;
    v3->_cal = (NSCalendar *)v9;

    v11 = v3;
  }

  return v3;
}

- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6;
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t anomalyFeatureType;
  void *v48;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  unint64_t v52;
  int v53;
  uint64_t v54;
  NSMutableDictionary *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double maximumThreshold;
  double v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  unsigned int v82;
  double tukeyFactorForExponentialDistributionOutlier;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  id v98;
  id v99;
  id v100;
  NSObject *v101;
  _BYTE *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSMutableArray *v111;
  void *v112;
  void *v113;
  void *v114;
  uint8_t v115;
  _BYTE v116[7];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  if (self->_tukeyFactorForExponentialDistributionOutlier == -1.0
    || self->_minimumFeatureSizeForPersonalizedThreshold == -1.0
    || self->_minimumFeatureNumberForPersonalizedThreshold == -1
    || self->_maximumThreshold == -1.0
    || self->_minimumThreshold == -1.0
    || self->_betaForEWAUpdate == -1.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA extractAnomalyEventsFrom:withFeatures:].cold.1(v10, v11, v12);
    v13 = 0;
    goto LABEL_6;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:", 28, v10));
  objc_msgSend(v16, "setHour:", 3);
  v103 = v16;
  v104 = v15;
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateFromComponents:", v16));
  v111 = objc_opt_new(NSMutableArray);
  if (!objc_msgSend(v6, "count"))
  {
LABEL_78:
    v99 = -[NSMutableDictionary copy](self->_anomalyEWADictionariesForDetector, "copy");
    -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA setEWADict:](self, "setEWADict:", v99);

    v51 = v111;
    v13 = v111;
    goto LABEL_82;
  }
  v17 = 0;
  v102 = v116;
  v105 = v7;
  v106 = v8;
  while (1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v17));
    v110 = v17;
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v20 = objc_msgSend(v19, "category");

    v114 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v22 = v21;
    if (v20 == (id)2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workoutType"));
      v24 = 1;
      v25 = CFSTR("MOEventCategoryWorkout");
    }
    else
    {
      v26 = objc_msgSend(v21, "category");

      if (v26 == (id)16)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", objc_msgSend(v22, "motionType")));
        v24 = 1;
        v25 = CFSTR("MOEventCategoryMotionActivity");
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
        v28 = objc_msgSend(v27, "category");

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
        v22 = v29;
        if (v28 == (id)10)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "interactionScoredContact"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contact"));
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));

          v23 = (void *)v32;
          v24 = 1;
          v25 = CFSTR("MOEventCategorySignificantContact");
        }
        else
        {
          if (objc_msgSend(v29, "category") == (id)1 && self->_anomalyFeatureType == 4)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pCount"));
            v35 = objc_msgSend(v34, "intValue");

            if ((v35 & 0x80000000) == 0)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "startDate"));
              v8 = v106;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "components:fromDate:", 512, v37));

              v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v22, "weekday")));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringValue"));

              v24 = 1;
              v25 = CFSTR("MOEventCategoryProx");
              goto LABEL_33;
            }
          }
          else
          {

          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
          if (objc_msgSend(v39, "category") == (id)1 && self->_anomalyFeatureType == 4)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "densityScore"));
            objc_msgSend(v41, "doubleValue");
            v43 = v42;

            v8 = v106;
            if (v43 >= 0.0)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "components:fromDate:", 512, v45));

              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v22, "weekday")));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringValue"));

              v24 = 1;
              v25 = CFSTR("MOEventCategoryPeopleDensityEvent");
              goto LABEL_33;
            }
          }
          else
          {

            v8 = v106;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
          if (objc_msgSend(v22, "category") == (id)1)
          {
            anomalyFeatureType = self->_anomalyFeatureType;

            if (anomalyFeatureType != 5)
            {
              v23 = 0;
              v24 = 0;
              v25 = 0;
              v51 = v111;
              goto LABEL_34;
            }
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 512, v49));

            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v22, "weekday")));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringValue"));

            v24 = 1;
            v25 = CFSTR("MOEventTimeAtHomeAnomaly");
          }
          else
          {
            v23 = 0;
            v24 = 0;
            v25 = 0;
          }
        }
      }
    }
LABEL_33:
    v51 = v111;

LABEL_34:
    v52 = self->_anomalyFeatureType;
    if (v52 > 5)
      break;
    v53 = v23 ? v24 : 0;
    if (((0x37u >> v52) & 1) == 0 || !v53)
      break;
    v54 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v25, v23, off_1002AE3B8[v52], v102));
    v55 = objc_opt_new(NSMutableDictionary);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_anomalyEWADictionariesForDetector, "objectForKey:", v54));
    v108 = (void *)v54;
    v109 = v23;
    v107 = v56;
    if (v56)
    {
      v57 = (NSMutableDictionary *)objc_msgSend(v56, "mutableCopy");

      v55 = v57;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", &off_1002D80D8, CFSTR("EWAForAnomalyValue"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", &off_1002D80F0, CFSTR("EWAForAnomalyFeatureCountUntilMinimum"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("EWAForAnomalyFeatureCountMeetsMinimum"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", &off_1002D80F0, CFSTR("EWAForAnomalyLastUpdateTime"));
    }
    v58 = v112;
    if (objc_msgSend(v112, "count"))
    {
      v59 = 0;
      while (1)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectAtIndex:", v59));
        if (objc_msgSend(v60, "category") != (id)10 && objc_msgSend(v60, "category") != (id)1)
          break;
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "endDate"));
        v62 = objc_msgSend(v61, "isOnOrBefore:", v113);

        if (v62)
          break;
LABEL_68:

        if ((unint64_t)objc_msgSend(v58, "count") <= ++v59)
          goto LABEL_73;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndex:", v59));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "startDate"));
      objc_msgSend(v64, "timeIntervalSinceReferenceDate");
      v66 = v65;

      maximumThreshold = self->_maximumThreshold;
      if (!self->_anomalyFeatureType)
      {
        objc_msgSend(v63, "doubleValue");
        if (v68 == -1.0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
          objc_msgSend(v69, "doubleValue");
          if (v70 != 0.0)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
            objc_msgSend(v71, "doubleValue");
            v73 = v72;

            if (v66 <= v73)
            {
              v58 = v112;
              goto LABEL_55;
            }
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
            objc_msgSend(v69, "doubleValue");
            v75 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v66 - v74));

            v63 = (void *)v75;
            v58 = v112;
          }

        }
      }
LABEL_55:
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
      objc_msgSend(v76, "doubleValue");
      v78 = v77;

      if (v66 > v78)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyValue")));
        objc_msgSend(v79, "doubleValue");
        if (v80 <= -1.0)
        {

        }
        else
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyFeatureCountMeetsMinimum")));
          v82 = objc_msgSend(v81, "BOOLValue");

          if (v82)
          {
            tukeyFactorForExponentialDistributionOutlier = self->_tukeyFactorForExponentialDistributionOutlier;
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyValue")));
            objc_msgSend(v84, "doubleValue");
            v86 = tukeyFactorForExponentialDistributionOutlier * v85;

            v87 = self->_maximumThreshold;
            if (v87 >= v86)
              v87 = v86;
            if (self->_minimumThreshold >= v87)
              maximumThreshold = self->_minimumThreshold;
            else
              maximumThreshold = v87;
          }
        }
        objc_msgSend(v63, "doubleValue");
        v58 = v112;
        if (v88 > maximumThreshold)
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA _createAnomalyEventFromEvent:andFeature:andThreshold:](self, "_createAnomalyEventFromEvent:andFeature:andThreshold:", v60, v63, maximumThreshold));
          -[NSMutableArray addObject:](v111, "addObject:", v89);

        }
      }
      if (!self->_anomalyFeatureType)
      {
        objc_msgSend(v63, "doubleValue");
        if (v90 == -1.0)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
          objc_msgSend(v91, "doubleValue");
          v93 = v92;

          if (v93 == 0.0)
          {
            v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA _createAnomalyEventFromEvent:andFeature:andThreshold:](self, "_createAnomalyEventFromEvent:andFeature:andThreshold:", v60, v63, maximumThreshold));
            -[NSMutableArray addObject:](v111, "addObject:", v94);

          }
        }
      }
      -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA _updateFeatureGroupEWADict:withCurrentFeature:andCurrentEvent:andCurrentEventTimeStamp:](self, "_updateFeatureGroupEWADict:withCurrentFeature:andCurrentEvent:andCurrentEventTimeStamp:", v55, v63, v60, v66);

      goto LABEL_68;
    }
LABEL_73:
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyValue")));
    objc_msgSend(v95, "doubleValue");
    v97 = v96;

    if (v97 > -1.0)
    {
      v98 = -[NSMutableDictionary copy](v55, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_anomalyEWADictionariesForDetector, "setObject:forKeyedSubscript:", v98, v108);

    }
    v17 = v110 + 1;
    v7 = v105;
    v8 = v106;
    if ((unint64_t)objc_msgSend(v6, "count") <= v110 + 1)
      goto LABEL_78;
  }
  v100 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v101 = objc_claimAutoreleasedReturnValue(v100);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA extractAnomalyEventsFrom:withFeatures:].cold.2(&v115, v102, v101);

  v13 = 0;
LABEL_82:

LABEL_6:
  return v13;
}

- (id)_createAnomalyEventFromEvent:(id)a3 andFeature:(id)a4 andThreshold:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSCalendar *cal;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  MOEvent *v18;
  void *v19;
  void *v20;
  MOEvent *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  if (objc_msgSend(v8, "timeAtHomeSubType") == (id)1)
  {
    cal = self->_cal;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](cal, "components:fromDate:", 28, v13));

    objc_msgSend(v14, "setHour:", 3);
    v15 = objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_cal, "dateFromComponents:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_cal, "dateFromComponents:", v14));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", 86400.0));

    v11 = (void *)v17;
    v10 = (void *)v15;
  }
  v18 = [MOEvent alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v21 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v18, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v19, v10, v11, v20, 5, objc_msgSend(v8, "category"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expirationDate"));
  -[MOEvent setExpirationDate:](v21, "setExpirationDate:", v22);

  if (objc_msgSend(v8, "timeAtHomeSubType") == (id)1 || objc_msgSend(v8, "timeAtHomeSubType") == (id)3)
    -[MOEvent setTimeAtHomeSubType:](v21, "setTimeAtHomeSubType:", objc_msgSend(v8, "timeAtHomeSubType"));
  v23 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", &off_1002D8108, CFSTR("kEventPatternType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_anomalyFeatureType));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, CFSTR("kEventPatternAnomalyFeatureType"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v26, CFSTR("kEventPatternAnomalousEventIdentifier"));

  objc_msgSend(v9, "doubleValue");
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v29, CFSTR("kEventPatternFeatureValue"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v30, CFSTR("kEventPatternThresholdValue"));

  if (objc_msgSend(v8, "category") == (id)10)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactionScoredContact"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contact"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v33, CFSTR("kEventPatternInteractionScoredContactIdentifier"));

  }
  if (objc_msgSend(v8, "category") == (id)2)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutType"));
    if (v34)
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutType"));
    else
      v35 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v36 = (void *)v35;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v35, CFSTR("kEventPatternAnomalyWorkoutType"));

  }
  if (objc_msgSend(v8, "category") == (id)16)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutType"));
    if (v37)
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutType"));
    else
      v38 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v39 = (void *)v38;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v38, CFSTR("kEventPatternAnomalyWorkoutType"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "motionType")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v40, CFSTR("kEventPatternAnomalyMotionType"));

  }
  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pCount"));
  if (v41)
  {
    v42 = (void *)v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pCount"));
    v44 = objc_msgSend(v43, "intValue");

    if ((v44 & 0x80000000) == 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pCount"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v45, CFSTR("kEventPatternAnomalyPcount"));

    }
  }
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "densityScore"));
  if (v46)
  {
    v47 = (void *)v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "densityScore"));
    v49 = objc_msgSend(v48, "intValue");

    if ((v49 & 0x80000000) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "densityScore"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v50, CFSTR("kEventPatternAnomalyDensityScore"));

    }
  }
  -[MOEvent setPatterns:](v21, "setPatterns:", v23);

  return v21;
}

- (void)_updateFeatureGroupEWADict:(id)a3 withCurrentFeature:(id)a4 andCurrentEvent:(id)a5 andCurrentEventTimeStamp:(double)a6
{
  id v10;
  id v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  long double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int minimumFeatureNumberForPersonalizedThreshold;
  void *v35;
  void *v36;
  void *v37;
  signed int v38;
  int v39;
  id v40;

  v40 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "doubleValue");
  if (v12 >= self->_minimumFeatureSizeForPersonalizedThreshold)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v15 < a6)
    {
      if (objc_msgSend(v11, "category") == (id)2
        || objc_msgSend(v11, "category") == (id)10
        || objc_msgSend(v11, "category") == (id)16)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v17, CFSTR("EWAEventUUID"));

      }
      if (objc_msgSend(v11, "category") == (id)2)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierFromProvider"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v18, CFSTR("EWAEventProviderUUID"));

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyValue")));
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 == -1.0)
      {
        objc_msgSend(v10, "doubleValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v22, CFSTR("EWAForAnomalyValue"));
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
        objc_msgSend(v23, "doubleValue");
        v25 = (a6 - v24) / 86400.0;

        v26 = pow(self->_betaForEWAUpdate, v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyValue")));
        objc_msgSend(v22, "doubleValue");
        v28 = v27;
        objc_msgSend(v10, "doubleValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (1.0 - v26) * v29 + v26 * v28));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v30, CFSTR("EWAForAnomalyValue"));

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, CFSTR("EWAForAnomalyLastUpdateTime"));

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyFeatureCountUntilMinimum")));
      LODWORD(v31) = objc_msgSend(v33, "intValue");
      minimumFeatureNumberForPersonalizedThreshold = self->_minimumFeatureNumberForPersonalizedThreshold;

      if ((int)v31 < minimumFeatureNumberForPersonalizedThreshold)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyFeatureCountUntilMinimum")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v35, "intValue") + 1));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v36, CFSTR("EWAForAnomalyFeatureCountUntilMinimum"));

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyFeatureCountUntilMinimum")));
      v38 = objc_msgSend(v37, "intValue");
      v39 = self->_minimumFeatureNumberForPersonalizedThreshold;

      if (v38 >= v39)
        objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("EWAForAnomalyFeatureCountMeetsMinimum"));
    }
  }

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
  double v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *anomalyEWADictionariesForDetector;
  NSDictionary *v36;
  NSDictionary *EWADict;
  id v38;

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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();

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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("BetaForEWAUpdate")));
    if (v26)
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BetaForEWAUpdate")));
      -[NSObject doubleValue](v27, "doubleValue");
      self->_betaForEWAUpdate = v28;
    }
    else
    {
      v29 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v27 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AnomalyFeatureType")));
    if (v30)
    {
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnomalyFeatureType")));
      self->_anomalyFeatureType = (int)-[NSObject intValue](v31, "intValue");
    }
    else
    {
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v31 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AnomalyEWADictionariesForDetector")));
    if (v33)
    {
      v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnomalyEWADictionariesForDetector")));
      anomalyEWADictionariesForDetector = self->_anomalyEWADictionariesForDetector;
      self->_anomalyEWADictionariesForDetector = v34;

      v36 = (NSDictionary *)-[NSMutableDictionary copy](self->_anomalyEWADictionariesForDetector, "copy");
      EWADict = self->_EWADict;
      self->_EWADict = v36;
    }
    else
    {
      v38 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      EWADict = (NSDictionary *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(&EWADict->super, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:].cold.1();
    }

  }
  return v5 != 0;
}

- (id)getAnomalyDetectorDict
{
  return self->_EWADict;
}

- (NSDictionary)EWADict
{
  return self->_EWADict;
}

- (void)setEWADict:(id)a3
{
  objc_storeStrong((id *)&self->_EWADict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EWADict, 0);
  objc_storeStrong((id *)&self->_cal, 0);
  objc_storeStrong((id *)&self->_anomalyEWADictionariesForDetector, 0);
}

- (void)extractAnomalyEventsFrom:(uint64_t)a3 withFeatures:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, a1, a3, "Exponential distribution with EWA configuration not set", v3);
}

- (void)extractAnomalyEventsFrom:(NSObject *)a3 withFeatures:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, a3, (uint64_t)a3, "All required keys for saving EWA are not present", a1);
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
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for exponential distribution with EWA: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
