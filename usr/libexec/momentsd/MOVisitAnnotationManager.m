@implementation MOVisitAnnotationManager

- (MOVisitAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  MOVisitAnnotationManager *v5;
  void *v6;
  uint64_t v7;
  NSSet *lessInterestingPoiCategories;
  void *v9;
  uint64_t v10;
  NSSet *flightPoiCategories;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *outingEligiblePoiCategories;
  void *v21;
  uint64_t v22;
  NSSet *AOIGroupingEligiblePoiCategories;
  void *v24;
  uint64_t v25;
  NSSet *largeAOICategories;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  RTRoutineManager *routineManager;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  uint64_t v38;
  MOConfigurationManager *configurationManager;
  uint64_t v41;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[9];
  _QWORD v45[18];
  _QWORD v46[3];
  _QWORD v47[5];

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)MOVisitAnnotationManager;
  v5 = -[MOTimeContextAnnotationManager initWithUniverse:](&v42, "initWithUniverse:", v4);
  if (v5)
  {
    v47[0] = GEOPOICategoryATM;
    v47[1] = GEOPOICategoryEVCharger;
    v47[2] = GEOPOICategoryParking;
    v47[3] = GEOPOICategoryPublicTransport;
    v47[4] = GEOPOICategoryRestroom;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 5));
    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    v41 = GEOPOICategoryAirport;
    v46[0] = GEOPOICategoryAirport;
    v46[1] = GEOPOICategoryAirportGate;
    v46[2] = GEOPOICategoryAirportTerminal;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    flightPoiCategories = v5->_flightPoiCategories;
    v5->_flightPoiCategories = (NSSet *)v10;

    v12 = GEOPOICategoryAmusementPark;
    v13 = GEOPOICategoryAquarium;
    v45[0] = GEOPOICategoryAmusementPark;
    v45[1] = GEOPOICategoryAquarium;
    v14 = GEOPOICategoryBeach;
    v45[2] = GEOPOICategoryBakery;
    v45[3] = GEOPOICategoryBeach;
    v45[4] = GEOPOICategoryBrewery;
    v45[5] = GEOPOICategoryCafe;
    v45[6] = GEOPOICategoryMarina;
    v45[7] = GEOPOICategoryMovieTheater;
    v45[8] = GEOPOICategoryMuseum;
    v45[9] = GEOPOICategoryNationalPark;
    v15 = GEOPOICategoryPark;
    v45[10] = GEOPOICategoryNightlife;
    v45[11] = GEOPOICategoryPark;
    v45[12] = GEOPOICategoryPlayground;
    v45[13] = GEOPOICategoryRestaurant;
    v45[14] = GEOPOICategoryStadium;
    v45[15] = GEOPOICategoryTheater;
    v16 = GEOPOICategoryWinery;
    v17 = GEOPOICategoryZoo;
    v45[16] = GEOPOICategoryWinery;
    v45[17] = GEOPOICategoryZoo;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 18));
    v19 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));
    outingEligiblePoiCategories = v5->_outingEligiblePoiCategories;
    v5->_outingEligiblePoiCategories = (NSSet *)v19;

    v44[0] = v41;
    v44[1] = v12;
    v44[2] = v13;
    v44[3] = v14;
    v44[4] = GEOPOICategoryGolf;
    v44[5] = v15;
    v44[6] = GEOPOICategorySkiing;
    v44[7] = v16;
    v44[8] = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 9));
    v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
    AOIGroupingEligiblePoiCategories = v5->_AOIGroupingEligiblePoiCategories;
    v5->_AOIGroupingEligiblePoiCategories = (NSSet *)v22;

    v43 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
    v25 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v24));
    largeAOICategories = v5->_largeAOICategories;
    v5->_largeAOICategories = (NSSet *)v25;

    v28 = (objc_class *)objc_opt_class(MORoutineServiceManager, v27);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v30));

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "routineManager"));
    routineManager = v5->_routineManager;
    v5->_routineManager = (RTRoutineManager *)v32;

    v35 = (objc_class *)objc_opt_class(MOConfigurationManager, v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v37));
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v38;

    -[MOVisitAnnotationManager readParametersWithConfigurationManager:](v5, "readParametersWithConfigurationManager:", v5->_configurationManager);
  }

  return v5;
}

- (void)readParametersWithConfigurationManager:(id)a3
{
  id v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  float v33;

  v4 = a3;
  *(float *)&v5 = 0.9;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelMediumConfidenceThreshold"), v5);
  self->_visitLabelMediumConfidenceThreshold = v6;
  HIDWORD(v7) = 1072588390;
  *(float *)&v7 = 0.95;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelHighConfidenceThreshold"), v7);
  self->_visitLabelHighConfidenceThreshold = v8;
  HIDWORD(v9) = 1071644672;
  *(float *)&v9 = 0.5;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_AOIVisitLabelConfidentThreshold"), v9);
  v11 = v10;
  self->_aoiVisitLabelConfidentThreshold = v11;
  LODWORD(v11) = 1133903872;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventInterval"), v11);
  v13 = v12;
  self->_timeIntervalThresholdDefault = v13;
  LODWORD(v13) = 1109393408;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventMaximumDistanceKeyword"), v13);
  v15 = v14;
  self->_distanceThresholdDefault = v15;
  LODWORD(v15) = 1163984896;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventWithTheSamePlaceNameInterval"), v15);
  v17 = v16;
  self->_timeIntervalThresholdWithSamePlaceName = v17;
  LODWORD(v17) = -1.0;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_AdjacentVisitEventWithTheSamePlaceNameMaximumDistance"), v17);
  v19 = v18;
  self->_distanceThresholdWithSamePlaceName = v19;
  LODWORD(v19) = 1177075712;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_kMOCoarseGroupingTimeIntervalKeyword"), v19);
  v21 = v20;
  self->_timeIntervalThresholdForCoarseGroup = v21;
  LODWORD(v21) = 1161527296;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_kMOCoarseGroupingDistanceKeyword"), v21);
  v23 = v22;
  self->_distanceThresholdForCoarseGroup = v23;
  LODWORD(v23) = 1.5;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_kMOAOIRangeWeightKeyword"), v23);
  v25 = v24;
  self->_aoiRangeWeight = v25;
  LODWORD(v25) = 1142292480;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_kMOAOIMergingRangeMinimumThresholdKeyword"), v25);
  v27 = v26;
  self->_aoiMergingRangeMinimumThreshold = v27;
  LODWORD(v27) = 1150681088;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_kMOLargeAOIMergingRangeMinimumThresholdKeyword"), v27);
  self->_largeAoiMergingRangeMinimumThreshold = v28;
  HIDWORD(v29) = 1072483532;
  *(float *)&v29 = 0.9;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("VA_RecommendedTabVisitFIThreshold"), v29);
  v31 = v30;
  self->_recommendedTabVisitFIThreshold = v31;
  LODWORD(v31) = 1180762112;
  objc_msgSend(v4, "getFloatSettingForKey:withFallback:", CFSTR("EmotionAttachmentOutingBundleDurationThreshold"), v31);
  v33 = v32;

  self->_emotionAttachmentBundleDurationThreshold = v33;
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
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager preprocessEvents:](self, "preprocessEvents:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager postprocessGroupedEvents:](self, "postprocessGroupedEvents:", v5));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)preprocessEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  id os_log;
  NSObject *v49;
  uint64_t v50;
  NSMutableArray *v51;
  void *v52;
  NSMutableArray *v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  NSObject *v60;
  uint64_t v61;
  NSMutableArray *v62;
  objc_class *v64;
  NSString *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  NSMutableArray *v71;
  id obj;
  uint64_t v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  _BYTE v91[128];
  id v92;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v62 = (NSMutableArray *)&__NSArray0__struct;
    goto LABEL_41;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
  v7 = (objc_class *)objc_opt_class(MOTimeZoneManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v92 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
  -[MOVisitAnnotationManager printGroupedEvents:tag:](self, "printGroupedEvents:tag:", v11, CFSTR("input events"));

  v71 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_new(NSMutableArray);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v69 = v4;
  obj = v4;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
  v13 = 0;
  if (!v74)
    goto LABEL_35;
  v73 = *(_QWORD *)v76;
  v70 = v10;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v76 != v73)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v14);
      -[MOVisitAnnotationManager timeIntervalThresholdForCoarseGroup](self, "timeIntervalThresholdForCoarseGroup");
      v17 = v16;
      -[MOVisitAnnotationManager distanceThresholdForCoarseGroup](self, "distanceThresholdForCoarseGroup");
      v19 = v18;
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
      v21 = 0.0;
      v22 = 0.0;
      if (v20)
      {
        v23 = (void *)v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
          objc_msgSend(v25, "timeIntervalSinceDate:", v26);
          v22 = v27;

          if (v22 < 0.0)
            v22 = -v22;
        }
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "location"));
      if (!v29)
        goto LABEL_14;
      v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));

      if (v32)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "location"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineEvent"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "location"));
        objc_msgSend(v33, "distanceFromLocation:", v35);
        v21 = v36;

LABEL_14:
      }
      if (v22 > v17 || v21 > v19)
      {
        if (-[NSMutableArray count](v12, "count"))
          -[NSMutableArray addObject:](v71, "addObject:", v12);
        v51 = objc_opt_new(NSMutableArray);

        -[NSMutableArray addObject:](v51, "addObject:", v15);
        v41 = v13;
        v13 = v15;
        v12 = v51;
      }
      else
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        if (!v37)
          goto LABEL_23;
        v38 = (void *)v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));

        if (!v39 || !v10)
          goto LABEL_23;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZoneAtDate:", v40));

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZoneAtDate:", v42));

        v44 = objc_msgSend(v41, "secondsFromGMT");
        if (v44 == objc_msgSend(v43, "secondsFromGMT"))
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
          v47 = objc_msgSend(v45, "isSameDayWithDate:timeZone:", v46, v41);

          if ((v47 & 1) != 0)
          {

            v10 = v70;
LABEL_23:
            -[NSMutableArray addObject:](v12, "addObject:", v15);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v49 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              v54 = (objc_class *)objc_opt_class(self, v50);
              v55 = NSStringFromClass(v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventIdentifier"));
              *(_DWORD *)buf = 138413570;
              v80 = v56;
              v81 = 2112;
              v82 = v57;
              v83 = 2048;
              v84 = v22;
              v85 = 2048;
              v86 = v21;
              v87 = 2048;
              v88 = v17;
              v89 = 2048;
              v90 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%@: Coarse grouping the base events, add event, %@, interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x3Eu);

            }
            v41 = v13;
            v13 = v15;
            goto LABEL_29;
          }
        }
        if (-[NSMutableArray count](v12, "count"))
          -[NSMutableArray addObject:](v71, "addObject:", v12);
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v15));
        -[NSMutableArray addObject:](v71, "addObject:", v52);

        v53 = objc_opt_new(NSMutableArray);
        v13 = 0;
        v12 = v53;
        v10 = v70;
      }
LABEL_29:

      v14 = (char *)v14 + 1;
    }
    while (v74 != v14);
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    v74 = v58;
  }
  while (v58);
LABEL_35:

  if (-[NSMutableArray count](v12, "count"))
    -[NSMutableArray addObject:](v71, "addObject:", v12);
  v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    v64 = (objc_class *)objc_opt_class(self, v61);
    v65 = NSStringFromClass(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = objc_msgSend(obj, "count");
    v68 = -[NSMutableArray count](v71, "count");
    *(_DWORD *)buf = 138412802;
    v80 = v66;
    v81 = 2048;
    v82 = v67;
    v83 = 2048;
    v84 = *(double *)&v68;
    _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%@: preprocessEvents, input events, %lu, output groups, %lu", buf, 0x20u);

  }
  -[MOVisitAnnotationManager printGroupedEvents:tag:](self, "printGroupedEvents:tag:", v71, CFSTR("preprocessed events"));
  v62 = v71;

  v4 = v69;
LABEL_41:

  return v62;
}

- (void)printGroupedEvents:(id)a3 tag:(id)a4
{
  id v5;
  id os_log;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v5 = a3;
  v31 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MOVisitAnnotationManager printGroupedEvents:tag:].cold.1((uint64_t)v31, v5, v7);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v37;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v29 = v9;
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v25 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 138413058;
          v41 = v31;
          v42 = 2112;
          v43 = &stru_1002B68D0;
          v44 = 2048;
          v45 = v8;
          v46 = 2048;
          v47 = v25;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@: %@ group-%lu, count, %lu", buf, 0x2Au);
        }
        v30 = v8;

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v10;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v33;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17);
              v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v20 = objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routineEvent"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "placeName"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
                *(_DWORD *)buf = 138413314;
                v41 = v31;
                v42 = 2112;
                v43 = CFSTR("   ");
                v44 = 2112;
                v45 = (uint64_t)v22;
                v46 = 2112;
                v47 = v23;
                v48 = 2112;
                v49 = v24;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@: %@ placeName, %@, start, %@, end, %@, ", buf, 0x34u);

              }
              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
          }
          while (v15);
        }

        v8 = v30 + 1;
        v9 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    }
    while (v28);
  }

}

- (id)postprocessGroupedEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  id v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  id v28;
  id v29;
  const __CFString *v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  objc_class *v38;
  NSString *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  const __CFString *v61;
  _BYTE v62[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v43 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (!v7)
      goto LABEL_25;
    v8 = v7;
    v9 = *(_QWORD *)v51;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend(v11, "count", v43))
        {
          if (-[MOVisitAnnotationManager containTargetAOIInGroup:](self, "containTargetAOIInGroup:", v11))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager applyAOIBasedGroupingOnEvents:](self, "applyAOIBasedGroupingOnEvents:", v11));
            if (objc_msgSend(v12, "count"))
            {
              -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v14 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v16 = (objc_class *)objc_opt_class(self, v15);
                v17 = NSStringFromClass(v16);
                v48 = objc_claimAutoreleasedReturnValue(v17);
                v46 = objc_msgSend(v11, "count");
                v44 = objc_msgSend(v12, "count");
                v18 = objc_msgSend(v12, "count");
                v19 = objc_msgSend(v11, "count");
                *(_DWORD *)buf = 138413058;
                v20 = CFSTR("NO");
                if (v18 < v19)
                  v20 = CFSTR("YES");
                v21 = (void *)v48;
                v55 = v48;
                v56 = 2048;
                v57 = v46;
                v58 = 2048;
                v59 = v44;
                v60 = 2112;
                v61 = v20;
                v22 = v14;
                v23 = "%@: applyAOIBasedGroupingOnEvents: input events, %lu, output groups, %lu, isGrouped, %@";
                goto LABEL_23;
              }
              goto LABEL_16;
            }
          }
          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager applyNameBasedGroupingOnEvents:](self, "applyNameBasedGroupingOnEvents:", v11));
            if (objc_msgSend(v12, "count"))
            {
              -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);
              v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v14 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v26 = (objc_class *)objc_opt_class(self, v25);
                v27 = NSStringFromClass(v26);
                v49 = objc_claimAutoreleasedReturnValue(v27);
                v47 = objc_msgSend(v11, "count");
                v45 = objc_msgSend(v12, "count");
                v28 = objc_msgSend(v12, "count");
                v29 = objc_msgSend(v11, "count");
                *(_DWORD *)buf = 138413058;
                v30 = CFSTR("NO");
                if (v28 < v29)
                  v30 = CFSTR("YES");
                v21 = (void *)v49;
                v55 = v49;
                v56 = 2048;
                v57 = v47;
                v58 = 2048;
                v59 = v45;
                v60 = 2112;
                v61 = v30;
                v22 = v14;
                v23 = "%@: applyNameBasedGroupingOnEvents: input events, %lu, output groups, %lu, isGrouped, %@";
LABEL_23:
                _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, v23, buf, 0x2Au);

              }
LABEL_16:

            }
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v31 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      v8 = v31;
      if (!v31)
      {
LABEL_25:

        v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v38 = (objc_class *)objc_opt_class(self, v34);
          v39 = NSStringFromClass(v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          v41 = objc_msgSend(v6, "count");
          v42 = -[NSMutableArray count](v5, "count");
          *(_DWORD *)buf = 138412802;
          v55 = (uint64_t)v40;
          v56 = 2048;
          v57 = v41;
          v58 = 2048;
          v59 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%@: input groups, %lu, output groups, %lu", buf, 0x20u);

        }
        v4 = v43;
        goto LABEL_31;
      }
    }
  }
  v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    -[MOVisitAnnotationManager postprocessGroupedEvents:].cold.1((uint64_t)self, v4, v36);

  -[MOVisitAnnotationManager printGroupedEvents:tag:](self, "printGroupedEvents:tag:", v4, CFSTR("postprocessed events"));
  v5 = (NSMutableArray *)&__NSArray0__struct;
LABEL_31:

  return v5;
}

- (BOOL)isGroupingEligibleForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSet *AOIGroupingEligiblePoiCategories;
  void *v8;
  void *v9;
  unsigned int v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  objc_class *v20;
  NSString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeName"));

  if (!v6)
    goto LABEL_6;
  AOIGroupingEligiblePoiCategories = self->_AOIGroupingEligiblePoiCategories;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "poiCategory"));
  v10 = -[NSSet containsObject:](AOIGroupingEligiblePoiCategories, "containsObject:", v9);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class(self, v13);
    v21 = NSStringFromClass(v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mask"));
    if (v10)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v32 = v23;
    if (-[MOVisitAnnotationManager snapableEvent:](self, "snapableEvent:", v4))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent", v24));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "poiCategory"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapItemLocation"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mapItemLocation"));
    objc_msgSend(v29, "horizontalUncertainty");
    *(_DWORD *)buf = 138414082;
    v38 = v33;
    v39 = 2112;
    v40 = v22;
    v41 = 2112;
    v42 = v32;
    v43 = 2112;
    v44 = v31;
    v45 = 2112;
    v46 = v25;
    v47 = 2112;
    v48 = v27;
    v49 = 2048;
    v50 = v30;
    v51 = 2112;
    v52 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@: placeName, %@, isAOIGroupingEligible, %@, isSnappable, %@, category, %@, location, %@, mapItem.range, %f, event, %@", buf, 0x52u);

  }
  if (v10
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItemLocation")),
        objc_msgSend(v15, "horizontalUncertainty"),
        v17 = v16,
        v15,
        v14,
        v17 > 100.0))
  {
    v18 = 1;
  }
  else
  {
LABEL_6:
    v18 = 0;
  }

  return v18;
}

- (BOOL)containTargetAOIInGroup:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[MOVisitAnnotationManager isGroupingEligibleForEvent:](self, "isGroupingEligibleForEvent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)samePlaceCheckForEvent:(id)a3 otherEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  unsigned __int8 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  void *v62;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned __int8 v80;
  void *v81;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  if (!objc_msgSend(v7, "mapItemID"))
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  if (!objc_msgSend(v8, "mapItemID"))
  {

LABEL_6:
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  v10 = objc_msgSend(v9, "mapItemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  v12 = objc_msgSend(v11, "mapItemID");

  if (v10 == v12)
  {
LABEL_10:
    v24 = 1;
    goto LABEL_40;
  }
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "location"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "location"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "location"));
      objc_msgSend(v19, "distanceFromLocation:", v21);
      v23 = v22;

      if (v23 < 1.0)
        goto LABEL_10;
    }
  }
  else
  {

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "placeName"));
  if (v26)
  {
    v27 = (void *)v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "placeName"));
    if (v29)
    {
      v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "placeName"));
      v33 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "placeName"));
      v80 = objc_msgSend(v32, "isEqualToString:", v35);

      if ((v80 & 1) != 0)
      {
        v24 = 1;
        v6 = v33;
        goto LABEL_40;
      }
      goto LABEL_18;
    }

  }
  v33 = v6;

LABEL_18:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "geoAddressObject"));
  if (v37)
  {
    v6 = v33;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "routineEvent"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "geoAddressObject"));
    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "geoAddressObject"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "address"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "structuredAddress"));
      v79 = v5;
      v81 = v40;
      if (objc_msgSend(v43, "hasLocality"))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "geoAddressObject"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "address"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "structuredAddress"));
        if (objc_msgSend(v76, "hasThoroughfare"))
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "geoAddressObject"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "address"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "structuredAddress"));
          if (objc_msgSend(v72, "hasLocality"))
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "geoAddressObject"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "address"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "structuredAddress"));
            if (objc_msgSend(v68, "hasThoroughfare"))
            {
              v67 = v44;
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "routineEvent"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "geoAddressObject"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "address"));
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "structuredAddress"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "locality"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "geoAddressObject"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "address"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "structuredAddress"));
              v62 = v45;
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "locality"));
              if (objc_msgSend(v45, "isEqualToString:"))
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "routineEvent"));
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "geoAddressObject"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "address"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "structuredAddress"));
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "thoroughfare"));
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "geoAddressObject"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "address"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "structuredAddress"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "thoroughfare"));
                v24 = objc_msgSend(v50, "isEqualToString:", v46);

              }
              else
              {
                v24 = 0;
              }

              v44 = v67;
            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }

        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

      v5 = v79;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
    v6 = v33;
  }

LABEL_40:
  return v24;
}

- (BOOL)snapableEvent:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
  v7 = objc_msgSend(v6, "placeUserType");

  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
    if (objc_msgSend(v9, "placeType") == (id)4)
    {
      v8 = 1;
LABEL_17:

      goto LABEL_18;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
    if (objc_msgSend(v10, "placeType") == (id)5)
    {
      v8 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
    v12 = objc_msgSend(v11, "placeType");
    if (v12 == (id)3
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent")),
          objc_msgSend(v3, "placeNameConfidence"),
          v14 = v13,
          -[MOVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold"),
          v14 < v15))
    {
      v8 = 1;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      if (objc_msgSend(v16, "placeType") == (id)2)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
        objc_msgSend(v17, "placeNameConfidence");
        v19 = v18;
        -[MOVisitAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
        v8 = v19 < v20;

      }
      else
      {

        v8 = 0;
      }
      if (v12 != (id)3)
        goto LABEL_15;
    }

LABEL_15:
    goto LABEL_16;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSSet *largeAOICategories;
  void *v36;
  void *v37;
  double v38;
  id os_log;
  NSObject *v40;
  uint64_t v41;
  BOOL v42;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;

  v6 = a3;
  v7 = a4;
  if (-[MOVisitAnnotationManager samePlaceCheckForEvent:otherEvent:](self, "samePlaceCheckForEvent:otherEvent:", v6, v7))
  {
    goto LABEL_20;
  }
  if (-[MOVisitAnnotationManager snapableEvent:](self, "snapableEvent:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "location"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
        objc_msgSend(v14, "distanceFromLocation:", v16);
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapItemLocation"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "location"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mapItemLocation"));
          objc_msgSend(v22, "distanceFromLocation:", v24);
          v26 = v25;

          if (v18 >= v26)
            v18 = v26;
        }
LABEL_11:
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItemLocation"));
        objc_msgSend(v28, "horizontalUncertainty");
        v30 = v29;
        -[MOVisitAnnotationManager aoiRangeWeight](self, "aoiRangeWeight");
        v32 = v30 * v31;

        -[MOVisitAnnotationManager aoiMergingRangeMinimumThreshold](self, "aoiMergingRangeMinimumThreshold");
        if (v32 >= v33)
          v34 = v32;
        else
          v34 = v33;
        largeAOICategories = self->_largeAOICategories;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "poiCategory"));
        LODWORD(largeAOICategories) = -[NSSet containsObject:](largeAOICategories, "containsObject:", v37);

        if ((_DWORD)largeAOICategories)
        {
          -[MOVisitAnnotationManager largeAoiMergingRangeMinimumThreshold](self, "largeAoiMergingRangeMinimumThreshold");
          if (v34 < v38)
            v34 = v38;
        }
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v40 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v44 = (objc_class *)objc_opt_class(self, v41);
          v45 = NSStringFromClass(v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mapItemLocation"));
          objc_msgSend(v48, "horizontalUncertainty");
          v50 = v49;
          if (v18 >= v34)
            v51 = CFSTR("NO");
          else
            v51 = CFSTR("YES");
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "placeName"));
          v54 = 138413570;
          v55 = v46;
          v56 = 2048;
          v57 = v50;
          v58 = 2048;
          v59 = v18;
          v60 = 2048;
          v61 = v34;
          v62 = 2112;
          v63 = v51;
          v64 = 2112;
          v65 = v53;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%@: visit vs. landmark, landmark.size, %f, distance, %f, threshold, %f, results, %@, place name, %@", (uint8_t *)&v54, 0x3Eu);

        }
        if (v18 >= v34)
          goto LABEL_19;
LABEL_20:
        v42 = 1;
        goto LABEL_21;
      }
    }
    else
    {

    }
    v18 = 0.0;
    goto LABEL_11;
  }
LABEL_19:
  v42 = 0;
LABEL_21:

  return v42;
}

- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvents:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[MOVisitAnnotationManager likelySamePlaceCheckForEvent:otherEvent:](self, "likelySamePlaceCheckForEvent:otherEvent:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)transferPlaceForEvent:(id)a3 landmarkEvent:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v30 = (objc_class *)objc_opt_class(self, v10);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventIdentifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventIdentifier"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "placeName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mask"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mask"));
    *(_DWORD *)buf = 138413314;
    v42 = v32;
    v43 = 2112;
    v44 = v33;
    v45 = 2112;
    v46 = v34;
    v47 = 2112;
    v48 = v35;
    v49 = 2112;
    v50 = v38;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: merge (transfer) a visit (%@) to other (%@), %@ -> %@", buf, 0x34u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v13, "setPlaceName:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  objc_msgSend(v14, "placeNameConfidence");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v17, "setPlaceNameConfidence:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v19 = objc_msgSend(v18, "mapItemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v20, "setMapItemID:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mapItemLocation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v23, "setMapItemLocation:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v25 = objc_msgSend(v24, "mapItemPlaceType");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v26, "setMapItemPlaceType:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineEvent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "placeMapItem"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routineEvent"));
  objc_msgSend(v29, "setPlaceMapItem:", v28);

}

- (id)applyAOIBasedGroupingOnEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  id v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  NSMutableArray *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *j;
  void *v69;
  void *v70;
  id v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  objc_class *v75;
  NSString *v76;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  const char *v83;
  id os_log;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  objc_class *v90;
  NSString *v91;
  void *v92;
  void *v93;
  NSMutableArray *v94;
  void *v95;
  void *v96;
  NSObject *p_super;
  const char *v98;
  void *v99;
  id v100;
  id v101;
  NSObject *v102;
  uint64_t v103;
  objc_class *v104;
  NSString *v105;
  void *v106;
  void *v107;
  void *v108;
  NSMutableArray *v109;
  void *v110;
  NSObject *v111;
  const char *v112;
  void *v113;
  id v114;
  uint64_t v115;
  NSMutableArray *v116;
  NSMutableArray *v117;
  void *v118;
  id v119;
  uint64_t v120;
  void *v121;
  id v122;
  uint64_t v123;
  NSMutableArray *v124;
  NSMutableArray *v125;
  NSMutableArray *v126;
  objc_class *v127;
  NSString *v128;
  void *v129;
  NSMutableArray *v130;
  void *v131;
  void *v132;
  void *v133;
  objc_class *v134;
  NSString *v135;
  void *v136;
  void *v137;
  NSMutableArray *v138;
  void *v139;
  void *v140;
  objc_class *v141;
  NSString *v142;
  void *v143;
  void *v144;
  void *v145;
  NSMutableArray *v146;
  void *v147;
  objc_class *v148;
  NSString *v149;
  void *v150;
  NSMutableArray *v151;
  void *v152;
  void *v153;
  objc_class *v154;
  NSString *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  objc_class *v160;
  NSString *v161;
  objc_class *v162;
  NSString *v163;
  objc_class *v164;
  NSString *v165;
  id v166;
  NSMutableArray *v167;
  id v168;
  id v169;
  uint64_t v170;
  void *k;
  void *v172;
  NSMutableArray *v173;
  id v175;
  id v176;
  NSMutableArray *v177;
  uint64_t v178;
  uint64_t v179;
  NSMutableArray *v180;
  NSMutableArray *v181;
  NSMutableArray *log;
  MOVisitAnnotationManager *v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  uint64_t v201;
  _BYTE v202[128];
  _BYTE v203[128];
  uint64_t v204;
  uint8_t buf[4];
  void *v206;
  __int16 v207;
  void *v208;
  uint64_t v209;
  _BYTE v210[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v177 = objc_opt_new(NSMutableArray);
  v181 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v196, v210, 16);
  v175 = v7;
  if (!v8)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_85;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v178 = *(_QWORD *)v197;
  v180 = v5;
  v183 = self;
  do
  {
    v12 = 0;
    v176 = v9;
    do
    {
      if (*(_QWORD *)v197 != v178)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * v12);
      if (v10 == 2)
      {
        v179 = v12;
        v201 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v12);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v201, 1));
        v51 = -[MOVisitAnnotationManager containTargetAOIInGroup:](self, "containTargetAOIInGroup:", v50);

        if (v51)
        {
          -[NSMutableArray addObject:](v177, "addObject:", v13);
          if (-[MOVisitAnnotationManager samePlaceCheckForEvent:otherEvent:](self, "samePlaceCheckForEvent:otherEvent:", v11, v13))
          {
            v16 = v11;
          }
          else
          {
            v16 = v13;

          }
          -[NSMutableArray addObject:](v181, "addObject:", v13, v175);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v141 = (objc_class *)objc_opt_class(self, v85);
            v142 = NSStringFromClass(v141);
            v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
            v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "placeName"));
            v146 = v6;
            v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v143;
            v207 = 2112;
            v208 = v147;
            _os_log_debug_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

            v6 = v146;
          }
          v10 = 2;
          goto LABEL_71;
        }
        if (-[MOVisitAnnotationManager likelySamePlaceCheckForEvent:otherEvents:](self, "likelySamePlaceCheckForEvent:otherEvents:", v13, v181))
        {
          -[MOVisitAnnotationManager transferPlaceForEvent:landmarkEvent:](self, "transferPlaceForEvent:landmarkEvent:", v13, v11);
          -[NSMutableArray addObject:](v177, "addObject:", v13);
          v62 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v154 = (objc_class *)objc_opt_class(self, v63);
            v155 = NSStringFromClass(v154);
            v156 = (void *)objc_claimAutoreleasedReturnValue(v155);
            v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "placeName"));
            v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v156;
            v207 = 2112;
            v208 = v159;
            _os_log_debug_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Merging", buf, 0x16u);

          }
          v10 = 2;
          goto LABEL_68;
        }
        -[NSMutableArray addObject:](v5, "addObject:", v177);
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
        v100 = objc_msgSend(v99, "placeUserType");

        if (v100 == (id)1)
        {
          v101 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v102 = objc_claimAutoreleasedReturnValue(v101);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            v104 = (objc_class *)objc_opt_class(self, v103);
            v105 = NSStringFromClass(v104);
            v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
            v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "placeName"));
            v109 = v6;
            v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v106;
            v207 = 2112;
            v208 = v110;
            v111 = v102;
            v112 = "%@: drop, place name, %@, Reset";
            goto LABEL_81;
          }
        }
        else
        {
          v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));
          -[NSMutableArray addObject:](v5, "addObject:", v121);

          v122 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v102 = objc_claimAutoreleasedReturnValue(v122);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            v164 = (objc_class *)objc_opt_class(self, v123);
            v165 = NSStringFromClass(v164);
            v106 = (void *)objc_claimAutoreleasedReturnValue(v165);
            v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "placeName"));
            v109 = v6;
            v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v106;
            v207 = 2112;
            v208 = v110;
            v111 = v102;
            v112 = "%@: Merging, place name, %@, Reset";
LABEL_81:
            _os_log_debug_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEBUG, v112, buf, 0x16u);

            v6 = v109;
          }
        }

        v124 = objc_opt_new(NSMutableArray);
        v125 = objc_opt_new(NSMutableArray);
        v10 = 0;
        v16 = 0;
        v126 = v181;
        v181 = v125;
        log = v126;
        v177 = v124;
LABEL_71:
        v9 = v176;
        goto LABEL_72;
      }
      if (v10 == 1)
      {
        v179 = v12;
        v204 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v204, 1));
        v20 = -[MOVisitAnnotationManager containTargetAOIInGroup:](self, "containTargetAOIInGroup:", v19);

        if (v20)
        {
          v16 = v13;

          v21 = v181;
          -[NSMutableArray addObject:](v181, "addObject:", v16);
          log = objc_opt_new(NSMutableArray);
          v192 = 0u;
          v193 = 0u;
          v194 = 0u;
          v195 = 0u;
          v22 = v6;
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
          if (v23)
          {
            v24 = v23;
            v25 = 0;
            v26 = *(_QWORD *)v193;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(_QWORD *)v193 != v26)
                  objc_enumerationMutation(v22);
                v28 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)i);
                if ((v25 & 1) != 0
                  || -[MOVisitAnnotationManager likelySamePlaceCheckForEvent:otherEvents:](self, "likelySamePlaceCheckForEvent:otherEvents:", *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)i), v21))
                {
                  -[MOVisitAnnotationManager transferPlaceForEvent:landmarkEvent:](self, "transferPlaceForEvent:landmarkEvent:", v28, v16, v175);
                  v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v30 = objc_claimAutoreleasedReturnValue(v29);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    v35 = (objc_class *)objc_opt_class(v183, v31);
                    v36 = NSStringFromClass(v35);
                    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "routineEvent"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "placeName"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mask"));
                    *(_DWORD *)buf = 138412546;
                    v206 = v37;
                    v207 = 2112;
                    v208 = v40;
                    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Merging the cached visit", buf, 0x16u);

                    v21 = v181;
                    v5 = v180;
                  }
                  v25 = 1;
                }
                else
                {
                  -[NSMutableArray addObject:](log, "addObject:", v28);
                  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v28));
                  -[NSMutableArray addObject:](v5, "addObject:", v32);

                  v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v30 = objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    v41 = (objc_class *)objc_opt_class(v183, v34);
                    v42 = NSStringFromClass(v41);
                    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "routineEvent"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "placeName"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "mask"));
                    *(_DWORD *)buf = 138412546;
                    v206 = v43;
                    v207 = 2112;
                    v208 = v46;
                    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Split the cached visit", buf, 0x16u);

                    v5 = v180;
                    v21 = v181;

                  }
                  v25 = 0;
                }

                self = v183;
              }
              v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
            }
            while (v24);
          }

          -[NSMutableArray removeObjectsInArray:](v177, "removeObjectsInArray:", log);
          v6 = objc_opt_new(NSMutableArray);

          -[NSMutableArray addObject:](v177, "addObject:", v16);
          v47 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v134 = (objc_class *)objc_opt_class(self, v49);
            v135 = NSStringFromClass(v134);
            v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
            v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routineEvent"));
            v138 = v6;
            v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "placeName"));
            v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v136;
            v207 = 2112;
            v208 = v140;
            _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

            v5 = v180;
            v6 = v138;

          }
          v10 = 2;
          v7 = v175;
          goto LABEL_71;
        }
        if (-[MOVisitAnnotationManager snapableEvent:](self, "snapableEvent:", v13))
        {
          -[NSMutableArray addObject:](v6, "addObject:", v13);
          -[NSMutableArray addObject:](v177, "addObject:", v13);
          v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v54 = (objc_class *)objc_opt_class(self, v53);
            v55 = NSStringFromClass(v54);
            v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "placeName"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v56;
            v207 = 2112;
            v208 = v59;
            _os_log_debug_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Caching", buf, 0x16u);

            goto LABEL_75;
          }
LABEL_39:
          v10 = 1;
LABEL_68:
          v16 = v11;
          goto LABEL_72;
        }
        v190 = 0u;
        v191 = 0u;
        v188 = 0u;
        v189 = 0u;
        v64 = v177;
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v188, v202, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v189;
          do
          {
            for (j = 0; j != v66; j = (char *)j + 1)
            {
              if (*(_QWORD *)v189 != v67)
                objc_enumerationMutation(v64);
              v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * (_QWORD)j), v175));
              -[NSMutableArray addObject:](v5, "addObject:", v69);

            }
            v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v188, v202, 16);
          }
          while (v66);
        }

        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
        v71 = objc_msgSend(v70, "placeUserType");

        if (v71 == (id)1)
        {
          v72 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v73 = objc_claimAutoreleasedReturnValue(v72);
          v7 = v175;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            v75 = (objc_class *)objc_opt_class(self, v74);
            v76 = NSStringFromClass(v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v79 = v6;
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "placeName"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v77;
            v207 = 2112;
            v208 = v81;
            v82 = v73;
            v83 = "%@: drop, place name, %@, Reset";
            goto LABEL_77;
          }
        }
        else
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));
          -[NSMutableArray addObject:](v5, "addObject:", v113);

          v114 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v73 = objc_claimAutoreleasedReturnValue(v114);
          v7 = v175;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            v160 = (objc_class *)objc_opt_class(self, v115);
            v161 = NSStringFromClass(v160);
            v77 = (void *)objc_claimAutoreleasedReturnValue(v161);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v79 = v6;
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "placeName"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v77;
            v207 = 2112;
            v208 = v81;
            v82 = v73;
            v83 = "%@: Merging, place name, %@, Reset";
LABEL_77:
            _os_log_debug_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, v83, buf, 0x16u);

            v5 = v180;
            v6 = v79;

          }
        }

        v177 = objc_opt_new(NSMutableArray);
        v116 = objc_opt_new(NSMutableArray);
        v10 = 0;
        v16 = 0;
        v117 = v181;
        v181 = v116;
        log = v117;
        goto LABEL_71;
      }
      v179 = v12;
      v209 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v209, 1));
      v15 = -[MOVisitAnnotationManager containTargetAOIInGroup:](self, "containTargetAOIInGroup:", v14);

      if (!v15)
      {
        if (-[MOVisitAnnotationManager snapableEvent:](self, "snapableEvent:", v13))
        {
          -[NSMutableArray addObject:](v6, "addObject:", v13);
          -[NSMutableArray addObject:](v177, "addObject:", v13);
          v60 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v148 = (objc_class *)objc_opt_class(self, v61);
            v149 = NSStringFromClass(v148);
            v56 = (void *)objc_claimAutoreleasedReturnValue(v149);
            v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v151 = v6;
            v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "placeName"));
            v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v56;
            v207 = 2112;
            v208 = v153;
            _os_log_debug_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Caching", buf, 0x16u);

            self = v183;
            v6 = v151;

LABEL_75:
          }
          goto LABEL_39;
        }
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
        v87 = objc_msgSend(v86, "placeUserType");

        if (v87 == (id)1)
        {
          v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v88);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v90 = (objc_class *)objc_opt_class(self, v89);
            v91 = NSStringFromClass(v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v94 = v6;
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "placeName"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v92;
            v207 = 2112;
            v208 = v96;
            p_super = &log->super.super;
            v98 = "%@: drop, place name, %@, Passing";
            goto LABEL_79;
          }
        }
        else
        {
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));
          -[NSMutableArray addObject:](v5, "addObject:", v118);

          v119 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v119);
          if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
          {
            v162 = (objc_class *)objc_opt_class(self, v120);
            v163 = NSStringFromClass(v162);
            v92 = (void *)objc_claimAutoreleasedReturnValue(v163);
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routineEvent"));
            v94 = v6;
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "placeName"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "mask"));
            *(_DWORD *)buf = 138412546;
            v206 = v92;
            v207 = 2112;
            v208 = v96;
            p_super = &log->super.super;
            v98 = "%@: Merging, place name, %@, Passing";
LABEL_79:
            _os_log_debug_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEBUG, v98, buf, 0x16u);

            self = v183;
            v6 = v94;

          }
        }
        v10 = 0;
        goto LABEL_68;
      }
      v16 = v13;

      -[NSMutableArray addObject:](v181, "addObject:", v16);
      -[NSMutableArray addObject:](v177, "addObject:", v16);
      v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_DEBUG))
      {
        v127 = (objc_class *)objc_opt_class(self, v18);
        v128 = NSStringFromClass(v127);
        v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
        v130 = v6;
        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routineEvent"));
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "placeName"));
        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "mask"));
        *(_DWORD *)buf = 138412546;
        v206 = v129;
        v207 = 2112;
        v208 = v133;
        _os_log_debug_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

        self = v183;
        v6 = v130;

      }
      v10 = 2;
LABEL_72:

      v11 = v16;
      v12 = v179 + 1;
    }
    while ((id)(v179 + 1) != v9);
    v166 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v196, v210, 16);
    v9 = v166;
  }
  while (v166);
LABEL_85:

  if (-[NSMutableArray count](v177, "count"))
  {
    if (v10 == 2)
    {
      -[NSMutableArray addObject:](v5, "addObject:", v177);
    }
    else
    {
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v167 = v177;
      v168 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v167, "countByEnumeratingWithState:objects:count:", &v184, v200, 16);
      if (v168)
      {
        v169 = v168;
        v170 = *(_QWORD *)v185;
        do
        {
          for (k = 0; k != v169; k = (char *)k + 1)
          {
            if (*(_QWORD *)v185 != v170)
              objc_enumerationMutation(v167);
            v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * (_QWORD)k), v175));
            -[NSMutableArray addObject:](v5, "addObject:", v172);

          }
          v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v167, "countByEnumeratingWithState:objects:count:", &v184, v200, 16);
        }
        while (v169);
      }

      v7 = v175;
    }
  }
  v173 = v5;

  return v173;
}

- (id)applyNameBasedGroupingOnEvents:(id)a3
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
  MOVisitAnnotationManager *v70;
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
        -[MOVisitAnnotationManager timeIntervalThresholdDefault](self, "timeIntervalThresholdDefault");
        v15 = v14;
        -[MOVisitAnnotationManager distanceThresholdDefault](self, "distanceThresholdDefault");
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
            -[MOVisitAnnotationManager timeIntervalThresholdWithSamePlaceName](self, "timeIntervalThresholdWithSamePlaceName");
            v15 = v32;
            -[MOVisitAnnotationManager distanceThresholdWithSamePlaceName](self, "distanceThresholdWithSamePlaceName");
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
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id os_log;
  NSObject *v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  id v85;
  NSObject *v86;
  uint64_t v87;
  objc_class *v88;
  NSString *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  id obj;
  uint64_t v108;
  id v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  id v130;
  _QWORD v131[2];
  _BYTE v132[128];
  uint8_t v133[128];
  uint8_t buf[4];
  void *v135;
  __int16 v136;
  id v137;
  __int16 v138;
  id v139;
  __int16 v140;
  void *v141;
  _QWORD v142[4];
  _QWORD v143[2];

  v7 = a3;
  v106 = a4;
  v109 = a5;
  v104 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K != %lu")));
  v8 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category"), 22, CFSTR("lifeEventCategory"), 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
  v13 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v10, v12));

  v101 = (void *)v13;
  v102 = (void *)v8;
  v143[0] = v8;
  v143[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 2));
  v15 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
  v20 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfSocialContextEventWithStartDate:endData:", v17, v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
  v25 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessionsWithStartDate:endData:", v22, v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
  v30 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v27, v29));

  v98 = (void *)v20;
  v99 = (void *)v15;
  v142[0] = v15;
  v142[1] = v20;
  v96 = (void *)v30;
  v97 = (void *)v25;
  v142[2] = v25;
  v142[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 4));
  v32 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v31));

  v95 = (void *)v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "filteredArrayUsingPredicate:", v32));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v35 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v37 = (objc_class *)objc_opt_class(self, v36);
    v38 = NSStringFromClass(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = objc_msgSend(v33, "count");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "startDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "endDate"));
    *(_DWORD *)buf = 138413058;
    v135 = v39;
    v136 = 2048;
    v137 = v40;
    v138 = 2112;
    v139 = v42;
    v140 = 2112;
    v141 = v44;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@: filtered context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

  }
  v45 = v33;
  v112 = v45;
  v105 = v7;
  if (objc_msgSend(v109, "count"))
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    obj = v7;
    v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
    if (!v110)
      goto LABEL_25;
    v108 = *(_QWORD *)v126;
    while (1)
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v126 != v108)
          objc_enumerationMutation(obj);
        v111 = v46;
        v114 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v46);
        v115 = (uint64_t)v45;
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v119 = v109;
        v47 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v122;
          v113 = *(_QWORD *)v122;
          do
          {
            v50 = 0;
            v117 = v48;
            do
            {
              if (*(_QWORD *)v122 != v49)
                objc_enumerationMutation(v119);
              v51 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "patterns"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
              if (objc_msgSend(v53, "intValue"))
              {

LABEL_18:
                goto LABEL_19;
              }
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "eventIdentifier"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUIDString"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "patterns"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier")));
              v58 = objc_msgSend(v55, "isEqualToString:", v57);

              if (v58)
              {
                v52 = (void *)v115;
                v48 = v117;
                v115 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "arrayByAddingObject:", v51));
                v49 = v113;
                goto LABEL_18;
              }
              v49 = v113;
              v48 = v117;
LABEL_19:
              v50 = (char *)v50 + 1;
            }
            while (v48 != v50);
            v59 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
            v48 = v59;
          }
          while (v59);
        }

        v46 = v111 + 1;
        v45 = (id)v115;
      }
      while ((id)(v111 + 1) != v110);
      v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
      if (!v110)
      {
LABEL_25:

        v7 = v105;
        break;
      }
    }
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K = %lu")));
  v61 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v60, CFSTR("category"), 22, CFSTR("lifeEventCategory"), 4));
  v62 = v45;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "startDate"));
  v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "dateByAddingTimeInterval:", -300.0));

  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "endDate"));

  v120 = (id)v65;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v65, v67));
  v118 = (void *)v61;
  v131[0] = v61;
  v131[1] = v116;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 2));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v68));

  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "filteredArrayUsingPredicate:", v69));
  v130 = v104;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "sortedArrayUsingDescriptors:", v71));

  v73 = v62;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "lastObject"));

  v75 = v73;
  if (v74)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "lastObject"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "endDate"));

    v75 = v73;
    if (v77)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "endDate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "firstObject"));
      v80 = v60;
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "startDate"));
      objc_msgSend(v78, "timeIntervalSinceDate:", v81);
      v83 = fabs(v82);

      v60 = v80;
      v75 = v73;
      if (v83 < 300.0)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "lastObject"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "arrayByAddingObject:", v84));

      }
    }

  }
  v85 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v86 = objc_claimAutoreleasedReturnValue(v85);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
  {
    v88 = (objc_class *)objc_opt_class(self, v87);
    v89 = NSStringFromClass(v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    v91 = objc_msgSend(v70, "count");
    *(_DWORD *)buf = 138413058;
    v135 = v90;
    v136 = 2048;
    v137 = v91;
    v138 = 2112;
    v139 = v120;
    v140 = 2112;
    v141 = v67;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "%@: flightEvents count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

  }
  v129 = v104;
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v129, 1));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "sortedArrayUsingDescriptors:", v92));

  return v93;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v4;
  id v7;
  id v8;
  MOEventBundle *v9;
  void *v10;
  void *v11;
  MOEventBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  void *v32;
  BOOL v33;
  void *v34;
  double v35;
  double v36;
  MODaemonUniverse *v37;
  void *v38;
  id os_log;
  NSObject *v40;
  uint64_t v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  double v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _UNKNOWN **v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v81;
  _BOOL4 v82;
  BOOL v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[7];
  objc_super v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  NSMutableArray *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  NSMutableArray *v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  uint64_t v108;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    v12 = 0;
    goto LABEL_43;
  }
  v9 = [MOEventBundle alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v9, "initWithBundleIdentifier:creationDate:", v10, v11);

  -[MOEventBundle setInterfaceType:](v12, "setInterfaceType:", 2);
  -[MOEventBundle setBundleSuperType:](v12, "setBundleSuperType:", 1);
  -[MOEventBundle setBundleSubType:](v12, "setBundleSubType:", 101);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v14, v15));
  -[MOEventBundle setTime:](v12, "setTime:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager predominantWeatherFromBaseEvents:](self, "predominantWeatherFromBaseEvents:", v7));
  -[MOEventBundle setPredominantWeather:](v12, "setPredominantWeather:", v17);

  -[MOEventBundle setPropertiesBasedOnEvents](v12, "setPropertiesBasedOnEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
  -[MOEventBundle setStartDate:](v12, "setStartDate:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endDate"));
  -[MOEventBundle setEndDate:](v12, "setEndDate:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager resourcesFromBaseEvents:](self, "resourcesFromBaseEvents:", v7));
  -[MOEventBundle setResources:](v12, "setResources:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v12, "events"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v23));

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v85));
  if (objc_msgSend(v86, "count"))
    objc_msgSend(v84, "addObjectsFromArray:", v86);
  v24 = objc_msgSend(v84, "copy");
  -[MOEventBundle setEvents:](v12, "setEvents:", v24);

  -[MOVisitAnnotationManager updateActionWithBaseEvents:contextEvents:eventBundle:](self, "updateActionWithBaseEvents:contextEvents:eventBundle:", v7, v8, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v12, "action"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager placeFromBaseEvents:action:](self, "placeFromBaseEvents:action:", v7, v25));
  -[MOEventBundle setPlace:](v12, "setPlace:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v12, "action"));
  if (objc_msgSend(v27, "actionType") == (id)10)
  {

  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v12, "action"));
    v4 = objc_msgSend(v28, "actionType");

    if (v4 != (id)9)
      goto LABEL_19;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  v30 = objc_msgSend(v29, "placeType");
  if (v30 == (id)3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
    objc_msgSend(v4, "placeNameConfidence");
    if (v31 < 0.95)
    {

      goto LABEL_15;
    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  if (objc_msgSend(v32, "placeType") != (id)2)
  {

    if (v30 == (id)3)
    goto LABEL_18;
  }
  v33 = v30 == (id)3;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  objc_msgSend(v34, "placeNameConfidence");
  v36 = v35;

  if (v33)
  if (v36 < 0.95)
  {
LABEL_15:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager actionFromBaseEvents:](self, "actionFromBaseEvents:", v7));
    -[MOEventBundle setAction:](v12, "setAction:", v29);
LABEL_18:

  }
LABEL_19:
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy_;
  v103 = __Block_byref_object_dispose_;
  v104 = objc_opt_new(NSMutableArray);
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  v94 = objc_opt_new(NSMutableArray);
  v88.receiver = self;
  v88.super_class = (Class)MOVisitAnnotationManager;
  v37 = -[MOAnnotationManager fUniverse](&v88, "fUniverse");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = __61__MOVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
  v87[3] = &unk_1002AD9C0;
  v87[4] = &v99;
  v87[5] = &v95;
  v87[6] = &v89;
  +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v12, v38, v87);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v40 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v42 = (objc_class *)objc_opt_class(self, v41);
    v43 = NSStringFromClass(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = v96[3];
    *(_DWORD *)buf = 138412546;
    v106 = v44;
    v107 = 2048;
    v108 = v45;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@: visit, photoSource, %lu", buf, 0x16u);

  }
  -[MOEventBundle setResources:](v12, "setResources:", v100[5]);
  -[MOEventBundle setPhotoSource:](v12, "setPhotoSource:", v96[3]);
  v46 = objc_msgSend((id)v90[5], "copy");
  -[MOEventBundle setPhotoTraits:](v12, "setPhotoTraits:", v46);

  if (objc_msgSend((id)v100[5], "count"))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
    objc_msgSend(v47, "placeNameConfidence");
    v49 = v48 < 0.0;

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
      objc_msgSend(v50, "setPlaceNameConfidence:", 0.0);

    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  v52 = objc_msgSend(v51, "placeUserType");
  if (v52 != (id)2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
    objc_msgSend(v4, "familiarityIndexLOI");
    if (v53 <= self->_recommendedTabVisitFIThreshold)
      goto LABEL_28;
  }
  if (-[MOEventBundle photoSource](v12, "photoSource"))
  {
    if (v52 == (id)2)
    {
LABEL_29:

      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  v81 = objc_msgSend(v86, "count");
  if (v52 == (id)2)
  {
    v82 = v81 == 0;

    if (!v82)
      goto LABEL_30;
  }
  else
  {
    v83 = v81 == 0;

    if (!v83)
      goto LABEL_30;
  }
  -[MOEventBundle setSummarizationGranularity:](v12, "setSummarizationGranularity:", 1);
LABEL_30:
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  objc_msgSend(v54, "distanceToHomeInMiles");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("DistanceToHome"), v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  objc_msgSend(v56, "placeNameConfidence");
  if (v57 >= 0.9)
  {
    v58 = nonInterestingPOIcategories;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "poiCategory"));
    LOBYTE(v58) = objc_msgSend((id)v58, "containsObject:", v60);

    if ((v58 & 1) != 0)
    {
      v61 = &off_1002DCC98;
      goto LABEL_38;
    }
  }
  else
  {

  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  objc_msgSend(v62, "placeNameConfidence");
  if (v63 < 0.9)
  {

LABEL_39:
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v67);

    goto LABEL_40;
  }
  v64 = (void *)interestingPOIcategories;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "poiCategory"));
  LODWORD(v64) = objc_msgSend(v64, "containsObject:", v66);

  if (!(_DWORD)v64)
    goto LABEL_39;
  v61 = &off_1002DCCA8;
LABEL_38:
  -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v61);
LABEL_40:
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v68, "locationMode") == (id)2));
  -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("LocationModeTourist"), v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v12, "endDate"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v12, "startDate"));
  objc_msgSend(v70, "timeIntervalSinceDate:", v71);
  v73 = v72;

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v73));
  -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("VisitDuration"), v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v12, "place"));
  objc_msgSend(v75, "familiarityIndexLOI");
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[MOEventBundle addMetaDataForRankForKey:value:](v12, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v12, "events"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "filteredArrayUsingPredicate:", v77));

  if (objc_msgSend(v79, "count"))
  {
    +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v12, v79);
    +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v12, v79);
  }
  +[MOVisitAnnotationManager scoreVisitBundleAssets:](MOVisitAnnotationManager, "scoreVisitBundleAssets:", v12);

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);

LABEL_43:
  return v12;
}

void __61__MOVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
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
  void *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSMutableArray *v45;
  id v46;
  id v47;
  int v48;
  uint64_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  int v53;
  NSMutableArray *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  NSMutableArray *v59;
  id v60;
  id v61;
  uint64_t v62;
  double v63;
  void *v64;
  double v65;
  NSMutableArray *v66;
  id v67;
  void *v68;
  NSMutableArray *v69;
  void *v70;
  unsigned __int8 v71;
  void *v72;
  NSMutableArray *v73;
  NSMutableArray *v74;
  NSMutableArray *v75;
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
  _BYTE v94[128];
  _BYTE v95[128];
  _QWORD v96[3];

  v3 = a3;
  v66 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableArray);
  v75 = objc_opt_new(NSMutableArray);
  v73 = objc_opt_new(NSMutableArray);
  v96[0] = GEOPOICategoryAirport;
  v96[1] = GEOPOICategoryAirportGate;
  v96[2] = GEOPOICategoryAirportTerminal;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 3));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v7 = v4;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  v69 = v4;
  v74 = v5;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v89;
    v67 = v3;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v89 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)v12);
        if (objc_msgSend(v13, "type", v66) == (id)2)
        {
          v14 = objc_msgSend(v13, "copy");
          v15 = v7;
LABEL_10:
          -[NSMutableArray addObject:](v15, "addObject:", v14);

          goto LABEL_11;
        }
        if (objc_msgSend(v13, "type") == (id)3)
        {
          v14 = objc_msgSend(v13, "copy");
          v15 = v5;
          goto LABEL_10;
        }
        if (objc_msgSend(v13, "type") == (id)6)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
          if (!v16)
            goto LABEL_23;
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
          if (objc_msgSend(v18, "actionType") != (id)11)
            goto LABEL_22;
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          if (!v19)
            goto LABEL_22;
          v20 = (void *)v19;
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "poiCategory"));
          if (!v21)
          {

            v7 = v69;
LABEL_22:

            v5 = v74;
LABEL_23:
            -[NSMutableArray addObject:](v75, "addObject:", v13);
            goto LABEL_11;
          }
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "poiCategory"));
          v71 = objc_msgSend(v68, "containsObject:", v22);

          v3 = v67;
          v7 = v69;
          v5 = v74;
          if ((v71 & 1) != 0)
            goto LABEL_23;
        }
        if (objc_msgSend(v13, "type") == (id)16)
        {
          v23 = objc_msgSend(v13, "copy");
          -[NSMutableArray addObject:](v73, "addObject:", v23);

        }
LABEL_11:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      v10 = v24;
    }
    while (v24);
  }

  if (!-[NSMutableArray count](v7, "count") && !v5)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v25, "setPriorityScore:", 100.0);

    v26 = v66;
    v27 = v75;
    v28 = v73;
    goto LABEL_62;
  }
  v29 = -[NSMutableArray count](v7, "count", v66);
  v26 = v66;
  v28 = v73;
  if (v29 && -[NSMutableArray count](v5, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v7, "firstObject"));
    objc_msgSend(v30, "setPriorityScore:", 100.0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v31, "setPriorityScore:", 200.0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
    objc_msgSend(v32, "setPriorityScore:", 201.0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v7, "firstObject"));
    -[NSMutableArray addObject:](v66, "addObject:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
    -[NSMutableArray addObject:](v66, "addObject:", v34);

    -[NSMutableArray removeObjectAtIndex:](v7, "removeObjectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", 0);
    if (-[NSMutableArray count](v73, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v73, "firstObject"));
      objc_msgSend(v35, "setPriorityScore:", 202.0);

LABEL_37:
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v73, "firstObject"));
      -[NSMutableArray addObject:](v66, "addObject:", v43);

      -[NSMutableArray removeObjectAtIndex:](v73, "removeObjectAtIndex:", 0);
    }
  }
  else
  {
    if (-[NSMutableArray count](v7, "count"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v7, "firstObject"));
      objc_msgSend(v36, "setPriorityScore:", 100.0);

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      objc_msgSend(v37, "setPriorityScore:", 200.0);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v7, "firstObject"));
      -[NSMutableArray addObject:](v66, "addObject:", v38);

      v39 = v7;
    }
    else
    {
      if (!-[NSMutableArray count](v5, "count"))
        goto LABEL_38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      objc_msgSend(v40, "setPriorityScore:", 100.0);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
      objc_msgSend(v41, "setPriorityScore:", 200.0);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v5, "firstObject"));
      -[NSMutableArray addObject:](v66, "addObject:", v42);

      v39 = v5;
    }
    -[NSMutableArray removeObjectAtIndex:](v39, "removeObjectAtIndex:", 0);
    if (-[NSMutableArray count](v73, "count"))
      goto LABEL_37;
  }
LABEL_38:
  v44 = v3;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v45 = v7;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v46)
  {
    v47 = v46;
    v48 = 0;
    v49 = *(_QWORD *)v85;
    do
    {
      v50 = 0;
      v51 = v48;
      v52 = v48;
      do
      {
        if (*(_QWORD *)v85 != v49)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v50), "setPriorityScore:", (double)((unint64_t)v50 + v52 + 300));
        v50 = (char *)v50 + 1;
      }
      while (v47 != v50);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      v48 = v52 + (_DWORD)v50;
    }
    while (v47);
    v53 = (_DWORD)v50 + v51;
    v28 = v73;
  }
  else
  {
    v53 = 0;
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v54 = v74;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i), "setPriorityScore:", (double)((unint64_t)i + v53 + 300));
      }
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
      v53 += (int)i;
    }
    while (v56);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v59 = v28;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  v7 = v69;
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v77;
    v63 = 401.0;
    do
    {
      v64 = 0;
      v65 = v63;
      do
      {
        if (*(_QWORD *)v77 != v62)
          objc_enumerationMutation(v59);
        v63 = v65 + 1.0;
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v64), "setPriorityScore:", v65);
        v64 = (char *)v64 + 1;
        v65 = v65 + 1.0;
      }
      while (v61 != v64);
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v61);
  }

  -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v45);
  -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v54);
  v27 = v75;
  -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v75);
  -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v59);
  v3 = v44;
  v5 = v74;
LABEL_62:
  objc_msgSend(v3, "setResources:", v26, v66);

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

- (void)updateActionWithBaseEvents:(id)a3 contextEvents:(id)a4 eventBundle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id os_log;
  NSObject *v29;
  id v30;
  void *v31;
  double v32;
  id v33;
  double v34;
  id v35;
  MOAction *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  MOAction *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  BOOL v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  NSMutableArray *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  MOAction *v74;
  id obj;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  unint64_t v81;
  _BYTE v82[128];

  v8 = a3;
  v9 = a4;
  v65 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  objc_msgSend(v12, "confidenceScore");
  v14 = v13;
  -[MOVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold");
  v16 = v15;

  v68 = objc_opt_new(NSMutableArray);
  v66 = v8;
  -[NSMutableArray addObjectsFromArray:](v68, "addObjectsFromArray:", v8);
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryFoodMarket, GEOPOICategoryStore, 0));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryRestaurant, GEOPOICategoryCafe, GEOPOICategoryBakery, 0));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryAirport, GEOPOICategoryAirportGate, GEOPOICategoryAirportTerminal, 0));
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  v19 = "h: unrehydrated state of mind count, %lu";
  obj = v17;
  if (!v18)
  {
    v72 = 0;
    v36 = 0;
    v37 = v17;
LABEL_33:

    goto LABEL_35;
  }
  v20 = v18;
  v72 = 0;
  v73 = 0;
  v21 = *(_QWORD *)v77;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(_QWORD *)v77 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
      v24 = objc_autoreleasePoolPush();
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager configurationManager](self, "configurationManager"));

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager configurationManager](self, "configurationManager"));
        v27 = objc_msgSend(v26, "getBoolSettingForKey:withFallback:", CFSTR("EventBundleManagerOverrideEnableLifeEvent"), 1);

      }
      else
      {
        v27 = 1;
      }
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v29 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v81 = v27;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "eventBundle enable life events (visit annotation manager), %lu", buf, 0xCu);
      }

      if (v27 && objc_msgSend(v23, "category") == (id)22 && objc_msgSend(v23, "lifeEventCategory") != (id)3)
      {
        -[NSMutableArray addObject:](v68, "addObject:", v23);
        if (v14 >= v16)
          goto LABEL_28;
        v35 = objc_msgSend(v23, "lifeEventCategory");
        if (v35 != (id)4 && v35 != (id)2 && v35 != (id)1)
          goto LABEL_28;
LABEL_22:
        objc_msgSend(v23, "confidenceScore");
        if (v32 > (double)v73)
        {
          v33 = v23;

          objc_msgSend(v33, "confidenceScore");
          v72 = v33;
          v73 = (unint64_t)v34;
        }
        goto LABEL_28;
      }
      if (!v11)
        goto LABEL_28;
      v30 = objc_msgSend(v23, "lifeEventCategory");
      if (v30 == (id)4)
      {
        v31 = v69;
      }
      else if (v30 == (id)2)
      {
        v31 = v70;
      }
      else
      {
        if (v30 != (id)1)
          goto LABEL_28;
        v31 = v71;
      }
      if (objc_msgSend(v31, "containsObject:", v11))
        goto LABEL_22;
LABEL_28:
      objc_autoreleasePoolPop(v24);
    }
    v17 = obj;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  }
  while (v20);

  if (v72)
  {
    v36 = -[MOAction initWithLifeEvent:]([MOAction alloc], "initWithLifeEvent:", v72);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "eventIdentifier"));
    -[MOAction setSourceEventIdentifier:](v36, "setSourceEventIdentifier:", v37);
    v19 = "health: unrehydrated state of mind count, %lu" + 5;
    goto LABEL_33;
  }
  v72 = 0;
  v36 = 0;
  v19 = "h: unrehydrated state of mind count, %lu";
LABEL_35:
  v74 = v36;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessions"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filteredArrayUsingPredicate:"));
  v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = *((_QWORD *)v19 + 233);
    v81 = (unint64_t)v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "annotateEventBundle Media Events (Playback), %lu", buf, 0xCu);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2));
  v43 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v42));

  v63 = (void *)v43;
  v64 = v38;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:](MOContextAnnotationUtilities, "annotateEventBundle:playbackMediaEvents:lessSignificantPlaySessionMediaTypes:", v65, v38, v43));
  -[NSMutableArray addObjectsFromArray:](v68, "addObjectsFromArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "startDate"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "endDate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v45, v46));

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "filteredArrayUsingPredicate:", v47));
  -[MOVisitAnnotationManager emotionAttachmentBundleDurationThreshold](self, "emotionAttachmentBundleDurationThreshold");
  *(float *)&v49 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:", v65, v66, v48, v49));
  -[NSMutableArray addObjectsFromArray:](v68, "addObjectsFromArray:", v50);
  v51 = v74;
  if (v74)
  {
    objc_msgSend(v65, "setAction:", v74);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "action"));
    v53 = objc_msgSend(v52, "actionType");

    v54 = v65;
    if (v53 == (id)9)
    {
      v55 = 104;
      goto LABEL_43;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "action"));
    v58 = objc_msgSend(v57, "actionType");

    if (v58 == (id)10)
    {
      v55 = 103;
LABEL_43:
      v51 = v74;
LABEL_44:
      objc_msgSend(v65, "setBundleSubType:", v55);
    }
    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "action"));
      v61 = objc_msgSend(v60, "actionType");

      v62 = v61 == (id)11;
      v51 = v74;
      if (v62)
      {
        v55 = 102;
        goto LABEL_44;
      }
    }
    v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v56 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[MOVisitAnnotationManager updateActionWithBaseEvents:contextEvents:eventBundle:].cold.1(v65, v56);
  }
  else
  {
    v56 = objc_claimAutoreleasedReturnValue(-[MOVisitAnnotationManager actionFromBaseEvents:](self, "actionFromBaseEvents:", v66));
    objc_msgSend(v65, "setAction:", v56);
    v54 = v65;
  }

  objc_msgSend(v54, "addEvents:", v68);
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
  uint64_t v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities majorityGroupFromEvents:propertyPath:valuePath:](MOContextAnnotationUtilities, "majorityGroupFromEvents:propertyPath:valuePath:", v6, CFSTR("placeName"), CFSTR("duration")));
  if (v7 && objc_msgSend(v7, "actionType") == (id)11)
    v9 = self->_flightPoiCategories;
  else
    v9 = 0;
  lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
  -[MOVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold");
  v12 = v11;
  -[MOVisitAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
  v14 = v13;
  -[MOVisitAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvents:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v8, v9, lessInterestingPoiCategories, v17, v12, v14, v16));

  if (objc_msgSend(v18, "placeUserType") == (id)2 || objc_msgSend(v18, "placeUserType") == (id)1)
    objc_msgSend(v18, "setPlaceNameConfidence:", -1.0);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v20)
  {

LABEL_18:
    objc_msgSend(v18, "setPlaceNameConfidence:", -1.0);
    goto LABEL_19;
  }
  v21 = v20;
  v37 = v7;
  v22 = v9;
  v23 = v8;
  v24 = *(_QWORD *)v39;
  v25 = 0.0;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v39 != v24)
        objc_enumerationMutation(v19);
      v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
      objc_msgSend(v28, "timeIntervalSinceDate:", v29);
      v25 = v25 + v30;

    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v21);

  v8 = v23;
  v9 = v22;
  v7 = v37;
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
      -[MOVisitAnnotationManager placeFromBaseEvents:action:].cold.1((uint64_t)v18, v34, v35);

  }
  return v18;
}

- (id)resourcesFromBaseEvents:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  id v6;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  NSSet *lessInterestingPoiCategories;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id os_log;
  NSObject *v21;
  uint64_t v22;
  MOResource *v23;
  void *v24;
  void *v25;
  MOResource *v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v36;
  void *v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities majorityGroupFromEvents:propertyPath:valuePath:](MOContextAnnotationUtilities, "majorityGroupFromEvents:propertyPath:valuePath:", a3, CFSTR("placeName"), CFSTR("duration")));
  v5 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v6)
  {
    v8 = v6;
    v39 = *(_QWORD *)v41;
    *(_QWORD *)&v7 = 138412802;
    v36 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v9);
        lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
        -[MOVisitAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold", v36);
        v13 = v12;
        -[MOVisitAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
        v15 = v14;
        -[MOVisitAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v10, 0, lessInterestingPoiCategories, v18, v13, v15, v17));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v21 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v28 = (objc_class *)objc_opt_class(self, v22);
          v29 = NSStringFromClass(v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "placeName"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mask"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeMapItem"));
          v33 = objc_msgSend(v32, "length");
          *(_DWORD *)buf = v36;
          v45 = v30;
          v46 = 2112;
          v47 = v31;
          v48 = 2048;
          v49 = v33;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);

        }
        v23 = [MOResource alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "placeName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeMapItem"));
        v26 = -[MOResource initWithName:mapItemHandle:priorityScore:](v23, "initWithName:mapItemHandle:priorityScore:", v24, v25, -1.0);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
        -[MOResource setSourceEventIdentifier:](v26, "setSourceEventIdentifier:", v27);

        -[NSMutableArray addObject:](v5, "addObject:", v26);
        v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v8);
  }

  if (-[NSMutableArray count](v5, "count"))
    v34 = -[NSMutableArray copy](v5, "copy");
  else
    v34 = 0;

  return v34;
}

- (id)predominantWeatherFromBaseEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    v8 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
        objc_msgSend(v11, "timeIntervalSinceDate:", v12);
        v14 = v13;

        if (v14 > v8)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predominantWeather"));

          v6 = (void *)v15;
          v8 = v14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  const __CFString *v39;
  NSMutableString *v40;
  id v41;

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

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "promptDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v21));

    }
    else
    {
      v17 = 0;
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v24 = objc_msgSend(v23, "count");

    if (!v24)
    {
      v22 = 0;
      if (v14)
        goto LABEL_34;
      goto LABEL_24;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities andStringFromArray:propertyPath:maxCount:](MOContextAnnotationUtilities, "andStringFromArray:propertyPath:maxCount:", v25, CFSTR("name"), 3));

    if (v22)
      v26 = 1;
    else
      v26 = v14;
    if (v22)
      v27 = v14;
    else
      v27 = 1;
    if (v27 != 1)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
      v38 = objc_msgSend(v37, "count");

      if ((unint64_t)v38 <= 3)
        goto LABEL_34;
      v34 = v5;
      v5 = CFSTR("Social Time");
      v32 = (uint64_t)v22;
      v22 = 0;
      goto LABEL_31;
    }
    LOBYTE(v14) = v26;
  }
  if (v14)
    goto LABEL_34;
LABEL_24:
  if (!v17)
  {
    v39 = CFSTR("Outing");
    goto LABEL_33;
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      v32 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("actionType"), 3));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "filteredArrayUsingPredicate:", v32));

      if (-[__CFString count](v34, "count"))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString firstObject](v34, "firstObject"));
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "actionName"));

        v5 = (__CFString *)v36;
      }
LABEL_31:
      v39 = v5;

      v5 = (__CFString *)v32;
LABEL_33:

      v5 = (__CFString *)v39;
    }
  }
LABEL_34:
  v40 = objc_opt_new(NSMutableString);
  -[NSMutableString appendString:](v40, "appendString:", v5);
  if (v17)
    -[NSMutableString appendString:](v40, "appendString:", v17);
  if (v22)
    -[NSMutableString appendString:](v40, "appendString:", v22);
  v41 = -[NSMutableString copy](v40, "copy");

  return v41;
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

- (double)timeIntervalThresholdForCoarseGroup
{
  return self->_timeIntervalThresholdForCoarseGroup;
}

- (void)setTimeIntervalThresholdForCoarseGroup:(double)a3
{
  self->_timeIntervalThresholdForCoarseGroup = a3;
}

- (double)distanceThresholdForCoarseGroup
{
  return self->_distanceThresholdForCoarseGroup;
}

- (void)setDistanceThresholdForCoarseGroup:(double)a3
{
  self->_distanceThresholdForCoarseGroup = a3;
}

- (double)aoiRangeWeight
{
  return self->_aoiRangeWeight;
}

- (void)setAoiRangeWeight:(double)a3
{
  self->_aoiRangeWeight = a3;
}

- (double)aoiMergingRangeMinimumThreshold
{
  return self->_aoiMergingRangeMinimumThreshold;
}

- (void)setAoiMergingRangeMinimumThreshold:(double)a3
{
  self->_aoiMergingRangeMinimumThreshold = a3;
}

- (double)largeAoiMergingRangeMinimumThreshold
{
  return self->_largeAoiMergingRangeMinimumThreshold;
}

- (void)setLargeAoiMergingRangeMinimumThreshold:(double)a3
{
  self->_largeAoiMergingRangeMinimumThreshold = a3;
}

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (double)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_largeAOICategories, 0);
  objc_storeStrong((id *)&self->_AOIGroupingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_outingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_flightPoiCategories, 0);
  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)printGroupedEvents:(NSObject *)a3 tag:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;

  v4 = 138412802;
  v5 = a1;
  v6 = 2112;
  v7 = &stru_1002B68D0;
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: %@ groupedEvents, total count, %lu", (uint8_t *)&v4, 0x20u);
}

- (void)postprocessGroupedEvents:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v5 = (objc_class *)objc_opt_class(a1, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = 138412546;
  v9 = v7;
  v10 = 2048;
  v11 = objc_msgSend(a2, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: input groups, %lu, output groups, 0", (uint8_t *)&v8, 0x16u);

}

- (void)updateActionWithBaseEvents:(void *)a1 contextEvents:(NSObject *)a2 eventBundle:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "action"));
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "eventBundle life event action, %@", (uint8_t *)&v5);

}

- (void)placeFromBaseEvents:(uint64_t)a3 action:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, a3, "eventBundle place is an outing worth place, %@", (uint8_t *)&v3);
}

@end
