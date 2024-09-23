@implementation MOPreOnboardedVisitAnnotationManager

- (MOPreOnboardedVisitAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  MOPreOnboardedVisitAnnotationManager *v5;
  void *v6;
  uint64_t v7;
  NSSet *lessInterestingPoiCategories;
  void *v9;
  uint64_t v10;
  NSSet *flightPoiCategories;
  void *v12;
  uint64_t v13;
  NSSet *outingEligiblePoiCategories;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  RTRoutineManager *routineManager;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  MOConfigurationManager *configurationManager;
  double v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  double v40;
  float v41;
  double v42;
  float v43;
  objc_super v45;
  _QWORD v46[18];
  _QWORD v47[3];
  _QWORD v48[5];

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MOPreOnboardedVisitAnnotationManager;
  v5 = -[MOTimeContextAnnotationManager initWithUniverse:](&v45, "initWithUniverse:", v4);
  if (v5)
  {
    v48[0] = GEOPOICategoryATM;
    v48[1] = GEOPOICategoryEVCharger;
    v48[2] = GEOPOICategoryParking;
    v48[3] = GEOPOICategoryPublicTransport;
    v48[4] = GEOPOICategoryRestroom;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 5));
    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    v47[0] = GEOPOICategoryAirport;
    v47[1] = GEOPOICategoryAirportGate;
    v47[2] = GEOPOICategoryAirportTerminal;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    flightPoiCategories = v5->_flightPoiCategories;
    v5->_flightPoiCategories = (NSSet *)v10;

    v46[0] = GEOPOICategoryAmusementPark;
    v46[1] = GEOPOICategoryAquarium;
    v46[2] = GEOPOICategoryBakery;
    v46[3] = GEOPOICategoryBeach;
    v46[4] = GEOPOICategoryBrewery;
    v46[5] = GEOPOICategoryCafe;
    v46[6] = GEOPOICategoryMarina;
    v46[7] = GEOPOICategoryMovieTheater;
    v46[8] = GEOPOICategoryMuseum;
    v46[9] = GEOPOICategoryNationalPark;
    v46[10] = GEOPOICategoryNightlife;
    v46[11] = GEOPOICategoryPark;
    v46[12] = GEOPOICategoryPlayground;
    v46[13] = GEOPOICategoryRestaurant;
    v46[14] = GEOPOICategoryStadium;
    v46[15] = GEOPOICategoryTheater;
    v46[16] = GEOPOICategoryWinery;
    v46[17] = GEOPOICategoryZoo;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 18));
    v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
    outingEligiblePoiCategories = v5->_outingEligiblePoiCategories;
    v5->_outingEligiblePoiCategories = (NSSet *)v13;

    v16 = (objc_class *)objc_opt_class(MORoutineServiceManager, v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v18));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routineManager"));
    routineManager = v5->_routineManager;
    v5->_routineManager = (RTRoutineManager *)v20;

    v23 = (objc_class *)objc_opt_class(MOConfigurationManager, v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v25));
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v26;

    HIDWORD(v28) = 1072483532;
    *(float *)&v28 = 0.9;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelMediumConfidenceThreshold"), v28);
    v5->_visitLabelMediumConfidenceThreshold = v29;
    HIDWORD(v30) = 1072588390;
    *(float *)&v30 = 0.95;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelHighConfidenceThreshold"), v30);
    v5->_visitLabelHighConfidenceThreshold = v31;
    HIDWORD(v32) = 1071644672;
    *(float *)&v32 = 0.5;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AOIVisitLabelConfidentThreshold"), v32);
    v34 = v33;
    v5->_aoiVisitLabelConfidentThreshold = v34;
    LODWORD(v34) = 1133903872;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventInterval"), v34);
    v36 = v35;
    v5->_timeIntervalThresholdDefault = v36;
    LODWORD(v36) = 1109393408;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventMaximumDistanceKeyword"), v36);
    v38 = v37;
    v5->_distanceThresholdDefault = v38;
    LODWORD(v38) = 1163984896;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventWithTheSamePlaceNameInterval"), v38);
    v40 = v39;
    v5->_timeIntervalThresholdWithSamePlaceName = v40;
    LODWORD(v40) = -1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventWithTheSamePlaceNameMaximumDistance"), v40);
    v5->_distanceThresholdWithSamePlaceName = v41;
    HIDWORD(v42) = 1072483532;
    *(float *)&v42 = 0.9;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_RecommendedTabVisitFIThreshold"), v42);
    v5->_recommendedTabVisitFIThreshold = v43;

  }
  return v5;
}

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)groupBaseEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSObject *v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSMutableArray *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  id v47;
  NSMutableArray *v48;
  id os_log;
  NSObject *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  NSString *v60;
  void *v61;
  objc_class *v62;
  NSString *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v69;
  MOPreOnboardedVisitAnnotationManager *v70;
  NSMutableArray *v71;
  void *v72;
  uint64_t v73;
  id obj;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  double v89;
  __int16 v90;
  double v91;
  _BYTE v92[128];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v67 = &__NSArray0__struct;
    goto LABEL_49;
  }
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v69 = v4;
  obj = v4;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  v7 = 0;
  if (!v75)
    goto LABEL_45;
  v8 = *(_QWORD *)v77;
  v73 = *(_QWORD *)v77;
  v70 = self;
  v71 = v5;
  do
  {
    for (i = 0; i != v75; i = (char *)i + 1)
    {
      if (*(_QWORD *)v77 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v10, "placeUserType") == (id)1)
      {
        if (-[NSMutableArray count](v6, "count"))
        {
          v11 = -[NSMutableArray copy](v6, "copy");
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          v12 = objc_opt_new(NSMutableArray);
          v13 = v7;
          v6 = v12;
        }
        else
        {
          v13 = v7;
        }
        v7 = 0;
        goto LABEL_43;
      }
      if (v7)
      {
        -[MOPreOnboardedVisitAnnotationManager timeIntervalThresholdDefault](self, "timeIntervalThresholdDefault");
        v15 = v14;
        -[MOPreOnboardedVisitAnnotationManager distanceThresholdDefault](self, "distanceThresholdDefault");
        v17 = v16;
        v18 = objc_claimAutoreleasedReturnValue(-[NSObject placeName](v7, "placeName"));
        if (!v18)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeName"));
          if (!v72)
          {
            v72 = 0;
            goto LABEL_27;
          }
        }
        v19 = objc_claimAutoreleasedReturnValue(-[NSObject placeName](v7, "placeName"));
        if (v19)
        {
          v20 = (void *)v19;
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeName"));
          if (v21)
          {
            v22 = (void *)v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject placeName](v7, "placeName"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeName"));
            v25 = objc_msgSend(v23, "isEqualToString:", v24);

            if (v18)
            {

              self = v70;
              v5 = v71;
              if (!v25)
              {
LABEL_30:
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v7, "endDate"));
                objc_msgSend(v36, "timeIntervalSinceDate:", v37);
                v39 = v38;

                v40 = objc_claimAutoreleasedReturnValue(-[NSObject location](v7, "location"));
                v41 = 0.0;
                if (v40)
                {
                  v42 = (void *)v40;
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));

                  if (v43)
                  {
                    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject location](v7, "location"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "location"));
                    objc_msgSend(v44, "distanceFromLocation:", v45);
                    v41 = v46;

                  }
                }
                v8 = v73;
                if (v39 > v15 || v41 > v17)
                {
                  if (-[NSMutableArray count](v6, "count"))
                  {
                    v47 = -[NSMutableArray copy](v6, "copy");
                    -[NSMutableArray addObject:](v5, "addObject:", v47);

                    v48 = objc_opt_new(NSMutableArray);
                    v6 = v48;
                  }
                  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v50 = objc_claimAutoreleasedReturnValue(os_log);
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                  {
                    v59 = (objc_class *)objc_opt_class(self, v51);
                    v60 = NSStringFromClass(v59);
                    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
                    *(_DWORD *)buf = 138413314;
                    v81 = v61;
                    v82 = 2048;
                    v83 = v39;
                    v84 = 2048;
                    v85 = v41;
                    v86 = 2048;
                    v87 = v15;
                    v88 = 2048;
                    v89 = v17;
                    _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, new group (distance/interval check), interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x34u);

                  }
                }
                -[NSMutableArray addObject:](v6, "addObject:", v10);
                v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v53 = objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  v55 = (objc_class *)objc_opt_class(self, v54);
                  v56 = NSStringFromClass(v55);
                  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
                  *(_DWORD *)buf = 138413570;
                  v81 = v57;
                  v82 = 2112;
                  v83 = *(double *)&v58;
                  v84 = 2048;
                  v85 = v39;
                  v86 = 2048;
                  v87 = v41;
                  v88 = 2048;
                  v89 = v15;
                  v90 = 2048;
                  v91 = v17;
                  _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, add event, %@, interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x3Eu);

                }
                v13 = v7;
                v7 = v10;
                goto LABEL_43;
              }
            }
            else
            {

              self = v70;
              v5 = v71;
              if ((v25 & 1) == 0)
                goto LABEL_30;
            }
LABEL_27:
            -[MOPreOnboardedVisitAnnotationManager timeIntervalThresholdWithSamePlaceName](self, "timeIntervalThresholdWithSamePlaceName");
            v15 = v32;
            -[MOPreOnboardedVisitAnnotationManager distanceThresholdWithSamePlaceName](self, "distanceThresholdWithSamePlaceName");
            v17 = v33;
            v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v18 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v62 = (objc_class *)objc_opt_class(self, v35);
              v63 = NSStringFromClass(v62);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
              *(_DWORD *)buf = 138412546;
              v81 = v64;
              v82 = 2112;
              v83 = *(double *)&v65;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, the same place name, %@", buf, 0x16u);

            }
LABEL_29:

            goto LABEL_30;
          }

        }
        if (!v18)

        goto LABEL_29;
      }
      -[NSMutableArray addObject:](v6, "addObject:", v10);
      v7 = v10;
      v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v13 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class(self, v27);
        v29 = NSStringFromClass(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject eventIdentifier](v7, "eventIdentifier"));
        *(_DWORD *)buf = 138412546;
        v81 = v30;
        v82 = 2112;
        v83 = *(double *)&v31;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, add event, %@", buf, 0x16u);

      }
LABEL_43:

    }
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  }
  while (v75);
LABEL_45:

  if (-[NSMutableArray count](v6, "count"))
  {
    v66 = -[NSMutableArray copy](v6, "copy");
    -[NSMutableArray addObject:](v5, "addObject:", v66);

  }
  v67 = -[NSMutableArray copy](v5, "copy");

  v4 = v69;
LABEL_49:

  return v67;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  return 0;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  MODaemonUniverse *v25;
  uint64_t v26;
  id os_log;
  NSObject *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  uint64_t v32;
  id v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  unint64_t v40;
  _BOOL4 v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _UNKNOWN **v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v67[7];
  objc_super v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  NSMutableArray *v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = [MOEventBundle alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v8, "initWithBundleIdentifier:creationDate:", v9, v10);

    -[MOEventBundle setInterfaceType:](v11, "setInterfaceType:", 2);
    -[MOEventBundle setBundleSuperType:](v11, "setBundleSuperType:", 1);
    -[MOEventBundle setBundleSubType:](v11, "setBundleSubType:", 106);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v13, v14));
    -[MOEventBundle setTime:](v11, "setTime:", v15);

    -[MOEventBundle setPropertiesBasedOnEvents](v11, "setPropertiesBasedOnEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
    -[MOEventBundle setStartDate:](v11, "setStartDate:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
    -[MOEventBundle setEndDate:](v11, "setEndDate:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOPreOnboardedVisitAnnotationManager resourcesFromBaseEvents:](self, "resourcesFromBaseEvents:", v6));
    -[MOEventBundle setResources:](v11, "setResources:", v20);

    v21 = objc_msgSend(v6, "copy");
    -[MOEventBundle setEvents:](v11, "setEvents:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOPreOnboardedVisitAnnotationManager actionFromBaseEvents:](self, "actionFromBaseEvents:", v6));
    -[MOEventBundle setAction:](v11, "setAction:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v11, "action"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOPreOnboardedVisitAnnotationManager placeFromBaseEvents:action:](self, "placeFromBaseEvents:action:", v6, v23));
    -[MOEventBundle setPlace:](v11, "setPlace:", v24);

    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__35;
    v83 = __Block_byref_object_dispose__35;
    v84 = objc_opt_new(NSMutableArray);
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__35;
    v73 = __Block_byref_object_dispose__35;
    v74 = objc_opt_new(NSMutableArray);
    v68.receiver = self;
    v68.super_class = (Class)MOPreOnboardedVisitAnnotationManager;
    v25 = -[MOAnnotationManager fUniverse](&v68, "fUniverse");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = __73__MOPreOnboardedVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
    v67[3] = &unk_1002AD9C0;
    v67[4] = &v79;
    v67[5] = &v75;
    v67[6] = &v69;
    +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v11, v26, v67);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v28 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class(self, v29);
      v31 = NSStringFromClass(v30);
      v26 = objc_claimAutoreleasedReturnValue(v31);
      v32 = v76[3];
      *(_DWORD *)buf = 138412546;
      v86 = v26;
      v87 = 2048;
      v88 = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@: visit, photoSource, %lu", buf, 0x16u);

    }
    -[MOEventBundle setResources:](v11, "setResources:", v80[5]);
    -[MOEventBundle setPhotoSource:](v11, "setPhotoSource:", v76[3]);
    v33 = objc_msgSend((id)v70[5], "copy");
    -[MOEventBundle setPhotoTraits:](v11, "setPhotoTraits:", v33);

    if (objc_msgSend((id)v80[5], "count"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
      objc_msgSend(v34, "placeNameConfidence");
      v26 = v35 < 0.0;

      if ((_DWORD)v26)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
        objc_msgSend(v36, "setPlaceNameConfidence:", 0.0);

      }
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
    v38 = objc_msgSend(v37, "placeUserType");
    if (v38 == (id)2
      || (v26 = objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place")),
          objc_msgSend((id)v26, "familiarityIndexLOI"),
          v39 > self->_recommendedTabVisitFIThreshold))
    {
      v40 = -[MOEventBundle photoSource](v11, "photoSource");
      if (v38 == (id)2)
      {
        v41 = v40 == 0;

        if (!v41)
          goto LABEL_16;
      }
      else
      {
        v42 = v40 == 0;

        if (!v42)
          goto LABEL_16;
      }
      -[MOEventBundle setSummarizationGranularity:](v11, "setSummarizationGranularity:", 1);
    }
    else
    {

    }
LABEL_16:
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
    objc_msgSend(v43, "distanceToHomeInMiles");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("DistanceToHome"), v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
    objc_msgSend(v45, "placeNameConfidence");
    if (v46 <= 0.95)
    {

    }
    else
    {
      v47 = nonInterestingPOIcategories;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "poiCategory"));
      LOBYTE(v47) = objc_msgSend((id)v47, "containsObject:", v49);

      if ((v47 & 1) != 0)
      {
        v50 = &off_1002DCEF8;
LABEL_23:
        -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v50);
LABEL_26:
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v57, "locationMode") == (id)2));
        -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("LocationModeTourist"), v58);

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v11, "endDate"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v11, "startDate"));
        objc_msgSend(v59, "timeIntervalSinceDate:", v60);
        v62 = v61;

        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v62));
        -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("VisitDuration"), v63);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
        objc_msgSend(v64, "familiarityIndexLOI");
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v65);

        +[MOPreOnboardedVisitAnnotationManager scoreVisitBundleAssets:](MOPreOnboardedVisitAnnotationManager, "scoreVisitBundleAssets:", v11);
        _Block_object_dispose(&v69, 8);

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);

        goto LABEL_27;
      }
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
    objc_msgSend(v51, "placeNameConfidence");
    if (v52 <= 0.95)
    {

    }
    else
    {
      v53 = (void *)interestingPOIcategories;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v11, "place"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "poiCategory"));
      LODWORD(v53) = objc_msgSend(v53, "containsObject:", v55);

      if ((_DWORD)v53)
      {
        v50 = &off_1002DCF08;
        goto LABEL_23;
      }
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[MOEventBundle addMetaDataForRankForKey:value:](v11, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v56);

    goto LABEL_26;
  }
  v11 = 0;
LABEL_27:

  return v11;
}

void __73__MOPreOnboardedVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

+ (void)scoreVisitBundleAssets:(id)a3
{
  id v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "type") == (id)2)
        {
          v13 = objc_msgSend(v12, "copy");
          -[NSMutableArray addObject:](v5, "addObject:", v13);

        }
        else if (objc_msgSend(v12, "type") == (id)6)
        {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    if (-[NSMutableArray count](v5, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
      objc_msgSend(v14, "setPriorityScore:", 100.0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      objc_msgSend(v15, "setPriorityScore:", 200.0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
      -[NSMutableArray addObject:](v4, "addObject:", v16);

      -[NSMutableArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", 0);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v5;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v26;
        do
        {
          v22 = 0;
          v23 = v20;
          do
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22), "setPriorityScore:", (double)((unint64_t)v22 + v23 + 300), (_QWORD)v25);
            v22 = (char *)v22 + 1;
          }
          while (v19 != v22);
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          v20 = v23 + (_DWORD)v22;
        }
        while (v19);
      }

      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v17);
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);
    }
    objc_msgSend(v3, "setResources:", v4, (_QWORD)v25);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v24, "setPriorityScore:", 100.0);

  }
}

- (id)actionFromBaseEvents:(id)a3
{
  id v3;
  MOAction *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[MOAction initWithActionName:actionType:]([MOAction alloc], "initWithActionName:actionType:", CFSTR("visit"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventIdentifier"));
  -[MOAction setSourceEventIdentifier:](v4, "setSourceEventIdentifier:", v6);

  return v4;
}

- (id)placeFromBaseEvents:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSSet *v9;
  NSSet *lessInterestingPoiCategories;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSSet *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSSet *outingEligiblePoiCategories;
  void *v32;
  id os_log;
  NSObject *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities majorityGroupFromEvents:propertyPath:valuePath:](MOContextAnnotationUtilities, "majorityGroupFromEvents:propertyPath:valuePath:", v6, CFSTR("placeName"), CFSTR("duration")));
  if (v7 && objc_msgSend(v7, "actionType") == (id)11)
    v9 = self->_flightPoiCategories;
  else
    v9 = 0;
  lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
  -[MOPreOnboardedVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold");
  v12 = v11;
  -[MOPreOnboardedVisitAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
  v14 = v13;
  -[MOPreOnboardedVisitAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v8, v9, lessInterestingPoiCategories, v17, v12, v14, v16));

  if (objc_msgSend(v18, "placeUserType") == (id)2 || objc_msgSend(v18, "placeUserType") == (id)1)
    objc_msgSend(v18, "setPlaceNameConfidence:", -1.0);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v20)
  {

LABEL_18:
    objc_msgSend(v18, "setPlaceNameConfidence:", -1.0);
    goto LABEL_19;
  }
  v21 = v20;
  v36 = v7;
  v22 = v9;
  v23 = v8;
  v24 = *(_QWORD *)v38;
  v25 = 0.0;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v24)
        objc_enumerationMutation(v19);
      v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
      objc_msgSend(v28, "timeIntervalSinceDate:", v29);
      v25 = v25 + v30;

    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v21);

  v8 = v23;
  v9 = v22;
  v7 = v36;
  if (v25 < 480.0)
    goto LABEL_18;
LABEL_19:
  if (!objc_msgSend(v18, "placeUserType"))
  {
    outingEligiblePoiCategories = self->_outingEligiblePoiCategories;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "poiCategory"));
    LODWORD(outingEligiblePoiCategories) = -[NSSet containsObject:](outingEligiblePoiCategories, "containsObject:", v32);

    if ((_DWORD)outingEligiblePoiCategories)
      objc_msgSend(v18, "setPlaceUserType:", 100);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v34 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[MOPreOnboardedVisitAnnotationManager placeFromBaseEvents:action:].cold.1((uint64_t)v18, v34);

  }
  return v18;
}

- (id)resourcesFromBaseEvents:(id)a3
{
  void **p_vtable;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  int *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id os_log;
  NSObject *v23;
  uint64_t v24;
  double v25;
  double v26;
  MOResource *v27;
  void *v28;
  void *v29;
  MOResource *v30;
  void *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v40;
  void *v41;
  NSMutableArray *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];

  p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities majorityGroupFromEvents:propertyPath:valuePath:](MOContextAnnotationUtilities, "majorityGroupFromEvents:propertyPath:valuePath:", a3, CFSTR("placeName"), CFSTR("duration")));
  v42 = objc_opt_new(NSMutableArray);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v45;
    v10 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
    *(_QWORD *)&v7 = 138412802;
    v40 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v11);
        v13 = *(uint64_t *)((char *)&self->super.super.super.isa + v10[916]);
        -[MOPreOnboardedVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold", v40);
        v15 = v14;
        -[MOPreOnboardedVisitAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
        v17 = v16;
        -[MOPreOnboardedVisitAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 82, "placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v12, 0, v13, v20, v15, v17, v19));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v23 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v32 = (objc_class *)objc_opt_class(self, v24);
          v33 = NSStringFromClass(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "placeName"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mask"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeMapItem"));
          v37 = objc_msgSend(v36, "length");
          *(_DWORD *)buf = v40;
          v49 = v34;
          v50 = 2112;
          v51 = v35;
          v52 = 2048;
          v53 = v37;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);

          v10 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
          p_vtable = (void **)(&OBJC_METACLASS___MOSignificantContactManager + 24);

        }
        if (objc_msgSend(v21, "placeType") == (id)3 && (objc_msgSend(v21, "placeNameConfidence"), v25 >= 0.9)
          || objc_msgSend(v21, "placeType") == (id)2 && (objc_msgSend(v21, "placeNameConfidence"), v26 >= 0.5))
        {
          v27 = [MOResource alloc];
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "placeName"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeMapItem"));
          v30 = -[MOResource initWithName:mapItemHandle:priorityScore:](v27, "initWithName:mapItemHandle:priorityScore:", v28, v29, -1.0);

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
          -[MOResource setSourceEventIdentifier:](v30, "setSourceEventIdentifier:", v31);

          v10 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
          -[NSMutableArray addObject:](v42, "addObject:", v30);

          p_vtable = (void **)(&OBJC_METACLASS___MOSignificantContactManager + 24);
        }

        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v8);
  }

  if (-[NSMutableArray count](v42, "count"))
    v38 = -[NSMutableArray copy](v42, "copy");
  else
    v38 = 0;

  return v38;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  NSMutableString *v32;
  id v33;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionName"));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions")),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("actionType"), 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v10));

    v13 = objc_msgSend(v12, "count");
    v14 = v13 != 0;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionName"));

      v5 = (__CFString *)v16;
    }

  }
  else
  {
    v14 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "placeName"));

    if (!v19)
    {
      v17 = 0;
      if (v14)
        goto LABEL_21;
      goto LABEL_11;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "promptDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v21));

  }
  if (v14)
    goto LABEL_21;
LABEL_11:
  if (!v17)
  {
    v31 = CFSTR("Outing");
LABEL_20:

    v5 = (__CFString *)v31;
    goto LABEL_21;
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  if (v22)
  {
    v23 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("actionType"), 3));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filteredArrayUsingPredicate:", v26));

      if (objc_msgSend(v28, "count"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "actionName"));

        v5 = (__CFString *)v30;
      }
      v31 = v5;

      v5 = (__CFString *)v26;
      goto LABEL_20;
    }
  }
LABEL_21:
  v32 = objc_opt_new(NSMutableString);
  -[NSMutableString appendString:](v32, "appendString:", v5);
  if (v17)
    -[NSMutableString appendString:](v32, "appendString:", v17);
  v33 = -[NSMutableString copy](v32, "copy");

  return v33;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (double)visitLabelMediumConfidenceThreshold
{
  return self->_visitLabelMediumConfidenceThreshold;
}

- (void)setVisitLabelMediumConfidenceThreshold:(double)a3
{
  self->_visitLabelMediumConfidenceThreshold = a3;
}

- (double)visitLabelHighConfidenceThreshold
{
  return self->_visitLabelHighConfidenceThreshold;
}

- (void)setVisitLabelHighConfidenceThreshold:(double)a3
{
  self->_visitLabelHighConfidenceThreshold = a3;
}

- (double)aoiVisitLabelConfidentThreshold
{
  return self->_aoiVisitLabelConfidentThreshold;
}

- (void)setAoiVisitLabelConfidentThreshold:(double)a3
{
  self->_aoiVisitLabelConfidentThreshold = a3;
}

- (double)timeIntervalThresholdDefault
{
  return self->_timeIntervalThresholdDefault;
}

- (void)setTimeIntervalThresholdDefault:(double)a3
{
  self->_timeIntervalThresholdDefault = a3;
}

- (double)distanceThresholdDefault
{
  return self->_distanceThresholdDefault;
}

- (void)setDistanceThresholdDefault:(double)a3
{
  self->_distanceThresholdDefault = a3;
}

- (double)timeIntervalThresholdWithSamePlaceName
{
  return self->_timeIntervalThresholdWithSamePlaceName;
}

- (void)setTimeIntervalThresholdWithSamePlaceName:(double)a3
{
  self->_timeIntervalThresholdWithSamePlaceName = a3;
}

- (double)distanceThresholdWithSamePlaceName
{
  return self->_distanceThresholdWithSamePlaceName;
}

- (void)setDistanceThresholdWithSamePlaceName:(double)a3
{
  self->_distanceThresholdWithSamePlaceName = a3;
}

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_outingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_flightPoiCategories, 0);
  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)placeFromBaseEvents:(uint64_t)a1 action:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "eventBundle place is an outing worth place, %@", (uint8_t *)&v2, 0xCu);
}

@end
