@implementation MOTripAnnotationManager

- (MOTripAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  MOTripAnnotationManager *v5;
  uint64_t v6;
  MOTripAnnotationManager *v7;
  objc_class *v8;
  NSString *v9;
  id v10;
  const char *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  void *v16;
  uint64_t v17;
  NSSet *lessInterestingPoiCategories;
  void *v19;
  uint64_t v20;
  NSSet *airportCategories;
  void *v22;
  uint64_t v23;
  NSSet *interestingPoiCategories;
  uint64_t v25;
  NSSet *stateStateTripEligibleCountries;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  MOFSMStore *fsmStore;
  uint64_t v33;
  MOFSM *summaryTripMonitor;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  RTRoutineManager *routineManager;
  uint64_t v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  uint64_t v46;
  MOConfigurationManager *configurationManager;
  double v48;
  float v49;
  double v50;
  float v51;
  double v52;
  float v53;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  double v60;
  float v61;
  double v62;
  float v63;
  double v64;
  float v65;
  double v66;
  double v67;
  MOConfigurationManager *v68;
  void *v69;
  uint64_t v70;
  NSString *addressFormatOption;
  double v72;
  double v73;
  double v74;
  id os_log;
  NSObject *v76;
  uint64_t v77;
  objc_class *v78;
  NSString *v79;
  void *v80;
  objc_super v82;
  uint8_t buf[4];
  void *v84;
  _QWORD v85[6];
  _QWORD v86[3];
  _QWORD v87[15];

  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)MOTripAnnotationManager;
  v5 = -[MOAnnotationManager initWithUniverse:](&v82, "initWithUniverse:", v4);
  v7 = v5;
  if (v5)
  {
    v8 = (objc_class *)objc_opt_class(v5, v6);
    v9 = NSStringFromClass(v8);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create(v11, v13);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;

    v87[0] = GEOPOICategoryATM;
    v87[1] = GEOPOICategoryBank;
    v87[2] = GEOPOICategoryCarRental;
    v87[3] = GEOPOICategoryEVCharger;
    v87[4] = GEOPOICategoryFireStation;
    v87[5] = GEOPOICategoryGasStation;
    v87[6] = GEOPOICategoryHospital;
    v87[7] = GEOPOICategoryHotel;
    v87[8] = GEOPOICategoryLaundry;
    v87[9] = GEOPOICategoryParking;
    v87[10] = GEOPOICategoryPharmacy;
    v87[11] = GEOPOICategoryPolice;
    v87[12] = GEOPOICategoryPostOffice;
    v87[13] = GEOPOICategoryPublicTransport;
    v87[14] = GEOPOICategoryRestroom;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 15));
    v17 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    lessInterestingPoiCategories = v7->_lessInterestingPoiCategories;
    v7->_lessInterestingPoiCategories = (NSSet *)v17;

    v86[0] = GEOPOICategoryAirport;
    v86[1] = GEOPOICategoryAirportGate;
    v86[2] = GEOPOICategoryAirportTerminal;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 3));
    v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
    airportCategories = v7->_airportCategories;
    v7->_airportCategories = (NSSet *)v20;

    v85[0] = GEOPOICategoryAmusementPark;
    v85[1] = GEOPOICategoryAquarium;
    v85[2] = GEOPOICategoryBeach;
    v85[3] = GEOPOICategoryCampground;
    v85[4] = GEOPOICategoryNationalPark;
    v85[5] = GEOPOICategoryZoo;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 6));
    v23 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));
    interestingPoiCategories = v7->_interestingPoiCategories;
    v7->_interestingPoiCategories = (NSSet *)v23;

    v25 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC5F0));
    stateStateTripEligibleCountries = v7->_stateStateTripEligibleCountries;
    v7->_stateStateTripEligibleCountries = (NSSet *)v25;

    v28 = (objc_class *)objc_opt_class(MOFSMStore, v27);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v30));
    fsmStore = v7->_fsmStore;
    v7->_fsmStore = (MOFSMStore *)v31;

    v33 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager loadSummaryTripMonitorFromStore:](v7, "loadSummaryTripMonitorFromStore:", v7->_fsmStore));
    summaryTripMonitor = v7->_summaryTripMonitor;
    v7->_summaryTripMonitor = (MOFSM *)v33;

    v36 = (objc_class *)objc_opt_class(MORoutineServiceManager, v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v38));

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "routineManager"));
    routineManager = v7->_routineManager;
    v7->_routineManager = (RTRoutineManager *)v40;

    v43 = (objc_class *)objc_opt_class(MOConfigurationManager, v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v45));
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v46;

    v7->_significantLOIMinimumVisitsThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerSignificantLOIMinimumVisits"), 12);
    HIDWORD(v48) = 1072483532;
    *(float *)&v48 = 0.9;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelMediumConfidenceThreshold"), v48);
    v7->_visitLabelMediumConfidenceThreshold = v49;
    HIDWORD(v50) = 1072588390;
    *(float *)&v50 = 0.95;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelHighConfidenceThreshold"), v50);
    v7->_visitLabelHighConfidenceThreshold = v51;
    HIDWORD(v52) = 1071644672;
    *(float *)&v52 = 0.5;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AOIVisitLabelConfidentThreshold"), v52);
    v54 = v53;
    v7->_aoiVisitLabelConfidentThreshold = v54;
    LODWORD(v54) = 1150681088;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDwellTimeDefault"), v54);
    v56 = v55;
    v7->_minimumDwellTime = v56;
    LODWORD(v56) = 1189765120;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumHometownDistance"), v56);
    v58 = v57;
    v7->_minimumHometownDistanceThreshold = v58;
    LODWORD(v58) = 1198153728;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumHometownDistanceForTrip"), v58);
    v60 = v59;
    v7->_minimumHometownDistanceForTripThreshold = v60;
    LODWORD(v60) = 1206542336;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMaximumCommuteDistanceForTrip"), v60);
    v62 = v61;
    v7->_maximumCommuteDistanceForTripThreshold = v62;
    LODWORD(v62) = 1198153728;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDistanceBetweenTrips"), v62);
    v64 = v63;
    v7->_minimumDistanceBetweenTripsThreshold = v64;
    LODWORD(v64) = 1163984896;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDuration"), v64);
    v7->_minimumDurationThreshold = v65;
    v7->_minimumDayCountThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDayCount"), 2);
    v7->_maximumDayCountThreashold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMaximumDayCount"), 7);
    v7->_minimumVisitCountThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumVisitCount"), 1);
    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v7->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDominancyRatioForSinglePOITrip"), 0.8);
    v7->_minimumDominancyRatioForSinglePOITripThreshold = v66;
    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v7->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerMinimumDominancyRatioForInterestingPOITrip"), 0.4);
    v7->_minimumDominancyRatioForInterestingPOITripThreshold = v67;
    v68 = v7->_configurationManager;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("addressFormatting"), CFSTR("formatOption")));
    v70 = objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getStringSettingForKey:withFallback:](v68, "getStringSettingForKey:withFallback:", v69, CFSTR("aboveDoorShortAddress")));
    addressFormatOption = v7->_addressFormatOption;
    v7->_addressFormatOption = (NSString *)v70;

    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v7->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerOverNightStartDateHour"), 0.0);
    v7->_overnightStartDateHour = v72;
    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v7->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerOverNightDurationHours"), 6.0);
    v7->_overnightDurationHours = v73;
    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v7->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOTripAnnotationManagerOverNightDurationWeight"), 0.1);
    v7->_overnightDurationWeight = v74;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v76 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      v78 = (objc_class *)objc_opt_class(v7, v77);
      v79 = NSStringFromClass(v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
      *(_DWORD *)buf = 138412290;
      v84 = v80;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%@: Initialized", buf, 0xCu);

    }
  }

  return v7;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke_2;
  v5[3] = &unk_1002ADFD8;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v1, "_performAnnotationWithEvents:withPatternEvents:eventBundles:handler:", v2, v3, v4, v5);

}

uint64_t __94__MOTripAnnotationManager_performAnnotationWithEvents_withPatternEvents_eventBundles_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 eventBundles:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  id v56;
  NSMutableArray *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void (**v81)(id, void *, _QWORD);
  id v82;
  NSErrorUserInfoKey v83;
  const __CFString *v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *, _QWORD))a6;
  v12 = v9;
  v81 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getBaseEvents:](self, "getBaseEvents:", v9));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  v80 = v10;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = (objc_class *)objc_opt_class(self, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_msgSend(v13, "count");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v22 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
    *(_DWORD *)buf = 138413058;
    v86 = v19;
    v87 = 2048;
    v88 = v20;
    v89 = 2112;
    v90 = v23;
    v91 = 2112;
    v92 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: Base Events, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    v13 = v22;
    v10 = v80;

  }
  if (objc_msgSend(v13, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getContextEvents:](self, "getContextEvents:", v12));
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class(self, v29);
      v31 = NSStringFromClass(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 138412546;
      v86 = v32;
      v87 = 2048;
      v88 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@: Context Events, %lu", buf, 0x16u);

    }
    v79 = v12;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getTripEventBundles:](self, "getTripEventBundles:", v10));
    v35 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v38 = (objc_class *)objc_opt_class(self, v37);
      v39 = NSStringFromClass(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v41 = objc_msgSend(v34, "count");
      v77 = v13;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
      v45 = v34;
      v46 = v26;
      v47 = v44;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
      *(_DWORD *)buf = 138413058;
      v86 = v40;
      v87 = 2048;
      v88 = v41;
      v89 = 2112;
      v90 = v43;
      v91 = 2112;
      v92 = v48;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@: pre-generated Trip Bundles, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

      v26 = v46;
      v34 = v45;

      v13 = v77;
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager hometownReferenceLocations](self, "hometownReferenceLocations"));
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class(self, v52);
      v54 = NSStringFromClass(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v56 = objc_msgSend(v49, "count");
      *(_DWORD *)buf = 138412546;
      v86 = v55;
      v87 = 2048;
      v88 = v56;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%@: trip manager hometown location count, %lu", buf, 0x16u);

    }
    if (objc_msgSend(v49, "count"))
    {
      v57 = objc_opt_new(NSMutableArray);
      v58 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager generateDailyTripsFromBaseEvents:contextEvents:pregeneratedTripBundles:hometownReferenceLocations:](self, "generateDailyTripsFromBaseEvents:contextEvents:pregeneratedTripBundles:hometownReferenceLocations:", v13, v26, v34, v49));
      v78 = v34;
      v59 = v26;
      v60 = v13;
      v61 = (void *)v58;
      -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v58);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager generateSummaryTripsFromBaseEvents:hometownReferenceLocations:](self, "generateSummaryTripsFromBaseEvents:hometownReferenceLocations:", v60, v49));
      -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v62);
      v63 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
      v82 = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v57, "sortedArrayUsingDescriptors:", v64));

      v81[2](v81, v65, 0);
      v13 = v60;
      v26 = v59;
      v34 = v78;
    }
    else
    {
      v66 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        -[MOTripAnnotationManager _performAnnotationWithEvents:withPatternEvents:eventBundles:handler:].cold.1(v67, v68, v69, v70, v71, v72, v73, v74);

      v75 = objc_alloc((Class)NSError);
      v83 = NSLocalizedDescriptionKey;
      v84 = CFSTR("The hometown location is empty.");
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
      v57 = (NSMutableArray *)objc_msgSend(v75, "initWithDomain:code:userInfo:", CFSTR("MOBundleAnnotationManager"), 0, v76);

      ((void (**)(id, void *, NSMutableArray *))v81)[2](v81, &__NSArray0__struct, v57);
    }
    v12 = v79;

    v10 = v80;
  }
  else
  {
    v81[2](v81, &__NSArray0__struct, 0);
  }

}

- (id)generateSummaryTripsFromBaseEvents:(id)a3 hometownReferenceLocations:(id)a4
{
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  dispatch_once_t *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  id v34;
  uint64_t v35;
  id v36;
  dispatch_once_t *v37;
  NSMutableArray *v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  id v45;
  MOTripAnnotationManager *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor"));

  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class(self, v9);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor"));
      *(_DWORD *)buf = 138412546;
      v53 = v12;
      v54 = 2112;
      v55 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: fsm model, %@", buf, 0x16u);

    }
    v14 = objc_opt_new(NSMutableArray);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v45 = v5;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v48;
      v19 = &MOLogFacilityTripAnnotationManager;
      v46 = self;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor", v45));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "processVisitEvent:", v21));

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));

            if (!v24)
            {
              v25 = _mo_log_facility_get_os_log(v19);
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v40 = (objc_class *)objc_opt_class(self, v27);
                v41 = NSStringFromClass(v40);
                v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                *(_DWORD *)buf = 138412546;
                v53 = v42;
                v54 = 2112;
                v55 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@: plan, %@", buf, 0x16u);

              }
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager transformTripPlan:](self, "transformTripPlan:", v23));
            if (v28)
            {
              -[NSMutableArray addObject:](v14, "addObject:", v28);
              v29 = _mo_log_facility_get_os_log(v19);
              v30 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                v32 = (objc_class *)objc_opt_class(self, v31);
                v33 = NSStringFromClass(v32);
                v34 = v17;
                v35 = v18;
                v36 = v15;
                v37 = v19;
                v38 = v14;
                v39 = (void *)objc_claimAutoreleasedReturnValue(v33);
                *(_DWORD *)buf = 138412546;
                v53 = v39;
                v54 = 2112;
                v55 = v28;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@: Trip Summary Detected: %@", buf, 0x16u);

                v14 = v38;
                v19 = v37;
                v15 = v36;
                v18 = v35;
                v17 = v34;
                self = v46;
              }

            }
          }

          v20 = (char *)v20 + 1;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v17);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor"));
    -[MOTripAnnotationManager updateSummaryTripMonitor:](self, "updateSummaryTripMonitor:", v43);

    v5 = v45;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)transformTripPlan:(id)a3
{
  id v4;
  MOEventBundle *v5;
  void *v6;
  void *v7;
  MOEventBundle *v8;
  MOAction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  MOPlace *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MOPlace *v26;

  v4 = a3;
  v5 = [MOEventBundle alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v5, "initWithBundleIdentifier:creationDate:", v6, v7);

  -[MOEventBundle setInterfaceType:](v8, "setInterfaceType:", 13);
  -[MOEventBundle setBundleSuperType:](v8, "setBundleSuperType:", 1);
  -[MOEventBundle setBundleSubType:](v8, "setBundleSubType:", 105);
  -[MOEventBundle setSummarizationGranularity:](v8, "setSummarizationGranularity:", 2);
  v9 = -[MOAction initWithActionName:actionType:]([MOAction alloc], "initWithActionName:actionType:", CFSTR("Trip"), 2);
  -[MOEventBundle setAction:](v8, "setAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v10, v11));
  -[MOEventBundle setTime:](v8, "setTime:", v12);

  -[MOEventBundle setEvents:](v8, "setEvents:", &__NSArray0__struct);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  -[MOEventBundle setStartDate:](v8, "setStartDate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  -[MOEventBundle setEndDate:](v8, "setEndDate:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEventBundle setExpirationDate:](v8, "setExpirationDate:", v16);

  -[MOEventBundle setIsAggregatedAndSuppressed:](v8, "setIsAggregatedAndSuppressed:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  -[MOEventBundle setPromptLanguage:](v8, "setPromptLanguage:", v17);

  v18 = (unint64_t)objc_msgSend(v4, "destinationType");
  if (v18 > 3)
    v19 = 100;
  else
    v19 = qword_10029EA90[v18];
  v20 = [MOPlace alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v26 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v20, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v21, v22, v23, v19, 0, 0, 0.0, 0.99, 0.0, -1.0, 2, 0, v24, v25);
  -[MOEventBundle setPlace:](v8, "setPlace:", v26);

  return v8;
}

- (id)generateDailyTripsFromBaseEvents:(id)a3 contextEvents:(id)a4 pregeneratedTripBundles:(id)a5 hometownReferenceLocations:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id os_log;
  NSObject *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double minimumHometownDistanceThreshold;
  id v38;
  NSObject *v39;
  uint64_t v40;
  objc_class *v41;
  NSString *v42;
  uint64_t v43;
  void *v44;
  double v45;
  const __CFString *v46;
  id v47;
  double v48;
  double v49;
  unsigned __int8 v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  uint64_t v61;
  objc_class *v62;
  NSString *v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  void *v67;
  id v68;
  uint64_t v69;
  objc_class *v70;
  NSString *v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  objc_class *v76;
  NSString *v77;
  void *v78;
  unsigned int v79;
  unint64_t v80;
  unint64_t v81;
  void *v82;
  id v83;
  NSObject *v84;
  uint64_t v85;
  objc_class *v86;
  NSString *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  objc_class *v92;
  NSString *v93;
  void *v94;
  id v95;
  uint64_t v96;
  objc_class *v97;
  NSString *v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  NSMutableDictionary *v102;
  id v103;
  id v104;
  void *j;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  NSObject *v115;
  uint64_t v116;
  objc_class *v117;
  NSString *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  void *k;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  id v132;
  NSObject *v133;
  uint64_t v134;
  objc_class *v135;
  NSString *v136;
  void *v137;
  id v138;
  id v139;
  NSObject *v140;
  uint64_t v141;
  objc_class *v142;
  NSString *v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  void *v148;
  NSObject *v150;
  id v151;
  NSMutableDictionary *v152;
  void *v153;
  void *v154;
  id v155;
  id obj;
  id v157;
  uint64_t v158;
  uint64_t v159;
  NSMutableDictionary *v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _BYTE v173[128];
  _BYTE v174[128];
  char v175[16];
  uint8_t v176[128];
  uint8_t buf[4];
  uint64_t v178;
  __int16 v179;
  double v180;
  __int16 v181;
  double v182;
  __int16 v183;
  double v184;
  __int16 v185;
  void *v186;

  v10 = a3;
  v151 = a4;
  v11 = a5;
  v157 = a6;
  v152 = objc_opt_new(NSMutableDictionary);
  v153 = v11;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class(self, v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = -[NSObject state](v12, "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject startDate](v12, "startDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v12, "endDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject promptLanguage](v12, "promptLanguage"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mask"));
    *(_DWORD *)buf = 138413314;
    v178 = (uint64_t)v18;
    v179 = 2048;
    v180 = *(double *)&v19;
    v181 = 2112;
    v182 = *(double *)&v20;
    v183 = 2112;
    v184 = *(double *)&v21;
    v185 = 2112;
    v186 = v23;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: current trip, state, %lu, startDate, %@, endDate, %@, string, %@", buf, 0x34u);

  }
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  obj = v10;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v176, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v170;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v170 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)i);
        if (v12)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)i), "startDate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v12, "endDate"));
          v31 = objc_msgSend(v29, "isBeforeDate:", v30);

          if ((v31 & 1) != 0)
            continue;
        }
        v32 = v12;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "routineEvent"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "location"));
        -[MOTripAnnotationManager distanceFromLocation:hometownReferenceLocations:](self, "distanceFromLocation:hometownReferenceLocations:", v34, v157);
        v36 = v35;

        minimumHometownDistanceThreshold = self->_minimumHometownDistanceThreshold;
        v38 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v41 = (objc_class *)objc_opt_class(self, v40);
          v42 = NSStringFromClass(v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          v44 = (void *)v43;
          v45 = self->_minimumHometownDistanceThreshold;
          *(_DWORD *)buf = 138413314;
          v46 = CFSTR("Away");
          if (v36 < minimumHometownDistanceThreshold)
            v46 = CFSTR("Home");
          v178 = v43;
          v179 = 2112;
          v180 = *(double *)&v46;
          v181 = 2048;
          v182 = v36;
          v183 = 2048;
          v184 = v45;
          v185 = 2112;
          v186 = v28;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@: new visit (%@), distance, %f, threshold, %f, %@", buf, 0x34u);

        }
        if (v36 < minimumHometownDistanceThreshold)
        {
          if (v12)
          {
            if (-[NSObject state](v12, "state") == (id)1)
            {
              -[MOTripAnnotationManager closeTrip:hometownReferenceLocations:contextEvents:](self, "closeTrip:hometownReferenceLocations:contextEvents:", v12, v157, v151);
              v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v12, "suggestionID"));
              -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v12, v72);

              v73 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v74 = objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
              {
                v76 = (objc_class *)objc_opt_class(self, v75);
                v77 = NSStringFromClass(v76);
                v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                *(_DWORD *)buf = 138412546;
                v178 = (uint64_t)v78;
                v179 = 2112;
                v180 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%@: hometown visit, close the previous trip, %@", buf, 0x16u);

              }
            }
          }
          else
          {
            v47 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            v32 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[MOTripAnnotationManager generateDailyTripsFromBaseEvents:contextEvents:pregeneratedTripBundles:hometownReferenceLocations:].cold.1((uint64_t)v175, (uint64_t)self);
          }
          v58 = 0;
          goto LABEL_48;
        }
        if (v12)
        {
          -[MOTripAnnotationManager distanceFromEvent:trip:](self, "distanceFromEvent:trip:", v28, v12);
          v49 = v48;
          v50 = -[MOTripAnnotationManager inSameCityOfEvent:trip:](self, "inSameCityOfEvent:trip:", v28, v12);
          if (v49 <= self->_minimumDistanceBetweenTripsThreshold || (v50 & 1) != 0)
          {
            v79 = -[MOTripAnnotationManager isSameDayOfEvent:trip:](self, "isSameDayOfEvent:trip:", v28, v12);
            v80 = -[MOTripAnnotationManager dayCountInTrip:](self, "dayCountInTrip:", v12);
            if (v80 < self->_maximumDayCountThreashold || (v79 & 1) != 0)
            {
              -[MOTripAnnotationManager addVisitEvent:toTripBundle:](self, "addVisitEvent:toTripBundle:", v28, v12);
              v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v12, "suggestionID"));
              -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v12, v94);

              v95 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v32 = objc_claimAutoreleasedReturnValue(v95);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                v97 = (objc_class *)objc_opt_class(self, v96);
                v98 = NSStringFromClass(v97);
                v99 = objc_claimAutoreleasedReturnValue(v98);
                v100 = (void *)v99;
                *(_DWORD *)buf = 138412802;
                v101 = CFSTR("Continue");
                if (v79)
                  v101 = CFSTR("SameDay");
                v178 = v99;
                v179 = 2112;
                v180 = *(double *)&v101;
                v181 = 2112;
                v182 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@: add to previous trip (%@), %@", buf, 0x20u);

              }
              v58 = v12;
              goto LABEL_48;
            }
            v81 = v80;
            if (-[NSObject state](v12, "state") == (id)1)
            {
              -[MOTripAnnotationManager closeTrip:hometownReferenceLocations:contextEvents:](self, "closeTrip:hometownReferenceLocations:contextEvents:", v12, v157, v151);
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v12, "suggestionID"));
              -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v12, v82);

              v83 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v84 = objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
              {
                v86 = (objc_class *)objc_opt_class(self, v85);
                v87 = NSStringFromClass(v86);
                v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
                *(_DWORD *)buf = 138412546;
                v178 = (uint64_t)v88;
                v179 = 2112;
                v180 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "%@: activate the new trip, %@", buf, 0x16u);

              }
            }
            v58 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager createTripWithVisitEvent:](self, "createTripWithVisitEvent:", v28));

            v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v58, "suggestionID"));
            -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v58, v89);

            v90 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            v32 = objc_claimAutoreleasedReturnValue(v90);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v92 = (objc_class *)objc_opt_class(self, v91);
              v93 = NSStringFromClass(v92);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v93);
              *(_DWORD *)buf = 138412802;
              v178 = (uint64_t)v64;
              v179 = 2048;
              v180 = *(double *)&v81;
              v181 = 2112;
              v182 = *(double *)&v58;
              v65 = v32;
              v66 = "%@: long trip, %lu, start the new trip, %@";
              goto LABEL_42;
            }
          }
          else
          {
            if (-[NSObject state](v12, "state") == (id)1)
            {
              -[MOTripAnnotationManager closeTrip:hometownReferenceLocations:contextEvents:](self, "closeTrip:hometownReferenceLocations:contextEvents:", v12, v157, v151);
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v12, "suggestionID"));
              -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v12, v51);

              v52 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                v55 = (objc_class *)objc_opt_class(self, v54);
                v56 = NSStringFromClass(v55);
                v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
                *(_DWORD *)buf = 138412546;
                v178 = (uint64_t)v57;
                v179 = 2112;
                v180 = *(double *)&v12;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%@: activate the new trip, %@", buf, 0x16u);

              }
            }
            v58 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager createTripWithVisitEvent:](self, "createTripWithVisitEvent:", v28));

            v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v58, "suggestionID"));
            -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v58, v59);

            v60 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            v32 = objc_claimAutoreleasedReturnValue(v60);
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              goto LABEL_48;
            v62 = (objc_class *)objc_opt_class(self, v61);
            v63 = NSStringFromClass(v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            *(_DWORD *)buf = 138412802;
            v178 = (uint64_t)v64;
            v179 = 2048;
            v180 = v49;
            v181 = 2112;
            v182 = *(double *)&v58;
            v65 = v32;
            v66 = "%@: long distance stride, %f, open new trip, %@";
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, v66, buf, 0x20u);

          }
        }
        else
        {
          v58 = objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager createTripWithVisitEvent:](self, "createTripWithVisitEvent:", v28));
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v58, "suggestionID"));
          -[NSMutableDictionary setObject:forKey:](v152, "setObject:forKey:", v58, v67);

          v68 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          v32 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v70 = (objc_class *)objc_opt_class(self, v69);
            v71 = NSStringFromClass(v70);
            v64 = (void *)objc_claimAutoreleasedReturnValue(v71);
            *(_DWORD *)buf = 138412802;
            v178 = (uint64_t)v64;
            v179 = 2048;
            v180 = v36;
            v181 = 2112;
            v182 = *(double *)&v58;
            v65 = v32;
            v66 = "%@: long distance from hometown, %f, open new trip, %@";
            goto LABEL_42;
          }
        }
LABEL_48:

        v12 = v58;
        continue;
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v176, 16);
    }
    while (v25);
  }
  v150 = v12;

  v102 = objc_opt_new(NSMutableDictionary);
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v155 = v153;
  v103 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
  v160 = v102;
  if (v103)
  {
    v104 = v103;
    v158 = *(_QWORD *)v166;
    do
    {
      for (j = 0; j != v104; j = (char *)j + 1)
      {
        if (*(_QWORD *)v166 != v158)
          objc_enumerationMutation(v155);
        v106 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)j);
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "suggestionID"));
        -[NSMutableDictionary setObject:forKey:](v102, "setObject:forKey:", v106, v107);

        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "events"));
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getBaseEvents:](self, "getBaseEvents:", v108));

        v110 = objc_msgSend(v109, "count");
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "events"));
        v112 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getContextEvents:](self, "getContextEvents:", v111));

        v113 = objc_msgSend(v112, "count");
        v114 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        v115 = objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          v117 = (objc_class *)objc_opt_class(self, v116);
          v118 = NSStringFromClass(v117);
          v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
          v120 = objc_msgSend(v106, "state");
          *(_DWORD *)buf = 138413314;
          v178 = (uint64_t)v119;
          v179 = 2048;
          v180 = *(double *)&v120;
          v181 = 2048;
          v182 = *(double *)&v110;
          v183 = 2048;
          v184 = *(double *)&v113;
          v185 = 2112;
          v186 = v106;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "%@: finalize bundles. pregenerated trip biundle, state, %lu, base events, %lu, context events, %lu, bundle, %@", buf, 0x34u);

          v102 = v160;
        }

      }
      v104 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
    }
    while (v104);
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v152, "allValues"));
  v121 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
  if (v121)
  {
    v122 = v121;
    v159 = *(_QWORD *)v162;
    do
    {
      for (k = 0; k != v122; k = (char *)k + 1)
      {
        if (*(_QWORD *)v162 != v159)
          objc_enumerationMutation(v154);
        v124 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)k);
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "suggestionID"));
        -[NSMutableDictionary setObject:forKey:](v102, "setObject:forKey:", v124, v125);

        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "events"));
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getBaseEvents:](self, "getBaseEvents:", v126));

        v128 = objc_msgSend(v127, "count");
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "events"));
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getContextEvents:](self, "getContextEvents:", v129));

        v131 = objc_msgSend(v130, "count");
        v132 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        v133 = objc_claimAutoreleasedReturnValue(v132);
        if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
        {
          v135 = (objc_class *)objc_opt_class(self, v134);
          v136 = NSStringFromClass(v135);
          v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
          v138 = objc_msgSend(v124, "state");
          *(_DWORD *)buf = 138413314;
          v178 = (uint64_t)v137;
          v179 = 2048;
          v180 = *(double *)&v138;
          v181 = 2048;
          v182 = *(double *)&v128;
          v183 = 2048;
          v184 = *(double *)&v131;
          v185 = 2112;
          v186 = v124;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_INFO, "%@: finalize bundles. new/updated trip biundle, state, %lu, base events, %lu, context events, %lu, bundle, %@", buf, 0x34u);

          v102 = v160;
        }

      }
      v122 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
    }
    while (v122);
  }

  v139 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v140 = objc_claimAutoreleasedReturnValue(v139);
  if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
  {
    v142 = (objc_class *)objc_opt_class(self, v141);
    v143 = NSStringFromClass(v142);
    v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
    v145 = -[NSMutableDictionary count](v102, "count");
    v146 = -[NSMutableDictionary count](v152, "count");
    v147 = -[NSMutableDictionary count](v102, "count");
    *(_DWORD *)buf = 138413058;
    v178 = (uint64_t)v144;
    v179 = 2048;
    v180 = *(double *)&v145;
    v181 = 2048;
    v182 = *(double *)&v146;
    v183 = 2048;
    v184 = *(double *)&v147;
    _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_INFO, "%@: previous trips, %lu, new trips, %lu, total trips, %lu", buf, 0x2Au);

  }
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v102, "allValues"));

  return v148;
}

- (void)closeTrip:(id)a3 hometownReferenceLocations:(id)a4 contextEvents:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  unsigned int v28;
  _BOOL4 v29;
  unsigned int v30;
  double minimumHometownDistanceThreshold;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  id os_log;
  NSObject *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  double minimumDurationThreshold;
  unint64_t minimumDayCountThreshold;
  double minimumHometownDistanceForTripThreshold;
  id v50;
  uint64_t v51;
  unsigned int v52;
  unint64_t v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  unint64_t v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  uint64_t v76;
  _QWORD v77[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), v12));
    v77[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v14));
    v77[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2));
    v17 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

    v54 = (void *)v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v17));

    -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:](self, "materializeTripBundle:contextEvents:updateWithFilteredEvents:", v8, v18, 0);
    -[MOTripAnnotationManager durationOfTrip:](self, "durationOfTrip:", v8);
    v20 = v19;
    v21 = -[MOTripAnnotationManager dayCountInTrip:](self, "dayCountInTrip:", v8);
    v22 = -[MOTripAnnotationManager visitCountInTrip:](self, "visitCountInTrip:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "events"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "location"));
    -[MOTripAnnotationManager distanceFromLocation:hometownReferenceLocations:](self, "distanceFromLocation:hometownReferenceLocations:", v25, v9);
    v27 = v26;

    v28 = -[MOTripAnnotationManager containInterestingCategoryInTrip:](self, "containInterestingCategoryInTrip:", v8);
    v29 = v20 < self->_minimumDurationThreshold
       || v22 < self->_minimumVisitCountThreshold
       || v27 < self->_minimumHometownDistanceForTripThreshold;
    if (v21 >= self->_minimumDayCountThreshold)
      v29 = 0;
    v53 = v21;
    v30 = v29 & ~v28;
    minimumHometownDistanceThreshold = self->_minimumHometownDistanceThreshold;
    v52 = v28;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));

    if (v27 < minimumHometownDistanceThreshold || v32 == 0)
      v34 = 1;
    else
      v34 = v30;
    objc_msgSend(v8, "setIsAggregatedAndSuppressed:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "placeName"));
    objc_msgSend(v8, "setPromptLanguage:", v36);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v38 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v40 = (objc_class *)objc_opt_class(self, v39);
      v41 = NSStringFromClass(v40);
      v50 = v9;
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v51 = v18;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionID"));
      if ((_DWORD)v34)
        v44 = CFSTR("suppressed");
      else
        v44 = CFSTR("created");
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptLanguage"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "mask"));
      minimumDurationThreshold = self->_minimumDurationThreshold;
      minimumDayCountThreshold = self->_minimumDayCountThreshold;
      minimumHometownDistanceForTripThreshold = self->_minimumHometownDistanceForTripThreshold;
      *(_DWORD *)buf = 138414850;
      v56 = v42;
      v57 = 2112;
      v58 = v43;
      v59 = 2112;
      v60 = v44;
      v61 = 2112;
      v62 = v46;
      v63 = 2048;
      v64 = v20;
      v65 = 2048;
      v66 = minimumDurationThreshold;
      v67 = 2048;
      v68 = v53;
      v69 = 2048;
      v70 = minimumDayCountThreshold;
      v71 = 2048;
      v72 = v27;
      v73 = 2048;
      v74 = minimumHometownDistanceForTripThreshold;
      v75 = 2048;
      v76 = v52;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@: trip, suggestionId : %@ is %@, label, %@, durationOfTrip, %f (>= %f), dayCount, %lu (>= %lu), distanceToHome, %f (>= %f), containsInterestingPOI, %lu", buf, 0x70u);

      v18 = v51;
      v9 = v50;
    }

    v10 = (id)v18;
  }

}

- (id)createTripWithVisitEvent:(id)a3
{
  id v3;
  MOEventBundle *v4;
  void *v5;
  void *v6;
  MOEventBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v3 = a3;
  v4 = [MOEventBundle alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v4, "initWithBundleIdentifier:creationDate:", v5, v6);

  -[MOEventBundle setInterfaceType:](v7, "setInterfaceType:", 13);
  -[MOEventBundle setBundleSuperType:](v7, "setBundleSuperType:", 1);
  -[MOEventBundle setBundleSubType:](v7, "setBundleSubType:", 105);
  -[MOEventBundle setSummarizationGranularity:](v7, "setSummarizationGranularity:", 2);
  v14 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  -[MOEventBundle setEvents:](v7, "setEvents:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  -[MOEventBundle setStartDate:](v7, "setStartDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  -[MOEventBundle setEndDate:](v7, "setEndDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEventBundle setExpirationDate:](v7, "setExpirationDate:", v12);

  -[MOEventBundle setIsAggregatedAndSuppressed:](v7, "setIsAggregatedAndSuppressed:", 1);
  -[MOEventBundle setPromptLanguage:](v7, "setPromptLanguage:", CFSTR("A place holder for a trip"));
  return v7;
}

- (void)addVisitEvent:(id)a3 toTripBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
    v18 = objc_opt_class(NSMutableArray, v17);
    isKindOfClass = objc_opt_isKindOfClass(v16, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
    v7 = v20;
    if ((isKindOfClass & 1) == 0)
    {
      v21 = objc_msgSend(v20, "mutableCopy");

      v7 = v21;
    }
    objc_msgSend(v7, "addObject:", v5);
    objc_msgSend(v6, "setEvents:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    objc_msgSend(v6, "setEndDate:", v22);

  }
}

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));

  return v8;
}

- (id)getTripEventBundles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 13));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));

  return v8;
}

- (id)getContextEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));

  return v8;
}

- (id)resourceFromWorkoutEvent:(id)a3
{
  id v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MOResource *v15;
  void *v16;

  v3 = a3;
  if (objc_msgSend(v3, "provider") == (id)1
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workoutType")), v4, v4))
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    objc_msgSend(v6, "timeIntervalSince1970");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, CFSTR("MOWorkoutMetaDataKeyStartDate"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    objc_msgSend(v8, "timeIntervalSince1970");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9, CFSTR("MOWorkoutMetaDataKeyEndDate"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workoutType"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, CFSTR("MOWorkoutMetaDataKeyActivityType"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workoutEvent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "isIndoors")));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, CFSTR("MOWorkoutMetaDataKeyIsIndoors"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, CFSTR("MOWorkoutMetaDataKeyWorkoutID"));

    }
    v15 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Workout"), 10, v5, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    -[MOResource setSourceEventIdentifier:](v15, "setSourceEventIdentifier:", v16);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)hometownReferenceLocations
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  id v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  NSMutableArray *v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = objc_opt_new(NSMutableArray);
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager routineManager](self, "routineManager"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke;
  v20[3] = &unk_1002AE1E8;
  v22 = &v23;
  v20[4] = self;
  v5 = v3;
  v21 = v5;
  objc_msgSend(v4, "fetchLocationsOfInterestOfType:withHandler:", 0, v20);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOTripAnnotationManager.m", 710, "-[MOTripAnnotationManager hometownReferenceLocations]"));
  v19 = 0;
  v7 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v5, &v19, v6, 30.0);
  v8 = v19;
  if (!v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOTripAnnotationManager hometownReferenceLocations].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

  }
  v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

void __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138412290;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location", v17));
        objc_msgSend(v10, "addObject:", v11);

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v17;
          v26 = v9;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "trip manager howmtown reference location, %@", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "routineManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke_205;
  v19[3] = &unk_1002AE1C0;
  v19[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 40);
  v16 = (id)v18;
  v20 = v18;
  objc_msgSend(v14, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v15, v19);

}

void __53__MOTripAnnotationManager_hometownReferenceLocations__block_invoke_205(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id os_log;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];

  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type", v19) == (id)1)
        {
          v10 = *(void **)(a1 + 32);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location"));
          objc_msgSend(v10, "distanceFromLocation:hometownReferenceLocations:", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          v13 = v12;

          objc_msgSend(*(id *)(a1 + 32), "maximumCommuteDistanceForTripThreshold");
          if (v13 < v14)
          {
            v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location"));
            objc_msgSend(v15, "addObject:", v16);

          }
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          v18 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v25 = v9;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "trip manager howmtown reference location, %@", buf, 0xCu);
          }

        }
        if (!objc_msgSend(v9, "type"))
          objc_msgSend(*(id *)(a1 + 32), "setupSummaryTripMonitorWithHomeLOI:", v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (double)distanceFromLocation:(id)a3 hometownReferenceLocations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && (v17 = 0u,
        v18 = 0u,
        v15 = 0u,
        v16 = 0u,
        (v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16)) != 0))
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        if (v13 < v11)
          v11 = v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1.79769313e308;
  }

  return v11;
}

- (double)maxDistanceFromEvent:(id)a3 events:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));

  if (v7 && objc_msgSend(v6, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location", (_QWORD)v20));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "location"));
          objc_msgSend(v15, "distanceFromLocation:", v16);
          v18 = v17;

          if (v18 > v12)
            v12 = v18;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0.0;
    }

  }
  else
  {
    v12 = 1.79769313e308;
  }

  return v12;
}

- (double)distanceFromEvent:(id)a3 trip:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));

  v8 = 1.79769313e308;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
    if (objc_msgSend(v9, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        v8 = 1.79769313e308;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location", (_QWORD)v21));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location"));
            objc_msgSend(v16, "distanceFromLocation:", v17);
            v19 = v18;

            if (v19 < v8)
              v8 = v19;
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }
      else
      {
        v8 = 1.79769313e308;
      }

    }
    else
    {
      v8 = 1.79769313e308;
    }

  }
  return v8;
}

- (BOOL)inSameCityOfEvent:(id)a3 trip:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  MOConfigurationManager *configurationManager;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("aboveDoorShortAddress");
  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("addressFormatting"), CFSTR("formatOption")));
    v11 = objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getStringSettingForKey:withFallback:](configurationManager, "getStringSettingForKey:withFallback:", v10, v8));

    v8 = (__CFString *)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formatLocalityWithFormatOption:", v8));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "category") == (id)1)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "formatLocalityWithFormatOption:", v8));
          v19 = objc_msgSend(v12, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {
            LOBYTE(v14) = 1;
            goto LABEL_14;
          }
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v14;
}

- (BOOL)isSameDayOfEvent:(id)a3 trip:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  if ((objc_msgSend(v8, "isBeforeDate:", v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v12 = objc_msgSend(v10, "isAfterDate:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeZone"));

  if (v17)
  {
    v18 = objc_alloc((Class)NSTimeZone);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "timeZone"));
    v21 = objc_msgSend(v18, "initWithName:", v20);

  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
  v13 = objc_msgSend(v22, "isSameDayWithDate:timeZone:", v23, v21);

LABEL_9:
  return v13;
}

- (double)durationOfTrip:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  NSSet *lessInterestingPoiCategories;
  void *v12;
  NSSet *airportCategories;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "category") == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
          LOBYTE(lessInterestingPoiCategories) = -[NSSet containsObject:](lessInterestingPoiCategories, "containsObject:", v12);

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
            LOBYTE(airportCategories) = -[NSSet containsObject:](airportCategories, "containsObject:", v14);

            if ((airportCategories & 1) == 0)
            {
              objc_msgSend(v10, "duration");
              v8 = v8 + v15;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (unint64_t)visitCountInTrip:(id)a3
{
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSSet *lessInterestingPoiCategories;
  void *v12;
  NSSet *airportCategories;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "category") == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
          LOBYTE(lessInterestingPoiCategories) = -[NSSet containsObject:](lessInterestingPoiCategories, "containsObject:", v12);

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
            LODWORD(airportCategories) = -[NSSet containsObject:](airportCategories, "containsObject:", v14);

            v7 += airportCategories ^ 1;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)containInterestingCategoryInTrip:(id)a3
{
  double v3;

  -[MOTripAnnotationManager interestingPOIDurationInTrip:](self, "interestingPOIDurationInTrip:", a3);
  return v3 > 0.0;
}

- (double)interestingPOIDurationInTrip:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  NSSet *interestingPoiCategories;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "category") == (id)1)
        {
          interestingPoiCategories = self->_interestingPoiCategories;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
          LODWORD(interestingPoiCategories) = -[NSSet containsObject:](interestingPoiCategories, "containsObject:", v12);

          if ((_DWORD)interestingPoiCategories)
          {
            objc_msgSend(v10, "duration");
            v8 = v8 + v13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)nonInterestingPOIDurationInTrip:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  NSSet *lessInterestingPoiCategories;
  void *v12;
  NSSet *airportCategories;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "category") == (id)1)
        {
          lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
          LOBYTE(lessInterestingPoiCategories) = -[NSSet containsObject:](lessInterestingPoiCategories, "containsObject:", v12);

          if ((lessInterestingPoiCategories & 1) == 0)
          {
            airportCategories = self->_airportCategories;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "poiCategory"));
            LOBYTE(airportCategories) = -[NSSet containsObject:](airportCategories, "containsObject:", v14);

            if ((airportCategories & 1) == 0)
            {
              objc_msgSend(v10, "duration");
              v8 = v8 + v15;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)dwellTimeOfEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "category") == (id)1)
        {
          objc_msgSend(v9, "duration");
          v7 = v7 + v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (unint64_t)dayCountInTrip:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char *v16;
  id os_log;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  char *v35;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));

  if (v6)
  {
    v7 = objc_alloc((Class)NSTimeZone);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = objc_msgSend(v7, "initWithName:", v9);

    objc_msgSend(v4, "setTimeZone:", v10);
  }
  v23 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v4, "rangeOfUnit:startDate:interval:forDate:", 16, &v23, 0, v11);
  v12 = v23;

  v22 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  objc_msgSend(v4, "rangeOfUnit:startDate:interval:forDate:", 16, &v22, 0, v13);
  v14 = v22;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v12, v14, 0));
  v16 = (char *)objc_msgSend(v15, "day") + 1;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v18 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    *(_DWORD *)buf = 138413570;
    v25 = v19;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    v34 = 2048;
    v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "trip manager (annotateBaseEvents) startDate, %@, endDate, %@, day in startDate, %@, day in endDate, %@, diff, %@, dayCount, %lu", buf, 0x3Eu);

  }
  return (unint64_t)v16;
}

- (void)materializeTripBundle:(id)a3 contextEvents:(id)a4 updateWithFilteredEvents:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MOAction *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  double v47;
  void *j;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  void *v56;
  unsigned __int8 v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *k;
  void *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  unsigned __int8 v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  void *v76;
  MODaemonUniverse *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  NSObject *v83;
  id v84;
  NSObject *v85;
  _BOOL4 v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  NSMutableSet *v94;
  id v95;
  void *v96;
  uint64_t v97;
  id obj;
  id v99;
  _QWORD v100[9];
  objc_super v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  NSMutableArray *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  NSMutableArray *v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[7];
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[24];
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  NSMutableArray *v146;
  _BYTE v147[128];
  uint8_t v148[128];
  _BYTE buf[24];
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _BYTE v153[128];
  id v154;

  v86 = a5;
  v6 = a3;
  v7 = a4;
  v88 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v96 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getBaseEvents:](self, "getBaseEvents:", v8));

  v154 = v88;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v154, 1));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10));

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager getContextEvents:](self, "getContextEvents:", v7));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class(self, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v89, "count");
    v18 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v16;
    if (v86)
      v18 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v150 = (uint64_t (*)(uint64_t, uint64_t))v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: Context Events, %lu, updateWithFilteredEvents, %@", buf, 0x20u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "timeZone"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "time"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v22));

  }
  else
  {
    v91 = 0;
  }
  v99 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("Trip to"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager dominantPlaceFromEvents:timeZone:](self, "dominantPlaceFromEvents:timeZone:", v92, v91));
  v87 = v23;
  if (v23)
  {
    v90 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "placeName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mask"));
    objc_msgSend(v99, "appendString:", v25);

    obj = &__NSArray0__struct;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager dominantPlacesFromEvents:timeZone:](self, "dominantPlacesFromEvents:timeZone:", v92, v91));
    v90 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    obj = v26;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v153, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v140;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v140 != v28)
            objc_enumerationMutation(obj);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)i), "placeName"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mask"));
          objc_msgSend(v99, "appendFormat:", CFSTR("%@, "), v31);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v153, 16);
      }
      while (v27);
    }

    if (!v90)
    {
      v84 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:].cold.1();

      v90 = 0;
      goto LABEL_53;
    }
  }
  if (!v86)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startDate"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "lastObject"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "endDate"));

    v36 = -[MOAction initWithActionName:actionType:]([MOAction alloc], "initWithActionName:actionType:", CFSTR("Visit"), 2);
    objc_msgSend(v96, "setAction:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "eventIdentifier"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "action"));
    objc_msgSend(v39, "setSourceEventIdentifier:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "startDate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v41, v42));
    objc_msgSend(v96, "setTime:", v43);

    objc_msgSend(v96, "setEvents:", v92);
    objc_msgSend(v96, "setPropertiesBasedOnEvents");
    objc_msgSend(v96, "setStartDate:", v33);
    objc_msgSend(v96, "setEndDate:", v35);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dateByAddingTimeInterval:", 2419200.0));
    objc_msgSend(v96, "setExpirationDate:", v44);

  }
  v45 = objc_msgSend(v99, "copy");
  objc_msgSend(v96, "setPromptLanguage:", v45);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v150 = __Block_byref_object_copy__4;
  v151 = __Block_byref_object_dispose__4;
  v152 = 0;
  v133 = 0;
  v134 = &v133;
  v135 = 0x3032000000;
  v136 = __Block_byref_object_copy__4;
  v137 = __Block_byref_object_dispose__4;
  v138 = 0;
  v127 = 0;
  v128 = &v127;
  v129 = 0x3032000000;
  v130 = __Block_byref_object_copy__4;
  v131 = __Block_byref_object_dispose__4;
  v132 = 0;
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke;
  v126[3] = &unk_1002AE210;
  v126[4] = &v127;
  v126[5] = buf;
  v126[6] = &v133;
  -[MOTripAnnotationManager resourcesFromEvents:handler:](self, "resourcesFromEvents:handler:", v92, v126);
  objc_msgSend(v96, "setResources:", v128[5]);
  v94 = objc_opt_new(NSMutableSet);
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v95 = v89;
  v46 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v122, v148, 16);
  if (v46)
  {
    v97 = *(_QWORD *)v123;
    v47 = 201.0;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(_QWORD *)v123 != v97)
          objc_enumerationMutation(v95);
        v49 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v49, "category") == (id)2)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "workoutType"));
          v51 = v50 == 0;

          if (!v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "endDate"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "startDate"));
            v54 = objc_msgSend(v52, "isBeforeDate:", v53);

            if ((v54 & 1) == 0)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "startDate"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "endDate"));
              v57 = objc_msgSend(v55, "isAfterDate:", v56);

              if ((v57 & 1) != 0)
                goto LABEL_47;
              v120 = 0u;
              v121 = 0u;
              v118 = 0u;
              v119 = 0u;
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "events"));
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v118, v147, 16);
              if (v59)
              {
                v60 = *(_QWORD *)v119;
                while (2)
                {
                  for (k = 0; k != v59; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v119 != v60)
                      objc_enumerationMutation(v58);
                    v62 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)k);
                    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "eventIdentifier"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "eventIdentifier"));
                    v65 = objc_msgSend(v63, "isEqual:", v64);

                    if ((v65 & 1) != 0)
                    {

                      goto LABEL_39;
                    }
                  }
                  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v118, v147, 16);
                  if (v59)
                    continue;
                  break;
                }
              }

              objc_msgSend(v96, "addEvent:", v49);
LABEL_39:
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "eventIdentifier"));
              v67 = -[NSMutableSet containsObject:](v94, "containsObject:", v66);

              if ((v67 & 1) == 0)
              {
                v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager resourceFromWorkoutEvent:](self, "resourceFromWorkoutEvent:", v49));
                v69 = v68;
                if (v68)
                {
                  objc_msgSend(v68, "setPriorityScore:", v47);
                  objc_msgSend(v96, "addResource:", v69);
                  v70 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
                  v71 = objc_claimAutoreleasedReturnValue(v70);
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                  {
                    v73 = (objc_class *)objc_opt_class(self, v72);
                    v74 = NSStringFromClass(v73);
                    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                    *(_DWORD *)v143 = 138412802;
                    *(_QWORD *)&v143[4] = v75;
                    *(_WORD *)&v143[12] = 2112;
                    *(_QWORD *)&v143[14] = v49;
                    *(_WORD *)&v143[22] = 2112;
                    v144 = (uint64_t (*)(uint64_t, uint64_t))v96;
                    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%@: add to context event %@ to trip, %@", v143, 0x20u);

                  }
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "eventIdentifier"));
                  -[NSMutableSet addObject:](v94, "addObject:", v76);

                  v47 = v47 + 1.0;
                }

              }
            }
          }
        }
      }
      v46 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v122, v148, 16);
    }
    while (v46);
  }
LABEL_47:

  *(_QWORD *)v143 = 0;
  *(_QWORD *)&v143[8] = v143;
  *(_QWORD *)&v143[16] = 0x3032000000;
  v144 = __Block_byref_object_copy__4;
  v145 = __Block_byref_object_dispose__4;
  v146 = objc_opt_new(NSMutableArray);
  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__4;
  v112 = __Block_byref_object_dispose__4;
  v113 = objc_opt_new(NSMutableArray);
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__4;
  v106 = __Block_byref_object_dispose__4;
  v107 = objc_opt_new(NSMutableArray);
  v101.receiver = self;
  v101.super_class = (Class)MOTripAnnotationManager;
  v77 = -[MOAnnotationManager fUniverse](&v101, "fUniverse");
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke_229;
  v100[3] = &unk_1002AE238;
  v100[4] = v143;
  v100[5] = &v114;
  v100[6] = &v108;
  v100[7] = buf;
  v100[8] = &v102;
  +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:universe:handler:](MOContextAnnotationUtilities, "addPhotoResourcesWithDateArray:universe:handler:", v96, v78, v100);

  v79 = -[MOTripAnnotationManager _assignPriorityScoreForPlace:placeInfoArray:](self, "_assignPriorityScoreForPlace:placeInfoArray:", v134[5], v103[5]);
  -[MOTripAnnotationManager _assignPriorityScoreForPhotoResources:](self, "_assignPriorityScoreForPhotoResources:", *(_QWORD *)(*(_QWORD *)&v143[8] + 40));
  objc_msgSend(v96, "setPlace:", v90);
  if (v134[5])
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "arrayByAddingObjectsFromArray:"));
    objc_msgSend(v96, "setPlaces:", v80);

  }
  else
  {
    objc_msgSend(v96, "setPlaces:", obj);
  }
  objc_msgSend(v96, "setResources:", *(_QWORD *)(*(_QWORD *)&v143[8] + 40));
  objc_msgSend(v96, "setPhotoSource:", v115[3]);
  v81 = objc_msgSend((id)v109[5], "copy");
  objc_msgSend(v96, "setPhotoTraits:", v81);

  v82 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v83 = objc_claimAutoreleasedReturnValue(v82);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:].cold.2();

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(v143, 8);

  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v133, 8);

  _Block_object_dispose(buf, 8);
LABEL_53:

}

void __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v10, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  }
  if (objc_msgSend(v8, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);

}

void __88__MOTripAnnotationManager_materializeTripBundle_contextEvents_updateWithFilteredEvents___block_invoke_229(_QWORD *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  const __CFString *v12;
  void *i;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  float v19;
  void *v20;
  void *j;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  id obj;
  id v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v46 = a2;
  v41 = a4;
  v43 = a7;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v45 = a1;
  obj = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v47)
  {
    v44 = *(_QWORD *)v59;
    v12 = CFSTR("kMOPlaceStartDate");
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v44)
          objc_enumerationMutation(obj);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "mutableCopy");
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v15 = v46;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v16)
        {
          v17 = v16;
          v48 = i;
          v49 = v14;
          v52 = 0;
          v53 = 0;
          v18 = *(_QWORD *)v55;
          v19 = 0.0;
          v20 = v43;
          v50 = *(_QWORD *)v55;
          v51 = v15;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(_QWORD *)v55 != v18)
                objc_enumerationMutation(v15);
              v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v22, "type") == (id)2)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", v53));
                v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));
                v25 = v12;
                v26 = v20;
                v27 = (void *)v24;
                if ((objc_msgSend(v23, "isOnOrAfter:", v24) & 1) != 0)
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMOPlaceEndDate")));
                  v29 = objc_msgSend(v23, "isOnOrBefore:", v28);

                  if (v29)
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "photoCurationScore"));
                    if (v30)
                    {
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "photoCurationScore"));
                      objc_msgSend(v31, "floatValue");
                      v19 = v19 + v32;

                    }
                    else
                    {
                      v19 = v19 + 0.5;
                    }
                    v33 = v26;
                    v12 = CFSTR("kMOPlaceStartDate");
                    v14 = v49;

                    v15 = v51;
                    ++v52;
                    v18 = v50;
                    v20 = v33;
                  }
                  else
                  {
                    v20 = v26;
                    v12 = CFSTR("kMOPlaceStartDate");
                    v14 = v49;
                    v18 = v50;
                    v15 = v51;
                  }
                }
                else
                {

                  v20 = v26;
                  v12 = v25;
                }
                ++v53;

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v17);

          if (v52)
            v19 = v19 / (float)v52;
          i = v48;
        }
        else
        {

          v19 = 0.0;
        }
        *(float *)&v34 = v19;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
        objc_msgSend(v14, "setObject:forKey:", v35, CFSTR("kPhotoCurationScore"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMOPlaceEndDate")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));
        objc_msgSend(v36, "timeIntervalSinceDate:", v37);
        v39 = v38;

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39));
        objc_msgSend(v14, "setObject:forKey:", v40, CFSTR("kEventDwellDuration"));

        objc_msgSend(v14, "removeObjectForKey:", v12);
        objc_msgSend(v14, "removeObjectForKey:", CFSTR("kMOPlaceEndDate"));
        objc_msgSend(*(id *)(*(_QWORD *)(v45[8] + 8) + 40), "addObject:", v14);

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v47);
  }

}

- (id)_assignPriorityScoreForPlace:(id)a3 placeInfoArray:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  dispatch_once_t *v25;
  void *v26;
  void *v27;
  id os_log;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  dispatch_once_t *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  id obj;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v6 = a3;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager _filterPlaceUsingPredicates:](self, "_filterPlaceUsingPredicates:", a4));
  v41 = v6;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = objc_msgSend(v6, "mutableCopy");
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v57;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v57 != v43)
          objc_enumerationMutation(obj);
        v46 = v7;
        v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v7);
        objc_msgSend(v8, "setPriorityScore:", 20000.0);
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v9 = v44;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v53 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));

              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
              v19 = objc_msgSend(v18, "isEqualToString:", v16);

              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v16));
                objc_msgSend(v8, "setPriorityScore:", (double)objc_msgSend(v20, "unsignedIntValue"));

                goto LABEL_16;
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_16:

        v7 = v46 + 1;
      }
      while ((id)(v46 + 1) != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v45);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = obj;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    v25 = &MOLogFacilityTripAnnotationManager;
    do
    {
      v26 = 0;
      v47 = v23;
      do
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v26);
        os_log = _mo_log_facility_get_os_log(v25);
        v29 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
          v32 = v24;
          v33 = v25;
          v34 = v21;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "placeName"));
          objc_msgSend(v27, "priorityScore");
          v37 = v36;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
          *(_DWORD *)buf = 138413314;
          v61 = v31;
          v62 = 2112;
          v63 = v35;
          v64 = 2048;
          v65 = v37;
          v66 = 2112;
          v67 = v38;
          v68 = 2112;
          v69 = v39;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "_assignPriorityScoreForPlace:MOPlace id is:%@, name is %@, priorityscore:%f, startdate:%@ enddate:%@", buf, 0x34u);

          v21 = v34;
          v25 = v33;
          v24 = v32;
          v23 = v47;

        }
        v26 = (char *)v26 + 1;
      }
      while (v23 != v26);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
    }
    while (v23);
  }

  return v21;
}

- (void)_assignPriorityScoreForPhotoResources:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  id v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type = %lu"), 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
    v21 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v9);
          v15 = (double)((unint64_t)i + v12 + 300);
          if (!((char *)i + v12))
            v15 = 100.0;
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "setPriorityScore:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v12 += (uint64_t)i;
      }
      while (v11);
    }

  }
}

- (id)_filterPlaceUsingPredicates:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  NSMutableArray *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  id v40;

  v5 = a3;
  if (!objc_msgSend((id)interestingPOIcategories, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOTripAnnotationManager _filterPlaceUsingPredicates:].cold.1(v7, v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTripAnnotationManager.m"), 1124, CFSTR("_filterPlaceUsingPredicates: interestingPOIcategories is empty (in %s:%d)"), "-[MOTripAnnotationManager _filterPlaceUsingPredicates:]", 1124);

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v11 = 0;
  v35 = objc_opt_new(NSMutableArray);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  do
  {
    switch(v11)
    {
      case 0:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore != 0 AND (kEventDwellDuration >= %f) AND kMOPlacePOICategory IN %@"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kPhotoCurationScore"), 0);
        v14 = 200;
        goto LABEL_17;
      case 1:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore != 0 AND (kEventDwellDuration < %f) AND kMOPlacePOICategory IN %@"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kPhotoCurationScore"), 0);
        goto LABEL_14;
      case 2:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore == 0 AND (kEventDwellDuration >= %f) AND kMOPlacePOICategory IN %@"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kEventDwellDuration"), 0);
        goto LABEL_14;
      case 3:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore == 0 AND (kEventDwellDuration < %f) AND kMOPlacePOICategory IN %@"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kEventDwellDuration"), 0);
        goto LABEL_14;
      case 4:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore != 0 AND (kEventDwellDuration >= %f) AND NOT (kMOPlacePOICategory IN %@)"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kPhotoCurationScore"), 0);
        v14 = 202;
        goto LABEL_17;
      case 5:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore != 0 AND (kEventDwellDuration < %f) AND NOT (kMOPlacePOICategory IN %@)"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kPhotoCurationScore"), 0);
LABEL_14:
        v13 = v15;
        break;
      case 6:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore == 0 AND (kEventDwellDuration >= %f) AND NOT (kMOPlacePOICategory IN %@)"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kEventDwellDuration"), 0);
        v14 = 300;
        goto LABEL_17;
      case 7:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("kPhotoCurationScore == 0 AND (kEventDwellDuration < %f) AND NOT (kMOPlacePOICategory IN %@)"), *(_QWORD *)&self->_minimumDwellTime, interestingPOIcategories));
        v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("kPhotoCurationScore"), 0);
        v14 = 20000;
LABEL_17:
        v27[3] = v14;
        break;
      default:
        v13 = 0;
        v12 = 0;
        break;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v12));
    v40 = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingDescriptors:", v17));

    if (objc_msgSend(v18, "count"))
    {
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = v27[3];
        *(_DWORD *)buf = 138412546;
        v37 = v18;
        v38 = 2048;
        v39 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "_filterPlaceUsingPredicates:sorted array is %@ and start priority score is %lu", buf, 0x16u);
      }

      v22 = v27[3];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = __55__MOTripAnnotationManager__filterPlaceUsingPredicates___block_invoke;
      v25[3] = &unk_1002AE260;
      v25[4] = &v30;
      v25[5] = &v26;
      -[MOTripAnnotationManager _updateMOPlacePriorityScore:priorityScore:handler:](self, "_updateMOPlacePriorityScore:priorityScore:handler:", v18, v22, v25);
    }

    ++v11;
  }
  while (v11 != 8);
  v23 = objc_msgSend((id)v31[5], "copy");
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v23;
}

id __55__MOTripAnnotationManager__filterPlaceUsingPredicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return result;
}

- (void)_updateMOPlacePriorityScore:(id)a3 priorityScore:(unint64_t)a4 handler:(id)a5
{
  id v7;
  void (**v8)(id, id, unint64_t);
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  void (**v19)(id, id, unint64_t);
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = (void (**)(id, id, unint64_t))a5;
  v9 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v19 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = objc_opt_new(NSMutableDictionary);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)i + a4));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMOPlaceUUID")));
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v17);

        -[NSMutableArray addObject:](v9, "addObject:", v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      a4 += (unint64_t)i;
    }
    while (v11);
    v8 = v19;
  }

  v18 = -[NSMutableArray copy](v9, "copy");
  v8[2](v8, v18, a4);

}

- (id)placeNameOfEvent:(id)a3 addressFormatOption:(id)a4 countryMode:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v5)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formatCountryWithFormatOption:", v8));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formatLocalityWithFormatOption:", v8));
  v10 = (void *)v9;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formatAdministrativeAreaWithFormatOption:", v8));
    if (!v10)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeName"));
  }

  return v10;
}

- (id)dominantPlaceFromEvents:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager dominantInterestingPOIFromEvents:timeZone:](self, "dominantInterestingPOIFromEvents:timeZone:", v6, v7));
  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager dominantPOIFormEvents:timeZone:](self, "dominantPOIFormEvents:timeZone:", v6, v7));

  return v8;
}

- (id)dominantInterestingPOIFromEvents:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSSet *airportCategories;
  void *v19;
  double v20;
  double v21;
  NSSet *interestingPoiCategories;
  void *v23;
  unsigned int v24;
  id os_log;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  const __CFString *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  NSMutableDictionary *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *i;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  MOPlace *v49;
  double v50;
  id v51;
  NSObject *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  unsigned __int8 v60;
  void *v61;
  id v62;
  int v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  double v68;
  MOPlace *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v78;
  double minimumDominancyRatioForInterestingPOITripThreshold;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  NSMutableDictionary *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  _BYTE v116[128];

  v6 = a3;
  v86 = a4;
  v87 = objc_opt_new(NSMutableDictionary);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
  if (!v8)
  {
    v49 = 0;
    v40 = v7;
LABEL_63:

    goto LABEL_64;
  }
  v9 = v8;
  v85 = 0;
  v10 = *(_QWORD *)v97;
  v11 = 0.0;
  v12 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
  v84 = v7;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v97 != v10)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "placeName"));
      if (v15)
      {
        v16 = *(Class *)((char *)&self->super.super.isa + v12[14]);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
        LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v17);

        if ((v16 & 1) == 0)
        {
          airportCategories = self->_airportCategories;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
          LOBYTE(airportCategories) = -[NSSet containsObject:](airportCategories, "containsObject:", v19);

          if ((airportCategories & 1) == 0)
          {
            objc_msgSend(v14, "weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:", v86, self->_overnightStartDateHour, self->_overnightDurationHours, self->_overnightDurationWeight);
            v21 = v20;
            interestingPoiCategories = self->_interestingPoiCategories;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
            v24 = -[NSSet containsObject:](interestingPoiCategories, "containsObject:", v23);

            os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            v26 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(double *)&v31 = COERCE_DOUBLE(CFSTR("NO"));
              if (v24)
                *(double *)&v31 = COERCE_DOUBLE(CFSTR("YES"));
              v82 = v31;
              objc_msgSend(v14, "duration");
              v33 = v32;
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routineEvent"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "poiCategory"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager addressFormatOption](self, "addressFormatOption"));
              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "formatLocalityWithFormatOption:", v35));
              *(_DWORD *)buf = 138413826;
              v103 = v15;
              v104 = 2112;
              v105 = *(double *)&v82;
              v106 = 2048;
              v107 = v33;
              v108 = 2048;
              v109 = v21;
              v110 = 2112;
              v111 = v81;
              v112 = 2112;
              v113 = v34;
              v114 = 2112;
              v115 = v80;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "trip manager (dominantInterestingPOIFromEvents), the dominant name, %@, interesting, %@, duration, %f, weighted duration, %f, category, %@ -%@, city, %@", buf, 0x48u);

              v12 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
            }
            v11 = v11 + v21;

            if (v24)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v87, "objectForKey:", v15));
              v28 = v27;
              v7 = v84;
              if (v27)
              {
                objc_msgSend(v27, "doubleValue");
                v21 = v21 + v29;
              }
              ++v85;
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
              -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v30, v15);

              v12 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
            }
            else
            {
              v7 = v84;
            }
          }
        }
      }

      v13 = (char *)v13 + 1;
    }
    while (v9 != v13);
    v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
    v9 = v36;
  }
  while (v36);

  if (v85)
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v37 = v87;
    v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    if (v38)
    {
      v39 = v38;
      v40 = 0;
      v41 = *(_QWORD *)v93;
      v42 = -1.0;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v93 != v41)
            objc_enumerationMutation(v37);
          v44 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v37, "objectForKey:", v44));
          objc_msgSend(v45, "doubleValue");
          v47 = v46;

          if (v47 > v42)
          {
            v48 = v44;

            v42 = v47;
            v40 = v48;
          }
        }
        v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      }
      while (v39);
    }
    else
    {
      v40 = 0;
      v42 = -1.0;
    }

    if (v11 <= 0.0)
      v50 = 0.0;
    else
      v50 = v42 / v11;
    v51 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mask"));
      minimumDominancyRatioForInterestingPOITripThreshold = self->_minimumDominancyRatioForInterestingPOITripThreshold;
      *(_DWORD *)buf = 138412802;
      v103 = v78;
      v104 = 2048;
      v105 = v50;
      v106 = 2048;
      v107 = minimumDominancyRatioForInterestingPOITripThreshold;
      _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "trip manager (dominantInterestingPOIFromEvents), the dominant name, %@, ratio, %f, threshold, %f", buf, 0x20u);

    }
    v7 = v84;
    if (v50 <= self->_minimumDominancyRatioForInterestingPOITripThreshold)
    {
      v49 = 0;
    }
    else
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v53 = v84;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v89;
LABEL_43:
        v57 = 0;
        while (1)
        {
          if (*(_QWORD *)v89 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "placeName"));
          v60 = objc_msgSend(v40, "isEqualToString:", v59);

          if ((v60 & 1) != 0)
            break;
          if (v55 == (id)++v57)
          {
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
            if (v55)
              goto LABEL_43;
            goto LABEL_49;
          }
        }
        v62 = v58;

        if (v62)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager addressFormatOption](self, "addressFormatOption"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "formatLocalityWithFormatOption:", v64));
          v63 = 0;
          goto LABEL_53;
        }
        v61 = 0;
        v63 = 1;
      }
      else
      {
LABEL_49:
        v61 = 0;
        v62 = 0;
        v63 = 1;
        v64 = v53;
LABEL_53:

      }
      v65 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mask"));
        v68 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "mask")));
        *(_DWORD *)buf = 138412546;
        v103 = v67;
        v104 = 2112;
        v105 = v68;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "trip manager (dominantInterestingPOIFromEvents), place name, %@, city name, %@", buf, 0x16u);

      }
      v69 = [MOPlace alloc];
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      if ((v63 & 1) != 0)
      {
        v49 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v69, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v70, v40, 0, 3, 0, 0, 0.0, v50, 0.0, -1.0, 2, 0, 0, 0);

        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "firstObject"));
      }
      else
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager addressFormatOption](self, "addressFormatOption"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "formatLocalityWithFormatOption:", v72));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "location"));
        objc_msgSend(v62, "familiarityIndexLOI");
        v49 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v69, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v70, v40, v73, 3, 0, v74, 0.0, v50, v75, -1.0, 2, 0, 0, 0);

        v71 = v62;
      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "eventIdentifier"));
      -[MOPlace setSourceEventIdentifier:](v49, "setSourceEventIdentifier:", v76);

      if (v63)
      v7 = v84;
    }
    goto LABEL_63;
  }
  v49 = 0;
LABEL_64:

  return v49;
}

- (id)dominantPOIFormEvents:(id)a3 timeZone:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  int *v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id os_log;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *j;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  double v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *k;
  void *v50;
  void *v51;
  unsigned int v52;
  MOPlace *v53;
  id v54;
  NSObject *v55;
  void *v56;
  MOPlace *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v67;
  double minimumDominancyRatioForSinglePOITripThreshold;
  id v69;
  id obj;
  __int128 v71;
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
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];

  v6 = a3;
  v69 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v80;
    v11 = 0.0;
    v12 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v80 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "placeName"));
        if (v15)
        {
          v16 = *(Class *)((char *)&self->super.super.isa + v12[14]);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
          LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v17);

          if ((v16 & 1) == 0)
          {
            objc_msgSend(v14, "weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:", v69, self->_overnightStartDateHour, self->_overnightDurationHours, self->_overnightDurationWeight);
            v19 = v18;
            v11 = v11 + v18;
            if (objc_msgSend(v14, "placeType") == (id)2 || objc_msgSend(v14, "placeType") == (id)3)
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v21 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v14, "duration");
                v27 = v26;
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routineEvent"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "poiCategory"));
                *(_DWORD *)buf = 138413314;
                v86 = v15;
                v87 = 2048;
                v88 = v27;
                v89 = 2048;
                v90 = v19;
                v91 = 2112;
                v92 = v28;
                v93 = 2112;
                v94 = v30;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "trip manager (dominantPOIFormEvents), the dominant name, %@, duration, %f, weighted duration, %f, category, %@ -%@", buf, 0x34u);

              }
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v15));
              v23 = v22;
              if (v22)
              {
                objc_msgSend(v22, "doubleValue");
                v19 = v19 + v24;
              }
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v25, v15);

              v12 = &OBJC_IVAR___MOEventBundleFetchOptions__ascending;
            }
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v31 = v7;
  v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v76;
    v36 = -1.0;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v76 != v35)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v31, "objectForKey:", v38));
        objc_msgSend(v39, "doubleValue");
        v41 = v40;

        if (v41 > v36)
        {
          v42 = v38;

          v36 = v41;
          v34 = v42;
        }
      }
      v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
    v36 = -1.0;
  }

  if (v11 <= 0.0)
    v43 = 0.0;
  else
    v43 = v36 / v11;
  v44 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mask"));
    minimumDominancyRatioForSinglePOITripThreshold = self->_minimumDominancyRatioForSinglePOITripThreshold;
    *(_DWORD *)buf = 138412802;
    v86 = v67;
    v87 = 2048;
    v88 = v43;
    v89 = 2048;
    v90 = minimumDominancyRatioForSinglePOITripThreshold;
    _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "trip manager (dominantPOIFormEvents), the dominant name, %@, ratio, %f, threshold, %f", buf, 0x20u);

  }
  if (v34 && v43 > self->_minimumDominancyRatioForSinglePOITripThreshold)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v46 = obj;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v72;
      while (2)
      {
        for (k = 0; k != v47; k = (char *)k + 1)
        {
          if (*(_QWORD *)v72 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)k);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "placeName"));
          v52 = objc_msgSend(v34, "isEqualToString:", v51);

          if (v52)
          {
            v47 = v50;
            goto LABEL_48;
          }
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        if (v47)
          continue;
        break;
      }
    }
LABEL_48:

    v54 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mask"));
      *(_DWORD *)buf = 138412290;
      v86 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "trip manager (dominantPOIFormEvents), place name, %@", buf, 0xCu);

    }
    v57 = [MOPlace alloc];
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    if (v47)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager addressFormatOption](self, "addressFormatOption"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "formatLocalityWithFormatOption:", v59));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "location"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "poiCategory"));
      objc_msgSend(v47, "familiarityIndexLOI");
      v53 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v57, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v58, v34, v60, 3, 0, v61, 0.0, v43, v63, -1.0, 2, v62, 0, 0);

      v64 = v47;
    }
    else
    {
      v53 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v57, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v58, v34, 0, 3, 0, 0, 0.0, v43, 0.0, -1.0, 2, 0, 0, 0);

      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "eventIdentifier"));
    -[MOPlace setSourceEventIdentifier:](v53, "setSourceEventIdentifier:", v65);

    if (!v47)
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (id)dominantPlacesFromEvents:(id)a3 timeZone:(id)a4
{
  return -[MOTripAnnotationManager dominantPlaceNamesFromEvents:countryMode:timeZone:](self, "dominantPlaceNamesFromEvents:countryMode:timeZone:", a3, 0, a4);
}

- (id)dominantPlaceNamesFromEvents:(id)a3 countryMode:(BOOL)a4 timeZone:(id)a5
{
  id v7;
  id os_log;
  NSObject *v9;
  __CFString *v10;
  MOConfigurationManager *configurationManager;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSSet *airportCategories;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  NSObject *v25;
  NSSet *lessInterestingPoiCategories;
  void *v27;
  id v28;
  NSSet *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  NSMutableDictionary *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  void *i;
  void *v48;
  void *v49;
  double v50;
  double v51;
  id v52;
  double v53;
  id v54;
  id v55;
  NSObject *v56;
  void *v57;
  BOOL v58;
  double v59;
  double v60;
  double v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  double v76;
  double v77;
  id v78;
  NSObject *v79;
  void *v80;
  NSMutableArray *v81;
  MOPlace *v82;
  void *v83;
  void *v84;
  MOPlace *v85;
  void *v86;
  void *v87;
  void *v89;
  id v90;
  NSMutableDictionary *v91;
  void *v92;
  id v93;
  _BOOL4 v94;
  NSMutableDictionary *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  id v105;
  __int16 v106;
  double v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  double v111;
  _BYTE v112[128];
  _BYTE v113[24];
  _BYTE v114[128];

  v94 = a4;
  v7 = a3;
  v90 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v105 = objc_msgSend(v7, "count");
    v106 = 2048;
    *(_QWORD *)&v107 = v94;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), events, %lu, country mode, %lu", buf, 0x16u);
  }

  v10 = CFSTR("aboveDoorShortAddress");
  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("addressFormatting"), CFSTR("formatOption")));
    v13 = objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getStringSettingForKey:withFallback:](configurationManager, "getStringSettingForKey:withFallback:", v12, v10));

    v10 = (__CFString *)v13;
  }
  v95 = objc_opt_new(NSMutableDictionary);
  v91 = objc_opt_new(NSMutableDictionary);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  v92 = v14;
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v101;
    do
    {
      v18 = 0;
      v93 = v16;
      do
      {
        if (*(_QWORD *)v101 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v18);
        airportCategories = self->_airportCategories;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiCategory"));
        LOBYTE(airportCategories) = -[NSSet containsObject:](airportCategories, "containsObject:", v21);

        if ((airportCategories & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager placeNameOfEvent:addressFormatOption:countryMode:](self, "placeNameOfEvent:addressFormatOption:countryMode:", v19, v10, v94));
          if (v22)
          {
            v23 = v17;
            v24 = v10;
            v25 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v95, "objectForKey:", v22));
            lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiCategory"));
            if (-[NSSet containsObject:](lessInterestingPoiCategories, "containsObject:", v27))
            {

              goto LABEL_17;
            }
            v29 = self->_airportCategories;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiCategory"));
            LODWORD(v29) = -[NSSet containsObject:](v29, "containsObject:", v30);

            if ((_DWORD)v29)
            {
LABEL_17:
              objc_msgSend(v19, "duration");
              v32 = v31 * self->_overnightDurationWeight;
            }
            else
            {
              objc_msgSend(v19, "weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:", v90, self->_overnightStartDateHour, self->_overnightDurationHours, self->_overnightDurationWeight);
              v32 = v33;
            }
            v10 = v24;
            v14 = v92;
            if (v25)
            {
              v17 = v23;
              -[NSObject doubleValue](v25, "doubleValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32 + v34));
              v36 = v95;
            }
            else
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
              -[NSMutableDictionary setObject:forKey:](v95, "setObject:forKey:", v37, v22);

              v17 = v23;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "location"));
              v36 = v91;
            }
            -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v35, v22);
            v16 = v93;

          }
          else
          {
            v28 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
            v25 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[MOTripAnnotationManager dominantPlaceNamesFromEvents:countryMode:timeZone:].cold.2((uint64_t)v113, (uint64_t)v19);
          }

        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    }
    while (v16);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v38 = v95;
  v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
  if (!v39)
  {

    v42 = 0;
    goto LABEL_52;
  }
  v40 = v39;
  v41 = 0;
  v42 = 0;
  v43 = *(_QWORD *)v97;
  v44 = 0.0;
  v45 = -1.0;
  v46 = -1.0;
  do
  {
    for (i = 0; i != v40; i = (char *)i + 1)
    {
      if (*(_QWORD *)v97 != v43)
        objc_enumerationMutation(v38);
      v48 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v38, "objectForKey:", v48));
      objc_msgSend(v49, "doubleValue");
      v51 = v50;

      if (v51 <= v45)
      {
        v53 = v51;
        v52 = v48;
        if (v51 <= v46)
          goto LABEL_35;
      }
      else
      {
        v52 = v41;

        v42 = v52;
        v41 = v48;
        v53 = v45;
        v45 = v51;
      }
      v54 = v48;

      v46 = v53;
      v42 = v52;
LABEL_35:
      v55 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "mask"));
        *(_DWORD *)buf = 138412546;
        v105 = v57;
        v106 = 2048;
        v107 = v51;
        _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "trip manager (dominantPlaceNameFromEvents), place, %@, dwell, %f", buf, 0x16u);

      }
      v44 = v44 + v51;

    }
    v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
  }
  while (v40);

  if (v41)
  {
    v58 = v44 <= 0.0;
    v59 = v46 / v44;
    if (v44 > 0.0)
      v60 = v45 / v44;
    else
      v60 = 0.0;
    if (v58)
      v61 = 0.0;
    else
      v61 = v59;
    v62 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mask"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mask"));
      *(_DWORD *)buf = 138413058;
      v105 = v64;
      v106 = 2048;
      v107 = v60;
      v108 = 2112;
      v109 = v65;
      v110 = 2048;
      v111 = v61;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), the dominant name, %@, ratio, %f, the second name, %@, ratio, %f", buf, 0x2Au);

    }
    v66 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v91, "objectForKey:", v41));
    if (v42)
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v91, "objectForKey:", v42));
    else
      v89 = 0;
    +[MOContextAnnotationUtilities weightedAverageForObjects:weightPath:valuePath:](MOContextAnnotationUtilities, "weightedAverageForObjects:weightPath:valuePath:", v92, CFSTR("duration"), CFSTR("familiarityIndexLOI"));
    v77 = v76;
    v78 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mask"));
      *(_DWORD *)buf = 138412546;
      v105 = v80;
      v106 = 2048;
      *(_QWORD *)&v107 = v94;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "trip manager (dominantPlaceNameFromEvents), place name, %@, country mode, %lu", buf, 0x16u);

    }
    v81 = objc_opt_new(NSMutableArray);
    v82 = -[MOPlace initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:]([MOPlace alloc], "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:", v41, 100, 0, v66, 2, 0, 0.0, v60, v77);
    -[MOPlace setPriorityScore:](v82, "setPriorityScore:", 20000.0);
    -[MOPlace setEnclosingArea:](v82, "setEnclosingArea:", v41);
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "eventIdentifier"));
    -[MOPlace setSourceEventIdentifier:](v82, "setSourceEventIdentifier:", v84);

    -[NSMutableArray addObject:](v81, "addObject:", v82);
    if (v42)
    {
      v85 = -[MOPlace initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:]([MOPlace alloc], "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:", v42, 100, 0, v89, 2, 0, 0.0, v61, v77);

      -[MOPlace setPriorityScore:](v85, "setPriorityScore:", 20000.0);
      -[MOPlace setEnclosingArea:](v85, "setEnclosingArea:", v41);
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "eventIdentifier"));
      -[MOPlace setSourceEventIdentifier:](v85, "setSourceEventIdentifier:", v87);

      -[NSMutableArray addObject:](v81, "addObject:", v85);
      v82 = v85;
    }
    v75 = -[NSMutableArray copy](v81, "copy");

    v14 = v92;
    goto LABEL_61;
  }
  v14 = v92;
LABEL_52:
  v67 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v66 = objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    -[MOTripAnnotationManager dominantPlaceNamesFromEvents:countryMode:timeZone:].cold.1(v66, v68, v69, v70, v71, v72, v73, v74);
  v41 = 0;
  v75 = &__NSArray0__struct;
LABEL_61:

  return v75;
}

- (void)resourcesFromEvents:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id os_log;
  NSObject *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  MOResource *v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableDictionary *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  objc_class *v52;
  NSString *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  NSString *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void (**v64)(id, NSMutableArray *, NSMutableArray *, NSMutableArray *);
  NSMutableArray *v65;
  NSMutableArray *v66;
  id v67;
  MOTripAnnotationManager *v68;
  NSMutableArray *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  NSObject *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];

  v6 = a3;
  v64 = (void (**)(id, NSMutableArray *, NSMutableArray *, NSMutableArray *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObjectsFromSet:](self->_airportCategories, "setByAddingObjectsFromSet:", self->_lessInterestingPoiCategories));
  v69 = objc_opt_new(NSMutableArray);
  v66 = objc_opt_new(NSMutableArray);
  v65 = objc_opt_new(NSMutableArray);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v9)
  {
    v10 = v9;
    v70 = *(_QWORD *)v72;
    v67 = v8;
    v68 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v70)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routineEvent"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "poiCategory"));
        if (objc_msgSend(v7, "containsObject:", v14))
        {

LABEL_9:
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          v18 = objc_claimAutoreleasedReturnValue(os_log);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            goto LABEL_24;
          v20 = (objc_class *)objc_opt_class(self, v19);
          v21 = NSStringFromClass(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mask](v23, "mask"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "poiCategory"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routineEvent"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "poiCategory"));
          *(_DWORD *)buf = 138413058;
          v76 = v22;
          v77 = 2112;
          v78 = v24;
          v79 = 2112;
          v80 = v25;
          v81 = 2112;
          v82 = v27;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: supress resource, place, %@, category, %@ (%@)", buf, 0x2Au);

          self = v68;
          v8 = v67;

LABEL_20:
          goto LABEL_23;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "poiCategory"));
        v16 = objc_msgSend(v7, "containsObject:", v15);

        if (v16)
          goto LABEL_9;
        -[MOTripAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold");
        v29 = v28;
        -[MOTripAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
        v31 = v30;
        -[MOTripAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
        v33 = v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
        v18 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "placeFromVisitEvent:preferredCategories:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v12, 0, v7, v34, v29, v31, v33));

        if (!v18)
        {
          v50 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
          v22 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v52 = (objc_class *)objc_opt_class(self, v51);
            v53 = NSStringFromClass(v52);
            v23 = objc_claimAutoreleasedReturnValue(v53);
            *(_DWORD *)buf = 138412546;
            v76 = v23;
            v77 = 2112;
            v78 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@: resourcesFromBaseEvents, place is null, event, %@", buf, 0x16u);
            goto LABEL_20;
          }
LABEL_23:

          goto LABEL_24;
        }
        -[NSMutableArray addObject:](v69, "addObject:", v18);
        v35 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v57 = (objc_class *)objc_opt_class(self, v37);
          v58 = NSStringFromClass(v57);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject placeName](v18, "placeName"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mask"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeMapItem"));
          v63 = objc_msgSend(v62, "length");
          *(_DWORD *)buf = 138412802;
          v76 = v59;
          v77 = 2112;
          v78 = v61;
          v79 = 2048;
          v80 = v63;
          _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);

          v8 = v67;
          self = v68;

        }
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeMapItem"));
        if (v38)
        {
          v39 = (void *)v38;
          v40 = -[NSObject placeUserType](v18, "placeUserType");

          if (v40 != (id)2)
          {
            v41 = [MOResource alloc];
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject placeName](v18, "placeName"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeMapItem"));
            v22 = -[MOResource initWithName:mapItemHandle:priorityScore:](v41, "initWithName:mapItemHandle:priorityScore:", v42, v43, -1.0);

            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
            -[NSObject setSourceEventIdentifier:](v22, "setSourceEventIdentifier:", v44);

            -[NSMutableArray addObject:](v65, "addObject:", v22);
            v45 = objc_opt_new(NSMutableDictionary);
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v18, "identifier"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "UUIDString"));
            -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v47, CFSTR("kMOPlaceUUID"));

            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject poiCategory](v18, "poiCategory"));
            if (v48)
              v49 = objc_claimAutoreleasedReturnValue(-[NSObject poiCategory](v18, "poiCategory"));
            else
              v49 = objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
            v54 = (void *)v49;
            self = v68;

            -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v54, CFSTR("kMOPlacePOICategory"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
            -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v55, CFSTR("kMOPlaceStartDate"));

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
            -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v56, CFSTR("kMOPlaceEndDate"));

            -[NSMutableArray addObject:](v66, "addObject:", v45);
            v8 = v67;
            goto LABEL_23;
          }
        }
LABEL_24:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v10);
  }

  v64[2](v64, v65, v69, v66);
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeName"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeName"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trip to %@"), v7));

  }
  else
  {
    v8 = CFSTR("Trip");
  }

  return v8;
}

- (id)loadSummaryTripMonitorFromStore:(id)a3
{
  id v4;
  void *v5;
  id os_log;
  NSObject *v7;
  uint64_t v8;
  MOFSM *v9;
  id v10;
  NSObject *v11;
  MOFSM *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  if (v4
    && (v14[0] = _NSConcreteStackBlock,
        v14[1] = 3221225472,
        v14[2] = __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke,
        v14[3] = &unk_1002AE288,
        v14[4] = self,
        v14[5] = &v15,
        objc_msgSend(v4, "fetchFSMWithName:CompletionHandler:", CFSTR("SummaryTripMonitor"), v14),
        v16[5]))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v16[5];
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "load fsm model, %@", buf, 0xCu);
    }

    v9 = (MOFSM *)(id)v16[5];
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No existing fsm. Return newmodel.", buf, 2u);
    }

    v9 = -[MOFSM initWithName:]([MOFSM alloc], "initWithName:", CFSTR("SummaryTripMonitor"));
  }
  v12 = v9;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;

  v6 = a2;
  v7 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke_cold_1(a1, (uint64_t)v7, v9);

  }
}

- (void)updateSummaryTripMonitor:(id)a3
{
  id v4;
  void *v5;
  id os_log;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager fsmStore](self, "fsmStore"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saving fsm model, %@", buf, 0xCu);
    }

    v9 = objc_msgSend(v4, "copy");
    objc_msgSend(v9, "cleanUpBeforeUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager fsmStore](self, "fsmStore"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke;
    v18[3] = &unk_1002AE2B0;
    v19 = v9;
    v8 = v9;
    objc_msgSend(v10, "updateFSM:completionHandler:", v8, v18);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MOTripAnnotationManager updateSummaryTripMonitor:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "saved fsm model, %@", (uint8_t *)&v14, 0xCu);
  }

}

- (void)setupSummaryTripMonitorWithHomeLOI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "countryCode"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM countryFromAddress:](MOFSM, "countryFromAddress:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM countryCodeFromAddress:](MOFSM, "countryCodeFromAddress:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "address"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM stateFromAddress:](MOFSM, "stateFromAddress:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "address"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM stateCodeFromAddress:](MOFSM, "stateCodeFromAddress:", v17));

    if (-[NSSet containsObject:](self->_stateStateTripEligibleCountries, "containsObject:", v12) && v18 != 0)
      v19 = 2;
    else
      v19 = 1;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor"));
    objc_msgSend(v20, "setMode:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOTripAnnotationManager summaryTripMonitor](self, "summaryTripMonitor"));
    objc_msgSend(v21, "setReferenceDataWithCountry:countryCode:state:stateCode:", v9, v12, v15, v18);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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

- (MOFSMStore)fsmStore
{
  return self->_fsmStore;
}

- (void)setFsmStore:(id)a3
{
  objc_storeStrong((id *)&self->_fsmStore, a3);
}

- (MOFSM)summaryTripMonitor
{
  return self->_summaryTripMonitor;
}

- (void)setSummaryTripMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_summaryTripMonitor, a3);
}

- (unint64_t)significantLOIMinimumVisitsThreshold
{
  return self->_significantLOIMinimumVisitsThreshold;
}

- (void)setSignificantLOIMinimumVisitsThreshold:(unint64_t)a3
{
  self->_significantLOIMinimumVisitsThreshold = a3;
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

- (double)minimumDwellTime
{
  return self->_minimumDwellTime;
}

- (void)setMinimumDwellTime:(double)a3
{
  self->_minimumDwellTime = a3;
}

- (double)minimumHometownDistanceThreshold
{
  return self->_minimumHometownDistanceThreshold;
}

- (void)setMinimumHometownDistanceThreshold:(double)a3
{
  self->_minimumHometownDistanceThreshold = a3;
}

- (double)minimumHometownDistanceForTripThreshold
{
  return self->_minimumHometownDistanceForTripThreshold;
}

- (void)setMinimumHometownDistanceForTripThreshold:(double)a3
{
  self->_minimumHometownDistanceForTripThreshold = a3;
}

- (double)maximumCommuteDistanceForTripThreshold
{
  return self->_maximumCommuteDistanceForTripThreshold;
}

- (void)setMaximumCommuteDistanceForTripThreshold:(double)a3
{
  self->_maximumCommuteDistanceForTripThreshold = a3;
}

- (double)minimumDistanceBetweenTripsThreshold
{
  return self->_minimumDistanceBetweenTripsThreshold;
}

- (void)setMinimumDistanceBetweenTripsThreshold:(double)a3
{
  self->_minimumDistanceBetweenTripsThreshold = a3;
}

- (double)minimumDurationThreshold
{
  return self->_minimumDurationThreshold;
}

- (void)setMinimumDurationThreshold:(double)a3
{
  self->_minimumDurationThreshold = a3;
}

- (unint64_t)minimumDayCountThreshold
{
  return self->_minimumDayCountThreshold;
}

- (void)setMinimumDayCountThreshold:(unint64_t)a3
{
  self->_minimumDayCountThreshold = a3;
}

- (unint64_t)maximumDayCountThreashold
{
  return self->_maximumDayCountThreashold;
}

- (void)setMaximumDayCountThreashold:(unint64_t)a3
{
  self->_maximumDayCountThreashold = a3;
}

- (unint64_t)minimumVisitCountThreshold
{
  return self->_minimumVisitCountThreshold;
}

- (void)setMinimumVisitCountThreshold:(unint64_t)a3
{
  self->_minimumVisitCountThreshold = a3;
}

- (double)minimumDominancyRatioForSinglePOITripThreshold
{
  return self->_minimumDominancyRatioForSinglePOITripThreshold;
}

- (void)setMinimumDominancyRatioForSinglePOITripThreshold:(double)a3
{
  self->_minimumDominancyRatioForSinglePOITripThreshold = a3;
}

- (double)minimumDominancyRatioForInterestingPOITripThreshold
{
  return self->_minimumDominancyRatioForInterestingPOITripThreshold;
}

- (void)setMinimumDominancyRatioForInterestingPOITripThreshold:(double)a3
{
  self->_minimumDominancyRatioForInterestingPOITripThreshold = a3;
}

- (NSString)addressFormatOption
{
  return self->_addressFormatOption;
}

- (void)setAddressFormatOption:(id)a3
{
  objc_storeStrong((id *)&self->_addressFormatOption, a3);
}

- (double)overnightStartDateHour
{
  return self->_overnightStartDateHour;
}

- (void)setOvernightStartDateHour:(double)a3
{
  self->_overnightStartDateHour = a3;
}

- (double)overnightDurationHours
{
  return self->_overnightDurationHours;
}

- (void)setOvernightDurationHours:(double)a3
{
  self->_overnightDurationHours = a3;
}

- (double)overnightDurationWeight
{
  return self->_overnightDurationWeight;
}

- (void)setOvernightDurationWeight:(double)a3
{
  self->_overnightDurationWeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFormatOption, 0);
  objc_storeStrong((id *)&self->_summaryTripMonitor, 0);
  objc_storeStrong((id *)&self->_fsmStore, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateStateTripEligibleCountries, 0);
  objc_storeStrong((id *)&self->_interestingPoiCategories, 0);
  objc_storeStrong((id *)&self->_airportCategories, 0);
  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)_performAnnotationWithEvents:(uint64_t)a3 withPatternEvents:(uint64_t)a4 eventBundles:(uint64_t)a5 handler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "The hometown location is empty.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)generateDailyTripsFromBaseEvents:(uint64_t)a1 contextEvents:(uint64_t)a2 pregeneratedTripBundles:hometownReferenceLocations:.cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;

  v5 = OUTLINED_FUNCTION_4_0(a1, a2);
  v7 = (objc_class *)objc_opt_class(v5, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  *(_DWORD *)v4 = 138412290;
  *v3 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@: hometown visit, no open trip session", v4, 0xCu);

}

- (void)hometownReferenceLocations
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Semaphore wait failed with context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)materializeTripBundle:contextEvents:updateWithFilteredEvents:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v0, (uint64_t)v0, "trip manager (materializeTripBundle with updateWithFilteredEvents=%i) fails to yield a name, bundle, %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)materializeTripBundle:contextEvents:updateWithFilteredEvents:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "trip manager (materializeTripBundle with updateWithFilteredEvents=%i) eventBundle, %@", v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_filterPlaceUsingPredicates:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v3 = 136315394;
  v4 = "-[MOTripAnnotationManager _filterPlaceUsingPredicates:]";
  v5 = 1024;
  v6 = 1124;
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, a1, a3, "_filterPlaceUsingPredicates: interestingPOIcategories is empty (in %s:%d)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)dominantPlaceNamesFromEvents:(uint64_t)a3 countryMode:(uint64_t)a4 timeZone:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "trip manager (dominantPlaceNameFromEvents), fails to yield the dominant name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)dominantPlaceNamesFromEvents:(uint64_t)a1 countryMode:(uint64_t)a2 timeZone:.cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mask"));
  *(_DWORD *)v4 = 138412290;
  *v3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "trip manager (dominantPlaceNameFromEvents), address is not available, address, %@", v4, 0xCu);

}

void __59__MOTripAnnotationManager_loadSummaryTripMonitorFromStore___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;

  v5 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 32), a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = 138412802;
  v9 = v7;
  v10 = 2112;
  v11 = CFSTR("SummaryTripMonitor");
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: fetchFSMWithName, %@, error, %@", (uint8_t *)&v8, 0x20u);

}

- (void)updateSummaryTripMonitor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "saving fsm model failed, error, store is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

void __52__MOTripAnnotationManager_updateSummaryTripMonitor___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "saving fsm model failed, error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
