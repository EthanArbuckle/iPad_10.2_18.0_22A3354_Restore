@implementation RTLearnedLocationEngine

- (RTLearnedLocationEngine)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_biomeManager_contactsManager_dailyTrainingSessionCounter_defaultsManager_diagnostics_distanceCalculator_elevationManager_eventManager_fingerprintManager_learnedLocationStore_learnedPlaceTypeInferenceStore_locationManager_locationStore_mapServiceManager_mapsSupportManager_metricManager_motionActivityManager_placeInferenceQueryStore_platform_pointOfInterestMetricsManager_portraitManager_reconcilerPerVisit_reconcilerPerDevice_settledStateTransitionStore_transitMetricManager_tripSegmentProvider_visitManager_xpcActivityManager_);
}

- (RTLearnedLocationEngine)initWithAccountManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 dailyTrainingSessionCounter:(id)a6 defaultsManager:(id)a7 diagnostics:(id)a8 distanceCalculator:(id)a9 elevationManager:(id)a10 eventManager:(id)a11 fingerprintManager:(id)a12 learnedLocationStore:(id)a13 learnedPlaceTypeInferenceStore:(id)a14 locationManager:(id)a15 locationStore:(id)a16 mapServiceManager:(id)a17 mapsSupportManager:(id)a18 metricManager:(id)a19 motionActivityManager:(id)a20 placeInferenceQueryStore:(id)a21 platform:(id)a22 pointOfInterestMetricsManager:(id)a23 portraitManager:(id)a24 reconcilerPerVisit:(id)a25 reconcilerPerDevice:(id)a26 settledStateTransitionStore:(id)a27 transitMetricManager:(id)a28 tripSegmentProvider:(id)a29 visitManager:(id)a30 xpcActivityManager:(id)a31
{
  id v36;
  void *v37;
  RTLearnedLocationEngine *v38;
  RTLearnedLocationEngine *v39;
  RTLearnedLocationEngine *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  NSObject *v44;
  RTLearnedLocationEngine *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  RTLearnedLocationEngine *v55;
  id v57;
  dispatch_queue_t v58;
  OS_dispatch_queue *queue;
  RTPlaceTypeClassifierMetricsCalculator *v60;
  RTPlaceTypeClassifierMetricsCalculator *placeTypeClassifierMetricsCalculator;
  id obj;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  objc_super v100;
  uint8_t buf[16];

  obj = a3;
  v99 = a3;
  v63 = a4;
  v36 = a4;
  v64 = a5;
  v82 = a5;
  v65 = a6;
  v98 = a6;
  v66 = a7;
  v97 = a7;
  v68 = a8;
  v96 = a8;
  v75 = a9;
  v95 = a10;
  v94 = a11;
  v67 = a12;
  v93 = a12;
  v69 = a13;
  v92 = a13;
  v91 = a14;
  v90 = a15;
  v89 = a16;
  v88 = a17;
  v87 = a18;
  v74 = a19;
  v86 = a20;
  v85 = a21;
  v84 = a22;
  v83 = a23;
  v81 = a24;
  v80 = a25;
  v79 = a26;
  v78 = a27;
  v73 = a28;
  v72 = a29;
  v77 = a30;
  v76 = a31;
  if (!v99)
  {
    v43 = v36;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountManager", buf, 2u);
    }

    v45 = 0;
    v46 = 0;
    goto LABEL_34;
  }
  v70 = v36;
  if (!v36)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      v45 = 0;
      v46 = v99;
      v43 = v70;
LABEL_34:
      v37 = v82;
LABEL_73:
      v52 = v74;
      v51 = v75;
      v54 = v72;
      v53 = v73;
      v55 = self;
      goto LABEL_74;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: biomeManager";
LABEL_48:
    _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_33;
  }
  v37 = v82;
  if (!v82)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: contactsManager";
LABEL_71:
    _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, v49, buf, 2u);
    goto LABEL_72;
  }
  if (!v98)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: dailyTrainingSessionCounter";
    goto LABEL_71;
  }
  if (!v97)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_71;
  }
  if (!v96)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_71;
  }
  if (!v95)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: elevationManager";
    goto LABEL_71;
  }
  if (!v94)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: eventManager";
    goto LABEL_71;
  }
  if (!v93)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_71;
  }
  if (!v92)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_71;
  }
  if (!v91)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
    goto LABEL_71;
  }
  if (!v90)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_71;
  }
  if (!v89)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: locationStore";
    goto LABEL_71;
  }
  if (!v88)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_71;
  }
  if (!v87)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: mapsSupportManager";
    goto LABEL_71;
  }
  if (!v86)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_71;
  }
  if (!v85)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_71;
  }
  if (!v84)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: platform";
    goto LABEL_71;
  }
  if (!v83)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v49 = "Invalid parameter not satisfying: pointOfInterestMetricsManager";
      goto LABEL_71;
    }
LABEL_72:

    v45 = 0;
    v46 = v99;
    v43 = v70;
    goto LABEL_73;
  }
  if (!v81)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: portraitManager";
    goto LABEL_48;
  }
  if (!v80)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: reconcilerPerVisit";
    goto LABEL_48;
  }
  if (!v79)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: reconcilerPerDevice";
    goto LABEL_48;
  }
  if (!v78)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: settledStateTransitionStore";
    goto LABEL_48;
  }
  if (!v77)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_48;
  }
  if (!v76)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: xpcActivityManager";
    goto LABEL_48;
  }
  v100.receiver = self;
  v100.super_class = (Class)RTLearnedLocationEngine;
  v38 = -[RTLearnedLocationEngine init](&v100, sel_init);
  v39 = v38;
  if (v38)
  {
    v40 = v38;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = (const char *)-[RTLearnedLocationEngine UTF8String](objc_retainAutorelease(v40), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v40, obj, v63, a5, a6, a7, a12, a8, a13);
      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v42 = (const char *)objc_msgSend(v57, "UTF8String");

    }
    v58 = dispatch_queue_create(v42, v41);

    queue = v40->_queue;
    v40->_queue = (OS_dispatch_queue *)v58;

    objc_storeStrong((id *)&v40->_accountManager, obj);
    objc_storeStrong((id *)&v40->_biomeManager, v63);
    objc_storeStrong((id *)&v40->_contactsManager, v64);
    objc_storeStrong((id *)&v40->_dailyTrainingSessionCounter, v65);
    objc_storeStrong((id *)&v40->_defaultsManager, v66);
    objc_storeStrong((id *)&v40->_diagnostics, v68);
    objc_storeStrong((id *)&v40->_distanceCalculator, a9);
    objc_storeStrong((id *)&v40->_elevationManager, a10);
    objc_storeStrong((id *)&v40->_eventManager, a11);
    objc_storeStrong((id *)&v40->_fingerprintManager, v67);
    objc_storeStrong((id *)&v40->_learnedLocationStore, v69);
    objc_storeStrong((id *)&v40->_learnedPlaceTypeInferenceStore, a14);
    objc_storeStrong((id *)&v40->_locationManager, a15);
    objc_storeStrong((id *)&v40->_locationStore, a16);
    objc_storeStrong((id *)&v40->_mapServiceManager, a17);
    objc_storeStrong((id *)&v40->_mapsSupportManager, a18);
    objc_storeStrong((id *)&v40->_metricManager, a19);
    v60 = -[RTPlaceTypeClassifierMetricsCalculator initWithDistanceCalculator:learnedLocationStore:learnedPlaceTypeInferenceStore:metricManager:]([RTPlaceTypeClassifierMetricsCalculator alloc], "initWithDistanceCalculator:learnedLocationStore:learnedPlaceTypeInferenceStore:metricManager:", v40->_distanceCalculator, v40->_learnedLocationStore, v40->_learnedPlaceTypeInferenceStore, v40->_metricManager);
    placeTypeClassifierMetricsCalculator = v40->_placeTypeClassifierMetricsCalculator;
    v40->_placeTypeClassifierMetricsCalculator = v60;

    objc_storeStrong((id *)&v40->_motionActivityManager, a20);
    objc_storeStrong((id *)&v40->_placeInferenceQueryStore, a21);
    objc_storeStrong((id *)&v40->_platform, a22);
    objc_storeStrong((id *)&v40->_pointOfInterestMetricsManager, a23);
    objc_storeStrong((id *)&v40->_portraitManager, a24);
    objc_storeStrong((id *)&v40->_reconcilerPerVisit, a25);
    objc_storeStrong((id *)&v40->_reconcilerPerDevice, a26);
    objc_storeStrong((id *)&v40->_settledStateTransitionStore, a27);
    objc_storeStrong((id *)&v40->_transitMetricManager, a28);
    objc_storeStrong((id *)&v40->_tripSegmentProvider, a29);
    objc_storeStrong((id *)&v40->_visitManager, a30);
    objc_storeStrong((id *)&v40->_xpcActivityManager, a31);
    *(_WORD *)&v40->_registerTrainOnBattery = 256;
    -[RTLearnedLocationEngine setup](v40, "setup");
  }
  v55 = v39;
  v45 = v55;
  v46 = v99;
  v43 = v70;
  v37 = v82;
  v52 = v74;
  v51 = v75;
  v54 = v72;
  v53 = v73;
LABEL_74:

  return v45;
}

- (void)_registerForNotifications
{
  void *v3;
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
  id v15;

  -[RTLearnedLocationEngine contactsManager](self, "contactsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTContactsManagerContactStoreMeContactDidChangeNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onContactsManagerNotification_, v4);

  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerAvailableNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v6);

  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v8);

  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v10);

  -[RTLearnedLocationEngine mapsSupportManager](self, "mapsSupportManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMapsSupportManagerQueryContentsDidChangeNotification, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:", self, sel_onMapsSupportManagerNotification_, v12);

  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:", self, sel_onLearnedLocationStoreNotification_, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

- (void)_unregisterForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RTLearnedLocationEngine contactsManager](self, "contactsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTLearnedLocationEngine fingerprintManager](self, "fingerprintManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (void)_setupXpcActivityTrain
{
  RTXPCActivityCriteria *v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  v4 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 2, 1, 1, 2, 0, 1, 14400.0, 7200.0);
  -[RTXPCActivityCriteria setCpuIntensive:](v4, "setCpuIntensive:", 1);
  objc_initWeak(&location, self);
  -[RTLearnedLocationEngine xpcActivityManager](self, "xpcActivityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke;
  v6[3] = &unk_1E9297790;
  v7[1] = (id)a2;
  objc_copyWeak(v7, &location);
  objc_msgSend(v5, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train"), v4, v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

void __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  void (**v11)(id, id);
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke_216;
      v10[3] = &unk_1E92971A0;
      v12 = *(_QWORD *)(a1 + 40);
      v11 = v5;
      objc_msgSend(WeakRetained, "trainForReason:mode:handler:", 1, 1, v10);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

void __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke_216(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)_registerXpcActivityTrainOnBattery
{
  RTXPCActivityCriteria *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  RTXPCActivityCriteria *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 1, 1, 2, 1, 1, 1800.0, 900.0);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, XPC activity criteria, %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  -[RTLearnedLocationEngine xpcActivityManager](self, "xpcActivityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke;
  v8[3] = &unk_1E9297790;
  v9[1] = (id)a2;
  objc_copyWeak(v9, (id *)buf);
  objc_msgSend(v7, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train-on-battery"), v4, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);

}

void __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void (**v10)(id, id);
  uint64_t v11;
  _QWORD v12[5];
  void (**v13)(id, id);
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke_219;
      v12[3] = &unk_1E929ADB8;
      v10 = v5;
      v11 = *(_QWORD *)(a1 + 40);
      v13 = v10;
      v14 = v11;
      v12[4] = WeakRetained;
      objc_msgSend(WeakRetained, "trainForReason:mode:handler:", 1, 2, v12);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

void __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRegisterTrainOnBattery:", 0);
  }

}

- (void)_unregisterXpcActivityTrainOnBattery
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE buf[12];
  __int16 v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__36;
  v37 = __Block_byref_object_dispose__36;
  v38 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine xpcActivityManager](self, "xpcActivityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __63__RTLearnedLocationEngine__unregisterXpcActivityTrainOnBattery__block_invoke;
  v30 = &unk_1E9297038;
  v32 = &v33;
  v6 = v4;
  v31 = v6;
  objc_msgSend(v5, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train-on-battery"), &v27);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v27, v28, v29, v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v42[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v42, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

  }
  else
  {
LABEL_6:
    v22 = 0;
  }

  v23 = v22;
  if (v23)
    objc_storeStrong(v34 + 5, v22);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v34[5];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v25;
    v40 = 2112;
    v41 = v26;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

  }
  _Block_object_dispose(&v33, 8);

}

void __63__RTLearnedLocationEngine__unregisterXpcActivityTrainOnBattery__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setRegisterTrainOnBattery:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_registerTrainOnBattery != a3)
  {
    self->_registerTrainOnBattery = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_registerTrainOnBattery)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "register train on battery, %@", (uint8_t *)&v6, 0xCu);
    }

    if (self->_registerTrainOnBattery)
      -[RTLearnedLocationEngine _registerXpcActivityTrainOnBattery](self, "_registerXpcActivityTrainOnBattery");
    else
      -[RTLearnedLocationEngine _unregisterXpcActivityTrainOnBattery](self, "_unregisterXpcActivityTrainOnBattery");
  }
}

- (void)_teardownXpcActivityTrain
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t (*v24)(uint64_t);
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint8_t buf[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine xpcActivityManager](self, "xpcActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __52__RTLearnedLocationEngine__teardownXpcActivityTrain__block_invoke;
  v25 = &unk_1E9297150;
  v5 = v3;
  v26 = v5;
  objc_msgSend(v4, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train"), &v22);

  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v22, v23, v24, v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    v11 = v10;
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "submitToCoreAnalytics:type:duration:", v16, 1, v11);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v27 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
  }

}

intptr_t __52__RTLearnedLocationEngine__teardownXpcActivityTrain__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchLatestVisitWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_6;
  }
  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18508]), "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, 0, 0, 0, &unk_1E9327290);
    -[RTLearnedLocationEngine visitManager](self, "visitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__RTLearnedLocationEngine__fetchLatestVisitWithHandler___block_invoke;
    v8[3] = &unk_1E9299760;
    v9 = v4;
    objc_msgSend(v7, "fetchStoredVisitsWithOptions:handler:", v6, v8);

LABEL_6:
  }

}

void __56__RTLearnedLocationEngine__fetchLatestVisitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)_setup
{
  -[RTLearnedLocationEngine _registerForNotifications](self, "_registerForNotifications");
  -[RTLearnedLocationEngine _setupXpcActivityTrain](self, "_setupXpcActivityTrain");
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTLearnedLocationEngine queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RTLearnedLocationEngine_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __32__RTLearnedLocationEngine_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_shutdown
{
  RTAccountManager *accountManager;
  RTContactsManager *contactsManager;
  RTDefaultsManager *defaultsManager;
  RTDiagnostics *diagnostics;
  RTEventManager *eventManager;
  RTFingerprintManager *fingerprintManager;
  RTLearnedLocationStore *learnedLocationStore;
  RTLocationManager *locationManager;
  RTLocationStore *locationStore;
  RTMapServiceManager *mapServiceManager;
  RTMapsSupportManager *mapsSupportManager;
  RTMetricManager *metricManager;
  RTMotionActivityManager *motionActivityManager;
  RTPersonalizationPortraitManager *portraitManager;
  RTVisitManager *visitManager;
  RTXPCActivityManager *xpcActivityManager;

  -[RTLearnedLocationEngine _teardownXpcActivityTrain](self, "_teardownXpcActivityTrain");
  -[RTLearnedLocationEngine _unregisterForNotifications](self, "_unregisterForNotifications");
  -[RTLearnedLocationEngine setRegisterTrainOnBattery:](self, "setRegisterTrainOnBattery:", 0);
  accountManager = self->_accountManager;
  self->_accountManager = 0;

  contactsManager = self->_contactsManager;
  self->_contactsManager = 0;

  defaultsManager = self->_defaultsManager;
  self->_defaultsManager = 0;

  diagnostics = self->_diagnostics;
  self->_diagnostics = 0;

  eventManager = self->_eventManager;
  self->_eventManager = 0;

  fingerprintManager = self->_fingerprintManager;
  self->_fingerprintManager = 0;

  learnedLocationStore = self->_learnedLocationStore;
  self->_learnedLocationStore = 0;

  locationManager = self->_locationManager;
  self->_locationManager = 0;

  locationStore = self->_locationStore;
  self->_locationStore = 0;

  mapServiceManager = self->_mapServiceManager;
  self->_mapServiceManager = 0;

  mapsSupportManager = self->_mapsSupportManager;
  self->_mapsSupportManager = 0;

  metricManager = self->_metricManager;
  self->_metricManager = 0;

  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = 0;

  portraitManager = self->_portraitManager;
  self->_portraitManager = 0;

  visitManager = self->_visitManager;
  self->_visitManager = 0;

  xpcActivityManager = self->_xpcActivityManager;
  self->_xpcActivityManager = 0;

}

- (void)shutdown
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  _QWORD block[6];
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__36;
  v15[4] = __Block_byref_object_dispose__36;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  v16 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  -[RTLearnedLocationEngine queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RTLearnedLocationEngine_shutdown__block_invoke;
  block[3] = &unk_1E92977E0;
  block[4] = self;
  block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __35__RTLearnedLocationEngine_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_shutdown");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (id)_lastVisitWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  RTLearnedLocationStore *learnedLocationStore;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint8_t buf[8];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__36;
  v45 = __Block_byref_object_dispose__36;
  v46 = 0;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__36;
  v39 = __Block_byref_object_dispose__36;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __47__RTLearnedLocationEngine__lastVisitWithError___block_invoke;
  v31 = &unk_1E9298D70;
  v33 = &v41;
  v34 = &v35;
  v7 = v5;
  v32 = v7;
  -[RTLearnedLocationStore fetchLastVisitWithHandler:](learnedLocationStore, "fetchLastVisitWithHandler:", &v28);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v28, v29, v30, v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v47 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v36 + 5, v23);
  if (a3)
    *a3 = objc_retainAutorelease(v36[5]);
  v26 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

void __47__RTLearnedLocationEngine__lastVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_visitsFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE buf[12];
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v8 = a4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__36;
  v52 = __Block_byref_object_dispose__36;
  v53 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__36;
  v46 = __Block_byref_object_dispose__36;
  v47 = 0;
  v9 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke;
  v38[3] = &unk_1E9296EE0;
  v40 = &v48;
  v41 = &v42;
  v11 = v9;
  v39 = v11;
  objc_msgSend(v10, "fetchVisitsFromDate:toDate:handler:", v37, v8, v38);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v61[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v61, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

    v28 = 0;
  }
  else
  {
LABEL_6:
    v27 = 0;
    v28 = 1;
  }

  v29 = v27;
  if ((v28 & 1) == 0)
    objc_storeStrong(v43 + 5, v27);
  if (a5)
    *a5 = objc_retainAutorelease(v43[5]);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = objc_msgSend((id)v49[5], "count");
    objc_msgSend(v37, "stringFromDate");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v43[5];
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v31;
    v55 = 2112;
    v56 = v32;
    v57 = 2112;
    v58 = v33;
    v59 = 2112;
    v60 = v34;
    _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%lu visits from, %@, to, %@, error, %@", buf, 0x2Au);

  }
  objc_msgSend((id)v49[5], "enumerateObjectsUsingBlock:", &__block_literal_global_28);
  v35 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v35;
}

void __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke_232(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)_filterVisits:(id)a3 lastLearnedVisit:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke;
  v49[3] = &unk_1E929AE20;
  v9 = v5;
  v50 = v9;
  objc_msgSend(v7, "predicateWithBlock:", v49);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_237);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exitDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = (void *)MEMORY[0x1E0CB3880];
  v47[0] = v8;
  v47[1] = 3221225472;
  v47[2] = __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_239;
  v47[3] = &unk_1E929AE20;
  v17 = v15;
  v48 = v17;
  objc_msgSend(v16, "predicateWithBlock:", v47);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3528];
  v51[0] = v10;
  v51[1] = v11;
  v46 = (void *)v11;
  v51[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && (objc_msgSend(v23, "exit"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, !v25))
  {
    v42 = v10;
    v43 = v9;
    v44 = v6;
    v45 = (void *)objc_opt_new();
    v27 = objc_msgSend(v22, "count");
    v28 = (v27 - 2);
    if (v27 >= 2)
    {
      v41 = v17;
      while (1)
      {
        objc_msgSend(v24, "entry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "exit");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v31);
        if (v32 >= 180.0)
          break;
        objc_msgSend(v24, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "location");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "distanceFromLocation:toLocation:error:", v33, v35, 0);
        v37 = v36;

        if (v37 >= 250.0)
          goto LABEL_15;
        objc_msgSend(v22, "objectAtIndexedSubscript:", v28);
        v38 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v38;
        if (v28-- <= 0)
        {
          LODWORD(v28) = -1;
          v24 = (void *)v38;
          goto LABEL_15;
        }
      }

LABEL_15:
      v17 = v41;
    }
    objc_msgSend(v22, "subarrayWithRange:", 0, (int)v28 + 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v43;
    v6 = v44;
    v10 = v42;
  }
  else
  {
    v26 = v22;
  }

  return v26;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "entry");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "exit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v3)
  {
LABEL_7:
    v9 = 1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. incomplete", (uint8_t *)&v11, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_236(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "exit");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  objc_msgSend(v2, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == -1)
  {
LABEL_6:
    v9 = 1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v2;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. failed integrity check", (uint8_t *)&v11, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "exit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDate:", *(_QWORD *)(a1 + 32));

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. redundant submission", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

- (id)_mapItemProviderForClass:(Class)a3 error:(id *)a4
{
  RTMapItemProviderReverseGeocode *v7;
  void *v8;
  void *v9;
  RTMapItemProviderBluePOI *v10;
  NSObject *v11;
  RTMapItemProviderLearnedPlace *v13;
  void *v14;
  uint64_t v15;
  RTMapItemProviderProactiveExperts *v16;
  void *v17;
  uint64_t v18;
  RTMapItemProviderEventKit *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  RTMapItemProviderMapsSupport *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  RTMapItemProviderPOIHistory *v33;
  RTMapItemProviderBluePOI *v34;
  void *v35;
  uint8_t buf[8];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providerClass", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("providerClass"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    goto LABEL_24;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v13 = [RTMapItemProviderLearnedPlace alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RTMapItemProviderLearnedPlace initWithDefaultsManager:distanceCalculator:learnedLocationStore:](v13, "initWithDefaultsManager:distanceCalculator:learnedLocationStore:", v8, v9, v14);
LABEL_15:
    v10 = (RTMapItemProviderBluePOI *)v15;
LABEL_19:

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v16 = [RTMapItemProviderProactiveExperts alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine portraitManager](self, "portraitManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[RTMapItemProviderProactiveExperts initWithDefaultsManager:distanceCalculator:mapServiceManager:personalizationPortraitManager:](v16, "initWithDefaultsManager:distanceCalculator:mapServiceManager:personalizationPortraitManager:", v8, v9, v14, v17);
LABEL_18:
    v10 = (RTMapItemProviderBluePOI *)v18;

    goto LABEL_19;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v19 = [RTMapItemProviderEventKit alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine eventManager](self, "eventManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[RTMapItemProviderEventKit initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:](v19, "initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:", v8, v9, v14, v17);
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v27 = [RTMapItemProviderMapsSupport alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine mapsSupportManager](self, "mapsSupportManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RTMapItemProviderMapsSupport initWithDefaultsManager:distanceCalculator:mapsSupportManager:](v27, "initWithDefaultsManager:distanceCalculator:mapsSupportManager:", v8, v9, v14);
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v34 = [RTMapItemProviderBluePOI alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine fingerprintManager](self, "fingerprintManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine locationManager](self, "locationManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine placeInferenceQueryStore](self, "placeInferenceQueryStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine platform](self, "platform");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTMapItemProviderBluePOI initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:](v34, "initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:", v8, v9, v35, v28, v29, v30, v31, v32);

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v33 = [RTMapItemProviderPOIHistory alloc];
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine placeInferenceQueryStore](self, "placeInferenceQueryStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RTMapItemProviderPOIHistory initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:](v33, "initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:", v8, v9, v14);
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() != a3)
  {
LABEL_21:
    v20 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("could not find provider %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D18598];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 7, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v26);

LABEL_24:
    v10 = 0;
    return v10;
  }
  v7 = [RTMapItemProviderReverseGeocode alloc];
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTMapItemProviderReverseGeocode initWithDefaultsManager:mapServiceManager:](v7, "initWithDefaultsManager:mapServiceManager:", v8, v9);
LABEL_20:

  if (!v10)
    goto LABEL_21;
  return v10;
}

- (id)_enabledMapItemProviders
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  char v19;
  void *v20;
  objc_class *v21;
  void *v22;
  char v23;
  void *v24;
  objc_class *v25;
  void *v26;
  char v27;
  void *v28;
  objc_class *v29;
  void *v30;
  char v31;
  void *v32;
  objc_class *v33;
  void *v34;
  char v35;
  void *v36;
  objc_class *v37;
  void *v38;
  char v39;
  void *v40;
  objc_class *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  void *v48;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  NSObject *v56;
  _QWORD v57[4];
  NSObject *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  if (-[RTLearnedLocationEngine _isAuthorized](self, "_isAuthorized"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsMapItemProviderDenyList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke;
      v57[3] = &unk_1E92974C8;
      v58 = v5;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v57);

    }
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultForKey:defaultValue:", CFSTR("RTDefaultsMapItemProviderDenyList"), MEMORY[0x1E0C9AA60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v9;
      v53 = 3221225472;
      v54 = __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke_2;
      v55 = &unk_1E92974C8;
      v56 = v5;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v52);

    }
    if (!-[RTPlatform iPhoneDevice](self->_platform, "iPhoneDevice", v52, v53, v54, v55))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v13;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObjectsFromArray:](v5, "addObjectsFromArray:", v16);

    }
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSObject containsObject:](v5, "containsObject:", v18);

    if ((v19 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v4, "addObject:", v20);

    }
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSObject containsObject:](v5, "containsObject:", v22);

    if ((v23 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v4, "addObject:", v24);

    }
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[NSObject containsObject:](v5, "containsObject:", v26);

    if ((v27 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        objc_msgSend(v4, "addObject:", v28);

    }
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[NSObject containsObject:](v5, "containsObject:", v30);

    if ((v31 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        objc_msgSend(v4, "addObject:", v32);

    }
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[NSObject containsObject:](v5, "containsObject:", v34);

    if ((v35 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v4, "addObject:", v36);

    }
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[NSObject containsObject:](v5, "containsObject:", v38);

    if ((v39 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        objc_msgSend(v4, "addObject:", v40);

    }
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[NSObject containsObject:](v5, "containsObject:", v42);

    if ((v43 & 1) == 0)
    {
      -[RTLearnedLocationEngine _mapItemProviderForClass:error:](self, "_mapItemProviderForClass:error:", objc_opt_class(), 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        objc_msgSend(v4, "addObject:", v44);
      objc_msgSend(v4, "lastObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isMemberOfClass:", objc_opt_class());

      if ((v46 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v60 = v51;
          v61 = 2080;
          v62 = "-[RTLearnedLocationEngine _enabledMapItemProviders]";
          v63 = 1024;
          v64 = 876;
          _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "the last mapItem provider must be %@ (in %s:%d)", buf, 0x1Cu);

        }
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v48;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, not authorized to use mapItem providers", buf, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

void __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)fetchFusionCandidatesForVisit:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[RTLearnedLocationEngine queue](self, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__RTLearnedLocationEngine_fetchFusionCandidatesForVisit_handler___block_invoke;
      block[3] = &unk_1E9299330;
      block[4] = self;
      v17 = v7;
      v16 = v6;
      dispatch_async(v8, block);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[RTLearnedLocationEngine fetchFusionCandidatesForVisit:handler:]";
        v22 = 1024;
        v23 = 886;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit (in %s:%d)", buf, 0x12u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = CFSTR("requires a non-nil visit.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __65__RTLearnedLocationEngine_fetchFusionCandidatesForVisit_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_enabledMapItemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    objc_msgSend(v11, "_candidatesForVisit:providers:continueOnError:error:", v12, v4, 1, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("required at least one mapItem provider.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 2, v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v14);
  }

}

- (void)queryMapItemProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  NSString *v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  Class v11;
  Class v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD block[5];
  id v29;
  void (**v30)(id, _QWORD, void *);
  Class v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_18;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTLearnedLocationEngine queryMapItemProvider:options:handler:]";
      v40 = 1024;
      v41 = 928;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providerClassName (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_15;
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTLearnedLocationEngine queryMapItemProvider:options:handler:]";
      v40 = 1024;
      v41 = 929;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("requires a non-nil options");
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v35;
      v21 = &v34;
LABEL_16:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v23);

      goto LABEL_19;
    }
LABEL_15:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("requires a non-nil provider class name");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v37;
    v21 = &v36;
    goto LABEL_16;
  }
  v11 = NSClassFromString(v8);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not find provider %@"), v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D18598];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 7, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v27);
LABEL_18:

    goto LABEL_19;
  }
  v12 = v11;
  -[RTLearnedLocationEngine queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTLearnedLocationEngine_queryMapItemProvider_options_handler___block_invoke;
  block[3] = &unk_1E929AE88;
  block[4] = self;
  v31 = v12;
  v30 = v10;
  v29 = v9;
  dispatch_async(v13, block);

LABEL_19:
}

void __64__RTLearnedLocationEngine_queryMapItemProvider_options_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v2 = (void *)a1[4];
  v3 = a1[7];
  v12 = 0;
  objc_msgSend(v2, "_mapItemProviderForClass:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v6 = a1[5];
    v11 = 0;
    objc_msgSend(v4, "mapItemsWithOptions:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v8)
    {
      v9 = 0;
      v10 = v8;
    }
    else
    {
      v9 = v7;
      v10 = 0;
    }
    (*(void (**)(_QWORD, void *, id))(a1[6] + 16))(a1[6], v9, v10);

  }
}

- (BOOL)_isAOIInferredMapItem:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if ((objc_msgSend(v3, "source") & 0x41C0) != 0)
  {
    objc_msgSend(v3, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mapItemPlaceType") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isFinerGranularityPOIInferredMapItem:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if ((objc_msgSend(v3, "source") & 0x41C0) != 0)
  {
    objc_msgSend(v3, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mapItemPlaceType") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_finerGranularityCandidatesDictionaryForFusionCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  void *v41;
  uint64_t v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v58 = v34;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, computing the finer granularity candidates", buf, 0xCu);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v35 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v11, "firstObject", v35);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[RTLearnedLocationEngine _isAOIInferredMapItem:](self, "_isAOIInferredMapItem:", v12);

          if (v13)
          {
            objc_msgSend(v11, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v36 = v6;
    v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v49;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v49 != v38)
            objc_enumerationMutation(v36);
          v42 = v15;
          v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v15);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v32;
            v59 = 2112;
            v60 = v16;
            _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@, AOI candidate, %@", buf, 0x16u);

          }
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "mapItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "muid"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v21 = obj;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v45 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                objc_msgSend(v26, "firstObject", v35);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = -[RTLearnedLocationEngine _isFinerGranularityPOIInferredMapItem:](self, "_isFinerGranularityPOIInferredMapItem:", v27);

                if (v28)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    NSStringFromSelector(a2);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "firstObject");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v58 = v30;
                    v59 = 2112;
                    v60 = v31;
                    _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "%@, finer granularity candidate, %@", buf, 0x16u);

                  }
                  objc_msgSend(v20, "addObject:", v26);
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v23);
          }

          if (objc_msgSend(v20, "count"))
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v20, v41);

          v15 = v42 + 1;
        }
        while (v42 + 1 != v39);
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v39);
    }

    v4 = v35;
  }
  else
  {
    v37 = (id)MEMORY[0x1E0C9AA70];
  }

  return v37;
}

- (id)_finerGranularityPOIForInferredMapItem:(id)a3 visit:(id)a4 finerGranularityCandidatesDictionary:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v22;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  objc_msgSend(a3, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "muid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    v22 = 0;
    -[RTLearnedLocationEngine _bestFusedInferredMapItemForVisit:fromCandidates:error:](self, "_bestFusedInferredMapItemForVisit:fromCandidates:error:", v10, v15, &v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    objc_msgSend(v19, "convertToInferredMapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v18 = 0;
  v17 = 0;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v18);
LABEL_9:
  v20 = v17;

  return v20;
}

- (id)_candidatesForInferredMapItems:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  const char *aSelector;
  id *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  id v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE buf[12];
  __int16 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    aSelector = a2;
    v34 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v43;
      v37 = *MEMORY[0x1E0D18598];
      v36 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          v41 = 0;
          -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mapItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v17 = objc_msgSend(v15, "placeTypeForMapItem:placeType:placeTypeSource:error:", v16, buf, &v41, &v40);
          v18 = v40;

          if ((v17 & 1) == 0)
          {
            objc_msgSend(v9, "addObject:", v18);
            *(_QWORD *)buf = 0;
            v41 = 0;
          }
          v19 = objc_alloc(MEMORY[0x1E0D18408]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithFirstObject:secondObject:", v14, v20);

          if (v21)
          {
            objc_msgSend(v39, "addObject:", v21);
          }
          else
          {
            v22 = (void *)MEMORY[0x1E0CB3940];
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)buf);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("candidate was nil for inferredMapItem, %@, placeType, %@"), v14, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0CB35C8];
            v49 = v36;
            v50 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "errorWithDomain:code:userInfo:", v37, 0, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "addObject:", v27);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v9, "count"))
    {
      _RTSafeArray();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v32;
        v47 = 2112;
        v48 = v29;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (v34)
        *v34 = objc_retainAutorelease(v29);

    }
    v8 = v35;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)_candidatesForVisit:(id)a3 providers:(id)a4 continueOnError:(BOOL)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
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
  NSObject *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id *v48;
  void *v49;
  id v50;
  id obj;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    if (a6)
    {
      v43 = CFSTR("visit");
LABEL_40:
      _RTErrorInvalidParameterCreate((uint64_t)v43);
      v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
LABEL_46:
    v11 = 0;
    goto LABEL_47;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providers", buf, 2u);
    }

    if (a6)
    {
      v43 = CFSTR("providers");
      goto LABEL_40;
    }
    goto LABEL_46;
  }
  v48 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v49 = v10;
  obj = v10;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v69;
    v50 = v8;
    while (2)
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        v14 = MEMORY[0x1D8231EA8]();
        v15 = objc_alloc(MEMORY[0x1E0D18428]);
        objc_msgSend(v8, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "entryDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "exitDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v15;
        v21 = (void *)v14;
        v22 = (void *)objc_msgSend(v20, "initWithinDistance:location:startDate:endDate:", v17, v18, v19, 50.0);

        if ((objc_msgSend(v13, "skipForOptions:error:", v22, 0) & 1) == 0)
        {
          v67 = 0;
          objc_msgSend(v13, "mapItemsWithOptions:error:", v22, &v67);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v67;
          v25 = v24;
          if (v24 && (objc_msgSend(v24, "isOnlyThrottlingError") & 1) == 0)
            objc_msgSend(v60, "addObject:", v25);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 138412802;
            v74 = v28;
            v75 = 2048;
            v76 = v29;
            v77 = 2112;
            v78 = v25;
            _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);

          }
          v66 = 0;
          v58 = v23;
          -[RTLearnedLocationEngine _candidatesForInferredMapItems:error:](self, "_candidatesForInferredMapItems:error:", v23, &v66);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v66;
          v32 = v60;
          if (v31)
            objc_msgSend(v60, "addObject:", v31);
          v57 = v31;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v33 = v30;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          if (v34)
          {
            v35 = v34;
            v54 = v25;
            v55 = v22;
            v56 = v21;
            v36 = 0;
            v37 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v63 != v37)
                  objc_enumerationMutation(v33);
                v39 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v39, "secondObject");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "unsignedIntegerValue");

                v36 |= (unint64_t)(v41 - 1) < 3;
                objc_msgSend(v11, "addObject:", v39);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
            }
            while (v35);

            v8 = v50;
            v32 = v60;
            v22 = v55;
            v21 = v56;
            v25 = v54;
            if ((v36 & 1) != 0)
            {
LABEL_41:

              objc_autoreleasePoolPop(v21);
              goto LABEL_42;
            }
          }
          else
          {

          }
          if (!a5 && objc_msgSend(v32, "count"))
            goto LABEL_41;

        }
        objc_autoreleasePoolPop(v21);
      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v61)
        continue;
      break;
    }
  }
LABEL_42:

  v45 = v60;
  if (v48 && objc_msgSend(v60, "count"))
  {
    _RTSafeArray();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *v48 = (id)objc_claimAutoreleasedReturnValue();

    v45 = v60;
  }

  v10 = v49;
LABEL_47:

  return v11;
}

- (id)_bestFusedInferredMapItemForVisit:(id)a3 fromCandidates:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  RTFusionMetrics *v23;
  BOOL v24;
  id v25;
  void *v26;
  id *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  RTInferredMapItemFuser *v38;
  void *v39;
  id v41;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v39 = v7;
    v38 = -[RTInferredMapItemFuser initWithDefaultsManager:distanceCalculator:learnedLocationStore:]([RTInferredMapItemFuser alloc], "initWithDefaultsManager:distanceCalculator:learnedLocationStore:", self->_defaultsManager, self->_distanceCalculator, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "secondObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v14, "unsignedIntegerValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v46 = v12;
          v47 = 2048;
          v48 = v9;
          v49 = 2112;
          v50 = v13;
          v51 = 2112;
          v52 = v15;
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, candidate %lu, inferredMapItem, %@, placeType, %@", buf, 0x2Au);

        }
        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }
    objc_msgSend(v39, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    -[RTInferredMapItemFuser fusedInferredMapItemsUsingCandidates:referenceLocation:snapToBestKnownPlaceAndAoi:error:](v38, "fusedInferredMapItemsUsingCandidates:referenceLocation:snapToBestKnownPlaceAndAoi:error:", v8, v17, 1, &v44);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v44;

    -[RTInferredMapItemFuser bestFromFusedInferredMapItems:](v38, "bestFromFusedInferredMapItems:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v22;
      v47 = 2112;
      v48 = (unint64_t)v20;
      v49 = 2112;
      v50 = v19;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, best fusedInferredMapItem, %@, error, %@", buf, 0x20u);

    }
    v23 = objc_alloc_init(RTFusionMetrics);
    -[RTFusionMetrics setMetricsUsingInputCandidates:outputFusedInferredMapItems:bestFusedInferredMapItem:outputError:](v23, "setMetricsUsingInputCandidates:outputFusedInferredMapItems:bestFusedInferredMapItem:outputError:", v8, v18, v20, v19);
    v43 = 0;
    v24 = -[RTFusionMetrics submitMetricsWithError:](v23, "submitMetricsWithError:", &v43);
    v25 = v43;
    v26 = v25;
    if (v24)
    {
      if (!v19)
      {
        v41 = v25;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v18, "count"))
        {
          v32 = 0;
          do
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v46 = v35;
              v47 = 2048;
              v48 = v32;
              v49 = 2112;
              v50 = v33;
              _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, fusedInferredMapItem %lu, %@", buf, 0x20u);

            }
            ++v32;
          }
          while (v32 < objc_msgSend(v18, "count"));
        }
        v30 = v20;
        v26 = v41;
        goto LABEL_32;
      }
      v27 = a5;
      if (a5)
      {
        v28 = v19;
LABEL_22:
        v30 = 0;
        *v27 = objc_retainAutorelease(v28);
LABEL_32:

        v7 = v39;
        goto LABEL_33;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v46 = v37;
        v47 = 2112;
        v48 = (unint64_t)v26;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, fusion metrics submission error, %@", buf, 0x16u);

      }
      v27 = a5;
      if (a5)
      {
        v28 = v26;
        goto LABEL_22;
      }
    }
    v30 = 0;
    goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("visit"));
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_33:

  return v30;
}

- (BOOL)_isRecentVisit:(id)a3
{
  void *v3;
  double v4;
  BOOL v5;

  objc_msgSend(a3, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4 > -259200.0;

  return v5;
}

- (BOOL)_isNotTooOldToLabelVisit:(id)a3
{
  void *v3;
  double v4;
  BOOL v5;

  objc_msgSend(a3, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4 > -604800.0;

  return v5;
}

- (BOOL)_skipLabelingForVisit:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[RTLearnedLocationEngine _isRecentVisit:](self, "_isRecentVisit:", v4))
  {
    v5 = 0;
  }
  else if (-[RTLearnedLocationEngine _isNotTooOldToLabelVisit:](self, "_isNotTooOldToLabelVisit:", v4))
  {
    v5 = RTCommonRandomFlip();
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_isBluePOICalledForVisit:(id)a3 providers:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_alloc(MEMORY[0x1E0D18428]);
          objc_msgSend(v17, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "location");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "entryDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "exitDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v9, "initWithinDistance:location:startDate:endDate:", v11, v12, v13, 50.0);

          v15 = objc_msgSend(v8, "skipForOptions:error:", v14, 0);
          if (!v15)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)_bestInferredMapItemForVisit:(id)a3 bestFinerGranularityInferredMapItem:(id *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL8 v37;
  NSObject *v38;
  uint64_t v39;
  _BOOL8 v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _RTMap *v50;
  uint64_t v51;
  id *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  id v72;
  void *v73;
  const char *aSelector;
  void *v75;
  id *v76;
  void *v77;
  id *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t v88[128];
  uint8_t buf[4];
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceNow");
  v13 = v12;

  -[RTLearnedLocationEngine _enabledMapItemProviders](self, "_enabledMapItemProviders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    if (-[RTLearnedLocationEngine _skipLabelingForVisit:](self, "_skipLabelingForVisit:", v9))
    {
      v95 = *MEMORY[0x1E0CB2D50];
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("skipped labeling to reduce network traffic, creation date, %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 12, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v90 = v21;
        v91 = 2112;
        v92 = (uint64_t)v9;
        v93 = 2112;
        v94 = v19;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, Skipped labeling, visit, %@, error, %@", buf, 0x20u);

      }
      objc_msgSend((id)objc_opt_class(), "submitVisitLabelingMetricsForLabelingRetried:labelingSkipped:revGeoCalled:bluePOICalled:unlabeledVisit:visitAge:error:", 0, 1, 0, 0, 1, v19, v13);
      if (a5)
        *a5 = objc_retainAutorelease(v19);

      goto LABEL_10;
    }
    v76 = a4;
    aSelector = a2;
    v78 = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count") - 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v77 = v14;
    v28 = v14;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v85 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          if (objc_msgSend(v33, "isMemberOfClass:", objc_opt_class()))
            v34 = v27;
          else
            v34 = v26;
          objc_msgSend(v34, "addObject:", v33);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      }
      while (v30);
    }

    v83 = 0;
    -[RTLearnedLocationEngine _candidatesForVisit:providers:continueOnError:error:](self, "_candidatesForVisit:providers:continueOnError:error:", v9, v26, -[RTLearnedLocationEngine _isRecentVisit:](self, "_isRecentVisit:", v9) ^ 1, &v83);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v83;
    v37 = -[RTLearnedLocationEngine _isBluePOICalledForVisit:providers:](self, "_isBluePOICalledForVisit:providers:", v9, v26);
    if (v36)
      objc_msgSend(v10, "addObject:", v36);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138412802;
      v90 = v9;
      v91 = 2048;
      v92 = v39;
      v93 = 2112;
      v94 = v36;
      _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "visit, %@, possible candidates, %lu, error, %@", buf, 0x20u);
    }

    if (v36 && -[RTLearnedLocationEngine _isRecentVisit:](self, "_isRecentVisit:", v9))
    {
      v40 = v37;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v41 = objc_claimAutoreleasedReturnValue();
      v14 = v77;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v9;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "skipping labelling visit, %@", buf, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "submitVisitLabelingMetricsForLabelingRetried:labelingSkipped:revGeoCalled:bluePOICalled:unlabeledVisit:visitAge:error:", 1, 0, 0, v40, 1, v36, v13);
      v18 = 0;
      if (v78)
        *v78 = objc_retainAutorelease(v36);
    }
    else
    {
      v71 = v37;
      v82 = 0;
      -[RTLearnedLocationEngine _bestFusedInferredMapItemForVisit:fromCandidates:error:](self, "_bestFusedInferredMapItemForVisit:fromCandidates:error:", v9, v35, &v82);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v82;
      if (v43)
        objc_msgSend(v10, "addObject:", v43);
      objc_msgSend(v42, "mapItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = v44;
      v69 = v43;
      v72 = v36;
      v70 = v42;
      if (v44)
      {
        objc_msgSend(v42, "convertToInferredMapItem");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
      }
      else
      {
        v81 = 0;
        -[RTLearnedLocationEngine _candidatesForVisit:providers:continueOnError:error:](self, "_candidatesForVisit:providers:continueOnError:error:", v9, v27, 1, &v81);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v81;
        if (v46)
          objc_msgSend(v10, "addObject:", v46);
        objc_msgSend(v45, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          objc_msgSend(v45, "firstObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v79 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v79 = 0;
        }

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count") + objc_msgSend(v35, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "count"))
        objc_msgSend(v49, "addObjectsFromArray:", v35);
      if (objc_msgSend(v45, "count"))
        objc_msgSend(v49, "addObjectsFromArray:", v45);
      v50 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v49);
      -[_RTMap withBlock:](v50, "withBlock:", &__block_literal_global_287);
      v51 = objc_claimAutoreleasedReturnValue();

      v67 = (void *)v51;
      -[RTLearnedLocationEngine _submitMetricsForVisit:possibleInferredMapItems:selectedInferredMapItem:](self, "_submitMetricsForVisit:possibleInferredMapItems:selectedInferredMapItem:", v9, v51, v79);
      v73 = v35;
      v75 = v45;
      v52 = v76;
      if (v76)
      {
        v66 = v49;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v54;
          v91 = 2112;
          v92 = (uint64_t)v9;
          _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%@, computing the finer granularity map item for visit, %@", buf, 0x16u);

        }
        -[RTLearnedLocationEngine _finerGranularityCandidatesDictionaryForFusionCandidates:](self, "_finerGranularityCandidatesDictionaryForFusionCandidates:", v35);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0;
        -[RTLearnedLocationEngine _finerGranularityPOIForInferredMapItem:visit:finerGranularityCandidatesDictionary:error:](self, "_finerGranularityPOIForInferredMapItem:visit:finerGranularityCandidatesDictionary:error:", v79, v9, v55, &v80);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v80;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v90 = v59;
          v91 = 2112;
          v92 = (uint64_t)v56;
          v93 = 2112;
          v94 = v9;
          _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, the selected finer granularity map item, %@, for visit, %@", buf, 0x20u);

          v52 = v76;
        }

        if (v57)
          objc_msgSend(v10, "addObject:", v57);
        v60 = objc_retainAutorelease(v56);
        *v52 = v60;

        v49 = v66;
      }
      if (objc_msgSend(v10, "count"))
      {
        _RTSafeArray();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = objc_retainAutorelease(v62);
        *v78 = v63;
      }
      else
      {
        v63 = 0;
      }
      objc_msgSend((id)objc_opt_class(), "submitVisitLabelingMetricsForLabelingRetried:labelingSkipped:revGeoCalled:bluePOICalled:unlabeledVisit:visitAge:error:", 0, 0, v68 == 0, v71, v79 == 0, v63, v13);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v90 = v79;
        v91 = 2112;
        v92 = (uint64_t)v9;
        v93 = 2112;
        v94 = v63;
        _os_log_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_INFO, "selected inferredMapItem, %@, for visit, %@, error, %@", buf, 0x20u);
      }

      v36 = v72;
      if (v78)
        *v78 = objc_retainAutorelease(v63);
      v18 = v79;

      v14 = v77;
      v35 = v73;
    }

    v25 = v18;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D18598];
    v97 = *MEMORY[0x1E0CB2D50];
    v98[0] = CFSTR("required at least one mapItem provider.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 2, v24);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "submitVisitLabelingMetricsForLabelingRetried:labelingSkipped:revGeoCalled:bluePOICalled:unlabeledVisit:visitAge:error:", 0, 1, 0, 0, 1, v18, v13);
    if (!a5)
    {
LABEL_10:
      v25 = 0;
      goto LABEL_63;
    }
    v18 = objc_retainAutorelease(v18);
    v25 = 0;
    *a5 = v18;
  }
LABEL_63:

  return v25;
}

uint64_t __98__RTLearnedLocationEngine__bestInferredMapItemForVisit_bestFinerGranularityInferredMapItem_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstObject");
}

- (void)_submitMetricsForVisit:(id)a3 possibleInferredMapItems:(id)a4 selectedInferredMapItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  RTLearnedLocationEngine *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v31 = self;
    v34 = v8;
    objc_msgSend(v10, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    if (!v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mapItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v28;
        v43 = 2112;
        v44 = v29;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, failed to copy selectedMapItem, %@", buf, 0x16u);

      }
    }
    v32 = v11;
    v30 = v13;
    objc_msgSend(v13, "setSource:", objc_msgSend(v11, "source"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v33 = v9;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v21, "mapItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "copy");

          if (v23)
          {
            objc_msgSend(v23, "setSource:", objc_msgSend(v21, "source"));
            objc_msgSend(v15, "addObject:", v23);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "mapItem");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v42 = v25;
              v43 = 2112;
              v44 = v26;
              _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, failed to copy possibleMapItem, %@", buf, 0x16u);

            }
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    -[RTLearnedLocationEngine trainingMetrics](v31, "trainingMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;
    objc_msgSend(v27, "submitVisit:possibleMapItems:selectedMapItem:", v34, v15, v30);

    v11 = v32;
    v9 = v33;
  }

}

- (id)_storedMapItemForMapItem:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id *v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  dispatch_semaphore_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  dispatch_time_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  id v71;
  id v72;
  uint64_t v74;
  uint64_t v75;
  id v76;
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
  uint64_t v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *context;
  id v116;
  id *v117;
  void *v118;
  _QWORD v119[4];
  NSObject *v120;
  _BYTE *v121;
  _QWORD v122[4];
  NSObject *v123;
  uint64_t *v124;
  uint64_t *v125;
  uint64_t v126;
  id *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  void *v138;
  _BYTE buf[24];
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  uint8_t v146[8];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v117 = a4;
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForObjectsFromCurrentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    context = (void *)MEMORY[0x1D8231EA8]();
    v132 = 0;
    v133 = &v132;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__36;
    v136 = __Block_byref_object_dispose__36;
    v137 = 0;
    v126 = 0;
    v127 = (id *)&v126;
    v128 = 0x3032000000;
    v129 = __Block_byref_object_copy__36;
    v130 = __Block_byref_object_dispose__36;
    v131 = 0;
    v9 = dispatch_semaphore_create(0);
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = MEMORY[0x1E0C809B0];
    v122[1] = 3221225472;
    v122[2] = __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke;
    v122[3] = &unk_1E9296EE0;
    v124 = &v132;
    v125 = &v126;
    v11 = v9;
    v123 = v11;
    objc_msgSend(v10, "fetchStoredMapItemsWithMapItem:predicate:handler:", v7, v118, v122);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v146 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v146, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v26 = objc_retainAutorelease(v26);

        v27 = 0;
LABEL_11:

        v116 = v26;
        if ((v27 & 1) == 0)
          objc_storeStrong(v127 + 5, v26);
        v33 = v127[5];
        if (v33)
        {
          v32 = v33;
          v34 = 0;
        }
        else if (objc_msgSend((id)v133[5], "count"))
        {
          objc_msgSend((id)v133[5], "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2112;
            v140 = 0;
            _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "selected existing mapItem, %@, for the input mapItem, %@, error, %@", buf, 0x20u);
          }

          v32 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "dateByAddingTimeInterval:", 4838400.0);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_alloc(MEMORY[0x1E0D18330]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "geoAddressData");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "subPremises");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "subThoroughfare");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "thoroughfare");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "subLocality");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "locality");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "subAdministrativeArea");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "administrativeArea");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "administrativeAreaCode");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "postalCode");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "country");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "countryCode");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "inlandWater");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "ocean");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "areasOfInterest");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isIsland");
          objc_msgSend(v7, "address");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "iso3166CountryCode");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "address");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "iso3166SubdivisionCode");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v75) = v38;
          v77 = (void *)objc_msgSend(v76, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v92, v91, v90, v89, v80, v88, v87, v79, v86, v85, v84, v83, v78, v82,
                          v81,
                          v36,
                          v75,
                          v113,
                          v114,
                          v40,
                          v42);

          v106 = objc_alloc(MEMORY[0x1E0D183E8]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "name");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "category");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "location");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v7, "source");
          v44 = objc_msgSend(v7, "mapItemPlaceType");
          v45 = objc_msgSend(v7, "muid");
          v46 = objc_msgSend(v7, "resultProviderID");
          objc_msgSend(v7, "geoMapItemHandle");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "extendedAttributes");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "displayLanguage");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v74) = objc_msgSend(v7, "disputed");
          v34 = (void *)objc_msgSend(v106, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v112, v110, v108, v77, v43, v104, v44, v45, v46, v47, v113, v114, v48, v49, v74);

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "selected new mapItem, %@, for input mapItem, %@", buf, 0x16u);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v140 = __Block_byref_object_copy__36;
          v141 = __Block_byref_object_dispose__36;
          v142 = 0;
          v51 = dispatch_semaphore_create(0);

          -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v119[0] = MEMORY[0x1E0C809B0];
          v119[1] = 3221225472;
          v119[2] = __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke_293;
          v119[3] = &unk_1E9297038;
          v121 = buf;
          v54 = v51;
          v120 = v54;
          objc_msgSend(v52, "storeMapItems:handler:", v53, v119);

          v12 = v54;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v12, v56))
            goto LABEL_26;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "timeIntervalSinceDate:", v55);
          v59 = v58;
          v60 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "filteredArrayUsingPredicate:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "submitToCoreAnalytics:type:duration:", v64, 1, v59);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v146 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v146, 2u);
          }

          v66 = (void *)MEMORY[0x1E0CB35C8];
          v145 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v146 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, &v145, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (v68)
          {
            v69 = objc_retainAutorelease(v68);

            v70 = 0;
          }
          else
          {
LABEL_26:
            v70 = 1;
            v69 = v116;
          }

          v71 = v69;
          if ((v70 & 1) == 0)
            objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v69);
          v32 = *(id *)(*(_QWORD *)&buf[8] + 40);
          if (v32)
            v72 = v32;

          _Block_object_dispose(buf, 8);
          v116 = v71;
        }

        _Block_object_dispose(&v126, 8);
        _Block_object_dispose(&v132, 8);

        objc_autoreleasePoolPop(context);
        if (v117)
          *v117 = objc_retainAutorelease(v32);
        v31 = v34;
        a4 = v31;
        goto LABEL_35;
      }
    }
    else
    {
      v26 = 0;
    }
    v27 = 1;
    goto LABEL_11;
  }
  if (a4)
  {
    v28 = a4;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v143 = *MEMORY[0x1E0CB2D50];
    v30 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v31 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ requires a valid mapItem."), v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v144 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v118);
    a4 = 0;
    *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

  }
  return a4;
}

void __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke_293(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_placeForMapItem:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id *v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  RTLearnedPlace *v34;
  void *v35;
  NSObject *v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  RTLearnedPlace *v52;
  void *v53;
  NSObject *v54;
  dispatch_semaphore_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  dispatch_time_t v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  char v74;
  id v75;
  id v76;
  uint64_t v78;
  uint64_t v79;
  char v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
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
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *context;
  id v127;
  id *v128;
  void *v129;
  _QWORD v130[4];
  NSObject *v131;
  _BYTE *v132;
  _QWORD v133[4];
  NSObject *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  id *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  RTLearnedPlace *v149;
  _BYTE buf[24];
  uint64_t (*v151)(uint64_t, uint64_t);
  void (*v152)(uint64_t);
  id v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint8_t v157[8];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v128 = a4;
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForObjectsFromCurrentDevice");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    context = (void *)MEMORY[0x1D8231EA8]();
    v143 = 0;
    v144 = &v143;
    v145 = 0x3032000000;
    v146 = __Block_byref_object_copy__36;
    v147 = __Block_byref_object_dispose__36;
    v148 = 0;
    v137 = 0;
    v138 = (id *)&v137;
    v139 = 0x3032000000;
    v140 = __Block_byref_object_copy__36;
    v141 = __Block_byref_object_dispose__36;
    v142 = 0;
    v9 = dispatch_semaphore_create(0);
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke;
    v133[3] = &unk_1E929AEF0;
    v135 = &v143;
    v136 = &v137;
    v11 = v9;
    v134 = v11;
    objc_msgSend(v10, "fetchPlaceWithMapItem:predicate:handler:", v7, v129, v133);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v157 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v157, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v26 = objc_retainAutorelease(v26);

        v27 = 0;
LABEL_11:

        v127 = v26;
        if ((v27 & 1) == 0)
          objc_storeStrong(v138 + 5, v26);
        v33 = v138[5];
        if (v33)
        {
          v32 = v33;
          v34 = 0;
        }
        else
        {
          v35 = (void *)v144[5];
          if (v35)
          {
            v34 = v35;
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = (uint64_t (*)(uint64_t, uint64_t))v138[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v7;
              *(_WORD *)&buf[22] = 2112;
              v151 = v37;
              _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "selected existing place, %@, with mapItem, %@, error, %@", buf, 0x20u);
            }

            v32 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "dateByAddingTimeInterval:", 4838400.0);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_alloc(MEMORY[0x1E0D18330]);
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "geoAddressData");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "subPremises");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "subThoroughfare");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "thoroughfare");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "subLocality");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "locality");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "subAdministrativeArea");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "administrativeArea");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "administrativeAreaCode");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "postalCode");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "country");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "countryCode");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "inlandWater");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "ocean");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "areasOfInterest");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v102, "isIsland");
            objc_msgSend(v7, "address");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "creationDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "expirationDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "iso3166CountryCode");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "address");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "iso3166SubdivisionCode");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v79) = v80;
            v82 = (void *)objc_msgSend(v81, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v100, v99, v98, v97, v96, v95, v94, v93, v92, v91, v90, v89, v88, v87,
                            v86,
                            v85,
                            v79,
                            v38,
                            v40,
                            v42,
                            v44);

            v116 = objc_alloc(MEMORY[0x1E0D183E8]);
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "category");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "location");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v7, "source");
            v112 = objc_msgSend(v7, "mapItemPlaceType");
            v45 = objc_msgSend(v7, "muid");
            v46 = objc_msgSend(v7, "resultProviderID");
            objc_msgSend(v7, "geoMapItemHandle");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "creationDate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "expirationDate");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "extendedAttributes");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "displayLanguage");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v78) = objc_msgSend(v7, "disputed");
            v117 = (void *)objc_msgSend(v116, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v125, v123, v121, v82, v119, v114, v112, v45, v46, v47, v48, v49, v50, v51, v78);

            v52 = [RTLearnedPlace alloc];
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v52, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v53, 0, 0, v117, 0, v83, v84);

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v7;
              _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_INFO, "selected new place, %@, with mapItem, %@", buf, 0x16u);
            }

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v151 = __Block_byref_object_copy__36;
            v152 = __Block_byref_object_dispose__36;
            v153 = 0;
            v55 = dispatch_semaphore_create(0);

            -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v149 = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v130[0] = MEMORY[0x1E0C809B0];
            v130[1] = 3221225472;
            v130[2] = __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke_295;
            v130[3] = &unk_1E9297038;
            v132 = buf;
            v58 = v55;
            v131 = v58;
            objc_msgSend(v56, "storePlaces:handler:", v57, v130);

            v12 = v58;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v12, v60))
              goto LABEL_26;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "timeIntervalSinceDate:", v59);
            v63 = v62;
            v64 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "filteredArrayUsingPredicate:", v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "firstObject");
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v64, "submitToCoreAnalytics:type:duration:", v68, 1, v63);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v157 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v157, 2u);
            }

            v70 = (void *)MEMORY[0x1E0CB35C8];
            v156 = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)v157 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, &v156, 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            if (v72)
            {
              v73 = objc_retainAutorelease(v72);

              v74 = 0;
            }
            else
            {
LABEL_26:
              v74 = 1;
              v73 = v127;
            }

            v75 = v73;
            if ((v74 & 1) == 0)
              objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v73);
            v32 = *(id *)(*(_QWORD *)&buf[8] + 40);
            if (v32)
              v76 = v32;

            _Block_object_dispose(buf, 8);
            v127 = v75;
          }
        }

        _Block_object_dispose(&v137, 8);
        _Block_object_dispose(&v143, 8);

        objc_autoreleasePoolPop(context);
        if (v128)
          *v128 = objc_retainAutorelease(v32);
        v31 = v34;
        a4 = v31;
        goto LABEL_35;
      }
    }
    else
    {
      v26 = 0;
    }
    v27 = 1;
    goto LABEL_11;
  }
  if (a4)
  {
    v28 = a4;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v154 = *MEMORY[0x1E0CB2D50];
    v30 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v31 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ requires a valid mapItem."), v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v155 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v129);
    a4 = 0;
    *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

  }
  return a4;
}

void __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke_295(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)submitVisitSettledStateMetricsForVisits:(id)a3 transitions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "entryDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "exitDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTVisitSettledStateMetrics submitVisitSettledStateMetricsForStartDate:endDate:isVisit:settledStateTransitionStore:](RTVisitSettledStateMetrics, "submitVisitSettledStateMetricsForStartDate:endDate:isVisit:settledStateTransitionStore:", v13, v14, 1, self->_settledStateTransitionStore);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v20, "startDate", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stopDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTVisitSettledStateMetrics submitVisitSettledStateMetricsForStartDate:endDate:isVisit:settledStateTransitionStore:](RTVisitSettledStateMetrics, "submitVisitSettledStateMetricsForStartDate:endDate:isVisit:settledStateTransitionStore:", v21, v22, 0, self->_settledStateTransitionStore);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

}

- (id)_transitionsForVisits:(id)a3 lastLearnedVisit:(id)a4 creationDate:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  RTLearnedTransition *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  RTLearnedTransition *v39;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  NSObject *v52;
  uint8_t *v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint8_t v60[16];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v43 = a4;
  v8 = a5;
  v46 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visits", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate", buf, 2u);
    }

LABEL_12:
    v44 = 0;
    goto LABEL_25;
  }
  if (v43)
  {
    v58 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = v10;
  }
  v47 = v7;
  if ((unint64_t)-[NSObject count](v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v7, "count") - 1);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](v7, "count") >= 2)
    {
      v12 = 1;
      v41 = *MEMORY[0x1E0D18598];
      v42 = *MEMORY[0x1E0CB2D50];
      do
      {
        -[NSObject objectAtIndexedSubscript:](v47, "objectAtIndexedSubscript:", v12 - 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectAtIndexedSubscript:](v47, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "exitDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "entryDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v55 = buf;
        v56 = 0x2020000000;
        v57 = 0;
        v14 = dispatch_semaphore_create(0);
        -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __79__RTLearnedLocationEngine__transitionsForVisits_lastLearnedVisit_creationDate___block_invoke;
        v51[3] = &unk_1E929A708;
        v53 = buf;
        v16 = v14;
        v52 = v16;
        objc_msgSend(v15, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v49, v48, v51);

        v17 = v16;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v17, v19))
          goto LABEL_20;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v18);
        v22 = v21;
        v23 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "filteredArrayUsingPredicate:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "submitToCoreAnalytics:type:duration:", v27, 1, v22);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v60, 2u);
        }

        v29 = (void *)MEMORY[0x1E0CB35C8];
        v59 = v42;
        *(_QWORD *)v60 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v41, 15, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = objc_retainAutorelease(v31);

        }
        else
        {
LABEL_20:
          v32 = 0;
        }

        v33 = v32;
        v34 = [RTLearnedTransition alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "expirationDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v34, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v35, v49, v48, v36, v37, v46, v38, *((_QWORD *)v55 + 3));

        if (v39)
          objc_msgSend(v44, "addObject:", v39);

        _Block_object_dispose(buf, 8);
        ++v12;
      }
      while (v12 < -[NSObject count](v47, "count"));
    }
  }
  else
  {
    v44 = (id)MEMORY[0x1E0C9AA60];
  }
  v7 = v47;
LABEL_25:

  return v44;
}

void __79__RTLearnedLocationEngine__transitionsForVisits_lastLearnedVisit_creationDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "failed fetching motion activities, error, %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = a2;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "dominant motion activity, %lu", (uint8_t *)&v8, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_harvestVisits:(id)a3 places:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  dispatch_time_t v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  RTMapItemProviderBluePOI *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  RTMapItemProviderBluePOI *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  const char *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  dispatch_semaphore_t v60;
  NSObject *log;
  uint64_t v62;
  id obj;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v69;
  _QWORD v70[5];
  id v71;
  NSObject *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE buf[12];
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  _QWORD v85[4];

  v85[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: placeToVisitsMap";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, v54, buf, 2u);
    goto LABEL_23;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v54 = "Invalid parameter not satisfying: placesMap";
    goto LABEL_25;
  }
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForObjectsFromCurrentDevice");
  log = objc_claimAutoreleasedReturnValue();

  v60 = dispatch_semaphore_create(0);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v55 = v5;
  obj = v5;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  v9 = 0;
  if (v62)
  {
    v58 = *(_QWORD *)v74;
    v57 = *MEMORY[0x1E0D18598];
    v56 = *MEMORY[0x1E0CB2D50];
    v59 = v7;
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(obj);
        v67 = v10;
        v65 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v10);
        objc_msgSend(v7, "objectForKeyedSubscript:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "places");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v12);

        -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __49__RTLearnedLocationEngine__harvestVisits_places___block_invoke;
        v70[3] = &unk_1E929AF18;
        v70[4] = self;
        v66 = v12;
        v71 = v66;
        v18 = v60;
        v72 = v18;
        objc_msgSend(v15, "fetchPlacesWithinDistance:location:predicate:handler:", v17, log, v70, 1000.0);

        v19 = v18;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = dispatch_time(0, 3600000000000);
        v22 = v11;
        if (dispatch_semaphore_wait(v19, v21))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceDate:", v20);
          v25 = v24;
          v26 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "filteredArrayUsingPredicate:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "submitToCoreAnalytics:type:duration:", v30, 1, v25);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v32 = (void *)MEMORY[0x1E0CB35C8];
          v85[0] = v56;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v85, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v57, 15, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v11;
          if (v34)
          {
            v22 = objc_retainAutorelease(v34);

          }
        }

        v64 = v22;
        v35 = [RTMapItemProviderBluePOI alloc];
        -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine fingerprintManager](self, "fingerprintManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine locationManager](self, "locationManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine placeInferenceQueryStore](self, "placeInferenceQueryStore");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationEngine platform](self, "platform");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[RTMapItemProviderBluePOI initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:](v35, "initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:", v36, v37, v38, v39, v40, v41, v42, v43);

        objc_msgSend(obj, "objectForKeyedSubscript:", v65);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "mapItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        v47 = -[RTMapItemProviderBluePOI harvestVisits:mapItem:harvestType:error:](v44, "harvestVisits:mapItem:harvestType:error:", v45, v46, 1, &v69);
        v48 = v69;

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = objc_msgSend(v45, "count");
          objc_msgSend(v66, "mapItem");
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = (void *)v51;
          *(_DWORD *)buf = 134218754;
          v53 = CFSTR("NO");
          if (v47)
            v53 = CFSTR("YES");
          *(_QWORD *)&buf[4] = v50;
          v78 = 2112;
          v79 = v51;
          v80 = 2112;
          v81 = v53;
          v82 = 2112;
          v83 = v48;
          _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "harvested %lu visits, mapItem, %@, success, %@, error %@", buf, 0x2Au);

        }
        v10 = v67 + 1;
        v9 = v64;
        v11 = v64;
        v7 = v59;
      }
      while (v62 != v67 + 1);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v62);
  }

  v5 = v55;
LABEL_23:

}

intptr_t __49__RTLearnedLocationEngine__harvestVisits_places___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trainingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitPlace:nearbyPlaces:", *(_QWORD *)(a1 + 40), v4);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_harvestFeedbackData
{
  void *v2;
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  RTMapItemProviderBluePOI *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_semaphore_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  dispatch_time_t v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  char v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  _BOOL4 v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  RTMapItemProviderBluePOI *v93;
  RTMapsSupportOptions *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *obj;
  NSObject *dsema;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  NSObject *v118;
  _BYTE *v119;
  uint64_t *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  NSObject *v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  _BYTE v141[12];
  __int16 v142;
  void *v143;
  __int16 v144;
  const __CFString *v145;
  __int16 v146;
  id v147;
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  _BYTE buf[24];
  uint64_t (*v157)(uint64_t, uint64_t);
  void (*v158)(uint64_t);
  id v159;
  _BYTE v160[128];
  _QWORD v161[4];

  v161[1] = *MEMORY[0x1E0C80C00];
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ReviewedPlaceLastFetchedDate"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "laterDate:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v96, v95);
  v94 = -[RTMapsSupportOptions initWithDateInterval:]([RTMapsSupportOptions alloc], "initWithDateInterval:", v91);
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__36;
  v139 = __Block_byref_object_dispose__36;
  v140 = 0;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__36;
  v133 = __Block_byref_object_dispose__36;
  v134 = 0;
  v3 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine mapsSupportManager](self, "mapsSupportManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke;
  v125[3] = &unk_1E9296EE0;
  v127 = &v135;
  v128 = &v129;
  v5 = v3;
  v126 = v5;
  objc_msgSend(v4, "fetchReviewedPlacesWithOptions:handler:", v94, v125);

  dsema = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v7))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "submitToCoreAnalytics:type:duration:", v15, 1, v10);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E0CB35C8];
  v150 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v150, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_retainAutorelease(v19);

    v21 = 0;
  }
  else
  {
LABEL_6:
    v20 = 0;
    v21 = 1;
  }

  v92 = v20;
  if ((v21 & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend((id)v136[5], "count");
      v24 = v130[5];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "fetched, %lu, reviewedPlaces, error, %@", buf, 0x16u);
    }

    if (!v130[5])
    {
      v105 = (void *)objc_opt_new();
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v25 = (id)v136[5];
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v121, v160, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v122;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v122 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
            if (objc_msgSend(v29, "hasUserReviewed"))
            {
              objc_msgSend(v29, "lastSuggestedReviewDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = objc_msgSend(v29, "muid") == 0;

                if (!v31)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v29, "muid"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "setObject:forKey:", v29, v32);

                }
              }
            }
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v121, v160, 16);
        }
        while (v26);
      }

      objc_msgSend(v105, "allKeys");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [RTMapItemProviderBluePOI alloc];
      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine fingerprintManager](self, "fingerprintManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine locationManager](self, "locationManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine placeInferenceQueryStore](self, "placeInferenceQueryStore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine platform](self, "platform");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[RTMapItemProviderBluePOI initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:](v33, "initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:", v34, v35, v36, v37, v38, v39, v40, v41);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v157 = __Block_byref_object_copy__36;
      v158 = __Block_byref_object_dispose__36;
      v159 = 0;
      v150 = 0;
      v151 = &v150;
      v152 = 0x3032000000;
      v153 = __Block_byref_object_copy__36;
      v154 = __Block_byref_object_dispose__36;
      v155 = 0;

      v42 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke_303;
      v117[3] = &unk_1E9296EE0;
      v119 = buf;
      v120 = &v150;
      v45 = v42;
      v118 = v45;
      objc_msgSend(v43, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v98, v44, v117);

      dsema = v45;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v47))
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "timeIntervalSinceDate:", v46);
      v50 = v49;
      v51 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "filteredArrayUsingPredicate:", v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "submitToCoreAnalytics:type:duration:", v55, 1, v50);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v141 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v141, 2u);
      }

      v57 = (void *)MEMORY[0x1E0CB35C8];
      v161[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v141 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v161, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v60 = objc_retainAutorelease(v59);

        v61 = 0;
      }
      else
      {
LABEL_27:
        v60 = 0;
        v61 = 1;
      }

      v92 = v60;
      if ((v61 & 1) == 0)
      {
LABEL_60:

        _Block_object_dispose(&v150, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_61;
      }
      if (v151[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = v151[5];
          *(_DWORD *)v141 = 138412290;
          *(_QWORD *)&v141[4] = v63;
          _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "Error was issued during fetching locationsOfInterest from store, error, %@", v141, 0xCu);
        }
LABEL_59:

        goto LABEL_60;
      }
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v62 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v64 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v113, v149, 16);
      if (!v64)
        goto LABEL_59;
      v103 = *(_QWORD *)v114;
      obj = v62;
LABEL_34:
      v104 = v64;
      v65 = 0;
      while (1)
      {
        if (*(_QWORD *)v114 != v103)
          objc_enumerationMutation(obj);
        v66 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v65);
        objc_msgSend(v66, "place");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "mapItem");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v66, "visits");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v107)
          goto LABEL_57;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v107, "muid"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v102, "containsObject:", v69))
          goto LABEL_56;
        v70 = objc_msgSend(v106, "count") == 0;

        if (!v70)
          break;
LABEL_57:

        if (++v65 == v104)
        {
          v62 = obj;
          v64 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v149, 16);
          if (!v64)
            goto LABEL_59;
          goto LABEL_34;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v107, "muid"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "objectForKey:", v71);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v72 = v106;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v109, v148, 16);
      if (v73)
      {
        v74 = *(_QWORD *)v110;
        do
        {
          for (j = 0; j != v73; ++j)
          {
            if (*(_QWORD *)v110 != v74)
              objc_enumerationMutation(v72);
            v76 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
            objc_msgSend(v69, "lastSuggestedReviewDate");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "exitDate");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "timeIntervalSinceDate:", v78);
            v80 = v79;

            if (v80 <= 259200.0)
              objc_msgSend(v68, "addObject:", v76);
          }
          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v109, v148, 16);
        }
        while (v73);
      }

      v108 = 0;
      v81 = -[RTMapItemProviderBluePOI harvestVisits:mapItem:harvestType:error:](v93, "harvestVisits:mapItem:harvestType:error:", v68, v107, 2, &v108);
      v82 = v108;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        v84 = objc_msgSend(v68, "count");
        *(_DWORD *)v141 = 134218754;
        v85 = CFSTR("NO");
        if (v81)
          v85 = CFSTR("YES");
        *(_QWORD *)&v141[4] = v84;
        v142 = 2112;
        v143 = v107;
        v144 = 2112;
        v145 = v85;
        v146 = 2112;
        v147 = v82;
        _os_log_impl(&dword_1D1A22000, v83, OS_LOG_TYPE_INFO, "harvested %lu visits as feedback data, mapItem, %@, success, %@, error %@", v141, 0x2Au);
      }

      if (v81)
      {
        -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKey:", CFSTR("ReviewedPlaceLastFetchedDate"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "lastSuggestedReviewDate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "laterDate:", v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setObject:forKey:", v89, CFSTR("ReviewedPlaceLastFetchedDate"));

      }
LABEL_56:

      goto LABEL_57;
    }
  }
LABEL_61:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

}

void __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke_303(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_maximumExpirationDateForLearnedPlace:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  NSObject *v26;
  __int16 v28;
  __int16 v29;
  __int16 v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 4838400.0);
  v5 = objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v30 = 0;
    v24 = "Invalid parameter not satisfying: place";
    v25 = (uint8_t *)&v30;
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    goto LABEL_21;
  }
  objc_msgSend(v3, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v29 = 0;
    v24 = "Invalid parameter not satisfying: place.mapItem";
    v25 = (uint8_t *)&v29;
    goto LABEL_20;
  }
  objc_msgSend(v3, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v28 = 0;
    v24 = "Invalid parameter not satisfying: place.mapItem.address";
    v25 = (uint8_t *)&v28;
    goto LABEL_20;
  }
  v9 = v5;
  objc_msgSend(v3, "expirationDate");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if ((unint64_t)v9 >= v10)
    v12 = v9;
  else
    v12 = (void *)v10;
  v13 = v12;

  v14 = v13;
  objc_msgSend(v3, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "expirationDate");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 >= v16)
    v17 = v14;
  else
    v17 = v16;
  v18 = v17;

  v19 = v18;
  objc_msgSend(v3, "mapItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "address");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "expirationDate");
  v22 = objc_claimAutoreleasedReturnValue();

  if (v19 >= v22)
    v23 = v19;
  else
    v23 = v22;
  v5 = v23;

LABEL_21:
  v26 = v5;

  return v26;
}

- (BOOL)_isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:(id)a3
{
  id v3;
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  int v26;
  id v27;
  __int16 v28;
  double v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disputed");

  if ((v5 & 1) != 0)
  {
    v6 = 10368000.0;
LABEL_7:
    objc_msgSend(v3, "mapItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isBeforeDate:", v21);

    goto LABEL_8;
  }
  objc_msgSend(v3, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iso3166CountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", &stru_1E92AB3A8);

  if ((v10 & 1) != 0)
  {
    v6 = 2592000.0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iso3166CountryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iso3166SubdivisionCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    v6 = dbl_1D1EED2D0[v17];
    goto LABEL_7;
  }
  v22 = 1;
  v6 = 0.0;
LABEL_8:
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = CFSTR("NO");
    v26 = 138412802;
    v27 = v3;
    if (v22)
      v24 = CFSTR("YES");
    v28 = 2048;
    v29 = v6;
    v30 = 2112;
    v31 = v24;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "ISO 3166 country code and subdivision code refresh for place, %@, refreshInterval, %.2f, required, %@", (uint8_t *)&v26, 0x20u);
  }

  return v22;
}

- (BOOL)_isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v16) = 0;
    v14 = "Invalid parameter not satisfying: place";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 2u);
    goto LABEL_15;
  }
  objc_msgSend(v3, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v16) = 0;
    v14 = "Invalid parameter not satisfying: place.mapItem";
    goto LABEL_14;
  }
  objc_msgSend(v4, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v14 = "Invalid parameter not satisfying: place.mapItem.address";
      goto LABEL_14;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geoAddressData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NO");
    if (!v10)
      v13 = CFSTR("YES");
    v16 = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "GEOAddressObject serialization, refresh for place, %@, required, %@", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:

  return v11;
}

- (id)_updateLearnedPlaceWithGEOAddressObjectSerialization:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  RTLearnedPlace *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  RTLearnedPlace *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  NSObject *dsema;
  _QWORD v74[4];
  NSObject *v75;
  uint8_t *v76;
  uint64_t *v77;
  uint64_t v78;
  id *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint8_t v84[8];
  uint8_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _BYTE buf[12];
  __int16 v91;
  id v92;
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTPlatform iPhoneDevice](self->_platform, "iPhoneDevice")
      && -[RTLearnedLocationEngine _isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:](self, "_isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:", v4))
    {
      v5 = objc_alloc(MEMORY[0x1E0D183F8]);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)objc_msgSend(v5, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v7);

      *(_QWORD *)v84 = 0;
      v85 = v84;
      v86 = 0x3032000000;
      v87 = __Block_byref_object_copy__36;
      v88 = __Block_byref_object_dispose__36;
      v89 = 0;
      v78 = 0;
      v79 = (id *)&v78;
      v80 = 0x3032000000;
      v81 = __Block_byref_object_copy__36;
      v82 = __Block_byref_object_dispose__36;
      v83 = 0;
      v8 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "geoMapItemHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __80__RTLearnedLocationEngine__updateLearnedPlaceWithGEOAddressObjectSerialization___block_invoke;
      v74[3] = &unk_1E9298D98;
      v76 = v84;
      v77 = &v78;
      v12 = v8;
      v75 = v12;
      objc_msgSend(v9, "fetchMapItemFromHandle:options:handler:", v11, v72, v74);

      dsema = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v14))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v93[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v93, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = objc_retainAutorelease(v26);

        v28 = 0;
      }
      else
      {
LABEL_13:
        v27 = 0;
        v28 = 1;
      }

      v71 = v27;
      if ((v28 & 1) == 0)
        objc_storeStrong(v79 + 5, v27);
      v31 = v79[5];
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v61 = v79[5];
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v61;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "error fetching GEOAddressObject serialization, %@", buf, 0xCu);
        }

        v29 = (RTLearnedPlace *)v4;
      }
      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*((id *)v85 + 5), "shortAddress");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v34;
          v91 = 2112;
          v92 = v4;
          _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "update GEOAddressObject serialization, %@, for place, %@", buf, 0x16u);

        }
        -[RTLearnedLocationEngine _maximumExpirationDateForLearnedPlace:](self, "_maximumExpirationDateForLearnedPlace:", v4);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mapItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mapItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "address");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_alloc(MEMORY[0x1E0D18330]);
        objc_msgSend(v69, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *((_QWORD *)v85 + 5);
        objc_msgSend(v69, "subPremises");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v69, "isIsland");
        objc_msgSend(v69, "creationDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "iso3166CountryCode");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "iso3166SubdivisionCode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v37, "initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v38, v39, v40, v41, v42, v70, v43, v44);

        v64 = objc_alloc(MEMORY[0x1E0D183E8]);
        objc_msgSend(v35, "identifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "category");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "location");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v35, "source");
        v46 = objc_msgSend(v35, "mapItemPlaceType");
        v47 = objc_msgSend(v35, "muid");
        v48 = objc_msgSend(v35, "resultProviderID");
        objc_msgSend(v35, "geoMapItemHandle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "creationDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "extendedAttributes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "displayLanguage");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v62) = objc_msgSend(v35, "disputed");
        v53 = (void *)objc_msgSend(v64, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v68, v67, v66, v65, v45, v63, v46, v47, v48, v49, v50, v70, v51, v52, v62);

        v54 = [RTLearnedPlace alloc];
        objc_msgSend(v4, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v4, "type");
        v57 = objc_msgSend(v4, "typeSource");
        objc_msgSend(v4, "customLabel");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "creationDate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v54, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v55, v56, v57, v53, v58, v59, v70);

      }
      _Block_object_dispose(&v78, 8);

      _Block_object_dispose(v84, 8);
    }
    else
    {
      v29 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v84 = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v84, 2u);
    }

    v29 = 0;
  }

  return v29;
}

void __80__RTLearnedLocationEngine__updateLearnedPlaceWithGEOAddressObjectSerialization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geoAddressObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  RTLearnedPlace *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  RTLearnedPlace *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  NSObject *dsema;
  _QWORD v87[4];
  NSObject *v88;
  uint8_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint8_t v104[8];
  uint8_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _BYTE buf[12];
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  id v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTPlatform iPhoneDevice](self->_platform, "iPhoneDevice")
      && -[RTLearnedLocationEngine _isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:](self, "_isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:", v4))
    {
      *(_QWORD *)v104 = 0;
      v105 = v104;
      v106 = 0x3032000000;
      v107 = __Block_byref_object_copy__36;
      v108 = __Block_byref_object_dispose__36;
      v109 = 0;
      v98 = 0;
      v99 = &v98;
      v100 = 0x3032000000;
      v101 = __Block_byref_object_copy__36;
      v102 = __Block_byref_object_dispose__36;
      v103 = 0;
      v92 = 0;
      v93 = (id *)&v92;
      v94 = 0x3032000000;
      v95 = __Block_byref_object_copy__36;
      v96 = __Block_byref_object_dispose__36;
      v97 = 0;
      v5 = objc_alloc(MEMORY[0x1E0D183F8]);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)objc_msgSend(v5, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v7);

      v8 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __87__RTLearnedLocationEngine__updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode___block_invoke;
      v87[3] = &unk_1E9297218;
      v89 = v104;
      v90 = &v98;
      v91 = &v92;
      v12 = v8;
      v88 = v12;
      objc_msgSend(v9, "fetchCountryAndSubdivisionCodesFromLocation:options:handler:", v11, v85, v87);

      dsema = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v14))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v115[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v115, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = objc_retainAutorelease(v26);

        v28 = 0;
      }
      else
      {
LABEL_13:
        v27 = 0;
        v28 = 1;
      }

      v84 = v27;
      if ((v28 & 1) == 0)
        objc_storeStrong(v93 + 5, v27);
      v31 = v93[5];
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v62 = v93[5];
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v62;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "error fetching ISO 3166 country and subdivision codes, %@", buf, 0xCu);
        }

        v29 = (RTLearnedPlace *)v4;
      }
      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v34 = *((_QWORD *)v105 + 5);
          v35 = v99[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v34;
          v111 = 2112;
          v112 = v35;
          v113 = 2112;
          v114 = v4;
          _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "update ISO 3166 country code, %@, subdivision code, %@, for place, %@", buf, 0x20u);
        }

        objc_msgSend(v4, "mapItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "address");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTLearnedLocationEngine _maximumExpirationDateForLearnedPlace:](self, "_maximumExpirationDateForLearnedPlace:", v4);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_alloc(MEMORY[0x1E0D18330]);
        objc_msgSend(v37, "identifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "geoAddressData");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subPremises");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subThoroughfare");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "thoroughfare");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subLocality");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "locality");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subAdministrativeArea");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "administrativeArea");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "administrativeAreaCode");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "postalCode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "country");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "countryCode");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "inlandWater");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ocean");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "areasOfInterest");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v37, "isIsland");
        objc_msgSend(v37, "creationDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v64) = v44;
        v66 = (void *)objc_msgSend(v65, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v81, v69, v79, v77, v75, v68, v73, v71, v70, v67, v38, v39, v40, v41,
                        v42,
                        v43,
                        v64,
                        v45,
                        v83,
                        *((_QWORD *)v105 + 5),
                        v99[5]);

        objc_msgSend(v4, "mapItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_alloc(MEMORY[0x1E0D183E8]);
        objc_msgSend(v46, "identifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "name");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "category");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "location");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v46, "source");
        v47 = objc_msgSend(v46, "mapItemPlaceType");
        v48 = objc_msgSend(v46, "muid");
        v49 = objc_msgSend(v46, "resultProviderID");
        objc_msgSend(v46, "geoMapItemHandle");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "creationDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "extendedAttributes");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "displayLanguage");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v63) = objc_msgSend(v46, "disputed");
        v54 = (void *)objc_msgSend(v74, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v82, v80, v78, v66, v76, v72, v47, v48, v49, v50, v51, v83, v52, v53, v63);

        v55 = [RTLearnedPlace alloc];
        objc_msgSend(v4, "identifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v4, "type");
        v58 = objc_msgSend(v4, "typeSource");
        objc_msgSend(v4, "customLabel");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "creationDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v55, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v56, v57, v58, v54, v59, v60, v83);

      }
      _Block_object_dispose(&v92, 8);

      _Block_object_dispose(&v98, 8);
      _Block_object_dispose(v104, 8);

    }
    else
    {
      v29 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v104 = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v104, 2u);
    }

    v29 = 0;
  }

  return v29;
}

void __87__RTLearnedLocationEngine__updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iso3166CountryCode");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v20, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iso3166SubdivisionCode");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = &stru_1E92AB3A8;

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = &stru_1E92AB3A8;
  }

  if (objc_msgSend(v5, "code") == -8)
    v19 = 0;
  else
    v19 = v5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v19);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_isUpdateLearnedPlaceWithPOICategoryCodeRequired:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  dispatch_time_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  BOOL v43;
  NSObject *v44;
  void *v45;
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  __int128 *v53;
  uint64_t *v54;
  SEL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _BYTE buf[12];
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  const __CFString *v66;
  __int128 v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v67) = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", (uint8_t *)&v67, 2u);
    }

    goto LABEL_26;
  }
  objc_msgSend(v5, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "mapItemPlaceType") != 2)
  {
    objc_msgSend(v6, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mapItemPlaceType");

    if (v10 == 1)
      goto LABEL_8;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 138412290;
      *(_QWORD *)((char *)&v67 + 4) = v45;
      _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, not POI or AOI, skip category update", (uint8_t *)&v67, 0xCu);

    }
LABEL_26:
    v43 = 0;
    goto LABEL_27;
  }

LABEL_8:
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  *(_QWORD *)&v67 = 0;
  *((_QWORD *)&v67 + 1) = &v67;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__36;
  v70 = __Block_byref_object_dispose__36;
  v71 = 0;
  objc_msgSend(v6, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D185C0]);

  if (v13)
  {
    *((_BYTE *)v57 + 24) = 1;
  }
  else
  {
    objc_msgSend(v6, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "components:fromDate:", 12, v17);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "dateFromComponents:", v48);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __76__RTLearnedLocationEngine__isUpdateLearnedPlaceWithPOICategoryCodeRequired___block_invoke;
      v50[3] = &unk_1E929AF40;
      v55 = a2;
      v53 = &v67;
      v47 = v18;
      v51 = v47;
      v54 = &v56;
      v22 = v19;
      v52 = v22;
      objc_msgSend(v20, "fetchLastVisitToPlaceWithIdentifier:handler:", v21, v50);

      v23 = v22;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v23, v25))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now", v47);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v24);
        v28 = v27;
        v29 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "filteredArrayUsingPredicate:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "submitToCoreAnalytics:type:duration:", v33, 1, v28);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v35 = (void *)MEMORY[0x1E0CB35C8];
        v72[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v72, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
      }

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    v41 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 40);
    if (*((_BYTE *)v57 + 24))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v39;
    v61 = 2112;
    v62 = v6;
    v63 = 2112;
    v64 = v41;
    v65 = 2112;
    v66 = v42;
    _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, POI Category refresh for place, %@, last visit, %@, required, %@", buf, 0x2Au);

  }
  v43 = *((_BYTE *)v57 + 24) != 0;
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v56, 8);
LABEL_27:

  return v43;
}

void __76__RTLearnedLocationEngine__isUpdateLearnedPlaceWithPOICategoryCodeRequired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, fetched visit, %@, error, %@", (uint8_t *)&v14, 0x20u);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  objc_msgSend(v10, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBeforeDate:", *(_QWORD *)(a1 + 32));

  if (v12)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_updateLearnedPlaceWithCategory:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  RTLearnedPlace *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  RTLearnedPlace *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  NSObject *v65;
  uint8_t *v66;
  uint64_t *v67;
  uint64_t v68;
  id *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t v74[8];
  uint8_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE buf[12];
  __int16 v81;
  id v82;
  _QWORD v83[4];

  v83[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTPlatform iPhoneDevice](self->_platform, "iPhoneDevice")
      && -[RTLearnedLocationEngine _isUpdateLearnedPlaceWithPOICategoryCodeRequired:](self, "_isUpdateLearnedPlaceWithPOICategoryCodeRequired:", v4))
    {
      v5 = objc_alloc(MEMORY[0x1E0D183F8]);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v5, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v7);

      *(_QWORD *)v74 = 0;
      v75 = v74;
      v76 = 0x3032000000;
      v77 = __Block_byref_object_copy__36;
      v78 = __Block_byref_object_dispose__36;
      v79 = 0;
      v68 = 0;
      v69 = (id *)&v68;
      v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__36;
      v72 = __Block_byref_object_dispose__36;
      v73 = 0;
      v8 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "geoMapItemHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __59__RTLearnedLocationEngine__updateLearnedPlaceWithCategory___block_invoke;
      v64[3] = &unk_1E9298D98;
      v66 = v74;
      v67 = &v68;
      v12 = v8;
      v65 = v12;
      objc_msgSend(v9, "fetchMapItemFromHandle:options:handler:", v11, v63, v64);

      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v83[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v83, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
LABEL_13:
        v28 = 0;
        v29 = 1;
      }

      v62 = v28;
      if ((v29 & 1) == 0)
        objc_storeStrong(v69 + 5, v28);
      v32 = v69[5];
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v52 = v69[5];
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v52;
          _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "error fetching category, %@", buf, 0xCu);
        }

        v30 = (RTLearnedPlace *)v4;
      }
      else
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v35 = *((_QWORD *)v75 + 5);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v35;
          v81 = 2112;
          v82 = v4;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "update POI Category, %@, for place, %@", buf, 0x16u);
        }

        -[RTLearnedLocationEngine _maximumExpirationDateForLearnedPlace:](self, "_maximumExpirationDateForLearnedPlace:", v4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mapItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_alloc(MEMORY[0x1E0D183E8]);
        objc_msgSend(v36, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *((_QWORD *)v75 + 5);
        objc_msgSend(v36, "address");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "location");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v36, "source");
        v37 = objc_msgSend(v36, "mapItemPlaceType");
        v38 = objc_msgSend(v36, "muid");
        v39 = objc_msgSend(v36, "resultProviderID");
        objc_msgSend(v36, "geoMapItemHandle");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "creationDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "extendedAttributes");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "displayLanguage");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = objc_msgSend(v36, "disputed");
        v44 = (void *)objc_msgSend(v56, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v60, v59, v55, v58, v57, v54, v37, v38, v39, v40, v41, v61, v42, v43, v53);

        v45 = [RTLearnedPlace alloc];
        objc_msgSend(v4, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v4, "type");
        v48 = objc_msgSend(v4, "typeSource");
        objc_msgSend(v4, "customLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "creationDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v45, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v46, v47, v48, v44, v49, v50, v61);

      }
      _Block_object_dispose(&v68, 8);

      _Block_object_dispose(v74, 8);
    }
    else
    {
      v30 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v74 = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v74, 2u);
    }

    v30 = 0;
  }

  return v30;
}

void __59__RTLearnedLocationEngine__updateLearnedPlaceWithCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "category");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mapItemPlaceType");
    v7 = v6 == 1000;

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v6 == 1000)
        v9 = CFSTR("YES");
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Map Item Place Type refresh for place, %@, required, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", (uint8_t *)&v11, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_updateLearnedPlaceWithMapItemPlaceType:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  RTLearnedPlace *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  RTLearnedPlace *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  NSObject *v65;
  uint64_t *v66;
  uint8_t *v67;
  uint8_t v68[8];
  uint8_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE buf[12];
  __int16 v79;
  id v80;
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTPlatform iPhoneDevice](self->_platform, "iPhoneDevice")
      && -[RTLearnedLocationEngine _isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:](self, "_isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:", v4))
    {
      v5 = objc_alloc(MEMORY[0x1E0D183F8]);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v5, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v7);

      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v77 = 0;
      *(_QWORD *)v68 = 0;
      v69 = v68;
      v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__36;
      v72 = __Block_byref_object_dispose__36;
      v73 = 0;
      v8 = dispatch_semaphore_create(0);
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "geoMapItemHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __67__RTLearnedLocationEngine__updateLearnedPlaceWithMapItemPlaceType___block_invoke;
      v64[3] = &unk_1E9298D98;
      v66 = &v74;
      v67 = v68;
      v12 = v8;
      v65 = v12;
      objc_msgSend(v9, "fetchMapItemFromHandle:options:handler:", v11, v63, v64);

      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v81[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v81, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
LABEL_13:
        v28 = 0;
        v29 = 1;
      }

      v62 = v28;
      if ((v29 & 1) == 0)
        objc_storeStrong((id *)v69 + 5, v28);
      v32 = *((_QWORD *)v69 + 5);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v52 = *((_QWORD *)v69 + 5);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v52;
          _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "error fetching category, %@", buf, 0xCu);
        }

        v30 = (RTLearnedPlace *)v4;
      }
      else
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0D183E8], "placeTypeToString:", v75[3]);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v35;
          v79 = 2112;
          v80 = v4;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "update Map Item Place Type, %@, for place, %@", buf, 0x16u);

        }
        -[RTLearnedLocationEngine _maximumExpirationDateForLearnedPlace:](self, "_maximumExpirationDateForLearnedPlace:", v4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mapItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_alloc(MEMORY[0x1E0D183E8]);
        objc_msgSend(v36, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "category");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "address");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "location");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v36, "source");
        v37 = v75[3];
        v38 = objc_msgSend(v36, "muid");
        v39 = objc_msgSend(v36, "resultProviderID");
        objc_msgSend(v36, "geoMapItemHandle");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "creationDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "extendedAttributes");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "displayLanguage");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = objc_msgSend(v36, "disputed");
        v44 = (void *)objc_msgSend(v55, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v60, v59, v58, v57, v56, v54, v37, v38, v39, v40, v41, v61, v42, v43, v53);

        v45 = [RTLearnedPlace alloc];
        objc_msgSend(v4, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v4, "type");
        v48 = objc_msgSend(v4, "typeSource");
        objc_msgSend(v4, "customLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "creationDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v45, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v46, v47, v48, v44, v49, v50, v61);

      }
      _Block_object_dispose(v68, 8);

      _Block_object_dispose(&v74, 8);
    }
    else
    {
      v30 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v68 = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v68, 2u);
    }

    v30 = 0;
  }

  return v30;
}

void __67__RTLearnedLocationEngine__updateLearnedPlaceWithMapItemPlaceType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "mapItemPlaceType");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateUnlabeledVisitsWithPlaceInformation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  dispatch_time_t v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  _BOOL4 v75;
  RTLearnedVisit *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  RTLearnedVisit *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  dispatch_time_t v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  char v103;
  NSObject *v104;
  void *v105;
  void *v106;
  _BOOL4 v107;
  RTLearnedTransition *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  RTLearnedTransition *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _BOOL4 v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  _BOOL4 v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  char v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  RTLearnedPlace *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  RTLearnedPlace *v169;
  NSObject *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *v180;
  NSObject *v181;
  void *v182;
  dispatch_time_t v183;
  id v184;
  void *v185;
  double v186;
  double v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  NSObject *v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  id v202;
  void *v203;
  uint64_t v204;
  dispatch_semaphore_t v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  id v233;
  void *v234;
  id v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  os_log_t log;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  dispatch_semaphore_t dsema;
  NSObject *dsemaa;
  dispatch_semaphore_t dsemab;
  dispatch_semaphore_t dsemac;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  id obj;
  id obja;
  id objb;
  id objc;
  uint64_t v267;
  unint64_t v268;
  id v269;
  uint64_t v270;
  id v271;
  void *v272;
  _QWORD v273[4];
  NSObject *v274;
  _QWORD v275[4];
  NSObject *v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  _QWORD v281[4];
  NSObject *v282;
  _BYTE *v283;
  uint64_t *v284;
  _QWORD v285[4];
  id v286;
  NSObject *v287;
  _QWORD v288[4];
  NSObject *v289;
  uint64_t *v290;
  uint64_t v291;
  uint64_t *v292;
  uint64_t v293;
  uint64_t v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  id v299;
  id v300;
  id v301;
  id v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  uint8_t v307[128];
  uint8_t v308[16];
  uint64_t v309;
  id *v310;
  uint64_t v311;
  uint64_t (*v312)(uint64_t, uint64_t);
  void (*v313)(uint64_t);
  id v314;
  _BYTE buf[24];
  uint64_t (*v316)(uint64_t, uint64_t);
  void (*v317)(uint64_t);
  id v318;
  _BYTE v319[128];
  _BYTE v320[128];
  _QWORD v321[4];

  v321[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v201 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v201, "count"));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v201, "count"));
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v201, "count"));
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v305 = 0u;
    v306 = 0u;
    v303 = 0u;
    v304 = 0u;
    obj = v201;
    v270 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v303, v320, 16);
    if (!v270)
      goto LABEL_27;
    v267 = *(_QWORD *)v304;
    while (1)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v304 != v267)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v303 + 1) + 8 * v4);
        v302 = 0;
        v301 = 0;
        -[RTLearnedLocationEngine _bestInferredMapItemForVisit:bestFinerGranularityInferredMapItem:error:](self, "_bestInferredMapItemForVisit:bestFinerGranularityInferredMapItem:error:", v5, &v302, &v301);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v302;
        v8 = v301;
        objc_msgSend(v6, "mapItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v300 = 0;
          -[RTLearnedLocationEngine _placeForMapItem:error:](self, "_placeForMapItem:error:", v9, &v300);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v300;
          if (v10)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v5;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2112;
              v316 = (uint64_t (*)(uint64_t, uint64_t))v10;
              _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "failed to find place for visit, %@, with mapitem, %@, error, %@", buf, 0x20u);
            }
            goto LABEL_13;
          }
          if (v11)
          {
            objc_msgSend(v6, "confidence");
            objc_msgSend(v5, "setPlaceConfidence:");
            objc_msgSend(v5, "setPlaceSource:", objc_msgSend(v6, "source"));
            objc_msgSend(v11, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v11, v13);

            objc_msgSend(v11, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "objectForKeyedSubscript:", v14);
            v12 = objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v12 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v207, "setObject:forKeyedSubscript:", v12, v15);

            }
            -[NSObject addObject:](v12, "addObject:", v5);
            if (v7)
            {
              objc_msgSend(v7, "mapItem");
              v261 = (void *)objc_claimAutoreleasedReturnValue();
              v299 = 0;
              -[RTLearnedLocationEngine _storedMapItemForMapItem:error:](self, "_storedMapItemForMapItem:error:", v261, &v299);
              v259 = (void *)objc_claimAutoreleasedReturnValue();
              dsema = (dispatch_semaphore_t)v299;
              if (dsema)
              {
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v5;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v261;
                  *(_WORD *)&buf[22] = 2112;
                  v316 = (uint64_t (*)(uint64_t, uint64_t))dsema;
                  _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "failed to find finer granularity mapItem for visit, %@, with mapitem, %@, error, %@", buf, 0x20u);
                }
              }
              else
              {
                v17 = objc_alloc(MEMORY[0x1E0D183A8]);
                objc_msgSend(v7, "confidence");
                v16 = objc_msgSend(v17, "initWithMapItem:confidence:source:", v259, objc_msgSend(v7, "source"), v18);
                objc_msgSend(v5, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v249, "setObject:forKeyedSubscript:", v16, v19);

              }
            }
LABEL_13:

          }
          goto LABEL_15;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "failed to find mapItem for visit, %@, error, %@", buf, 0x16u);
        }
LABEL_15:

        ++v4;
      }
      while (v270 != v4);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v303, v320, 16);
      v270 = v20;
      if (!v20)
      {
LABEL_27:

        v205 = dispatch_semaphore_create(0);
        v295 = 0u;
        v296 = 0u;
        v297 = 0u;
        v298 = 0u;
        -[NSObject allKeys](log, "allKeys");
        v202 = (id)objc_claimAutoreleasedReturnValue();
        v206 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v295, v319, 16);
        if (v206)
        {
          obja = 0;
          v204 = *(_QWORD *)v296;
          v251 = *MEMORY[0x1E0D18598];
          v252 = *MEMORY[0x1E0CB2D50];
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v296 != v204)
              {
                v22 = v21;
                objc_enumerationMutation(v202);
                v21 = v22;
              }
              v208 = v21;
              v253 = *(_QWORD *)(*((_QWORD *)&v295 + 1) + 8 * v21);
              -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLearnedLocationEngine _updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:](self, "_updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v24, v253);

              -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v253);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              -[RTLearnedLocationEngine _updateLearnedPlaceWithCategory:](self, "_updateLearnedPlaceWithCategory:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v26, v253);

              -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v253);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              -[RTLearnedLocationEngine _updateLearnedPlaceWithGEOAddressObjectSerialization:](self, "_updateLearnedPlaceWithGEOAddressObjectSerialization:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v28, v253);

              -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v253);
              v248 = (void *)objc_claimAutoreleasedReturnValue();

              -[RTLearnedLocationEngine _updateLearnedPlaceWithMapItemPlaceType:](self, "_updateLearnedPlaceWithMapItemPlaceType:", v248);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v29, v253);

              v291 = 0;
              v292 = &v291;
              v293 = 0x2020000000;
              v294 = 0;
              -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v288[0] = MEMORY[0x1E0C809B0];
              v288[1] = 3221225472;
              v288[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke;
              v288[3] = &unk_1E929A708;
              v290 = &v291;
              v31 = v205;
              v289 = v31;
              objc_msgSend(v30, "fetchCountOfVisitsToPlaceWithIdentifier:handler:", v253, v288);

              dsemaa = v31;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = dispatch_time(0, 3600000000000);
              v34 = obja;
              if (dispatch_semaphore_wait(dsemaa, v33))
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "timeIntervalSinceDate:", v32);
                v37 = v36;
                v38 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "filteredArrayUsingPredicate:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "firstObject");
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v38, "submitToCoreAnalytics:type:duration:", v42, 1, v37);
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                }

                v44 = (void *)MEMORY[0x1E0CB35C8];
                v309 = v252;
                *(_QWORD *)buf = CFSTR("semaphore wait timeout");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v309, 1);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "errorWithDomain:code:userInfo:", v251, 15, v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = obja;
                if (v46)
                {
                  v34 = objc_retainAutorelease(v46);

                }
              }

              v47 = v34;
              objc_msgSend(v207, "objectForKeyedSubscript:", v253);
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v262, "count");
              v49 = v292[3];
              if ((unint64_t)(v49 + v48) >= 2)
              {
                if (v49 == 1)
                {
                  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v285[0] = MEMORY[0x1E0C809B0];
                  v285[1] = 3221225472;
                  v285[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2;
                  v285[3] = &unk_1E929AF68;
                  v286 = v262;
                  v51 = dsemaa;
                  v287 = v51;
                  objc_msgSend(v50, "fetchLastVisitToPlaceWithIdentifier:handler:", v253, v285);

                  v52 = v51;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = dispatch_time(0, 3600000000000);
                  v55 = v47;
                  if (dispatch_semaphore_wait(v52, v54))
                  {
                    objc_msgSend(MEMORY[0x1E0C99D68], "now");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "timeIntervalSinceDate:", v53);
                    v58 = v57;
                    v59 = (void *)objc_opt_new();
                    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "filteredArrayUsingPredicate:", v60);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "firstObject");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v59, "submitToCoreAnalytics:type:duration:", v63, 1, v58);
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v64 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                    }

                    v65 = (void *)MEMORY[0x1E0CB35C8];
                    v309 = v252;
                    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v309, 1);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "errorWithDomain:code:userInfo:", v251, 15, v66);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();

                    v55 = v47;
                    if (v67)
                    {
                      v55 = objc_retainAutorelease(v67);

                    }
                  }

                  v68 = v55;
                  v47 = v68;
                }
                v268 = 0;
                v260 = 0;
                while (1)
                {
                  obja = v47;
                  if (v268 >= objc_msgSend(v262, "count"))
                    break;
                  objc_msgSend(v262, "objectAtIndexedSubscript:");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "exitDate");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "dateByAddingTimeInterval:", 4838400.0);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();

                  v72 = v260;
                  if (!v260 || (v72 = v260, objc_msgSend(v260, "compare:", v71) == -1))
                  {
                    v73 = v71;

                    v260 = v73;
                  }
                  objc_msgSend(v69, "expirationDate");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = objc_msgSend(v74, "compare:", v71) == -1;

                  if (v75)
                  {
                    v76 = [RTLearnedVisit alloc];
                    objc_msgSend(v69, "identifier");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "location");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "entryDate");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "exitDate");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "creationDate");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "placeConfidence");
                    v83 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v76, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v77, v78, v79, v80, v81, v71, v82, objc_msgSend(v69, "placeSource"));

                    if (v83)
                      objc_msgSend(v262, "setObject:atIndexedSubscript:", v83, v268);

                  }
                  v271 = v71;
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x3032000000;
                  v316 = __Block_byref_object_copy__36;
                  v317 = __Block_byref_object_dispose__36;
                  v318 = 0;
                  v309 = 0;
                  v310 = (id *)&v309;
                  v311 = 0x3032000000;
                  v312 = __Block_byref_object_copy__36;
                  v313 = __Block_byref_object_dispose__36;
                  v314 = 0;
                  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "identifier");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v281[0] = MEMORY[0x1E0C809B0];
                  v281[1] = 3221225472;
                  v281[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_3;
                  v281[3] = &unk_1E929AF90;
                  v283 = buf;
                  v284 = &v309;
                  v86 = dsemaa;
                  v282 = v86;
                  objc_msgSend(v84, "fetchTransitionWithDestinationIdentifier:handler:", v85, v281);

                  v87 = v86;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v87, v89))
                    goto LABEL_60;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "timeIntervalSinceDate:", v88);
                  v92 = v91;
                  v93 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "filteredArrayUsingPredicate:", v94);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v96, "firstObject");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v93, "submitToCoreAnalytics:type:duration:", v97, 1, v92);
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v98 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v308 = 0;
                    _os_log_fault_impl(&dword_1D1A22000, v98, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v308, 2u);
                  }

                  v99 = (void *)MEMORY[0x1E0CB35C8];
                  v321[0] = v252;
                  *(_QWORD *)v308 = CFSTR("semaphore wait timeout");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v308, v321, 1);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "errorWithDomain:code:userInfo:", v251, 15, v100);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v101)
                  {
                    v102 = objc_retainAutorelease(v101);

                    v103 = 0;
                  }
                  else
                  {
LABEL_60:
                    v103 = 1;
                    v102 = obja;
                  }

                  v47 = v102;
                  if ((v103 & 1) == 0)
                    objc_storeStrong(v310 + 5, v102);
                  if (v310[5] || (v105 = *(void **)(*(_QWORD *)&buf[8] + 40)) == 0)
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                    v104 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v308 = 138412290;
                      *(_QWORD *)&v308[4] = v69;
                      _os_log_error_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_ERROR, "failed to find transition for visit, %@", v308, 0xCu);
                    }
                  }
                  else
                  {
                    objc_msgSend(v105, "expirationDate");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = objc_msgSend(v106, "compare:", v271) == -1;

                    if (v107)
                    {
                      v108 = [RTLearnedTransition alloc];
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startDate");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "stopDate");
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "visitIdentifierOrigin");
                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "visitIdentifierDestination");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "creationDate");
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      v115 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v108, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v109, v110, v111, v112, v113, v114, v271, objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "predominantMotionActivityType"));

                      if (v115)
                        objc_msgSend(v203, "addObject:", v115);

                    }
                    v104 = v271;
                    objc_msgSend(v69, "identifier");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v249, "objectForKeyedSubscript:", v116);
                    v117 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v117)
                    {
                      objc_msgSend(v117, "mapItem");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "expirationDate");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      v120 = objc_msgSend(v119, "compare:", v104) == -1;

                      if (v120)
                      {
                        objc_msgSend(v117, "mapItem");
                        v121 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v121, "address");
                        v211 = (void *)objc_claimAutoreleasedReturnValue();

                        v209 = objc_alloc(MEMORY[0x1E0D18330]);
                        objc_msgSend(v211, "identifier");
                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "geoAddressData");
                        objb = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "subPremises");
                        v244 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "subThoroughfare");
                        v240 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "thoroughfare");
                        v236 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "subLocality");
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "locality");
                        v229 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "subAdministrativeArea");
                        v226 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "administrativeArea");
                        v223 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "administrativeAreaCode");
                        v221 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "postalCode");
                        v219 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "country");
                        v217 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "countryCode");
                        v214 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "inlandWater");
                        v213 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "ocean");
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "areasOfInterest");
                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                        v124 = objc_msgSend(v211, "isIsland");
                        objc_msgSend(v211, "creationDate");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "iso3166CountryCode");
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v211, "iso3166SubdivisionCode");
                        v127 = (void *)objc_claimAutoreleasedReturnValue();
                        LOBYTE(v200) = v124;
                        v210 = (void *)objc_msgSend(v209, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v122, objb, v244, v240, v236, v232, v229, v226, v223, v221, v219, v217, v214, v213,
                                         v212,
                                         v123,
                                         v200,
                                         v125,
                                         v104,
                                         v126,
                                         v127);

                        objc_msgSend(v117, "mapItem");
                        v128 = (void *)objc_claimAutoreleasedReturnValue();
                        v233 = objc_alloc(MEMORY[0x1E0D183E8]);
                        objc_msgSend(v128, "identifier");
                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "name");
                        objc = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "category");
                        v245 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "location");
                        v241 = (void *)objc_claimAutoreleasedReturnValue();
                        v230 = objc_msgSend(v128, "source");
                        v227 = objc_msgSend(v128, "mapItemPlaceType");
                        v224 = objc_msgSend(v128, "muid");
                        v130 = objc_msgSend(v128, "resultProviderID");
                        objc_msgSend(v128, "geoMapItemHandle");
                        v237 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "creationDate");
                        v131 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "extendedAttributes");
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "displayLanguage");
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        LOBYTE(v198) = objc_msgSend(v128, "disputed");
                        v134 = (void *)objc_msgSend(v233, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v129, objc, v245, v210, v241, v230, v227, v224, v130, v237, v131, v104, v132, v133, v198);

                        v135 = objc_alloc(MEMORY[0x1E0D183A8]);
                        objc_msgSend(v117, "confidence");
                        v137 = (void *)objc_msgSend(v135, "initWithMapItem:confidence:source:", v134, objc_msgSend(v117, "source"), v136);
                        objc_msgSend(v69, "identifier");
                        v138 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v249, "setObject:forKeyedSubscript:", v137, v138);

                      }
                    }

                  }
                  _Block_object_dispose(&v309, 8);

                  _Block_object_dispose(buf, 8);
                  ++v268;
                }
                v139 = v260;
                if (v260)
                {
                  v269 = v260;
                  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v253);
                  v272 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v272, "expirationDate");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  v141 = objc_msgSend(v140, "compare:", v269) == -1;

                  if (v141)
                  {
                    objc_msgSend(v272, "mapItem");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v142, "address");
                    v143 = (void *)objc_claimAutoreleasedReturnValue();

                    v215 = objc_alloc(MEMORY[0x1E0D18330]);
                    objc_msgSend(v143, "identifier");
                    v238 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "geoAddressData");
                    v234 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "subPremises");
                    v231 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "subThoroughfare");
                    v228 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "thoroughfare");
                    dsemab = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "subLocality");
                    v246 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "locality");
                    v242 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "subAdministrativeArea");
                    v225 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "administrativeArea");
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "administrativeAreaCode");
                    v220 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "postalCode");
                    v218 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "country");
                    v144 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "countryCode");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "inlandWater");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "ocean");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "areasOfInterest");
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    v149 = objc_msgSend(v143, "isIsland");
                    objc_msgSend(v143, "creationDate");
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "iso3166CountryCode");
                    v151 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "iso3166SubdivisionCode");
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v200) = v149;
                    v216 = (void *)objc_msgSend(v215, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v238, v234, v231, v228, dsemab, v246, v242, v225, v222, v220, v218, v144, v145, v146,
                                     v147,
                                     v148,
                                     v200,
                                     v150,
                                     v269,
                                     v151,
                                     v152);

                    objc_msgSend(v272, "mapItem");
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    v235 = objc_alloc(MEMORY[0x1E0D183E8]);
                    objc_msgSend(v153, "identifier");
                    dsemac = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "name");
                    v247 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "category");
                    v243 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "location");
                    v239 = (void *)objc_claimAutoreleasedReturnValue();
                    v154 = objc_msgSend(v153, "source");
                    v155 = objc_msgSend(v153, "mapItemPlaceType");
                    v156 = objc_msgSend(v153, "muid");
                    v157 = objc_msgSend(v153, "resultProviderID");
                    objc_msgSend(v153, "geoMapItemHandle");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "creationDate");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "extendedAttributes");
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v153, "displayLanguage");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v199) = objc_msgSend(v153, "disputed");
                    v162 = (void *)objc_msgSend(v235, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", dsemac, v247, v243, v216, v239, v154, v155, v156, v157, v158, v159, v269, v160, v161, v199);

                    v163 = [RTLearnedPlace alloc];
                    objc_msgSend(v272, "identifier");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    v165 = objc_msgSend(v272, "type");
                    v166 = objc_msgSend(v272, "typeSource");
                    objc_msgSend(v272, "customLabel");
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v272, "creationDate");
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    v169 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v163, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v164, v165, v166, v162, v167, v168, v269);

                    if (v169)
                      -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v169, v253);

                  }
                  v139 = v260;
                }

              }
              else
              {
                obja = v47;
              }

              _Block_object_dispose(&v291, 8);
              v21 = v208 + 1;
            }
            while (v208 + 1 != v206);
            v206 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v295, v319, 16);
          }
          while (v206);
        }
        else
        {
          obja = 0;
        }

        v170 = dispatch_group_create();
        v277 = 0u;
        v278 = 0u;
        v279 = 0u;
        v280 = 0u;
        v171 = v207;
        v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v277, v307, 16);
        if (v172)
        {
          v173 = *(_QWORD *)v278;
          do
          {
            for (i = 0; i != v172; ++i)
            {
              if (*(_QWORD *)v278 != v173)
                objc_enumerationMutation(v171);
              v175 = *(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * i);
              dispatch_group_enter(v170);
              -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "objectForKeyedSubscript:", v175);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v175);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              v275[0] = MEMORY[0x1E0C809B0];
              v275[1] = 3221225472;
              v275[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_310;
              v275[3] = &unk_1E9297150;
              v276 = v170;
              objc_msgSend(v176, "updateVisits:finerGranularityInferredMapItems:place:handler:", v177, v249, v178, v275);

            }
            v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v277, v307, 16);
          }
          while (v172);
        }

        dispatch_group_wait(v170, 0xFFFFFFFFFFFFFFFFLL);
        -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        v273[0] = MEMORY[0x1E0C809B0];
        v273[1] = 3221225472;
        v273[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2_311;
        v273[3] = &unk_1E9297150;
        v180 = v205;
        v274 = v180;
        objc_msgSend(v179, "updateWritableObjects:handler:", v203, v273);

        v181 = v180;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = dispatch_time(0, 3600000000000);
        v184 = obja;
        if (dispatch_semaphore_wait(v181, v183))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "timeIntervalSinceDate:", v182);
          v187 = v186;
          v188 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "filteredArrayUsingPredicate:", v189);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "firstObject");
          v192 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v188, "submitToCoreAnalytics:type:duration:", v192, 1, v187);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v193 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v193, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v193, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v194 = (void *)MEMORY[0x1E0CB35C8];
          v309 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v309, 1);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v195);
          v196 = (void *)objc_claimAutoreleasedReturnValue();

          v184 = obja;
          if (v196)
          {
            v184 = objc_retainAutorelease(v196);

          }
        }

        v197 = v184;
        -[RTLearnedLocationEngine _harvestVisits:places:](self, "_harvestVisits:places:", v171, log);

        goto LABEL_102;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: unlabeledVisits", buf, 2u);
  }
LABEL_102:

}

intptr_t __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "exitDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", 4838400.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v5);

    if (v7 == -1)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_310(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

intptr_t __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2_311(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_processVisits:(id)a3 forLastLearnedVisit:(id)a4 error:(id *)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _RTMap *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  dispatch_semaphore_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  dispatch_time_t v26;
  unint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  unint64_t v45;
  void *v46;
  dispatch_time_t v47;
  id v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  RTVisitMetrics *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  RTVisitMetrics *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  id v78;
  NSObject *v79;
  const __CFString *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  NSObject *v87;
  void *v88;
  id v89;
  _QWORD v90[4];
  NSObject *v91;
  _QWORD v92[4];
  NSObject *v93;
  _QWORD v94[4];
  id v95;
  _BYTE buf[12];
  __int16 v97;
  id v98;
  void *v99;
  _QWORD v100[4];

  v100[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = 0x1E0C99000uLL;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a3;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entry"), 1);
  v99 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLearnedLocationEngine _filterVisits:lastLearnedVisit:](self, "_filterVisits:lastLearnedVisit:", v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "submitting %lu visits", buf, 0xCu);
  }

  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &__block_literal_global_315);
  if (objc_msgSend(v15, "count"))
  {
    v17 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v15);
    v18 = MEMORY[0x1E0C809B0];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_316;
    v94[3] = &unk_1E929AFD8;
    v84 = v11;
    v19 = v11;
    v95 = v19;
    -[_RTMap withBlock:](v17, "withBlock:", v94);
    v20 = objc_claimAutoreleasedReturnValue();

    v85 = v7;
    -[RTLearnedLocationEngine _transitionsForVisits:lastLearnedVisit:creationDate:](self, "_transitionsForVisits:lastLearnedVisit:creationDate:", v20, v7, v19);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = dispatch_semaphore_create(0);
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v18;
    v92[1] = 3221225472;
    v92[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_2;
    v92[3] = &unk_1E9297150;
    v23 = v21;
    v93 = v23;
    objc_msgSend(v22, "storeVisits:handler:", v20, v92);

    v24 = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dispatch_time(0, 3600000000000);
    v27 = 0x1E0CB3000uLL;
    v86 = v15;
    v83 = (void *)v20;
    if (dispatch_semaphore_wait(v24, v26))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", v25);
      v30 = v29;
      v31 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "filteredArrayUsingPredicate:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "submitToCoreAnalytics:type:duration:", v35, 1, v30);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0D18598];
      v100[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v100, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 15, v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v40 = objc_retainAutorelease(v40);

      }
      v15 = v86;
      v8 = 0x1E0C99000;
      v18 = MEMORY[0x1E0C809B0];
      v27 = 0x1E0CB3000;
    }
    else
    {
      v40 = 0;
    }

    v41 = v40;
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v18;
    v90[1] = 3221225472;
    v90[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_319;
    v90[3] = &unk_1E9297150;
    v43 = v24;
    v91 = v43;
    objc_msgSend(v42, "storeTransitions:handler:", v88, v90);

    v44 = v43;
    objc_msgSend(*(id *)(v8 + 3432), "now");
    v45 = v8;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = dispatch_time(0, 3600000000000);
    v48 = v41;
    v87 = v44;
    if (dispatch_semaphore_wait(v44, v47))
    {
      objc_msgSend(*(id *)(v45 + 3432), "now");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "timeIntervalSinceDate:", v46);
      v51 = v50;
      v52 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(v27 + 2176), "predicateWithBlock:", &__block_literal_global_895);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "filteredArrayUsingPredicate:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "submitToCoreAnalytics:type:duration:", v56, 1, v51);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v58 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0D18598];
      v100[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v100, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "errorWithDomain:code:userInfo:", v59, 15, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = v41;
      v15 = v86;
      v44 = v87;
      if (v61)
      {
        v48 = objc_retainAutorelease(v61);

      }
    }

    v82 = v48;
    -[RTLearnedLocationEngine _updateUnlabeledVisitsWithPlaceInformation:](self, "_updateUnlabeledVisitsWithPlaceInformation:", v83);
    -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "visits");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObjectsFromArray:", v83);

    v64 = [RTVisitMetrics alloc];
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine locationStore](self, "locationStore");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine visitManager](self, "visitManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[RTVisitMetrics initWithDistanceCalculator:learnedLocationStore:locationStore:motionActivityManager:visitManager:](v64, "initWithDistanceCalculator:learnedLocationStore:locationStore:motionActivityManager:visitManager:", v65, v66, v67, v68, v69);

    v71 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v15, "firstObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "entry");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "exit");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(v71, "initWithStartDate:endDate:", v73, v75);

    v89 = 0;
    v77 = -[RTVisitMetrics collectBatchedMetricsForDateInterval:error:](v70, "collectBatchedMetricsForDateInterval:error:", v76, &v89);
    v78 = v89;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      v81 = CFSTR("NO");
      if (v77)
        v81 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v81;
      v97 = 2112;
      v98 = v78;
      _os_log_debug_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_DEBUG, "visit metrics submission, success, %@, error, %@", buf, 0x16u);
    }

    -[RTLearnedLocationEngine submitVisitSettledStateMetricsForVisits:transitions:](self, "submitVisitSettledStateMetricsForVisits:transitions:", v83, v88);
    v11 = v84;
    v7 = v85;
  }

  return 1;
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

RTLearnedVisit *__68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_316(uint64_t a1, void *a2)
{
  id v3;
  RTLearnedLocation *v4;
  void *v5;
  RTLearnedLocation *v6;
  void *v7;
  RTLearnedVisit *v8;
  void *v9;
  void *v10;
  void *v11;
  RTLearnedVisit *v12;

  v3 = a2;
  v4 = [RTLearnedLocation alloc];
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v4, "initWithLocation:dataPointCount:type:", v5, objc_msgSend(v3, "dataPointCount"), 1);

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", 2419200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [RTLearnedVisit alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:](v8, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:", v9, v6, v10, v11, *(_QWORD *)(a1 + 32), v7);
  return v12;
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "stored all visits with error, %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_319(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "stored all transitions with error, %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_trainVisitsFromDate:(id)a3 toDate:(id)a4 forLastLearnedVisit:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startTrainingVisits");

  v14 = (void *)MEMORY[0x1D8231EA8]();
  v28 = 0;
  -[RTLearnedLocationEngine _visitsFromDate:toDate:error:](self, "_visitsFromDate:toDate:error:", v10, v11, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v26 = v12;
    v27 = 0;
    v19 = -[RTLearnedLocationEngine _processVisits:forLastLearnedVisit:error:](self, "_processVisits:forLastLearnedVisit:error:", v15, v12, &v27);
    v20 = v27;
    v21 = v20;
    v18 = 0;
    if (!v19)
      v18 = v20;

    v12 = v26;
  }

  objc_autoreleasePoolPop(v14);
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stopTrainingVisits");

  if (a6)
    *a6 = objc_retainAutorelease(v18);
  if (!v18)
  {
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("LearnedLocationEngineTrainVisitsLastAttemptDate"));

  }
  return v18 == 0;
}

- (BOOL)_deferTrainingDueToRecentResetSync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("LearnedLocationEngineTrainVisitsLastAttemptDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -172800.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_msgSend(v6, "isOnOrBefore:", v7) & 1) == 0)
    {
      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = !v10 || (objc_msgSend(v10, "isAfterDate:", v4) & 1) == 0;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_deferTrainingDueToAvailability
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  BOOL v29;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE buf[12];
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__36;
  v39 = __Block_byref_object_dispose__36;
  v40 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__RTLearnedLocationEngine__deferTrainingDueToAvailability__block_invoke;
  v31[3] = &unk_1E92971F0;
  v33 = &v41;
  v34 = &v35;
  v6 = v4;
  v32 = v6;
  objc_msgSend(v5, "fetchAvailabilityWithHandler:", v31);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v50[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v50, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

    v23 = 0;
  }
  else
  {
LABEL_6:
    v22 = 0;
    v23 = 1;
  }

  v24 = v22;
  if ((v23 & 1) == 0)
    objc_storeStrong(v36 + 5, v22);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    +[RTStore availabilityToString:](RTStore, "availabilityToString:", v42[3]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36[5];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v26;
    v46 = 2112;
    v47 = v27;
    v48 = 2112;
    v49 = v28;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, availability, %@, error, %@", buf, 0x20u);

  }
  v29 = v42[3] != 2;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
  return v29;
}

void __58__RTLearnedLocationEngine__deferTrainingDueToAvailability__block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isOnOrBefore:", v5) & 1) == 0)
  {
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cloudStoreChangedSinceDate:", v4);

    v6 = v8 ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_homeLocationOfInterestExist
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  BOOL v25;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  SEL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint8_t buf[8];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__36;
  v40 = __Block_byref_object_dispose__36;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__RTLearnedLocationEngine__homeLocationOfInterestExist__block_invoke;
  v27[3] = &unk_1E929B000;
  v30 = &v36;
  v31 = a2;
  v29 = &v32;
  v6 = v4;
  v28 = v6;
  objc_msgSend(v5, "fetchLocationsOfInterestWithPlaceType:handler:", 1, v27);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v42, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

    v23 = 0;
  }
  else
  {
LABEL_6:
    v22 = 0;
    v23 = 1;
  }

  v24 = v22;
  if ((v23 & 1) == 0)
    objc_storeStrong(v37 + 5, v22);
  v25 = v37[5] || v33[3];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

void __55__RTLearnedLocationEngine__homeLocationOfInterestExist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v8;
    v14 = 2048;
    v15 = objc_msgSend(v5, "count");
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, home LOI count, %lu, errror, %@", (uint8_t *)&v12, 0x20u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "count");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  _QWORD v47[4];
  NSObject *v48;
  _BYTE *v49;
  uint64_t *v50;
  SEL v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _BYTE v56[12];
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[4];

  v65[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate");
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v62 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, input date, %@, current date, %@", buf, 0x20u);

  }
  if (v4 && objc_msgSend(v4, "isAfterDate:", v5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, defer, YES, reference date is in the future, %@", buf, 0x16u);

      v11 = 1;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__36;
    v63 = __Block_byref_object_dispose__36;
    v64 = 0;
    v14 = dispatch_semaphore_create(0);
    v15 = objc_alloc(MEMORY[0x1E0CB3588]);
    v16 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v5);
    if (!v4)

    v17 = objc_alloc(MEMORY[0x1E0D18508]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v17, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 1, v18, v45, 0, 0);

    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 1;
    -[RTLearnedLocationEngine visitManager](self, "visitManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __80__RTLearnedLocationEngine__deferTrainingOnBatteryDueToLackOfLongVisitSinceDate___block_invoke;
    v47[3] = &unk_1E929B000;
    v50 = &v52;
    v51 = a2;
    v49 = buf;
    v20 = v14;
    v48 = v20;
    objc_msgSend(v19, "fetchStoredVisitsWithOptions:handler:", v44, v47);

    v21 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v21, v23))
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v22);
    v26 = v25;
    v27 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v56 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v56, 2u);
    }

    v33 = (void *)MEMORY[0x1E0CB35C8];
    v65[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v56 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v65, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = objc_retainAutorelease(v35);

      v37 = 0;
    }
    else
    {
LABEL_16:
      v36 = 0;
      v37 = 1;
    }

    v10 = v36;
    if ((v37 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v36);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v39;
      if (*((_BYTE *)v53 + 24))
        v41 = CFSTR("YES");
      else
        v41 = CFSTR("NO");
      v42 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v56 = 138412802;
      *(_QWORD *)&v56[4] = v39;
      v57 = 2112;
      v58 = v41;
      v59 = 2112;
      v60 = v42;
      _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, defer, %@, error, %@", v56, 0x20u);

    }
    v11 = *((_BYTE *)v53 + 24) != 0;

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);

  }
  return v11;
}

void __80__RTLearnedLocationEngine__deferTrainingOnBatteryDueToLackOfLongVisitSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v24 = a3;
  v25 = a1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v6)
  {
    v7 = v6;
    v27 = 0;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(v25 + 56));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "exit");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "entry");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSinceDate:", v14);
          *(_DWORD *)buf = 138413058;
          v33 = v12;
          v34 = 2048;
          v35 = v27 + i;
          v36 = 2112;
          v37 = v10;
          v38 = 2048;
          v39 = v15;
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@, duration, %.1f", buf, 0x2Au);

        }
        objc_msgSend(v10, "exit");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v10, "entry");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v10, "exit");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "entry");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "timeIntervalSinceDate:", v21);
            v23 = v22;

            if (v23 > 900.0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v25 + 48) + 8) + 24) = 0;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      v27 += i;
    }
    while (v7);
  }
LABEL_15:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v25 + 32));
}

- (BOOL)_deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission
{
  void *v2;
  void *v3;
  char v4;

  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isAuthorized
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  char v10;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine locationManager](self, "locationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enabled");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, training authorized, %@", (uint8_t *)&v12, 0x16u);

  }
  -[RTLearnedLocationEngine locationManager](self, "locationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enabled");

  return v10;
}

- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, void *))a5;
  if (!-[RTLearnedLocationEngine _isAuthorized](self, "_isAuthorized"))
  {
    -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWasDeferred:", 4);

    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR("Deferring training due to not authorized.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = (unint64_t)v21;
      v44 = 2112;
      v45 = (unint64_t)v12;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  if (-[RTLearnedLocationEngine _deferTrainingDueToAvailability](self, "_deferTrainingDueToAvailability"))
  {
    -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWasDeferred:", 2);

    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Deferring training due to availability of the learned location store.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (unint64_t)v12;
LABEL_37:
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (-[RTLearnedLocationEngine _deferTrainingDueToRecentResetSync](self, "_deferTrainingDueToRecentResetSync"))
  {
    -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWasDeferred:", 1);

    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Deferring training due to reset sync after last import.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (unint64_t)v12;
      goto LABEL_37;
    }
LABEL_10:

LABEL_11:
    v9[2](v9, v12);
    goto LABEL_12;
  }
  v35 = 0;
  -[RTLearnedLocationEngine _lastVisitWithError:](self, "_lastVisitWithError:", &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v35;
  if (v17)
  {
    v11 = v17;
    v9[2](v9, v17);
  }
  else
  {
    objc_msgSend(v12, "exitDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isAfterDate:", v23))
    {
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deferring training due to start date, %@, cannot be later than end date, %@"), v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = (unint64_t)v26;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (v9)
        v9[2](v9, v26);

    }
    else
    {
      if (a4 != 2)
        goto LABEL_31;
      v28 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "exitDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (uint64_t)v29;
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v34 = (void *)v30;
      objc_msgSend(v28, "dateWithTimeInterval:sinceDate:", v30, 1800.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[RTLearnedLocationEngine _deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:](self, "_deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:", v31);

      if (!v29)
      if (v32)
      {
        -[RTLearnedLocationEngine setRegisterTrainOnBattery:](self, "setRegisterTrainOnBattery:", 0);
        v9[2](v9, 0);
      }
      else
      {
LABEL_31:
        -[RTLearnedLocationEngine _trainWithFromDate:ToDate:forLastLearnedVisit:reason:mode:handler:](self, "_trainWithFromDate:ToDate:forLastLearnedVisit:reason:mode:handler:", v22, v23, v12, a3, a4, v9);
        if (self->_tripSegmentProvider)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            v43 = a3;
            v44 = 2048;
            v45 = a4;
            _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "RTLearnedLocationEngine:_trainForReason, reason, %lu, mode, %lu, invoking startReconstructTripSegment.", buf, 0x16u);
          }

          -[RTTripSegmentProvider startReconstructTripSegmentWithTrainMode:](self->_tripSegmentProvider, "startReconstructTripSegmentWithTrainMode:", a4);
        }
      }
    }

    v11 = 0;
  }
LABEL_12:

}

- (void)_trainWithFromDate:(id)a3 ToDate:(id)a4 forLastLearnedVisit:(id)a5 reason:(unint64_t)a6 mode:(unint64_t)a7 handler:(id)a8
{
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  BOOL v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  __CFString *v41;
  BOOL v42;
  id v43;
  NSObject *v44;
  BOOL v45;
  id v46;
  NSObject *v47;
  void *v48;
  char v49;
  id v50;
  id v51;
  BOOL v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v62;
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
  void (**v73)(id, void *);
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v74 = a5;
  v73 = (void (**)(id, void *))a8;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v19, v20);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "UTF8String");
  v72 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v62 = (objc_class *)objc_opt_class();
    NSStringFromClass(v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v82 = v63;
    v83 = 2112;
    v84 = (unint64_t)v64;
    _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v82 = v24;
    v83 = 2048;
    v84 = a6;
    v85 = 2048;
    v86 = a7;
    v87 = 2112;
    v88 = v25;
    v89 = 2112;
    v90 = v26;
    v91 = 2112;
    v92 = v74;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, reason, %lu, mode, %lu, from %@, to %@, last visit, %@", buf, 0x3Eu);

  }
  -[RTLearnedLocationEngine dailyTrainingSessionCounter](self, "dailyTrainingSessionCounter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "increaseCountForMode:reason:", a7, a6);

  -[RTLearnedLocationEngine _setupTrainingMetricsFromDate:toDate:mode:reason:](self, "_setupTrainingMetricsFromDate:toDate:mode:reason:", v15, v16, a7, a6);
  v28 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("before %@"), v29);
  v30 = objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine _logDatabasesWithReason:](self, "_logDatabasesWithReason:", v30);

  v80 = 0;
  LOBYTE(v30) = -[RTLearnedLocationEngine _retrainVisitsWithoutPlaces:](self, "_retrainVisitsWithoutPlaces:", &v80);
  v31 = v80;
  if ((v30 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v65;
      v83 = 2112;
      v84 = (unint64_t)v31;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, retrainVisitsWithoutPlaces error, %@", buf, 0x16u);

    }
  }
  v79 = 0;
  v33 = -[RTLearnedLocationEngine _trainVisitsFromDate:toDate:forLastLearnedVisit:error:](self, "_trainVisitsFromDate:toDate:forLastLearnedVisit:error:", v15, v16, v74, &v79);
  v34 = v79;
  if (!v33)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v66;
      v83 = 2112;
      v84 = (unint64_t)v34;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@, trainVisits error, %@", buf, 0x16u);

    }
  }
  v70 = v15;
  v71 = v31;
  if (a7 == 2)
  {
    v36 = v34;
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", CFSTR("LearnedLocationEngineTrainLightweightLastCompletionDate"));
    v38 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        -[NSObject stringFromDate](v38, "stringFromDate");
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = CFSTR("nil");
      }
      *(_DWORD *)buf = 138412546;
      v82 = v40;
      v83 = 2112;
      v84 = (unint64_t)v41;
      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "---------> %@, trainLightweightLastCompletionDate, %@, calling appendVisitsToLocationsOfInterestModel <---------", buf, 0x16u);
      if (v38)

    }
    v78 = 0;
    v52 = -[RTLearnedLocationEngine _appendVisitsToLocationsOfInterestModelWithError:](self, "_appendVisitsToLocationsOfInterestModelWithError:", &v78);
    v51 = v78;
    if (v52)
    {
      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setObject:forKey:", v54, CFSTR("LearnedLocationEngineTrainLightweightLastCompletionDate"));

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
LABEL_39:

        v50 = 0;
        v46 = 0;
        v43 = 0;
        goto LABEL_40;
      }
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v82 = v56;
      _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "---------> %@, appendVisitsToLocationsOfInterestModel finished<---------", buf, 0xCu);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v56;
      v83 = 2112;
      v84 = (unint64_t)v51;
      _os_log_error_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_ERROR, "%@, appendVisitsToLocationsOfInterestModel error, %@", buf, 0x16u);
    }

    goto LABEL_39;
  }
  v77 = 0;
  v42 = -[RTLearnedLocationEngine _trainLocationsOfInterestModelWithError:](self, "_trainLocationsOfInterestModelWithError:", &v77);
  v43 = v77;
  if (!v42)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v67;
      v83 = 2112;
      v84 = (unint64_t)v43;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@, trainLocationsOfInterestModel error, %@", buf, 0x16u);

    }
  }
  v76 = 0;
  v45 = -[RTLearnedLocationEngine _removeUnusedMapItems:](self, "_removeUnusedMapItems:", &v76);
  v46 = v76;
  if (!v45)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v68;
      v83 = 2112;
      v84 = (unint64_t)v46;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, remove unused map items error, %@", buf, 0x16u);

    }
  }
  v36 = v34;
  -[RTLearnedLocationEngine pointOfInterestMetricsManager](self, "pointOfInterestMetricsManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v49 = objc_msgSend(v48, "submitMetricsWithError:", &v75);
  v50 = v75;

  if ((v49 & 1) != 0)
  {
    v51 = 0;
    goto LABEL_41;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v82 = v69;
    v83 = 2112;
    v84 = (unint64_t)v50;
    _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, submit metrics error, %@", buf, 0x16u);

  }
  v51 = 0;
LABEL_40:

LABEL_41:
  v57 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringWithFormat:", CFSTR("after %@"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine _logDatabasesWithReason:](self, "_logDatabasesWithReason:", v59);

  -[RTLearnedLocationEngine _teardownTrainingMetrics](self, "_teardownTrainingMetrics");
  if (v73)
  {
    _RTSafeArray();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2](v73, v61);

  }
}

- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  unint64_t v18;
  unint64_t v19;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke;
  v14[3] = &unk_1E929B050;
  v18 = a3;
  v19 = a4;
  v16 = v9;
  v17 = a2;
  v14[4] = self;
  v15 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, v14);

}

void __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30[2];
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LearnedLocationEngineTrainVisitsLastAttemptDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("LearnedLocationEngineTrainLightweightLastCompletionDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v8, "stringFromDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v33 = v12;
    v34 = 2048;
    v35 = v14;
    v36 = 2048;
    v37 = v13;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "--------->%@, start training, reason, %lu, mode, %lu, trainLocationsOfInterestLastCompletionDate (full-training) %@, lastLightweightTrainingCompletionDate %@ <---------", buf, 0x34u);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 72);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke_348;
  v25[3] = &unk_1E929B028;
  objc_copyWeak(v30, (id *)buf);
  v20 = *(id *)(a1 + 48);
  v21 = *(void **)(a1 + 56);
  v29 = v20;
  v30[1] = v21;
  v31 = *(_OWORD *)(a1 + 64);
  v22 = *(id *)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 32);
  v26 = v22;
  v27 = v23;
  v24 = v6;
  v28 = v24;
  objc_msgSend(v17, "_trainForReason:mode:handler:", v18, v19, v25);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);

}

void __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke_348(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v15 = 138413314;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2112;
    v22 = v3;
    v23 = 2048;
    v24 = v10;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished training, reason, %lu, mode, %lu, error, %@, latency, %.2f<---------", (uint8_t *)&v15, 0x34u);

  }
  if (!v3)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v11, "didUpdateWithIntervalSinceLastUpdate:");

  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    v14 = *(void (**)(void))(v13 + 16);
LABEL_9:
    v14();
  }

}

- (BOOL)_trainLocationsOfInterestModelWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[RTLearnedLocationEngine _homeLocationOfInterestExist](self, "_homeLocationOfInterestExist")
    || !-[RTLearnedLocationEngine _deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:](self, "_deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:", v7))
  {
    -[RTLearnedLocationEngine willBeginTraining](self, "willBeginTraining");
    v49 = 0;
    v12 = -[RTLearnedLocationEngine _reconcileLearnedLocationsWithError:](self, "_reconcileLearnedLocationsWithError:", &v49);
    v13 = v49;
    if (!v12)
    {
      -[RTLearnedLocationEngine didFinishTraining](self, "didFinishTraining");
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v39;
        v52 = 2112;
        v53 = v13;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, _reconcileLearnedLocationsWithError, error, %@", buf, 0x16u);

      }
      v11 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      goto LABEL_41;
    }
    v48 = 0;
    v14 = -[RTLearnedLocationEngine _relabelWithError:](self, "_relabelWithError:", &v48);
    v15 = v48;
    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v40;
        v52 = 2112;
        v53 = v15;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, _relabelWithError, error, %@", buf, 0x16u);

      }
    }
    v47 = 0;
    v17 = -[RTLearnedLocationEngine _classifyPlaceTypes:](self, "_classifyPlaceTypes:", &v47);
    v18 = v47;
    if (!v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v41;
        v52 = 2112;
        v53 = v13;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, _classifyPlaceTypes, error, %@", buf, 0x16u);

      }
    }
    v46 = 0;
    v20 = -[RTLearnedLocationEngine _consolidateKnownPlaceTypesWithError:](self, "_consolidateKnownPlaceTypesWithError:", &v46);
    v21 = v46;
    if (!v20)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v42;
        v52 = 2112;
        v53 = v21;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, _consolidateKnownPlaceTypesWithError, error, %@", buf, 0x16u);

      }
    }
    if (v13 || v15 || v18 || v21)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v51 = v43;
        v52 = 2112;
        v53 = v13;
        v54 = 2112;
        v55 = v15;
        v56 = 2112;
        v57 = v18;
        v58 = 2112;
        v59 = v21;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, skip saving known place type identifiers, reconciliationError, %@, relabelError, %@, classifyPlaceTypesError, %@, consolidateKnownPlaceTypesError, %@", buf, 0x34u);

      }
      v24 = 0;
    }
    else
    {
      v45 = 0;
      v23 = -[RTLearnedLocationEngine _saveIdentifiersOfKnownPlaceTypesWithError:](self, "_saveIdentifiersOfKnownPlaceTypesWithError:", &v45);
      v24 = v45;
      if (v23)
      {
LABEL_35:
        -[RTLearnedLocationEngine didFinishTraining](self, "didFinishTraining");
        _RTSafeArray();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v29 == 0;
        if (v29)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v29);
        }
        else
        {
          -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager", v15, v18, v21, v24, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v44 = v24;
          v31 = v13;
          v32 = v21;
          v33 = v7;
          v34 = v18;
          v35 = v15;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKey:", v36, CFSTR("LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"));

          v15 = v35;
          v18 = v34;
          v7 = v33;
          v21 = v32;
          v13 = v31;
          v24 = v44;

          -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"));

        }
LABEL_41:

        goto LABEL_42;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v26;
        v52 = 2112;
        v53 = v24;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, _saveIdentifiersOfKnownPlaceTypesWithError, error, %@", buf, 0x16u);

      }
    }

    goto LABEL_35;
  }
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWasDeferred:", 3);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v10;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Deferring training due to no change of cloud store since last training date, %@.", buf, 0xCu);

  }
  v11 = 0;
  if (a3)
    *a3 = 0;
LABEL_42:

  return v11;
}

- (void)_submitPlaceTypeClassificationFeatureInputMetrics
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  intptr_t v8;
  uint64_t *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  objc_class *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  objc_class *v69;
  id v70;
  void *v71;
  uint64_t v73;
  uint64_t v74;
  id obj;
  NSObject *dsema;
  uint64_t v77;
  uint64_t v78;
  RTLearnedLocationEngine *v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  NSObject *v84;
  void *v85;
  uint8_t *v86;
  uint64_t *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  NSObject *v93;
  _QWORD *v94;
  uint64_t *v95;
  _QWORD v96[5];
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  _BYTE buf[12];
  __int16 v105;
  void *v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  _BYTE v111[128];
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint8_t v118[8];
  uint8_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _QWORD v124[4];

  v124[1] = *MEMORY[0x1E0C80C00];
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__36;
  v102 = __Block_byref_object_dispose__36;
  v103 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy__36;
  v96[4] = __Block_byref_object_dispose__36;
  v97 = 0;
  v3 = dispatch_semaphore_create(0);
  v79 = self;
  -[RTLearnedLocationEngine contactsManager](self, "contactsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke;
  v92[3] = &unk_1E929B078;
  v94 = v96;
  v5 = v3;
  v93 = v5;
  v95 = &v98;
  objc_msgSend(v4, "fetchMeCardWithHandler:", v92);

  dsema = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 3600000000000);
  v8 = dispatch_semaphore_wait(dsema, v7);
  v9 = (uint64_t *)MEMORY[0x1E0D18598];
  if (!v8)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v6);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v118 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v118, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v112 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v118 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v112, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *v9, 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

  }
  else
  {
LABEL_6:
    v22 = 0;
  }

  v80 = v22;
  *(_QWORD *)v118 = 0;
  v119 = v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__36;
  v122 = __Block_byref_object_dispose__36;
  v123 = 0;
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__36;
  v116 = __Block_byref_object_dispose__36;
  v117 = 0;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend((id)v99[5], "postalAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
  if (v24)
  {
    v77 = *(_QWORD *)v89;
    v73 = *v9;
    v74 = *MEMORY[0x1E0CB2D50];
    obj = v23;
    do
    {
      v78 = v24;
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v89 != v77)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        if (objc_msgSend(v26, "labelType") == 1 || objc_msgSend(v26, "labelType") == 2)
        {
          v27 = objc_alloc(MEMORY[0x1E0D183F8]);
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v27, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v29);

          -[RTLearnedLocationEngine mapServiceManager](v79, "mapServiceManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "geoDictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke_2;
          v83[3] = &unk_1E929B0A0;
          v33 = dsema;
          v84 = v33;
          v85 = v26;
          v86 = v118;
          v87 = &v112;
          objc_msgSend(v31, "fetchMapItemsFromAddressDictionary:options:handler:", v32, v30, v83);

          v34 = v33;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = dispatch_time(0, 3600000000000);
          v37 = v80;
          if (dispatch_semaphore_wait(v34, v36))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "timeIntervalSinceDate:", v35);
            v40 = v39;
            v41 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "filteredArrayUsingPredicate:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "firstObject");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "submitToCoreAnalytics:type:duration:", v45, 1, v40);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v47 = (void *)MEMORY[0x1E0CB35C8];
            v124[0] = v74;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v124, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "errorWithDomain:code:userInfo:", v73, 15, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = v80;
            if (v49)
            {
              v37 = objc_retainAutorelease(v49);

            }
          }

          v50 = v37;
          v80 = v50;
        }
      }
      v23 = obj;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
    }
    while (v24);
  }

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *((_QWORD *)v119 + 5);
    v56 = v113[5];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v53;
    v105 = 2112;
    v106 = v54;
    v107 = 2112;
    v108 = v55;
    v109 = 2112;
    v110 = v56;
    _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, %@, home map item, %@, work map item, %@", buf, 0x2Au);

  }
  if (*((_QWORD *)v119 + 5) && v113[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v57 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateByAddingTimeInterval:](v57, "dateByAddingTimeInterval:", -3628800.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = *((_QWORD *)v119 + 5);
    v60 = v113[5];
    v81 = 0;
    v82 = 0;
    -[RTLearnedLocationEngine calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:endDate:homeMapItem:workMapItem:locationsOfOthers:error:](v79, "calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:endDate:homeMapItem:workMapItem:locationsOfOthers:error:", v58, v57, v59, v60, &v82, &v81);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v82;
    v63 = v81;
    if (!v63)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_INFO, "Start submission of home and work replayable CA metrics.", buf, 2u);
      }

      -[RTLearnedLocationEngine calculateNewMetricsAndSubmitAlongWithTheOldMetrics:startDate:endDate:homeMapItem:workMapItem:distanceThresholdArray:locationsOfOthers:](v79, "calculateNewMetricsAndSubmitAlongWithTheOldMetrics:startDate:endDate:homeMapItem:workMapItem:distanceThresholdArray:locationsOfOthers:", v61, v58, v57, *((_QWORD *)v119 + 5), v113[5], &unk_1E932C220, v62);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "timeIntervalSinceDate:", v64);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v68;
        _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "End submission of home and work replayable CA metrics, latency, %.2f", buf, 0xCu);

      }
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v70;
      v105 = 2112;
      v106 = v71;
      _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%@, %@, submission skipped due to invalid home or work map items", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(v118, 8);

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(&v98, 8);

}

void __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!a3)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "labelType") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
LABEL_6:
      v7 = *(_QWORD *)(v6 + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v5;

      goto LABEL_7;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "labelType") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 56);
      goto LABEL_6;
    }
  }
LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:(id)a3 endDate:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  NSObject *v21;
  dispatch_time_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *dsema;
  _QWORD v51[4];
  NSObject *v52;
  uint8_t *v53;
  uint64_t *v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint8_t v68[16];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  if (a8)
  {
    if (v14)
    {
      if (v15)
      {
        if (v16)
        {
          if (v17)
          {
            if (a7)
            {
              *(_QWORD *)buf = 0;
              v62 = buf;
              v63 = 0x3032000000;
              v64 = __Block_byref_object_copy__36;
              v65 = __Block_byref_object_dispose__36;
              v66 = 0;
              v55 = 0;
              v56 = (id *)&v55;
              v57 = 0x3032000000;
              v58 = __Block_byref_object_copy__36;
              v59 = __Block_byref_object_dispose__36;
              v60 = 0;
              v19 = dispatch_semaphore_create(0);
              -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __145__RTLearnedLocationEngine_calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate_endDate_homeMapItem_workMapItem_locationsOfOthers_error___block_invoke;
              v51[3] = &unk_1E9296EE0;
              v53 = buf;
              v54 = &v55;
              v21 = v19;
              v52 = v21;
              objc_msgSend(v20, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v14, v15, v51);

              dsema = v21;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(dsema, v22))
                goto LABEL_27;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "timeIntervalSinceDate:", v49);
              v25 = v24;
              v47 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "filteredArrayUsingPredicate:", v48);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "firstObject");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v47, "submitToCoreAnalytics:type:duration:", v46, 1, v25);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v68 = 0;
                _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v68, 2u);
              }

              v29 = (void *)MEMORY[0x1E0CB35C8];
              v67 = *MEMORY[0x1E0CB2D50];
              *(_QWORD *)v68 = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                v32 = objc_retainAutorelease(v31);

                v33 = 0;
              }
              else
              {
LABEL_27:
                v32 = 0;
                v33 = 1;
              }

              v41 = v32;
              if ((v33 & 1) == 0)
                objc_storeStrong(v56 + 5, v32);
              v42 = v56[5];
              if (v42)
              {
                v35 = 0;
              }
              else
              {
                -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTPlaceDataMetrics generateDictionaryOfOldMetricsWithLearnedLocationStore:locationsOfInterest:homeMapItem:workMapItem:locationsOfOthers:](RTPlaceDataMetrics, "generateDictionaryOfOldMetricsWithLearnedLocationStore:locationsOfInterest:homeMapItem:workMapItem:locationsOfOthers:", v45, *((_QWORD *)v62 + 5), v16, v18, a7);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = v56[5];
              }
              *a8 = objc_retainAutorelease(v42);

              _Block_object_dispose(&v55, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_36;
            }
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outLocationsOfOthers", buf, 2u);
            }

            _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outLocationsOfOthers"));
            v37 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workMapItem", buf, 2u);
            }

            _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workMapItem"));
            v37 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeMapItem", buf, 2u);
          }

          _RTErrorInvalidParameterCreate((uint64_t)CFSTR("homeMapItem"));
          v37 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
        }

        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
        v37 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = 0;
    *a8 = v37;
    goto LABEL_36;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v35 = 0;
LABEL_36:

  return v35;
}

void __145__RTLearnedLocationEngine_calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate_endDate_homeMapItem_workMapItem_locationsOfOthers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Error was issued during fetching locationsOfInterest from store. Error: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)calculateNewMetricsAndSubmitAlongWithTheOldMetrics:(id)a3 startDate:(id)a4 endDate:(id)a5 homeMapItem:(id)a6 workMapItem:(id)a7 distanceThresholdArray:(id)a8 locationsOfOthers:(id)a9
{
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  id v45;
  void *v46;
  RTPlaceDataMetrics *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  RTPlaceDataMetrics *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  objc_class *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  NSObject *dsema;
  uint64_t v64;
  uint64_t v65;
  void *context;
  uint64_t i;
  id v68;
  id obj;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  void *v78;
  id v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  NSObject *v91;
  uint8_t *v92;
  uint64_t *v93;
  SEL v94;
  uint64_t v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint8_t buf[8];
  uint8_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _BYTE v107[12];
  __int16 v108;
  id v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  double v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v79 = a5;
  v75 = a6;
  v74 = a7;
  v68 = a8;
  v72 = v14;
  v73 = a9;
  v78 = v15;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: dict";
LABEL_27:
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_34;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: startDate";
    goto LABEL_27;
  }
  if (!v79)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: endDate";
    goto LABEL_27;
  }
  if (!v75)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: homeMapItem";
    goto LABEL_27;
  }
  if (!v74)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: workMapItem";
    goto LABEL_27;
  }
  if (!objc_msgSend(v68, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: distanceThresholdArray.count > 0";
    goto LABEL_27;
  }
  if (!v73)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: locationsOfOthers";
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("entryDate"), v15);
  v62 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v102 = buf;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__36;
  v105 = __Block_byref_object_dispose__36;
  v106 = 0;
  v95 = 0;
  v96 = (id *)&v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__36;
  v99 = __Block_byref_object_dispose__36;
  v100 = 0;
  v16 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __161__RTLearnedLocationEngine_calculateNewMetricsAndSubmitAlongWithTheOldMetrics_startDate_endDate_homeMapItem_workMapItem_distanceThresholdArray_locationsOfOthers___block_invoke;
  v90[3] = &unk_1E929B0C8;
  v92 = buf;
  v93 = &v95;
  v90[4] = self;
  v94 = a2;
  v18 = v16;
  v91 = v18;
  objc_msgSend(v17, "fetchVisitsWithPredicate:handler:", v62, v90);

  dsema = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v20))
  {
    v32 = 0;
LABEL_29:
    v33 = 1;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceDate:", v19);
  v23 = v22;
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v107 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v107, 2u);
  }

  v30 = (void *)MEMORY[0x1E0CB35C8];
  v116[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v107 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v116, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_29;
  v32 = objc_retainAutorelease(v32);

  v33 = 0;
LABEL_30:

  v61 = v32;
  if ((v33 & 1) == 0)
    objc_storeStrong(v96 + 5, v32);
  if (!v96[5])
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v65 = objc_msgSend(&unk_1E932C238, "countByEnumeratingWithState:objects:count:", &v86, v115, 16);
    if (v65)
    {
      v64 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v87 != v64)
            objc_enumerationMutation(&unk_1E932C238);
          v80 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          context = (void *)MEMORY[0x1D8231EA8]();
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          obj = v68;
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v114, 16);
          if (v36)
          {
            v71 = *(_QWORD *)v83;
            do
            {
              v37 = 0;
              v76 = v36;
              do
              {
                if (*(_QWORD *)v83 != v71)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v37);
                v39 = (void *)MEMORY[0x1D8231EA8]();
                objc_msgSend(v38, "doubleValue");
                v41 = v40;
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  v43 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v43);
                  v44 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  +[RTPlaceDataMetrics DataSourceToString:](RTPlaceDataMetrics, "DataSourceToString:", objc_msgSend(v80, "unsignedIntValue"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v107 = 138413058;
                  *(_QWORD *)&v107[4] = v44;
                  v108 = 2112;
                  v109 = v45;
                  v110 = 2112;
                  v111 = v46;
                  v112 = 2048;
                  v113 = v41;
                  _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics, data source, %@, distance threshold, %.3f", v107, 0x2Au);

                }
                v47 = [RTPlaceDataMetrics alloc];
                v48 = *((_QWORD *)v102 + 5);
                objc_msgSend(v75, "location");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "location");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = -[RTPlaceDataMetrics initWithVisitArray:distanceThreshold:locationHome:locationWork:locationsOfOthers:startDateTime:endDateTime:](v47, "initWithVisitArray:distanceThreshold:locationHome:locationWork:locationsOfOthers:startDateTime:endDateTime:", v48, v49, v50, v73, v78, v79, v41);

                -[RTPlaceDataMetrics calculateAndSetVisitMetrics](v51, "calculateAndSetVisitMetrics");
                -[RTPlaceDataMetrics setCurrentInferenceReplayableMetricsFromDict:](v51, "setCurrentInferenceReplayableMetricsFromDict:", v72);
                -[RTPlaceDataMetrics findHomeWorkOthersIntervals](v51, "findHomeWorkOthersIntervals");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v80, "unsignedIntValue") == 1)
                {
                  +[RTPlaceDataMetrics calculateMLFeatures:startDate:endDate:createBucketedFeatures:](RTPlaceDataMetrics, "calculateMLFeatures:startDate:endDate:createBucketedFeatures:", v52, v78, v79, 0);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  -[RTLearnedLocationEngine biomeManager](self, "biomeManager");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  +[RTPlaceDataMetrics calculateMLFeaturesUsingBiomeManager:intervalDictionary:startDate:endDate:createBucketedFeatures:](RTPlaceDataMetrics, "calculateMLFeaturesUsingBiomeManager:intervalDictionary:startDate:endDate:createBucketedFeatures:", v54, v52, v78, v79, 0);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                }
                -[RTPlaceDataMetrics setMLMetricsFromFeaturesDict:sourceName:](v51, "setMLMetricsFromFeaturesDict:sourceName:", v53, objc_msgSend(v80, "unsignedIntValue"));
                v81 = 0;
                -[RTPlaceDataMetrics submitMetricsWithError:](v51, "submitMetricsWithError:", &v81);
                v55 = v81;
                if (v55)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    v57 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v57);
                    v58 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v59 = (id)objc_claimAutoreleasedReturnValue();
                    +[RTPlaceDataMetrics DataSourceToString:](RTPlaceDataMetrics, "DataSourceToString:", objc_msgSend(v80, "unsignedIntValue"));
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v107 = 138413058;
                    *(_QWORD *)&v107[4] = v58;
                    v108 = 2112;
                    v109 = v59;
                    v110 = 2112;
                    v111 = v60;
                    v112 = 2112;
                    v113 = *(double *)&v55;
                    _os_log_error_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_ERROR, "%@, %@, error was issued during metrics submission for RTPlaceDataMetrics, data source, %@, error, %@", v107, 0x2Au);

                  }
                }

                objc_autoreleasePoolPop(v39);
                ++v37;
              }
              while (v76 != v37);
              v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v114, 16);
            }
            while (v36);
          }

          objc_autoreleasePoolPop(context);
        }
        v65 = objc_msgSend(&unk_1E932C238, "countByEnumeratingWithState:objects:count:", &v86, v115, 16);
      }
      while (v65);
    }
  }

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(buf, 8);

  v34 = v62;
LABEL_34:

}

void __161__RTLearnedLocationEngine_calculateNewMetricsAndSubmitAlongWithTheOldMetrics_startDate_endDate_homeMapItem_workMapItem_distanceThresholdArray_locationsOfOthers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, error was issued during fetching visits from store, error, %@", (uint8_t *)&v12, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)requestTrainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_2;
  v4[3] = &unk_1E9299358;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train-local-model"), v4);

}

void __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  if (a2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "error canceling re-train.", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_370;
    v6[3] = &unk_1E9297650;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    dispatch_async(v4, v6);

  }
}

uint64_t __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_370(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestTrainLocationsOfInterestModelWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_requestTrainLocationsOfInterestModelWithHandler:(id)a3
{
  id v5;
  RTXPCActivityCriteria *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v5 = a3;
  v6 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 2, 1, 1, 2, 0, 1, 900.0, 7200.0);
  objc_initWeak(&location, self);
  -[RTLearnedLocationEngine xpcActivityManager](self, "xpcActivityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke;
  v9[3] = &unk_1E929B118;
  v11[1] = (id)a2;
  v8 = v5;
  v10 = v8;
  objc_copyWeak(v11, &location);
  objc_msgSend(v7, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.learnedLocationEngine.train-local-model"), v6, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

void __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  _QWORD v12[4];
  void (**v13)(id, id);
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke_371;
      v12[3] = &unk_1E929B0F0;
      v15 = *(_QWORD *)(a1 + 48);
      v13 = v5;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "trainLocationsOfInterestModelWithHandler:", v12);

    }
    else
    {
      if (v5)
        v5[2](v5, 0);
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
    }

  }
}

void __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke_371(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v8, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13[2];
  id location;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[RTLearnedLocationEngine queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__RTLearnedLocationEngine_trainLocationsOfInterestModelWithHandler___block_invoke;
  v10[3] = &unk_1E929B140;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  v11 = v6;
  v12 = v5;
  v10[4] = self;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __68__RTLearnedLocationEngine_trainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("LearnedLocationEngineTrainVisitsLastAttemptDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v6;

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "--------->%@, start training locations of interest<---------", buf, 0xCu);

    }
    v15 = *(void **)(a1 + 32);
    v16 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("before %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_logDatabasesWithReason:", v18);

    v19 = *(void **)(a1 + 32);
    v33 = 0;
    objc_msgSend(v19, "_trainLocationsOfInterestModelWithError:", &v33);
    v20 = v33;
    v21 = *(void **)(a1 + 32);
    v22 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("after %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_logDatabasesWithReason:", v24);

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      v35 = v26;
      v36 = 2112;
      v37 = v20;
      v38 = 2048;
      v39 = v28;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "--------->%@, finished training locations of interest, error, %@, latency, %.2f<---------", buf, 0x20u);

    }
    if (!v20)
    {
      v29 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceDate:", v10);
      objc_msgSend(v29, "didUpdateWithIntervalSinceLastUpdate:");

    }
    v31 = *(_QWORD *)(a1 + 48);
    if (v31)
      (*(void (**)(uint64_t, id))(v31 + 16))(v31, v20);

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("swelf was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v32;
      v36 = 2112;
      v37 = v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
  }

}

- (BOOL)_reconcileLearnedLocationsWithError:(id *)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  RTLearnedLocation *v11;
  void *v12;
  NSObject *v13;
  RTLearnedLocation *v14;
  void *v15;
  void *v16;
  RTLearnedLocationOfInterest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTLearnedLocationOfInterest *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  id v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v58;
  id v61;
  id obj;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  NSObject *v68;
  _BYTE *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  _BYTE v75[12];
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _BYTE v86[128];
  _QWORD v87[4];

  v87[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine willBeginTraining](self, "willBeginTraining");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Reconciliation algorithm chosen, per device", buf, 2u);
  }

  v74 = 0;
  -[RTLearnedLocationEngine _performPerDeviceReconiliationWithError:](self, "_performPerDeviceReconiliationWithError:", &v74);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v74;

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v7;
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v71;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v71 != v64)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8231EA8]();
        v11 = [RTLearnedLocation alloc];
        objc_msgSend(v9, "visits");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[RTLearnedLocation initWithLearnedVisits:](v11, "initWithLearnedVisits:", v12);

        if (v13)
          goto LABEL_12;
        v14 = [RTLearnedLocation alloc];
        objc_msgSend(v9, "place");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[RTLearnedLocation initWithMapItem:type:](v14, "initWithMapItem:type:", v16, 2);

        if (v13)
        {
LABEL_12:
          v17 = [RTLearnedLocationOfInterest alloc];
          objc_msgSend(v9, "place");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "place");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "visits");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "transitions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v17, "initWithIdentifier:location:place:visits:transitions:", v19, v13, v20, v21, v22);

          if (v23)
            objc_msgSend(v63, "addObject:", v23);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "place");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "visits");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v26;
            _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "failed to create locationOfInterest for place, %@, with %lu visits", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v65 != v8);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      v65 = v27;
    }
    while (v27);
  }

  if (v61)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v61;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "error while running reconciliation, %@", buf, 0xCu);
    }

    v29 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v61);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v83 = __Block_byref_object_copy__36;
    v84 = __Block_byref_object_dispose__36;
    v85 = 0;
    v30 = dispatch_semaphore_create(0);
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __63__RTLearnedLocationEngine__reconcileLearnedLocationsWithError___block_invoke;
    v66[3] = &unk_1E929B168;
    v67 = v63;
    v69 = buf;
    v32 = v30;
    v68 = v32;
    objc_msgSend(v31, "replaceWithLocationsOfInterest:handler:", v67, v66);

    v33 = v32;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v33, v35))
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceDate:", v34);
    v38 = v37;
    v39 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v75, 2u);
    }

    v45 = (void *)MEMORY[0x1E0CB35C8];
    v87[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v75 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v87, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = objc_retainAutorelease(v47);

      v49 = 0;
    }
    else
    {
LABEL_31:
      v48 = 0;
      v49 = 1;
    }

    v50 = v48;
    if ((v49 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v48);
    v51 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v29 = v51 == 0;
    if (v51)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v51);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "timeIntervalSinceDate:", v58);
        *(_DWORD *)v75 = 138413058;
        *(_QWORD *)&v75[4] = v53;
        v76 = 2112;
        v77 = CFSTR("YES");
        v78 = 2112;
        v79 = 0;
        v80 = 2048;
        v81 = v55;
        _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", v75, 0x2Au);

      }
    }

    _Block_object_dispose(buf, 8);
  }

  return v29;
}

void __63__RTLearnedLocationEngine__reconcileLearnedLocationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      v11 = 134218242;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "error while replacing locationsOfInterest model, locationsOfInterest, %lu, error, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v11 = 134217984;
    v12 = v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "replaced locationsOfInterest model, locationsOfInterest, %lu", (uint8_t *)&v11, 0xCu);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;
  v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reconcileLearnedLocationsWithHandler:(id)a3
{
  void (**v4)(id, id);
  id v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  v6 = 0;
  -[RTLearnedLocationEngine _reconcileLearnedLocationsWithError:](self, "_reconcileLearnedLocationsWithError:", &v6);
  v5 = v6;
  if (v4)
    v4[2](v4, v5);

}

- (void)reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__RTLearnedLocationEngine_reconcileLearnedLocationsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__RTLearnedLocationEngine_reconcileLearnedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileLearnedLocationsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (id)_performPerVisitReconciliationWithError:(id *)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  RTPowerAssertion *v12;
  dispatch_semaphore_t v13;
  RTLearnedLocationReconcilerPerVisit *reconcilerPerVisit;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  id v35;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  NSObject *v43;
  _BYTE *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint8_t v57[16];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v40 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v39;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  v12 = -[RTPowerAssertion initWithIdentifier:timeout:]([RTPowerAssertion alloc], "initWithIdentifier:timeout:", v5, 300.0);
  v13 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__36;
  v54 = __Block_byref_object_dispose__36;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36;
  v50 = __Block_byref_object_dispose__36;
  v51 = 0;
  reconcilerPerVisit = self->_reconcilerPerVisit;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __67__RTLearnedLocationEngine__performPerVisitReconciliationWithError___block_invoke;
  v42[3] = &unk_1E9296EE0;
  v44 = buf;
  v45 = &v46;
  v15 = v13;
  v43 = v15;
  -[RTLearnedLocationReconcilerPerVisit performReconciliationWithHandler:](reconcilerPerVisit, "performReconciliationWithHandler:", v42);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v17);
  v21 = v20;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v57 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v57, 2u);
  }

  v28 = (void *)MEMORY[0x1E0CB35C8];
  v56 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v57 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_retainAutorelease(v30);

    v32 = 0;
  }
  else
  {
LABEL_8:
    v31 = 0;
    v32 = 1;
  }

  v33 = v31;
  if ((v32 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v31);

  v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v34)
  {
    v35 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v34);
  }
  else
  {
    v35 = (id)v47[5];
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

void __67__RTLearnedLocationEngine__performPerVisitReconciliationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error during reconcilation, %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v6, "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "reconciled %lu locations of interest", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_performPerDeviceReconiliationWithError:(id *)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  RTPowerAssertion *v12;
  dispatch_semaphore_t v13;
  RTLearnedLocationReconcilerPerDevice *reconcilerPerDevice;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  id v35;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  NSObject *v43;
  _BYTE *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint8_t v57[16];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v40 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v39;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  v12 = -[RTPowerAssertion initWithIdentifier:timeout:]([RTPowerAssertion alloc], "initWithIdentifier:timeout:", v5, 300.0);
  v13 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__36;
  v54 = __Block_byref_object_dispose__36;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36;
  v50 = __Block_byref_object_dispose__36;
  v51 = 0;
  reconcilerPerDevice = self->_reconcilerPerDevice;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __67__RTLearnedLocationEngine__performPerDeviceReconiliationWithError___block_invoke;
  v42[3] = &unk_1E9296EE0;
  v44 = buf;
  v45 = &v46;
  v15 = v13;
  v43 = v15;
  -[RTLearnedLocationReconcilerPerDevice performReconciliationWithHandler:](reconcilerPerDevice, "performReconciliationWithHandler:", v42);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v17);
  v21 = v20;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v57 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v57, 2u);
  }

  v28 = (void *)MEMORY[0x1E0CB35C8];
  v56 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v57 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_retainAutorelease(v30);

    v32 = 0;
  }
  else
  {
LABEL_8:
    v31 = 0;
    v32 = 1;
  }

  v33 = v31;
  if ((v32 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v31);

  v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v34)
  {
    v35 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v34);
  }
  else
  {
    v35 = (id)v47[5];
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

void __67__RTLearnedLocationEngine__performPerDeviceReconiliationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error during per device reconciliation, %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v6, "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "per device reconciled %lu locations of interest", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getNearbyCandidatesAroundLocation:(id)a3 distance:(double)a4 loiIdentifierToCoalescedSourceMap:(id)a5 error:(id *)a6
{
  dispatch_semaphore_t v9;
  RTLearnedLocationStore *learnedLocationStore;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  id obj;
  void *v72;
  id v73;
  NSObject *dsema;
  id v76;
  id v77;
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
  _QWORD v91[4];
  NSObject *v92;
  uint8_t *v93;
  uint64_t *v94;
  uint64_t v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint8_t buf[8];
  uint8_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  const __CFString *v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[12];
  __int16 v113;
  void *v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v77 = a5;
  if (!v76)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (!a6)
      goto LABEL_30;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("location"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distance > 0", buf, 2u);
    }

    if (!a6)
      goto LABEL_30;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("distance > 0"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
    v32 = 0;
    *a6 = v29;
    goto LABEL_64;
  }
  if (!v77)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifierToCoalescedSourceMap", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("loiIdentifierToCoalescedSourceMap"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_30:
    v32 = 0;
    goto LABEL_64;
  }
  *(_QWORD *)buf = 0;
  v102 = buf;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__36;
  v105 = __Block_byref_object_dispose__36;
  v106 = 0;
  v95 = 0;
  v96 = (id *)&v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__36;
  v99 = __Block_byref_object_dispose__36;
  v100 = 0;
  v9 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __110__RTLearnedLocationEngine_getNearbyCandidatesAroundLocation_distance_loiIdentifierToCoalescedSourceMap_error___block_invoke;
  v91[3] = &unk_1E9296EE0;
  v93 = buf;
  v94 = &v95;
  v11 = v9;
  v92 = v11;
  -[RTLearnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:](learnedLocationStore, "fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:", v76, v91, a4);
  dsema = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v13))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v112 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v112, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v115[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v112 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v115, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_17:
    v26 = 0;
    v27 = 1;
  }

  v73 = v26;
  if ((v27 & 1) == 0)
    objc_storeStrong(v96 + 5, v26);
  if (v96[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v96[5];
      *(_DWORD *)v112 = 138412546;
      *(_QWORD *)&v112[4] = v65;
      v113 = 2112;
      v114 = v66;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, error, %@", v112, 0x16u);

    }
    v32 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v96[5]);
  }
  else
  {
    objc_msgSend(*((id *)v102 + 5), "valueForKeyPath:", CFSTR("@count.visits"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = *((id *)v102 + 5);
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
    if (v68)
    {
      v69 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v68; ++i)
        {
          if (*(_QWORD *)v88 != v69)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          objc_msgSend(v37, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v38);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v72)
          {
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            objc_msgSend(v37, "visits");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 0;
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
            if (v41)
            {
              v42 = *(_QWORD *)v84;
              do
              {
                for (j = 0; j != v41; ++j)
                {
                  if (*(_QWORD *)v84 != v42)
                    objc_enumerationMutation(v39);
                  v40 |= objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "placeSource");
                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
              }
              while (v41);
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v44, v45);

          }
          objc_msgSend(v37, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "unsignedIntegerValue");
          objc_msgSend(v37, "place");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "mapItem");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setSource:", v48);

          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          objc_msgSend(v37, "visits");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
          if (v52)
          {
            v53 = *(_QWORD *)v80;
            while (2)
            {
              for (k = 0; k != v52; ++k)
              {
                if (*(_QWORD *)v80 != v53)
                  objc_enumerationMutation(v51);
                v55 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
                v56 = objc_alloc(MEMORY[0x1E0D18408]);
                objc_msgSend(v37, "place");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "mapItem");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = (void *)objc_msgSend(v56, "initWithFirstObject:secondObject:", v55, v58);

                if (!v59)
                {
                  v60 = (void *)MEMORY[0x1E0CB35C8];
                  v107 = *MEMORY[0x1E0CB2D50];
                  v108 = CFSTR("candidate was nil");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(a2);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v112 = 138412546;
                    *(_QWORD *)&v112[4] = v67;
                    v113 = 2112;
                    v114 = v62;
                    _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "%@, error, %@", v112, 0x16u);

                  }
                  if (a6)
                    *a6 = objc_retainAutorelease(v62);

                  v32 = 0;
                  goto LABEL_62;
                }
                objc_msgSend(v36, "addObject:", v59);

              }
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
              if (v52)
                continue;
              break;
            }
          }

        }
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
      }
      while (v68);
    }

    v32 = v36;
LABEL_62:

  }
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(buf, 8);
LABEL_64:

  return v32;
}

void __110__RTLearnedLocationEngine_getNearbyCandidatesAroundLocation_distance_loiIdentifierToCoalescedSourceMap_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)extractCandidate:(id)a3 fromNearbyCandidates:(id)a4 extractedCandidate:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v41;
  id *v42;
  const char *aSelector;
  id *v44;
  id v45;
  void *v46;
  id obj;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v49 = v10;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v11)
    {
      if (objc_msgSend(v11, "count"))
      {
        if (a5)
        {
          v44 = a6;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count") - 1);
          v45 = v11;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v14 = v11;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
          aSelector = a2;
          if (v15)
          {
            v16 = v15;
            v42 = a5;
            v17 = 0;
            obj = v14;
            v48 = 0;
            v18 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v51 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                objc_msgSend(v49, "firstObject");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "firstObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v22, "isEqual:", v24);

                if (v25)
                {
                  v26 = v20;

                  ++v17;
                  v48 = v26;
                }
                else
                {
                  objc_msgSend(v46, "addObject:", v20);
                }
              }
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
            }
            while (v16);

            if (v17 == 1)
            {
              v27 = objc_retainAutorelease(v48);
              *v42 = v27;
              v28 = v46;
LABEL_42:
              v11 = v45;

              goto LABEL_43;
            }
            v27 = v48;
          }
          else
          {

            v27 = 0;
            v17 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isEqualCount = %lu, != 1"), v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x1E0CB35C8];
          v36 = *MEMORY[0x1E0D18598];
          v58 = *MEMORY[0x1E0CB2D50];
          v59 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 0, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v55 = v41;
            v56 = 2112;
            v57 = v38;
            _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          if (v44)
            *v44 = objc_retainAutorelease(v38);

          v28 = 0;
          goto LABEL_42;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: extractedCandidate", buf, 2u);
        }

        if (a6)
        {
          v30 = CFSTR("extractedCandidate");
          goto LABEL_33;
        }
LABEL_34:
        v28 = 0;
        goto LABEL_43;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nearbyCandidates.count > 0", buf, 2u);
      }

      if (!a6)
        goto LABEL_34;
      v30 = CFSTR("nearbyCandidates.count > 0");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nearbyCandidates", buf, 2u);
      }

      if (!a6)
        goto LABEL_34;
      v30 = CFSTR("nearbyCandidates");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate.firstObject.identifier", buf, 2u);
    }

    if (!a6)
      goto LABEL_34;
    v30 = CFSTR("candidate.firstObject.identifier");
  }
LABEL_33:
  _RTErrorInvalidParameterCreate((uint64_t)v30);
  v28 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v28;
}

- (id)getRelabeledInferredMapItemForCandidate:(id)a3 relabeler:(id)a4 loiIdentifierToCoalescedSourceMap:(id)a5 submitMetrics:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  RTRelabelerMetrics *v35;
  id v36;
  BOOL v37;
  id v38;
  void *v39;
  id v40;
  void *v42;
  uint64_t v43;
  void *v44;
  RTRelabelerMetrics *v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v8 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (a7)
  {
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          v47 = v8;
          objc_msgSend(v13, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "contextDistanceThreshold");
          v54 = 0;
          v49 = v16;
          -[RTLearnedLocationEngine getNearbyCandidatesAroundLocation:distance:loiIdentifierToCoalescedSourceMap:error:](self, "getNearbyCandidatesAroundLocation:distance:loiIdentifierToCoalescedSourceMap:error:", v19, v16, &v54);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v54;

          if (v21)
          {
            v22 = 0;
            *a7 = objc_retainAutorelease(v21);
            v23 = (void *)v20;
            v16 = v49;
LABEL_34:

            goto LABEL_35;
          }
          v52 = 0;
          v53 = 0;
          -[RTLearnedLocationEngine extractCandidate:fromNearbyCandidates:extractedCandidate:error:](self, "extractCandidate:fromNearbyCandidates:extractedCandidate:error:", v13, v20, &v53, &v52);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v53;
          v31 = v52;
          v32 = v31;
          v23 = (void *)v20;
          if (v31)
          {
            v33 = v30;
            v22 = 0;
            *a7 = objc_retainAutorelease(v31);
            v16 = v49;
LABEL_33:

            goto LABEL_34;
          }
          v46 = v29;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v34 = objc_claimAutoreleasedReturnValue();
          v16 = v49;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v46, "count");
            *(_DWORD *)buf = 138412802;
            v56 = v42;
            v57 = 2048;
            v58 = v43;
            v59 = 2112;
            v60 = 0;
            _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, "%@, filteredNearbyCandidates count, %lu, filterError, %@", buf, 0x20u);

            v21 = 0;
          }

          v35 = -[RTRelabelerMetrics initWithRelabeler:]([RTRelabelerMetrics alloc], "initWithRelabeler:", v14);
          v51 = 0;
          objc_msgSend(v14, "relabelCandidate:usingContextCandidates:metrics:outPriorVector:outObservationVector:outPosteriorVector:error:", v30, v46, v35, 0, 0, 0, &v51);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v51;
          -[RTRelabelerMetrics setErrorMetrics:](v35, "setErrorMetrics:", v36);
          v45 = v35;
          if (v47)
          {
            v48 = v21;
            v50 = 0;
            v37 = -[RTRelabelerMetrics submitMetricsWithError:](v35, "submitMetricsWithError:", &v50);
            v38 = v50;
            if (!v37)
            {
              v33 = v30;
              v40 = objc_retainAutorelease(v38);
              *a7 = v40;

              v22 = 0;
              v21 = v48;
              goto LABEL_31;
            }

            v21 = v48;
          }
          v33 = v30;
          if (!v36)
          {
            v39 = v44;
            v22 = v44;
LABEL_32:

            v29 = v46;
            goto LABEL_33;
          }
          v22 = 0;
          *a7 = objc_retainAutorelease(v36);
LABEL_31:
          v39 = v44;
          goto LABEL_32;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifierToCoalescedSourceMap", buf, 2u);
        }

        v26 = CFSTR("loiIdentifierToCoalescedSourceMap");
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeler", buf, 2u);
        }

        v26 = CFSTR("relabeler");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
      }

      v26 = CFSTR("candidate");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v22 = 0;
  }
LABEL_35:

  return v22;
}

- (id)createRelabeler
{
  RTRelabelerParameters *v3;
  RTRelabeler *v4;

  v3 = -[RTRelabelerParameters initWithDefaultsManager:]([RTRelabelerParameters alloc], "initWithDefaultsManager:", self->_defaultsManager);
  v4 = -[RTRelabeler initWithDistanceCalculator:parameters:]([RTRelabeler alloc], "initWithDistanceCalculator:parameters:", self->_distanceCalculator, v3);

  return v4;
}

- (id)createRelabelerPersisterWithError:(id *)a3
{
  RTMapItemProviderLearnedPlaceParameters *v5;
  RTRelabelerParameters *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  RTRelabelerPersisterMetrics *v14;
  RTRelabelerPersister *v15;
  RTDefaultsManager *defaultsManager;
  RTDistanceCalculator *distanceCalculator;
  void *v18;
  RTRelabelerPersister *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  uint64_t v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = -[RTMapItemProviderLearnedPlaceParameters initWithDefaultsManager:]([RTMapItemProviderLearnedPlaceParameters alloc], "initWithDefaultsManager:", self->_defaultsManager);
    v6 = -[RTRelabelerParameters initWithDefaultsManager:]([RTRelabelerParameters alloc], "initWithDefaultsManager:", self->_defaultsManager);
    -[RTLearnedLocationEngine _enabledMapItemProviders](self, "_enabledMapItemProviders");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v12;

      if (!v13)
        goto LABEL_13;
      v14 = -[RTRelabelerPersisterMetrics initWithLoggingEnabled:]([RTRelabelerPersisterMetrics alloc], "initWithLoggingEnabled:", 0);
      v15 = [RTRelabelerPersister alloc];
      defaultsManager = self->_defaultsManager;
      distanceCalculator = self->_distanceCalculator;
      -[RTStore persistenceManager](self->_learnedLocationStore, "persistenceManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[RTRelabelerPersister initWithDefaultsManager:distanceCalculator:learnedPlaceParameters:metrics:persistenceManager:relabelerParameters:reverseGeocodeProvider:](v15, "initWithDefaultsManager:distanceCalculator:learnedPlaceParameters:metrics:persistenceManager:relabelerParameters:reverseGeocodeProvider:", defaultsManager, distanceCalculator, v5, v14, v18, v6, v13);

    }
    else
    {
LABEL_10:

LABEL_13:
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = CFSTR("reverse geocode provider was nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_retainAutorelease(v23);
      v19 = 0;
      *a3 = v13;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = (RTMapItemProviderLearnedPlaceParameters *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v5->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (BOOL)_relabelWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine createRelabeler](self, "createRelabeler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[RTLearnedLocationEngine createRelabelerPersisterWithError:](self, "createRelabelerPersisterWithError:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v12 = v11;
  if (v11)
  {
    LOBYTE(v13) = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }
  else
  {
    v22 = 0;
    v13 = -[RTLearnedLocationEngine _relabelWithRelabeler:relabelerPersister:error:](self, "_relabelWithRelabeler:relabelerPersister:error:", v9, v10, &v22);
    v14 = v22;
    v15 = v14;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v8);
      *(_DWORD *)buf = 138413058;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v15;
      v30 = 2048;
      v31 = v20;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", buf, 0x2Au);

    }
  }

  return v13;
}

- (BOOL)_relabelWithRelabeler:(id)a3 relabelerPersister:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint8_t *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  RTLearnedLocationStore *learnedLocationStore;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  RTLearnedLocationStore *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint8_t *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint8_t *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  RTStoredLocationOfInterestEnumerationOptions *v84;
  const char *aSelector;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id obj;
  _QWORD v93[4];
  id v94;
  id v95;
  RTLearnedLocationEngine *v96;
  id v97;
  id v98;
  uint8_t *v99;
  _QWORD v100[4];
  id v101;
  RTLearnedLocationEngine *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  uint8_t v108[8];
  uint8_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  const __CFString *v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  id v119;
  uint64_t v120;
  _QWORD v121[4];

  v121[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
  {
    aSelector = a2;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v108 = 0;
    v109 = v108;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__36;
    v112 = __Block_byref_object_dispose__36;
    v113 = 0;
    if (v8)
    {
      if (v9)
      {
        objc_msgSend(v9, "logLocalStoreWithReason:", CFSTR("before resnapping visits"));
        v11 = v109;
        v107 = (id)*((_QWORD *)v109 + 5);
        objc_msgSend(v9, "resnapVisitsWithError:", &v107);
        objc_storeStrong((id *)v11 + 5, v107);
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)*((_QWORD *)v109 + 5);
          *(_DWORD *)buf = 138412546;
          v117 = v13;
          v118 = 2112;
          v119 = v14;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, resnapped with error, %@", buf, 0x16u);

        }
        if (*((_QWORD *)v109 + 5))
          goto LABEL_43;
        objc_msgSend(v9, "logLocalStoreWithReason:", CFSTR("before relabeling"));
        v84 = -[RTStoredLocationOfInterestEnumerationOptions initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:]([RTStoredLocationOfInterestEnumerationOptions alloc], "initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:", 1, 1, 0, 1);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v117 = v18;
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, creating delete operations", buf, 0xCu);

        }
        objc_msgSend(v8, "enableLogging:", 0);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        learnedLocationStore = self->_learnedLocationStore;
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke;
        v100[3] = &unk_1E929B190;
        v21 = v9;
        v101 = v21;
        v102 = self;
        v83 = v8;
        v103 = v83;
        v22 = v19;
        v104 = v22;
        v82 = v15;
        v105 = v82;
        v81 = v16;
        v106 = v81;
        -[RTLearnedLocationStore enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:](learnedLocationStore, "enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:", v84, v100);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v117 = v24;
          v118 = 2112;
          v119 = v82;
          _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, created all delete operations, allErrors, %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "metrics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "metrics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfStartingLOIs"));

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v117 = v29;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, creating add operations", buf, 0xCu);

        }
        objc_msgSend(v83, "enableLogging:", 0);
        v30 = self->_learnedLocationStore;
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke_418;
        v93[3] = &unk_1E929B1B8;
        v99 = v108;
        v31 = v81;
        v94 = v31;
        v32 = v21;
        v95 = v32;
        v96 = self;
        v97 = v83;
        v33 = v22;
        v98 = v33;
        -[RTLearnedLocationStore enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:](v30, "enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:", v84, v93);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v117 = v35;
          v118 = 2112;
          v119 = v82;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, created all add operations, allErrors, %@", buf, 0x16u);

        }
        if (!*((_QWORD *)v109 + 5))
        {
          objc_msgSend(v32, "logLocalStoreWithReason:", CFSTR("before collapsing"));
          v36 = v109;
          obj = (id)*((_QWORD *)v109 + 5);
          objc_msgSend(v32, "iterativelyCollapseOverlappingRevGeoLOIsWithError:", &obj);
          objc_storeStrong((id *)v36 + 5, obj);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)*((_QWORD *)v109 + 5);
            *(_DWORD *)buf = 138412546;
            v117 = v38;
            v118 = 2112;
            v119 = v39;
            _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, cleaned with error, %@", buf, 0x16u);

          }
          v40 = (id *)(v109 + 40);
          if (!*((_QWORD *)v109 + 5))
          {
            v91 = 0;
            objc_msgSend(v32, "dedupeLOIsWithError:", &v91);
            objc_storeStrong(v40, v91);
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(aSelector);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)*((_QWORD *)v109 + 5);
              *(_DWORD *)buf = 138412546;
              v117 = v42;
              v118 = 2112;
              v119 = v43;
              _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, deduped with error, %@", buf, 0x16u);

            }
            if (!*((_QWORD *)v109 + 5))
            {
              objc_msgSend(v32, "logLocalStoreWithReason:", CFSTR("before combining sequential"));
              v44 = v109;
              v90 = (id)*((_QWORD *)v109 + 5);
              objc_msgSend(v32, "combineSequentialVisitsWithError:", &v90);
              objc_storeStrong((id *)v44 + 5, v90);
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(aSelector);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)*((_QWORD *)v109 + 5);
                *(_DWORD *)buf = 138412546;
                v117 = v46;
                v118 = 2112;
                v119 = v47;
                _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, combined sequential visits with error, %@", buf, 0x16u);

              }
              v48 = (id *)(v109 + 40);
              if (!*((_QWORD *)v109 + 5))
              {
                v89 = 0;
                objc_msgSend(v32, "fixUnconcreteLOIs:", &v89);
                objc_storeStrong(v48, v89);
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(aSelector);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = (void *)*((_QWORD *)v109 + 5);
                  *(_DWORD *)buf = 138412546;
                  v117 = v50;
                  v118 = 2112;
                  v119 = v51;
                  _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, fixed unconcrete LOIs with error, %@", buf, 0x16u);

                }
                v52 = (id *)(v109 + 40);
                if (!*((_QWORD *)v109 + 5))
                {
                  v88 = 0;
                  objc_msgSend(v32, "saveWithError:", &v88);
                  objc_storeStrong(v52, v88);
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    NSStringFromSelector(aSelector);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v55 = (void *)*((_QWORD *)v109 + 5);
                    *(_DWORD *)buf = 138412546;
                    v117 = v54;
                    v118 = 2112;
                    v119 = v55;
                    _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%@, saved with error, %@", buf, 0x16u);

                  }
                  if (!*((_QWORD *)v109 + 5))
                    -[RTLearnedLocationEngine _logLocalStoreWithReason:](self, "_logLocalStoreWithReason:", CFSTR("after saving"));
                }
              }
            }
          }
        }

        v56 = v84;
      }
      else
      {
        v63 = (void *)MEMORY[0x1E0CB35C8];
        v114 = *MEMORY[0x1E0CB2D50];
        v115 = CFSTR("relabelerPersister was nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v64);
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)*((_QWORD *)v109 + 5);
        *((_QWORD *)v109 + 5) = v65;

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = (void *)*((_QWORD *)v109 + 5);
          *(_DWORD *)buf = 138412546;
          v117 = v79;
          v118 = 2112;
          v119 = v80;
          _os_log_error_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        objc_msgSend(0, "metrics");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setErrorKey:", CFSTR("persisterWasNil"));
      }
    }
    else
    {
      v58 = (void *)MEMORY[0x1E0CB35C8];
      v120 = *MEMORY[0x1E0CB2D50];
      v121[0] = CFSTR("relabeler was nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, &v120, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = (void *)*((_QWORD *)v109 + 5);
      *((_QWORD *)v109 + 5) = v60;

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)*((_QWORD *)v109 + 5);
        *(_DWORD *)buf = 138412546;
        v117 = v77;
        v118 = 2112;
        v119 = v78;
        _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      objc_msgSend(v9, "metrics");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setErrorKey:", CFSTR("relabelerWasNil"));
    }

LABEL_43:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v68, "timeIntervalSinceDate:", v10);
    objc_msgSend(v69, "numberWithDouble:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metrics");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "metrics");
    v72 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v72, "setObject:forKeyedSubscript:", v70, CFSTR("runTime"));

    objc_msgSend(v9, "metrics");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0;
    LOBYTE(v72) = objc_msgSend(v73, "submitMetricsWithError:", &v87);
    v74 = v87;

    v75 = v74;
    if ((v72 & 1) != 0 && (v75 = (void *)*((_QWORD *)v109 + 5)) == 0)
    {
      v57 = 1;
    }
    else
    {
      v57 = 0;
      *a5 = objc_retainAutorelease(v75);
    }

    _Block_object_dispose(v108, 8);
    goto LABEL_47;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v108 = 0;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v108, 2u);
  }
  v57 = 0;
LABEL_47:

  return v57;
}

void __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v5 = a2;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "visits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3 && v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tallyKey:", CFSTR("numberOfStartingVisits"));

    v12 = objc_alloc(MEMORY[0x1E0D18408]);
    objc_msgSend(v6, "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithFirstObject:secondObject:", v9, v14);

    v16 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v27 = 0;
    objc_msgSend(v16, "getRelabeledInferredMapItemForCandidate:relabeler:loiIdentifierToCoalescedSourceMap:submitMetrics:error:", v15, v17, v18, 1, &v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v20);
      v21 = *(void **)(a1 + 72);
      objc_msgSend(v9, "identifier");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);
    }
    else
    {
      v23 = *(void **)(a1 + 32);
      v26 = 0;
      objc_msgSend(v23, "useRelabeledInferredMapItem:oldCandidate:associate:error:", v19, v15, 0, &v26);
      v22 = v26;
      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v22);
        v24 = *(void **)(a1 + 72);
        objc_msgSend(v9, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v25);

      }
    }

  }
}

void __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke_418(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id obj;
  id v34;
  id v35;
  id v36;
  id v37;

  if (*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    v6 = a2;
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "visits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3 && v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D18408]);
      objc_msgSend(v7, "place");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithFirstObject:secondObject:", v10, v14);

      v16 = (void *)a1[4];
      objc_msgSend(v10, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "member:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)a1[5];
        v20 = *(_QWORD *)(a1[9] + 8);
        v37 = *(id *)(v20 + 40);
        objc_msgSend(v19, "restoreToOldCandidate:error:", v15, &v37);
        v21 = v37;
        v22 = *(id *)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v21;
      }
      else
      {
        v23 = (void *)a1[6];
        v24 = a1[7];
        v25 = a1[8];
        v36 = 0;
        objc_msgSend(v23, "getRelabeledInferredMapItemForCandidate:relabeler:loiIdentifierToCoalescedSourceMap:submitMetrics:error:", v15, v24, v25, 0, &v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v36;
        v27 = (void *)a1[5];
        if (v22)
        {
          v28 = *(_QWORD *)(a1[9] + 8);
          v35 = *(id *)(v28 + 40);
          objc_msgSend(v27, "restoreToOldCandidate:error:", v15, &v35);
          v29 = v35;
          v30 = *(id *)(v28 + 40);
          *(_QWORD *)(v28 + 40) = v29;
        }
        else
        {
          v34 = 0;
          objc_msgSend(v27, "useRelabeledInferredMapItem:oldCandidate:associate:error:", v26, v15, 1, &v34);
          v30 = v34;
          if (v30)
          {
            v31 = (void *)a1[5];
            v32 = *(_QWORD *)(a1[9] + 8);
            obj = *(id *)(v32 + 40);
            objc_msgSend(v31, "restoreToOldCandidate:error:", v15, &obj);
            objc_storeStrong((id *)(v32 + 40), obj);
          }
        }

      }
    }

  }
}

- (void)relabelWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RTLearnedLocationEngine_relabelWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__RTLearnedLocationEngine_relabelWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "_relabelWithError:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (void)willBeginTraining
{
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Learned location engine will begin training.", v5, 2u);
    }

    objc_msgSend(WeakRetained, "learnedLocationEngineWillBeginTraining:", self);
  }

}

- (void)didFinishTraining
{
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "learnedLocationEngineDidFinishTraining:", self);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Learned location engine did finish training.", v5, 2u);
    }

  }
}

- (void)didUpdateWithIntervalSinceLastUpdate:(double)a3
{
  id WeakRetained;
  NSObject *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "learnedLocationEngineDidUpdate:intervalSinceLastUpdate:", self, a3);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Learned location engine did update, intervalSinceLastUpdate, %.2f", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)didClear
{
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "learnedLocationEngineDidClear:", self);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Learned location engine did clear", v5, 2u);
    }

  }
}

- (BOOL)_purgeWithReferenceDate:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  dispatch_time_t v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  dispatch_time_t v57;
  id v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v75;
  RTLearnedLocationEngine *v77;
  const char *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  NSObject *v82;
  SEL v83;
  _QWORD v84[4];
  id v85;
  NSObject *v86;
  SEL v87;
  _QWORD v88[4];
  id v89;
  NSObject *v90;
  SEL v91;
  uint64_t v92;
  uint8_t buf[16];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 3);
  v9 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke;
  v88[3] = &unk_1E929B1E0;
  v11 = v8;
  v89 = v11;
  v91 = a2;
  v12 = v9;
  v90 = v12;
  objc_msgSend(v10, "removeRecordsExpiredBeforeDate:handler:", v7, v88);

  v13 = v12;
  v14 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  v17 = 0x1E0CB3000uLL;
  v77 = self;
  v78 = a2;
  if (dispatch_semaphore_wait(v13, v16))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v15);
    v20 = v19;
    v21 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18598];
    v92 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v92, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 15, v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v30 = objc_retainAutorelease(v30);

    }
    self = v77;
    a2 = v78;
    v14 = 0x1E0C99000;
    v17 = 0x1E0CB3000;
  }
  else
  {
    v30 = 0;
  }

  v31 = v30;
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_433;
  v84[3] = &unk_1E929B1E0;
  v75 = v11;
  v85 = v75;
  v87 = a2;
  v33 = v13;
  v86 = v33;
  objc_msgSend(v32, "removeUnreferencedPlacesWithHandler:", v84);

  v34 = v33;
  objc_msgSend(*(id *)(v14 + 3432), "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = dispatch_time(0, 3600000000000);
  v37 = v31;
  if (dispatch_semaphore_wait(v34, v36))
  {
    objc_msgSend(*(id *)(v14 + 3432), "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v35);
    v40 = v39;
    v41 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(v17 + 2176), "predicateWithBlock:", &__block_literal_global_895);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "filteredArrayUsingPredicate:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "submitToCoreAnalytics:type:duration:", v45, 1, v40);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0D18598];
    v92 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v92, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 15, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v31;
    self = v77;
    a2 = v78;
    v14 = 0x1E0C99000uLL;
    v17 = 0x1E0CB3000uLL;
    if (v50)
    {
      v37 = objc_retainAutorelease(v50);

    }
  }

  v51 = v37;
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_434;
  v80[3] = &unk_1E929B1E0;
  v53 = v75;
  v81 = v53;
  v83 = a2;
  v54 = v34;
  v82 = v54;
  objc_msgSend(v52, "removeUnreferencedMapItems:", v80);

  v55 = v54;
  objc_msgSend(*(id *)(v14 + 3432), "now");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = dispatch_time(0, 3600000000000);
  v58 = v51;
  if (dispatch_semaphore_wait(v55, v57))
  {
    objc_msgSend(*(id *)(v14 + 3432), "now");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "timeIntervalSinceDate:", v56);
    v60 = v59;
    v61 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(v17 + 2176), "predicateWithBlock:", &__block_literal_global_895);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "filteredArrayUsingPredicate:", v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "submitToCoreAnalytics:type:duration:", v65, 1, v60);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v67 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0D18598];
    v92 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v92, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "errorWithDomain:code:userInfo:", v68, 15, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v51;
    if (v70)
    {
      v58 = objc_retainAutorelease(v70);

    }
  }

  v71 = v58;
  _RTSafeArray();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v73);

  return v73 == 0;
}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove expired records, error, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_433(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove unreferenced places, error, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_434(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove unreferenced map items, error, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)_classifyPlaceTypes:(id *)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RTPlaceTypeClassifier *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  RTPlaceTypeClassifier *v45;
  id *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTLearnedLocationEngine _deferTrainingDueToAvailability](self, "_deferTrainingDueToAvailability"))
  {
    v59 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Deferring %@ due to availability of the learned location store."), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v12 = (RTPlaceTypeClassifier *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138412290;
    v50 = v13;
    goto LABEL_10;
  }
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("ShouldSkipPlaceTypeClassification"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("ShouldSkipPlaceTypeClassification"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v57 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("test only!!! skip %@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v12 = (RTPlaceTypeClassifier *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v50 = v13;
LABEL_10:
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_11:

      if (a3)
      {
        v13 = objc_retainAutorelease(v13);
        LOBYTE(v24) = 0;
        *a3 = v13;
      }
      else
      {
        LOBYTE(v24) = 0;
      }
      goto LABEL_23;
    }
  }
  else
  {

  }
  v47 = v8;
  -[RTLearnedLocationEngine placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resetStates");

  v45 = [RTPlaceTypeClassifier alloc];
  -[RTLearnedLocationEngine biomeManager](self, "biomeManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine contactsManager](self, "contactsManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
  v46 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine locationManager](self, "locationManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine mapsSupportManager](self, "mapsSupportManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine platform](self, "platform");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine queue](self, "queue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine visitManager](self, "visitManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RTPlaceTypeClassifier initWithBiomeManager:contactsManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:platform:queue:visitManager:](v45, "initWithBiomeManager:contactsManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:platform:queue:visitManager:", v44, v43, v26, v27, v42, v41, v40, v28, v29, v30, v31, v32);

  v48 = 0;
  v24 = -[RTPlaceTypeClassifier classifyWithError:](v12, "classifyWithError:", &v48);
  v33 = v48;
  v13 = v33;
  if (v46)
    *v46 = objc_retainAutorelease(v33);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v34 = objc_claimAutoreleasedReturnValue();
  v8 = v47;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v36 = CFSTR("YES");
    else
      v36 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSinceDate:", v47);
    *(_DWORD *)buf = 138413058;
    v50 = v35;
    v51 = 2112;
    v52 = v36;
    v53 = 2112;
    v54 = v13;
    v55 = 2048;
    v56 = v38;
    _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", buf, 0x2Au);

  }
LABEL_23:

  return v24;
}

- (void)_classifyPlaceTypesWithHandler:(id)a3
{
  void (**v5)(id, id);
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  v11 = 0;
  v6 = -[RTLearnedLocationEngine _classifyPlaceTypes:](self, "_classifyPlaceTypes:", &v11);
  v7 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v13 = v9;
    v14 = 2112;
    if (v6)
      v10 = CFSTR("YES");
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, place type classification success, %@, error, %@", buf, 0x20u);

  }
  if (v5)
    v5[2](v5, v7);

}

- (void)classifyPlaceTypesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTLearnedLocationEngine_classifyPlaceTypesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__RTLearnedLocationEngine_classifyPlaceTypesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_classifyPlaceTypesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_consolidateKnownPlaceTypesWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, started", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine createRelabelerPersisterWithError:](self, "createRelabelerPersisterWithError:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!*a3
      && objc_msgSend(v9, "consolidateVisitsToLoisWithKnownPlaceTypesWithError:", a3)
      && objc_msgSend(v10, "combineSequentialVisitsWithError:", a3)
      && objc_msgSend(v10, "cleanUpWithError:", a3)
      && objc_msgSend(v10, "saveWithError:", a3))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v8);
        v17 = 138413058;
        v18 = v12;
        v19 = 2112;
        v20 = CFSTR("YES");
        v21 = 2112;
        v22 = 0;
        v23 = 2048;
        v24 = v14;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", (uint8_t *)&v17, 0x2Au);

      }
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)&v17, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_saveIdentifiersOfKnownPlaceTypesWithError:(id *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  RTLearnedLocationStore *learnedLocationStore;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *log;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v44;
  void *v46;
  id v47;
  _QWORD v48[6];
  id v49;
  NSObject *v50;
  uint8_t *v51;
  SEL v52;
  uint8_t v53[8];
  uint8_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  uint8_t buf[8];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v53 = 0;
      _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v53, 2u);
    }
LABEL_27:
    v32 = 0;
    goto LABEL_28;
  }
  log = objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v44 = objc_msgSend(&unk_1E932C250, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v60;
    v39 = *MEMORY[0x1E0D18598];
    v40 = *MEMORY[0x1E0CB2D50];
LABEL_4:
    v3 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v42)
        objc_enumerationMutation(&unk_1E932C250);
      v4 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v3);
      *(_QWORD *)v53 = 0;
      v54 = v53;
      v55 = 0x3032000000;
      v56 = __Block_byref_object_copy__36;
      v57 = __Block_byref_object_dispose__36;
      v58 = 0;
      v5 = (void *)objc_opt_new();
      v6 = dispatch_semaphore_create(0);
      learnedLocationStore = self->_learnedLocationStore;
      v46 = v4;
      v8 = objc_msgSend(v4, "unsignedIntegerValue");
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke;
      v48[3] = &unk_1E929B230;
      v48[4] = self;
      v48[5] = v4;
      v51 = v53;
      v52 = a2;
      v9 = v5;
      v49 = v9;
      v10 = v6;
      v50 = v10;
      -[RTLearnedLocationStore fetchLocationsOfInterestWithPlaceType:handler:](learnedLocationStore, "fetchLocationsOfInterestWithPlaceType:handler:", v8, v48);
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v11, v13))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v64 = v40;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v64, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v39, 15, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = objc_retainAutorelease(v25);

        v27 = 0;
      }
      else
      {
LABEL_12:
        v26 = 0;
        v27 = 1;
      }

      v28 = v26;
      if ((v27 & 1) == 0)
        objc_storeStrong((id *)v54 + 5, v26);
      v29 = (void *)*((_QWORD *)v54 + 5);
      if (v29)
      {
        *a3 = objc_retainAutorelease(v29);
      }
      else if (objc_msgSend(v9, "count"))
      {
        -[NSObject setObject:forKey:](log, "setObject:forKey:", v9, v46);
      }

      _Block_object_dispose(v53, 8);
      if (v29)
        goto LABEL_27;
      if (v44 == ++v3)
      {
        v44 = objc_msgSend(&unk_1E932C250, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v44)
          goto LABEL_4;
        break;
      }
    }
  }
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", log, 1, &v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v47;
  v32 = v31 == 0;
  if (!v31)
  {
    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v30, CFSTR("KnownPlaceIdentifiers"));

    -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("KnownPlaceIdentifiersLastUpdateDate"));

  }
  v36 = objc_retainAutorelease(v31);
  *a3 = v36;

LABEL_28:
  return v32;
}

void __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "count");
    v12 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue");
    *(_DWORD *)buf = 138413314;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2048;
    v25 = v11;
    v26 = 2048;
    v27 = v12;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched location of interest count, %lu, placeType, %lu, error, %@", buf, 0x34u);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke_446;
  v17[3] = &unk_1E929B208;
  v16 = *(_QWORD *)(a1 + 72);
  v17[4] = *(_QWORD *)(a1 + 32);
  v19 = v16;
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke_446(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2048;
    v18 = a3;
    v19 = 2112;
    v20 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, idx, %lu, location of interest identifier, %@", (uint8_t *)&v13, 0x2Au);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)_onContactsManagerNotification:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);

  }
  -[NSObject name](v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTContactsManagerContactStoreMeContactDidChangeNotification, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v16 = 0;
    v11 = -[RTLearnedLocationEngine _classifyPlaceTypes:](self, "_classifyPlaceTypes:", &v16);
    v12 = v16;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      if (v11)
        v14 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v18 = (void *)v14;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "classify place types, success, %@, error, %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject name](v5, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);

LABEL_10:
  }

}

- (void)onContactsManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTLearnedLocationEngine_onContactsManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__RTLearnedLocationEngine_onContactsManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onContactsManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onMapsSupportManagerNotification:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);

  }
  -[NSObject name](v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMapsSupportManagerQueryContentsDidChangeNotification, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = v5;
    if (-[NSObject queryType](v11, "queryType") == 2)
    {
      v17 = 0;
      v12 = -[RTLearnedLocationEngine _classifyPlaceTypes:](self, "_classifyPlaceTypes:", &v17);
      v13 = v17;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = CFSTR("NO");
        if (v12)
          v15 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v19 = (void *)v15;
        v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "classify place types, success, %@, error, %@", buf, 0x16u);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      NSStringFromSelector(a2);
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject name](v11, "name");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@, unhandled notification, %@", buf, 0x16u);

    }
LABEL_11:

  }
}

- (void)onMapsSupportManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__RTLearnedLocationEngine_onMapsSupportManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__RTLearnedLocationEngine_onMapsSupportManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMapsSupportManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_submitDailyVisitMetrics
{
  NSObject *v3;
  void *v4;
  __CFString *v5;
  RTVisitMetrics *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RTVisitMetrics *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  NSObject *v17;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "visit metrics submission, start", buf, 2u);
  }

  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = [RTVisitMetrics alloc];
    -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine locationStore](self, "locationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine motionActivityManager](self, "motionActivityManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine visitManager](self, "visitManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RTVisitMetrics initWithDistanceCalculator:learnedLocationStore:locationStore:motionActivityManager:visitManager:](v6, "initWithDistanceCalculator:learnedLocationStore:locationStore:motionActivityManager:visitManager:", v7, v8, v9, v10, v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v5, 86400.0);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v13;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "visit metrics submission, start, %@, interval %@", buf, 0x16u);
    }

    v20 = 0;
    v15 = -[RTVisitMetrics collectRealtimeMetricsForDateInterval:error:](v12, "collectRealtimeMetricsForDateInterval:error:", v13, &v20);
    v16 = v20;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = CFSTR("NO");
      if (v15)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v16;
      _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "visit metrics submission, success, %@, error, %@", buf, 0x16u);
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)onLearnedLocationStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTLearnedLocationEngine_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__RTLearnedLocationEngine_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  RTPlaceTypeClassifier *v22;
  id v23;
  NSObject *v24;
  void *v25;
  const char *aSelector;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RTPlaceTypeClassifier *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8 && objc_msgSend(v5, "availability") == 2)
  {
    if (-[RTLearnedLocationEngine shouldRecoverKnownPlaceTypes](self, "shouldRecoverKnownPlaceTypes"))
      v9 = -[RTLearnedLocationEngine _homeLocationOfInterestExist](self, "_homeLocationOfInterestExist");
    else
      v9 = 1;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[RTLearnedLocationEngine shouldRecoverKnownPlaceTypes](self, "shouldRecoverKnownPlaceTypes");
      v15 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v38 = v12;
      if (v14)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      if (v9)
        v15 = CFSTR("YES");
      v39 = 2112;
      v40 = v13;
      v41 = 2112;
      v42 = v16;
      v43 = 2112;
      v44 = v15;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, shouldRecoverKnownPlaceTypes, %@, homeExist, %@", buf, 0x2Au);

    }
    if (-[RTLearnedLocationEngine shouldRecoverKnownPlaceTypes](self, "shouldRecoverKnownPlaceTypes") && !v9)
    {
      aSelector = a2;
      -[RTLearnedLocationEngine placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resetStates");

      v34 = [RTPlaceTypeClassifier alloc];
      -[RTLearnedLocationEngine biomeManager](self, "biomeManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine contactsManager](self, "contactsManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine locationManager](self, "locationManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine mapServiceManager](self, "mapServiceManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine mapsSupportManager](self, "mapsSupportManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine platform](self, "platform");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine visitManager](self, "visitManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[RTPlaceTypeClassifier initWithBiomeManager:contactsManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:platform:queue:visitManager:](v34, "initWithBiomeManager:contactsManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:platform:queue:visitManager:", v35, v32, v33, v29, v31, v30, v28, v27, v18, v19, v20, v21);

      v36 = 0;
      LOBYTE(v20) = -[RTLearnedLocationEngine _recoverKnownPlaceTypesWithPlaceTypeClassifier:outError:](self, "_recoverKnownPlaceTypesWithPlaceTypeClassifier:outError:", v22, &v36);
      v23 = v36;
      if ((v20 & 1) != 0)
      {
        -[RTLearnedLocationEngine setShouldRecoverKnownPlaceTypes:](self, "setShouldRecoverKnownPlaceTypes:", 0);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v25;
          v39 = 2112;
          v40 = v23;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, _recoverKnownPlaceTypesWithError, error, %@", buf, 0x16u);

        }
      }

    }
  }

}

- (BOOL)_recoverKnownPlaceTypesWithPlaceTypeClassifier:(id)a3 outError:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  char v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  BOOL v47;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v60;
  uint64_t v61;
  id v62;
  RTLearnedLocationEngine *v63;
  id obj;
  id v65;
  _QWORD v66[6];
  id v67;
  id v68;
  NSObject *v69;
  _BYTE *v70;
  SEL v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;
  uint8_t v82[8];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v63 = self;
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("KnownPlaceIdentifiers"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v52, v53, &v76);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v76;
  -[RTLearnedLocationEngine defaultsManager](v63, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("KnownPlaceIdentifiersLastUpdateDate"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v54, "count");
    objc_msgSend(v51, "stringFromDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    v78 = (uint64_t (*)(uint64_t, uint64_t))v15;
    LOWORD(v79) = 2112;
    *(_QWORD *)((char *)&v79 + 2) = v16;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, previous known place count, %lu, saved date, %@", buf, 0x2Au);

  }
  if (objc_msgSend(v54, "count"))
  {
    v55 = (void *)objc_opt_new();
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v54;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v61)
    {
      v60 = *(_QWORD *)v73;
      v56 = *MEMORY[0x1E0D18598];
      v57 = *MEMORY[0x1E0CB2D50];
      while (2)
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v73 != v60)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            v20 = dispatch_semaphore_create(0);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v78 = __Block_byref_object_copy__36;
            *(_QWORD *)&v79 = __Block_byref_object_dispose__36;
            *((_QWORD *)&v79 + 1) = 0;
            v21 = (void *)objc_opt_new();
            -[RTLearnedLocationEngine learnedLocationStore](v63, "learnedLocationStore");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v66[0] = MEMORY[0x1E0C809B0];
            v66[1] = 3221225472;
            v66[2] = __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke;
            v66[3] = &unk_1E929B280;
            v71 = a2;
            v66[4] = v63;
            v66[5] = v18;
            v62 = v19;
            v67 = v62;
            v70 = buf;
            v24 = v21;
            v68 = v24;
            v25 = v20;
            v69 = v25;
            objc_msgSend(v22, "fetchPlacesWithIdentifiers:handler:", v23, v66);

            v26 = v25;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v26, v28))
              goto LABEL_15;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "timeIntervalSinceDate:", v27);
            v31 = v30;
            v32 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "filteredArrayUsingPredicate:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "submitToCoreAnalytics:type:duration:", v36, 1, v31);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v82 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v82, 2u);
            }

            v38 = (void *)MEMORY[0x1E0CB35C8];
            v81 = v57;
            *(_QWORD *)v82 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorWithDomain:code:userInfo:", v56, 15, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              v41 = objc_retainAutorelease(v40);

              v42 = 0;
            }
            else
            {
LABEL_15:
              v41 = 0;
              v42 = 1;
            }

            v43 = v41;
            if ((v42 & 1) == 0)
              objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v41);
            v44 = *(void **)(*(_QWORD *)&buf[8] + 40);
            if (v44)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v44);
            }
            else if (objc_msgSend(v24, "count"))
            {
              objc_msgSend(v55, "addObjectsFromArray:", v24);
            }

            _Block_object_dispose(buf, 8);
            if (v44)
            {

              v47 = 0;
              goto LABEL_38;
            }
          }
          else
          {

          }
        }
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        if (v61)
          continue;
        break;
      }
    }

    if (objc_msgSend(v55, "count"))
    {
      v65 = 0;
      objc_msgSend(v50, "updatePlaces:error:", v55, &v65);
      v45 = v65;
      v46 = v45;
      if (a4)
        *a4 = objc_retainAutorelease(v45);
      v47 = v46 == 0;

    }
    else
    {
      if (a4)
        *a4 = 0;
      v47 = 1;
    }
LABEL_38:

  }
  else
  {
    if (a4)
      *a4 = 0;
    v47 = 1;
  }

  return v47;
}

void __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2048;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2048;
    v32 = objc_msgSend(v5, "count");
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, place type, %@, identifier count, %lu, first identifier, %@, fetched place count, %lu, error, %@", buf, 0x48u);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v6;
  v16 = v6;

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke_455;
  v17[3] = &unk_1E929B258;
  v18 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v20 = *(_QWORD *)(a1 + 80);
  v19 = *(id *)(a1 + 56);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

void __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke_455(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  RTLearnedPlace *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RTLearnedPlace *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  RTLearnedPlace *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = [RTLearnedPlace alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
  v8 = objc_msgSend(v4, "typeSource");
  objc_msgSend(v4, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v5, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v6, v7, v8, v9, v10, v11, v12);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    v23 = 2048;
    v24 = a3;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, idx, %lu, recovered place, %@", buf, 0x2Au);

  }
  if (v13)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

}

- (id)_getDailyTrainingMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  dispatch_semaphore_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  id *v39;
  id v40;
  void *v41;
  dispatch_time_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v77;
  NSObject *dsema;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  NSObject *v82;
  _BYTE *v83;
  SEL v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  NSObject *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _BYTE v105[12];
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  uint8_t v110[128];
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  _QWORD v115[2];
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  v69 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateForVisitsFromEntryDate:exitDate:", v68, v4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForObjectsFromCurrentDevice");
    v66 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v66;
    if (v67 && v66)
    {
      v7 = (void *)MEMORY[0x1E0CB3528];
      v115[0] = v67;
      v115[1] = v66;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = dispatch_semaphore_create(0);
      v99 = 0;
      v100 = &v99;
      v101 = 0x3032000000;
      v102 = __Block_byref_object_copy__36;
      v103 = __Block_byref_object_dispose__36;
      v104 = 0;
      v93 = 0;
      v94 = &v93;
      v95 = 0x3032000000;
      v96 = __Block_byref_object_copy__36;
      v97 = __Block_byref_object_dispose__36;
      v98 = 0;
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke;
      v89[3] = &unk_1E9296EE0;
      v91 = &v93;
      v92 = &v99;
      v11 = v9;
      v90 = v11;
      objc_msgSend(v10, "fetchVisitsWithPredicate:handler:", v65, v89);

      v12 = (id *)(v100 + 5);
      v13 = (id)v100[5];
      dsema = v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v15))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v14);
        v18 = v17;
        v19 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v25 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v105 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v105, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v13 = objc_retainAutorelease(v27);

        }
      }

      objc_storeStrong(v12, v13);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend((id)v94[5], "count");
        v31 = (uint64_t (*)(uint64_t, uint64_t))v100[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v112 = v31;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, fetched %lu of learned visit entries in past day, error, %@", buf, 0x20u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v112 = __Block_byref_object_copy__36;
      v113 = __Block_byref_object_dispose__36;
      v114 = 0;
      v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = (id)v94[5];
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v110, 16);
      if (v32)
      {
        v73 = *(_QWORD *)v86;
        v71 = *MEMORY[0x1E0D18598];
        v72 = *MEMORY[0x1E0CB2D50];
        do
        {
          v77 = v32;
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v86 != v73)
              objc_enumerationMutation(obj);
            v34 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
            v35 = dispatch_semaphore_create(0);

            -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v79[0] = MEMORY[0x1E0C809B0];
            v79[1] = 3221225472;
            v79[2] = __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke_457;
            v79[3] = &unk_1E929B2A8;
            v37 = v74;
            v83 = buf;
            v84 = a2;
            v80 = v37;
            v81 = v34;
            v38 = v35;
            v82 = v38;
            objc_msgSend(v36, "fetchPlaceOfVisit:handler:", v34, v79);

            v39 = (id *)(*(_QWORD *)&buf[8] + 40);
            v40 = *(id *)(*(_QWORD *)&buf[8] + 40);
            dsema = v38;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(dsema, v42))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "timeIntervalSinceDate:", v41);
              v45 = v44;
              v46 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "firstObject");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v105 = 0;
                _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v105, 2u);
              }

              v52 = (void *)MEMORY[0x1E0CB35C8];
              v116[0] = v72;
              *(_QWORD *)v105 = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v116, 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "errorWithDomain:code:userInfo:", v71, 15, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (v54)
              {
                v40 = objc_retainAutorelease(v54);

              }
            }

            objc_storeStrong(v39, v40);
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v110, 16);
        }
        while (v32);
      }

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v74, "count");
        v58 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v105 = 138412802;
        *(_QWORD *)&v105[4] = v56;
        v106 = 2048;
        v107 = v57;
        v108 = 2112;
        v109 = v58;
        _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, fetched %lu of learned places in past day, error, %@", v105, 0x20u);

      }
      objc_msgSend(v69, "setObject:forKeyedSubscript:", &unk_1E932CDF0, CFSTR("_intervalSinceLastAttempt"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)v94[5], "count"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v59, CFSTR("_visitCountTrainingEvent"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v74, "count"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v60, CFSTR("_placeCountTrainingEvent"));

      v61 = v69;
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v93, 8);
      _Block_object_dispose(&v99, 8);

      v6 = (void *)v66;
    }
    else
    {
      v63 = v69;
    }

  }
  else
  {
    v62 = v69;
  }

  return v69;
}

void __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke_457(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = 138413058;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, fetched place, %@, visit, %@, error, %@", (uint8_t *)&v14, 0x2Au);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_submitDailyTrainingSessionCount
{
  id v2;

  -[RTLearnedLocationEngine dailyTrainingSessionCounter](self, "dailyTrainingSessionCounter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submitMetrics");

}

- (void)_submitDailyTrainingMetrics
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[RTLearnedLocationEngine _getDailyTrainingMetrics](self, "_getDailyTrainingMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_msgSend(v5, "initWithCString:encoding:", RTAnalyticsEventTraining, 1);
    log_analytics_submission(v6, v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();
LABEL_5:

    goto LABEL_6;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, failure to submit daily notification metrics, training metrics not established", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:

  -[RTLearnedLocationEngine _submitDailyTrainingSessionCount](self, "_submitDailyTrainingSessionCount");
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  char v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  RTLocationOfInterestMetrics *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v26;
      v32 = 2080;
      v33 = "-[RTLearnedLocationEngine _onDailyMetricsNotification:]";
      v34 = 1024;
      v35 = 5029;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = (const char *)v5;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);

  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v12 & 1) != 0)
  {
    if (-[RTLearnedLocationEngine _deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission](self, "_deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_20:

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v25;
          _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, perform daily transit analytics", buf, 0xCu);

        }
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __55__RTLearnedLocationEngine__onDailyMetricsNotification___block_invoke;
        v28[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v28[4] = a2;
        -[RTLearnedLocationEngine performTransitAnalyticsWithHandler:](self, "performTransitAnalyticsWithHandler:", v28);
        -[RTLearnedLocationEngine _submitDailyTrainingMetrics](self, "_submitDailyTrainingMetrics");
        -[RTLearnedLocationEngine _submitDailyVisitMetrics](self, "_submitDailyVisitMetrics");
        -[RTLearnedLocationEngine _submitPlaceTypeClassificationFeatureInputMetrics](self, "_submitPlaceTypeClassificationFeatureInputMetrics");
        goto LABEL_23;
      }
      NSStringFromSelector(a2);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = (const __CFString *)v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, skip submitting LOI metrics due to no training since last submission", buf, 0xCu);
    }
    else
    {
      v16 = [RTLocationOfInterestMetrics alloc];
      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine distanceCalculator](self, "distanceCalculator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine locationStore](self, "locationStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RTLocationOfInterestMetrics initWithDefaultsManager:distanceCalculator:learnedLocationStore:locationStore:](v16, "initWithDefaultsManager:distanceCalculator:learnedLocationStore:locationStore:", v17, v18, v19, v20);

      v29 = 0;
      v21 = -[NSObject collectMetricsWithError:](v13, "collectMetricsWithError:", &v29);
      v14 = (char *)v29;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = CFSTR("NO");
        if (v21)
          v23 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v31 = v23;
        v32 = 2112;
        v33 = v14;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "LOI metrics submission, success, %@, error, %@", buf, 0x16u);
      }

    }
    goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "name");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

  }
LABEL_23:

}

void __55__RTLearnedLocationEngine__onDailyMetricsNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, transit analytics completed, error, %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RTLearnedLocationEngine_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__RTLearnedLocationEngine_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

- (void)setMonitorFingerprints:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  _BOOL4 monitorFingerprints;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_monitorFingerprints != a3)
  {
    self->_monitorFingerprints = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_monitorFingerprints)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "monitor fingerprints, %@", (uint8_t *)&v9, 0xCu);
    }

    monitorFingerprints = self->_monitorFingerprints;
    -[RTLearnedLocationEngine fingerprintManager](self, "fingerprintManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTFingerprintManagerNotificationMonitorFingerprints, "notificationName");
    if (monitorFingerprints)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:", self, sel_onFingerprintManagerNotification_, v8);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:fromNotification:", self, v8);
    }

  }
}

- (void)_onFingerprintManagerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTFingerprintManagerNotificationMonitorFingerprints, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (void)onFingerprintManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__RTLearnedLocationEngine_onFingerprintManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__RTLearnedLocationEngine_onFingerprintManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onFingerprintManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_momentsdOnBoarding
{
  const __CFBoolean *v2;

  v2 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("MOSensedEventCombinedSwitchLocation"), CFSTR("com.apple.momentsd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v2)
    LOBYTE(v2) = CFBooleanGetValue(v2) != 0;
  return (char)v2;
}

- (BOOL)_enableTrainOnBatteryForTripSegments
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsTripSegmentGenerationEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;
  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsTripSegmentEnableTrainOnBattery"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 0;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109376;
    v11[1] = v5;
    v12 = 1024;
    v13 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "LearnedLocationEngine:_enableTrainOnBatteryForTripSegments, tripSegmentGenerationIsEnabled, %d, tripSegmentEnableTrainOnBattery, %d.", (uint8_t *)v11, 0xEu);
  }

  return v5 & v8;
}

- (void)_onVisitManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  dispatch_semaphore_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  NSObject *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  _BOOL4 v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  id v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  int v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[4];
  NSObject *v85;
  uint64_t *v86;
  _BYTE *v87;
  uint64_t v88;
  id *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t v94[16];
  _BYTE buf[24];
  uint64_t (*v96)(uint64_t, uint64_t);
  _BYTE v97[20];
  __int16 v98;
  const __CFString *v99;
  _QWORD v100[4];

  v100[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visitIncident");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, lowConfidenceVisit, %@", buf, 0x16u);

    }
    objc_msgSend(v9, "visitIncident");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationEngine _updateMonitorFingerprintsWithVisit:](self, "_updateMonitorFingerprintsWithVisit:", v13);

  }
  else
  {
    objc_msgSend(v5, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      v17 = v5;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "visitIncident");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, leechedVisit, %@", buf, 0x16u);

      }
      objc_msgSend(v17, "visitIncident");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine _updateMonitorFingerprintsWithVisit:](self, "_updateMonitorFingerprintsWithVisit:", v21);

      -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("DisableXPCActivityForTrainOnBattery"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("DisableXPCActivityForTrainOnBattery"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "BOOLValue");

        v27 = v26 ^ 1;
      }
      else
      {
        v27 = 1;
      }

      v53 = -[RTLearnedLocationEngine _momentsdOnBoarding](self, "_momentsdOnBoarding");
      v54 = -[RTLearnedLocationEngine _enableTrainOnBatteryForTripSegments](self, "_enableTrainOnBatteryForTripSegments");
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
          v68 = CFSTR("YES");
        else
          v68 = CFSTR("NO");
        if (v54)
          v69 = CFSTR("YES");
        else
          v69 = CFSTR("NO");
        v79 = (uint64_t (*)(uint64_t, uint64_t))v69;
        v80 = v68;
        if (v27)
          v70 = CFSTR("NO");
        else
          v70 = CFSTR("YES");
        v78 = v70;
        -[RTLearnedLocationEngine platform](self, "platform");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v83, "iPhoneDevice");
        v72 = CFSTR("NO");
        if (v71)
          v72 = CFSTR("YES");
        objc_msgSend(v17, "visitIncident", v72);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "exit");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = CFSTR("NO");
        if (v73)
          v74 = CFSTR("YES");
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v80;
        *(_WORD *)&buf[22] = 2112;
        v96 = v79;
        *(_WORD *)v97 = 2112;
        *(_QWORD *)&v97[2] = v78;
        *(_WORD *)&v97[10] = 2112;
        *(_QWORD *)&v97[12] = v77;
        v98 = 2112;
        v99 = v74;
        _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "%@, momentsdOnBoarding, %@, enableForTripSegments, %@, disableXPCActivityForTrainOnBattery, %@, iPhoneDevice, %@, exit, %@", buf, 0x3Eu);

      }
      if (v27)
      {
        if (v53)
        {
          -[RTLearnedLocationEngine platform](self, "platform");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v56, "iPhoneDevice") & 1) != 0)
          {
            objc_msgSend(v17, "visitIncident");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "exit");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58 == 0;

            if (!v59)
              -[RTLearnedLocationEngine setRegisterTrainOnBattery:](self, "setRegisterTrainOnBattery:", 1);
          }
          else
          {

          }
        }
        if (v54)
        {
          -[RTLearnedLocationEngine platform](self, "platform");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v64, "iPhoneDevice") & 1) != 0)
          {
            objc_msgSend(v17, "visitIncident");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "entry");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66 == 0;

            if (!v67)
              -[RTLearnedLocationEngine setRegisterTrainOnBattery:](self, "setRegisterTrainOnBattery:", 1);
          }
          else
          {

          }
        }
      }

    }
    else
    {
      objc_msgSend(v5, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerAvailableNotification, "notificationName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if (v30)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v96 = __Block_byref_object_copy__36;
        *(_QWORD *)v97 = __Block_byref_object_dispose__36;
        *(_QWORD *)&v97[8] = 0;
        v88 = 0;
        v89 = (id *)&v88;
        v90 = 0x3032000000;
        v91 = __Block_byref_object_copy__36;
        v92 = __Block_byref_object_dispose__36;
        v93 = 0;
        v31 = dispatch_semaphore_create(0);
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __55__RTLearnedLocationEngine__onVisitManagerNotification___block_invoke;
        v84[3] = &unk_1E9298640;
        v86 = &v88;
        v87 = buf;
        v32 = v31;
        v85 = v32;
        -[RTLearnedLocationEngine _fetchLatestVisitWithHandler:](self, "_fetchLatestVisitWithHandler:", v84);
        v33 = v32;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v33, v35))
          goto LABEL_26;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceDate:", v34);
        v38 = v37;
        v39 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v94 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
        }

        v45 = (void *)MEMORY[0x1E0CB35C8];
        v100[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v94 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v100, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = objc_retainAutorelease(v47);

          v49 = 0;
        }
        else
        {
LABEL_26:
          v48 = 0;
          v49 = 1;
        }

        v60 = v48;
        if ((v49 & 1) == 0)
          objc_storeStrong(v89 + 5, v48);
        v61 = v89[5];
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v62;
        if (v61)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v75 = v89[5];
            *(_DWORD *)v94 = 138412290;
            *(_QWORD *)&v94[4] = v75;
            _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "When trying to fetch the last visit at start-up, got error %@", v94, 0xCu);
          }

        }
        else
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            v76 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v94 = 138412290;
            *(_QWORD *)&v94[4] = v76;
            _os_log_debug_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_DEBUG, "Start up LLE with last visit %@", v94, 0xCu);
          }

          -[RTLearnedLocationEngine _updateMonitorFingerprintsWithVisit:](self, "_updateMonitorFingerprintsWithVisit:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        }

        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v51;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v52;
          _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);

        }
      }
    }
  }

}

void __55__RTLearnedLocationEngine__onVisitManagerNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateMonitorFingerprintsWithVisit:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  RTLearnedLocationEngine *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "type") != 1 && objc_msgSend(v5, "type") != 2)
  {
    v13 = self;
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "placeInference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v20 = 0;
    v21 = 0;
    -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeInference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v8, "placeTypeForMapItem:placeType:placeTypeSource:error:", v10, &v21, &v20, &v19);
    v12 = v19;

    if ((v11 & 1) != 0)
    {
      if (!v21)
      {

        goto LABEL_7;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "placeInference");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mapItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v16;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, failed to fetch placeType for mapItem, %@, error, %@", buf, 0x20u);

      }
    }
    -[RTLearnedLocationEngine setMonitorFingerprints:](self, "setMonitorFingerprints:", 0);

    goto LABEL_14;
  }
LABEL_7:
  v13 = self;
  v14 = 1;
LABEL_9:
  -[RTLearnedLocationEngine setMonitorFingerprints:](v13, "setMonitorFingerprints:", v14);
LABEL_14:

}

- (void)onVisitManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTLearnedLocationEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RTLearnedLocationEngine_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__RTLearnedLocationEngine_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerNotification:", *(_QWORD *)(a1 + 40));
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  int64_t v17;
  SEL v18;

  v9 = a4;
  v10 = a5;
  -[RTLearnedLocationEngine queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E92971C8;
  v16 = v10;
  v17 = a3;
  block[4] = self;
  v15 = v9;
  v18 = a2;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "willBeginTraining");
  v2 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2;
  v32[3] = &unk_1E9299358;
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = *(id *)(a1 + 48);
  v3 = MEMORY[0x1D8232094](v32);
  v4 = (void (**)(_QWORD, _QWORD))v3;
  v5 = *(_QWORD *)(a1 + 56);
  switch(v5)
  {
    case 0:
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v28 = 0;
      objc_msgSend(v9, "_purgeWithReferenceDate:error:", v10, &v28);
      v8 = v28;
      ((void (**)(_QWORD, id))v4)[2](v4, v8);
      goto LABEL_13;
    case 3:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", CFSTR("RefreshMapItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "BOOLValue"))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v14, v15);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v16, "UTF8String");
        v17 = (void *)os_transaction_create();

        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v24;
          v36 = 2112;
          v37 = v25;
          _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

        }
        v19 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 104);
        v26[0] = v2;
        v26[1] = 3221225472;
        v26[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_487;
        v26[3] = &unk_1E929B2F8;
        v26[4] = v20;
        v27 = v19;
        v22 = v19;
        objc_msgSend(v21, "refreshMapItemsWithEnumerationBlock:", v26);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      ((void (**)(_QWORD, id))v4)[2](v4, v8);

      goto LABEL_13;
    case 1:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v2;
      v29[1] = 3221225472;
      v29[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_3;
      v29[3] = &unk_1E929B2D0;
      v29[4] = *(_QWORD *)(a1 + 32);
      v30 = v6;
      v31 = v4;
      v8 = v6;
      objc_msgSend(v7, "clearWithHandler:", v29);

LABEL_13:
      goto LABEL_14;
  }
  (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
LABEL_14:

}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "didFinishTraining");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_4;
  v8[3] = &unk_1E9297EB8;
  v9 = v3;
  v5 = a1[5];
  v6 = a1[4];
  v10 = v5;
  v11 = v6;
  v12 = a1[6];
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v7 = 138412546;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "cleared learned locations, error, %@, latency, %.2f", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "didClear");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_487(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *);
  void *v36;
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[2];
  uint64_t v53;
  uint8_t buf[16];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36;
  v50 = __Block_byref_object_dispose__36;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__36;
  v44 = __Block_byref_object_dispose__36;
  v45 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = objc_alloc(MEMORY[0x1E0D183F8]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v7);

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v3, "geoMapItemHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2_488;
  v36 = &unk_1E9298D98;
  v38 = &v46;
  v39 = &v40;
  v11 = v4;
  v37 = v11;
  objc_msgSend(v9, "fetchMapItemFromHandle:options:handler:", v10, v8, &v33);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v33, v34, v35, v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v53 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v53, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_6:
    v27 = 0;
  }

  v28 = v27;
  v29 = v41[5];
  if (v29 && !v47[5])
  {
    v52[0] = CFSTR("source");
    v52[1] = CFSTR("extendedAttributes");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mergeWithMapItem:preservingProperties:", v29, v31);
    v30 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = v3;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v30;
}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2_488(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupTrainingMetricsFromDate:(id)a3 toDate:(id)a4 mode:(unint64_t)a5 reason:(unint64_t)a6
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  dispatch_semaphore_t v14;
  RTLocationStoreMetricOptions *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  dispatch_time_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  RTLocationStoreMetricOptions *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[16];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v46 = a4;
  v8 = (void *)objc_opt_new();
  -[RTLearnedLocationEngine setTrainingMetrics:](self, "setTrainingMetrics:", v8);

  -[RTLearnedLocationEngine defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("LearnedLocationEngineTrainVisitsLastAttemptDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;
  }
  else
  {
    v12 = INFINITY;
  }
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIntervalSinceLastAttempt:", v12);

  if (v10)
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x2020000000;
  v54 = 0x7FF0000000000000;
  v14 = dispatch_semaphore_create(0);
  v15 = [RTLocationStoreMetricOptions alloc];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v45, v46);
  v44 = -[RTLocationStoreMetricOptions initWithDateInterval:uncertaintyThreshold:](v15, "initWithDateInterval:uncertaintyThreshold:", v16, 1.79769313e308);

  -[RTLearnedLocationEngine locationStore](self, "locationStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __76__RTLearnedLocationEngine__setupTrainingMetricsFromDate_toDate_mode_reason___block_invoke;
  v47[3] = &unk_1E929B320;
  v49 = &v55;
  v50 = &v51;
  v18 = v14;
  v48 = v18;
  objc_msgSend(v17, "fetchMetricsWithOptions:handler:", v44, v47);

  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v19, v21))
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v20);
  v24 = v23;
  v25 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "filteredArrayUsingPredicate:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "submitToCoreAnalytics:type:duration:", v29, 1, v24);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v31 = (void *)MEMORY[0x1E0CB35C8];
  v59 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v59, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_retainAutorelease(v33);

  }
  else
  {
LABEL_11:
    v34 = 0;
  }

  v35 = v34;
  v36 = v56[3];
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLocationsProcessed:", v36);

  v38 = v52[3];
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMaxIntervalBetweenLocations:", v38);

  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setMode:", a5);

  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setReason:", a6);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

intptr_t __76__RTLearnedLocationEngine__setupTrainingMetricsFromDate_toDate_mode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");
  objc_msgSend(v3, "maxIntervalBetweenLocations");
  v5 = v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_teardownTrainingMetrics
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  NSObject *v29;
  uint8_t buf[16];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke;
  v28[3] = &unk_1E929B348;
  v28[4] = self;
  v6 = v3;
  v29 = v6;
  objc_msgSend(v4, "fetchMetricsWithHandler:", v28);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v8);
    v12 = v11;
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18598];
    v31[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = MEMORY[0x1E0C809B0];
    if (v22)

  }
  -[RTLearnedLocationEngine trainingMetrics](self, "trainingMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationEngine setTrainingMetrics:](self, "setTrainingMetrics:", 0);
  if (v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "submitting metrics, %@", buf, 0xCu);
    }

    -[RTLearnedLocationEngine metricManager](self, "metricManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_498;
    v26[3] = &unk_1E9297D58;
    v26[4] = self;
    v27 = v23;
    objc_msgSend(v25, "fetchDiagnosticsEnabled:", v26);

  }
}

intptr_t __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "visitCountDevice");
  objc_msgSend(*(id *)(a1 + 32), "trainingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisitCountDevice:", v4);

  v6 = objc_msgSend(v3, "visitCountTotal");
  objc_msgSend(*(id *)(a1 + 32), "trainingMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisitCountTotal:", v6);

  v8 = objc_msgSend(v3, "placeCountDevice");
  objc_msgSend(*(id *)(a1 + 32), "trainingMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceCountDevice:", v8);

  v10 = objc_msgSend(v3, "placeCountTotal");
  objc_msgSend(*(id *)(a1 + 32), "trainingMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceCountTotal:", v10);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_498(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_2;
  block[3] = &unk_1E9297D30;
  v10 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDD138]), "initWithLearnedLocationEngineMetrics:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "metricManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_3;
    v7[3] = &unk_1E9297150;
    v8 = v2;
    v4 = v2;
    objc_msgSend(v3, "submitMetric:withHandler:", v4, v7);

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Submitting Learned Location Engine Training CoreAnalytics Metrics", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "submitToCoreAnalytics");
  }
}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "submitted metrics, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_logCloudStoreWithReason:(id)a3
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  SEL v27;
  uint64_t v28;
  uint8_t buf[8];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__RTLearnedLocationEngine__logCloudStoreWithReason___block_invoke;
  v25[3] = &unk_1E9297628;
  v27 = a2;
  v8 = v6;
  v26 = v8;
  objc_msgSend(v7, "logCloudStoreWithReason:handler:", v5, v25);

  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D18598];
    v28 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
  }

}

void __52__RTLearnedLocationEngine__logCloudStoreWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to log cloud stores, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_logLocalStoreWithReason:(id)a3
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  SEL v27;
  uint64_t v28;
  uint8_t buf[8];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__RTLearnedLocationEngine__logLocalStoreWithReason___block_invoke;
  v25[3] = &unk_1E9297628;
  v27 = a2;
  v8 = v6;
  v26 = v8;
  objc_msgSend(v7, "logLocalStoreWithReason:handler:", v5, v25);

  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D18598];
    v28 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
  }

}

void __52__RTLearnedLocationEngine__logLocalStoreWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed to log local stores, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_logDatabasesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start logging databases with reason, %@", (uint8_t *)&v7, 0xCu);
  }

  -[RTLearnedLocationEngine _logCloudStoreWithReason:](self, "_logCloudStoreWithReason:", 0);
  -[RTLearnedLocationEngine _logLocalStoreWithReason:](self, "_logLocalStoreWithReason:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "end logging databases with reason, %@", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)_retrainVisitsWithoutPlaces:(id *)a3
{
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  dispatch_semaphore_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  RTLearnedLocationEngine *v50;
  _QWORD v52[4];
  id v53;
  NSObject *v54;
  uint8_t *v55;
  SEL v56;
  _QWORD v57[4];
  id v58;
  NSObject *v59;
  uint64_t *v60;
  SEL v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[8];
  uint8_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint8_t v75[16];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__36;
  v66 = __Block_byref_object_dispose__36;
  v67 = 0;
  v6 = dispatch_semaphore_create(0);
  v50 = self;
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke;
  v57[3] = &unk_1E929B370;
  v61 = a2;
  v8 = v5;
  v58 = v8;
  v60 = &v62;
  v9 = v6;
  v59 = v9;
  objc_msgSend(v7, "fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:limit:", v57, 0);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v75 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v75, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

  }
  else
  {
LABEL_6:
    v25 = 0;
  }

  v26 = v25;
  v27 = (void *)v63[5];
  if (v27)
  {
    v28 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v27);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v69 = buf;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__36;
    v72 = __Block_byref_object_dispose__36;
    v73 = 0;

    v29 = dispatch_semaphore_create(0);
    -[RTLearnedLocationEngine learnedLocationStore](v50, "learnedLocationStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke_500;
    v52[3] = &unk_1E929B370;
    v56 = a2;
    v31 = v8;
    v53 = v31;
    v55 = buf;
    v32 = v29;
    v54 = v32;
    objc_msgSend(v30, "fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:", v52);

    v10 = v32;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v34))
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSinceDate:", v33);
    v37 = v36;
    v38 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "filteredArrayUsingPredicate:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "submitToCoreAnalytics:type:duration:", v42, 1, v37);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v75, 2u);
    }

    v44 = (void *)MEMORY[0x1E0CB35C8];
    v74 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v75 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = objc_retainAutorelease(v46);

    }
    else
    {
LABEL_16:
      v47 = 0;
    }

    v26 = v47;
    v48 = (void *)*((_QWORD *)v69 + 5);
    v28 = v48 == 0;
    if (v48)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v48);
    }
    else
    {
      -[RTLearnedLocationEngine _updateUnlabeledVisitsWithPlaceInformation:](v50, "_updateUnlabeledVisitsWithPlaceInformation:", v31);
    }

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v62, 8);
  return v28;
}

void __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2048;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %lu visits without places", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke_500(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2048;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %lu visits with incomplete places", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_removeUnusedMapItems:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint8_t buf[8];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__36;
  v32 = __Block_byref_object_dispose__36;
  v33 = 0;
  v5 = dispatch_semaphore_create(0);
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__RTLearnedLocationEngine__removeUnusedMapItems___block_invoke;
  v25[3] = &unk_1E9297038;
  v27 = &v28;
  v7 = v5;
  v26 = v7;
  objc_msgSend(v6, "removeUnreferencedMapItems:", v25);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v9);
    v13 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
  }

  v23 = (void *)v29[5];
  if (a3 && v23)
    *a3 = objc_retainAutorelease(v23);

  _Block_object_dispose(&v28, 8);
  return v23 == 0;
}

void __49__RTLearnedLocationEngine__removeUnusedMapItems___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_appendVisitsToLocationsOfInterestModelWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  dispatch_time_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  char v55;
  id v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v65;
  RTLearnedLocationEngine *v68;
  _QWORD v69[4];
  NSObject *v70;
  uint64_t *v71;
  uint64_t *v72;
  _QWORD v73[4];
  NSObject *v74;
  RTLearnedLocationEngine *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  id *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _BYTE buf[12];
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _QWORD v112[4];

  v112[1] = *MEMORY[0x1E0C80C00];
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__36;
  v95 = __Block_byref_object_dispose__36;
  v96 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__36;
  v89 = __Block_byref_object_dispose__36;
  v90 = 0;
  v79 = 0;
  v80 = (id *)&v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__36;
  v83 = __Block_byref_object_dispose__36;
  v84 = 0;
  v4 = dispatch_semaphore_create(0);
  v68 = self;
  -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke;
  v73[3] = &unk_1E929B398;
  v76 = &v91;
  v77 = &v79;
  v6 = v4;
  v74 = v6;
  v75 = v68;
  v78 = &v85;
  objc_msgSend(v5, "fetchLocationOfInterestVisitedLastWithHandler:", v73);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v106 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v106, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

    v23 = 0;
  }
  else
  {
LABEL_6:
    v22 = 0;
    v23 = 1;
  }

  v24 = v22;
  if ((v23 & 1) == 0)
    objc_storeStrong(v80 + 5, v22);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v92[5];
    v28 = (void *)v86[5];
    v29 = v80[5];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v26;
    v98 = 2112;
    v99 = v27;
    v100 = 2112;
    v101 = v28;
    v102 = 2112;
    v103 = v29;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, LOI graph, last visit, %@, last transition, %@, error, %@", buf, 0x2Au);

  }
  v30 = v80[5];
  if (v30)
  {
    v31 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v30);
  }
  else
  {
    v32 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend((id)v92[5], "exitDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:", v34, v35);

    if (!v33)
    v36 = dispatch_semaphore_create(0);

    v106 = 0;
    v107 = &v106;
    v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__36;
    v110 = __Block_byref_object_dispose__36;
    v111 = 0;
    -[RTLearnedLocationEngine learnedLocationStore](v68, "learnedLocationStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationStore predicateForObjectsFromCurrentDevice](v68->_learnedLocationStore, "predicateForObjectsFromCurrentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_502;
    v69[3] = &unk_1E9296EE0;
    v71 = &v79;
    v72 = &v106;
    v39 = v36;
    v70 = v39;
    objc_msgSend(v37, "fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:", v38, 1, v65, 0, v69);

    v7 = v39;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v7, v41))
      goto LABEL_24;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSinceDate:", v40);
    v44 = v43;
    v45 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_895);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "filteredArrayUsingPredicate:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "submitToCoreAnalytics:type:duration:", v49, 1, v44);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v51 = (void *)MEMORY[0x1E0CB35C8];
    v112[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v112, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v54 = objc_retainAutorelease(v53);

      v55 = 0;
    }
    else
    {
LABEL_24:
      v55 = 1;
      v54 = v24;
    }

    v56 = v54;
    if ((v55 & 1) == 0)
      objc_storeStrong(v80 + 5, v54);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend((id)v107[5], "count");
      objc_msgSend((id)v107[5], "firstObject");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v107[5], "lastObject");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v80[5];
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v58;
      v98 = 2048;
      v99 = v59;
      v100 = 2112;
      v101 = v60;
      v102 = 2112;
      v103 = v61;
      v104 = 2112;
      v105 = v62;
      _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%@, new visit count, %lu, first visit, %@, last visit, %@, error, %@", buf, 0x34u);

    }
    v63 = v80[5];
    if (v63)
    {
      v31 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v63);
    }
    else if (objc_msgSend((id)v107[5], "count"))
    {
      v31 = -[RTLearnedLocationEngine _appendVisits:lastVisit:lastTransition:outError:](v68, "_appendVisits:lastVisit:lastTransition:outError:", v107[5], v92[5], v86[5], a3);
    }
    else
    {
      v31 = 1;
    }

    _Block_object_dispose(&v106, 8);
    v24 = v56;
  }

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(&v91, 8);
  return v31;
}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;

  v6 = a3;
  objc_msgSend(a2, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_2;
    v13[3] = &unk_1E929AF90;
    v15 = *(_OWORD *)(a1 + 56);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v11, "fetchTransitionWithOriginIdentifier:handler:", v12, v13);

    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_6:

}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_502(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  v9 = a3;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_appendVisits:(id)a3 lastVisit:(id)a4 lastTransition:(id)a5 outError:(id *)a6
{
  id v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *aSelector;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  _QWORD v49[4];
  NSObject *v50;
  uint64_t *v51;
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  id v55;
  RTLearnedLocationEngine *v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  NSObject *v66;
  uint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v45 = a4;
  v44 = a5;
  if (objc_msgSend(v10, "count"))
  {
    aSelector = a2;
    v43 = (void *)objc_opt_new();
    v40 = (void *)objc_opt_new();
    v39 = (void *)objc_opt_new();
    v42 = (void *)objc_opt_new();
    v41 = (void *)objc_opt_new();
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__36;
    v73 = __Block_byref_object_dispose__36;
    v74 = 0;
    v11 = dispatch_group_create();
    v12 = 0;
    v13 = MEMORY[0x1E0C809B0];
    while (v12 < objc_msgSend(v10, "count", aSelector))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v11);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v13;
      v61[1] = 3221225472;
      v61[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke;
      v61[3] = &unk_1E929B3C0;
      v67 = &v69;
      v68 = v12;
      v62 = v45;
      v63 = v44;
      v17 = v14;
      v64 = v17;
      v65 = v43;
      v18 = v11;
      v66 = v18;
      objc_msgSend(v15, "fetchTransitionWithDestinationIdentifier:handler:", v16, v61);

      dispatch_group_enter(v18);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v13;
      v52[1] = 3221225472;
      v52[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_2;
      v52[3] = &unk_1E929B410;
      v60 = &v69;
      v53 = v18;
      v54 = v40;
      v20 = v17;
      v55 = v20;
      v56 = self;
      v57 = v39;
      v58 = v42;
      v59 = v41;
      objc_msgSend(v19, "fetchPlaceOfVisit:handler:", v20, v52);

      ++v12;
    }
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v21 = (void *)v70[5];
    if (v21)
    {
      v22 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v21);
    }
    else
    {
      -[RTLearnedLocationEngine _updateLocationOfInterestsWithVisits:visitToTransitionMapping:visitToLocationOfInterestMapping:](self, "_updateLocationOfInterestsWithVisits:visitToTransitionMapping:visitToLocationOfInterestMapping:", v42, v43, v39);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationEngine _createLocationOfInterestsWithVisits:visitToTransitionMapping:visitToPlaceMapping:](self, "_createLocationOfInterestsWithVisits:visitToTransitionMapping:visitToPlaceMapping:", v41, v43, v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = dispatch_group_create();
      dispatch_group_enter(v25);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v13;
      v49[1] = 3221225472;
      v49[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_4;
      v49[3] = &unk_1E9297038;
      v51 = &v69;
      v27 = v25;
      v50 = v27;
      objc_msgSend(v26, "updateLocationsOfInterest:handler:", v23, v49);

      dispatch_group_enter(v27);
      -[RTLearnedLocationEngine learnedLocationStore](self, "learnedLocationStore");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v13;
      v46[1] = 3221225472;
      v46[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_5;
      v46[3] = &unk_1E9297038;
      v48 = &v69;
      v29 = v27;
      v47 = v29;
      objc_msgSend(v28, "storeLocationsOfInterest:handler:", v24, v46);

      dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(aSelector);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v23, "count");
        v33 = objc_msgSend(v24, "count");
        v34 = v70[5];
        *(_DWORD *)buf = 138413058;
        v76 = v31;
        v77 = 2048;
        v78 = v32;
        v79 = 2048;
        v80 = v33;
        v81 = 2112;
        v82 = v34;
        _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, updated locationOfInterest count, %lu, new locationOfInterest count, %lu, error, %@", buf, 0x2Au);

      }
      v35 = (void *)v70[5];
      v22 = v35 == 0;
      if (a6 && v35)
        *a6 = objc_retainAutorelease(v35);

    }
    _Block_object_dispose(&v69, 8);

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  RTLearnedTransition *v20;
  id v21;
  id v22;

  v21 = a2;
  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  if (*(_QWORD *)(a1 + 80) || !*(_QWORD *)(a1 + 32))
  {
    v6 = v21;
  }
  else
  {
    if (v21)
      v7 = objc_msgSend(v21, "predominantMotionActivityType");
    else
      v7 = 0;
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v9 = objc_msgSend(v8, "predominantMotionActivityType");
      if (v9 != objc_msgSend(v21, "predominantMotionActivityType"))
        v7 = 0;
    }
    v20 = [RTLearnedTransition alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "exitDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v20, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v10, v11, v12, v13, v14, v15, v16, v7);

    v6 = (id)v17;
  }
  v22 = v6;
  if (v6)
  {
    v18 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v22, v19);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v5, v9);

      objc_msgSend(*(id *)(a1 + 56), "learnedLocationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mapItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_3;
      v12[3] = &unk_1E929B3E8;
      v18 = *(_QWORD *)(a1 + 88);
      v13 = *(id *)(a1 + 64);
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 72);
      v16 = *(id *)(a1 + 80);
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v10, "fetchLocationOfInterestWithMapItem:handler:", v11, v12);

      goto LABEL_6;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_6:

}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  v6 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, v8);

    v9 = (id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v9 = (id *)(a1 + 56);
  }
  objc_msgSend(*v9, "addObject:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)_updateLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToLocationOfInterestMapping:(id)a5
{
  id v7;
  __int128 v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RTLearnedLocationOfInterest *v21;
  void *v22;
  void *v23;
  void *v24;
  RTLearnedLocationOfInterest *v25;
  NSObject *v26;
  void *v27;
  __int128 v29;
  id v31;
  id obj;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  RTLearnedLocationOfInterest *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  v34 = a5;
  v31 = (id)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v36)
  {
    v33 = *(_QWORD *)v38;
    *(_QWORD *)&v8 = 138412802;
    v29 = v8;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v15 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v12, "visits");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "arrayWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v10);
          v18 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v12, "transitions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v20, "addObject:", v14);
          v21 = [RTLearnedLocationOfInterest alloc];
          objc_msgSend(v12, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "location");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "place");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v21, "initWithIdentifier:location:place:visits:transitions:", v22, v23, v24, v17, v20);

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v42 = v27;
            v43 = 2112;
            v44 = v12;
            v45 = 2112;
            v46 = v25;
            _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, LOI, %@, updated LOI, %@", buf, 0x20u);

          }
          if (v25)
            objc_msgSend(v31, "addObject:", v25);

        }
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v36);
  }

  return v31;
}

- (id)_createLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToPlaceMapping:(id)a5
{
  id v7;
  id v8;
  __int128 v9;
  uint64_t i;
  RTLearnedLocationOfInterest *v11;
  void *v12;
  void *v13;
  void *v14;
  RTLearnedLocationOfInterest *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTLearnedLocation *v23;
  void *v24;
  RTLearnedLocationOfInterest *v25;
  void *v26;
  void *v27;
  RTLearnedLocationOfInterest *v28;
  void *v29;
  RTLearnedLocationOfInterest *v30;
  RTLearnedLocationOfInterest *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  RTLearnedLocation *v54;
  void *v55;
  void *v56;
  RTLearnedLocationOfInterest *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  RTLearnedLocationOfInterest *v93;
  __int16 v94;
  RTLearnedLocationOfInterest *v95;
  __int16 v96;
  RTLearnedLocationOfInterest *v97;
  void *v98;
  RTLearnedLocationOfInterest *v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v81 = a5;
  v82 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v7;
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
  if (v83)
  {
    v80 = *(_QWORD *)v87;
    *(_QWORD *)&v9 = 138412802;
    v67 = v9;
    v79 = v8;
    do
    {
      for (i = 0; i != v83; ++i)
      {
        if (*(_QWORD *)v87 != v80)
          objc_enumerationMutation(obj);
        v11 = *(RTLearnedLocationOfInterest **)(*((_QWORD *)&v86 + 1) + 8 * i);
        -[RTLearnedLocationOfInterest identifier](v11, "identifier", v67);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectForKey:", v14);
          v15 = (RTLearnedLocationOfInterest *)objc_claimAutoreleasedReturnValue();

          -[RTLearnedLocationOfInterest identifier](v11, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v18 = (void *)MEMORY[0x1E0C99DE8];
            -[RTLearnedLocationOfInterest visits](v15, "visits");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "arrayWithArray:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v84 = v20;
            objc_msgSend(v20, "addObject:", v11);
            v21 = (void *)MEMORY[0x1E0C99DE8];
            -[RTLearnedLocationOfInterest transitions](v15, "transitions");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "arrayWithArray:", v22);
            v23 = (RTLearnedLocation *)objc_claimAutoreleasedReturnValue();

            if (v17)
              -[RTLearnedLocation addObject:](v23, "addObject:", v17);
            v24 = (void *)v17;
            v25 = [RTLearnedLocationOfInterest alloc];
            -[RTLearnedLocationOfInterest identifier](v15, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLearnedLocationOfInterest location](v15, "location");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLearnedLocationOfInterest place](v15, "place");
            v28 = v15;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v25, "initWithIdentifier:location:place:visits:transitions:", v26, v27, v29, v84, v23);

            v31 = v28;
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v91 = v33;
              v92 = 2112;
              v93 = v28;
              v94 = 2112;
              v95 = v30;
              v96 = 2112;
              v97 = v11;
              _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, LOI, %@, updated LOI, %@, visit, %@", buf, 0x2Au);

            }
            v34 = v24;
            if (v30)
            {
              objc_msgSend(v13, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setObject:forKey:", v30, v35);
              v8 = v79;
              goto LABEL_22;
            }
            v8 = v79;
          }
          else
          {
            v73 = objc_alloc(MEMORY[0x1E0D183B0]);
            -[RTLearnedLocationOfInterest location](v11, "location");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "location");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "latitude");
            v37 = v36;
            -[RTLearnedLocationOfInterest location](v11, "location");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "location");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "longitude");
            v39 = v38;
            -[RTLearnedLocationOfInterest location](v11, "location");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "location");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "horizontalUncertainty");
            v41 = v40;
            -[RTLearnedLocationOfInterest location](v11, "location");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "location");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "altitude");
            v43 = v42;
            -[RTLearnedLocationOfInterest location](v11, "location");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "location");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "verticalUncertainty");
            v46 = v45;
            -[RTLearnedLocationOfInterest location](v11, "location");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "location");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "referenceFrame");
            -[RTLearnedLocationOfInterest location](v11, "location");
            v50 = (void *)v17;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "location");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v73, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v49, objc_msgSend(v52, "sourceAccuracy"), v37, v39, v41, v43, v46, 0.0);

            v34 = v50;
            v54 = [RTLearnedLocation alloc];
            -[RTLearnedLocationOfInterest location](v11, "location");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "location");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (void *)v53;
            v23 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v54, "initWithLocation:dataPointCount:type:", v53, objc_msgSend(v56, "sourceAccuracy") == 2, 2);

            v57 = [RTLearnedLocationOfInterest alloc];
            objc_msgSend(v13, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v98 = v34;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v57, "initWithIdentifier:location:place:visits:transitions:", v58, v23, v13, v59, v60);

            }
            else
            {
              v30 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v57, "initWithIdentifier:location:place:visits:transitions:", v58, v23, v13, v59, 0);
            }

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v61 = objc_claimAutoreleasedReturnValue();
            v8 = v79;
            v31 = 0;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v67;
              v91 = v62;
              v92 = 2112;
              v93 = v30;
              v94 = 2112;
              v95 = v11;
              _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "%@, create new LOI, %@, visit, %@", buf, 0x20u);

            }
            if (v30)
            {
              objc_msgSend(v13, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setObject:forKey:", v30, v35);
LABEL_22:

            }
          }

        }
      }
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    }
    while (v83);
  }

  v63 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v82, "allValues");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "arrayWithArray:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

- (void)performTransitAnalyticsWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTLearnedLocationEngine transitMetricManager](self, "transitMetricManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTLearnedLocationEngine transitMetricManager](self, "transitMetricManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performTransitAnalyticsWithHandler:", v6);

  }
}

+ (id)computeVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = a9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E9327290, CFSTR("visitLabelingAttempt"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("visitLabelingRetried"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 == 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("visitLabelingSucceeded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("visitLabelingSkipped"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("unlabeledVisit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("bluePOICalled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("revGeoCalled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("visitAge"));

  if (v15)
  {
    objc_msgSend(v15, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "code"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("errorCode"));

    objc_msgSend(v15, "userInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0D26588];
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D26588]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v15, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("errorHTTPStatus"));

    }
  }

  return v16;
}

+ (void)submitVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9
{
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  double v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;

  v16 = a9;
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke;
  v28[3] = &unk_1E929B438;
  v32 = a3;
  v33 = a4;
  v34 = a5;
  v35 = a6;
  v36 = a7;
  v31 = a8;
  v29 = v16;
  v30 = a1;
  v18 = v16;
  v19 = (void *)MEMORY[0x1D8232094](v28);
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke_2;
  v25[3] = &unk_1E929B460;
  v26 = (id)objc_msgSend(v20, "initWithCString:encoding:", RTAnalyticsEventVisitLabelingAttempt, 1);
  v27 = v19;
  v21 = v26;
  v22 = v19;
  v23 = (void *)MEMORY[0x1D8232094](v25);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

uint64_t __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "computeVisitLabelingMetricsForLabelingRetried:labelingSkipped:revGeoCalled:bluePOICalled:unlabeledVisit:visitAge:error:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58), *(unsigned __int8 *)(a1 + 59), *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

id __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

- (RTLearnedLocationEngineProtocol)delegate
{
  return (RTLearnedLocationEngineProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)registerTrainOnBattery
{
  return self->_registerTrainOnBattery;
}

- (BOOL)shouldRecoverKnownPlaceTypes
{
  return self->_shouldRecoverKnownPlaceTypes;
}

- (void)setShouldRecoverKnownPlaceTypes:(BOOL)a3
{
  self->_shouldRecoverKnownPlaceTypes = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDailyTrainingSessionCounter)dailyTrainingSessionCounter
{
  return self->_dailyTrainingSessionCounter;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTPointOfInterestMetricsManager)pointOfInterestMetricsManager
{
  return self->_pointOfInterestMetricsManager;
}

- (RTPersonalizationPortraitManager)portraitManager
{
  return self->_portraitManager;
}

- (RTLearnedLocationEngineTrainingMetrics)trainingMetrics
{
  return self->_trainingMetrics;
}

- (void)setTrainingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_trainingMetrics, a3);
}

- (RTLearnedLocationReconcilerPerVisit)reconcilerPerVisit
{
  return self->_reconcilerPerVisit;
}

- (RTLearnedLocationReconcilerPerDevice)reconcilerPerDevice
{
  return self->_reconcilerPerDevice;
}

- (RTSettledStateTransitionStore)settledStateTransitionStore
{
  return self->_settledStateTransitionStore;
}

- (RTTransitMetricManager)transitMetricManager
{
  return self->_transitMetricManager;
}

- (RTTripSegmentProvider)tripSegmentProvider
{
  return self->_tripSegmentProvider;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (BOOL)monitorFingerprints
{
  return self->_monitorFingerprints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentProvider, 0);
  objc_storeStrong((id *)&self->_transitMetricManager, 0);
  objc_storeStrong((id *)&self->_settledStateTransitionStore, 0);
  objc_storeStrong((id *)&self->_reconcilerPerDevice, 0);
  objc_storeStrong((id *)&self->_reconcilerPerVisit, 0);
  objc_storeStrong((id *)&self->_trainingMetrics, 0);
  objc_storeStrong((id *)&self->_portraitManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestMetricsManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dailyTrainingSessionCounter, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
